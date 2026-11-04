---
tags:
  - entidad_relacion
  - bbdd
---
## 1. GUÍAS METODOLÓGICAS PARA ABORDAR LA RESOLUCIÓN DE PROBLEMAS

* **Naturaleza del diseño conceptual:** La elaboración de un esquema Entidad/Relación (E/R) a partir de un Universo del Discurso es un proceso creativo sin un procedimiento algorítmico estricto. Se fundamenta en heurísticas y recomendaciones de diseño.
* **Evolución del modelo:**
  * **Modelo E/R básico (Chen, 1976):** Tres elementos primarios: entidades, atributos e interrelaciones.
  * **Modelo E/R extendido (De Miguel et al., 1999):** Incorpora mayor riqueza semántica mediante:
    * Cardinalidades mínimas y máximas.
    * Jerarquías de generalización/especialización.
    * Dependencias de existencia y de identificación.

---

## 2. CONSTRUCTORES DEL MODELO E/R EXTENDIDO

### 2.1. Entidades
* **Definición:** Objetos primarios del mundo real sobre los que se recopila información (personas, lugares, eventos, cosas).
* **Representación textual:** Aparecen comúnmente representadas como **sustantivos** en los enunciados.
* **Ejemplar:** Instancia o manifestación concreta de una entidad (cada ocurrencia particular).
* **Clasificación según la fuerza de sus identificadores:**
  * **Entidades fuertes (o regulares):** Poseen existencia propia e identificadores internos que distinguen unívocamente a cada ocurrencia.
  * **Entidades débiles:** Carecen de autonomía completa; dependen de otra entidad regular:
    * *Dependencia en Existencia:* Los ejemplares de la entidad débil no pueden existir en la base de datos si desaparece el ejemplar de la entidad regular del que dependen. Sin embargo, **poseen un identificador propio** que los distingue globalmente (ej., cada edición de un curso tiene un código único global $E_1, E_2, E_3$).
      * `[insertar imagen de figura 14.24: Dependencia en existencia]`
    * *Dependencia en Identificación:* Además de no poder existir sin la entidad regular, la entidad débil **no puede identificarse por sí misma**. Requiere obligatoriamente incorporar el identificador de la entidad fuerte para formar su clave (ej., la edición $E_1$ del curso $C_1$ necesita de ambos: $Id\_Edición = Cod\_Curso + Num\_edición$).
      * `[insertar imagen de figura 14.25: Dependencia en identificación]`
    * *Regla fundamental:* Toda dependencia en identificación es **siempre** una dependencia en existencia (la inversa no siempre se cumple).

---

### 2.2. Atributos
* **Definición:** Propiedades descriptivas asociadas a entidades o interrelaciones. En los textos suelen manifestarse como nombres.
* **Clasificación funcional:**
  * **Identificadores:** Distinguen unívocamente cada ejemplar.
    * *Identificador Principal (IP):* Equivalente conceptual a la Clave Primaria relacional.
    * *Identificador Alternativo (IA):* Equivalente conceptual a una Clave Alternativa.
  * **Descriptores:** Describen características del ejemplar. En las interrelaciones, **solo** pueden existir atributos descriptores.
* **Concepto de Dominio:**
  * Conjunto de valores válidos para un atributo.
  * *Criterio metodológico del texto:* Por convención, se asume que el dominio lleva el mismo nombre que el atributo para simplificar el diagrama, salvo requerimiento explícito.
  ![[Pasted image 20261103204603.png|496]]
* **Restricciones semánticas sobre atributos:**
  * **Obligatorios vs. Opcionales:** Si deben poseer valor obligatoriamente o admiten valores nulos/ausentes.
  * **Univaluados vs. Multivaluados:** Si toman un solo valor o una colección de valores por cada ejemplar.
  * **Simples vs. Compuestos:** Atributos atómicos frente a aquellos agregados por sub-atributos.
  * **Derivados:** Su valor se calcula u obtiene a partir de otros elementos del esquema; llevan asociada una etiqueta con la fórmula o regla de derivación.
  * *Combinabilidad:* Estas características son ortogonales y pueden combinarse (ej., multivaluado-compuesto-opcional).

---

### 2.3. Interrelaciones
* **Definición:** Asociaciones semánticas del mundo real entre entidades. Se reconocen habitualmente mediante **verbos**.
* **Clasificación:**
  * **Regulares:** Asocian entidades regulares (fuertes) entre sí.
  * **Débiles:** Asocian al menos una entidad débil con otra (regular o débil). Se etiquetan en el rombo con **E** (existencia) o **ID** (identificación).
* **Características estructurales:**
  * **Grado:** Número de entidades que participan.
  * **Tipo de correspondencia:** Cardinalidad máxima ($1:1$, $1:N$, $N:M$).
  * **Restricción de cardinalidad $(min, max)$:** Mínimo y máximo de ejemplares con los que puede asociarse una ocurrencia:
    * Frecuentes: $(0,1)$, $(1,1)$, $(0,N)$, $(1,N)$ o valores numéricos concretos $(0, Num_1)$, etc.
	![[Pasted image 20261103204756.png|496]]

---

### 2.4. Generalizaciones y Especializaciones
* **Definición:** Mecanismo de abstracción que descompone una entidad genérica (**supertipo**) en entidades específicas (**subtipos**), vinculadas conceptualmente mediante relaciones jerárquicas tipo *"ES-UN"*.
* **Atributo discriminador:** Atributo asociado al supertipo/jerarquía que define el criterio de clasificación (ej., *Tipo*, *Clase*, *Función*).
* **Redistribución de atributos:**
  * Atributos comunes $\rightarrow$ Pasan al **supertipo**.
  * Atributos específicos $\rightarrow$ Pasan al **subtipo** correspondiente.
  * `[insertar imagen de figura 1.3: Ejemplo de generalización]`

* **Las 4 combinaciones posibles de generalización:**

  1. **Total sin solapamiento (Exclusiva y Total):**  
     Todo elemento del supertipo debe pertenecer obligatoriamente a un único subtipo.  
     *Ejemplo:* `EMPLEADO` clasificado por *Clase de trabajo* en `DOCENTE` o `NO DOCENTE`.  
     `[insertar imagen de ejemplo de generalización total sin solapamiento]`

  2. **Parcial sin solapamiento (Exclusiva y Parcial):**  
     Un elemento puede no pertenecer a ningún subtipo, pero si pertenece, solo puede ser de uno.  
     *Ejemplo:* `DOCUMENTO` clasificado por *Clase* en `LIBRO` o `ARTICULO` (pudiendo existir otros tipos de documentos).  
     `[insertar imagen de ejemplo de generalización parcial sin solapamiento]`

  3. **Total con solapamiento (Solapada y Total):**  
     Todo elemento del supertipo debe pertenecer al menos a un subtipo, pudiendo pertenecer a varios simultáneamente.  
     *Ejemplo:* `PERSONA` clasificada por *Tipo* en `EMPLEADO` y/o `ESTUDIANTE`.  
     `[insertar imagen de ejemplo de generalización total con solapamiento]`

  4. **Parcial con solapamiento (Solapada y Parcial):**  
     Un elemento puede no pertenecer a ningún subtipo, o pertenecer a más de uno al mismo tiempo.  
     *Ejemplo:* `EMPLEADO` clasificado por *Función* en `DOCENTE` y/o `INVESTIGADOR` (puede no ser ninguno de los dos o ser ambos).  
     `[insertar imagen de ejemplo de generalización parcial con solapamiento]`

---

## 3. HEURÍSTICAS PARA LA ELECCIÓN ENTRE CONSTRUCTORES

### 3.1. Entidades vs. Atributos
* **Regla fundamental:**
  > *"Las entidades poseen información descriptiva y los atributos no."*
* **Criterios de modelado:**
  1. Si un concepto solo aporta un valor o identificador simple $\rightarrow$ **Atributo**.
  2. Si el concepto requiere propiedades descriptivas adicionales $\rightarrow$ **Entidad**.
  3. *Caso especial:* Si un concepto consta únicamente de un identificador pero se vincula con múltiples entidades dentro del esquema, puede justificarse modelarlo como una **Entidad** propia o duplicarlo como atributo en las entidades involucradas.

### 3.2. Entidades vs. Atributos Multivaluados
* **Criterios de modelado:**
  1. Se modela como **Atributo Multivaluado** cuando posee un rango limitado y acotado de ocurrencias, describe solo a esa entidad y no participa en relaciones con otros componentes.
  2. Se modela como **Entidad** si el concepto incluye información descriptiva anexa o se interrelaciona con otras entidades del dominio.

### 3.3. Entidades vs. Interrelaciones
* **Criterios de modelado:**
  * Las interrelaciones asocian componentes; las entidades existen como objetos.
  * **Nominalización:** Proceso de convertir una interrelación en un sustantivo/entidad (ejemplo: "hombres se casan con mujeres" $\rightarrow$ "matrimonios").
  * *Heurística práctica:* Solo aplicar nominalizaciones cuando estén expresamente explicitadas en el enunciado o sean imprescindibles para simplificar interrelaciones de grado complejo.

---

## 4. NOTACIONES Y REPRESENTACIÓN GRÁFICA

* **Entidades:**
  * Entidad fuerte: Rectángulo simple. `[insertar imagen de notación de Entidad (fuerte)]`
  * Entidad débil: Rectángulo de doble trazo. `[insertar imagen de notación de Entidad débil]`
* **Atributos:**
  * Identificador Principal (IP): Círculo relleno. `[insertar imagen de notación de Identificador Principal (IP)]`
  * Identificador Alternativo (IA): Círculo mitad relleno. `[insertar imagen de notación de Identificador Alternativo (IA)]`
  * Descriptor simple: Círculo vacío. `[insertar imagen de notación de Atributo]`
  * Multivaluado: Doble flecha en la base. `[insertar imagen de notación de Atributo Multivaluado]`
  * Compuesto: Ramificación arbórea de círculos. `[insertar imagen de notación de Atributo Compuesto]`
  * Multivaluado Compuesto: Ramificación combinada con símbolo multivaluado. `[insertar imagen de notación de Atributo Multivaluado Compuesto]`
  * Opcional: Línea discontinua con círculo vacío. `[insertar imagen de notación de Atributo Opcional]`
  * Derivado: Círculo vacío con etiqueta descriptiva de cálculo. `[insertar imagen de notación de Atributo Derivado]`
  * Dominio: Óvalo. `[insertar imagen de notación de Dominio]`
* **Interrelaciones:**
  * Normal: Rombo simple. `[insertar imagen de notación de Interrelación]`
  * Débil en Existencia: Rombo con triángulo interior y etiqueta **E** (o sin etiqueta). `[insertar imagen de notación de Interrelación con Dependencia en Existencia]`
  * Débil en Identificación: Rombo con triángulo interior y etiqueta **Id** (o ID). `[insertar imagen de notación de Interrelación con dependencia en Identificación]`
* **Jerarquías de Generalización:**
  * Solapada y Parcial: Triángulo invertido sin marcas. `[insertar imagen de notación de Jerarquía solapada y parcial]`
  * Solapada y Total: Triángulo invertido con círculo/nodo en la parte superior. `[insertar imagen de notación de Jerarquía solapada y total]`
  * Exclusiva y Parcial: Triángulo invertido con arco horizontal. `[insertar imagen de notación de Jerarquía exclusiva y parcial]`
  * Exclusiva y Total: Triángulo invertido con arco horizontal y círculo/nodo superior. `[insertar imagen de notación de Jerarquía exclusiva y total]`

---

## 5. FASES METODOLÓGICAS DEL DISEÑO CONCEPTUAL (PASOS 2 AL 5)

* **Paso 2: Construcción de la Matriz de Entidades**
  * Disposición matricial bidimensional simétrica donde filas y columnas corresponden a las entidades del sistema ($E_1, E_2, \dots, E_N$).
  * Las intersecciones reflejan las interrelaciones existentes ($I_1, I_2, \dots, I_N$) junto a su tipo de correspondencia ($1:N$, etc.), o un guion doble (`--`) si no existe vínculo.
  * Debido a la simetría, una de las mitades diagonales se anula mediante tachaduras/cruces.
  * *Limitación:* Solo modela relaciones binarias (grado dos).
  * *Utilidad:* Permite identificar interrelaciones implícitas deducibles por sentido común, que deben ser validadas con el usuario.
  ![[Pasted image 20261103205636.png]]

* **Paso 3: Construcción del Esquema Conceptual Inicial**
  * Trazado de diagramas E/R incorporando las entidades, atributos, interrelaciones y correspondencias deducidas en la matriz.
  * Asignación sistemática de cardinalidades mínimas y máximas a cada extremo de relación.

* **Paso 4: Documentación de Supuestos Semánticos**
  * Formalización de aquellas restricciones de negocio y reglas semánticas que exceden las capacidades expresivas del diagrama gráfico.
  * El esquema final queda constituido inseparablemente por: **Diagrama E/R + Especificación de Supuestos Semánticos**.

* **Paso 5: Refinamiento y Detección de Redundancias**
  * Inspección de ciclos cerrados entre entidades vinculadas semánticamente de forma equivalente.
  * Se comprueba si al suprimir una interrelación intermedia, la semántica y navegación asociativa pueden reconstruirse íntegramente a través del camino alternativo.
  * Exige la verificación estricta de las cardinalidades mínimas y máximas en ambos sentidos del ciclo antes de proceder a la eliminación.