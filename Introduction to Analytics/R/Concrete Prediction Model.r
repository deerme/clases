#revisar el wd con getwd(), setwd()
#descargar una base de datos
#https://archive.ics.uci.edu/ml/machine-learning-databases/concrete/compressive/

#copiar el archivo xls al wd
#convertir el archivo xls a csv (MS-DOS)
#abrir el csv y reducir el nombre de las variables

#leer los datos y almacenarlos a una matriz
concrete <- read.csv("Concrete_Data.csv")

#imprimir los datos
concrete

#revisar las dimensiones de la matriz
dim(concrete)

#ver los nombres de las variables
names(concrete)

#generar un data frame
str(concrete)

#formas de normalización:
#1. diferencia entre la variable y la media, entre la desviación estandar
#2. diferencia entre la variable y la mediana, entre el rango
#3. diferencia entre la variable y el máximo, entre el rango
#4. diferencia entre la variable y el mínimo, entre el rango

#utilizamos la forma 4
normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}

#normalizar todos los datos como data frame (por columna)
concrete_norm <- as.data.frame(lapply(concrete, normalize))
#lapply le aplica la función normalize al conjunto de datos concrete
#el resultado se almacena en concrete_norm

#imprimir los datos normalizados
concrete_norm

#imprimir un resumen de los datos
summary(concrete_norm)

#imprimir un resumen de la fuerza del concreto
summary(concrete_norm$Strength)

#seleccionamos 80% de los datos como datos de entrenamiento
concrete_train <- concrete_norm[1:824,]

#seleccionamos 20% de los datos como datos de testeo
concrete_test <- concrete_norm[825:1030,]

#instalar el paquete neuralnet
install.packages("neuralnet")

#inicializamos la biblioteca neuralnet
library(neuralnet)

#creamos la red neuronal, usando todos las variables para predecir el Strength y los datos de entrenamiento
neural.net <- neuralnet(
  Strength ~ Cement+Blast+FlyAsh+Water+Superplasticizer+CoarseAggregate+FineAggregate+Age, 
  data = concrete_train, 
  hidden = 5, 
  threshold = 0.01)

#ploteamos la red neuronal
plot(neural.net)

#ahora intentamos predecir los datos de testeo, obviando la última columna (Strength) que intentamos predecir
prediction <- compute(neural.net, concrete_test[1:8])$net.result

#imprimimos nuestros valores de predicción
prediction

#hallamos la correlación entre nuestra predicción y los datos reales
cor(prediction, concrete_test$Strength)
