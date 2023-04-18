#lang racket

;zadanie 29

(define (counting-version f)
    (define times 0)
    (lambda (x) 
        (cond 
            ((eq? x `how-often) times)
            ((eq? x `reset) (begin (set! times 0) times))
            (else (begin (set! times (+ times 1)) (f x)))
        )
    )
)
