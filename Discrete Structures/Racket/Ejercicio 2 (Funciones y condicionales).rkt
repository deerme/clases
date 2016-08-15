;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |racket semana 4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))

(if #t 1 0) ;condición a evaluar, la consecuencia, el valor alterno
(if #f 1 0) ;#t es verdadero, #f es falso

(+ 5
   (if (> 1 2)
       (begin
         (display "falso")
         (+ 4 5))
       (+ 3 4)))

(define javier 1)
(define kinley 0)

(if (> javier kinley)
    (begin
      (display "verdadero "))
    (display "falso"))

(define (calculadora-impuesto ingreso)
  (if (< ingreso 10000) ;si el ingreso es menor a 10,000
      0 ;entonces arroja 0
      (if (and (>= ingreso 10000) ;si está entre 10,000
               (<= ingreso 200000)) ;y 200,000
          (* 0.1 (- ingreso 10000)) ;entonces le saca un impuesto del 10%
          (+ (* 0.1 10000) ;caso contrario, le saca un impuesto del 10% sobre los primeros 10,000
             (* 0.2 (- ingreso 10000)))))) ;más un 20% de la diferencia

"se supone"

(number? 4) ;4 es un número?
(= 5 4) ;5 es igual a 4?

(string? "casa") ;"casa" es un string?
(string=? "hola" "hola") ;"hola" es igual a "hola"?
(not (string=? "hola" "adios")) ;"hola" no es igual a "adios"?

""
(string>? "abc" "cba")
(string>? "cba" "abc")

(define (postal peso)
  (if (> peso 125) ;si pesa más de 125 gramos
      (/ peso 25) ;cuesta su peso entre 25
      5)) ;si no, cuesta 5

(define (ejercicio2 dato)
  (if (and (>= dato 10) ;si dato es mayor o igual a 10
           (<= dato 50)) ;y menor o igual a 50
      #t ;entonces verdadero
      #f)) ;si no, falso

(number? -1) ;cool