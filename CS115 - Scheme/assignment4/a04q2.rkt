;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;******************************************************************************
;;
;; CS 115 Assignment 04, Question2
;; Tianlu Zhu
;; (tendency of GDP problem)
;;
;;******************************************************************************

;; constant used in this problem
(define check-percent (+ 1 .05))

;; A (listof int) is:
;; *empty
;; *(list int)

;; happy-economy? : (listof int[>=0]) -> boolean

;; produces a boolean indicating whether the elements in the
;; given list are in an increasing order by at least 5 percent

;; Examples
;; (happy-economy? empty) => true
;; (happy-economy? (cons 1423 empty)) => true
;; (happy-economy? (cons 1500 (cons 1600 (cons 1700 (cons 1900 empty))))) => true
;; (happy-economy? (cons 1500 (cons 1590 (cons 1535 empty)))) => false
;; (happy-economy? (cons 1500 (cons 1590 (cons 1690 empty)))) => true
;; (happy-economy? (cons 0 (cons 50 empty))) => true
;; (happy-economy? (cons 2000 (cons 2050 (cons 2500 empty)))) => false

(define (happy-economy? gdplist)
  (cond 
    [(empty? gdplist) true]
    [(empty? (rest gdplist)) true]
    [(<= (* check-percent (first gdplist))
         (first (rest gdplist)))
     (happy-economy? (rest gdplist))]
    [else false]))


;; Tests for happy-economy?
(check-expect (happy-economy? empty) true)
(check-expect (happy-economy? (cons 1423 empty)) true)
(check-expect (happy-economy? (cons 1500 (cons 1600 (cons 1700 (cons 1900 empty))))) true)
(check-expect (happy-economy? (cons 1500 (cons 1590 (cons 1535 empty)))) false)
(check-expect (happy-economy? (cons 1500 (cons 1590 (cons 1690 empty)))) true)
(check-expect (happy-economy? (cons 0 (cons 50 empty))) true)
(check-expect (happy-economy? (cons 2000 (cons 2050 (cons 2500 empty)))) false)