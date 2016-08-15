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
DECLARE @N INTEGER, @D INTEGER, @PD INTEGER
SET @N = 12345
SET @PD = 1

WHILE (@N != 0)
	BEGIN
		SET @D = @N % 10
		SET @PD = @PD * @D
		SET @N = @N / 10
		IF (@PD >= 10)
			SET @N = @PD
			WHILE (@N != 0)
				BEGIN
					SET @D = @N % 10
					SET @PD = @PD * @D
					SET @N = @N / 10
				END
	END

PRINT STR(@PD)
