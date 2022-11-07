
DROP DATABASE IF EXISTS elsistema;

CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado  boolean NOT NULL
);
CREATE TABLE empleados (
idempleado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);



-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades
-- 	(id,nombre, cp,id_provincia). Tener en cuenta que:
-- 		●En un país hay muchas provincias.
-- 		●En una provincia hay muchas localidades.
CREATE TABLE elsistema.paises (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(45) NULL,
    estado INT,
	PRIMARY KEY (id)
	);
  
CREATE TABLE elsistema.provincias (
	id INT NOT NULL AUTO_INCREMENT,
    nombre	VARCHAR(45),
    idpais INT,
    estado INT,
    PRIMARY KEY (id)
    );
    
CREATE TABLE elsistema.localidades (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(45) NULL,
    cp VARCHAR(20),
    id_provincia INT,
    PRIMARY KEY (id)
	);
    
-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
--  	●direccion (varchar)
-- 		●id_localidad (pk localidad) –Esta es un relación con la tabla localidades
-- 		●email
-- 		●telefono
-- 		●fecha_ingreso
-- 		●tms (timestamp)    
ALTER TABLE elsistema.empleados 
	ADD COLUMN direccion VARCHAR(100) AFTER apellido,
    ADD COLUMN id_localidad INT NOT NULL,
    ADD COLUMN email VARCHAR(120) AFTER direccion,
    ADD COLUMN telefono VARCHAR(30) AFTER email,
    ADD COLUMN fecha_ingreso DATE NULL AFTER email,
    ADD COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DROP PRIMARY KEY,
	ADD PRIMARY KEY (idempleado, id_localidad)
    ;
    
-- 3. Modificar la tabla de departamentos  usando ALTER TABLE y agregar los campos:
-- 		●gasto (double)
-- 		●tms (timestamp)    
ALTER TABLE elsistema.departamentos
	ADD COLUMN gastos DOUBLE,
    ADD COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
    
-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos,
-- empleados.   

-- Cargo Paises
INSERT INTO elsistema.paises ( nombre, estado) VALUES ('Argentina', 1);
INSERT INTO elsistema.paises ( nombre, estado) VALUES ('Paraguay', 1);
INSERT INTO elsistema.paises ( nombre, estado) VALUES ('Brasil', 1);
INSERT INTO elsistema.paises ( nombre, estado) VALUES ('Uruguay', 1);
INSERT INTO elsistema.paises ( nombre, estado) VALUES ('Perú', 1);

-- Cargo Provincias
INSERT INTO elsistema.provincias ( nombre, idpais, estado) VALUES ('Misiones', 1, 1);
INSERT INTO elsistema.provincias ( nombre, idpais, estado) VALUES ('Corrientes', 1, 1);
INSERT INTO elsistema.provincias ( nombre, idpais, estado) VALUES ('Santa Catarina', 3, 1);
INSERT INTO elsistema.provincias ( nombre, idpais, estado) VALUES ('Itapua', 2, 1);
INSERT INTO elsistema.provincias ( nombre, idpais, estado) VALUES ('Paysandú', 4, 1);
INSERT INTO elsistema.provincias ( nombre, idpais, estado) VALUES ('Lima', 5, 1);

-- Cargo Localidades
INSERT INTO elsistema.localidades ( nombre, cp, id_provincia) VALUES ('Oberá', '3360', 1);
INSERT INTO elsistema.localidades ( nombre, cp, id_provincia) VALUES ('Alvear', '3344', 2);
INSERT INTO elsistema.localidades ( nombre, cp, id_provincia) VALUES ('Itapema','88330-970', 3);
INSERT INTO elsistema.localidades ( nombre, cp, id_provincia) VALUES ('Encarnación', '6000', 4);
INSERT INTO elsistema.localidades ( nombre, cp, id_provincia) VALUES ('Paysandú', '60000', 5);
INSERT INTO elsistema.localidades ( nombre, cp, id_provincia) VALUES ('La Victoria', '15000', 6);

-- Cargo Departamentos
INSERT INTO elsistema.departamentos ( nombre, presupuesto, estado, gastos) VALUES ('Ventas', 10000000, 1, 850000);
INSERT INTO elsistema.departamentos ( nombre, presupuesto, estado, gastos) VALUES ('Depósito', 5000000, 1, 800000);
INSERT INTO elsistema.departamentos ( nombre, presupuesto, estado, gastos) VALUES ('Creditos', 13000000,1, 50000);
INSERT INTO elsistema.departamentos ( nombre, presupuesto, estado, gastos) VALUES ('Soporte Técnico', 25000000, 1, 300000);
INSERT INTO elsistema.departamentos ( nombre, presupuesto, estado, gastos) VALUES ('Marketing', 15000000, 1, 100000);


-- Cargo Empleados
INSERT INTO empleados(cuil_cuit, nombre, apellido, direccion, email, fecha_ingreso, telefono, id_departamento, estado, id_localidad)
			VALUES('20-123456789-7', 'Pepe', 'Argento', 'palmera 3', 'abc@cba.com', '2015-05-03','3578123456', 1, 1, 1);
INSERT INTO empleados(cuil_cuit, nombre, apellido, direccion, email, fecha_ingreso, telefono, id_departamento, estado, id_localidad)
			VALUES('21-789456133-8', 'Titi', 'Molina', 'Allalejos 35', 'qwe@cba.com', '2016-06-04', '98751132456', 2, 1, 2);
INSERT INTO empleados(cuil_cuit, nombre, apellido, direccion, email, fecha_ingreso, telefono, id_departamento, estado, id_localidad)
			VALUES('22-654987321-9', 'Martin', 'Saenz', 'Tableta 5', 'poi@cba.com', '2017-07-05', '3652987321', 3, 1, 3);
INSERT INTO empleados(cuil_cuit, nombre, apellido, direccion, email, fecha_ingreso, telefono, id_departamento, estado, id_localidad)
			VALUES('23-159357423-1', 'Franco', 'Gigolo', 'BuloBar 555', 'nji@cba.com', '2020-10-01', '3565321654', 4, 1, 4);
INSERT INTO empleados(cuil_cuit, nombre, apellido, direccion, email, fecha_ingreso, telefono, id_departamento, estado, id_localidad)
			VALUES('24-159357456-2', 'Marti', 'Freeman', 'Sector 9', 'iu52as@cba.com', '2021-11-02', '3578123456', 5, 1, 5);            



-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
ALTER TABLE elsistema.pedidos RENAME TO movimientos;


-- 6. Agregar las entidades:
-- 		●Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- 		●Marca (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- 		●Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit,id_localidad fk, estado,tms)
-- 		●Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
-- Un proveedor está en una localidad.
CREATE TABLE productos (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NULL,
    descripcion VARCHAR(150),
    id_marca INT NOT NULL, 
    stock INT,
    precio DOUBLE, 
    estado TINYINT,
    tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
    );

CREATE TABLE marca (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50),
    descripcion VARCHAR(150),
    imagen VARCHAR(300),
    id_proveedor INT,
    estado TINYINT,
    tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
    );
    
CREATE TABLE proveedores (
	id INT NOT NULL AUTO_INCREMENT,
    razon_social VARCHAR(150),
    nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(150),
    naturaleza VARCHAR(20),
    cuit VARCHAR(40),
    id_localidad INT NOT NULL,
    estado TINYINT,
    tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
    );
    
CREATE TABLE cajas (
	id INT NOT NULL AUTO_INCREMENT,
	horainicio DATETIME,
	horacierre DATETIME,
	estado TINYINT,
	tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
	);
    
ALTER TABLE productos ADD CONSTRAINT FK_idproXmarca FOREIGN KEY (id_marca)
      REFERENCES marca (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE proveedores ADD CONSTRAINT FK_provXloc FOREIGN KEY (id_localidad)
      REFERENCES localidades (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
    
-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
-- secuencialmente y no fallar.
-- //// cargo Proveedores //// --
INSERT INTO proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado)
			VALUES('ChinHim', 'Whuan', 'Quiam','Juridica', '951753852', 4, 1);
INSERT INTO proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado)
			VALUES('JM2023', 'Javi', 'Milei','Física', '987654321', 1, 1); 
INSERT INTO proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado)
			VALUES('MetalCho', 'Metal', 'Cho' ,'Juridica', '369258147', 6, 1);
INSERT INTO proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado)
			VALUES('Hilachero', 'Pepe', 'Lepu','Física', '123456789', 5, 1); 
INSERT INTO proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado)
			VALUES('El Turco', 'Titi', 'Repiolin','Física', '951321987', 3, 1); 

-- //// cargo Marcas //// --
INSERT INTO marca (nombre, descripcion, imagen, id_proveedor, estado) /*proveedor ChinHim*/
			VALUES('Himpa', 'Herramientas y ferreteria', ' �', 1, 1);
INSERT INTO marca (nombre, descripcion, imagen, id_proveedor, estado) /*proveedor JM2023*/
			VALUES('AntiK', 'Herramientas de trabajo', '0xF0 0x9D 0x85 0x99 �', 2, 1);  
INSERT INTO marca (nombre, descripcion, imagen, id_proveedor, estado) /*proveedor MetalCho*/
			VALUES('La rosca', 'Ferreteria', '�', 3, 1);
INSERT INTO marca (nombre, descripcion, imagen, id_proveedor, estado) /*proveedor Hilachero*/
			VALUES('Piolin', 'Insumos ferreteria', '�', 4, 1);
INSERT INTO marca (nombre, descripcion, imagen, id_proveedor, estado) /*proveedor El Turco*/
			VALUES('Boquetero', 'Herramientas Eléctricas', ' �', 1, 1); 

-- ////cargo productos////--
INSERT INTO Productos (nombre, descripcion, id_marca, stock, precio, estado)
			VALUES ('Martillo', 'Mango sintetico x 500gr', 1, 5,'1500', 1); /*marca himpa*/
INSERT INTO Productos (nombre, descripcion, id_marca, stock, precio, estado)
			VALUES ('Martillo', 'Mango sintetico x 300gr', 1, 9,'1200', 1); /*marca himpa*/            
INSERT INTO Productos (nombre, descripcion, id_marca, stock, precio, estado)
			VALUES ('Pala', 'Ancha N5', 2, 3,'5000', 1); /*marca AntiK*/
INSERT INTO Productos (nombre, descripcion, id_marca, stock, precio, estado)
			VALUES ('Tornillo', 'Tirafondo madera 1"', 3, 6000,'2.5', 1); /*La rosca*/            
INSERT INTO Productos (nombre, descripcion, id_marca, stock, precio, estado)
			VALUES ('Piola', 'Sintetico D20', 4, 1000,'250', 1); /*Piolin*/
INSERT INTO Productos (nombre, descripcion, id_marca, stock, precio, estado)
			VALUES ('Taladro', 'con percutor x 1200W', 5, 10,'8900', 1); /*Boquetero*/
  
-- //// cargo Caja //// --
INSERT INTO cajas (horainicio, horacierre, estado) 
			VALUES('2022-11-01 08:01:00', '2022-11-01 17:35:25', 1);
INSERT INTO cajas (horainicio ,horacierre, estado) 
			VALUES('2022-11-02 08:10:35', '2022-11-01 17:46:05', 1);
INSERT INTO cajas (horainicio ,horacierre, estado) 
			VALUES('2022-11-03 07:55:20', '2022-11-03 17:30:03', 1);
INSERT INTO cajas (horainicio ,horacierre, estado) 
			VALUES('2022-11-04 07:58:23', '2022-11-04 17:33:12', 1);
INSERT INTO cajas (horainicio ,horacierre, estado) 
			VALUES('2022-11-05 07:57:10', '2022-11-05 13:18:53', 1);                 
            
-- 8.Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
-- departamentos con estado activo o 1.
select dep.nombre, dep.presupuesto, dep.gastos , (dep.presupuesto-dep.gastos) as 'Diferencia'
	from elsistema.departamentos as dep
    where dep.estado=1;
    
-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre
-- del pais y el nombre de la localidad
select pai.nombre, loc.nombre
	from elsistema.paises as pai
    inner join elsistema.provincias as pro on pai.id=pro.idpais
    inner join elsistema.localidades as loc on pro.id=loc.id_provincia;
  
-- 10. Modificar (UPADTE):
-- 		●el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- 		●el fecha_ingreso y la localidad de otro empleado.
UPDATE elsistema.empleados
	SET telefono='789456123'
    WHERE idempleado=4;
UPDATE elsistema.empleados
	SET fecha_ingreso='2018-01-02', direccion='Calle 4', id_localidad=1
    where idempleado=5;
    
-- 11. Insertar 5 vendedores.
INSERT INTO vendedores(nombre, apellido, cuitcuil, comisión)
			VALUES('Sinideas', 'Cualquiera', '27-951951951-1', 3.5);
INSERT INTO vendedores(nombre, apellido, cuitcuil, comisión)
			VALUES('Marquitos', 'Retires', '28-364965465-2', 3.5);
INSERT INTO vendedores(nombre, apellido, cuitcuil, comisión)
			VALUES('Josias', 'Technique', '29-14725839-3', 5);
INSERT INTO vendedores(nombre, apellido, cuitcuil, comisión)
			VALUES('Alberso', 'Lechanta', '30-486486486-4', 0.5); 
INSERT INTO vendedores(nombre, apellido, cuitcuil, comisión)
			VALUES('Arnoldo', 'Terminador', '31-654312987-5', 5);            

-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,
-- tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
ALTER TABLE elsistema.movimientos
	ADD COLUMN id_producto INT AFTER id,
    ADD COLUMN estado TINYINT,
    ADD COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ADD COLUMN tipo_movimiento TINYINT, -- VOY A USAR 1= INGRSO, 2=EGRESO, 3= PEDIDO,
    ADD FOREIGN KEY (id_producto) REFERENCES productos(id);
    

-- 13. Insertar 5 movimientos distintos.
ALTER TABLE movimientos
	DROP FOREIGN KEY movimientos_ibfk_1;

INSERT INTO movimientos(id_producto, cantidad, fecha, id_cliente, id_vendedor, estado, tipo_movimiento)
			VALUES(3,4,'2019-05-06', 115, 5, 1,3);
INSERT INTO movimientos(id_producto, cantidad, fecha, id_cliente, id_vendedor, estado, tipo_movimiento)
			VALUES(1,5,'2020-06-07', 10, 4, 1,1);
INSERT INTO movimientos(id_producto, cantidad, fecha, id_cliente, id_vendedor, estado, tipo_movimiento)
			VALUES(4,2,'2021-07-08', 15, 3, 1,2);            
INSERT INTO movimientos(id_producto, cantidad, fecha, id_cliente, id_vendedor, estado, tipo_movimiento)
			VALUES(2,5,'2019-08-09', 115, 2, 1,1);
INSERT INTO movimientos(id_producto, cantidad, fecha, id_cliente, id_vendedor, estado, tipo_movimiento)
			VALUES(5,8,'2020-09-10', 432, 1, 1,3);

-- 14. Borrar lógicamente (UPDATE de la columna estado):
-- 		●2 movimientos que fueron cargados mal
-- 		●un pais que tenga al menos 3 localidades
UPDATE elsistema.movimientos
	SET estado=0
	WHERE movimientos.id=4 OR movimientos.id=5;
UPDATE elsistema.paises
	SET estado=0
    WHERE (SELECT COUNT(loc.nombre) AS CantLocXPais
        FROM elsistema.provincias AS pro 
        INNER JOIN elsistema.localidades AS loc ON loc.id_provincia=pro.id
		GROUP BY pro.idpais
        HAVING COUNT(*) = 3);

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
-- de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber
-- 5 updates de la tabla producto.
-- VOY A USAR 1= INGRSO, 2=EGRESO, 3= PEDIDO,
UPDATE productos,movimientos
SET stock=stock+movimientos.cantidad
WHERE productos.id=movimientos.id_producto AND tipo_movimiento=1;

UPDATE productos,movimientos
SET stock=stock-movimientos.cantidad
WHERE productos.id=movimientos.id_producto AND tipo_movimiento=2;

-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE elsistema.parametros(
	id INT NOT NULL AUTO_INCREMENT,
    tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	cosas JSON,
    id_usuario INT,
    PRIMARY KEY (id)
    );
    
    
-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- 		●{"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- 		●{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
-- 		“grupo": "ventas"}
-- 		●{"zonaHoraria": "America/Argentina/BuenosAires"}
-- 		●{"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":
-- 		"Diciembre"}
-- 		●{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
-- 		"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
-- 		"31634912,57","egreso": "9757142,66"}}}
-- Nota: Rellenar a criterio los campos id, tms,id_usuario
INSERT INTO elsistema.parametros (cosas, id_usuario)
VALUES 
('{"idDeLaCosa": 101, "permisos": "PUT, GET"}','5'),
('{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}','6'),
('{"zonaHoraria": "America/Argentina/BuenosAires"}','3'),
('{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}','1'),
('{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93", "egreso": "3732538.75"}, "2020":{"ingreso": "27442665.12", "egreso": "8522331.82"},"2021": {"ingreso":"31634912.57", "egreso": "9757142.66"}}}','4');

SELECT * FROM elsistema.parametros;   
    
    -- ALUMNO: FERREIRA JORGE EDUARDO