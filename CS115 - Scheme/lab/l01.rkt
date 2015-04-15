;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Question 1 - area of trapezoid
(define (trapezoid-area b1 b2 h)
  (/ (* (+ b1 b2) h) 2))
(check-expect (trapezoid-area 5 7 4) 24)

;; Question 2 - Read the error message
(define