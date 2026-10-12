#lang racket
(require "parser.rkt")
(require "util.rkt")
(require "interpreter.rkt")

;(parse '(! ((1 + 1) < a)))

;(process (parse '(! ((1 + 1) < a))))

(displayln "Task 1: ")
(define a 10)
(define b 22)
(if (> a b)
    (let ((x 5)
        (y 6)
        (c (- a b)))
    (displayln x)
    (displayln y)
    (displayln c))
   (displayln "otherwise"))

(displayln "Task 2: ")
(define while_loop
  (lambda ()
    (let loop ((a 1))
      (if (< a 10)
        (begin
          (displayln a)
          (loop (+ a 1))) a))))
(while_loop)

(displayln "Task 3: ")
(define do_while_loop
  (lambda ()
  (let ((a 1))
    (let loop ()
        (displayln a)
        (set! a (+ a 1))
        (if (< a 10)
            (loop) a)))))
(do_while_loop)


;### 10-06 week7d1 homework
;test if-condition
;while loop
;(while (boolean-exp)
;  (body)
;)
;while loop will check boolean-exp each time
;when it is true, it will execute the body
;when it is false, it stops
;while loop has its own scope

;do-while loop
;(do-while
;  (body)
;) (boolean-exp)
;do-while loop will run body for the first time unconditionally
;if boolean-exp is true, it will run the body
;otherwise, halt
;do-while loop also has its own scope