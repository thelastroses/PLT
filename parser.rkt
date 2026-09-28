#lang racket

(define parse
  (lambda
      (exp)
    (cond
      ((symbol? exp) (list 'var-exp exp))
       (else (displayln "ERROR"))
    )
  )
)

(provide (all-defined-out))