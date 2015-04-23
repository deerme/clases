Dim tuercasP As Integer 'Tuercas producidas
Dim tuercasD As Integer 'Tuercas defectuosas
Dim eficiencia As String
 
Const condicion1 = 9500
Const condicion2 = 150
 
tuercasP = Val(InputBox("Ingrese el número de tuercas producidas"))
tuercasD = Val(InputBox("Ingrese el número de tuercas defectuosas"))
 
If tuercasP >= condicion1 Then
    If tuercasD <= condicion2 Then
        eficiencia = "tipo 4"
    Else
        eficiencia = "tipo 3"
    End If
Else
    If tuercasD <= condicion2 Then
        eficiencia = "tipo 2"
    Else
        eficiencia = "tipo 1"
    End If
End If
 
MsgBox "La eficiencia del operario es del " & eficiencia
