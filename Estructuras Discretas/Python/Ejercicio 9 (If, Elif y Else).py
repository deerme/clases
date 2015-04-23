import sys #biblioteca interna

str = sys.stdin.readline() #revisa lo que el usuario ingresa
#esto es para evitar que se tenga que llamar a la función
#el input del usuario está siendo leído

x = int(str) #convierte el input del usuario en un entero

print ("El valor absoluto de ",x," es ")

if x >= 0:
    print (x)
else:
    print (-x)

c = -5
if c > 0:
    print ("c es positivo")
elif c < 0:
    print ("c es negativo")
else:
    print ("c es cero")

