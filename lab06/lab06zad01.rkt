#lang racket

;zadanie 25

(define (fold f e l)
    (if (null? l)
        e
        (f (car l) (fold f e (cdr l)))
    )
)

(define (plus . l)
    (fold + 0 l)
)

(define (par . l)
    (lambda (x)
        (fold (lambda (a b) (cons (a x) b)) `() l)
    )
)

(define (square x) (* x x))
(define (cube x) (* (* x x) x))