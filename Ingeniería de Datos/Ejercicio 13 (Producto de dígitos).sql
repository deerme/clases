-- Hallar el producto de los dígitos de 12345
DECLARE @N INTEGER, @D INTEGER, @PD INTEGER
SET @N = 12345
SET @PD = 1

WHILE (@N != 0)
	BEGIN
		SET @D = @N % 10
		SET @PD = @PD * @D
		SET @N = @N / 10
	END

PRINT STR(@PD)

-- Hallar el producto consecutivo de los dígitos de 12345
SET @N = 12345
SET @PD = 1

WHILE (@N != 0)
	BEGIN
		SET @D = @N % 10
		SET @PD = @PD * @D
		SET @N = @N / 10
	END

WHILE (@PD > 10)
	BEGIN
		SET @N = @PD
		CONTINUE -- Continuar loop anterior
	END

PRINT STR(@PD)
