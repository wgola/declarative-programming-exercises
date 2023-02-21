#lang racket

(define (same-values? p1 p2 x y) (and (p1 x y) (p2 x y)))