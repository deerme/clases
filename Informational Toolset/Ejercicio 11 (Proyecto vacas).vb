Dim vaca As String 'nombre de la vaca
Dim oro As Integer 'medallas de oro obtenidas
Dim plata As Integer 'medallas de plata obtenidas

Dim nuevo As String 'si el usuario desea empezar de nuevo
    
'información de la vaca rechazada con más medallas de oro
Dim oroMax As Integer
Dim vacaMax As String

oroMax = 0
vacaMax = ""

Dim aceptadas As Integer
Dim rechazadas As Integer

aceptadas = 0
rechazadas = 0
    
Do

    vaca = InputBox("Ingrese el nombre de la vaca")
    
    Do
        oro = InputBox("Ingrese el número de medallas de oro obtenidas")
        If oro <= 0 Then MsgBox "Número muy pequeño"
    Loop Until oro > 0
    
    Do
        plata = InputBox("Ingrese el número de medallas de plata obtenidas")
        If plata <= 0 Then MsgBox "Número muy pequeño"
    Loop Until plata > 0
    
    If oro >= 10 And plata >= 15 Then
        MsgBox vaca & " podrá concursar"
        aceptadas = aceptadas + 1
    Else
        MsgBox vaca & " no podrá concursar"
        rechazadas = rechazadas + 1
        If oro > oroMax Then
            oroMax = oro
            vacaMax = vaca
        End If
    End If

    Do: nuevo = UCase(InputBox("¿Desea ingresar a otra vaca? (SI/NO)"))
    Loop Until nuevo = "SI" Or nuevo = "NO"
    
Loop Until nuevo = "NO"

MsgBox _
"La vaca rechazada con el mayor número de medallas de oro:" & vbNewLine & _
vacaMax & ", con " & oroMax & " medallas de oro."

MsgBox _
"El porcentaje de vacas aceptadas en el concurso es el " & _
(aceptadas / (aceptadas + rechazadas) * 100) & "%"
