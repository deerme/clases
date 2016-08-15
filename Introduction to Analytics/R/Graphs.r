#--------Gráficos-------
#primero cargue su tabla mediante read.table
#ejemplo tomado de: http://math.illinoisstate.edu/dhkim/rstuff/rtutor.html
fuel.frame<-read.table("fuel-frame.txt", header=T, sep=",")

names(fuel.frame)
attach(fuel.frame) #para extraer variables de forma directa
hist(Mileage)

#si se desea la probabilidad
hist(Mileage,freq=F)

data(faithful)
attach(faithful)
names(faithful)
hist(eruptions, seq(1.6, 5.2, 0.2),prob=T)
lines(density(eruptions, bw=0.1))
rug(eruptions)

#el uso de plot() es para gráficos genéricos
plot(Weight)

#se puede añadir un título
plot(Weight, Mileage, main="Weight vs Mileage")
#se puede usar regresión lineal
fit<-lm(Mileage~Weight)
abline(fit)
fit #sale el intercepto y la pendiente

#otros gráficos conforme avance el curso
