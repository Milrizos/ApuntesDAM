---
tags:
  - mysql
  - bbdd
---
`sudo /opt/lampp/bin/mysql -u root -p` -> Abre la **SHELL** de MySQL

---

## --- Comandos basicos de MySQL --- MODELO FISICO --- NO LO SUELE PREGUNTAR, LO HACE DEL REVES ---

* `EXIT;` -> Sale duh.
* `USE [base de datos];`** -> Entrar en la base de datos
* `SOURCE [ruta de archivo]`** -> Ejecuta un script en MySQL
* `SHOW TABLES;`** -> Muestra la los atributos(columnas) de la base de datos
    * `SHOW DATABASES;`** -> Muestra las base de datos creadas
* `DROP TABLE [tabla];`** -> Borra una tabla en especifico
* `DESCRIBE [base de datos];`** -> Muestra las caracteristicas de los atributos(columnas) de la base de datos
* `CREATE TABLE [atributos]([opciones](Nº))`** -> Crea tablas con caracteristicas (similar a Acces), (se separan por comas para distintos atributos), Nº es para limitar la cantidad
    * `CREATE OR REPLAZE TABLE [atributos];`** -> Si ya existe la reemplaza (opcional)
    * `CREATE DATABASE [nombre];`** -> Crea una BD
* `DROP DATABASE [base de datos];`** -> Elimina una base de datos
* `SELECT [atributo] FROM [Tabla];`** -> Muestra los valores de que tiene la BD
* `INSERT INTO [Tabla](atributo) VALUES([valores]);`** -> Inserta valores a los atributos de la BD (se separan por comas para distintos atributos)
* `ALTER TABLE [Tabla] MODIFY COLUMN [atributo] [valor];`** -> Modifica el valor de un atributo (columna), hay excepiones para atributos que sean referenciados en otra tabla
    * `ALTER TABLE [Tabla] ADD [valor];`** -> Añade un atrivuto (columna), muy util para cuando hay relaciones en ambos lados

---

## --- Opciones ---

### - Valores -
* `PRIMARY KEY` -> Asigna la llave prmaria **OBLIGATORIO**
    * `PRIMARY KEY([pk externa], [atributo interno])`** -> Se usa cuando es una entidad debil
* `UNIQUE` -> Obliga que sea unico
* `NOT NULL` -> Obliga que no sea nada **EL Nº 0 NO ES NULL**
* `UNSIGNED` -> Evita que se puedan añadir nº negativos
* `AUTO_INCREMENT` -> Hace que suba de forma automatica, común con los INT
* `CONSTRAINT [nombre]` -> Sirve para darle un nombre a una restricción de la tabla, se sule poner co el FK o con el CHECK
* `FOREIGN KEY [nombre] REFERENCES [tabla](pk)` -> Sirve para relacionar una columna con la clave de otra tabla
* `IF NOT EXIST` -> Lo hace si no existe
* `CHECK(condicion)` -> Permite poener condiciones simples "<>", "&&", "||", etc

### - Tipos -
* `VARCHAR(Nº MAX)` -> Tipo de campo de texto de longitud
* `YEAR(Nº MAX)` -> Tipo de campo de años
* `DATE` -> Tipo de campo para poner la fecha
* `TIME` -> Tipo de campo para poner la hora
* `DATETIME/TIMESTAMP` -> Tipo de campo para poner la fecha y la hora
* `ENUM(opciones)` -> Tipo de campo que solo permite poner ciertas opciones
* `INT(nº MAX)` -> Tipo de campo numerico permite negativos y positivos
* `BIGINT(nº MAX)` -> Tipo de campo numerico largo permite negativos y positivos
* `TINYINT(nº MAX)` -> Tipo de campo numerico pequeño un total de 256 nº (del 0 al 255) permite negativos y positivos
* `DECIMAL(nº MAX)` -> Tipo de campo numerico que permite decimales

---

## --- Comentarios ---
- Al crear un una tabla **HAY** que crear una primary key(solo puede haber una)
- Normalmente en los tipos de campos piden un nº de valores, si se deja en blanco pondra el maximo (normalmente)