// ==UserScript==
// @name         Ocultar/Mostrar/Redimensionar NAV - FP Samuel Gómez
// @namespace    http://tampermonkey.net/
// @version      4.0
// @description  Botón animado para ocultar/mostrar y barra para cambiar el ancho del menú lateral
// @match        http://fp.samuelgomez.es/*
// @match        https://fp.samuelgomez.es/*
// @author       Diego Cortés Gallego
// @grant        none
// ==/UserScript==

(function () {
    'use strict';

    let nav = null;
    let boton = null;
    let resizer = null;
    let oculto = false;
    let isResizing = false;

    const CLAVE_ESTADO = 'fp_nav_oculto';
    const CLAVE_ANCHO = 'fp_nav_ancho';
    const ANCHO_DEFECTO = 520;
    const MIN_ANCHO = 180;
    const MAX_ANCHO = 800;

    let anchoNav = parseInt(localStorage.getItem(CLAVE_ANCHO), 10) || ANCHO_DEFECTO;
    let timerOcultar = null;

    const DURACION = '0.4s';
    const CURVA = 'cubic-bezier(0.4, 0, 0.2, 1)';

    // ─────────────────────────────────────────────
    // CREAR BOTÓN TOGGLE
    // ─────────────────────────────────────────────

    function crearBoton() {
        if (boton || !nav) return;

        boton = document.createElement('button');
        boton.id = 'tampermonkey-toggle-nav';
        boton.textContent = '‹';
        boton.setAttribute('aria-label', 'Ocultar índice');
        boton.setAttribute('title', 'Ocultar índice (Ctrl + B)');

        Object.assign(boton.style, {
            position: 'fixed',
            top: '50%',
            left: '0',
            transform: 'translateY(-50%)',
            zIndex: '99999',
            width: '32px',
            height: '64px',
            padding: '0',
            margin: '0',
            border: 'none',
            borderRadius: '0 8px 8px 0',
            background: 'rgba(40, 40, 40, 0.85)',
            color: '#fff',
            fontSize: '28px',
            fontFamily: 'Arial, sans-serif',
            fontWeight: 'bold',
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            transition: `left ${DURACION} ${CURVA}, width 0.2s ease, background 0.2s ease`,
            boxShadow: '0 2px 8px rgba(0, 0, 0, 0.25)'
        });

        boton.addEventListener('mouseenter', () => {
            boton.style.width = '38px';
            boton.style.background = 'rgba(40, 40, 40, 1)';
        });

        boton.addEventListener('mouseleave', () => {
            boton.style.width = '32px';
            boton.style.background = 'rgba(40, 40, 40, 0.85)';
        });

        boton.addEventListener('click', () => alternarNav());

        document.body.appendChild(boton);
        actualizarPosicionBoton();
    }

    // ─────────────────────────────────────────────
    // CREAR BARRA DE REDIMENSIONADO (RESIZER)
    // ─────────────────────────────────────────────

    function crearResizer() {
        if (resizer || !nav) return;

        resizer = document.createElement('div');
        resizer.id = 'tampermonkey-nav-resizer';
        resizer.setAttribute('title', 'Arrastra para cambiar el ancho (doble clic para restablecer)');

        Object.assign(resizer.style, {
            position: 'fixed',
            top: '0',
            bottom: '0',
            width: '6px',
            cursor: 'col-resize',
            zIndex: '99998',
            backgroundColor: 'transparent',
            transition: `left ${DURACION} ${CURVA}, background-color 0.2s ease`
        });

        // Efecto visual al pasar el ratón por encima
        resizer.addEventListener('mouseenter', () => {
            if (!oculto) resizer.style.backgroundColor = 'rgba(0, 122, 255, 0.5)';
        });

        resizer.addEventListener('mouseleave', () => {
            if (!isResizing) resizer.style.backgroundColor = 'transparent';
        });

        // Doble clic para reiniciar al ancho por defecto
        resizer.addEventListener('dblclick', () => {
            aplicarAncho(ANCHO_DEFECTO);
            localStorage.removeItem(CLAVE_ANCHO);
        });

        // Eventos de arrastre
        resizer.addEventListener('mousedown', iniciarArrastre);

        document.body.appendChild(resizer);
        actualizarPosicionResizer();
    }

    function iniciarArrastre(e) {
        if (e.button !== 0 || oculto) return; // Solo clic principal

        isResizing = true;
        resizer.style.backgroundColor = 'rgba(0, 122, 255, 0.8)';

        // Desactivar temporalmente transiciones para fluidez a 60 FPS
        nav.style.transition = 'none';
        boton.style.transition = 'none';
        resizer.style.transition = 'none';

        document.body.style.userSelect = 'none';
        document.body.style.cursor = 'col-resize';

        const onMouseMove = (ev) => {
            if (!isResizing) return;
            const limiteMax = Math.min(MAX_ANCHO, window.innerWidth * 0.7);
            const nuevoAncho = Math.min(Math.max(ev.clientX, MIN_ANCHO), limiteMax);
            aplicarAncho(nuevoAncho);
        };

        const onMouseUp = () => {
            if (!isResizing) return;
            isResizing = false;

            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);

            document.body.style.userSelect = '';
            document.body.style.cursor = '';
            resizer.style.backgroundColor = 'transparent';

            // Restaurar transiciones
            nav.style.transition = `margin-left ${DURACION} ${CURVA}, opacity ${DURACION} ease`;
            boton.style.transition = `left ${DURACION} ${CURVA}, width 0.2s ease, background 0.2s ease`;
            resizer.style.transition = `left ${DURACION} ${CURVA}, background-color 0.2s ease`;

            // Guardar tamaño preferido
            localStorage.setItem(CLAVE_ANCHO, anchoNav);
        };

        document.addEventListener('mousemove', onMouseMove);
        document.addEventListener('mouseup', onMouseUp);
    }

    // ─────────────────────────────────────────────
    // APLICAR ANCHO Y REUBICAR ELEMENTOS
    // ─────────────────────────────────────────────

    function aplicarAncho(ancho) {
        anchoNav = ancho;

        if (nav) {
            nav.style.width = `${anchoNav}px`;
            nav.style.minWidth = `${anchoNav}px`;
            nav.style.maxWidth = `${anchoNav}px`;
        }

        actualizarPosicionBoton();
        actualizarPosicionResizer();
    }

    function actualizarPosicionBoton() {
        if (!boton) return;
        boton.style.left = oculto ? '0' : `${Math.max(0, anchoNav - 16)}px`;
    }

    function actualizarPosicionResizer() {
        if (!resizer) return;
        if (oculto) {
            resizer.style.left = '-10px';
            resizer.style.display = 'none';
        } else {
            resizer.style.display = '';
            resizer.style.left = `${Math.max(0, anchoNav - 3)}px`;
        }
    }

    // ─────────────────────────────────────────────
    // OCULTAR / MOSTRAR NAV
    // ─────────────────────────────────────────────

    function alternarNav() {
        if (!nav) return;

        clearTimeout(timerOcultar);
        oculto = !oculto;

        if (oculto) {
            localStorage.setItem(CLAVE_ESTADO, 'true');

            // Deslizar nav hacia afuera
            nav.style.transition = `margin-left ${DURACION} ${CURVA}, opacity ${DURACION} ease`;
            nav.style.marginLeft = `-${anchoNav}px`;
            nav.style.opacity = '0';

            // Mover botón y resizer
            actualizarPosicionBoton();
            actualizarPosicionResizer();

            boton.textContent = '›';
            boton.setAttribute('aria-label', 'Mostrar índice');
            boton.setAttribute('title', 'Mostrar índice (Ctrl + B)');

            timerOcultar = setTimeout(() => {
                if (oculto && nav) {
                    nav.style.display = 'none';
                }
            }, 400);

        } else {
            localStorage.setItem(CLAVE_ESTADO, 'false');

            // Posición previa fuera de pantalla
            nav.style.transition = 'none';
            nav.style.display = '';
            nav.style.marginLeft = `-${anchoNav}px`;
            nav.style.opacity = '0';

            nav.offsetHeight; // Forzar reflow

            requestAnimationFrame(() => {
                nav.style.transition = `margin-left ${DURACION} ${CURVA}, opacity ${DURACION} ease`;
                nav.style.marginLeft = '0px';
                nav.style.opacity = '1';

                actualizarPosicionBoton();
                actualizarPosicionResizer();

                boton.textContent = '‹';
                boton.setAttribute('aria-label', 'Ocultar índice');
                boton.setAttribute('title', 'Ocultar índice (Ctrl + B)');
            });
        }
    }

    function ocultarInmediatamente() {
        oculto = true;
        nav.style.transition = 'none';
        nav.style.marginLeft = `-${anchoNav}px`;
        nav.style.opacity = '0';
        nav.style.display = 'none';

        if (boton) {
            boton.style.transition = 'none';
            boton.style.left = '0';
            boton.textContent = '›';
            boton.setAttribute('aria-label', 'Mostrar índice');
            boton.setAttribute('title', 'Mostrar índice (Ctrl + B)');

            requestAnimationFrame(() => {
                boton.style.transition = `left ${DURACION} ${CURVA}, width 0.2s ease, background 0.2s ease`;
            });
        }

        actualizarPosicionResizer();
    }

    // ─────────────────────────────────────────────
    // ATAJO DE TECLADO (CTRL + B)
    // ─────────────────────────────────────────────

    document.addEventListener('keydown', (evento) => {
        if (evento.ctrlKey && evento.key.toLowerCase() === 'b') {
            evento.preventDefault();
            alternarNav();
        }
    });

    // ─────────────────────────────────────────────
    // INICIALIZACIÓN Y DETECCIÓN
    // ─────────────────────────────────────────────

    function comprobarNav() {
        const nuevoNav = document.querySelector('nav');

        if (nuevoNav && !boton) {
            nav = nuevoNav;

            // Aplicar tamaño guardado o el detectado
            aplicarAncho(anchoNav);

            crearBoton();
            crearResizer();

            if (localStorage.getItem(CLAVE_ESTADO) === 'true') {
                ocultarInmediatamente();
            }
        }

        if (!nuevoNav && boton) {
            if (boton) boton.remove();
            if (resizer) resizer.remove();
            boton = null;
            resizer = null;
            nav = null;
            oculto = false;
        }
    }

    window.addEventListener('resize', () => {
        if (nav && !oculto) {
            actualizarPosicionBoton();
            actualizarPosicionResizer();
        }
    });

    comprobarNav();

    const observer = new MutationObserver(() => {
        comprobarNav();
    });

    observer.observe(document.body, {
        childList: true,
        subtree: true
    });

})();