/* 
m�nima unidad de medida en SQL es 1 p�gina = 8 KB
cuando quiero guardar informaci�n de las tuplas, se hacen una tras otra
hay una zona, conocida como cabecera (header) que consume 96 bytes
aqu� se guarda qui�n es el due�o, el tipo de p�gina (para almacenar datos, �ndices, etc)
tambi�n guarda el espacio disponible de la p�gina
lo m�ximo que podemos guardar en una p�gina es 8 KB = 8060 bytes
la tupla no puede cruzar dos p�ginas
cuando queramos asignarle un espacio a una tabla, se le asigna una extensi�n
una extensi�n tiene de tama�o 8 p�ginas = 64 KB
de las extensiones existen 2 tipos: uniformes y mixtas
cuando crean una tabla por primera vez se crea una mixta (las 8 p�ginas pueden tener 8 due�os)
cuando se crea una uniforme, las 8 p�ginas pueden tener 1 solo due�o
por eso SQL server crea una mixta porque no sabe si solo habr� 1
*/

/* CREACION DE TABLAS */

use PruebaBD			-- selecciona la base de datos PruebaBD
--si no se hace esto se va a ir a cualquier base de datos

create table Alumno		-- sentencia de creaci�n
(
	codigo int not null,			-- por defecto es nulo (puede estar presente o no), not null hace que sea obligatorio
	nombre varchar(30) not null,
	telefono char(15) not null,
	edad tinyint not null,			-- nadie va a vivir m�s de 255 a�os
)

use PruebaBD
alter table Alumno -- sentencia de modificaci�n
-- integridad de datos, de entidad (garantiza que cada tupla es �nica) y referencial

add constraint alumno_pk primary key (codigo)
-- add constraint (para crear una restricci�n), nombre l�gico, tipo de la restricci�n (elemento de restricci�n)
-- esto crea una llave primaria
-- no se puede crear llaves primarias sobre campos nulos

use PruebaBD
create table Facultad
(
	codigo int not null primary key,
	nombre varchar(30) not null,
	telefono char(15) not null,
	edad tinyint not null,
	pabellon char(1) not null,
	decano varchar(30) not null,
)

-- la clave for�nea va en la tabla que tenga mayor cardinalidad en la relaci�n con otra

use PruebaBD
alter table Alumno 
add codigoF int not null

use PruebaBD
alter table Alumno
add constraint codigoF_fk foreign key (codigoF) -- codigoF el campo que va a ser llave for�nea en Alumno
references Facultad(codigo) -- con qu� tabla se enlaza y qu� campo

/* PARA RESTRINGIR INFORMACION DE UN CAMPO */

use PruebaBD
alter table Alumno
add promedio int not null

-- otra forma de garantizar la integridad es la integridad de columna
-- se pueden usar verificaciones, checks

use PruebaBD
alter table Alumno
add constraint alumno_ck check (promedio>=0 and promedio<=20)
-- implementando una restricci�n