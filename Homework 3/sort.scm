; vi:ai:lisp:sm
; COEN 171 - Homework #3
; Maddie Waldie, 11/11/22
; Quicksort

(define (filter f lst)
    (cond
        ((null? lst) lst)
        ((f (car lst)) (cons (car lst) (filter f (cdr lst))))
        (else (filter f (cdr lst)))
    )
)

(define (quicksort lst)
    (if (null? lst) lst
        (let
            ((lower (filter (lambda (x) (< x (car lst))) (cdr lst)))
             (upper (filter (lambda (x) (>= x (car lst))) (cdr lst))))
            (append (quicksort lower) (cons (car lst) (quicksort upper)))
        )
    )
)