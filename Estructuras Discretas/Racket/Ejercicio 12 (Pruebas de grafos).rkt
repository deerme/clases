#lang scheme

(define (verifica lista x)
  (if (empty? lista)
      0
      (if (= (car lista) x)
          1
          (verifica (cdr lista) x))))

(define (grado listaAdj vertice)
  (if (empty? listaAdj)
      0
      (+ (verifica (cdr (car listaAdj)) vertice) (grado (cdr listaAdj) vertice))))

(define (funcion listaAdj v)
  (if (= (grado listaAdj v) 1)
      #t
      #f))

(funcion (list (list 1 2 3 4) (list 2 3 4)) 2)