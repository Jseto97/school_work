;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;************************************************
;;
;; CS 115 Assignment 02, Question 2
;; Tianlu Zhu
;; (arithmetric sequence calculation)
;;
;;************************************************

;; arith-seq?: int int int -> boolean

;; Purpose: produce a boolean arith-seq? indicates 
;; whether the three numbers item1 item2 item3 can 
;; be rearranged to form an arithmetric sequence by
;; testing the equal value of the sum of any two
;; and the 2 times of the left one

;; Examples: (arith-seq? 1 2 5) => false
;; (arith-seq? 33 27 21) => true

(define (arith-seq? item1 item2 item3)
  (cond [(or (= (* 2 item1) (+ item2 item3))
             (= (* 2 item2) (+ item1 item3))
             (= (* 2 item3) (+ item1 item2))) true]
        [else false]))

;; Tests for arith-seq?
(check-expect (arith-seq? 1 2 5) false)
(check-expect (arith-seq? 33 27 21) true)