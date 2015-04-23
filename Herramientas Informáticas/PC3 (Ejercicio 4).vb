'Este no es el solucionario; es como lo hice yo.

Dim sector As Byte
Dim entradas As Double
Dim total As Double

Const precio1 = 45 'Precio del sector 1
Const precio2 = 80 'Precio del sector 2
Const precio3 = 220 'Precio del sector 3
Const precio4 = 300 'Precio del sector 4

Do
    sector = Val(InputBox("Ingrese el código del sector que desea (1, 2, 3, 4)", "TeleTicket: Entradas"))
    If sector < 1 Or sector > 4 Then MsgBox "El código del sector especificado no existe."
Loop Until sector >= 1 And sector <= 4
  
Do
    entradas = Val(InputBox("Ingrese el número de entradas que desea", "TeleTicket: Entradas"))
    If entradas <= 0 Then MsgBox "El número de entradas especificado es muy pequeño."
Loop Until entradas > 0

If sector = 1 Then total = precio1 * entradas
If sector = 2 Then total = precio2 * entradas
If sector = 3 Then total = precio3 * entradas
If sector = 4 Then total = precio4 * entradas

MsgBox "Total a pagar: " & total & " soles"
