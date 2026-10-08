SET FOREIGN_KEY_CHECKS = 0;
CREATE DATABASE IF NOT EXISTS Pedidos;
USE Pedidos;
DROP TABLE IF EXISTS Suministro_Almacen;
DROP TABLE IF EXISTS Almacen_Articulos;
DROP TABLE IF EXISTS Linea_Pedidos;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Provincia;
DROP TABLE IF EXISTS Almacen;
DROP TABLE IF EXISTS Articulos;


CREATE TABLE Clientes(Cod_Cliente INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, DNI VARCHAR(9) UNIQUE NOT NULL, Nombre VARCHAR(25), Apellido1 VARCHAR(25), Telefono INT(9) UNSIGNED, Num_Cuenta BIGINT UNSIGNED UNIQUE NOT NULL, Calle VARCHAR(25), Numero TINYINT UNSIGNED, Localidad VARCHAR(25), email VARCHAR(50), Fecha_Premium DATE, Descuento TINYINT UNSIGNED, Tipo_Cliente ENUM('N','P') NOT NULL);


CREATE TABLE Pedidos(Num_Localizador INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, Id_Cliente INT UNSIGNED NOT NULL, CONSTRAINT FK_Cliente FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Cod_Cliente), Fecha_Hora TIMESTAMP, Importe_Total DECIMAL(10, 2) UNSIGNED);


CREATE TABLE Articulos(Id_Articulo INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, Nombre VARCHAR(25) NOT NULL, Descripcion VARCHAR(255) NOT NULL, Precio DECIMAL(8, 2) UNSIGNED);


CREATE TABLE Linea_Pedidos(Num_Linea_Pedido INT UNSIGNED, Num_Localizador_Pedido INT UNSIGNED, PRIMARY KEY(Num_Linea_Pedido, Num_Localizador_Pedido), CONSTRAINT Fk_Pedido FOREIGN KEY(Num_Localizador_Pedido) REFERENCES Pedidos(Num_Localizador), Importe_Linea DECIMAL(10, 2) UNSIGNED, Cantidad TINYINT UNSIGNED, Articulo INT UNSIGNED NOT NULL, CONSTRAINT Fk_Linea_Articulo FOREIGN KEY(Articulo) REFERENCES Articulos(Id_Articulo));


CREATE TABLE Almacen (Cod_Almacen INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, Nombre VARCHAR(25), Fecha_Apertura DATE, Direccion VARCHAR(25), Telefono INT UNSIGNED, Gerente VARCHAR(25), Cod_Provincia INT UNSIGNED NOT NULL UNIQUE);


CREATE TABLE Provincia(Cod_Provincia INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, Nombre VARCHAR(25) NOT NULL, Num_Habitantes INT UNSIGNED, Extension INT UNSIGNED, Cod_Almacen_Reparto INT UNSIGNED NOT NULL, CONSTRAINT Fk_Almacen_Reparto FOREIGN KEY(Cod_Almacen_Reparto) REFERENCES Almacen(Cod_Almacen));


ALTER TABLE Almacen ADD CONSTRAINT Fk_Provincia FOREIGN KEY (Cod_Provincia) REFERENCES Provincia(Cod_Provincia);


CREATE TABLE Almacen_Articulos (Id_Almacen INT UNSIGNED, Id_Articulo INT UNSIGNED, PRIMARY KEY(Id_Almacen, Id_Articulo), Stock INT UNSIGNED NOT NULL, CONSTRAINT Fk_Almacen_Articulos FOREIGN KEY(Id_Almacen) REFERENCES Almacen(Cod_Almacen),CONSTRAINT Fk_Articulo_Almacen FOREIGN KEY(Id_Articulo) REFERENCES Articulos(Id_Articulo));


CREATE TABLE Suministro_Almacen (Cod_Almacen_Origen INT UNSIGNED, Cod_Almacen_Destino INT UNSIGNED, PRIMARY KEY(Cod_Almacen_Origen, Cod_Almacen_Destino), Stock INT UNSIGNED NOT NULL, CONSTRAINT Fk_Almacen_Origen FOREIGN KEY(Cod_Almacen_Origen) REFERENCES Almacen(Cod_Almacen),CONSTRAINT Fk_Almacen_Destino FOREIGN KEY(Cod_Almacen_Destino) REFERENCES Almacen(Cod_Almacen), CONSTRAINT Ck_Suministro CHECK(Cod_Almacen_Origen<>Cod_Almacen_Destino));






INSERT INTO Clientes
VALUES
(NULL, '67890123G', 'Diego', 'Cortes', 667890123, 6789012345678901, 'Calle Mayor', 67, 'Madrid', 'diego@gmail.com', '2030-05-11', 50, 'P'),
(NULL, '78901234H', 'Dario', 'Hurtado', 678901234, 7890123456789012, 'Av. Congadas', 33, 'Madrid', 'pario@gmail.com', '2030-05-11', 50, 'P'),
(NULL, '12345678A', 'Roberto', 'Jimenez', 612345678, 1234567890123456, 'Calle Menor', 69, 'Madrid', 'antonio@marcos.com', NULL, NULL, 'N'),
(NULL, '23456789B', 'Albaro', 'Majo', 623456789, 2345678901234567, 'Calle Sol', 25, 'Getafe', 'alba@majo.com', NULL, NULL, 'N'),
(NULL, '34567890C', 'Wisdom', 'Osawinowi', 634567890, 3456789012345678, 'Calle Luna', 7, 'Leganés', 'windows@slop.com', NULL, NULL, 'N'),
(NULL, '45678901D', 'Robeto', 'Gallardo', 645678901, 4567890123456789, 'Calle Real', 42, 'Alcorcón', 'tomatin@gmail.com', NULL, NULL, 'N'),
(NULL, '56789012E', 'Samuel', 'Osvaldo', 656789012, 5678901234567890, 'Calle Norte', 15, 'Fuenlabrada', 'papirrin@gmail.com', NULL, NULL, 'N');


INSERT INTO Pedidos
VALUES
(NULL, 1, '2026-10-01 08:30:00', NULL),
(NULL, 1, '2026-10-01 09:15:00', NULL),
(NULL, 2, '2026-10-01 09:30:00', NULL),
(NULL, 3, '2026-10-01 10:00:00', NULL),
(NULL, 7, '2026-10-01 10:30:00', NULL),
(NULL, 4, '2026-10-01 11:30:00', NULL),
(NULL, 4, '2026-10-01 12:45:00', NULL),
(NULL, 7, '2026-10-01 13:15:00', NULL),
(NULL, 5, '2026-10-01 14:00:00', NULL),
(NULL, 6, '2026-10-01 16:30:00', NULL);


INSERT INTO Articulos
VALUES
(NULL, 'Teclado Mecánico', 'Teclado RGB switch azul', 45.99),
(NULL, 'Ratón Gaming', 'Ratón óptico 16000 DPI', 25.50),
(NULL, 'Monitor 24"', 'Monitor Full HD IPS 144Hz', 149.99),
(NULL, 'Auriculares', 'Auriculares 7.1 con micrófono', 39.90),
(NULL, 'Alfombrilla XL', 'Alfombrilla de tela antideslizante', 12.00),
(NULL, 'Silla Gaming', 'Silla ergonómica reclinable', 189.00);


INSERT INTO Linea_Pedidos
VALUES
(1, 1, 45.99, 1, 1),
(2, 1, 25.50, 1, 2),
(1, 2, 149.99, 1, 3),
(1, 3, 24.00, 2, 5),
(1, 4, 39.90, 1, 4),
(2, 4, 12.00, 1, 5),
(1, 5, 189.00, 1, 6),
(1, 6, 91.98, 2, 1),
(1, 7, 25.50, 1, 2),
(1, 8, 149.99, 1, 3),
(1, 9, 79.80, 2, 4),
(1, 10, 189.00, 1, 6);


UPDATE Pedidos SET Importe_Total = 71.49 WHERE Num_Localizador = 1;
UPDATE Pedidos SET Importe_Total = 149.99 WHERE Num_Localizador = 2;
UPDATE Pedidos SET Importe_Total = 24.00 WHERE Num_Localizador = 3;
UPDATE Pedidos SET Importe_Total = 51.90 WHERE Num_Localizador = 4;
UPDATE Pedidos SET Importe_Total = 189.00 WHERE Num_Localizador = 5;
UPDATE Pedidos SET Importe_Total = 91.98 WHERE Num_Localizador = 6;
UPDATE Pedidos SET Importe_Total = 25.50 WHERE Num_Localizador = 7;
UPDATE Pedidos SET Importe_Total = 149.99 WHERE Num_Localizador = 8;
UPDATE Pedidos SET Importe_Total = 79.80 WHERE Num_Localizador = 9;
UPDATE Pedidos SET Importe_Total = 189.00 WHERE Num_Localizador = 10;


INSERT INTO Almacen
VALUES
(1, 'Central Madrid', '2020-01-15', 'Av. Logística 12', 911234567, 'Carlos Gómez', 1),
(2, 'Norte Barcelona', '2021-03-20', 'Carrer Industria 45', 931234567, 'Marta Pujol', 2),
(3, 'Sur Sevilla', '2022-06-10', 'Pol. La Isla 8', 951234567, 'Manuel Ruiz', 3);

INSERT INTO Provincia
VALUES
(1, 'Madrid', 6668800, 8028, 1),
(2, 'Barcelona', 5743400, 7728, 2),
(3, 'Sevilla', 1957000, 14036, 3);


INSERT INTO Almacen_Articulos
VALUES
(1, 1, 150),
(1, 2, 200),
(1, 3, 50),
(1, 4, 80),
(1, 5, 300),
(1, 6, 20),
(2, 1, 100),
(2, 2, 120),
(2, 3, 30),
(3, 4, 60),
(3, 5, 150),
(3, 6, 15);


INSERT INTO Suministro_Almacen
VALUES
(1, 2, 50),
(1, 3, 40),
(2, 3, 20);

SET FOREIGN_KEY_CHECKS = 1;
