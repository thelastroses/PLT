#lang racket
(require "util.rkt")

(define
    heap
    '()
)

(define
    heap_counter 0
)

;function generating new id based on heap_counter

(define
    generate_new_id
    (lambda ()
      (set! heap_counter (+ heap_counter 1))
      (string->symbol (string-append "#" (number->string heap_counter)))
    )
)

(define find_heap_item
  (lambda (id)
    (cond
      ((not (assoc id heap))
       (error (format "Heap error: ~a does not exist" id)))
      ((equal? (cadr (assoc id heap)) (string->symbol "#empty"))
       (error (format "Heap error: ~a has been deleted" id)))
      (else (assoc id heap)))))

;function read-item, return the value based on the id
(define
    read-item
    (lambda (id)
        (cadr (find_heap_item id))))

;function create-item. 1. generate a new id. 2 link the id with the value
(define
    create_heap_item
    (lambda (value)
      (let ((new_id (generate_new_id)))
        (set! heap (cons (list new_id value) heap)) new_id)))

;function update-item. 1. create a the pair with old id and the new value. 2. assign the new heap including with the updates
(define update-item
  (lambda (id new_value)
    (find_heap_item id)
    (set! heap 
    (map (lambda (pair)
        (if (eq? (car pair) id)
            (list id new_value) pair)) heap))))


;function delete-item. 1. create the pair with old id, and "#empty". 2 set the heap
(define delete-item
  (lambda (id)
    (find_heap_item id)
    (set! heap 
    (map (lambda (pair)
        (if (eq? (car pair) id)
            (list id (string->symbol "#empty")) pair)) heap))))

(provide (all-defined-out)) 