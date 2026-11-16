SET FOREIGN_KEY_CHECKS = 0;
CREATE DATABASE IF NOT EXISTS Monedas;
USE Monedas;
DROP TABLE IF EXISTS Conversiones;
DROP TABLE IF EXISTS Productos;

CREATE TABLE Productos (
    Id_Producto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25),
    Precio DECIMAL(10,2),
    Moneda ENUM('Euro', 'Dolar', 'Cordoba', 'Peso')
);

CREATE TABLE Conversiones (
    Moneda_Origen ENUM('Euro', 'Dolar', 'Cordoba', 'Peso'),
    Moneda_Destino ENUM('Euro', 'Dolar', 'Cordoba', 'Peso'),
    CONSTRAINT Pk_Moneda PRIMARY KEY (Moneda_Origen, Moneda_Destino),
    Valor DECIMAL(10,4)
);

INSERT INTO Productos (Nombre, Precio, Moneda) VALUES
('Portatil', 899.99, 'Euro'),
('Movil', 599.50, 'Euro'),
('Auriculares', 45.99, 'Dolar'),
('Teclado', 35.50, 'Dolar'),
('Mouse', 450.00, 'Cordoba'),
('Monitor', 12500.00, 'Cordoba'),
('Tablet', 7500.00, 'Peso'),
('Smartwatch', 3200.00, 'Peso'),
('Impresora', 150.00, 'Dolar'),
('Camara', 275.99, 'Euro'),
('Altavoces', 850.00, 'Cordoba'),
('Disco SSD', 2800.00, 'Peso');

INSERT INTO Conversiones (Moneda_Origen, Moneda_Destino, Valor) VALUES
-- Euro
('Euro', 'Euro', 1.0000),
('Euro', 'Dolar', 1.0800),
('Euro', 'Cordoba', 39.5000),
('Euro', 'Peso', 1150.0000),
-- Dolar
('Dolar', 'Euro', 0.9259),
('Dolar', 'Dolar', 1.0000),
('Dolar', 'Cordoba', 36.5700),
('Dolar', 'Peso', 1065.0000),
-- Cordoba
('Cordoba', 'Euro', 0.0253),
('Cordoba', 'Dolar', 0.0273),
('Cordoba', 'Cordoba', 1.0000),
('Cordoba', 'Peso', 29.1200),
-- Peso
('Peso', 'Euro', 0.0009),
('Peso', 'Dolar', 0.0009),
('Peso', 'Cordoba', 0.0343),
('Peso', 'Peso', 1.0000);

SET FOREIGN_KEY_CHECKS = 1;
