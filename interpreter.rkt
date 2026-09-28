#lang racket
(require "util.rkt")

;homework week5 day 1, 9/22
;create a function, that "process" the parser's results
;if it is a var-exp, resolve the value if can find, otherwise output void error
;no other expression are supported, so all will prompt errors
(define
    process
    (lambda (parsed-exp) (
        cond
            ((null? parsed-exp) (displayln "ERROR: EMPTY PROGRAM."))
            ((void? parsed-exp) (void))
            ((equal? 'var-exp (car parsed-exp)) (let ((value (resolve_env environment (cadr parsed-exp))))
                (if (void? value)
                    (displayln "ERROR: variable not found") value)))
            (else (displayln "ERROR: expression has not been supported yet."))
    ))
)

(provide (all-defined-out))