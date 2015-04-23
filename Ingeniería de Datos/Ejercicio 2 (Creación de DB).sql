create database PruebaBD
on primary -- especificación del archivo primario

(
	name = pruebaBD_dat,
	filename = 'C:\Users\Jose\Documents\SQL Databases\pruebaBD.mdf',
	size = 5,
	maxsize = 10,
	filegrowth = 1
)

log on --especificación del archivo de transacciones

(
	name = pruebaBD_log,
	filename = 'C:\Users\Jose\Documents\SQL Databases\pruebaBD.ldf',
	size = 2,
	maxsize = 10,
	filegrowth = 2
)

-- luego de crear la base de datos se debe actualizar la lista
-- right-click, Refresh