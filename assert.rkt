#lang racket/gui
(require (for-syntax racket/base syntax/parse))
(provide assert)

;; macro combines rackunit's check-equal?, check-true and check-false
;; does not require rackunit to be required at the module level
(define-syntax (assert stx)
  (syntax-parse stx
    [(_ ?a ?b)
     #'(module+ test
         (require rackunit)
         (check-equal? ?a ?b #'?a))]
    [(_ ?a)
     #'(module+ test
         (require rackunit)
         (check-true ?a #'?a))]))

; a few examples
(assert (string-append "a" "b") "ab")
(assert #t)
(assert (not #f))
;(assert (string-append "a" "b" "c") "acb") ; <-- fails
;(assert (null? '(1 2 3)))                  ; <-- fails


; EOF
