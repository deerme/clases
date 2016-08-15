-- Declarar cursor
DECLARE MI_CURSOR CURSOR SCROLL FOR
-- SCROLL permite mover el cursor en todas las direcciones
-- INSENSITIVE es solo para ir al siguiente (forward-only)
	SELECT * FROM COMPRA.Productos

-- Abrir cursor
OPEN MI_CURSOR

-- Imprimir el primer registro
FETCH FIRST FROM MI_CURSOR

-- Imprimir el tercer registro
FETCH ABSOLUTE 3 FROM MI_CURSOR

-- Imprimir el último registro
FETCH LAST FROM MI_CURSOR

-- Imprimir el siguiente registro
FETCH NEXT FROM MI_CURSOR

-- Cerrar cursor
CLOSE MI_CURSOR

-- Liberar memoria de cursor
DEALLOCATE MI_CURSOR
