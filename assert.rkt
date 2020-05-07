#lang racket/gui
(require (for-syntax racket/base syntax/parse))
(provide assert)

;; macro combines rackunit's check-equal?, check-true and check-false
;; does not require rackunit to be required at the module level
(define-syntax (assert stx)
  (syntax-parse stx
    [(_assert ?a ?b)
     (quasisyntax/loc stx
       (module+ test
         (require rackunit)
         #,(syntax/loc stx (check-equal? ?a ?b #'?a))))]
    [(_assert ?a)
     (quasisyntax/loc stx
       (module+ test
         (require rackunit)
         #,(syntax/loc stx (check-true ?a #'?a))))]))

; a few examples
(assert (string-append "a" "b") "ab")
(assert #t)
(assert (not #f))
;(assert (string-append "a" "b" "c") "acb") ; <-- fails
;(assert (null? '(1 2 3)))                  ; <-- fails


; EOF
