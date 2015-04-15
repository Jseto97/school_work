;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a02q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;*******************************************************
;;
;; CS 116 Assignment 02, Question 4
;; (count for least digit 1)
;;
;;********************************************************

(define-struct coin (name value))
;; A coin is a structure (make-coin n v),
;; that represents a valued coin, where
;;   n is a symbol, representing the name of the coin 
;;   v is a num, representing the value of the coin

;; constants for coins
(define penny (make-coin 'penny 0.01))
(define dime (make-coin 'dime 0.10))
(define quarter (make-coin 'quarter 0.25))
(define loonie (make-coin 'loonie 1.00))
(define toonie (make-coin 'toonie 2.00))
(define coins (list penny dime quarter loonie toonie))

;; money-count: (listof coin) change -> num

;; Purpose: produces the total value by adding up every
;; element in (change) refering to the penney value in
;; (coinlist). money-count is a function with coinlist
;; that consumes change to get the result

;; Examples: ((money-count (list (make-coin 'penny 0.01) (make-coin 'quarter 0.25)))
;; (list 'penny 'quarter 'nothing 'penny)) => 0.27

(define (money-count coinlist)         
  (lambda (change) 
    (foldr + 0 
           (map coin-value 
                (foldr append empty 
                       (map (lambda (change-coin)
                              (filter (lambda (coin-in-clst) 
                                        (symbol=? (coin-name coin-in-clst) change-coin)) 
                                      coinlist)) change))))))

;; Tests for money-count
;; Test for only one coin change for one element in the coinlist
(check-expect ((money-count coins) (list 'penny)) 0.01)
;; Test for one coin change for no match in the coinlist
(check-expect ((money-count (list penny)) (list 'dime)) 0)
;; Test for multiple coins
(check-expect ((money-count coins) (list 'dime 'penny 'dime)) 0.21)
(check-expect ((money-count coins) (list 'nothing 'toonie 'quarter)) 2.25); test for some symbol not in the coinlist
(check-expect ((money-count coins) (list 'penny 'quarter 'nothing 'penny)) 0.27)
(check-expect ((money-count coins) (list 'loonie 'penny 'dime)) 1.11)