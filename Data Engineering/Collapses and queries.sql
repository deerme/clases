use TiendaDB

/* Crear tabla */

create table pruebaT
(
	campo1 int,
	campo2 varchar(12) not null default 'sin dato'
	-- default sirve para agregar un valor por omisión
	-- es decir, cuando el usuario no diga nada dice "sin dato"
	-- sirve para no romper la integridad de la base de datos
	-- le da un valor default
)

/* Insertar datos */

insert pruebaT (campo1, campo2)
values (12, default)

insert pruebaT (campo1, campo2) values (13, default)

insert pruebaT values (14, default)

insert pruebaT 
values (15, default),(16, default)

/* Eliminar filas */

delete pruebaT
where campo1<13

/* Eliminar todas las filas de una tabla */

truncate table pruebaT
-- más rápido que delete siempre (interno)

select * from pruebaT

use pubs

select *
from titles

/* Incrementar el precio del libro MC3021 en 20% */

update titles
set price = price * 1.2
where title_id ='MC3021'

-- para recuperar cambios efectuados se puede ver el archivo de transacciones

select *
from employee

/* Buscar los nombres de todos los empleados cuyos nombres empiezan con la letra P */

select *
from employee
where fname like 'P%'
-- % es comodín

/* Buscar los nombres de todos los empleados cuyos nombres empiezan con la letra P y contengan la letra A */

select *
from employee
where fname like 'P%A%'

/* Buscar los nombres de todos los empleados cuyos nombres empiezan con la letra P y la cuarta letra es E */

select *
from employee
where fname like 'P__E%'

-- where in reemplaza varios O lógicos
-- funciona como si fueran conjuntos

/* Buscar los empleados que pertenezcan al nivel de puesto 35, 100 y 120 */

select *
from employee
where job_lvl in (35, 100, 120)

/* Buscar los empleados cuyos niveles de puesto están entre 35 y 100 */

select *
from employee
where job_lvl between 35 and 100

/* Buscar los precios donde el precio es desconocido */

select *
from titles
where price is null

/* Ordenar la tabla titles por precio de manera descendiente */

select *
from titles
order by price desc

/* Ordenar la tabla titles por precio de manera ascendiente, ignorando nulos */

select *
from titles
where price is not null
order by price asc

/* Ordenar la tabla titles por pub_id (ascendiente) y luego por precio (ascendiente) */

select *
from titles
order by pub_id asc, price asc
-- esto se puede usar para hallar por ejemplo el primer puesto de cada carrera

/* Buscar qué pub_ids existen */

select distinct pub_id
-- distinct elimina las ocurrencias duplicadas
from titles

/* Contar cuántos pub_ids existen */

select count(pub_id)
-- la sentencia de contar le aplica a toda la expresión
from titles

/* Contar cuántas publicaciones hay en cada pub_id */

select count(pub_id)
from titles
group by pub_id

/* Mostrar los códigos de publicación que tengan más de cinco libros */

select pub_id, count(pub_id)
from titles
group by pub_id
having count(pub_id) > 5

/* Calcular el promedio de precios de los libros */

select avg(price)
from titles
-- avg es una función de agregado

/* Calcular el precio máximo */

select max(price)
from titles
-- max es otra función de agregado

/* Calcular el precio mínimo */

select min(price)
from titles
-- min es otra función de agregado

/* Calcular la suma de todos los precios */

select sum(price)
from titles
-- sum es otra función de agregado

/* Mostrar los nombres de los libros de los cuales hay más de 5 */

select P.pub_name, R.pub_id, R.Cantidad -- al final mostramos el nombre de la publicación, el id,  la cantidad
from publishers as P, ( -- le llamamos P a la tabla publishers, donde están los nombres de las publicaciones
	select pub_id, count(pub_id) as Cantidad -- definimos un nombre a la variable
	from titles
	group by pub_id
	having count(pub_id) > 5
) as R -- le llamamos R a la subconsulta
where P.pub_id = R.pub_id
-- para eliminar duplicados del producto cartesiano

/* Otra forma */

select P.pub_name, R.pub_id, R.Cantidad
from publishers as P join ( -- usamos un join para ahorrar tiempo (especialmente con varios join)
-- los joins se arman así: (A join B) join C
	select pub_id, count(pub_id) as Cantidad 
	from titles
	group by pub_id
	having count(pub_id) > 5
) as R 
on P.pub_id = R.pub_id -- establecemos la relación de las foráneas

