#lang racket

;zadanie 25

(define (fibonacci n)
    (define (multiply-matrix m1 m2)
        (list 
            (+ (* (list-ref m1 0) (list-ref m2 0)) (* (list-ref m1 1) (list-ref m2 2)))
            (+ (* (list-ref m1 0) (list-ref m2 1)) (* (list-ref m1 1) (list-ref m2 3)))
            (+ (* (list-ref m1 2) (list-ref m2 0)) (* (list-ref m1 3) (list-ref m2 2)))
            (+ (* (list-ref m1 2) (list-ref m2 1)) (* (list-ref m1 3) (list-ref m2 3)))    
        )
    )
    (define (helper x)
        (if (eq? x 0)
            `(1 1 1 0)
            (multiply-matrix `(1 1 1 0) (helper (- x 1)))
        )
    )
    (list-ref (helper n) 3)
)