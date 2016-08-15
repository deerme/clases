/* Control de errores con catch y try */

BEGIN TRY

	DECLARE @DIVIDENDO INTEGER = 100
	DECLARE @DIVISOR INTEGER = 0
	DECLARE @RESULTADO INTEGER

	SET @RESULTADO = @DIVIDENDO / @DIVISOR
	-- Esta instrucción arrojará un error si @DIVISOR es 0

	-- El try asume que no hay error
	PRINT @RESULTADO

END TRY

-- Creamos un catch para diseñar la estrategia para corregir/explicar el error
BEGIN CATCH

	IF (@DIVISOR = 0)
		PRINT 'No se puede dividir entre 0'
	ELSE
		PRINT 'Error'

END CATCH

-- El catch puede automáticamente arrojar el error de la consola

-- PRINT ERROR_MESSAGE() imprime el mensaje
-- PRINT ERROR_STATE() imprime la severidad del error

-- Los errores tienen identificadores
-- Si se encuentra el error 547, se puede usar un IF

-- IF @@ERROR = 547 PRINT 'No se puede eliminar la tupla'

/* Creación de errores */

DECLARE @TIPO INTEGER = 1
DECLARE @CLASIFICACION INTEGER = 3

IF (@TIPO = 1 AND @CLASIFICACION = 3)
	RAISERROR ('El tipo no puede valer 1 y la clasificación 3', 16, 1)
	-- El 16 indica la severidad y el 1 el estado
