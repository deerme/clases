#lang scheme

(caadr '(9 (7 6 5 4 3 2 1) 8))
;retorna la cabeza de la cabeza de la cola
;primero cdr: ((7 6 5 4 3 2 1) 8)
;luego car: (7 6 5 4 3 2 1)
;luego car: 7

(cdr '(9 (7 6 5 4 3 2 1) 8))
;retorna la cola: ((7 6 5 4 3 2 1) 8)

(define (buscar n arbol) ;busca un valor n (numérico) en un arbol (lista)
  (let
      ((raiz (car arbol))
          (izq (cadr arbol))
          (der (caddr arbol)))
       (if (= n raiz)
           #t
           (if (< n raiz)
               (if (null? izq)
                   #f
                   (buscar n izq))
               (if (null? der)
                   #f
                   (buscar n der))))))

(buscar 9 '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
;n = 9
;arbol = '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ())))
;retorna #t

(buscar 2 '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
;n = 2
;arbol = '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ())))
;retorna #f

(define (recorrido arbol) ;retorna todos los elementos (lista ) del arbol (lista)
  (if (null? arbol)
      '()
      (let
          ((raiz (car arbol))
           (izq (cadr arbol))
           (der (caddr arbol)))
        (append (append (recorrido izq) (list raiz) (recorrido der))))))
        ;por la naturaleza de los arboles, siempre retornará una lista en orden
        ;se hace un append de izquierda, raiz, derecha (e.g. 3, 4, 5)

(recorrido '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
;arbol = '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ())))
;retorna (1 3 4 5 6 8 9)

(define (preorder arbol) ;retorna todos los elementos (lista ) del arbol (lista)
  (if (null? arbol)
      '()
      (let
          ((raiz (car arbol))
           (izq (cadr arbol))
           (der (caddr arbol)))
        (append (append (list raiz) (preorder izq) (preorder der))))))
        ;este algoritmo retorna los elementos pre-ordenados
        ;se hace un append de raiz, izquierda, derecha (e.g. 8, 6, 9)

(preorder '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
;arbol = '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ())))
;retorna (5 3 1 4 8 6 9)

(define (insertar s arbol)
  (if (null? arbol)
      (list s '() '())
      (let
          ((raiz (car arbol))
           (izq (cadr arbol))
           (der (caddr arbol)))
        (if (< s raiz)
            (list raiz (insertar s izq) der)
            (list raiz izq (insertar s der))))))

(insertar 2 '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ()))))
;arbol = '(5 (3 (1 () ()) (4 () ())) (8 (6 () ()) (9 () ())))
;s = 2
;retorna = (5 (3 (1 () (2 () ())) (4 () ())) (8 (6 () ()) (9 () ())))

(define (construir numeros arbol) ;construye un árbol en base a una lista (numeros)
  (if (null? numeros)
      arbol
      (construir (cdr numeros) (insertar (car numeros) arbol))))

(construir '(5 3 2 6) '())
;numeros = '(5 3 2 6) '()
;retorna = (5 (3 (2 () ()) ()) (6 () ()))