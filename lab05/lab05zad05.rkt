#lang racket

;zadanie 22

(define (fold f e l)
    (if (null? l)
        e
        (f (car l) (fold f e (cdr l)))
    )
)

(define (prod l)
    (fold * 1 l)
)

(define (length l)
    (define (f x y) (+ 1 y))
    (fold f 0 l)
)

(define (delete x l)
    (define (f a b)
        (if (eq? x a)
            b
            (cons a b)
        )    
    )
    (fold f `() l)
)

(define (reverse l)
    (define (f a b)
        (append b (list a))
    )
    (fold f `() l)
)

(define (map f l)
    (define (helper a b)
        (cons (f a) b)
    )
    (fold helper `() l)
)

(define (filter pred l)
    (define (helper a b)
        (if (pred a)
            (cons a b)
            b
        )
    )
    (fold helper `() l)
)

(define (forall pred l)
    (define (helper a b)
        (if (pred a)
            b
            #f
        )
    )
    (fold helper #t l)
)