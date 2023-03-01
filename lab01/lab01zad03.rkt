#lang racket

;zadanie 3

(define (nwd a b) (if (= (remainder a b) 0) b (nwd b (remainder a b))))
(define (nww a b) (/ (* a b) (nwd a b)))