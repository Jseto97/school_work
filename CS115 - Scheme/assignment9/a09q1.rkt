;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a09q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 1 *********************************************

;; evens-odds: alon -> int

;; Purpose: produces an integer which 

;; Examples for evens-odds
;; (evens-odds empty) => 0
;; (evens-odds (list 2 4 16)) => -22
;; (evens-odds (list 1 3 7 21 13)) => 45

(define (evens-odds alist)
  (local 
    [(define (add-sub num sum)
     (cond
       [(even? num) (- sum num)]
       [(odd? num) (+ sum num)]))]
 (foldr add-sub 0 alist)))

;; Tests for evens-odds
(check-expect (evens-odds (list 1 2 3 4)) -2)
(check-expect (evens-odds empty) 0)
(check-expect (evens-odds (list 2 4 16)) -22)
(check-expect (evens-odds (list 1 3 7 21 13)) 45)