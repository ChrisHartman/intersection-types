#lang typed/racket

(define-type Num^String (Intersection Number String))
(define-type NumuString (Union Number String))

(: add^ (-> Num^String Number))
(define (add^ x)
  (+ x x))

(: union-example (-> NumuString Number))
(define (union-example x)
  (if (number? x)
      (+ x x)
      ;     ^ Hover here
      (string-length x)))

(union-example 5)
(union-example "Chris")