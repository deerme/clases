/* CREAR BASE DE DATOS */

create database TiendaDB
on primary

(
	name = TiendaDB_dat,
	filename = 'C:\Users\Jose\Documents\SQL Databases\TiendaDB.mdf',
	size = 10,
	maxsize = 100,
	filegrowth = 3
)

log on

(
	name = TiendaDB_log,
	filename = 'C:\Users\Jose\Documents\SQL Databases\TiendaDB.ldf',
	size = 2,
	maxsize = 10,
	filegrowth = 2
)

/* CREAR TABLAS */

use TiendaDB 
create table tProducto
(
	idProducto varchar(10) not null primary key,
	nombre varchar(30) not null,
	marca varchar(30) not null,
	foto image not null,
	precio int not null,
	stock int not null,
	observacion text not null,
	idCategoria varchar(10) not null,
)

use TiendaDB 
create table tCategoria
(
	idCategoria varchar(10) not null primary key,
	nombre varchar(30) not null,
	observacion text not null,
)

use TiendaDB 
create table tDetalleVenta
(
	cantidad int not null,
	precio int not null,
	idVenta varchar(10) not null,
	idProducto varchar(10) not null,
	primary key(idVenta, idProducto)
)

use TiendaDB 
create table tVenta
(
	idVenta varchar(10) not null primary key,
	fecha date not null,
	observacion text not null,
	estado bit not null,
	idUsuario varchar(10) not null,
	idCliente varchar(10) not null,
)

use TiendaDB 
create table tUsuario
(
	idUsuario varchar(10) not null primary key,
	nombre varchar(30) not null,
	cargo varchar(30) not null,
	codigo int not null,
	estado bit not null,
	observacion text not null,
	unidades int not null,
)

use TiendaDB 
create table tCliente
(
	idCliente varchar(10) not null primary key,
	dni varchar(10) not null,
	nombre varchar(30) not null,
	direccion text not null,
	telefono varchar(15) not null,
	observacion text not null,
)

/* CREAR LLAVES FORÁNEAS */

use TiendaDB
alter table tProducto
add constraint idCategoria_fk foreign key (idCategoria)
references tCategoria(idCategoria)

use TiendaDB
alter table tDetalleVenta
add constraint idProducto_fk foreign key (idProducto)
references tProducto(idProducto)

use TiendaDB
alter table tDetalleVenta
add constraint idVenta_fk foreign key (idVenta)
references tVenta(idVenta)

use TiendaDB
alter table tVenta
add constraint idUsuario_fk foreign key (idUsuario)
references tUsuario(idUsuario)

use TiendaDB
alter table tVenta
add constraint idCliente_fk foreign key (idCliente)
references tCliente(idCliente)

/* INSERTAR DATOS */

use TiendaDB
insert into tCategoria values('IMP', 'IMPRESORAS', '');
-- tCategoria (idCategoria, nombre, observacion)

insert into tCategoria values('MON', 'MONITORES', '');
insert into tCategoria values('LAP', 'LAPTOP', '');
insert into tCategoria values('NOT', 'NOTEBOOK', '');
insert into tCategoria values('MAIN', 'MAINBOARD', '');
insert into tCategoria values('PROC', 'PROCESADORES', '');
insert into tCategoria values('RAM', 'MEMORIA RAM', '');
insert into tCategoria values('HDD', 'HARD DISK', '');
insert into tCategoria values('TVI', 'TARJETA DE VIDEO', '');
insert into tCategoria values('TWI', 'TARJETA WIRELESS', '');
