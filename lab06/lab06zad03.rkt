#lang racket

;zadanie 28

(define (make-konto password balance)
    (define (withdraw amount)
        (if (> balance amount)
            (begin (set! balance (- balance amount)) balance)
            (error "Withdrawal error")
        )
    )
    (define (deposit amount)
        (begin (set! balance (+ balance amount)) balance)
    )
    (lambda (p m)
        (if (eq? p password)
            (cond 
                ((eq? m `withdraw) withdraw)
                ((eq? m `deposit) deposit)
                ((eq? m `balance) balance)
                (else (error "Wrong message"))
            )
            (error "Wrong password")        
        )
    )
)

