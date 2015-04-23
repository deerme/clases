create database TiendaDB
on primary

(
	name = Almacen_carnetDB_dat,
	filename = 'C:\Users\Jose\Documents\SQL Databases\Almacen_carnetDB.mdf',
	size = 10,
	maxsize = 100,
	filegrowth = 3
)

log on

(
	name = Almacen_carnetDB_log,
	filename = 'C:\Users\Jose\Documents\SQL Databases\Almacen_carnetDB.ldf',
	size = 2,
	maxsize = 10,
	filegrowth = 2
)

use Almacen_carnetDB 
create table producto
(
	idproducto int not null,
	nombre varchar(30) not null,
)

use Almacen_carnetDB 
create table catalogo
(
	idprodcat int not null,
	idproducto int not null,
	idproveedor int not null,
	precio int not null,
)

use Almacen_carnetDB 
create table bodega
(
	idprodbod int not null,
	idprodcat int not null,
	fecha char(10) not null,
	precioc int not null,
	preciov int not null,
	unidades int not null,
)

use Almacen_carnetDB 
create table proveedor
(
	idproveedor int not null,
	nombre varchar(30) not null,
)

use Almacen_carnetDB 
create table detalleventa
(
	idventa int not null,
	idprodbod int not null,
	unidades int not null,
)

use Almacen_carnetDB 
create table venta
(
	idventa int not null,
	fecha char(10) not null,
	idcliente int not null,
)

use Almacen_carnetDB create table cliente
(
	idcliente int not null,
	nombre varchar(30) not null,
)

use Almacen_carnetDB
alter table producto
add constraint idproducto_pk primary key (idproducto)

use Almacen_carnetDB
alter table catalogo
add constraint idprodcat_pk primary key (idprodcat)

use Almacen_carnetDB
alter table proveedor
add constraint idproveedor_pk primary key (idproveedor)

use Almacen_carnetDB
alter table bodega
add constraint idprodbod_pk primary key (idprodbod)

use Almacen_carnetDB
alter table venta
add constraint idventa_pk primary key (idventa)

use Almacen_carnetDB
alter table cliente
add constraint idcliente_pk primary key (idcliente)

use Almacen_carnetDB
alter table catalogo
add constraint idproducto_fk foreign key (idproducto)
references producto(idproducto)

use Almacen_carnetDB
alter table catalogo
add constraint idproveedor_fk foreign key (idproveedor)
references proveedor(idproveedor)

use Almacen_carnetDB
alter table bodega
add constraint idprodcat_fk foreign key (idprodcat)
references catalogo(idprodcat)

use Almacen_carnetDB
alter table detalleventa
add constraint idprodbod_fk foreign key (idprodbod)
references bodega(idprodbod)

use Almacen_carnetDB
alter table detalleventa
add constraint idventa_fk foreign key (idventa)
references venta(idventa)

use Almacen_carnetDB
alter table venta
add constraint idcliente_fk foreign key (idcliente)
references cliente(idcliente)