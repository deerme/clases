#lang scheme

;4! = 1*2*3*4
;   =   3! *4
;3! = 1*2*3
;   = 2! *3
;2! = 1*2
;n! = n*(n-1)!

;si n=0
;retornar 1
;else
;n(n-1)!

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(define (sumatoria n)
  (if (= n 1) ;límite inferior de la sumatoria
      1
      (+ n (sumatoria (- n 1))))) ;paso recursivo
      
(define (fibonacci n)
  (if (or (= n 1) (= n 0))
      n ;porque 1 arroja 1 y 0 arroja 0
      (if (>= n 2)
          (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
          0))) ;porque si no es 1, 0, o mayor a 2, no se puede fibonacci

(define (binario n)
  (if (> n 0)
      (append (binario (quotient n 2))
              (list (modulo n 2)))
      (list))) ;vacío

(define (mcd a b)
  (if (> a b)
      (calcmcd a b b)
        (if (and (= (mod a b) 0) (= (mod b b) 0)
                 b
                 (calcmcd a b b-1)))
      (calcmcd a b a)
        (if (and (= (mod a a) 0) (= (mod b a) 0)
                 a
                 (calcmcd a b a-1)))))

      