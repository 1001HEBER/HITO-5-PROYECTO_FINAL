
CREATE DATABASE SISTEMA_DE_CONTROL_DE_VENTAS;
USE SISTEMA_DE_CONTROL_DE_VENTAS;

CREATE TABLE Clientes 
(
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono VARCHAR(20),
  email VARCHAR(50),
  direccion VARCHAR(100)
);

INSERT INTO Clientes VALUES (123, 'Juan', 'Perez', '78944848', 'juan@gmail.com','Av.Juan_Pablo');
INSERT INTO Clientes VALUES (1234, 'Luis', 'Mamamni', '85944848', 'luis@gmail.com','Av.La_paz');
INSERT INTO Clientes VALUES (12345, 'Pepe', 'Alanoca', '6984848', 'pepe@gmail.com','Av.Bolivia');
INSERT INTO Clientes VALUES (123456, 'Jose', '	Quisbert', '785944848', 'jose@gmail.com','Av.Perez');
INSERT INTO Clientes VALUES (1234567, 'Daniel', 'Mayta', '12344848', 'dani@gmail.com','Av.Litoral');


CREATE TABLE Vendedores 
(
  id_vendedor INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono VARCHAR(20),
  email VARCHAR(50)
);

INSERT INTO Vendedores VALUES (1, 'Alex', 'Machicado', '4547874','alex@gmail.com');
INSERT INTO Vendedores VALUES (2, 'Alberto', 'Barra', '54747874','albert@gmail.com');

CREATE TABLE Autos
(
  placa_auto VARCHAR(50) PRIMARY KEY,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  anio INT,
  color VARCHAR(20),
  precio DECIMAL(10, 2)
);

INSERT INTO Autos VALUES ('124-LIO', 'TOYOTA', 'Minibus', 2000, 'Blanco', '18.000');
INSERT INTO Autos VALUES ('478-DAF', 'MITSUBITSI', 'Camioneta', 2005, 'Blanco', '22.000');
INSERT INTO Autos VALUES ('632-LUN', 'CALDINA', 'Camion', 2001, 'Blanco', '45.000');
INSERT INTO Autos VALUES ('7895-LOR', 'NISSAN', 'Minibus', 2010, 'Blanco', '20.000');
INSERT INTO Autos VALUES ('1244-KIL', 'COROLA', 'camioneta', 2023, 'Blanco', '12.000');


CREATE TABLE Ventas
(
  id_venta INT PRIMARY KEY,
  fecha DATE,
  id_cliente INT,
  id_vendedor INT,
  placa_auto VARCHAR(50),
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor),
  FOREIGN KEY (placa_auto) REFERENCES Autos(placa_auto)
);

CREATE TABLE Financiamientos
(
  id_financiamiento INT PRIMARY KEY,
  nombre VARCHAR(50),
  tasa_interes DECIMAL(5, 2)
);

CREATE TABLE Pagos 
(
  id_pago INT PRIMARY KEY,
  fecha DATE,
  monto DECIMAL(10, 2),
  id_venta INT,
  id_financiamiento INT,
  FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
  FOREIGN KEY (id_financiamiento) REFERENCES Financiamientos(id_financiamiento)
);

CREATE TABLE Mecanicos 
(
  id_mecanico INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  telefono VARCHAR(20),
  email VARCHAR(50)
);

INSERT INTO Mecanicos VALUES (1, 'Dante', 'Alanoca', '4785777', 'alan@gmail.com');
INSERT INTO Mecanicos VALUES (2, 'Robert', 'Tinta', '7885777', 'tinta@gmail.com');


CREATE TABLE Mantenimientos 
(
  id_mantenimiento INT PRIMARY KEY,
  fecha DATE,
  descripcion VARCHAR(200),
  placa_auto VARCHAR(50),
  id_mecanico INT,
  FOREIGN KEY (placa_auto) REFERENCES Autos(placa_auto),
  FOREIGN KEY (id_mecanico) REFERENCES Mecanicos(id_mecanico)
);
