'En clase hicimos un programa que cuenta el número de dígitos de un número
'Aquí hago uno que cuenta todos los dígitos, otro los pares, y otro los impares

'Todos los dígitos:
Dim numero As Integer
Dim cuenta As Double
 
numero = InputBox("Ingrese un número entero:")
 
cuenta = 1

While numero > 0
    cuenta = cuenta + 1
    numero = Int(numero) \ 10
Wend
 
MsgBox "El número de dígitos que tiene este número es " & cuenta & "."

'Los dígitos pares:
Dim numero As Integer
Dim ultimoDigito As Integer
Dim cuenta As Double
 
numero = InputBox("Ingrese un número entero:")
 
cuenta = 1

While numero > 0
    ultimoDigito = numero Mod 10
    If ultimoDigito Mod 2 = 0 Then
        cuenta = cuenta + 1
    End If
    numero = Int(numero) \ 10
Wend
 
MsgBox "El número de dígitos pares que tiene este número es " & cuenta & "."

'Los dígitos impares:
Dim numero As Integer
Dim ultimoDigito As Integer
Dim cuenta As Double
 
numero = InputBox("Ingrese un número entero:")
 
cuenta = 1

While numero > 0
    ultimoDigito = numero Mod 10
    If ultimoDigito Mod 2 <> 0 Then
        cuenta = cuenta + 1
    End If
    numero = Int(numero) \ 10
Wend
 
MsgBox "El número de dígitos impares que tiene este número es " & cuenta & "."
