#lang typed/racket

(define-type a (Intersection Number (-> Number Number)))

(: self-apply (a -> Number))
(define (self-apply a)
  (a a))