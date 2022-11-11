; vi:ai:lisp:sm
; COEN 171 - Homework #3
; Maddie Waldie, 11/11/22
; Quicksort

(define (filter f lst)
    (cond
    ((null? lst) lst)
    ((f (car lst)) (cons (car lst) (filter f (cdr lst))))
    (else (filter f (cdr lst)))))

(define (quicksort lst)
    (if (null? lst) lst
        (let
            ((lowerhalf (filter (lambda (x) (< x (car lst))) (cdr lst)))
             (upperhalf (filter (lambda (x) (>= x (car lst))) (cdr lst))))
            (append (quicksort lowerhalf) (cons (car lst) (quicksort upperhalf))))))