#lang typed/racket

(: default (All (A B)
                (->
                 A
                 (-> B A)
                 (case->
                  (-> A)
                  (-> B A)))))

(define (default v f)
  (case-lambda
    [() v]
    [(arg) (f arg)]))



(: myprimpad (-> String Integer Char String))
(define (myprimpad str k c)
  (string-append
   str
   (make-string k c)))

(: mypad (-> String
                 Integer
                 (case->
                  (-> String)
                  (-> Char String))))

(define (mypad str k)
  (default
    (myprimpad str k #\0)
    (lambda ([c : Char]) (myprimpad str k c))))

(equal? ((mypad "Type System" 2)) "Type System00")
(equal? ((mypad "Type System" 4) #\z) "Type Systemzzzz")


(: fancy-add (-> Number
                 (case->
                  (-> Number)
                  (-> Number Number))))
(define (fancy-add a)
  (default
    (+ a a)
    (lambda ([b : Number]) (+ a b))))

(equal? ((fancy-add 10)) 20)
(equal? ((fancy-add 10) 20) 30)
;                     ^ look here!

(: fancy-apply (-> Number
                   Number
                 (case->
                  (-> Number)
                  (-> (-> Number Number Number) Number))))
(define (fancy-apply a b)
  (default
    (+ a b)
    (lambda ([f : (-> Number Number Number)]) (f a b))))

(equal? ((fancy-apply 10 20)) 30)
(equal? ((fancy-apply 10 20) -) -10)


; Can we expand to three arguments? 
;(equal? (((fancy-add2 10) 20) 30) 60)
#;(: fancy-add2 (-> Number
                 (case->
                  (-> Number)
                  (-> Number
                      (case->
                       (-> Number)
                       (-> Number Number))))))


