#lang racket

;zadanie 19
(define tree `(2 (3 () (4 () ())) (1 () ())))

(define (is-null? t) (eq? `() t))
(define (left t) (cadr t))
(define (right t) (caddr t))
(define (cur-element t) (car t))

(define (memberTree? element tree)
    (cond 
        ((is-null? tree) #f)
        ((eq? element (cur-element tree)) #t)
        (else (or (memberTree? element (left tree)) (memberTree? element (right tree))))
    )
)

(define (sumTree tree)
    (cond 
        ((is-null? tree) 0)
        (else (+ (cur-element tree) (sumTree (left tree)) (sumTree (right tree))))
    )
)

(define (inorder tree)
    (if (is-null? tree)
        `()
        (append
            (inorder (left tree)) 
            (cons (cur-element tree) `())
            (inorder (right tree))
        )
    )
)

(define (make-tree x l r) (cons x (list l r)))

(define (mapTree f tree)
    (if (is-null? tree)
        `()
        (make-tree (f (cur-element tree))
                   (mapTree f (left tree))
                   (mapTree f (right tree))
        )
    )
)