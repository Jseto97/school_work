;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a06q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;************************************************
;;
;; CS 115 Assignment 06, Question 2
;; Tianlu Zhu
;; (multiple-choice exam result)
;;
;;************************************************

;; constants
(define base 0)
(define accumulate 1)

;; Helper function
;; exam-mark : (listof symbol) (listof symbol) -> nat
;; Purpose: produces (exam-mark) the number of correct letter symbols in (stud-ans)
;; the list of student's answers as they have the same position in (corr-ans) the list
;; of correct answers
;; Examples for exam-mark
;; (exam-mark (list 'C 'A 'D 'B 'C) (list 'D 'A 'C 'B 'C)) => 3
;; (exam-mark (list 'A 'A 'C 'D 'B 'D ) (list 'A 'C 'C 'D 'B 'D )) => 5
;; (exam-mark (list 'D 'A 'D 'D 'C) (list 'D 'B 'C 'B 'A )) => 1
;; (exam-mark (list 'A 'B 'C 'A 'D) (list 'B 'C 'A 'D)) => 0
;; (exam-mark (list 'C 'B 'C 'D 'A) (list 'A 'C 'B 'D 'C 'A)) => 1
;; (exam-mark (list 'A 'B 'C 'D 'A) (list 'A 'B 'C 'A)) => 3
(define (exam-mark corr-ans stud-ans)
  (cond
    [(or (empty? stud-ans) (empty? corr-ans)) base]
    [(symbol=? (first stud-ans) (first corr-ans))
     (+ accumulate (exam-mark (rest stud-ans) (rest corr-ans)))]
    [else (exam-mark (rest stud-ans) (rest corr-ans))]))
;; Tests for exam-mark
(check-expect (exam-mark (list 'C 'A 'D 'B 'C) (list 'D 'A 'C 'B 'C)) 3)
(check-expect (exam-mark (list 'A 'A 'C 'D 'B 'D ) (list 'A 'C 'C 'D 'B 'D )) 5)
(check-expect (exam-mark (list 'D 'A 'D 'D 'C) (list 'D 'B 'C 'B 'A )) 1)
(check-expect (exam-mark (list 'A 'C 'D 'D 'B 'A 'C) (list 'B 'A 'D 'D 'C 'B 'A)) 2)
(check-expect (exam-mark (list 'A 'B 'C 'D 'A) (list 'A 'B 'C 'A)) 3)
(check-expect (exam-mark (list 'A 'B 'C 'D 'A 'C) (list 'B 'B 'C 'A 'B 'C 'C)) 3)
(check-expect (exam-mark (list 'A 'B 'C 'A 'D) (list 'B 'C 'A 'D)) 0)
(check-expect (exam-mark (list 'C 'B 'C 'D 'A) (list 'A 'C 'B 'D 'C 'A)) 1)

;; student-pass? : (listof symbol) (listof symbol) nat -> boolean

;; Purpose: produces a boolean indicating whether the number of correct letter 
;; symbols in (stud-ans) the list of student's answer as they are also in the 
;; same position of (corr-ans) the list of correct answers is greater or equal
;; to (pass-mark) the given mark for pass

;; Examples for student-pass?
;; (student-pass? (list 'C 'A 'D 'B 'C) (list 'D 'A 'C 'B 'C) 0) => true
;; (student-pass? (list 'A 'A 'C 'D 'B 'D ) (list 'A 'C 'C 'D 'B 'D ) 4) =>true
;; (student-pass? (list 'D 'A 'D 'D 'C)(list 'D 'B 'C 'B 'A ) 3) => false
;; (student-pass? (list 'A 'B 'C 'D 'A 'C) (list 'B 'B 'C 'A 'B 'C 'C) 1) => true
;; (student-pass? (list 'A 'B 'C 'A 'D) (list 'B 'C 'A 'D) 2) => false
;; (student-pass? (list 'A 'B 'C 'D 'A) (list 'A 'B 'C 'A) 3) => true

(define (student-pass? corr-ans stud-ans pass-mark)
  (<= pass-mark (exam-mark stud-ans corr-ans)))

;; Tests for student-pass?
(check-expect (student-pass? (list 'C 'A 'D 'B 'C)
                             (list 'D 'A 'C 'B 'C) 0) true)
(check-expect (student-pass? (list 'A 'A 'C 'D 'B 'D )
                             (list 'A 'C 'C 'D 'B 'D ) 4) true)
(check-expect (student-pass? (list 'D 'A 'D 'D 'C)
                             (list 'D 'B 'C 'B 'A ) 3) false)
(check-expect (student-pass? (list 'A 'C 'D 'D 'B 'A 'C)
                             (list 'B 'A 'D 'D 'C 'B 'A) 4) false)
(check-expect (student-pass? (list 'A 'B 'C 'D 'A)
                             (list 'A 'B 'C 'A) 3) true)
(check-expect (student-pass? (list 'A 'B 'C 'D 'A 'C)
                             (list 'B 'B 'C 'A 'B 'C 'C) 1) true)
(check-expect (student-pass? (list 'A 'B 'C 'A 'D)
                             (list 'B 'C 'A 'D) 2) false)
(check-expect (student-pass? (list 'C 'B 'C 'D 'A)
                             (list 'A 'C 'B 'D 'C 'A) 3) false)