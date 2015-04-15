;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Question 1

;; break-even:num num -> num

;; Purpose: produces the number of movies that can watch

;; Examples: (break-even 2.99 12.50) => 5
;; (break-even 2 10) => 5
;; (break-even 3.99 15.8) => 4
(check-expect (break-even 2.99 12.50) 5)
(check-expect (break-even 2 10) 5)
(check-expect (break-even 3.99 15.8) 4)

(define (break-even single-ticket pass)
  (ceiling (/ pass single-ticket)))

;; Tests for break-even
(check-expect (break-even 2.99 12.50) 5)
(check-expect (break-even 2 10) 5)
(check-expect (break-even 3.99 15.8) 4)