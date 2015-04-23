def gcd(a,b): #halla el máximo común divisor
    while a != 0:
        a, b = b % a, a
        #el valor de a se vuelve b % a
        #el valor de b se vuelve a
    return b

# --------------------
# PRUEBA DE ESCRITORIO
# --------------------
#
# Una prueba de escritorio significa probar con valores.
#
# Digamos que a = 24 y b = 30
# 30 / 24 = 1, residuo 6
# a = 6 y b = 24
# 24 / 6 = 4, residuo 0
# a = 0 y b = 6
# como a = 0, el gcd = b = 6
#
# Digamos que a = 30 y b = 24
# 24 / 30 = 0, residuo 24
# a = 24 y b = 30
# 30 / 24 = 1, residuo 6 (se volteó)
# La prueba continúa como la anterior
# ...
# como a = 0, el gcd = b = 6


