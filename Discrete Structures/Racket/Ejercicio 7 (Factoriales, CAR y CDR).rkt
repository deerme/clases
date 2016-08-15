#lang scheme

(define r 1) ;define una variable r que vale 1 al principio

(define (factorial n)
  (do ((i 1 (+ i 1))) ((> i n)) ;i = 1, i avanza de 1 en 1, hasta n
    (set! r (* r i)) ;r = r*i
    (display r) ;return r
    (newline))) ;imprime una nueva línea

(define (imprime lista)
  (if (empty? lista) ;cuando la lista esté vacía
      (void) ;imprime un vacío
      (begin ;si no, 
        (display (car lista)) ;muestra la cabeza de lista
        (newline) ;imprime una nueva línea
        (imprime (cdr lista))))) ;muestra el resto de la lista
;y está dando vueltas

