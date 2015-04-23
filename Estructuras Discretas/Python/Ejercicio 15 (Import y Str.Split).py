def cuadrado(x):
    return x*x

def main():
    a = 3
    r = cuadrado(a)
    print (r)

#import <filename>
#<filename>.main()
#retorna 9 porque imprime r, r = cuadrado(3), cuadrado = 3*3

range(0,7)
#retorna [0, 1, 2, 3, 4, 5, 6] en Python 2.7
#en Python 3.4 ya no retorna una lista sino un generador
#para obtener una lista, usariamos list(range(0,7))

str.split("Tres palabras distintas")
#retorna ['Tres', 'palabras', 'distintas']
#separando los grupos de letras separados por espacios

-2 % 7
#retorna 5 (residuo)
#porque 7 * -1 = -7
#luego -2 - (-7) = 5
