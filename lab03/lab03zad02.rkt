#lang racket

;zadanie 11

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner 
            (term a) 
            (accumulate combiner null-value term (next a) next b))))

(define (sum term next a b) 
    (accumulate + 0 term a next b))

(define (product term next a b)
    (accumulate * 1 term a next b))