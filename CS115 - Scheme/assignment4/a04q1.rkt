;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;**************************************************************
;;
;; CS 115 Assignment 04, Question 1
;; Tianlu Zhu
;; (check all the letters in a world appear in "waterloo")
;;
;;**************************************************************

;; prededined list
(define waterloo (string->list "waterloo"))

;; A (listof char) is:
;; *empty
;; *(list char)

;; Helper function

;; check-single-letter: (listof char) -> boolean
;; produces a boolean. If all the letters in that word appear
;; in "waterloo", the function will produce true; otherwise it 
;; produces false
;; Examples
;; (check-single-letter empty) => true
;; (check-single-letter (string->list "toe")) => true
;; (check-single-letter (string->list "term")) => false

(define (check-single-letter alist)
  (cond
    [(empty? alist) true]
    [(member? (first alist) waterloo)
     (check-single-letter (rest alist))]
    [else false]))

;; Tests
(check-expect (check-single-letter empty) true)
(check-expect (check-single-letter (string->list "toe")) true)
(check-expect (check-single-letter (string->list "term")) false)


;; made-with-waterloo? : string -> boolean

;; produces a boolean. If all the letters in that word appear
;; in "waterloo", the function will produce true; otherwise it 
;; produces false

;; Examples
;; (made-with-waterloo? "eater") => true
;; (made-with-waterloo? "toe") => true
;; (made-with-waterloo? "alter") => true
;; (made-with-waterloo? "loop") => false
;; (made-with-waterloo? "term") => false

(define (made-with-waterloo? str)
  (check-single-letter (string->list str))) ;; Wrapper function

;; Tests for made-with-waterloo?
(check-expect (made-with-waterloo? "eater") true)
(check-expect (made-with-waterloo? "toe") true)
(check-expect (made-with-waterloo? "alter") true)
(check-expect (made-with-waterloo? "loop") false)
(check-expect (made-with-waterloo? "term") false)
(check-expect (made-with-waterloo? "watermelon") false)
(check-expect (made-with-waterloo? "rest") false)
(check-expect (made-with-waterloo? "at") true)