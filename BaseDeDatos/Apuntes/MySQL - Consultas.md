---
tags:
- mysql
- bbdd
---
## --- Consultas basicas de MySQL ---

- `SELECT [atributo] FROM [tabla];` -> Muestra los valores de un atributo de una tabla.
    - `SELECT * FROM [tabla];` -> Muestra todos los atributos y registros de una tabla.
- `SELECT [tabla1].[atributo1], [tabla2].[atributo2] FROM [tabla1], [tabla2] WHERE [tabla1].[FK]=[tabla2].[PK];` -> Combina tablas con una relación entre sus claves (PK y FK).
- `SELECT [atributo] FROM [tabla] WHERE [atributo] LIKE '[regla]';` -> Busca valores que coincidan con un patrón. `%` representa cualquier cantidad de caracteres y `_` representa un único carácter.
- `SELECT [alias].[atributo] FROM [tabla] AS [alias];` -> Para asignar un alias.
- `SELECT [atributos] FROM [tabla] AS [alias] WHERE [condición1] AND [condición2];` -> Añade varias condiciones a un WHERE. Todas deben cumplirse para mostrar el registro.
- `SELECT [atributos] FROM [tabla] WHERE [condicion] GROUP BY [columna];` -> Agrupa filas que tienen el mismo valor en una o varias columnas.
- `SELECT [atributos] FROM [tabla] WHERE [condicion] ORDER BY [atributos] [orden];` -> Ordena de menor a mayor `[ASC]` o de mayor a menor `[DESC]` -> NO LE GUSTA A JOAQUIN SI ES PARA SACAR LA MAS ALTA (un valor).
- `SELECT [atributos] FROM [tabla1] INNER JOIN [tabla2] ON [tabla1].[FK]=[tabla2].[PK];` -> Combina dos tablas mostrando únicamente los registros que tienen coincidencias según la condición establecida en `ON`. Si no pones `ON` es un producto cartesiano.

---

## --- Opciones ---

### - Funciones de agregado -

- `COUNT([atributo])` -> Permite contar los valores de un atributo que no sean NULL.
    - `SELECT COUNT(*) FROM [tabla] WHERE [condicion];` -> Cuenta las filas de una tabla que cumplan una condición.
    - `SELECT curso, COUNT(*) FROM alumnos GROUP BY curso;` -> Cuenta la cantidad de alumnos por curso.
- `SUM([atributo])` -> Suma los valores de cada grupo.
- `AVG([atributo])` -> Calcula la media de cada grupo.
- `MAX([atributo])` -> Obtiene el valor máximo de cada grupo.
- `MIN([atributo])` -> Obtiene el valor mínimo de cada grupo.
    - `SELECT [tabla1].[atributo1], [tabla2].[atributo2] FROM [tabla1] INNER JOIN [tabla2] ON [tabla1].[FK]=[tabla2].[PK] WHERE [tabla1].[atributo1] = (SELECT MIN([atributo1]) FROM [tabla1]);`

### - Funciones numéricas -

- `TRUNCATE([atributo], [nº decimales])` -> Elimina los decimales sin redondear.
- `ROUND([atributo], [nº decimales])` -> Redondea un número al número de decimales indicado.

### - Comparaciones -
- `ALL([consulta])` -> Permite hacer comparaciones con una consulta completa.
    - `SELECT [tabla1].[atributo1], [tabla2].[atributo2] FROM [tabla1] INNER JOIN [tabla2] ON [tabla1].[FK]=[tabla2].[PK] WHERE [tabla1].[atributo1] <= ALL(SELECT [atributo1] FROM [tabla1]);`


# --- Referencias a otros apuntes---
* [[MySQL - Comandos Básicos y DDL]] -> Para ver los comandos básicos de MySQL