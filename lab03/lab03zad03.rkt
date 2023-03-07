#lang racket

;zadanie 12

(define (?prime x)
    (define (helper x counter)
        (if (= counter 1) #t
        (if (= (remainder x counter) 0) 
            #f
            (helper x (- counter 1)))))
    (if (= x 1) #t (helper x (- x 1))))

(define (filter-accumulate pred combiner null-value term a next b)
    (if (> a b)
        null-value
        (if (pred a)
            (combiner 
                (term a) 
                (filter-accumulate pred combiner null-value term (next a) next b))
            (filter-accumulate pred combiner null-value term (next a) next b))))

(define (sum-of-squares a b)
    (filter-accumulate 
        ?prime
        +
        0
        (lambda(x) (* x x))
        a
        (lambda(x) (+ x 1))
        b
    ))

(define (nwd a b) 
    (if (= (remainder a b) 0) b (nwd b (remainder a b))))


(define (product-of-numbers n)
    (filter-accumulate
        (lambda(x) (= (nwd x n) 1))
        *
        1
        (lambda(x) x)
        1
        (lambda(x) (+ x 1))
        n))