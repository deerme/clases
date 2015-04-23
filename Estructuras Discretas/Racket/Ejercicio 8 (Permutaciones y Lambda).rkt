#lang scheme

(define (factorial a) ;función factorial
  (if (= a 0)
      1
      (* a (factorial (- a 1)))))

(define (permutacionMuestral n r)
  (/ (factorial n) (factorial (- n r))))

;(map (lambda (x) (* -1 x)) '(1 2 3 4))
;aquí lambda funciona como símbolo menos

(define (cubo x)
  (expt x 3))