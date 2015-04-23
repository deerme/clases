Dim monto As Double
Dim dia As String

Dim montoMayor As Double 'el monto de la mayor venta
Dim diaMayor As String 'el día que se realizó la mayor venta

montoMayor = 0
diaMayor = 0

Dim suma As Doubled
Dim cuenta As Double
Dim promedio As Double

suma = 0
dias = 20

For i = 1 To dias
    Do
        dia = UCase(InputBox("Ingrese el día de la venta " & i))
        If dia <> "LUNES" And dia <> "MARTES" And dia <> "MIERCOLES" And dia <> "MIÉRCOLES" And dia <> "JUEVES" And dia <> "VIERNES" Then
            MsgBox dia & " no es un día válido."
        End If
    Loop Until dia = "LUNES" Or dia = "MARTES" Or dia = "MIERCOLES" Or dia = "MIÉRCOLES" Or dia = "JUEVES" Or dia = "VIERNES"
    Do
        monto = InputBox("Ingrese el monto de la venta " & i)
        If monto > montoMayor Then
            montoMayor = monto
            diaMayor = dia
        End If
        suma = suma + monto
    Loop Until monto > 0
Next i

promedio = suma / dias

MsgBox _
"El monto diario promedio es de " & promedio & " soles." & vbNewLine & _
"El monto mayor vendido es de " & montoMayor & " soles, y se realizó el día " & diaMayor & "."
