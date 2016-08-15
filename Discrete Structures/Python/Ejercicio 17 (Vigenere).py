letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def main():
    myMessage = "Message"   
    myKey = 'ASIMOV'
    myMode = 'Encrypt'

    if myMode == 'Encrypt':
        translated = encryptMessage(myKey, myMessage)
    elif myMode == 'Decrypt':
        translated = decryptMessage(myKey, myMessage)

    print('%sed message:' % (myMode.title()))
    print(translated)

def encryptMessage(key, message):
    return translateMessage(key, message, 'Encrypt')

def decryptMessage(key, message):
    return translateMessage(key, message, 'Decrypt')

def translateMessage(key, message, mode):
    translated = []
    keyIndex = 0
    key = key.upper()

    for symbol in message:
        num = letters.find(symbol.upper())
        if num != -1:
            if mode == 'Encrypt':
                num += letters.find(key[keyIndex])
            elif mode == 'Decrypt':
                num -= letters.find(key[keyIndex])

            num %= len(letters)

            if symbol.isupper():
                translated.append(letters[num])
            elif symbol.islower():
                translated.append(letters[num].lower())

            keyIndex += 1

            if keyIndex == len(key):
                keyIndex = 0
        else:
            translated.append(symbol)

    return ''.join(translated)

#para que se llame automáticamente:
if __name__ == '__main__':
    main()
