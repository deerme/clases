use AlmacenDB

/* Obtener todos los almacenes */
select *
from ALMACENES

/* Obtener todas las cajas cuyo contenido tenga un valor superior a 150 */
select *
from CAJAS
where valor > 150

/* Obtener los tipos de contenidos de las cajas */
select Contenido
from CAJAS

/* Obtener el valor medio de todas las cajas */
select avg(valor) as 'Valor medio de todas las cajas'
from CAJAS

/* Obtener el valor medio de las cajas de cada almacén */
select Almacen, avg(valor) as 'Valor medio de las cajas'
from CAJAS
group by Almacen

/* Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150 */
select Almacen, avg(valor) as 'Valor medio de las cajas'
from CAJAS
group by Almacen
having avg(valor) > 150

/* Obtener el número de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra */
select NumReferencia, Lugar
from CAJAS, ALMACENES
where CAJAS.Almacen = ALMACENES.Codigo

/* Obtener el número de cajas que hay en cada almacén */
select Almacen, count(*) as 'Número de cajas'
from CAJAS
group by Almacen

/* Insertar 13 cajas en el almacén de Piura */
use AlmacenDB
insert into CAJAS values('00020', 'celular', 100, 7) -- 1
insert into CAJAS values('00021', 'celular', 100, 7) -- 2
insert into CAJAS values('00022', 'celular', 100, 7) -- 3
insert into CAJAS values('00024', 'celular', 100, 7) -- 4
insert into CAJAS values('00025', 'celular', 100, 7) -- 5
insert into CAJAS values('00026', 'celular', 100, 7) -- 6
insert into CAJAS values('00027', 'celular', 100, 7) -- 7
insert into CAJAS values('00028', 'celular', 100, 7) -- 8
insert into CAJAS values('00029', 'celular', 100, 7) -- 9
insert into CAJAS values('00030', 'celular', 100, 7) -- 10
insert into CAJAS values('00031', 'celular', 100, 7) -- 11
insert into CAJAS values('00032', 'celular', 100, 7) -- 12
insert into CAJAS values('00033', 'celular', 100, 7) -- 13

/* Obtener los códigos de los almacenes que están saturados (los almacenes donde el número de cajas es superior a la capacidad) */
select Codigo as 'Código de almacenes saturados'
from ALMACENES as A, (
	select Almacen, count(*) as Cantidad
	from CAJAS
	group by Almacen
) as C
where C.Almacen = A.Codigo and C.Cantidad > A.Capacidad

/*
select Codigo
from ALMACENES
where Capacidad > (
    select count(*)
    from CAJAS
    where CAJAS.Almacen = ALMACENES.Codigo
)
*/

/* Obtener los números de referencia de las cajas que están en Lima */
select NumReferencia, Lugar
from CAJAS, ALMACENES
where CAJAS.Almacen = ALMACENES.Codigo and Lugar = 'Lima'

/* Insertar un nuevo almacén en Lima con capacidad para 3 cajas */
use AlmacenDB
insert into ALMACENES values('Lima', 3)

/* Insertar una nueva caja con número de referencia 'H5RT', contenido 'PAPEL', valor 200 y situada en el almacén 2 */
use AlmacenDB
insert into CAJAS values('H5RT', 'PAPEL', 200, 2)

/* Rebajar el valor de todas las cajas un 15% */
use AlmacenDB
update CAJAS
set Valor = Valor * (1 - 0.15)

/* Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas */
use AlmacenDB
update CAJAS
set Valor = Valor * (1 - 0.20)
where Valor > (
	select avg(valor)
	from CAJAS
)

/* Eliminar todas las cajas cuyo valor sea inferior a 100 */
use AlmacenDB
delete
from CAJAS
where Valor < 100

/* Vaciar el contenido de los almacenes que están saturados */
use AlmacenDB
delete
from CAJAS
where Almacen in (
	select Codigo as 'Código de almacenes saturados'
	from ALMACENES as A, (
		select Almacen, count(*) as Cantidad
		from CAJAS
		group by Almacen
	) as C
	where C.Cantidad > A.Capacidad
)