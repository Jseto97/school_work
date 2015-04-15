;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a05q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; CS115 Fall 2012 Assignment 05

;; Question 3

;; list-of-squares : nat -> listof square integers

;; Purpose: produces list-of-squares a list of all square integers
;; smaller than n the given integer

;; Examples
;; (list-of-squares 0) => empty
;; (list-of-squares 10) => (cons 9(cons 4(cons 1 empty)))

(define (list-of-squares n)
  (cond
    [(zero? n) empty]
    [(integer? (sqrt n))
     (cons n (list-of-squares (sub1 n)))]
    [else (list-of-squares (sub1 n))]))

(check-expect (list-of-squares 0) empty)
(check-expect (list-of-squares 10)
              (cons 9(cons 4(cons 1 empty))))
(check-expect (list-of-squares 5) (cons 4(cons 1 empty)))
(check-expect (list-of-squares 17) (cons 16(cons 9(cons 4(cons 1 empty)))))
(check-expect (list-of-squares 2) (cons 1 empty))
(check-expect (list-of-squares 20) (cons 16(cons 9(cons 4(cons 1 empty)))))