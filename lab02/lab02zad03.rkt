#lang racket

;zadanie 8

(define (exp b e)
    (define (square x)
        (* x x)) 
    (if (= (remainder e 2) 0)
        (square (exp b (/ e 2)))
        (expt b e)))

(define (better_exp b e) 
    (define (helper_exp b e power) 
        (if (= (remainder e 2) 0)
            (expt (expt b e) power)
            (helper_exp b (/ e 2) (* power 2))))
    (helper_exp b e 1))