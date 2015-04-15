;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Question 3

;; moving-cost: num num -> num

;; Purpose: produces the cost of the car moving a certain distance with a certain gas price

;; Examples: (moving-cost 1 1) => 24
;; (moving-cost 5 1) => 40
;; (moving-cost 4 2) => 44
(check-expect (moving-cost 1 1) 24)
(check-expect (moving-cost 5 1) 40)
(check-expect (moving-cost 4 2) 44)

(define (moving-cost distance gas-price)
  (+ 20 (* 2 distance) 
     (* gas-price (/ distance 0.5))))

;; Test for moving-cost
(check-expect (moving-cost 1 1) 24)
(check-expect (moving-cost 5 1) 40)
(check-expect (moving-cost 4 2) 44)