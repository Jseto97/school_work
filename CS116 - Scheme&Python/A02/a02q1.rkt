;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;*******************************************************
;;
;; CS 116 Assignment 02, Question 1
;; (count for least digit 1)
;;
;;********************************************************

;; ones: (listof nat) -> nat

;; Purpose: produces a natural number indicating the number
;; of numbers in the given list (nats) that has 1 as its last
;; digit

;; Examples: (ones (list 1)) => 1
;; (ones (list 82 231 1 22 1000)) => 2
;; (ones (list 1 11 12 13 5101)) => 3

(define (ones nats)
  (length (filter (lambda (num) 
                    (zero? (remainder (- 1 num) 10))) nats)))

;; Tests
;; test for empty list
(check-expect (ones empty) 0)
;; tests for no numbers with the last digit of 1
(check-expect (ones (list 2)) 0)
(check-expect (ones (list 10 12)) 0)
;; tests for some numbers with the last digit of 1
(check-expect (ones (list 1)) 1) 
(check-expect (ones (list 1 11 21 111 10)) 4)
(check-expect (ones (list 10 11 12 13)) 1)