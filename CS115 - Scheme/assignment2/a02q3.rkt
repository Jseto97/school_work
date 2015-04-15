;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;************************************************
;;
;; CS 115 Assignment 02, Question 3
;; Tianlu Zhu
;; (grade calculation)
;;
;;************************************************

;; constant for calculating cs115 grade
;; full percentage for midterm exam in total grade
(define mid 25)
;; full percentage for final exam in total gradw
(define final 45)
;; critical point for passing the weighted exam
(define weighted-exam 35)
;; critical point for passing the course
(define passing-course 50)
;; percentage for calculating percentage
(define percentage 100)

;; midterm: nat[<101] -> num[>0]
;; Purpose: produces midterm an integer indicating the
;; percentage of total grade in mid-mark midterm exan
(define (midterm mid-mark)
  (* mid (/ mid-mark percentage)))

;; final: nat[<101] -> num[>0]
;; Purpose: produces final-exam an integer indicating the
;; percentage of total grade in final-mark final exam
(define (final-exam final-mark)
  (* final (/ final-mark percentage)))

;; passing-cs115: nat nat nat -> symbol

;; Purpose: produce passing-cs115 the symbol that indicates
;; whether the combination of assign-mark mid-mark and
;; final-mark total marks received for each section has
;; passed the determined value for pass this course.

;; Examples: (passing-cs115 19 88 98) => 'pass
;; (passing-cs115 20 60 40) => 'fail
;; (passing-cs115 13 40 60) => 'pass
;; (passing-cs115 10 40 60) => 'fail 

(define (passing-cs115 assign-mark mid-mark final-mark)
  (cond[(< (+ (midterm mid-mark) 
              (final-exam final-mark))
           weighted-exam) 'fail]
       [(< (+ assign-mark
              (midterm mid-mark)
              (final-exam final-mark)) 
           passing-course) 'fail]
       [else 'pass]))

;; Tests for passing-cs115
;; fail for not passing the weighted exam average
(check-expect (passing-cs115 20 60 40) 'fail)
;; fail for not receiving a passing grade
(check-expect (passing-cs115 10 40 60) 'fail)
;; pass for receiving an exact grade of 50
(check-expect (passing-cs115 13 40 60) 'pass)
;; pass for receiving a grade over 50
(check-expect (passing-cs115 19 88 98) 'pass)