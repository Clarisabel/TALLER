-- PARTE 1
CREATE DATABASE Libreria
GO

USE Libreria
GO

-- ESQUEMAS
CREATE SCHEMA Catalogo
GO
CREATE SCHEMA Ventas
GO

-- PARTE 2

CREATE TABLE Catalogo.Autores (
    AutorID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(30),
    Apellido NVARCHAR(30)
)
GO
SELECT * FROM Catalogo.Autores

INSERT INTO Catalogo.Autores 
VALUES
('Rafael', 'Pombo'),
('Jorge', 'Isaacs'),
('Mario', 'Mendoza'),
('Gabriel', 'Garcia'),
('Fernando', 'Vallejo'),
('Miguel', 'De Cervantes'),
('Edgar' , 'Allan Peo'),
('Paulo', 'Coelho'),
('Chales' , ' Dickens')



CREATE TABLE Catalogo.Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(30) UNIQUE
)
GO

SELECT * FROM Catalogo.Categorias

INSERT INTO Catalogo.Categorias
VALUES
('AMOR'),
('NOVELA'),
('TERROR'),
('FICCION'),
('BIOGRAFIA'),
('CIENCIA'),
('DESAMOR'),
('FANTASIA'),
('HISTORIA')


CREATE TABLE Catalogo.Libros (
    LibroID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(30),
    AutorID INT,
    CategoriaID INT,
    Precio DECIMAL(10, 2),
    FOREIGN KEY (AutorID) REFERENCES Catalogo.Autores(AutorID),
    FOREIGN KEY (CategoriaID) REFERENCES Catalogo.Categorias(CategoriaID)
)
GO
SELECT * FROM Catalogo.Libros

INSERT INTO Catalogo.Libros 
VALUES ('La Pobre Viejecita', 1, 1, 20000),
('El alquimista', 2, 2, 30000),
('Los miserables' , 3, 3, 65759),
('El Principito', 4, 4, 55000),
('EL Retrado de Dorian Grey', 5,5, 45000),
('Un Mundo Feliz', 6, 6, 70000),
('Cien años dde Soledad', 7, 7, 90000),
('Odisea', 8, 8, 100000),
('Don Quijote de la Mancha', 9,9, 110000) 



CREATE TABLE Ventas.Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(30),
    Apellido NVARCHAR(30),
    Correo NVARCHAR(30) UNIQUE
)
GO
SELECT * FROM Ventas.Clientes

INSERT INTO Ventas.Clientes (Nombre, Apellido, Correo)
VALUES
('Camilo', 'Quintero','qcamilo@gmail.com'),
('Angelica', 'Meche', 'ameche@gmail.com'),
('Diana' , 'Osorio', 'Diana@gmail.com'),
('Carlos', ' Cantillo', 'carlose@gmail.com'), 
('Andrea' , 'Arias', 'andre@gmail.com'),
('Arelys', 'Hernandez', 'Arelys@gmail.com'), 
('Juan', ' Becerra',' juan@gmail.com'),
('Alejandro', ' Farfan', 'Alejandro@gmail.com'),
('Natalia', 'Galvis', 'Natalia@yahoo.es')


CREATE TABLE Ventas.Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    FechaVenta DATE,
    FOREIGN KEY (ClienteID) REFERENCES Ventas.Clientes(ClienteID)
)
GO
SELECT * FROM Ventas.Ventas

INSERT INTO Ventas.Ventas (ClienteID, FechaVenta)
VALUES
(1,'2020-02-10'),
(2,'2023-05-21'),
(3,'2019-07-16'),
(4,'2002-09-03'),
(5,'2013-08-04'),
(6,'2015-09-11'),
(7,'2010-05-11'),
(8,'2020-03-12'),
(9,'2022-02-23')



CREATE TABLE Ventas.DetalleVentas (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    VentaID INT,
    LibroID INT,
    Cantidad INT,
    PrecioVenta DECIMAL(10, 2),
    FOREIGN KEY (VentaID) REFERENCES Ventas.Ventas(VentaID),
    FOREIGN KEY (LibroID) REFERENCES Catalogo.Libros(LibroID)
)
GO
SELECT * FROM Ventas.DetalleVentas

INSERT INTO Ventas.DetalleVentas (VentaID, LibroID, Cantidad, PrecioVenta)
VALUES
(1, 1, 4, 35000),
(2, 2, 2, 80000),
(3, 3, 3, 20000),
(4, 4, 4, 76000),
(5, 5, 5, 23000),
(6, 6, 6, 28000),
(7, 7, 7, 87999),
(8, 8, 8, 90000),
(9, 9, 9, 65000)

 -- PARTE 4 
 

--RELACIONES FUERA DE LA TABLA

ALTER TABLE Catalogo.Libros
ADD CONSTRAINT FK_Libros_Autores FOREIGN KEY (AutorID) REFERENCES Catalogo.Autores(AutorID);
GO

-- CAMBIO NOMBRE COLUMNA 
-- Tabla Catalogo.Autores
EXEC sp_rename 'Catalogo.Autores.Nombre', 'Nombre_Autor', 'COLUMN'

-- Tabla Catalogo.Categorias
EXEC sp_rename 'Catalogo.Categorias.Nombre', 'Nombre_Categoria', 'COLUMN'

-- Tabla Catalogo.Libros
EXEC sp_rename 'Catalogo.Libros.Precio', 'Precio_Venta', 'COLUMN'

-- AÑADIR COLUMNAS
-- Tabla Catalogo.Autores
ALTER TABLE Catalogo.Autores
ADD Nacionalidad NVARCHAR(30)
GO

-- Tabla Catalogo.Libros
ALTER TABLE Catalogo.Libros
ADD Editorial NVARCHAR(50)
GO

