#lang racket

;zadanie 18

(define (square x)
    (* x x)
)

(define (square-list l)
    (if (null? l)
        `()
        (cons (square (car l)) (square-list (cdr l)))
    )
)

(define (mapf f l)
    (if (null? l)
        `()
        (cons (f (car l)) (mapf f (cdr l)))
    )
)

(define (filter pred l)
    (cond 
        ((null? l) `())
        ((pred (car l)) (cons (car l) (filter pred (cdr l))))
        (else (filter pred (cdr l)))
    )
)
