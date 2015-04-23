#lang scheme

(define (convertir n)
  (if (> n 0)
      (append (convertir (quotient n 2)) (list (modulo n 2)))
      (list)))

(define (consertir n)
  ;si se ingresa 8
  (if (> n 0)
  ;como 8 es mayor a 0, se empieza por aquí
      
      (append (list (modulo n 2)) (consertir (quotient n 2)))
      ;se crea una lista a la que automáticamente se le agregan elementos al final (append (list xxx))
      
      ;en la primera evaluación, el primer elemento es el residuo entre 8 y 2, 0
      ;luego se saca el cociente de 8 y 2, 4
      ;se empieza de nuevo recursivamente
      
      ;en la segunda evaluación, el nuevo elemento es el residuo entre 4 y 2, 0
      ;luego se saca el cociente de 4 y 2, 2
      ;se empieza de nuevo recursivamente
      
      ;en la tercera evaluación, el nuevo elemento es el residuo entre 2 y 2, 0
      ;luego se saca el cociente entre 2 y 2, 1
      ;se empieza de nuevo recursivamente
      
      ;en la cuarta evaluación, el nuevo elemento es el residuo entre 1 y 2, 1
      ;luego se saca el cociente entre 1 y 2, 0
      ;se empieza de nuevo recursivamente
      
      ;ahora n = 0, entonces se va a la parte falsa
      
      (list)))
      ;se termina y se imprime la lista (0 0 0 1)
