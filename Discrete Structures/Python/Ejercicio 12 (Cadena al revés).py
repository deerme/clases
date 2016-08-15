def main():
    message = 'Hola, saludos'
    translated = ''
    i = len(message)-1 #halla la longitud de la cadena y establece el último índice

    #hola
    #0123 (índices)
    #su longitud es 4, por lo que el último índice es 4-1 = 3
    
    while (i >= 0): #empieza con el último valor de la cadena
        translated = translated + message[i] #lo concatena a una nueva cadena
        i = i - 1 #reduce una posición y empieza de nuevo
    print (translated)
    print (len(translated))

#import <filename>
#<filename>.main()
#retorna "sodulas ,aloH"
#es 'message' al revés
