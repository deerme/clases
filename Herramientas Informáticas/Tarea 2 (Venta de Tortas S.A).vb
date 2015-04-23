Dim dia As String

Dim qTorta1 As Integer
Dim qTorta2 As Integer
Dim qTorta3 As Integer

Const pTorta1 = 30
Const pTorta2 = 35
Const pTorta3 = 50

Dim torta1 As Double
Dim torta2 As Double
Dim torta3 As Double

Dim total As Double

dia = InputBox("Ingrese el día por registrar:")

Do: qTorta1 = InputBox("Ingrese el monto de tortas delicia vendidas:")
Loop Until qTorta1 >= 0

Do: qTorta2 = InputBox("Ingrese el monto de tortas tres leches vendidas:")
Loop Until qTorta2 >= 0

Do: qTorta3 = InputBox("Ingrese el monto de tortas selva negra vendidas:")
Loop Until qTorta3 >= 0

torta1 = pTorta1 * qTorta1
torta2 = pTorta2 * qTorta2
torta3 = pTorta3 * qTorta3

total = torta1 + torta2 + torta3

MsgBox "Día: " & vbNewLine & dia & vbNewLine _
& vbNewLine & "Ventas:" _
& vbNewLine & "Tortas delicia (" & qTorta1 & ") por S/. " & torta1 _
& vbNewLine & "Tortas tres leches (" & qTorta2 & ") por S/. " & torta2 _
& vbNewLine & "Tortas selva negra (" & qTorta3 & ") por S/. " & torta3 _
& vbNewLine & vbNewLine & "El total de las ventas es de S/. " & total
