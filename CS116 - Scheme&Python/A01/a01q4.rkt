;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;;*******************************************************
;;
;; CS 116 Assignment 01, Question 4
;; (finding eligible candidates with given criteria)
;;
;;********************************************************

;; A student is a list of the form (list id cav passed failed),
;; where
;; id is a natural number (the student id number)
;; cav is a number between 0 and 100, inclusive (student's cumulative
;; average)
;; passed is a non-negative number (number of credits student has passed)
;; failed is a non-negative number (number of credits student has failed)

;; contants 
(define ave 90)
(define cload-down 4.5)
(define cload-up 6.0)
(define ten-higher 1.1)

;; candidates: (listof student) -> (listof int[4 digits])

;; Purpose: produces a list of four-digit integers indicating the student
;; number of the students from the given listof student students that meets
;; the criteria of candidates

;; Examples:
;; (candidates
;;             (list (list 9898 54.7 6.5 0) (list 1234 83.7 6 0)
;;                   (list 1140 57.9 5 0.5) (list 2311 68.5 5.5 0.5)
;;                   (list 6708 61.5 3 0.75))) => (list 1234)

(define (candidates students)
  
  (local
    [;; check-candidates: student -> boolean
     ;; Purpose: produces a boolean indicating whether the given student
     ;; astud meets the criteria as the student does not have failed
     ;; courses, has a courseload between 4.5 and 6.0, and has an acceptable
     ;; average
     (define (check-candidates astud)
       (and (= (fourth astud) 0)
            (>= (third astud) cload-down)
            (<= (third astud) cload-up)
            (or (>= (second astud) ave)
                (>= (second astud) higher))))
     ;; sum: (listof student) -> int[>=0]
     ;; Purpose: produces an integer number adding up all the students' 
     ;; averages from the given list alos
     (define (sum alos)
       (cond
         [(empty? alos) 0]
         [else (+ (second (first alos))
                  (sum (rest alos)))]))
     ;; average: (listof student) -> num[>=0]
     ;; Purpose: produces a number indicating the average of the given 
     ;; list of student students
     (define average
       (/ (sum students) (length students)))
     (define higher
       (* ten-higher average))]
    
    (map first (filter check-candidates students))))

;; Tests for candidates
;; Test for no student is eligible
(check-expect (candidates (list (list 1679 90.2 5.0 0.5))) empty)
;; Test for one student who has an average under 90
(check-expect (candidates (list (list 1235 85 4.5 0))) empty)
;; Test for one student who has an average over 90
(check-expect (candidates (list (list 2238 90.2 5.0 0))) (list 2238))
;; Test for students that no one is above 90
(check-expect (candidates (list (list 1235 85 4.5 0) (list 1062 63 8.5 1.0))) (list 1235))
(check-expect (candidates (list (list 9898 54.7 6.5 0) (list 1234 83.7 6 0)
                                (list 1140 57.9 5 0.5) (list 2311 68.5 5.5 0.5) (list 6708 61.5 3 0.75))) (list 1234))
;; Test for students that some of them are above 90
(check-expect (candidates (list (list 1024 67.3 4.5 0.5) (list 1238 83.7 6 0.25)
                                (list 2238 90.2 5.0 0) (list 2235 85.4 5.5 0))) (list 2238))
(check-expect (candidates (list (list 9820 48.2 6.5 1.0) (list 1368 88.7 5 0)
                                (list 1324 53.2 5.5 0.5) (list 2238 90.2 5.0 0))) (list 1368 2238))