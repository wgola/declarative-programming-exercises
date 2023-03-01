#lang racket

(define (exp b e) 
    (if (= (remainder e 2) 0)
        (expt (exp b (/ e 2)) 2)
        (expt b e)))

(define (helper_exp b e ))