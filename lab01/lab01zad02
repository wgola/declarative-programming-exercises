#lang racket

(define (new.< x y) (< x y) )
(define (new.> x y) (< y x) )
(define (new.= x y) (and (not (< x y)) (not (< y x))))
(define (new.<= x y) (not (< y x)))
(define (new.>= x y) (not (< x y)))
(define (new.<> x y) (or (< x y) (< y x)))