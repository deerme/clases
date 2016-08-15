Dim sexo As String
Dim tiempo As String 'en minutos
Dim n As Double 'número de boletas

Dim cuentaA As Double 'número de boletas de varones con tiempo de atención mayor a 35 minutos
Dim cuentaBM As Double 'número de boletas de varones
Dim cuentaBF As Double 'número de boletas de damas
Dim cuentaC As Double 'tiempo total de todas las boletas

Do
    n = Val(InputBox("Ingrese el número de boletas"))
    If n <= 0 Then MsgBox "Número de boletas muy pequeño."
Loop Until n > 0

While n > 0
    Do
        sexo = UCase(InputBox("Ingrese su sexo (M o F)"))
        If sexo <> "M" And sexo <> "F" Then MsgBox "Solo se acepta M o F."
    Loop Until sexo = "M" Or sexo = "F"
    
    Do
        tiempo = UCase(InputBox("Ingrese el tiempo de espera de atención (minutos)"))
        If tiempo <= 0 Then MsgBox "Tiempo de atención muy pequeño."
    Loop Until tiempo > 0
    
    'Cuenta las boletas de varones con espera mayor a 35 minutos
    If tiempo > 35 And sexo = "M" Then cuentaA = cuentaA + 1
    
    'Cuenta el número de boletas de varones
    If sexo = "M" Then cuentaBM = cuentaBM + 1
    
    'Cuenta el número de boletas de damas
    If sexo = "F" Then cuentaBF = cuentaBF + 1
    
    'Cuenta el tiempo total de todas las boletas
    cuentaC = cuentaC + tiempo
    
    'Cada vuelta se resta 1, así cuando n = 0, se acaba el bucle y las boletas
    n = n - 1
Wend

MsgBox _
"Boletas de varones con espera mayor a 35 minutos: " & cuentaA & vbNewLine & _
"Porcentaje de boletas de damas: " & (cuentaBF / (cuentaBM + cuentaBF)) * 100 & "%" & vbNewLine & _
"Tiempo total de todas las boletas: " & cuentaC & " minutos"
