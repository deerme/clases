/* 
mínima unidad de medida en SQL es 1 página = 8 KB
cuando quiero guardar información de las tuplas, se hacen una tras otra
hay una zona, conocida como cabecera (header) que consume 96 bytes
aquí se guarda quién es el dueño, el tipo de página (para almacenar datos, índices, etc)
también guarda el espacio disponible de la página
lo máximo que podemos guardar en una página es 8 KB = 8060 bytes
la tupla no puede cruzar dos páginas
cuando queramos asignarle un espacio a una tabla, se le asigna una extensión
una extensión tiene de tamaño 8 páginas = 64 KB
de las extensiones existen 2 tipos: uniformes y mixtas
cuando crean una tabla por primera vez se crea una mixta (las 8 páginas pueden tener 8 dueños)
cuando se crea una uniforme, las 8 páginas pueden tener 1 solo dueño
por eso SQL server crea una mixta porque no sabe si solo habrá 1
*/

/* CREACION DE TABLAS */

use PruebaBD			-- selecciona la base de datos PruebaBD
--si no se hace esto se va a ir a cualquier base de datos

create table Alumno		-- sentencia de creación
(
	codigo int not null,			-- por defecto es nulo (puede estar presente o no), not null hace que sea obligatorio
	nombre varchar(30) not null,
	telefono char(15) not null,
	edad tinyint not null,			-- nadie va a vivir más de 255 años
)

use PruebaBD
alter table Alumno -- sentencia de modificación
-- integridad de datos, de entidad (garantiza que cada tupla es única) y referencial

add constraint alumno_pk primary key (codigo)
-- add constraint (para crear una restricción), nombre lógico, tipo de la restricción (elemento de restricción)
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

-- la clave foránea va en la tabla que tenga mayor cardinalidad en la relación con otra

use PruebaBD
alter table Alumno 
add codigoF int not null

use PruebaBD
alter table Alumno
add constraint codigoF_fk foreign key (codigoF) -- codigoF el campo que va a ser llave foránea en Alumno
references Facultad(codigo) -- con qué tabla se enlaza y qué campo

/* PARA RESTRINGIR INFORMACION DE UN CAMPO */

use PruebaBD
alter table Alumno
add promedio int not null

-- otra forma de garantizar la integridad es la integridad de columna
-- se pueden usar verificaciones, checks

use PruebaBD
alter table Alumno
add constraint alumno_ck check (promedio>=0 and promedio<=20)
-- implementando una restricción