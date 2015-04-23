Dim numero As Long
Dim suma As Integer
 
numero = InputBox("Ingrese un número entero de cinco dígitos", "Suma de cinco dígitos impares")
 
If numero >= 10000 And numero <= 99999 Then
    dig1 = (numero \ 10000)
    dig2 = (numero \ 1000) - (numero \ 10000) * 10
    dig3 = (numero \ 100) - (numero \ 1000) * 10
    dig4 = (numero \ 10) - (numero \ 100) * 10
    dig5 = (numero \ 1) - (numero \ 10) * 10
 
    If dig1 Mod 2 = 1 Then
        suma = suma + dig1
    Else: dig1 = ""
    End If
   
    If dig2 Mod 2 = 1 Then
        suma = suma + dig2
    Else: dig2 = ""
    End If
   
    If dig3 Mod 2 = 1 Then
        suma = suma + dig3
    Else: dig3 = ""
    End If
   
    If dig4 Mod 2 = 1 Then
        suma = suma + dig4
    Else: dig4 = ""
    End If
   
    If dig5 Mod 2 = 1 Then
        suma = suma + dig5
    Else: dig5 = ""
    End If
 
MensajeSuma = MsgBox( _
"Los dígitos impares son: " & dig1 & " " & dig2 & " " & dig3 & " " & dig4 & " " & dig5 _
& vbNewLine & _
"La suma de los dígitos impares es " & suma & "." _
,vbInformation, "Operación realizada con éxito")
 
Else
    MensajeError = MsgBox( _
    "El número ingresado:" & vbNewLine & "No es entero, no tiene cinco dígitos, o tiene ceros a la izquierda." _
    ,vbExclamation,"Error de ingreso de data")
   
End If
