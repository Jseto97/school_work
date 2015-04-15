;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a03q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;**************************
;; Assignment 03 : CS116 W13
;;**************************

;;----------------  
;; Question #4
;;----------------

;; go-fishff-points: lst -> nat

;; Purpose: produces a natural number indicating the sum of 
;; all the elements in the given list(card-list) that has 
;; appeared more than twice

;; Examples: (go-fishff-points empty) => 0
;; (go-fishff-points (list 4 4 4 4)) => 16
;; (go-fishff-points (list 2 2 2 5 5 5 5)) => 26
;; (go-fishff-points (list 3 3 4 7 7 8 8 12 13)) => 0
;; (go-fishff-points (list 4 6 6 7 7 9 9 9 9 12 14) => 36

(define (go-fishff-points card-list)
  
  (local
    [;; add: (listof int[>0]) nat int[>0] nat -> nat
     ;; Purpose: produces the sum of the given list with numbers
     ;; appear more than twice. (lst) is the given natural number
     ;; list, (num) is the number that is being counted, (count)
     ;; is the number of times the counted number appear, (accum)
     ;; is the accumlative sum of the number value
     (define (add lst num count accum)
       (cond
         [(empty? lst) accum]
         [(empty? (rest lst))
          (cond
            [(> count 2) 
             (+ accum (* count num))]
            [else accum])]
         [(= (first lst) (second lst))
          (add (rest lst) (first lst) (add1 count) accum)]
         [else
          (cond
            [(> count 2)
             (add (rest lst) num 1 (+ accum (* count num)))]
            [else
             (add (rest lst) num 1 accum)])]))]
    
    (add card-list 0 1 0)))

;; Tests 
;; Test for empty list
(check-expect (go-fishff-points empty) 0)
;; Test for list with four same number
(check-expect (go-fishff-points (list 4 4 4 4)) 16)
(check-expect (go-fishff-points (list 2 2 2 5 5 5 5)) 26)
;; Test for list with different numbers
(check-expect (go-fishff-points (list 1 2 3 4)) 0)
(check-expect (go-fishff-points (list 2 2 3 3 3 11 11 11 11 13)) 53)
(check-expect (go-fishff-points (list 3 3 4 7 7 8 8 12 13)) 0)
(check-expect (go-fishff-points (list 4 6 6 7 7 9 9 9 9 12 14)) 36)