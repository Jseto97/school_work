;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a08q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 2 *********************************************

;; A boolean expression bexp is one of:
;; a boolean value, or
;; a boolexp, or
;; a compexp.

(define-struct boolexp (fn args))
;; A boolexp is a structure (make-boolexp f a) where
;; f is either 'and or 'or and
;; a is a bexplist

(define-struct compexp (fn nl))
;; A compexp is a structure (make-compexp f n) where
;; f is a symbol chosen from  '<, '>, and '=
;; n is a listof two numbers

;; A bexplist is either
;; empty  or
;; (cons b blist) where
;;      b is a (bexp) and
;;      blist is a bexplist

;; Constants for examples and tests

(define be1 (make-boolexp 'and (list(make-boolexp 'or (list (make-compexp '= (list 115 115 )) false))
                                    (make-boolexp 'or (list (make-compexp '< (list 15 6)) false)))))
(define be2 (make-boolexp 'or (list true true false)))
(define be3 (make-compexp '= (list 15 15 )))
(define be4 (make-boolexp 'and (list (make-compexp '= (list 4 4)) true (make-compexp '< (list 5 6)))))
(define be5 (make-boolexp 'and (list be1 be2 be3)))
(define be6 (make-compexp '> (list 15 15 )))
(define be7 (make-boolexp 'and (list be3 be6 )))


;;******************************************************************************
;; Recursive functions

;;------------------------------------------------------------------------------

;; boolean-exp : boolexp -> boolean

;; Purpose: deals with the situation which the given bexp ex is a boolexp. 
;; Produces a boolean value as evaluating the given bexp

(define (boolean-exp ex)
  (cond
    [(symbol=? 'and (boolexp-fn ex))
     (and (bl-eval (first (boolexp-args ex)))
          (bl-eval (rest (boolexp-args ex))))]
    [(symbol=? (boolexp-fn ex) 'or)
     (or (bl-eval (first (boolexp-args ex)))
         (bl-eval (rest (boolexp-args ex))))]))

;;------------------------------------------------------------------------------

;; comp-exp : compexp -> boolean

;; Purpose: produces a boolean value as evaluating the given bexp. This function
;; deals with the situation which the given bexp ex is a compexp

(define (comp-exp ex)
  (cond
    [(symbol=? (compexp-fn ex) '<)
     (< (first (compexp-nl ex))
        (second (compexp-nl ex)))]
    [(symbol=? (compexp-fn ex) '=)
     (= (first (compexp-nl ex))
        (second (compexp-nl ex)))]
    [(symbol=? (compexp-fn ex) '>)
     (> (first (compexp-nl ex))
        (second (compexp-nl ex)))])) 

;;******************************************************************************

;; Main function

;; bl-eval : bexp -> boolean

;; Purpose: produces a boolean value by consuming the given bexp ex and evaluating
;; its actual meaning

;; Examples for bl-eval
;; (bl-eval true) => true
;; (bl-eval be1) => false
;; (bl-eval be3) => true

(define (bl-eval ex)
  (cond
    [(empty? ex) true]
    [(boolean? ex) ex]
    [(cons? ex) 
     (and (bl-eval (first ex)) (bl-eval (rest ex)))]
    [(compexp? ex) (comp-exp ex)]
    [(boolexp? ex) (boolean-exp ex)]))


;; Tests for bl-eval
(check-expect (bl-eval true) true)
(check-expect (bl-eval be1) false)
(check-expect (bl-eval be2) true)
(check-expect (bl-eval be3) true)
(check-expect (bl-eval be4) true)
(check-expect (bl-eval be5) false)
(check-expect (bl-eval be6) false)
(check-expect (bl-eval be7) false)