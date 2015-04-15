;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Question 2

;; number-pizzas: num num num num -> num

;; Purpose: produces the number of pizzas required to feed everyone

;; Examples: (number-pizzas 0 1 1 5) => 3
;; (number-pizzas 1 3 1 2) => 3
;; (number-pizzas 2 3 2 4) => 4
(check-expect (number-pizzas 0 1 1 5) 3)
(check-expect (number-pizzas 1 3 1 2) 3)
(check-expect (number-pizzas 2 3 2 4) 4)

(define (number-pizzas veg-full veg-hungry meat-full meat-hungry)
  (+ (ceiling (/ (+ (* 1 veg-full)
                    (* 3 veg-hungry)) 8))
     (ceiling (/ (+ (* 1 meat-full)
                    (* 3 meat-hungry)) 8))))

;; Tests for number-pizzas
(check-expect (number-pizzas 0 1 1 5) 3)
(check-expect (number-pizzas 1 3 1 2) 3)
(check-expect (number-pizzas 2 3 2 4) 4)