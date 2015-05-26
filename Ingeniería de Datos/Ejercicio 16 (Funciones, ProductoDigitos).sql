-- Crear una función que calcule el precio promedio
CREATE FUNCTION DBO.PRECIOPROMEDIO() RETURNS DECIMAL
-- DBO significa que se crea dentro del propietario
-- el valor que retorna es de tipo decimal

BEGIN
	-- Declara la variable promedio, decimal
	DECLARE @PROM DECIMAL
	-- Se halla el promedio
	SELECT @PROM = AVG(PRECIOUNIDAD)
	FROM COMPRA.Productos
	-- Se retorna el valor de la variable
	RETURN @PROM
END
GO

-- Una vez creada, aparecerá en: 
-- Programmability > Functions > Scalar-valued Functions
-- Programación > Funciones > Funciones escalares

-- Convertir el algoritmo Producto de dígitos a una función
CREATE FUNCTION DBO.PRODUCTODIGITOS(@N INTEGER) RETURNS INTEGER
BEGIN
	DECLARE @D INTEGER, @PD INTEGER

	SET @PD = 1

	WHILE (@N != 0)
		BEGIN
			SET @D = @N % 10
			SET @PD = @PD * @D
			SET @N = @N / 10
		END

	RETURN @PD
END
GO

PRINT DBO.PRODUCTODIGITOS(12345)
