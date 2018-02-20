#lang typed/racket

(or #t #f)

#;(: myOr (case->
         (-> ? ? ?)
         ...
      ))

(define (myOr x y)
  (if x x y))

;(myOr #t #t)
;(myOr #f #t)
;(myOr #t #f)
;(myOr #f #f)

#;(define (orTest x)
  (myOr x #f))

#;(define (orTest2 x)
  (myOr x #t))






























                
