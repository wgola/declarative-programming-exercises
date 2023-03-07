#lang racket

;zadanie 10

(define (product term next a b)
    (if (> a b)
        1
        (* (term a) (product term next (next a) b))))

(define (silnia a)
    (product 
        (lambda(x) x) 
        (lambda(x) (+ x 1))  
        1 
        a))

(define (pi a)
    (* 4 (product
        (lambda(x) (/ 
                    (* x (+ x 2))
                    (* (+ x 1) (+ x 1))
                    ))
        (lambda(x) (+ x 2))
        2
        a)))