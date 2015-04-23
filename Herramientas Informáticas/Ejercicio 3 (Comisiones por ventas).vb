Dim ventas As Single
Dim comision As Single
 
ventas = Val(InputBox("Ingrese el monto de las ventas"))
 
If ventas > 12000 Then
    If ventas > 20000 Then
        comision = 0.01 * 12000 + 0.02 * 8000 + 0.035 * (ventas - 20000)
    Else
        comision = 0.01 * 12000 + 0.02 * (ventas - 12000)
    End If
Else
    comision = 0.01 * ventas
End If
 
MsgBox "La comisión correspondiente es de " & comision & " soles."
