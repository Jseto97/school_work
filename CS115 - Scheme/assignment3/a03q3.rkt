;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;*********************************************************
;;
;; CS 115 Assignment 03, Question 3
;; Tianlu Zhu
;; (seasons of festivals)
;;
;;*********************************************************

;; structures
(define-struct cal (month day))
;; A cal is a structure (make-cal m d) where
;; m is an integer in the range 1-12
;; d is an integer in the range 1-31
;; and m and d represent a calendar entry in a non-leap year

(define-struct interval (start end))
;; An interval is a structure (make-interval s e) where
;; s and e are both cal structures,
;; and s is no later than e in the same year.

(define-struct festival (name location cost dates))
;; A festival is a structure (make-festival n l c d) where
;; n and l are both strings,
;; c is the symbol ’free or ’charge, and
;; d is an interval.

;; Constant definitions used in the examples below:
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
(define reels (make-festival "Rainbow Reels" "Waterloo" 'charge reelsdates))
(define comedy (make-festival "Uptown Waterloo Comedy Festival" "Waterloo" 'charge comedydates))
(define blues (make-festival "Kitchener Blues Festival" "Kitchener" 'free bluesdates))
(define buskers (make-festival "Busker Carnival" "Waterloo" 'free buskersdates))

;; Helper function
;; fest-month: struct -> int [>=1,<=12]
;; consumes the struct fest and produces an interger fest-month that
;; represents the number representing the month of the festival
(define (fest-month fest)
  (cal-month (interval-start (festival-dates fest))))

;; festival-season : struct -> symbol('spring 'summer 'fall 'winter)
;; produces symbol 'fall, 'winter, 'spring, or 'summer that indicates the
;; season of the festival

;; Examples
;; (festival-season blues) => 'summer
;; (festival-season reels) => 'spring
;; (festival-season comedy) => 'spring
;; (festival-season buskers) => 'summer
;; (festival-season mid-fall) => 'fall
;; (festival-season spring-festival) => 'winter

(define (festival-season fest)
  (cond [(and (>= (fest-month fest) 9)
              (<= (fest-month fest) 11)) 'fall]
        [(and (>= (fest-month fest) 3)
              (<= (fest-month fest) 5)) 'spring]
        [(and (>= (fest-month fest) 6) 
              (<= (fest-month fest) 8)) 'summer]
        [else 'winter]))

;; extra constants defined for tests
(define springdates (make-interval (make-cal 1 1) (make-cal 1 8)))
(define spring-festival (make-festival "Chinese Festival" "China" 'charge springdates)) ;; spring festival in winter
(define mid-autumn (make-interval (make-cal 9 15) (make-cal 9 16)))
(define mid-fall (make-festival "Chinese Festival" "China" 'free mid-autumn)) ;; mid-fall festival in fall

;; Tests for interval-season:
(check-expect (festival-season blues) 'summer)
(check-expect (festival-season reels) 'spring)
(check-expect (festival-season comedy) 'spring)
(check-expect (festival-season buskers) 'summer)
(check-expect (festival-season mid-fall) 'fall)
(check-expect (festival-season spring-festival) 'winter)