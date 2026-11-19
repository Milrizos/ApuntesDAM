## --- Consultas basicas de MySQL ---
* `SELECT [atributo] FROM [tabla];` -> Muestra los valores de un atributo de una tabla.
* `SELECT [tabla1.atributo1], [tabla2.atributo2] FROM [tabla1], [tabla2] WHERE [tabla1.FK]=[tabla2.PK];` -> Combina tablas con una relación entre sus claves (PK y FK).
* `SELECT [atributo] FROM [tabla] WHERE [atributo] LIKE '[regla]';` -> Busca valores que coincidan con un patrón. `%` representa cualquier cantidad de caracteres y `_` representa un único carácter.
* `SELECT * FROM [tabla];` -> Muestra todos los atributos y registros de una tabla.
* `SELECT [alias].[atributo] FROM [tabla] AS [alias];` -> Para asignar un alias
* `SELECT [atributos] FROM [tabla] AS [alias] WHERE [condición1] AND [condición2];` -> Añade varias condiciones a un WHERE. Todas deben cumplirse para mostrar el registro.
* `SELECT [atributos] FROM [tabla] WHERE [condicion] GROUP BY [columna];` -> agrupar filas que tienen el mismo valor en una o varias columnas.
* `SELECT [atributos] FROM [tabla] WHERE [condicion] ORDER BY [atributos] [orden];` -> Ordena de mayor a menor `[ASC]` o de menor a mayor `[DESC]`
* `SELECT [atributos] FROM [tabla1] INNER JOIN [tabla2] ON [tabla1.PK]=[tabla2.PK];` ->Combina dos tablas mostrando únicamente los registros que tienen coincidencias según la condición establecida en `ON`. Si no pones `ON` es un producto cartesiano


## --- Opciones ---
* `COUNT([atributo])` -> Permite contar por valor
	* `SELECT COUNT(*) FROM [tabla] WHERE [condicion];` -> Contar las tablas por valor que cumplan una condición 
	* `SELECT curso, COUNT(*) FROM alumnos GROUP BY curso;` -> Cuenta la cantidad de alumnos por curso
* `SUM([atributo])` -> Suma los valores de cada grupo.
* `AVG([atributo])` -> Calcula la media de cada grupo.
* `TRUNCATE([atributo], [nº decimales])`-> Elimina los decimales sin redondear.
* `ROUND([atributo], [nº decimales])` -> Redondea un número al entero más cercano.
* `MAX([atributo])` -> Obtiene el valor máximo de cada grupo.
* `MIN([atributo])` -> obtiene el valor mínimo de cada grupo.