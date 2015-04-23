Dim nombre As String
Dim tipo As Integer
Dim deposito As Double
Dim meses As Double
Dim interes As Double
Dim interesTotal As Double

nombre = InputBox("Ingrese su nombre")

Do
    tipo = InputBox("Ingrese el tipo de depósito (1, 2, 3)")
    If tipo < 1 Or tipo > 3 Then MsgBox "El tipo de depósito especificado no existe."
Loop Until tipo >= 1 And tipo <= 3

Do
    deposito = InputBox("Ingrese el monto del depósito (>= 10,000 soles)")
    If deposito < 10000 Then MsgBox "El monto del depósito es muy pequeño."
Loop Until deposito >= 10000

Do
    meses = InputBox("Ingrese el número de meses del depósito")
    If meses < 1 Then MsgBox "El número de meses es muy pequeño para generar intereses."
Loop Until meses >= 1

If tipo = 1 Then
    If deposito < 500000 Then
        interes = deposito * 0.004
        MsgBox "Se le aplicará una tasa del 0.4% mensual por " & meses & " meses."
    Else
        interes = deposito * 0.006
        MsgBox "Se le aplicará una tasa del 0.6% mensual por " & meses & " meses."
    End If
End If

If tipo = 2 Then
    If deposito < 500000 Then
        interes = deposito * (0.08 / 12)
        MsgBox "Se le aplicará una tasa del 8% anual por " & meses & " meses."
    Else
        interes = deposito * (0.1 / 12)
        MsgBox "Se le aplicará una tasa del 10% anual por " & meses & " meses."
    End If
End If

If tipo = 3 Then
    interes = deposito * (0.1 / 12)
    MsgBox "Se le aplicará una tasa del 10% anual por " & meses & " meses."
End If
   
interesTotal = interes * meses

MsgBox nombre & ", el interés que ganará luego de " & meses & " meses es de " & interesTotal & " soles."
