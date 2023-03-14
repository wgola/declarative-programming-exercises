#lang racket

;zadanie 16

(define (iter f n)
    (define (helper) 
        (lambda (x) (f (f x))))
    (if (= n 0)
        f
        (iter (helper) (- n 1))
    ))
