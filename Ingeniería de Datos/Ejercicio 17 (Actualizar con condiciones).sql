/* Actualizar e insertar datos */

USE BDEjemplo

DECLARE @CODIGO_PAIS VARCHAR(3)
DECLARE @NOMBRE_PAIS VARCHAR(50)

SET @CODIGO_PAIS = '99'
SET @NOMBRE_PAIS = 'España'

IF EXISTS(SELECT * FROM VENTA.Paises WHERE Idpais = @CODIGO_PAIS)
	BEGIN
		PRINT 'Actualizando...'
		UPDATE VENTA.Paises
		SET NombrePais = @NOMBRE_PAIS
		WHERE Idpais = @CODIGO_PAIS
	END
ELSE
	BEGIN
		PRINT 'Insertando...'
		INSERT INTO VENTA.Paises VALUES (@CODIGO_PAIS, @NOMBRE_PAIS)
	END
GO

/* Consulta condicional con CASE, tratamiento */

USE BDEjemplo

SELECT (CASE RRHH.Empleados.Tratamiento
			WHEN 'SRTA.' THEN 'Señorita'
			WHEN 'SRA.' THEN 'Señora'
			WHEN 'SR.' THEN 'Señor'
			WHEN 'DR.' THEN 'Doctor'
			ELSE 'No tiene tratamiento'
		END) AS 'Tratamiento', apeEmpleado, nomEmpleado
	
FROM RRHH.Empleados
ORDER BY 1
GO

/* Consulta condicional con CASE, stock */

USE BDEjemplo

DECLARE @STOCK INTEGER = 100

SELECT * FROM (
SELECT nomProducto, precioUnidad, UniEnExistencia,
	'Estado' = (CASE
					WHEN UniEnExistencia > @STOCK THEN 'Stockeado'
					WHEN UniEnExistencia = @STOCK THEN 'Límite'
					WHEN UniEnExistencia < @STOCK THEN 'Haga una solicitud'
				END)
FROM COMPRA.Productos) AS R

/* Actualizar datos de acuerdo a condiciones */

USE BDejemplo

DECLARE @ID INTEGER
DECLARE @NOMBRE VARCHAR(50)

WHILE EXISTS (
	SELECT *
	FROM COMPRA.Productos
	WHERE UniEnExistencia = 0
)

BEGIN

	SELECT TOP 1 @ID = P.IdProducto, @NOMBRE = P.nomProducto
	FROM COMPRA.Productos P
	WHERE UniEnExistencia = 0

	UPDATE COMPRA.Productos
	SET UniEnExistencia = 1000
	WHERE IdProducto = @ID
	
	PRINT 'Producto:' + @NOMBRE + ' se actualizó el stock'
	CONTINUE
END
