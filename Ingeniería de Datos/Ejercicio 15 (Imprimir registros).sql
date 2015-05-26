-- Declarar variables
DECLARE @ID VARCHAR(5), @NOMBRE VARCHAR(50), @PAIS VARCHAR(50)

-- Declarar el cursor
DECLARE MI_CURSOR CURSOR FOR
SELECT	C.IdCliente,
		C.NomCliente,
		P.NombrePais
FROM VENTA.Clientes C
JOIN VENTA.Paises P ON C.Idpais = P.Idpais

-- Abrir
OPEN MI_CURSOR

-- Leer el primer registro
FETCH MI_CURSOR INTO @ID, @NOMBRE, @PAIS

-- Mientras pueda leer el registro
WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Imprimir el registro
		PRINT @ID + ',' + @NOMBRE + ',' + @PAIS
		-- Leer el registro siguiente
		FETCH MI_CURSOR INTO @ID, @NOMBRE, @PAIS
		-- Cuando el siguiente sea vacío, el @@FETCH_STATUS se vuelve -1
	END

-- Cerrar el cursor
CLOSE MI_CURSOR

-- Liberar el cursor
DEALLOCATE MI_CURSOR

GO
