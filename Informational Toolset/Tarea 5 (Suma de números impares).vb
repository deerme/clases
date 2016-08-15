Dim num As Double
Dim suma As Double
Dim stringImpares As String

suma = 0

For i = 1 To 10
    Do
        num = InputBox("(" & i & "/10) Ingrese un número mayor que 0")
        If num Mod 2 <> 0 Then
            suma = suma + num
            stringImpares = stringImpares & ", " & num
        End If
    Loop Until num > 0
Next i

MsgBox _
"Los números impares encontrados son" & stringImpares & "." & vbNewLine & _
"La suma de estos es " & suma & "."
