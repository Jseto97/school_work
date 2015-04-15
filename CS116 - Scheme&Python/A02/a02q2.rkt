;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a02q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;********************************************************************
;;
;; CS 116 Assignment 02, Question 2
;; (check the product from algorithm matching the given list)
;;
;;********************************************************************

;; match-points: (X -> Y) (X -> Y) (listof any) -> (listof boolean)

;; Purpose: produces a listof boolean indicating whether the two
;; functions (fun1) and (fun2) would have the same outcome applying
;; on elements of the given list (lst)

;; Examples: (match-points sqr (lambda (x) (+ x x)) (list 0 2 -2))
;; => (list true true false)
;; (match-points abs add1 (list 0 -0.5)) => (list false true)

(define (match-points fun1 fun2 lst)
  (cond
    [(empty? lst) empty]
    [else 
     (cons (equal? (first (map fun1 lst))
                   (first (map fun2 lst)))
           (match-points fun1 fun2 (rest lst)))]))

;; Tests
(check-expect (match-points sqr (lambda (x) (+ x x)) (list 0 2 -2)) 
              (list true true false))
(check-expect (match-points abs add1 (list 0 -0.5)) (list false true))
(check-expect (match-points (lambda (x) (integer? (sqrt x)))
                            (lambda (x) (integer? (/ x 10)))
                            (list 4 100 0 11))
              (list false true true true))
(check-expect (match-points (lambda (str1) (substring str1 0 1))
                            (lambda (str2) (substring str2 1 2))
                            (list "aabb" "aba" "cderf"))
              (list true false false))
(check-expect (match-points (lambda (bln) (or true bln)) not
                            (list true true false ))
              (list false false true))