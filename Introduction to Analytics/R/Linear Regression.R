house = read.table("housing.txt", header = T, sep = "\t") 
#header = T indica que la primera fila no es una tupla, sep = "\t" indica que los datos estan separados por tabulaciones

attach(house) #todos los datos de la tabla los pone para utilizar como en una matriz
plot(sqft, price)
price.lm = lm(price ~ sqft) #crea un modelo lineal asociando price con sqft
coeffs = coefficients(price.lm) #halla el intercepto y la pendiente y los almacena en coeffs
abline(price.lm) #pone la linea de mejor ajuste
coeffs #muestra el intercepto y la pendiente

myVars = c("sqft", "price", "bedrooms") #crea un vector de cabeceras
housing = house[myVars] #de house, toda la matriz, voy a sacar solo esas columnas
plot(housing)

results = lm(price ~ sqft + bedrooms)
results

#attach(faithful)
#plot(eruptions,waiting)
#eruption.lm = lm(eruptions ~ waiting) #crea un modelo lineal asociando eruptions con wainting
#newdata = data.frame(waiting = 80) #ingresa un valor de 80 unidades tiempo para espera (waiting)
#newdata
#predict(eruption.lm, newdata, interval = "predict") #arroja el promedio (fit), el valor minimo (lwr) y el maximo (upr)

data <- data.frame(sqft=2000)
data

predict(price.lm,data,interval="predict")
data <- data.frame(sqft=c(2000,3000,4000))

