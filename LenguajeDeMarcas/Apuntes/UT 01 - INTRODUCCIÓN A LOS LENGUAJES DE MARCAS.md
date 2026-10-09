---
tags:
  - lenguajes-de-marcas
  - xml
  - html
---
## 1. INTRODUCCIÓN A LOS LENGUAJES DE MARCAS

### 1.1. Concepto y Definición
* **Lenguaje de marcas:** Método para codificar un documento en el que, junto al texto plano, se intercalan etiquetas, marcas o anotaciones que aportan información adicional.
* **Propósito:** 
  * Hacer explícita la estructura del documento.
  * Definir su contenido semántico.
  * Indicar información lingüística, extralingüística o su formato de presentación.
* **Definición formal mediante DTD (*Document Type Definition*):**
  * Utilizado por lenguajes como XML y versiones de HTML hasta la 4.
  * Establece de forma estricta las marcas permitidas, los elementos, etiquetas, atributos, reglas sintácticas y normas de uso.
* **Combinación:** En un mismo documento real es habitual combinar varios lenguajes de marcas diferentes.

---

### 1.2. Clasificación según la Naturaleza de la Marca
1. **De presentación (o formato):**
   * *Objetivo:* Define únicamente el aspecto visual o formato del texto (negrita, cursiva, subrayado, tachado, alineación, color) sin especificar su estructura lógica ni su significado.
   * *Ámbito de uso:* Procesadores de texto y software de edición profesional.
   * *Ejemplo:* **RTF** (*Rich Text Format*).
2. **Descriptivos o semánticos:**
   * *Objetivo:* Describen y clasifican las distintas partes y datos del documento según su función o contenido, independientemente de cómo vayan a mostrarse visualmente.
   * *Ámbitos de uso:* Intercambio de datos y estructuración web.
   * *Ejemplos:* **HTML**, **XML**.

---

### 1.3. Clasificación según el Ámbito de Utilización

* **Documentación electrónica:**
  * **RTF (*Rich Text Format*):** Creado por Microsoft en 1987. Facilita el intercambio de documentos enriquecidos entre diferentes procesadores de texto.
  * **TeX:** Diseñado para la composición tipográfica de alta calidad y la creación de fórmulas y ecuaciones matemáticas complejas.
  * **Wikitexto:** Lenguaje de marcado ligero para crear contenido en plataformas wiki colaborativas (el término *wiki* proviene del hawaiano y significa "rápido").
  * **DocBook:** Permite redactar documentación separando la estructura lógica del formato de salida, facilitando publicar el mismo contenido original en múltiples soportes sin modificaciones.

* **Tecnologías de Internet:**
  * **HTML / XHTML (*HyperText Markup Language* / *eXtensible Hypertext Markup Language*):** Orientados a la creación y estructuración de páginas web.
  * **RSS:** Orientado a la redifusión y sindicación de contenidos web actualizados.

* **Lenguajes especializados:**
  * **MathML (*Mathematical Markup Language*):** Permite expresar formalismos y notaciones matemáticas para que sean interpretadas por distintos sistemas y navegadores.
  * **VoiceXML (*Voice Extended Markup Language*):** Diseñado para la interacción y el intercambio de información mediante voz entre un usuario y un sistema con reconocimiento del habla.
  * **MusicXML:** Estándar para el intercambio de partituras y notación musical entre programas de edición de música.

---

## 2. EVOLUCIÓN HISTÓRICA DE LOS LENGUAJES DE MARCAS

### 2.1. Contexto Inicial y Surgimiento
* **Años 70:** Emergen lenguajes informáticos orientados a la gestión de información (distintos a los de programación). Paralelamente surgen los sistemas gestores de bases de datos para el almacenamiento masivo.
* **Origen:** Los primeros procesadores de texto introducían códigos propietarios para controlar la impresión en impresoras programables (marcado meramente de presentación). Con el tiempo se vio la necesidad de pasar a un **marcado generalizado**.

---

### 2.2. GML (*Generalized Markup Language*)
* **Origen:** Años 60, desarrollado en **IBM** bajo el liderazgo de **Charles F. Goldfarb**.
* **Problema a resolver:** Falta de estandarización en los formatos de los ficheros de las empresas, lo que impedía compartir y procesar documentos legales entre distintos departamentos y aplicaciones.
* **Aportación:** Creó un formato estándar y flexible para describir documentos legales cuyo objetivo era ser completamente **independiente de la plataforma y de la aplicación** utilizada.

---

### 2.3. SGML (*Standard Generalized Markup Language*)
* **Año y estandarización:** Evolución de GML convertida en 1986 en la norma internacional **ISO 8879**.
* **Características:**
  * Metalenguaje formal muy potente para definir lenguajes de marcas.
  * **Inconvenientes:** Muy complejo, rígido y dependiente de herramientas de software extremadamente costosas.
  * **Consecuencia:** Su uso práctico quedó restringido a grandes entornos industriales, gubernamentales o aeroespaciales.

---

### 2.4. HTML (*HyperText Markup Language*)
* **Origen:** Desarrollado entre mayo de 1989 y diciembre de 1990 por **Tim Berners-Lee** junto al nacimiento de la **World Wide Web (WWW)**, ante la necesidad de enlazar y compartir información distribuida.
* **Base técnica (fusión de dos estándares):**
  1. **ASCII:** Código numérico de caracteres (7 bits básico = 128 caracteres; 8 bits ampliado = familias ISO 8859-n).
  2. **SGML:** Se tomó una versión simplificada, reducida a las instrucciones mínimas indispensables.
* **Éxito:** Sencillo de aprender, de software abierto y con rápido soporte por parte de los navegadores web.
* **Desventajas del HTML clásico:**
  * No soporta funciones para impresión de documentos web.
  * Capacidades avanzadas de diseño/presentación muy limitadas.
  * Lenguaje rígido/no flexible: repertorio de etiquetas cerrado y limitado.
  * No permite mostrar contenido dinámico de forma nativa.
  * Mezcla la estructura del documento con su diseño visual.

---

### 2.5. XML (*eXtensible Markup Language*)
* **Origen:** Estandarizado en **1998** por el **W3C** (*World Wide Web Consortium*).
* **Concepto:** Metalenguaje puramente **estructural y semántico** que no incluye directivas de diseño. Las etiquetas describen el significado del dato, no su presentación visual.
* **Pilares de XML:**
  * Permite inventar y definir etiquetas propias (extensible).
  * Permite asociar atributos a dichas etiquetas.
  * Utiliza esquemas para fijar formalmente las reglas de sintaxis y estructura.
  * Separa estrictamente la estructura de los datos del diseño final.
* **Familia de tecnologías asociadas:**
  * **XSL (*eXtensible Style Language*):** Definición de hojas de estilo y transformación de documentos.
  * **XLink (*XML Linking Language*):** Modelo avanzado de enlaces que permite conectar fragmentos internos o documentos externos mediante vínculos simples, múltiples o bidireccionales.
  * **XML Namespaces:** Mecanismo para desambiguar etiquetas con el mismo nombre procedentes de vocabularios distintos.
  * **XML Schemas:** Mecanismo para definir restricciones, tipos de datos y estructuras válidas sobre el documento.
* **Referencia oficial:** Publicación accesible en `https://www.w3.org/TR/xml/`.

---

## 3. TABLAS COMPARATIVAS DE LENGUAJES

### 3.1. Comparativa: XML frente a HTML

| Criterio | XML | HTML |
| :--- | :--- | :--- |
| **Conjunto de etiquetas** | Creación libre y personalizada de etiquetas para describir datos (conjunto abierto). | Conjunto predefinido, cerrado y limitado de etiquetas para un único tipo de documento. |
| **Hiperenlaces** | Mediante reglas y tecnologías externas (XLink, DTD, XSD). | Modelo nativo, intrínseco, simple e integrado para enlazar páginas y recursos web. |
| **Papel del navegador** | Plataforma para el desarrollo y ejecución de aplicaciones. | Visor/lector de páginas y contenidos. |
| **Compatibilidad** | Estandarizado: contribuyó a poner fin a la guerra de navegadores y marcas propietarias. | Problemas históricos de incompatibilidad y discrepancias visuales entre navegadores. |

---

### 3.2. Comparativa: XML frente a SGML

| Criterio | XML | SGML |
| :--- | :--- | :--- |
| **Facilidad de uso** | Uso sencillo y optimizado para la web. | Uso muy complejo. |
| **Requisito de validez** | Permite trabajar con documentos **bien formados** (no exige validación obligatoria contra DTD/Schema). | Exige obligatoriamente que el documento sea **válido**. |
| **Coste del software** | Facilita el desarrollo de aplicaciones y herramientas de bajo coste. | Requiere software de procesamiento muy costoso. |
| **Ámbito de aplicación** | Uso universal en informática y gestión de datos. | Relegado a sectores industriales muy específicos. |
| **Integración con HTML** | Alta compatibilidad e integración (ej. XHTML). | Sin compatibilidad directa definida con HTML. |
| **Estilos y maquetación** | Formateo y aplicación de estilos sencilla (CSS, XSL). | Formateo y estilos comparativamente complejos. |

---

## 4. ELEMENTOS FUNDAMENTALES DE LA SINTAXIS XML

### 4.1. Etiquetas
* **Definición:** Marcadores intercalados en el texto plano que delimitan los elementos e indican su inicio y final al intérprete.
* **Sintaxis:** Encerradas entre corchetes angulares (`<` y `>`).
  * **Etiqueta de inicio:** `<nombre>`
  * **Etiqueta de cierre:** `</nombre>` (idéntica a la de inicio, pero anteponiendo una barra inclinada `/`).
* **Regla estricta del W3C:** En las especificaciones actuales, las etiquetas deben escribirse obligatoriamente en **minúsculas** para que el documento se considere formalmente correcto.

---

### 4.2. Espacios de Nombres (*Namespaces*)
* **Finalidad:** Evitar colisiones y ambigüedades de nombres cuando se integran varios vocabularios en un mismo archivo XML (por ejemplo, si dos esquemas distintos utilizan la etiqueta `<titulo>` con significados diferentes).
* **Mecanismo:**
  * Asocian un **identificador único** (generalmente una URI / URL).
  * Se vincula a un **prefijo** que se antepone a la etiqueta (ej. `<prefijo:elemento>`), garantizando unicidad contextual.

---

## 5. HERRAMIENTAS PARA EL TRABAJO CON XML

### 5.1. Editores XML
* Al tratarse de texto plano, un documento XML puede crearse con cualquier editor de texto básico.
* Para documentos complejos o profesionales, los editores especializados ofrecen:
  * Autocompletado y validación de sintaxis en tiempo real.
  * Asistencia para la creación de esquemas DTD, XML Schema (XSD) y hojas de estilo (CSS, XSL).
* **Ejemplos destacados:**
  * **Amaya:** Editor y navegador creado por el W3C (soporta HTML, XHTML, CSS y XML).
  * **Notepad++**
  * **XML Copy Editor**
  * **Visual Studio Code**

---

### 5.2. Procesadores XML (*Parsers*)
* **Función:** Módulos de software encargados de leer el documento XML, comprobar sus reglas y permitir el acceso a su contenido y árbol estructural (los navegadores web modernos incorporan sus propios procesadores).
* **Clasificación según su nivel de comprobación:**
  1. **No validadores:** Comprueban únicamente que el documento esté **bien formado** (cumplimiento de las reglas sintácticas básicas de XML: etiquetas cerradas, anidamiento correcto, etiqueta raíz única, etc.).
  2. **Validadores:** Además de verificar que esté bien formado, comprueban que el documento sea **válido**, es decir, que respete escrupulosamente las normas y tipos de datos definidos en su DTD o XML Schema asociado.

---

### 5.3. Publicación y Transformación: Motores XSLT
* **Problema:** Un archivo XML solo contiene datos puros estructurados; los navegadores por sí solos no le aplican diseño web atractivo.
* **Solución: XSLT (*eXtensible Stylesheet Language Transformations*):**
  * Actúa como un motor de traducción o "receta".
  * Toma los datos del documento XML de entrada y los transforma automáticamente en un documento de salida con formato (típicamente **HTML** para la web o **PDF** para impresión).
  * Garantiza la **separación total entre datos y presentación**, permitiendo generar múltiples formatos a partir del mismo archivo XML únicamente cambiando la plantilla XSLT.
* **Referencia técnica:** Registro y recursos sobre analizadores XML en `http://xml.coverpages.org/index.html`.