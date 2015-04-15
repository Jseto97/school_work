;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Question 4

;; room-cost: num num -> num

;; Purpose: produces the total cost of installing carpet in the room

;; Example: (room-cost 2 3) => 65.04
(check-expect (room-cost 2 3) 65.04)

(define (room-cost width length)
  (+ (* 10 width length)
     (* 0.01 (+ 4 
                (/ (* 2 width) 0.02) 
                (/ (* 2 length) 0.02)))))

;; Test for room-cost
(check-expect (room-cost 2 3) 65.04)