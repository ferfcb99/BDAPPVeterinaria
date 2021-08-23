-- crear una base de datos
CREATE DATABASE Veterinaria;

-- poniendo en uso la base 
USE Veterinaria;

CREATE TABLE Articulo(
	idArticulo int auto_increment primary key,
	nombre varchar(30) not null,
	precia numeric(5,2) -- 999.99
);

SELECT * FROM Articulo;

drop database Veterinaria;
-- DML
-- Agregar campos
-- ALTER TABLE Articulo ADD precio numeric(5,2) after idArticulo;

-- Borrar columna
-- ALTER TABLE Articulo DROP COLUMN precio;
	
-- Modificar una columna existente
-- ALTER TABLE Articulo MODIFY precia numeric(5,2) AFTER nombre, MODIFY precio numeric(5,2);

CREATE TABLE Cliente(
	idCliente int auto_increment primary key,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	direccion varchar(500)
);

-- tabla relacion 
CREATE TABLE ClienteArticulo(
	idCliente int not null,
	idArticulo int not null,
	cantidad int(1), -- 9
	foreign key(idCliente) references Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(idArticulo) references Articulo(idArticulo) ON DELETE CASCADE ON UPDATE CASCADE
);




