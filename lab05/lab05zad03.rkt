#lang racket

;zadanie 20

(define (deriv exp var)
    (cond ((constant? exp) 0)
          ((variable? exp) (if (same-variable? exp var) 1 0))
          ((sum? exp) (make-sum 
                        (deriv (addend exp) var)
                        (deriv (augend exp) var)              
          ))
          ((product? exp) (make-sum
                            (make-product (addend exp) var)
                            (make-product (augend exp) var)
          ))
    )
)

(define (constant? exp) (number? exp))
(define (variable? exp) (symbol? exp))
(define (same-variable? x y) (and (variable? x)) (variable? y) (eq? x y))
(define (sum? exp) (if (not (atom? exp)) (eq? (car exp) `+) (error "")))
(define (product? exp) (if (not (atom? exp)) (eq? (car exp) `*) (error "")))
(define (atom? exp) (eq? exp `()))
(define (addend sum) (cadr sum))
(define (augend sum) (caddr sum))
(define (make-sum a b) (list `+ a b))
(define (make-product a b) (list `* a b))