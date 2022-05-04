# java-full-stack-dev-u16
Este repositorio corresponde a ejercicios realizados en la formación de Java Full Stack Developer, concretamente a la unidad 16 DML

´´´ sql
USE actividades;
/*1.1. Obtener los nombres de los productos de la tienda.*/

SELECT NOMBRE
FROM articulos;

/*1.2. Obtener los nombres y los precios de los productos de la tienda.*/

SELECT NOMBRE, PRECIO 
FROM articulos;

/*1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200 E.*/

SELECT NOMBRE
FROM articulos
WHERE PRECIO <= 200;

/*1.4. Obtener todos los datos de los artículos cuyo precio esté entre los 60 € y los 120 €
(ambas cantidades incluidas).*/

/*SELECT *
FROM articulos
WHERE PRECIO <= 120 && precio >= 60;*/

SELECT *
FROM articulos
WHERE PRECIO BETWEEN 60 AND 120;

/*1.5. Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado
por 166'386)*/

SELECT NOMBRE, PRECIO * 166.386 AS 'Precio en pesetas'
FROM articulos;

/*1.6. Seleccionar el precio medio de todos los productos.*/

SELECT AVG(PRECIO) AS 'Precio medio todos lo artículos'
FROM articulos;

/*1.7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2.*/

SELECT AVG(PRECIO) AS 'Precio medio fabricante 2'
FROM articulos
WHERE fabricante = 2;

/*1.8. Obtener el numero de artículos cuyo precio sea mayor o igual a 180 €.*/

SELECT COUNT(NOMBRE) AS 'Número de art. >= 180€'
FROM articulos
WHERE precio >= 180;

/*1.9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 e
y ordenarlos descendentemente por precio, y luego ascendentemente por nombre*/

SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO >= 180
ORDER BY PRECIO DESC, NOMBRE ASC;

/*1.10. Obtener un listado completo de artículos, incluyendo por cada articulo los datos
del articulo y de su fabricante.*/

SELECT *
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO;

/*1.11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el
nombre de su fabricante.*/

SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO;

/*1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los
códigos de fabricante.*/

SELECT fabricantes.CODIGO
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.CODIGO
HAVING AVG(articulos.PRECIO);

/*1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre
del fabricante.*/

SELECT fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.CODIGO
HAVING AVG(articulos.PRECIO);

/*1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio
sea mayor o igual a 150.*/

SELECT fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.NOMBRE
HAVING AVG(articulos.PRECIO) >= 150;

/*1.15. Obtener el nombre y precio del artículo más barato.*/

SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO = 
(SELECT MIN(PRECIO) 
FROM articulos);

/*1.16. Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor
(incluyendo el nombre del proveedor).*/

SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE
FROM articulos, fabricantes
WHERE articulos.FABRICANTE = fabricantes.CODIGO AND 
(SELECT MAX(PRECIO) 
FROM articulos);

/*1.17. Añadir un nuevo producto: Altavoces de 70 (del fabricante 2)*/

INSERT INTO articulos (CODIGO,NOMBRE,PRECIO,FABRICANTE) VALUES
(11, "Altavoces", 70, 2);

/*1.18. Cambiar el nombre del producto 8 a 'Impresora Laser*/

UPDATE articulos 
SET NOMBRE = 'Impresora Laser' 
WHERE CODIGO = 8;

/*1.19. Aplicar un descuento del 10% (multiplicar el precio por 0'9) a todos los productos.*/

#He tenido que desactivar el modo seguro para actualizar y borrar registros del workbench
UPDATE articulos 
SET PRECIO = PRECIO * 0.9;

/*1.20. Aplicar un descuento de 10E a todos los productos cuyo precio sea mayor o igual a 120.*/

UPDATE articulos
SET PRECIO = PRECIO - 10
WHERE PRECIO >= 120;
´´´

´´´ sql
USE actividades;
/*2.1. Obtener los apellidos de los empleados*/

SELECT APELLIDOS
FROM empleados;

/*2.2.Obtener los apellidos de los empleados sin repeticiones*/

SELECT DISTINCT APELLIDOS
FROM empleados;

/*2.3.Obtener todos los datos de los empleados que se apellidan Smith*/

SELECT *
FROM empleados
WHERE APELLIDOS = 'Smith';

/*2.4.Obtener todos los datos de los empleados que se apellidan Smith y los que se apellidan 'Rogers*/

SELECT *
FROM empleados
WHERE APELLIDOS = 'Smith' OR APELLIDOS = 'Rogers';

/*2.5.Obtener todos los datos de los empleados que trabajan para el departamento 14.*/

SELECT *
FROM empleados
WHERE empleados.DEPARTAMENTO = 14;

/*2.6. Obtener todos los datos de los empleados que trabajan para el
departamento 37 y para el departamento 77*/

SELECT *
FROM empleados
WHERE empleados.DEPARTAMENTO = 37  OR empleados.DEPARTAMENTO = 77;


/*2.7. Obtener todos los datos de los empleados cuyo apellido
comience por 'P.*/

SELECT *
FROM empleados
WHERE APELLIDOS LIKE 'P%';

/*2.8. Obtener el presupuesto total de todos los departamentos.*/

SELECT SUM(PRESUPUESTO) 
FROM departamentos;

/*2.9. Obtener el numero de empleados en cada departamento.*/

SELECT DEPARTAMENTO, COUNT(*) AS "Numero de enpleados"
FROM empleados
GROUP BY DEPARTAMENTO;

/*2.10.
Obtener un listado completo de empleados, incluyendo por
cada empleado los datos del empleado y de su departamento.*/

SELECT *
FROM empleados, departamentos
WHERE empleados.DEPARTAMENTO = departamentos.CODIGO;

/*2.11. Obtener
un listado completo de empleados, incluyendo el
nombre y apellidos del empleado junto al nombre y presupuesto
de su departamento.*/

SELECT empleados.NOMBRE, APELLIDOS, departamentos.NOMBRE, PRESUPUESTO
FROM empleados, departamentos
WHERE empleados.DEPARTAMENTO = departamentos.CODIGO;

/*2.12. Obtener los nombres y apellidos de los empleados que trabajen en
departamentos cuyo presupuesto sea mayor de 60.000 .*/

SELECT empleados.NOMBRE, APELLIDOS
FROM empleados, departamentos
WHERE empleados.DEPARTAMENTO = departamentos.CODIGO AND departamentos.PRESUPUESTO > 60000;

/*2.13. Obtener los datos de los departamentos
cuyo presupuesto es
superior al presupuesto medio de todos los departamentos.*/

SELECT *
FROM departamentos
WHERE PRESUPUESTO > (SELECT AVG(presupuesto)
FROM departamentos);

/*2.14. Obtener los nombres (únicamente
los nombres) de los
departamentos que tienen más de dos empleados.*/

SELECT NOMBRE 
FROM departamentos
WHERE CODIGO IN
(SELECT DEPARTAMENTO
FROM empleados
GROUP BY empleados.DEPARTAMENTO
HAVING COUNT(*) > 2);

/*2.15.
Añadir un nuevo departamento: 'Calidad', con presupuesto de 40.000 € y
código 11. Añadir un empleado vinculado al departamento recién creado: Esther
Vázquez, DNI: 89267109*/

INSERT INTO departamentos (CODIGO, NOMBRE, PRESUPUESTO) VALUES 
( 11 , 'Calidad' , 40000 );

INSERT INTO empleados (DNI, NOMBRE, APELLIDOS, DEPARTAMENTO) VALUES
( '89267109' , 'Esther' , 'Vázquez' , 11 );

/*2.16. Aplicar un recorte presupuestario del 10 % a todos los departamentos.*/

UPDATE departamentos
SET PRESUPUESTO = PRESUPUESTO * 0.9;

/*2.17. Reasignar a los empleados del departamento de investigación (código 77)
al departamento de informática (código 14).*/

UPDATE empleados
SET DEPARTAMENTO = 14
WHERE DEPARTAMENTO = 77;

/*2.18. Despedir a todos los empleados que trabajan para el departamento de
informática
(código 14).*/

DELETE FROM empleados 
WHERE DEPARTAMENTO = 14;

/*2.19. Despedir a todos los empleados que trabajen para departamentos cuyo
presupuesto sea superior a los 60.000 €.*/

DELETE FROM empleados
WHERE DEPARTAMENTO
IN (SELECT CODIGO
FROM departamentos
WHERE PRESUPUESTO > 60000);

/*2.20. Despedir a todos los empleados.*/

DELETE FROM empleados;
´´´
