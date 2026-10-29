#lang racket
(require "parser.rkt")
(require "util.rkt")
(require "interpreter.rkt")

;### 10-06 week7d1 homework
;test if-condition
;while loop
;(while (boolean-exp)
;  (body)
;)
;(process (parse '(fire a))) ;fire-exp (var-exp a) -> (displayln 1)

;(print (is_valid_boolean_op '(a < 10)))
;(parse '(while (a < 10) ((a = (a + 1)) (b = (b + 2))  (fire b))))
(print environment)
(process (parse '(c = 1)))
(print environment)
(process (parse '(while (a < 10) ((a = (a + 1)) (c = (b + 2)) (fire c) (b = c))))) 
(print environment)
;(process (parse '(do-while ((a = (a + 1)) (b = (b + 2)) (fire b)) (a < 10))))
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

;### 10-08 week7d2 homework
;assign
;(a = 1)
;(assign-exp ((var-exp a) (num-exp 1)))
;insert or update variable

;for-loop
;(b=0)(for((a = 1)(a < 10)(a = (a + 1)))(b = (b+1))
;(for-exp ...)
;assign a = 1 before all iteration
;execute b = (b+1) and then a = (a+1) in each iteration

(newline)
(newline)
(newline)
;T1
(update_base_environment (list '((a 1) (b 2))))
(displayln "T1")
(process (parse '(main ((a = 5) (b = (a * 2)) (fire b)))))
(print environment)
(newline)
(newline)



;T2
(update_base_environment (list '((a 1) (b 2))))
(displayln "T2")
(process (parse '(main (a = 1))))
(print environment)
(newline)
(newline)


;T3
(update_base_environment (list '((a 1) (b 2))))
(displayln "T3")
(displayln (process (parse '(main ((a = 0) (b = 0) (while (b < 50) ((a = (a + 50)) (b = (b + 1)))) (c = 1) (fire a) (fire c))))))
(print environment)
(newline)
(newline)


;T4
(update_base_environment (list '((a 1) (b 2))))
(displayln "T4")
(process (parse '(main ((func hello (n) ((fire n))) (y = (call hello (7))) (fire y)))))
(print environment)
(newline)
(newline)


;T5
(update_base_environment (list '((a 1) (b 2))))
(displayln "T5")
(process (parse '(main ((func first (n) ((return n) (fire 999))) (fire (call first (3)))))))
(print environment)
(newline)
(newline)


;T6
(update_base_environment (list '((a 1) (b 2))))
(displayln "T6")
(process (parse '(main ((func sum_seq (a b s) ((return a))) (call sum_seq (1 2))))))
(print environment)
(newline)
(newline)


; T7
(update_base_environment (list '((a 1) (b 2))))
(displayln "T7")
(process (parse '(main ((q = 5) (call q (1))))))
(print environment)
(newline)
(newline)


; T8
(update_base_environment (list '((a 1) (b 2))))
(displayln "T8")
(process (parse '(main ((k = 10) (func addone (k) ((return (k + 1)))) (fire (call addone ((k * 2)))) (fire k)))))
(print environment)
(newline)
(newline)