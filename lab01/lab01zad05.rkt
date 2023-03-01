#lang racket

;zadanie 5

(define (same-values? p1 p2 x y) (equal? (p1 x y) (p2 x y)))