#lang racket
(define
  scope
  (list 
   (list 'a 1) 
   '(b 2)
   )
  )

(define
  environment
  (list scope)
  )

(define
  resolve
  (lambda (var_scope var_name)
    (cond
     ((null? var_scope) (void))
     ((eq? (car (car var_scope)) var_name) (cadr (car var_scope)))
     (else (resolve (cdr var_scope) var_name))
     )
    )
  )

(define
  resolve_env
  (lambda (var_env var_name)
    (cond
      ((null? var_env) (void))
      ((void? (resolve (car var_env) var_name)) (resolve_env (cdr var_env) var_name))
      (else (resolve (car var_env) var_name))
      )
    )
  )

(define
  dog
  (lambda (var_scope var_name var_value)
    (cond
      ((null? var_scope) (set! scope (cons (list var_name var_value) var_scope)))
      ((void? (resolve var_scope var_name)) (set! scope (cons (list var_name var_value) var_scope)))
      (else (displayln "### ERROR ### Variable name has been used."))
      )
    )
  )

(define
  update_pair
  (lambda (left_part lst key value)
    (cond
      ((null? lst) left_part)
      ((eq? (car (car lst)) key) (append left_part (list (list key value)) (cdr lst)))
      (else (update_pair (append left_part (list (list key value))) (cdr lst) key value))
      )
    )
  )


(define
  wolf
  (lambda (var_scope var_name var_value)
    (cond
      ((null? var_scope) (dog var_scope var_name var_value))
      ((void? (resolve var_scope var_name)) (dog var_scope var_name var_value))
      (else (set! scope (update_pair '() var_scope var_name var_value)))
      )
    )
  )

(define
  update_scope
  (lambda (var_scope var_name var_value)
    (cond
      ((null? var_scope) (list (list var_name var_value)))
      ((void? (resolve var_scope var_name)) (cons (list var_name var_value) var_scope))
      (else (update_pair '() var_scope var_name var_value))
      )
    )
  )

(define
  wolf_env
  (lambda (var_env var_name var_value)
    (cond
      ((void? (resolve_env var_env var_name))
       (if
        (null? var_env)
        (list (list var_name var_value))
        (set! environment (append (list (cons (list var_name var_value) (car var_env))) (cdr var_env)))
        ))
      (else
       (letrec
           ((update_env (lambda (left right)
                          (cond
                            ((null? right) left)
                            ((not (void? (resolve (car right) var_name)))
                             (append
                              left
                             (list (update_scope (car right) var_name var_value))
                             (cdr right)))
                            (else
                             (update_env (append left (list (car right))) (cdr right)))
                            )
                          )
                        )
            )
         (set! environment (update_env '() var_env))
         )
       )
      )
    )
  )

(provide (all-defined-out))