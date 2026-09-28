#lang racket
(require "parser.rkt")
(require "util.rkt")
(require "interpreter.rkt")

(parse 'a)
(parse 'b)
(parse 1)

(process (parse 'a))
(process (parse 'c))
(process (parse 1))
