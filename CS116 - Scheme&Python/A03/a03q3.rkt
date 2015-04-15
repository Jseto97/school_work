;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a03q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;**************************
;; Assignment 03 : CS116 W13
;;**************************

;;----------------  
;; Question #3
;;----------------

(define-struct student (id cav passed failed))
;; A student is a structure (make-student id cav p f)
;; id is a four digit natural number (student id number)
;; cav is a number between 0 and 100 (student's cumulative average)
;; p is a non-negative number (number of credits student passed)
;; f is a non-negative number (number of credits student failed)
   
;;Student definitions for Testing
(define stu1 (make-student 1112 78.5 5 1))
(define stu2 (make-student 3128 61.6 10 4))
(define stu3 (make-student 3123 55.3 8 5)) 
(define stu4 (make-student 4166 82.4 13 1))
(define stu5 (make-student 3146 89.4 14 0))
(define stu6 (make-student 3282 50.5 6 6))
(define stu7 (make-student 1236 60.1 9 5)) 
(define stu8 (make-student 3116 49.5 0 14))
(define stu9 (make-student 3252 50.0 8 6))
(define stu10 (make-student 2536 100.0 9 0)) 
(define stu11 (make-student 4936 0.0 0 9)) 

;; class-avg-range: (listof student) -> (list num[>0] num[>0])

;; Purpose: produces a list with two elements. the first element is the
;; average  cav among all the students in the given list class-list;
;; the second element is the range between the highest and lowest cav

(define (class-avg-range class-list)
  
  (local
    [;; calculate: nat num[>0] num[>0] num[>0] (listof student) 
     ;; -> (list num[>0] num[>0])
     ;; Purpose: produces a list with two elements as the main function
     ;; class-avg-range does by going through the given list(lst) once
     ;; and using accumlative recursion. Every time the paremeters(count)
     ;; (sum)(high)(low) are replaced by new values as the function goes 
     ;; through the list. (count) is the number of students in the list, 
     ;; (sum) is the accumlative sum of the students' cav in the list,
     ;; (high) and (low) are the highest and lowest cav in the list, (lst)
     ;; is the student list
     (define (calculate count sum high low lst)
       (cond
         [(empty? class-list) (list 0 0)]
         [(empty? lst) 
          (list (/ sum count) (- high low))]
         [else 
          (calculate (add1 count) 
                     (+ sum (student-cav (first lst))) 
                     (max high (student-cav (first lst))) 
                     (min low (student-cav (first lst))) 
                     (rest lst))]))]
    
    (calculate 0 0 0 100 class-list)))

;; Tests for class-avg-range
;; Test for empty class list
(check-expect (class-avg-range empty) (list 0 0))
;; Test for only one student in the class list
(check-expect (class-avg-range (list stu1)) (list 78.5 0))
;; Tests for several students in a class
(check-expect (class-avg-range (list stu1 stu3 stu5)) (list 74.4 34.1))
(check-expect (class-avg-range (list stu2 stu6 stu8 stu11)) (list 40.4 61.6))
(check-expect (class-avg-range (list stu2 stu3 stu4 stu5 stu6 stu7)) (list 66.55 38.9))

