def cesar_encrypt():
    message = 'This is a message'
    key = 10 #la llave (si se usa 26, se da la vuelta entera al alfabeto)
    mode = 'Encrypt'
    letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    translated = ''

    message = message.upper() #vuelve el mensaje a mayúsculas

    for symbol in message:
        if symbol in letters: #primero encuentra el primer caracter (T)
            num = letters.find(symbol)
            if mode == 'Encrypt': #Si está en modo Encrypt
                num = num + key #le suma la llave
            elif mode == 'Decrypt': #Si está en modo Decrypt
                num = num - key #le resta la llave

            if num >= len(letters): #si se acaba el alfabeto,
                num = num - len(letters) #le resta el alfabeto a num
            elif num < 0:
                num = num + len(letters)

            translated = translated + letters[num]

        else:
            translated = translated + symbol

    print (translated)

#import <filename>
#<filename>cesar.encrypt()
#retorna DRSC SC K WOCCKQO

def cesar_decrypt():
    message = 'DRSC SC K WOCCKQO'
    key = 10
    mode = 'Decrypt'
    letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    translated = ''

    message = message.upper()

    for symbol in message:
        if symbol in letters:
            num = letters.find(symbol)
            if mode == 'Encrypt':
                num = num + key 
            elif mode == 'Decrypt': #Como está en modo Decrypt
                num = num - key #le resta la llave

            if num >= len(letters): 
                num = num - len(letters)
            elif num < 0:
                num = num + len(letters)

            translated = translated + letters[num]

        else:
            translated = translated + symbol

    print (translated)

#import <filename>
#<filename>.cesar_decrypt()
#retorna THIS IS A MESSAGE
