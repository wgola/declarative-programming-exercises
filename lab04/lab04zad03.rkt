#lang racket

;zadanie 17

(define (append l m) 
    (if (null? (cdr l))
        (cons (car l) (cons m `()))
        (cons (car l) (append (cdr l) m)) 
    )
)

(define (last l)
    (if (null? (cdr l))
        (car l)
        (last (cdr l))
    )
)

(define (reverse l)
    (define (helper acc l)
        (if (null? l)
            acc
            (helper (cons (car l) acc) (cdr l))
        )
    )
    (helper `() l)
)

(define (delete x l)
    (cond 
        ((null? l) `())
        ((eq? (car l) x) (delete x (cdr l)))
        (else (cons (car l) (delete x (cdr l)))) 
    )
)

(define (pairing l1 l2)
    (if (null? (cdr l1))
        (cons (cons (car l1) (car l2)) `())
        (cons (cons (car l1) (car l2)) (pairing (cdr l1) (cdr l2)))
    )
)
    
(define (split x l)
    (define (helper l1 l2 l)
        (cond 
            ((null? l) (values (reverse l1) (reverse l2)))
            ((< (car l) x) (helper (cons (car l) l1) l2 (cdr l)))
            (else (helper l1 (cons (car l) l2) (cdr l)))
        )
    )
    (helper `() `() l)
)
