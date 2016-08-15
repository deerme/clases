;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname racket11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

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

(define p 3.14159)
(define (area_circ radio)
  (* (expt radio 2) p)) ;también puede ser (* radio radio)
  
(define (vol_cil radio altura)
  (* (area_circ radio) altura))

(define (calc numero)
  (sqrt (/ (- numero 1) (+ numero 1))))

(define (area_rect largo ancho)
  (* largo ancho))

((lambda (x y) ;lambda en función de x e y
   (+ (* y y) x)) ;función lamda como y*y+x
 3 4) ;valores de x e y

(define function(lambda (x y) ;define function en función de lambda y (x y)
   (+ (* y y) x))) ;utiliza la misma fórmula que la anterior y funciona igual

(if #t 1 0) ;#t significa True, esta expresión botará 1