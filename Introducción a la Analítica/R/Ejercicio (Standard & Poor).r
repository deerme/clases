#cambiar el directorio a uno escribible
setwd("D:/RStudioWD")

#instalar el paquete ISLR
install.packages("ISLR")

#cargar la biblioteca ISLR
library(ISLR)

#imprimir los nombres de los encabezados de Smarket
names(Smarket)
#Smarket tiene ejemplos de las acciones de S&P 2001-2005

#imprimir (algunos) valores de Smarket
Smarket
#los datos son de Yahoo! Finance, 1250 entradas, 9 variables

#ver las dimensiones de la matriz Smarket, 1250x9
dim(Smarket)

#ver las medidas de tendencia central y el rango de Smarket
summary(Smarket)

#crear un diagrama de correlaciones de todo contra todo
pairs(Smarket)

#sacar la correlación de todos los datos, menos la columna 9 (Direction)
cor(Smarket[,-9])
#Direction tiene datos cualitativos, no comparables con cuantitativos

#crear un diagrama de correlaciones de todo contra todo, menos la columna 9
pairs(Smarket[,-9])

#graficar Lag1 y Today, tamaño de punto 21, y colores rojo y verde
plot(Smarket$Lag1, Smarket$Today, pch = 21, bg = c("red", "green"))

#graficar Year y Volume, tamaño de punto 21, y colores rojo y verde
plot(Smarket$Year, Smarket$Volume, pch = 21, bg = c("red", "green"))

#adjuntamos los datos del ejemplo Smarket
attach(Smarket)
#esta instrucción sirve para evitar tener que decir Smarket$VARIABLE

#graficar el volumen
plot(Volume)

#realizar una regresion lineal para predecir la dirección en base a los datos
glm.fit = glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data = Smarket, family = binomial)
#Direction está basado en Lag1, Lag2, Lag3, Lag4, Lag5 y Volume
#los datos provienen de Smarket
#la distribución (family) es binomial, porque los resultados son Up o Down

#ver los resultados de la regresión
summary(glm.fit)

#imprimr los coeficientes de la regresión
coef(glm.fit)

#imprimr el resumen de los coeficientes
summary(glm.fit)$coef

#imprimr el resumen de los coeficientes de la cuarta columna (Pr(>|z|))
summary(glm.fit)$coef[,4]
#es decir, solo los valores de predicción

#realizamos una predicción del modelo logístico usando glm.fit y tipo response
glm.probs = predict(glm.fit, type = "response")
#el tipo response implica usar el modelo P(Y=1|X)
#es decir, un valor cercano a 1 predice que la acción sube

#imprimir los diez primeros resultados
glm.probs[1:10]

#permite definir la frontera de decisión Up (1) Down (0)
contrasts(Direction)

#crear un vector de 1250 elementos que contenga "Down"
glm.pred = rep("Down",1250)

#ponerle "Up" a aquellas que tengan un valor de predicción mayor a 0.5
glm.pred[glm.probs > 0.5] = "Up"
#glm.probs tenía la predicción del modelo logístico
#0.5 es nuestro nivel de confianza

#ver los valores (Up o Down) de la predicción
glm.pred

#crear una matriz de confusión que relacione la predicción y la dirección
table(glm.pred, Direction)
#aquellas que han salido bajas y realmente son bajas son 145
#aquellas que han salido altas y realmente son altas son 507
#los elementos de la diagonal son los datos correctos
#el porcentaje de datos predichos son 52% ((145+507)/1250)
#52% está bien hecho, 48% no está bien hecho

#calcular el promedio de la dirección en función a los datos de predicción
mean(glm.pred==Direction)
#coincidimos que 52% es lo predecible correctamente
#esto ocurre porque usamos el 100% de nuestros datos para entrenar y predecir

#sacamos todos los datos de antes del 2005
train = (Year<2005)
