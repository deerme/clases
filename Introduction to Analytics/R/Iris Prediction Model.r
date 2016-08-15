#cargamos la biblioteca neuralnet
library(neuralnet)

#hallamos las dimensiones del ejemplo iris
dim(iris)

#adjuntamos el ejemplo como datos activos
attach(iris)

#definimos una variable size.sample con valor de 100
size.sample <- 100

#sample va a sacar 100 valores al azar de todos los datos de iris
iristrain <- iris[sample(1:nrow(iris), size.sample),]
#las 100 muestras se sacarán indexadas
#esta muestra ingresa a iristrain, datos de entrenamiento
#replacement = true indica MCR, false indica MSR
#por default, el muestreo es con reemplazo

#imprimimos nuestros datos de entrenamiento
iristrain

#creamos una red neuronal iristrain con los datos de iristrain
nnet_iristrain <- iristrain

#coge el conjunto iristrain y los clasifica booleanamente en la red neuronal
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'setosa')
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'virginica')
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'versicolor')

#imprimimos los resultados, ahora 8 columnas (las últimas 3 booleanas)
nnet_iristrain

#vemos los nombres de las columnas
names(nnet_iristrain)

#cambiamos los nombres de las 3 últimas columnas
names(nnet_iristrain)[6] = 'Setosa'
names(nnet_iristrain)[7] = 'Virginica'
names(nnet_iristrain)[8] = 'Versicolor'

#creamos la red neuronal con las tres salidas
neural.net <- neuralnet(
  Setosa+Versicolor+Virginica ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
  data = nnet_iristrain,
  hidden = 3,
  threshold = 0.01)

#ploteamos la red neuronal
plot(neural.net)

#imprimimos el ejemplo original sin la última columna (la especie) que queremos predecir
iris[-5]

#intentemos predecir los datos con la red neuronal
predict <- compute(neural.net, iris[-5])$net.result

#imprimimos los resultados de nuestra predicción
predict
#imprime las tres columnas, Setosa, Versicolor y Virginica
#el valor más cercano a 1 representa la probabilidad de que sea de ese tipo

#hallamos el índice mayor para determinar cuál es el más probable
maxidx <- function(arr){
  return(which(arr == max(arr)))
}

#aplicamos la función maxidx a cada fila (1) de predict
idx <- apply(predict, 1, maxidx)

#imprimimos los resultados de nuestra matriz de índices
idx

#cojemos los índices y les llamamos Setosa, Versicolor y Virginica
prediction <- c('Setosa', 'Versicolor', 'Virginica')[idx]

#imprimimos los resultados de la prediccion
prediction
#ahora nuestra predicción funciona con nombres de especies

#creamos una matriz de confusión
table(prediction, iris$Species)

#-------------------------------------------------------------------

#hagamos un testeo, con datos nuevos (Sepal.Length, Sepal.Width, ...)
test = matrix(c(5.8, 3.3, 5, 1.6), nrow = 1, ncol = 4)

#separo el índice mayor (el más probable)
idx <- apply(predict, 1, maxidx)

#creemos un valor de predicción con nuestros resultados
predict <- compute(neural.net, test)$net.result

#le damos nombres a los atributos de la predicción
prediction <- c('Setosa', 'Versicolor', 'Virginica')[idx]

#imprimimos los resultados
prediction
