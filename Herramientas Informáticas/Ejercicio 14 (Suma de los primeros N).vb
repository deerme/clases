Dim N As Double
Dim Cuenta As Double
Dim Suma As Double

N = InputBox("Ingrese N")
    
Cuenta = 1
Suma = 0
    
If N > 0 Then
    
    While Cuenta <= N
        Suma = Suma + Cuenta
        Cuenta = Cuenta + 1
    Wend
    
MsgBox "La suma de los primeros N números positivos es " & Suma & "."
    
Else: MsgBox "El número ingresado es negativo."

End If
