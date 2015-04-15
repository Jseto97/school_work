;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;*********************************************************
;;
;; CS 115 Assignment 03, Question 4
;; Tianlu Zhu
;; (better festival)
;;
;;*********************************************************

;; structure
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

;; better-festival: struct struct -> string
;; produces a string the name of the festival of the better one in the two
;; festivals by some specific way of select that compares a list of features
;; of the festival

;; Examples:
;; (better-festival blues reels) => "Kitchener Blues Festival"
;; (better-festival buskers blues) => "Busker Carnival"
;; (better-festival blues comedy) => "Kitchener Blues Festival"
;; (better-festival comedy buskers) => "Busker Carnival"
;; (better-festival comedy reels) => "Uptown Waterloo Comedy Festival"
;; (better-festival reels buskers) => "Busker Carnival"
;; (better-festival blues buskers) => "Busker Carnival"
;; (better-festival reels comedy) => "Rainbow Reels"

(define (better-festival fest1 fest2)
  (cond [(and (symbol=? 'free (festival-cost fest1))
              (not (symbol=? 'free (festival-cost fest2))))
         (festival-name fest1)]
        [(and (not (symbol=? (festival-cost fest1) 'free))
              (symbol=? (festival-cost fest2) 'free))
         (festival-name fest2)]
        [(and (symbol=? (festival-cost fest1) 'free)
              (symbol=? (festival-cost fest2) 'free))
        (cond [(and (string=? (festival-location fest1) "Waterloo")
                    (not (string=? (festival-location fest2) "Waterloo")))
               (festival-name fest1)]
              [(and (not (string=? (festival-location fest1) "Waterloo"))
                    (string=? (festival-location fest2) "Waterloo"))
               (festival-name fest2)])]
[else (cond [(and (string=? (festival-location fest1) "Waterloo")
                  (not (string=? (festival-location fest2) "Waterloo")))
             (festival-name fest1)]
            [(and (not (string=? (festival-location fest1) "Waterloo"))
                  (string=? (festival-location fest2) "Waterloo"))
             (festival-name fest2)]
            [else (festival-name fest1)])]))

;; Tests for better-festival
(check-expect (better-festival blues reels) "Kitchener Blues Festival")
(check-expect (better-festival buskers blues) "Busker Carnival")
(check-expect (better-festival blues comedy) "Kitchener Blues Festival")
(check-expect (better-festival comedy buskers) "Busker Carnival")
(check-expect (better-festival comedy reels) "Uptown Waterloo Comedy Festival")
(check-expect (better-festival reels buskers) "Busker Carnival")
(check-expect (better-festival blues buskers) "Busker Carnival")
(check-expect (better-festival reels comedy) "Rainbow Reels")