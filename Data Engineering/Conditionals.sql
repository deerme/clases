-- Previamente crear la base de datos BDEjemplo (settings default)
-- Luego añadir datos a COMPRA.Productos y verificar dependencias

USE BDEjemplo
GO

-- Declarar variables @MX y @MN como decimales (siempre lleva @)
DECLARE @MX DECIMAL, @MN DECIMAL
SELECT  @MX = MAX(PRECIOUNIDAD),
		@MN = MIN(PRECIOUNIDAD)

FROM COMPRA.Productos

-- Imprimir el mayor precio y el menor precio
PRINT 'MAYOR PRECIO:'+STR(@MX) PRINT 'MENOR PRECIO:'+STR(@MN)
-- @MX no es una cadena, STR(@MX) lo vuelve una cadena

--------------------------------------------------------------------

DECLARE @IDEMP INT, @CANTIDAD INT

-- Recuperar la cantidad de pedidos del empleado de código 6
-- Primero añadir datos a VENTA.PedidosCabe y verificar dependencias

SET @IDEMP = 6
SELECT @CANTIDAD = COUNT(*)

FROM VENTA.PedidosCabe WHERE idEmpleado = @IDEMP

-- Evalúa el valor de cantidad

IF @CANTIDAD = 0
	PRINT 'EL EMPLEADO NO HA REALIZADO NINGÚN PEDIDO'
ELSE IF @CANTIDAD = 1
	PRINT 'EL EMPLEADO HA REGISTRADO UN PEDIDO, CONTINÚE TRABAJANDO'
ELSE
	PRINT 'EL EMPLEADO HA REGISTRADO '+STR(@CANTIDAD)+' PEDIDOS'
GO
-- El GO sirve para separar la consulta
