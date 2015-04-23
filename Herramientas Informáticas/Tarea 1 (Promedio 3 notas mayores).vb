Dim nota1 As Single
Dim nota2 As Single
Dim nota3 As Single
Dim nota4 As Single
Dim notaMin As Single
Dim promedio As Single

Do: nota1 = Val(InputBox("Ingrese la nota 1"))
Loop Until nota1 >= 0 And nota1 <= 20

notaMin = nota1

Do: nota2 = Val(InputBox("Ingrese la nota 2"))
Loop Until nota2 >= 0 And nota2 <= 20

If nota2 < notaMin Then notaMin = nota2

Do: nota3 = Val(InputBox("Ingrese la nota 3"))
Loop Until nota3 >= 0 And nota3 <= 20

If nota3 < notaMin Then notaMin = nota3

Do: nota4 = Val(InputBox("Ingrese la nota 4"))
Loop Until nota4 >= 0 And nota4 <= 20

If nota4 < notaMin Then notaMin = nota4

promedio = (nota1 + nota2 + nota3 + nota4 - notaMin) / 3

MsgBox "El promedio de las tres notas mayores es " & promedio & "."
