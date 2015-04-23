Dim camisas As Integer
Dim monto As Single
 
Const precio = 25
 
camisas = InputBox("Ingrese la cantidad de camisas compradas:")
 
If camisas <= 4 Then
    monto = camisas * precio
Else
    monto = (4 * precio) + (camisas - 4) * precio * 0.9 'descuento del 10% a partir de la cuarta camisa
End If
 
MsgBox "El monto a pagar es de " & monto & " soles."
