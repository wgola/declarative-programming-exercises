#lang racket

(define (fibonacci n)
    (cond 
        ((= n 0) 0)
        ((= n 1) 1)
        (else 
            (+ 
                (fibonacci (- n 1)) 
                (fibonacci (- n 2))))))

(define (better_fibonacci n)
    (define (helper_fibonacci n i before current)
        (cond 
            ((= n 0) 0)
            ((= n 1) 1)
            ((= n i) current)
            (else 
                (helper_fibonacci n (+ i 1) current (+ current before)))))
    (helper_fibonacci n 1 0 1))