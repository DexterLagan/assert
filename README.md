# assert
A Racket macro which conveniently combines RackUnit's check-equal? and check-true.

Usage:
  Say you want to add unit tests close to your procedure definitions, without declaring a test module or requiring rackunit, or adding a test module for each unit test. Assert does all this for you. Here's how your code would look like:
  
#lang racket
(require "assert.rkt")

;; some function definition
(define (my-func a b c)
  (+ a b c))
; unit test
(assert (my-func 1 2 3) 6)
(assert (my-func 4 5 6) 16) ; <-- fails
