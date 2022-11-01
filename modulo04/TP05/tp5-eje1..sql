DROP DATABASE IF EXISTS sistema;
CREATE DATABASE sistema CHARACTER SET utf8mb4;
USE sistema;
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

INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true);
INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true);
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true);
INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true);
INSERT INTO departamentos VALUES(5, 'I+D', 375000, true);
INSERT INTO departamentos VALUES(6, 'Proyectos', 0,true );
INSERT INTO departamentos VALUES(7, 'Publicidad', 0, true);
INSERT INTO departamentos VALUES(8, 'Comercial', 0, false);

INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true);
INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true);
INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true);
INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez', 4, true);
INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true);
INSERT INTO empleados VALUES(6, '27-38382980-3', 'María', 'Santana', 1, true);
INSERT INTO empleados VALUES(7, '23-80576669-1', 'Pilar', 'Ruiz', 2, true);
INSERT INTO empleados VALUES(8, '24-71651431-3', 'Pepe', 'Ruiz', 3, true);
INSERT INTO empleados VALUES(9, '25-36399183-3', 'Juan', 'Gómez', 2, true);
INSERT INTO empleados VALUES(10, '20-34638446-3', 'Diego','Flores', 5, true);
INSERT INTO empleados VALUES(11, '27-36738983-3', 'Marta','Herrera', 1, true);
INSERT INTO empleados VALUES(12, '27-44123836-1', 'Irene','Salas', NULL, false);
INSERT INTO empleados VALUES(13, '20-38265162-1', 'Juan','Antonio', NULL, true); -- Faltaba declarar por separado el Nombre del Apellido. 

-- 1. Lista el apellido de todos los empleados.
select apellido from empleados;

-- 2.Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido from empleados 
	where apellido is not null;

-- 3.Lista todas las columnas de la tabla empleados.
select * from empleados;

-- 4. Lista el nombre y apellido de todos los empleados.
select Nombre, Apellido from empleados;

-- 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
select cuil_cuit, id_departamento from empleados 
	where id_departamento IS NOT NULL;

-- 6. Lista el nombre y apellido de los empleados en una única columna.
select concat_ws(' ', nombre, apellido) as 'Nombre y Apellido' from empleados;

-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula
select concat_ws(' ',upper(nombre), upper(apellido)) as 'Nombre y Apellido en mayusculas' from empleados;

-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select concat_ws(' ',lower(nombre), lower(apellido)) as 'Nombre y Apellido en minusculas' from empleados;

-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, presupuesto 
	from departamentos order by  presupuesto asc;

-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre 
	from departamentos order by nombre asc;

-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre 
	from departamentos order by nombre desc;

-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
select apellido, nombre 
	from empleados 
		order by apellido asc, nombre asc;

-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto desc limit 3;

-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto 
	from departamentos
		where estado=1 and presupuesto>0 order by presupuesto, nombre limit 3;

-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
select nombre, presupuesto 
	from departamentos 
		where presupuesto >=150000;

-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto 
	from departamentos
		where (presupuesto >=100000 and  presupuesto <=200000);

-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto 
	from departamentos
		where (presupuesto <100000 or  presupuesto >200000);

-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto
	from departamentos
		where presupuesto between 100000 and 200000;

-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN. 
select nombre, presupuesto
	from departamentos
		where estado=1 and presupuesto not between 100000 and 200000;

-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre, e.apellido, d.iddepartamento, d.nombre, d.presupuesto from sistema.empleados as e 
	join sistema.departamentos as d 
		where e.id_departamento=d.iddepartamento order by d.presupuesto desc;

-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden
-- alfabético) y en segundo lugar por apellido y el nombre de los empleados.
select e.nombre, e.apellido, d.iddepartamento, d.nombre, d.presupuesto 
	from sistema.empleados as e 
		join sistema.departamentos as d 
			on e.id_departamento=d.iddepartamento 
				order by d.nombre asc, e.apellido , e.nombre ;

-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos
-- departamentos que tienen empleados.
select distinct(d.iddepartamento) as 'Codigo Departamento', d.nombre as 'Nombre del Departamento'
	from sistema.departamentos as d
		right join sistema.empleados as e
			on d.iddepartamento=e.id_departamento
				where e.estado <>0;
    
-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
select d.nombre as 'Nombre del Departamento', e.cuil_cuit as 'CUIT/CUIL' 
	from sistema.empleados as e
		inner join sistema.departamentos as d
			on d.iddepartamento=e.id_departamento
				where e.cuil_cuit='27-38382980-3';

-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
select d.nombre as 'Nombre del Departamento', e.cuil_cuit as 'CUIT/CUIL' 
	from sistema.empleados as e
		inner join sistema.departamentos as d
			on d.iddepartamento=e.id_departamento
				where e.nombre='Pepe' and e.apellido='Ruiz';
                
-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
-- Ordena el resultado alfabéticamente.
select e.idempleado as 'Código Empleado', e.cuil_cuit as 'CUIT/CUIL', e.nombre, e.apellido  
	from sistema.empleados as e
		inner join sistema.departamentos as d
			on d.iddepartamento=e.id_departamento
				where d.nombre='I+D' and (e.estado<>0 or not null)
                order by e.nombre, e.apellido;

-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de
-- Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
    select e.idempleado as 'Código Empleado', e.cuil_cuit as 'CUIT/CUIL', e.nombre, e.apellido  
		from sistema.empleados as e
			inner join sistema.departamentos as d
				on d.iddepartamento=e.id_departamento
					where d.nombre=('I+D'or 'Sistemas' or 'Contabilidad') and (e.estado<>0 or not null)
					order by e.nombre, e.apellido;

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que 
-- no tienen un presupuesto entre $100000 y $200000.
select e.nombre
	from sistema.empleados as e
		inner join sistema.departamentos as d
			on d.iddepartamento=e.id_departamento
				where (d.presupuesto not between 100000 and 200000) and d.presupuesto>0;


-- FIN E1-TP05-M04 --

