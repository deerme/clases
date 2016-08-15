Dim num As Double
Dim cuenta As Double
Dim stringMultiplos As String

cuenta = 0

For i = 1 To 20
Do
    num = InputBox("(" & i & "/20) Ingrese un número positivo")
    If num Mod 5 = 0 Then
        cuenta = cuenta + 1
        stringMultiplos = stringMultiplos & ", " & num
    End If
Loop Until num > 0
Next i

MsgBox _
"Los múltiplos de cinco encontrados son" & stringMultiplos & "." & vbNewLine & _
"Hay " & cuenta & " múltiplos."
