DECLARE @CONTADOR INTEGER
SET @CONTADOR = 0

WHILE (@CONTADOR < 100)
	BEGIN
		SET @CONTADOR = @CONTADOR + 1
		IF (@CONTADOR % 2 = 0)
			PRINT CAST(@CONTADOR AS VARCHAR) + ' ES PAR'
		ELSE
			PRINT CAST(@CONTADOR AS VARCHAR) + ' ES IMPAR'
	END

-- CAST sirve para cambiar el tipo de variable temporalmente
-- se puede promover un INTEGER a un FLOAT
-- se puede degradar un FLOAT a un INTEGER
