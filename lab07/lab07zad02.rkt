#lang racket

;zadanie 30

(define (mlist l)
    (if (eq? l `())
        `()
        (mcons (car l) (mlist (cdr l)))
    )
)

