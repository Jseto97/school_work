;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;************************************************
;;
;; CS 115 Assignment 02, Question 1
;; Tianlu Zhu
;; (alarm set calculation)
;;
;;************************************************

;; set-alarm: int[>0][<8] -> int[>0][<13]

;; Purpose: produce set-alarm the time to get up 
;; which consumes day the day of a week

;; Examples: (set-alarm 1) => 7
;; (set-alarm 2) => 9
;; (set-alarm 3) => 7
;; (set-alarm 4) => 9
;; (set-alarm 5) => 7
;; (set-alarm 6) => 11
;; (set-alarm 7) => 12

(define (set-alarm day)
  (cond [(> day 5) (+ day 5)]
        [(even? day) 9]
        [(odd? day) 7]))

;; Tests for set-alarm
;; To get up at 7am on Mondays, Wednesdays, and
;; Fridays
(check-expect (set-alarm 1) 7)
(check-expect (set-alarm 3) 7)
(check-expect (set-alarm 5) 7)
;; To get up at 9am on Tuesdays and Thursdays
(check-expect (set-alarm 2) 9)
(check-expect (set-alarm 4) 9)
;; To get up at 11am on Saturdays
(check-expect (set-alarm 6) 11)
;; To get up at noon on Sundays
(check-expect (set-alarm 7) 12)
