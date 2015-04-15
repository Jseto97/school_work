;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;*********************************************************
;;
;; CS 115 Assignment 03, Question 1
;; Tianlu Zhu
;; (calender entry)
;;
;;*********************************************************

;; structure for this function
(define-struct cal (month day))
;; A cal is a structure (make-cal m d) where
;; m is an integer in the range 1-12
;; d is an integer in the range 1-31
;; and m and d represent a calendar entry in a non-leap year.

;; constant
(define Feb 2)
(define Jul 7)
(define Aug 8)
(define lower-bound 0)
(define month-bound 13)

;; safe-make-cal: nat[>=1, <=12] nat[>=1, <=31] -> (union struct 'impossible)

;; produces the posn function of a calender with reasonable
;; month and date, or the symbol 'impossible if the given
;; numbers cannot satisfy the social acceptance for a 
;; calender

;; Examples for safe-make-cal:
;; (safe-make-cal -3 4) => 'impossible
;; (safe-make-cal 0 25) => 'impossible
;; (safe-make-cal 14 12) => 'impossible
;; (safe-make-cal 1 31) => (make-cal 1 31)
;; (safe-make-cal 2 5) => (make-cal 2 5)
;; (safe-make-cal 3 1) => (make-cal 3 1)
;; (safe-make-cal 4 30) => (make-cal 4 30)
;; (safe-make-cal 5 31) => (make-cal 5 31)
;; (safe-make-cal 7 31) => (make-cal 7 31)
;; (safe-make-cal 8 1) => (make-cal 8 1)
;; (safe-make-cal 8 31) => (make-cal 8 31)
;; (safe-make-cal 9 1) => (make-cal 9 1)
;; (safe-make-cal 10 1) => (make-cal 10 1)
;; (safe-make-cal 11 14) => (make-cal 11 14)
;; (safe-make-cal 11 30) => (make-cal 11 30)
;; (safe-make-cal 12 31) => (make-cal 12 31)
;; (safe-make-cal 1 0) => 'impossible
;; (safe-make-cal 2 29) => 'impossible
;; (safe-make-cal 3 32) => 'impossible
;; (safe-make-cal 4 31) => 'impossible
;; (safe-make-cal 6 0) => 'impossible
;; (safe-make-cal 7 32) => 'impossible
;; (safe-make-cal 8 32) => 'impossible
;; (safe-make-cal 9 0) => 'impossible
;; (safe-make-cal 10 32) => 'impossible
;; (safe-make-cal 11 31) => 'impossible
;; (safe-make-cal 12 0) => 'impossible

(define (safe-make-cal m d)
  (cond 
    [(and (= m Feb) (< 28 d) (< d 31)) 
     'impossible]
    [(and (> m Jul) (> month-bound m) (even? m)
          (< lower-bound d) (< d 32))
     (make-cal m d)]
    [(and (< m Aug) (> m lower-bound)
          (odd? m) (< lower-bound d) (< d 32))
     (make-cal m d)] 
    [(and (> m lower-bound) (< m month-bound)
          (< lower-bound d) (> 31 d))
     (make-cal m d)]
    [else 'impossible]))

;; Tests for safe-make-cal
;; month is out of range
(check-expect (safe-make-cal -3 4) 'impossible)
(check-expect (safe-make-cal 0 25) 'impossible)
(check-expect (safe-make-cal 14 12) 'impossible)
;; possible dates
(check-expect (safe-make-cal 1 31) (make-cal 1 31))
(check-expect (safe-make-cal 2 5) (make-cal 2 5))
(check-expect (safe-make-cal 3 1) (make-cal 3 1))
(check-expect (safe-make-cal 4 30) (make-cal 4 30))
(check-expect (safe-make-cal 5 31) (make-cal 5 31))
(check-expect (safe-make-cal 7 31) (make-cal 7 31))
(check-expect (safe-make-cal 8 1) (make-cal 8 1))
(check-expect (safe-make-cal 8 31) (make-cal 8 31))
(check-expect (safe-make-cal 9 1) (make-cal 9 1))
(check-expect (safe-make-cal 10 1) (make-cal 10 1))
(check-expect (safe-make-cal 11 14) (make-cal 11 14))
(check-expect (safe-make-cal 11 30) (make-cal 11 30))
(check-expect (safe-make-cal 12 31) (make-cal 12 31))
;; month is in the range, but day is out of range
(check-expect (safe-make-cal 1 0) 'impossible)
(check-expect (safe-make-cal 2 29) 'impossible)
(check-expect (safe-make-cal 3 32) 'impossible)
(check-expect (safe-make-cal 4 31) 'impossible)
(check-expect (safe-make-cal 6 0) 'impossible)
(check-expect (safe-make-cal 7 32) 'impossible)
(check-expect (safe-make-cal 8 32) 'impossible)
(check-expect (safe-make-cal 9 0) 'impossible)
(check-expect (safe-make-cal 10 32) 'impossible)
(check-expect (safe-make-cal 11 31) 'impossible)
(check-expect (safe-make-cal 12 0) 'impossible)