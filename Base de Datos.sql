-- crear una base de datos
CREATE DATABASE Veterinaria;

-- poniendo en uso la base 
USE Veterinaria;


CREATE TABLE Articulo(
	idArticulo int auto_increment primary key,
	nombre varchar(30) not null, 
	precio numeric(5,2) -- 999.99
);

insert into Articulo(nombre, precio) values('Correa',150);
insert into Articulo(nombre, precio) values('Correa',150.99);

select * from Articulo;


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


CREATE TABLE Medico(
	idMedico int(1) auto_increment primary key, -- 9
	nombre varchar(30) not null, 
	apellido varchar(30) not null,
	titulo varchar(50) DEFAULT 'Veterinario',
	edad int null
);

insert into Medico(nombre, apellido, edad) values('Sandra','Gomez','',35); -- NULL Y VACIO - EMPTY
insert into Medico(nombre, apellido, edad) values('Sandra','Gomez',35); 
select * from Medico;

CREATE TABLE Raza( -- CRUD
	codRaza char(3) not null primary key,
	raza varchar(30) not null UNIQUE
);
-- Datos dummy
INSERT INTO Raza(codRaza, raza) VALUES('GL','Golden Retriever'),('BM','Bichon Maltes'),('MZ','Meztizo'),('PA','PastorAleman'),('LB','Labrador'),('LR','Labrador Retiever'),('HS','Husky Siberiano'),('PL','Poodle');
DELETE FROM Raza WHERE codRaza = ?;


select * from Raza;

UPDATE Raza SET raza = 'Border collie' where codRaza = 'BC';


-- Seleccionar las razas que en su nombre tengan la letra a
select * from raza where raza LIKE '%a%' OR raza LIKE '%oo%';

CREATE TABLE Mascota(
	idMascota int auto_increment primary key,
	nombre varchar(30) not null,
	edad int(2) not null,
	temperamento varchar(30) not null,
	idCliente int not null,
	codRaza char(3) not null,
	FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(codRaza) REFERENCES Raza(codRaza) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Alergia(
	alergia varchar(30) not null,
	primary key(alergia)
);

INSERT INTO Alergia(alergia) VALUES('Dermatitis atópica'),('Dermatitis alérgica'),('Alergia alimentaria'),('Atopia');
select * from Alergia;

CREATE TABLE MascotaAlergia(
	idMascota int not null,
	alergia varchar(30) not null,
	descripcion varchar(500),
	foreign key(idMascota) references Mascota(idMascota) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(alergia) references Alergia(alergia) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE MascotaMedico(
	idMascota int not null,
	idMedico int(1) not null, 
	fechaHora datetime,
	foreign key(idMascota) references Mascota(idMascota) ON DELETE CASCADE ON UPDATE CASCADE,	
	foreign key(idMedico) references Medico(idMedico) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Medicamento(
	codMedicamento char(3) not null primary key,
	nombre varchar(30) not null,
	tipoAplicacion varchar(30) not null, -- 1fn , 2fn, 3fn... n-sima fn : n<=7 : Intyectado, bebido
										-- 3fn - boycee codde fn - 4fn
	precio numeric(6,2) not null
);
-- MO
SELECT codMedicamento, nombre, tipoAplicacion, precio FROM Medicamento;
SELECT nombre, tipoAplicacion, precio FROM Medicamento WHERE codMedicamento = ?;

UPDATE Medicamento set nombre = 'NuevoMedicamento', tipoAplicacion = 'pastilla', precio = 15.99 where codMedicamento = 'C1';

select nombre, tipoAplicacion, precio from Medicamento WHERE codMedicamento = "C2";

insert into Medicamento(codMedicamento, nombre, tipoAplicacion, precio) values('C1','Medicamento1','Inyeccion',525.25);
insert into Medicamento(codMedicamento, nombre, tipoAplicacion, precio) values('C2','Medicamento2','Inyeccion',525.48);

CREATE TABLE MascotaMedicamento(
	idMascota int not null, 
	codMedicamento char(3) not null, 
	foreign key(idMascota) references Mascota(idMascota) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key(codMedicamento) references Medicamento(codMedicamento) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Cama(
	idCama int not null auto_increment, 
	tamaño varchar(7) not null,
	uso varchar(30),
	idMascota int not null, 
	PRIMARY KEY(idCama),
	foreign key(idMascota) references Mascota(idMascota) ON DELETE CASCADE ON UPDATE CASCADE
);




