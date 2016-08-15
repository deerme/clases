declare @nombre varchar(11)		-- define una variable
-- una variable que se quiere declarar empieza con @ y luego la forma de cómo se declara la variable
-- dos tipos de string, char(longitud) y varchar(longitud)

set @nombre = 'Juan'			-- asigna valor a una variable
select @nombre					-- permite leer el contenido de una variable

declare @numero1 int
declare @numero2 int

set @numero1 = 1
set @numero2 = 2

select @numero1+@numero2 as "Suma" -- as "Suma" crea un alias para el nombre de la columna