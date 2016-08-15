#lang scheme

(define (contar listaAdyacencia)
  (if (empty? listaAdyacencia)
      0
      (+ (contar (cdr listaAdyacencia)) 1)))
;cuenta el numero de listas en la lista

(define (contar2 listaVertices)
  (if (empty? listaVertices)
      0
      (+ (contar2 (cdr listaVertices)) 1)))
;cuenta el numero de vertices

(define (contar3 listaAdyacencia)
  (if (empty? listaAdyacencia)
      0
      (+ (contar2 (cdr (car listaAdyacencia)))
         (contar3 (cdr listaAdyacencia)))))
;cuenta el numero de lados

;----------------------------------------------------------------------------------
;(contar (list (list 1 2 3 4) (list 2 3 4)))
;2

;(contar (list (list 1 2 3 4) (list 2 3 4) (list 4 3) (list 4 5)))
;4

;(contar3 (list (list 1 2 3 4) (list 2 3 4) (list 4 3) (list 4 5)))
;7

;(contar3 (list (list 1 2 3 4) (list 2 3 4) (list 4 3) (list 4 5) (list 5 7 8 9)))
;10

;(contar3 (list (list 1 2 3 4) (list 4 5) (list 6 8)))
;5

;si cambiamos el signo de contar3 a menos (-), cuando se hacen las operaciones
;recursivas, el símbolo se alterna. entonces, si usamos
;(contar3 (list (list 1 2 3 4 5) (list 4 5 6) (list 6 8) (list 7 8) (list 8 9)))
;las operaciones serían 4 - 2 + 1 - 1 + 1 = 3
;----------------------------------------------------------------------------------

(car '(
       5
       (3 (1 () ()) (4 () ())) 
       (8 (6 () ()) (9 () ()))))

;bota la cabeza
;car

;en el árbol binario, car bota la raíz

(cadr '(
        5 
        (3 (1 () ()) (4 () ())) 
        (8 (6 () ()) (9 () ()))))
;bota la cabeza de la cola
;cdr, después car

;en el árbol binario, cadr bota la rama izquierda

(caddr '(
        5 
        (3 (1 () ()) (4 () ())) 
        (8 (6 () ()) (9 () ()))))
;bota la cabeza de la cola de la cola
;cdr, después cdr, y después car

;en el árbol binario, caddr bota la rama derecha

;(cadr '(1 2 3 4)) bota 2
;(caddr '(1 2 3 4)) bota 3