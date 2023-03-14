#lang racket

;zadanie 14

(define (root f a b)
    (define midpoint (/ (+ a b) 2))
    (define tolerance (/ 1 100000))
    (define (checkSign) (and (< (f midpoint) 0) (< (f a) 0)))
    (define (checkAnswer) (< (abs (f midpoint)) tolerance))
    (
        if (checkAnswer)  
            midpoint
            (if (checkSign)
                (root f midpoint b)
                (root f a midpoint)
            )
    )
)

(define (testFunction x) (- (- (expt x 3) x) 2)) 