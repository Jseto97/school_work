;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;*********************************************************
;;
;; CS 115 Assignment 03, Question 2
;; Tianlu Zhu
;; (checking the overlap of two intervals)
;;
;;*********************************************************

;; Helper functions
(define-struct cal (month day))
;; A cal is a structure (make-cal m d) where
;; m is an integer in the range 1-12
;; d is an integer in the range 1-31
;; and m and d represent a calendar entry in a non-leap year.

(define-struct interval (start end))
;; An interval is a structure (make-interval s e) where
;; s and e are both cal structures,
;; and s is no later than e in the same year.

;; Constant for overlap?:
(define cal3-1 (make-cal 3 1))
(define cal3-4 (make-cal 3 4))
(define cal3-8 (make-cal 3 8))
(define cal3-10 (make-cal 3 10))
(define cal8-9 (make-cal 8 9))
(define cal8-12 (make-cal 8 12))
(define cal8-23 (make-cal 8 23))
(define cal8-26 (make-cal 8 26))

(define reelsdates (make-interval cal3-1 cal3-4))
(define comedydates (make-interval cal3-8 cal3-10))
(define bluesdates (make-interval cal8-9 cal8-12))
(define buskersdates (make-interval cal8-23 cal8-26))

;; overlap? : struct struct -> boolean
;; consumes two interval structures, which represent a period
;; of time, and produces true if the time periods are overlap,
;; false if they are not

;; Examples:
;; (overlap? reelsdates comedydates) => false
;; (overlap? reelsdates (make-interval cal3-4 cal3-8)) => true
;; (overlap? bluesdates buskersdates) => false
;; (overlap? bluesdates (make-interval cal3-1 cal8-26)) => true
;; (overlap? bluesdates comedydates) => false
;; (overlap? comedydates bluesdates) => false

(define (overlap? int1 int2)
  (cond [(= (cal-month(interval-end int1))
            (cal-month(interval-start int2)))
         (cond [(< (cal-day(interval-end int1))
                   (cal-day(interval-start int2))) false]
               [else true])]
        [(and (>=(cal-month(interval-start int1))
                 (cal-month(interval-start int2)))
              (<=(cal-month(interval-end int1))
                 (cal-month(interval-end int2)))) true]
        [else false]))

;; Tests for overlap?
(check-expect (overlap? reelsdates comedydates) false)
(check-expect (overlap? reelsdates (make-interval cal3-4 cal3-8)) true)
(check-expect (overlap? bluesdates buskersdates) false)
(check-expect (overlap? bluesdates (make-interval cal3-1 cal8-26)) true)
(check-expect (overlap? bluesdates comedydates) false)
(check-expect (overlap? comedydates bluesdates) false)