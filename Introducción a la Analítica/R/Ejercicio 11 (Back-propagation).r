#cambiar el directorio a uno escribible
setwd("D:/RStudioWD")

#instalar el paquete neuralnet
install.packages("neuralnet")

#ver si se instaló grid y MASS
library(neuralnet)

#crear un vector XOR llamado to
to <- c(0,1,1,0)

#crear una matriz 4x2 y les pone encabezados
ti = matrix(c(0,0,1,1,0,1,0,1), nrow = 4, ncol = 2, dimnames = list(c(1,2,3,4), c("x1", "x2")))

#unir ambos conjuntos de datos ti y to (to entra como nueva columna)
tdata = cbind(ti,to)

#imprimir la tabla de verdad XOR
tdata

#crear la red neuronal con salida to y entrada x1 y x2, datos de tdata
net = neuralnet(to ~ x1+x2, tdata, hidden = 2, threshold = 0.01)
#hidden (número de capas ocultas), threshold (tamaño del error)
#este paso se puede repetir para reducir el error

#graficar la red neuronal
plot(net)

#imprimir los resultados de la red neuronal
print(net)

#crea una matriz 4x2
test = matrix(c(0,0,0,1,1,0,1,1), nrow = 4, ncol = 2)

#predecir los valores de test con los valores de net
results <- compute(net,test)
#este paso se puede repetir para reducir el error

#imprimir los resultados de net.result
print(results$net.result)
#net.result ahora es una variable fija

#imprimir todos los resultados de net.result
net$result.matrix
