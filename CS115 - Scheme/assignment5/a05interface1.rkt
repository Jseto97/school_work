;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05interface1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; CS115 Fall 2012 Assignment 05

(define-struct fullname (first middle last))

;; A fullname is a structure (make-fullname f m l), where
;; f is a string (first name)
;; m is a string (middle name)
;; l is a string (last name)

(define-struct student (name term term-grade))
;; A student is a structure (make-student n t tg), where
;; n is a fullname
;; t is a symbol from the set '1a, '1b, . . . , '5a, and '5b (latest completed term), and
;; tg is a number between 0 and 100 (student's average for the latest completed term)

(define name1 (make-fullname "Peter" "Lowenbrau" "Griffin"))
(define name2 (make-fullname "Agnes" "Gonxha" "Bojaxhiu"))
(define name3 (make-fullname "Jerome" "Allen" "Seinfeld")) 

(define student1 (make-student name1 '1a 32))
(define student2 (make-student name2 '5a 99.9))
(define student3 (make-student name3 '5a 75.5))

(define student-list (cons student1 (cons student2 (cons student3 empty))))

;; Question 1

(define (term-grade-stats alostud aterm) 
  ...)

;; Question 2

(define (moving-order alostud)
  ...)
  
;; Question 3

(define (list-of-squares n)
  ...)

;; Question 4

(define (sort-students alostud)
  ...)