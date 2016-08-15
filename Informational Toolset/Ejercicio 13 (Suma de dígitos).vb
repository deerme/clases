'Este script lo escribí yo y no es exactamente parte de la clase
'Además hace algunas cosas que yo hago distinto a la clase
'Acá vuelvo a usar Int(num) \ 10 para evitar el problema de que por ejemplo 1.5 \ 10 = 2

Dim numero As Long 'Declaro como Long para que el usuario escriba el número que le de la gana
Dim suma As Long 'Bis
Dim ultimoDigito As Integer
 
suma = 0
ultimoDigito = 0
 
numero = InputBox("Ingrese un número natural:")
tipo = UCase(InputBox(num & vbNewLine & "Suma de pares, impares, o todos los digitos?"))
 
If tipo = "PARES" Then
    While numero > 0
        ultimoDigito = numero Mod 10
        If ultimoDigito Mod 2 = 0 Then
            suma = suma + ultimoDigito
        End If
        numero = Int(numero) \ 10
    Wend
   
    MsgBox "La suma de los dígitos pares es " & suma & "."
 
Else
    If tipo = "IMPARES" Then
        While numero > 0
            ultimoDigito = numero Mod 10
            If ultimoDigito Mod 2 <> 0 Then
                suma = suma + ultimoDigito
            End If
            numero = Int(numero) \ 10
        Wend
       
        MsgBox "La suma de los dígitos impares es " & suma & "."
       
    Else
        While numero > 0
            ultimoDigito = numero Mod 10
            suma = suma + ultimoDigito
            numero = Int(numero) \ 10
        Wend
       
        'La única diferencia entonces es que para pares o impares se chequea que
        'los digitos sean pares o impares para considerarlos como parte de la suma.
       
        'El chequeo es un If que dice, si es par o impar este último dígito,
        'entonces se procede el algoritmo. Si no, se va al siguiente dígito.
       
        MsgBox "La suma de todos los dígitos es " & suma & "."
       
    End If
End If
