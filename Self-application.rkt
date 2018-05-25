#lang typed/racket
; This is a fun comment
(define-type a (Intersection Number (-> Number Number)))

(: self-apply (a -> Number))
(define (self-apply a)
  (a a))
