;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;**************************************************************
;;
;; CS 115 Assignment 04, Question 3
;; Tianlu Zhu
;; (average of a list of integers)
;;
;;**************************************************************

;; A (listof int) is:
;; *empty
;; *(list int)

;; Helper Functions

;; count : (listof int) -> int[>=0]
;; produces the number of elements in the list
;; Example: (count (cons 1 (cons 2 (cons 3 empty)))) => 3
(define (count aloint)
  (cond 
    [(empty? aloint) 0]
    [else (+ 1 (count (rest aloint)))])) 
;; Tests for count
(check-expect (count empty) 0)
(check-expect (count (cons 0 empty)) 1)
(check-expect (count (cons 1 (cons 2 (cons 3 empty)))) 3)

;; sum : (listof int) -> int[>=0]
;; produces the sum of the integers in the list
;; Example: (sum (cons 1 (cons 2 (cons 2 empty)))) => 5
(define (sum aloint)
  (cond 
    [(empty? aloint) 0]
    [else (+ (first aloint) (sum (rest aloint)))]))
;; Tests for count
(check-expect (sum empty) 0)
(check-expect (sum (cons 0 empty)) 0)
(check-expect (sum (cons -2 (cons 5 (cons -1 empty)))) 2)
(check-expect (sum (cons 1 (cons 2 (cons 2 empty)))) 5)

;; average : (listof int) -> num

;; produces the average of the sum of elements in the list

;; Examples:
;; (average empty) => 'empty-list
;; (average (cons 0 (cons 0 (cons 0 empty)))) => 0
;; (average (cons 1 (cons 2 (cons 3 empty)))) => 2
;; (average (cons -5 (cons 12 (cons 0 (cons 3 (cons -2 empty)))))) => 1.6

(define (average aloint)
  (cond 
    [(= 0 (count aloint)) 'empty-list]
    [else (/ (sum aloint) (count aloint))])) 
;; (the helper function can be replaced by a built-in function length that
;; can measure the number of elements in the list as well)

;; Tests for average
(check-expect (average empty) 'empty-list)
(check-expect (average (cons 0 (cons 0 (cons 0 empty)))) 0)
(check-expect (average (cons 1 (cons 2 (cons 3 empty)))) 2)
(check-expect (average (cons -5 (cons 12 (cons 0 (cons 3 (cons -2 empty)))))) 1.6)
(check-expect (average (cons -2 (cons 0 (cons 8 (cons -5 empty))))) 0.25)
(check-within (average (cons 1 (cons 2 (cons 2 empty)))) 1.667 0.001)
(check-within (average (cons 0 (cons 5 (cons 8 (cons 7 (cons 1 (cons 2 empty))))))) 3.833 0.001)
