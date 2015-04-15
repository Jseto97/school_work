;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a02q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;********************************************************************
;;
;; CS 116 Assignment 02, Question 3
;; (build listof listof natural numbers)
;;
;;********************************************************************

;; mult-table: nat nat -> (listof (listof nat))

;; Purpose: produces a list contains (nr) small listof (nc) natural 
;; numbers as a multiple table. nr is the number of row while nc is 
;; the number of column

;; Examples: (mult-table 2 3) => (list (list 0 0 0) (list 0 1 2))
;; (mult-table 3 2) => (list (list 0 0) (list 0 1) (list 0 2))

(define (mult-table nr nc)
  (build-list nr 
              (lambda (r) 
                (build-list nc 
                            (lambda (c) (* r c))))))

;; Tests for mult-table
(check-expect (mult-table 0 0) empty)
(check-expect (mult-table 2 3) (list (list 0 0 0) (list 0 1 2)))