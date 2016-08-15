Dim horasT As Single
Dim subtotal As Single
Dim bonificacion As Single 'monto de bonificación
Dim total As Single 'total a pagar
 
Const tarifa = 8 'tarifa por hora
 
horasT = InputBox("Ingrese la cantidad de horas trabajadas:")
 
If horasT >= 15 Then
    If horasT > 20 Then
        If horasT > 30 Then
            If horasT <= 40 Then
                subtotal = horasT * tarifa
                bonificacion = subtotal * 0.2
                total = subtotal + bonificacion
            Else
                subtotal = horasT * tarifa
                bonificacion = subtotal * 0.5
                total = subtotal + bonificacion
            End If
        Else
            subtotal = horasT * tarifa
            bonificacion = subtotal * 0.15
            total = subtotal + bonificacion
        End If
    Else
        subtotal = horasT * tarifa
        bonificacion = subtotal * 0.1
        total = subtotal + bonificacion
    End If
 
Else
    subtotal = horasT * tarifa
    bonificacion = 0
    total = horasT * tarifa
   
End If
    MsgBox _
    "Subtotal: S/. " & subtotal & vbNewLine & _
    "Bonificación: S/. " & bonificacion & vbNewLine & _
    "----------------------------" & vbNewLine & _
    "Total a pagar: S/. " & total
