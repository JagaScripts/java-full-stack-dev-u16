USE actividades;
/*4.1. Mostrar el nombre de todas las peliculas*/

SELECT NOMBRE
FROM peliculas;

/*4.2. Mostrar las distintas calificaciones de edad que existen.*/

SELECT CALIFICACIONEDAD
FROM peliculas;

/*4.3. Mostrar todas las películas que no han sido calificadas.*/

SELECT NOMBRE, CALIFICACIONEDAD
FROM peliculas
WHERE CALIFICACIONEDAD IS null;

/*4.4 Mostrar todas las salas que no proyectan ninguna película.*/

SELECT *
FROM salas
WHERE PELICULA IS null;

/*4.5. Mostrar la información de todas las salas y, si se proyecta
alguna pelicula en la sala, mostrar tanmbién la información de la
pelicula.*/

SELECT *
FROM salas
LEFT OUTER JOIN peliculas ON peliculas.CODIGO = salas.PELICULA;

/*4.6. Mostrar la información
de todas las peliculas y. si se proyecta
en alguna sala, mostrar también la información de la sala.*/

SELECT *
FROM peliculas
LEFT OUTER JOIN salas ON salas.PELICULA = peliculas.CODIGO;

/*4.7. Mostrar los nombres de las películas que no se proyectan en ninguna
sala.*/

SELECT peliculas.NOMBRE
FROM peliculas
LEFT OUTER JOIN salas ON salas.PELICULA = peliculas.CODIGO
WHERE salas.PELICULA IS null;

/*4.8. Añadir una nueva pelicula Uno, Dos, Tres, para mayores de 7
años.*/

INSERT INTO peliculas VALUES(10, 'Uno, Dos, Tres', '7');

/*4.9 Hacer constar
que todas las peliculas no calificadas han sido
calificadas 'no reco- mendables para menores de 13 afños.*/

UPDATE peliculas SET CALIFICACIONEDAD = 13
WHERE CALIFICACIONEDAD IS null;

/*4.10. Eliminar todas las salas que proyectan películas recomendadas para
todos los públicos.*/


SELECT *
FROM peliculas;
DELETE FROM salas WHERE PELICULA IN 
(SELECT CODIGO 
FROM peliculas
WHERE CALIFICACIONEDAD = G);


















