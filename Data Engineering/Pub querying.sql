use pubs

/* Cree una consulta para mostrar el apellido y código del puesto de los empleados que tienen un nivel del puesto mayor o igual a 100 */
select lname as 'Apellido', job_id as 'Codigo de puesto'
from employee
where job_lvl >= 100

/* Cree una consulta para mostrar los apellidos de los empleados y su fecha de contratación */
select lname as 'Apellido', hire_date as 'Fecha de contratacion'
from employee

/* Cree una consulta que muestre el apellido y nivel del puesto de todos los empleados cuyo nivel de puesto no está en el rango de 50 y 100 */
select lname as 'Apellido', job_id as 'Codigo de puesto'
from employee
where job_lvl not between 50 and 100

/* Muestre el apellido de empleado, job ID, y fecha de inicio de los empleados contratados entre el 20 de febrero de 1989 y el 1 de Agosto de 1989. Ordene la consulta en orden ascendente por fecha de inicio */
select lname as 'Apellido', job_id, hire_date as 'Fecha de contratación'
from employee
where hire_date between '1989-02-20' and '1989-08-1'
order by hire_date asc

/* Muestre el apellido y fecha de contratación de todos los empleados contratados en 1993 */
select lname as 'Apellido', hire_date as 'Fecha de contratación'
from employee
where year(hire_date) = '1993'
--también puede ser:
--where hire_date between '1993-01-01' and '1993-12-31'
--where hire_date like '%1993%'

/* 
Para cada empleado, muestre el apellido de los empleados y calcule el número de meses entre hoy y la fecha en que el empleado fue contratado. 
Etiquete la columna MONTHS_WORKED. Ordene sus resultados por número de meses empleados. 
*/
select lname as 'Apellido', (((year(getdate())-year(hire_date))*12)+(month(hire_date)-month(getdate()))) as 'MONTHS_WORKED'
--diferencia de años + diferencia de meses
from employee
order by MONTHS_WORKED

/* Cree una consulta que muestre el nombre del autor que tienen dos a más libros escritos */

select A.au_lname as 'Nombre', A.au_fname as 'Apellido', count(T.title_id) as 'Número de libros escritos'
from authors A, titleauthor T
where A.au_id = T.au_id
-- relación de llaves foráneas
group by A.au_lname, A.au_fname
having count(T.title_id) >= 2
order by A.au_lname, A.au_fname