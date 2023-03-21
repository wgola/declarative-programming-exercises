#lang racket

;zadanie 21

(define (eval expression values)
    (cond
        ((not (list? expression)) (get-value expression values))
        ((eq? (car expression) `and) (and (eval (list-ref expression 1) values) (eval (list-ref expression 2) values)))
        ((eq? (car expression) `or) (or (eval (list-ref expression 1) values) (eval (list-ref expression 2) values)))
        ((eq? (car expression) `nand) (nand (eval (list-ref expression 1) values) (eval (list-ref expression 2) values)))
        ((eq? (car expression) `nor) (nor (eval (list-ref expression 1) values) (eval (list-ref expression 2) values)))
        ((eq? (car expression) `implies) (implies (eval (list-ref expression 1) values) (eval (list-ref expression 2) values)))
        ((eq? (car expression) `xor) (xor (eval (list-ref expression 1) values) (eval (list-ref expression 2) values)))
        ((eq? (car expression) `not) (not (eval (list-ref expression 1) values)))
    )
)

(define (get-value symbol values)
    (cond
        ((null? values) symbol)
        ((eq? (car (car values)) symbol) (cdr (car values)))
        (else (get-value symbol (cdr values))) 
    )
)
