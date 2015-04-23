(* (+ 1 2) 7)
(+ (* 2 3)(* 4 7))
(+ (* 5 6) 4)
(+ (* 4 5) 6)
(+ (* 3 4) (/ 6 3))
(- (* (+ 1 5) 6) (/ 12 3))
(- 2 1 3) ;no se distribuye el negativo, +2-1-3
(- 2+7i 1 3)

(define (suma x y) ;define la función suma y los datos que recibe
(+ x y)) ;los suma
;el usuario luego escribe (suma 2 3) por ejemplo, y bota 5
