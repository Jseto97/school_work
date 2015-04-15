;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07q2) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))

(define-struct bae (fn arg1 arg2))
;; A binary arithmetic expression (binexp) is either
;; a number or
;; a structure (make-bae f a1 a2), where
;;   - f is a symbol in the set '*, '+, '/, '-,
;;   - a1 is a binexp, and
;;   - a2 is a binexp. 

;;Constants for binary arithmetic expressions
(define bae1 (make-bae '+ 2 3))
(define left-bae (make-bae '* 2 3))
(define right-bae (make-bae '- 7 3))
(define root-bae (make-bae '/ left-bae right-bae))

;; Question 2

;;  multiply-exp : num num binexp -> binexp

;; Purpose: produces a new binexp called multiply-exp where each leaf of the binary
;; expression tree end up with the expression (nbr*(m+n)), and nbr is the original 
;; node value of the leaf. If m+n is 0, then the function multiply-exp produces the
;; same binary expression tree multexp

;; Examples:
;; (multiply-exp -2 2 bae1) => (make-bae '+ 2 3)
;; (multiply-exp -3 2 2) => (make-bae '* 2 (make-bae '+ -3 2))
;; (multiply-exp 5 2 left-bae) => (make-bae '* (make-bae '* 2 (make-bae '+ 5 2)) (make-bae '* 3 (make-bae '+ 5 2)))

(define (multiply-exp m n multexp)
  (cond
    [(zero? (+ m n)) multexp]
    [(number? multexp)
     (make-bae '* multexp (make-bae '+ m n))]
    [(bae? multexp)
     (make-bae (bae-fn multexp)
               (multiply-exp m n (bae-arg1 multexp))
               (multiply-exp m n (bae-arg2 multexp)))]))

;; Tests for multiply-exp
(check-expect (multiply-exp -3 2 2) (make-bae '* 2 (make-bae '+ -3 2)))
(check-expect (multiply-exp -2 2 bae1) (make-bae '+ 2 3))
(check-expect (multiply-exp 5 2 left-bae) (make-bae '* (make-bae '* 2 (make-bae '+ 5 2)) (make-bae '* 3 (make-bae '+ 5 2))))
(check-expect (multiply-exp 5 -5 left-bae) left-bae)
(check-expect (multiply-exp -3 2 root-bae) (make-bae '/ (make-bae '* (make-bae '* 2 (make-bae '+ -3 2))
                                                                     (make-bae '* 3 (make-bae '+ -3 2)))
                                                                     (make-bae '- (make-bae '* 7 (make-bae '+ -3 2))
                                                                     (make-bae '* 3 (make-bae '+ -3 2)))))
(check-expect (multiply-exp 1 2 (make-bae '- left-bae 5)) (make-bae '- (make-bae '* (make-bae '* 2 (make-bae '+ 1 2))
                                                                                    (make-bae '* 3 (make-bae '+ 1 2))) 
                                                                                    (make-bae '* 5 (make-bae '+ 1 2))))
