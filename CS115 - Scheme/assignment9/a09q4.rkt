;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a09q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 4 *********************************************

;; ismember? (listof any) (listof any) -> (listof boolean)

;; Purpose:

;; Examples for ismember?
;; (ismember? empty empty) => empty
;; (ismember? (list 2 5)(list 5 2 3)) => (list true true)
;; (ismember? (list 10 5 7 12)empty) =>
;;              (list false false false false)

(define (ismember? lst1 lst2)
  (local
    [(define (member2? item)
       (cond
         [(member? item lst2) true]
         [else false]))]
    (map member2? lst1)))

;; Tests for ismember?
(check-expect (ismember? empty empty) empty)
(check-expect (ismember? (list 2 5)(list 5 2 3)) (list true true))
(check-expect (ismember? (list 10 5 10 12)(list 15 22 10))
              (list true false true false))
(check-expect (ismember? (list 10 5 7 12)empty)
              (list false false false false))
(check-expect (ismember? (list "nice" "no" "nice" "never")
                         (list "yes" "day" "nice"))
              (list true false true false))
(check-expect (ismember? (list 'red 'black 'white 'symbol)
                         (list 'empty 'dark 'red 'navy))
              (list true false false false))
(check-expect (ismember? (list 'red "black" 5 false) 
                         (list false 'dark "black" 15)) 
              (list false true false true))