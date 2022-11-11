; vi:ai:lisp:sm
; COEN 171 - Homework #3
; Maddie Waldie, 11/11/22
; Binary Search Tree

(define (makeLeaf x) (list x '() '()))
(define (makeNode x l r) (list x l r))
(define (dataValue t) (car t))
(define (leftChild t) (cadr t))
(define (rightChild t) (caddr t))

(define (insert t x)
    (cond
        ((null? t) (makeLeaf x))
        ((< x (dataValue t)) (makeNode (dataValue t) (insert (leftChild t) x) (rightChild t)))
        ((> x (dataValue t)) (makeNode (dataValue t) (leftChild t) (insert (rightChild t) x)))
        (else t)
    )
)

(define (member? t x)
	(cond
		((null? t) #f)
		((< x (dataValue)) (member? (leftChild) x))
		((> x (dataValue)) (member? (rightChild t) x))
		(else #t)
    )
)