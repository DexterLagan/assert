# assert
A Racket macro which conveniently combines RackUnit's check-equal? and check-true.

Usage:
  Say you want to add unit tests close to your procedure definitions, without declaring a test module or requiring rackunit, or adding a test module for each unit test. Assert does all this for you, and displays a message with the funcall that fails. Here's how your code would look like:

<pre>
#lang racket
(require "assert.rkt")

;; some function definition
(define (my-func a b c)
  (+ a b c))
; unit tests
(assert (my-func 1 2 3) 6)  ; passes
(assert (my-func 4 5 6) 16) ; <-- fails

;; some other function definition, a predicate
(define (my-pred? a)
  (null? a))
; unit tests
(assert (my-pred? '()))            ; passes
(assert (not (my-pred? '(1 2 3)))) ; passes
(assert (my-pred? '(4 5 6))        ; <-- fails
</pre>

Running that code would result in assertion errors, with the funcall as comment:

<pre>
--------------------
. FAILURE
name:       check-equal?
location:   my-file.rkt:12:9
message:    #<syntax:assert.rkt:31:8 (my-func 4 5 6)>
actual:     15
expected:   16
--------------------
--------------------
. FAILURE
name:       check-true
location:   my-file.rkt:16:9
params:     '(#f)
message:    #<syntax:assert.rkt:39:8 (my-pred? (quote (4 5 6)))>
--------------------
</pre>

Dex
