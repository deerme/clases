#lang scheme

(list (list 1 2 3 4)
      (list 2 3 4)
)

(define (esAdyacente lista x y)
  (if (empty? lista)
      #f
      (if (= (car (car lista)) x)
          (buscar (cdr (car lista)) y)
          (esAdyacente (cdr lista) x y))))
  
  (define (buscar listaVertice y)
    (if (empty? listaVertice)
        #f
        (if (= (car listaVertice) y)
            #t
            (buscar (cdr listaVertice) y))))
  
;luego se llama como
;(esAdyacente (list (list 1 2 3 4) (list 2 3 4)) 2 4)

;para hallar el número de vertices adyacentes de un número, cambiaríamos el true
;por un contador que aumenta