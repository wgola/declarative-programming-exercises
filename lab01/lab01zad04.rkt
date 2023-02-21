#lang racket

(define (odd? n) (if (zero? n) #f (not (odd? (- n 1)))))
(define (even? n) (if (zero? n) #t (not (even? (- n 1)))))