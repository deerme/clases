Dim practicas As Single 'promedio
Dim parcial As Single
Dim final As Single
Dim nota As Single 'promedio
 
Dim alumnos As Integer
Dim counter As Integer
 
Const notaMin = 0
Const notaMax = 20
Const notaApr = 11
 
counter = 1
alumnos = Val(InputBox("Ingrese el número de alumnos."))
 
While counter <= alumnos
 
    practicas = InputBox("Alumno " & counter & ": Ingrese su promedio de prácticas.")
    While practicas < notaMin Or practicas > notaMax
        practicas = InputBox("Ingrese su promedio de prácticas, nuevamente.", "ERROR")
    Wend
       
    parcial = InputBox("Alumno " & counter & ": Ingrese la nota de su parcial.")
    While parcial < notaMin Or parcial > notaMax
        parcial = InputBox("Ingrese la nota de su parcial, nuevamente.", "ERROR")
    Wend
   
    final = InputBox("Alumno " & counter & ": Ingrese la nota de su final.")
    While final < notaMin Or final > notaMax
        final = InputBox("Ingrese la nota de su final, nuevamente.", "ERROR")
    Wend
   
    nota = (practicas + parcial + final) / 3
    counter = counter + 1
 
    If nota <= notaApr Then
        MsgBox "Su promedio final es de " & nota & ". Usted ha desaprobado el curso."
    Else
        MsgBox "Su promedio final es de " & nota & "."
    End If
   
Wend
