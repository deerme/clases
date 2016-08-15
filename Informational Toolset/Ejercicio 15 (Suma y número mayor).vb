Dim i As Integer
Dim suma As Double
Dim num As Double
Dim mayor As Double 'el mayor de los números ingresados

mayor = 0
suma = 0

For i = 1 To 5
    num = Val(InputBox("Ingrese el número " & i))
    If num > mayor Then mayor = num
    suma = suma + num
Next i

MsgBox _
"El mayor número es " & mayor & vbNewLine & _
"La suma de los números es " & suma
