#lang scheme

;-------------------------------------------------------------------
; LISTAS
;-------------------------------------------------------------------

(define (miLista lista)
	lista)

; luego se puede definir una lista como por ejemplo
; > (miLista '(1 2 3 4))
; el output sería (1 2 3 4)

;-------------------------------------------------------------------

(define a 1) ;se define a = 1 (int)
(define b "Hola") ;se define b = "Hola" (string)

(define miPar (cons a b)) ;se define miPar que consiste de (a . b)

; luego se puede llamar a miPar
; > miPar
; el output sería (1 . "Hola")

;-------------------------------------------------------------------

;(define a 1) ;ya ha sido definido antes
;(define b "Hola") ;ya ha sido definido antes
(define c 'unSimbolo) ;se define c = 'unSimbolo (variable)

(define miLista2 (list a b c '(d e f) 'g))
; define una lista "a b c" a la que se le une otra lista 
; "d e f" y luego una lista de un elemento "g"

; luego se puede llamar a miLista2
; > miLista2
; el output sería (1 "Hola" unSimbolo (d e f) g)

;-------------------------------------------------------------------
; OPERACIONES BÁSICAS CON LISTAS Y PARES
;-------------------------------------------------------------------

;(define a 1) ;ya ha sido definido antes
;(define b "Hola") ;ya ha sido definido antes
;(define c 'unSimbolo) ;ya ha sido definido antes

;(define miPar (cons a b)) ;ya ha sido definido antes
(define miLista3 (list a b c))
(define listaVacia '())

(print "pair?: ")
(pair? miPar) ;verifica si miPar es par

(print "list?: ")
(list? miLista3) ;verifica si miLista3 es lista

(print "null?: ")
(null? listaVacia) ;verifica si listaVacia está vacía

(print "car pair: ")
(car miPar) ;le saca la cabeza a miPar, es decir, 1

(print "cdr pair: ")
(cdr miPar) ;le saca la cola a miPar, es decir, "Hola"

(print "car list: ")
(car miLista3) ;le saca la cabeza a miLista3, es decir, a = 1

(print "cdr list: ")
(cdr miLista3) ;le saca todo menos la cabeza a miLista3

(print "car (cdr list): ")
(car (cdr miLista3)) ;le saca la cabeza a la cola de miLista

;-------------------------------------------------------------------
; EJERCICIO
;-------------------------------------------------------------------

(define lista1 (list 5 6 #t 8 #f)) ;
(define lista2 (list 1 2 3 4))
(define lista3 (append lista2 lista1))
(cdr lista3) ;retorna todo menos la cabeza de la lista3
(car (cdr lista3)) ;retorna el elemento de posición 2 de lista3
(list-ref lista3 1) ;retorna el elemento de posición 2 de lista3
(null? lista3) ;verifica si lista3 está vacía

(if (member 2 lista3) #t #f) ;verifica si la lista3 tiene el elemento "2"