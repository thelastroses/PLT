#lang racket
(require "parser.rkt")
(require "util.rkt")
(require "interpreter.rkt")

(parse '(! ((1 + 1) < a)))

(process (parse '(! ((1 + 1) < a))))