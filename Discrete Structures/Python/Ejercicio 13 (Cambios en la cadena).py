def par(): #con una cadena par ABC DEF
    message = 'ABCDEF'
    c = int(len(message) / 2)
    print (c)
    translated = ''
    d = c

    for i in range(0,c):
        translated = translated + message[i] + message[d]
        d = d + 1

    print (translated + message[d:])

#[d:] es un slice, significa que toma esta posición hasta el final

#import <filename>
#<filename>.par()

def impar(): #con una cadena impar ABCD E
    message = 'ABCDE'
    c = int(len(message) / 2)
    print (c)
    translated = ''
    d = c

    for i in range(0,c):
        translated = translated + message[i] + message[d]
        d = d + 1

    print (translated + message[d:])

#import <filename>
#<filename>.impar()
