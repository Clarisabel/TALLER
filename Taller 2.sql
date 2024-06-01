-- Parte 1: Creación de la Base de Datos y Esquemas
CREATE DATABASE Libreria
GO

USE Libreria
GO

CREATE SCHEMA Catalogo
GO

CREATE SCHEMA Ventas
GO

-- Parte 2: Creación de Tablas
-- 1. Esquema Catalogo

SELECT * FROM Catalogo.Autores
CREATE TABLE Catalogo.Autores (
    ID_Autor INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(30) NOT NULL,
    Apellido NVARCHAR(30) NOT NULL
)
GO

--DATOS
SET IDENTITY_INSERT Catalogo.Autores ON;
GO
INSERT INTO Catalogo.Autores (ID_Autor, Nombre, Apellido)
VALUES (1, 'Miguel', 'De Cervantes'),
(2, 'Chales', 'Dickens'),
(3, 'Gabiel','Garcia Marquez'),
(4, 'Edgar','Alan Poe'),
(5, 'Paulo', 'Coelho'),
(6, 'Pablo', 'Neruda'),
(7, 'Oscar', 'Wilde'),
(8, 'Franz', 'Kafka'),
(9, 'Charles', 'Dawin'),
(10, 'Rafael', 'Pombo')
GO


CREATE TABLE Catalogo.Categorias (
    ID_Categoria INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(30) NOT NULL
)
GO

SELECT * FROM Catalogo.Categorias

SET IDENTITY_INSERT Catalogo.Autores OFF;
GO
SET IDENTITY_INSERT Catalogo.Categorias ON;
GO

INSERT INTO Catalogo.Categorias (ID_Categoria, Nombre)
VALUES
(01, 'Amor'),
(02, 'Desamor'),
(03, 'Drama'),
(04, 'Ficcion'),
(05, 'Romance'),
(06, 'Fantasia'),
(07, 'Terror'),
(08, 'Historia'),
(09, 'Biografia'),
(10, 'Ciencia Ficcion')
GO


CREATE TABLE Catalogo.Libros (
    ID_Libro INT PRIMARY KEY IDENTITY,
    Titulo_Libro NVARCHAR(200) NOT NULL,
    ID_Autor INT NOT NULL,
    ID_Categoria INT NOT NULL,
    Precio MONEY NOT NULL,
    Fecha_Publicacion DATE,
    FOREIGN KEY (ID_Autor) REFERENCES Catalogo.Autores(ID_Autor),
    FOREIGN KEY (ID_Categoria) REFERENCES Catalogo.Categorias(ID_Categoria)
)
GO
select * from Catalogo.Libros

-- 2. Esquema VentasCREATE TABLE Ventas.Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(30) NOT NULL,
    Apellido NVARCHAR(30) NOT NULL,
    Email NVARCHAR(30) NOT NULL
)
GO


CREATE TABLE Ventas.Ventas (
    ID_Venta INT PRIMARY KEY IDENTITY,
    ID_Cliente INT NOT NULL,
    Fecha_Venta DATE NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Ventas.Clientes(ID_Cliente)
)
GO

SELECT * FROM Ventas.DetallesVentas

CREATE TABLE Ventas.DetallesVentas (
    ID_Detalle INT PRIMARY KEY IDENTITY,
    ID_Venta INT NOT NULL,
    ID_Libro INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unidad MONEY NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas.Ventas(ID_Venta),
    FOREIGN KEY (ID_Libro) REFERENCES Catalogo.Libros(ID_Libro)
)
GO
-- Parte 3: Definición de Relaciones

/*1. Relación Uno a Uno / Autores - Libros
Un autor puede escribir varios libros, así que la relación debería ser uno a muchos, no uno a uno.

2. Relación Uno a Varios / Categorías - Libros
Una categoría puede tener varios libros.
Un libro pertenece a una sola categoría.

3. Relación Uno a Varios / Clientes - Ventas
Un cliente puede tener múltiples ventas.
Una venta está asociada a un solo cliente.

4. Relación Uno a Varios / Ventas - DetalleVentas
Una venta puede tener múltiples detalles.
Cada detalle está asociado a una sola venta.

5. Relación Uno a Varios / Libros - DetalleVentas
Un libro puede aparecer en múltiples detalles de ventas.
Cada detalle se refiere a una sola venta de ese libro*/

-- Parte 4: Modificaciones

-- MODIFICAR NOMBRE DE COLUMNA
ALTER TABLE Catalogo.Libros
ADD CONSTRAINT FK_Libros_Autores FOREIGN KEY (ID_Autor) REFERENCES Catalogo.Autores(ID_Autor),
GO







