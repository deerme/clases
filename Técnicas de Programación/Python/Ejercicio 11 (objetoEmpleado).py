# -*- coding: utf-8 -*-
"""
Created on Fri Sep 26 09:49:06 2014

@author: 11111042
"""

#crear una clase llamada Empleado que incluya la siguiente informacion:
#codigo, nombre, apellido, salario

class Empleado:
    def __init__(self,codigo,nombre,apellido,salario): #constructor
        self.codigo = codigo
        self.nombre = nombre
        self.apellido = apellido
        self.salario = salario #publico
               
#crear un metodo que calcule el salario anual
    def salarioAnual(self):
        return self.salario*12
        
#crear un metodo que incremente el salario en 10%
    def incremento(self):
        return self.salario*1.1

class listaEmpleados:
    def __init__(self,codigoArea):
        self.codigoArea = codigoArea
        self.lista = []

    def agregarEmpleado(self,objetoEmpleado):
        self.lista.append(objetoEmpleado)
        
    def imprimirLista(self):
        for i in range(0,len(self.lista)):
            print "Codigo  :",self.lista[i].codigo
            print "Nombre  :",self.lista[i].nombre, self.lista[i].apellido
            print "Salario :",self.lista[i].salario
            print ""

#crear un metodo llamado ingresar datos
def ingresarDatos():
    lista = []
    
    while True: #siempre se cumple
        codigo = input("Codigo? ")
        nombre = raw_input("Nombre? ")
        apellido = raw_input("Apellido? ")
        salario = input("Salario? ")
    
        objetoEmpleado = Empleado(codigo,nombre,apellido,salario)
        lista.append(objetoEmpleado)
        
        otro = raw_input("Desea ingresar otro? ")
        
        if otro.upper() == "NO":
            break
        
    return lista
        
def main():
    
    #crear tres empleados
    e1 = Empleado(1,"Rick","James",50000)
    e2 = Empleado(2,"Bob","Marley",0)
    e3 = Empleado(3,"Mick","Jagger",90000)
    e4 = Empleado(4,"David","Bowie",70000)
        
    #FORMA 1
    #imprimir el nombre, el salario mensual, y el salario anual
    #print "Nombre          :", e1.nombre
    #print "Salario mensual :", e1.salario
    #print "Salario anual   :", e1.salarioAnual()
    #print "------------------------"
    #print "Nombre          :", e2.nombre
    #print "Salario mensual :", e2.salario
    #print "Salario anual   :", e2.salarioAnual()

    #FORMA 2
    #crea un objeto a partir de los datos ingresados
    #objeto = ingresarDatos()    
    
    #print ""
    
    #imprimir los datos
    #for i in range(0,len(lista)):
    #    print "Nombre               :", objeto[i].nombre, objeto[i].apellido
    #    print "Salario original     :", objeto[i].salario
    #    print "Salario incrementado :", objeto[i].incremento()
    
    #FORMA 3
    #crear un objeto a partir de los datos ingresados
    area = listaEmpleados("Area 1")
    area.agregarEmpleado(e1)
    area.agregarEmpleado(e2)
    area.agregarEmpleado(e3)
    area.agregarEmpleado(e4)
    area.imprimirLista()
        
if __name__=="__main__":
    main()        