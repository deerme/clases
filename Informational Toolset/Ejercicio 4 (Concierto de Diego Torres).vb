Dim ubicacion As Variant
Dim entradas As Integer
Dim subtotal As Single
Dim descuento As Single
Dim total As Single
 
Const precio1 = 108
Const precio2 = 63
Const precio3 = 40
Const precio4 = 18
 
Const platinium = 1
Const vipcentral = 2
Const preferencia = 3
Const standup = 4
 
ubicacion = UCase(InputBox("Ingrese la ubicación", "Concierto de Diego Torres"))
entradas = InputBox("Ingrese el número de entradas", "Concierto de Diego Torres")
 
If ubicacion = platinium Or ubicacion = "PLATINIUM" Then
    If entradas < 4 Then
        subtotal = precio1 * entradas
        'no hay descuento
       total = subtotal
    Else
        subtotal = precio1 * entradas
        descuento = 0.1 * subtotal 'descuento del 10%
       total = subtotal - descuento
    End If
Else
    If ubicacion = vipcentral Or ubicacion = "VIP CENTRAL" Then
        subtotal = precio2 * entradas
        descuento = precio2 * (entradas \ 4) 'descuento cada 4 entradas
       total = subtotal - descuento
    Else
        If ubicacion = preferencia Or ubicacion = "PREFERENCIA" Then
            If entradas <= 5 Then
                subtotal = precio3 * entradas
                'no hay descuento
               total = subtotal
            Else
                subtotal = precio3 * entradas
                descuento = 0.05 * subtotal 'descuento del 5%
               total = subtotal - descuento
            End If
        Else
            If ubicacion = standup Or ubicacion = "STAND UP" Then
                subtotal = precio4 * entradas
                'no hay descuento
               total = subtotal
            End If
        End If
    End If
End If
           
MsgFinal = MsgBox( _
"Subtotal: " & subtotal & vbNewLine & _
"Descuento: " & descuento & vbNewLine & vbNewLine & _
"Total: " & total, , "Resultado")
