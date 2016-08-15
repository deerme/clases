use pubs
 
/* SINTAXIS DE UN QUERY EN SQL */
-- select: campos para visualizar
-- from: de dónde vamos a sacar la información, de una tabla, dos tablas, o de una operación de consulta
-- where: condición
 
select *
-- * indica que queremos consultar todos los campos
from employee
 
/* Encontrar el nombre y apellido de todos los empleados */
select fname as 'Nombre', lname as 'Apellido', 'Otro' as 'Otra columna'
-- as indica que queremos crear un alias
-- crear un alias que no pertenece a un atributo crea una columna vacía
from employee
 
/* Mostrar solamente los empleados que tengan el nivel de puesto que esté entre 50 y 100 */
select *
from employee
where job_lvl >= 50 and job_lvl <= 100
-- también se puede usar job_lvl between 50 and 100
 
/* Mostrar el nombre del empleado y su puesto de trabajo */
select fname as 'Nombre', lname as 'Apellido', job_desc as 'Puesto'
from employee, jobs
where employee.job_id = jobs.job_id
-- la condición usa la relación foránea para no hacer producto cartesiano
-- en el from se puede usar employee e, jobs j para simplificar
-- así, en el where iría e.job_id = j.job_id
 
/* Mostrar cuántos usuarios pertenecen al nivel de puesto 100 */
select count(emp_id)
-- usamos la llave primaria de employee (emp_id) porque no se repite
-- * permite contar el número de tuplas no vacías, count(*)
from employee
where job_lvl = 100
 
/* Mostrar qué categoría tiene mayor cantidad de empleados */
-- primero utilizo job_lvl y hago una cuenta de las tuplas y le llamo como variable Cantidad
-- el resultado de este query es una tabla, le llamo R con () as R
-- luego a esta tabla le hago un max(R.Cantidad), from () as R
-- se podría hacer el primer query, llamarle R, ie. () as R y luego hacer otro query que haga from R
select max(R.Cantidad)
from (
	select job_lvl, count(*) as Cantidad
	from employee
	group by (job_lvl)
	-- aquí se cuenta cada grupo de job_lvl
) as R
