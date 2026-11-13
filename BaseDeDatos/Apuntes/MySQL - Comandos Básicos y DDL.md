---
tags:
  - mysql
  - bbdd
---
`sudo /opt/lampp/bin/mysql -u root -p` -> Abre la **SHELL** de MySQL

---

## --- Comandos basicos de MySQL --- MODELO FISICO --- NO LO SUELE PREGUNTAR, LO HACE DEL REVES ---

* `EXIT;` -> Sale duh.
* `USE [base de datos];` -> Entrar en la base de datos
* `SOURCE [ruta de archivo]` -> Ejecuta un script en MySQL
* `SHOW TABLES;` -> Muestra la los atributos(columnas) de la base de datos
    * `SHOW DATABASES;` -> Muestra las base de datos creadas
* `DROP TABLE [tabla];` -> Borra una tabla en especifico
	* `DROP DATABASE [base de datos];` -> Elimina una base de datos
* `DELETE FROM [Tabla] WHERE [PK]` -> Elimina una fila de la tabla
* `DESCRIBE [base de datos];` -> Muestra las características de los atributos(columnas) de la base de datos
* `CREATE TABLE [atributos]([opciones](Nº))` -> Crea tablas con características (similar a Acces), (se separan por comas para distintos atributos), Nº es para limitar la cantidad
    * `CREATE OR REPLAZE TABLE [atributos];` -> Si ya existe la reemplaza (opcional)
    * `CREATE DATABASE [nombre];` -> Crea una BD
* `SELECT [atributo] FROM [tabla];` -> Muestra los valores de un atributo de una tabla.
	* `SELECT [tabla1.atributo1], [tabla2.atributo2] FROM [tabla1], [tabla2] WHERE [tabla1.FK]=[tabla2.PK];` -> Combina tablas con una relación entre sus claves (PK y FK).
	* `SELECT [atributo] FROM [tabla] WHERE [atributo] LIKE '[regla]';` -> Busca valores que coincidan con un patrón. `%` representa cualquier cantidad de caracteres y `_` representa un único carácter.
	* `SELECT * FROM [tabla];` -> Muestra todos los atributos y registros de una tabla.
	* `SELECT [alias].[atributo] FROM [tabla] AS [alias];` -> Para asignar un alias
	* `SELECT [atributos] FROM [tabla] AS [alias] WHERE [condición1] AND [condición2];` -> Añade varias condiciones a un WHERE. Todas deben cumplirse para mostrar el registro.
* `INSERT INTO [Tabla](atributo) VALUES([valores]);` -> Inserta valores a los atributos de la BD (se separan por comas para distintos atributos) puedes definir a que columnas pones los datos
* `ALTER TABLE [Tabla] MODIFY COLUMN [atributo] [valor];` -> Modifica el valor de un atributo (columna), hay excepciones para atributos que sean referenciados en otra tabla
    * `ALTER TABLE [Tabla] ADD [valor];` -> Añade un atributo (columna), muy útil para cuando hay relaciones en ambos lados
* `SET FOREIGN_KEY_CHECKS = [1 o 0];` -> Activa o desactiva las FK, importante cuando hay referencias que no funcionan porque no hay nada todavía 
* `SYSTEM [comando]];` -> Permite poner comando de linux dentro de MySQL, útil cuando se usa con `clean`
* `CHARACTER SET utf8mb4` -> Codificación de caracteres 
* `COLLATE utf8mb4_unicode_ci;` -> Añade la codificación de español (añade la ñ) 
* `UPDATE [tabla] SET [atributo]=[se quiere cambiar] WHERE [atributo]=[quieres que se cambie];` -> Permite cambiar el valor de un campo
* `JOIN`
---

## --- Opciones ---

### - Valores -
* `PRIMARY KEY` -> Asigna la llave primaria **OBLIGATORIO**
    * `PRIMARY KEY([pk externa], [atributo interno])`** -> Se usa cuando es una entidad débil
* `UNIQUE` -> Obliga que sea único
* `NOT NULL` -> Obliga que no sea nada **EL Nº 0 NO ES NULL**
* `UNSIGNED` -> Evita que se puedan añadir nº negativos
* `AUTO_INCREMENT` -> Hace que suba de forma automática, común con los INT, si pones NULL se pone solo
* `CONSTRAINT [nombre]` -> Sirve para darle un nombre a una restricción de la tabla, se suele poner con el FK o con el CHECK
* `FOREIGN KEY [nombre] REFERENCES [tabla](pk)` -> Sirve para relacionar una columna con la clave de otra tabla
* `IF NOT EXIST` -> Lo hace si no existe
* `CHECK(condicion)` -> Permite poner condiciones simples "<>", "&&", "||", etc

### - Tipos -
* `VARCHAR(Nº MAX)` -> Tipo de campo de texto de longitud
* `YEAR(Nº MAX)` -> Tipo de campo de años
* `DATE` -> Tipo de campo para poner la fecha
* `TIME` -> Tipo de campo para poner la hora
* `DATETIME/TIMESTAMP` -> Tipo de campo para poner la fecha y la hora
* `ENUM(opciones)` -> Tipo de campo que solo permite poner ciertas opciones
* `INT(nº MAX)` -> Tipo de campo numérico permite negativos y positivos
* `BIGINT(nº MAX)` -> Tipo de campo numérico largo permite negativos y positivos
* `TINYINT(nº MAX)` -> Tipo de campo numérico pequeño un total de 256 nº (del 0 al 255) permite negativos y positivos
* `DECIMAL(nº MAX)` -> Tipo de campo numérico que permite decimales
---

## --- Comentarios ---
- Al crear un una tabla **HAY** que crear una primary key(solo puede haber una)
- Normalmente en los tipos de campos piden un nº de valores, si se deja en blanco pondrá el máximo (normalmente)