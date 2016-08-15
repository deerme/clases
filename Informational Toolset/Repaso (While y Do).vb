'Suma de dígitos:
suma = 0
ultimoDigito = 0

While numero > 0
    ultimoDigito = numero Mod 10
    suma = suma + ultimoDigito
    numero = Int(numero) \ 10
Wend
    
'Suma de dígitos pares:
suma = 0
ultimoDigito = 0

While numero > 0
    ultimoDigito = numero Mod 10
    If ultimoDigito Mod 2 = 0 Then
        suma = suma + ultimoDigito
    End If
    numero = Int(numero) \ 10
Wend
    
'Suma de dígitos impares:
suma = 0
ultimoDigito = 0

While numero > 0
    ultimoDigito = numero Mod 10
    If ultimoDigito Mod 2 <> 0 Then
        suma = suma + ultimoDigito
    End If
    numero = Int(numero) \ 10
Wend

'Suma de los primeros N dígitos:
cuenta = 1
suma = 0

    'Forma 1:
    While cuenta <= N
        suma = suma + cuenta
        cuenta = cuenta + 1
    Wend

    'Forma 2:
    While n > 0
        suma = suma + cuenta
        cuenta = cuenta + 1
        n = n - 1
Wend
    
'Número de dígitos:
cuenta = 0

While numero > 0
    cuenta = cuenta + 1
    numero = Int(numero) \ 10
Wend
    
'Número de dígitos pares:
cuenta = 0
ultimoDigito = 0

While numero > 0
    ultimoDigito = numero Mod 10
    If ultimoDigito Mod 2 = 0 Then
        cuenta = cuenta + 1
    End If
    numero = Int(numero) \ 10
Wend

'Número de dígitos impares:
cuenta = 0
ultimoDigito = 0

While numero > 0
    ultimoDigito = numero Mod 10
    If ultimoDigito Mod 2 <> 0 Then
        cuenta = cuenta + 1
    End If
    numero = Int(numero) \ 10
Wend

'Ingreso de variable con condición:
Do
    variable = InputBox("Ingrese el valor")
Loop Until (Condicion bien)

'Ingreso de variable con condición (y mensaje de error):
Do
    variable = InputBox("Ingrese el valor")
    If (Condicion mal) Then MsgBox "Error"
Loop Until (Condicion bien)
