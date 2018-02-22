#lang typed/racket

(define-type Num^String (Intersection Number String))
(define-type NumuString (Union Number String))

(: f1 (-> ? Number))
(define (f1 x)
  (+ x x))

(: f2 (-> ? Number))
(define (f2 x)
  (if (number? x)
      (+ x x)
      (string-length x)))