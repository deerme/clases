'Este no es el solucionario; es como lo hice yo.

Dim kilos As Double 'Kilos de manzana
Dim subtotal As Double 'Monto total
Dim descuento As Double 'Porcentaje de descuento y luego el monto a descontar
Dim total As Double 'Total a pagar

Const precio = 8 'Soles por kilo de manzana

Do
    kilos = Val(InputBox("Ingrese cuántos kilos de manzana desea comprar", "Frutería"))
    If kilos < 0 Then MsgBox "Número fuera de rango."
Loop Until kilos >= 0

If kilos >= 0 And kilos <= 2 Then
    descuento = 0 'Un poco redundante pero lo pongo porque así está en la tabla
    MsgBox "No se le aplicará ningún descuento"
End If

If kilos >= 2.01 And kilos <= 5 Then
    descuento = 0.1
    MsgBox "Se le aplicará un descuento del 10%"
End If

If kilos >= 5.01 And kilos <= 10 Then
    descuento = 0.2
    MsgBox "Se le aplicará un descuento del 20%"
End If

If kilos > 10 Then
    descuento = 0.3
    MsgBox "Se le aplicará un descuento del 30%"
End If

subtotal = precio * kilos
descuento = descuento * subtotal 'Aquí el porcentaje de descuento se convierte en el monto a descontar
total = subtotal - descuento

MsgBox _
"Monto total: " & subtotal & " soles" & vbNewLine & _
"Descuento: (" & descuento & " soles)" & vbNewLine & vbNewLine & _
"Total a pagar: " & total & " soles"
