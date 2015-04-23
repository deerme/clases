#-----------------------------------
# Bucles
#-----------------------------------

#-------------------------
# Bucles implícitos
#-------------------------

# Tienen la siguiente forma

x <- seq(-10, 10, length = 1000) #1000 elementos de -10 a 10
y <- sin(x^2) / x #procesa y transforma los 1000 elementos
plot(x, y, type = 'l')

#--------------
# Bucle for
#--------------

# Tiene la forma 
# for (var in seq) expr

# Ejemplo: Graficar y = x^j , la variable x va de  [0, 1] 
# j va de 1:8
x <- seq(0, 1, length = 101)
pows <- 1:8
pows
# Primero se dibujan los ejes, type='n' se usa para esta finalidad

plot(x, x, xlab = 'x', ylab = 'y', type = 'n')

# lines(x, y) añade líneas al gráfico
for (j in pows) lines(x, x^j)


#-----------------
# while and repeat
#-----------------

# continua un ciclo mientras una expresión siga siendo verdadera


# ejemplo: cálculo de la raíz cuadrada por el método de Newton

y <- 1234
x <- y/2
while (abs(x^2 - y) > 1e-10) { #notacion cientifica, 1 E-10
  x <- (x + y / x) / 2
  cat('x: ', x, '\n')
}
x; x^2

