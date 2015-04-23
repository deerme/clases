Dim num As Double
Dim cuenta As Double
Dim stringDivisores As String

cuenta = 0

Do
    num = InputBox("Ingrese un número positivo")
Loop Until num > 0

For i = 1 To num
    If num Mod i = 0 Then
        cuenta = cuenta + 1
        stringDivisores = stringDivisores & ", " & i
    End If
Next i

MsgBox _
"Los divisores de " & num & " encontrados son" & stringDivisores & "." & vbNewLine & _
"Hay " & cuenta & " divisores."
