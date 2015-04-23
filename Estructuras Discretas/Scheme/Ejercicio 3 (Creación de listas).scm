#lang scheme

(cons 1 2) ;crea un par ordenado (1 . 2)
'(1 . 3) ;crea un part ordenado (1 . 3)

(list 'a 'b 'c 'd 'e) ;lista, pares concatenados
'(a b c d e) ;otra forma de hacer una lista
'(a . (b . (c . (d. (e . ()))))) ;cada cdr apunta al car del siguiente
(list "apple" "orange" "banana")

(length (list "cat" "dog" "cow")) ;longitud de la lista
(list-ref (list "cat" "dog" "cow") 0) ;bota el elemento de posición 0
(append (list "cat" "dog") (list "apple" 1)) ;añade "apple 1" a la lista "cat dog"
(reverse (list 1 2 3)) ;invierte los elementos de la lista
(member "cat" (list "cat" "apple" "cow")) ;si "cat" pertenece a la lista, la imprime

(empty? (list 1 2 3 4)) ;la lista está vacía?
