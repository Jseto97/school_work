;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a08q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 1 *********************************************
;; Be sure to add the compound teachpack to your solution files.
;; Do NOT copy the compound definitions and constants into your solution files, or you 
;; will lose all correctness marks. 

;; Constants
(define base 0)
(define one 1)

;; Helper functions
;;----------------------------------------------------------------------------------------

;; pl-fun : element partlist -> nat

;; Purpose: produces a natural number indicating how many given element elm is in the given
;; partlist pl

;; Examples for pl-fun
;; (pl-fun argon (compound-pl po-four)) => 0
;; (pl-fun carbon (compound-pl glucose)) => 6
;; (pl-fun iron (compound-pl iron-sulfate)) => 2

(define (pl-fun elm pl)
  (cond
    [(empty? pl) base]
    [(part? (first pl))
     (+ (* (part-size (first pl))
           (eoc-fun elm (part-eoc (first pl))))
        (pl-fun elm (rest pl)))]))

;; Tests for pl-fun
(check-expect (pl-fun calcium (compound-pl so-four)) 0)
(check-expect (pl-fun argon (compound-pl po-four)) 0)
(check-expect (pl-fun iron (compound-pl iron-sulfate)) 2)
(check-expect (pl-fun oxygen (compound-pl glucose)) 6)
(check-expect (pl-fun hydrogen (compound-pl cinnamaldehyde)) 8)
(check-expect (pl-fun carbon (compound-pl glucose)) 6)
(check-expect (pl-fun phosphorus (compound-pl calcium-phosphate)) 2)

;;----------------------------------------------------------------------------------------

;; eoc-fun : elm compound -> nat

;; Purpose: produces a natural number indicating how many given element elm is in the given
;; compound comp

;; Examples
;; (eoc-fun calcium so-four) => 0
;; (eoc-fun oxygen glucose) => 6
;; (eoc-fun iron iron-sulfate) => 2

(define (eoc-fun elm comp)
  (cond
    [(compound? comp)
     (pl-fun elm (compound-pl comp))]
    [(equal? elm comp) one]
    [else base]))

;; Tests for eoc-fun
(check-expect (eoc-fun calcium so-four) 0)
(check-expect (eoc-fun argon po-four) 0)
(check-expect (eoc-fun iron iron-sulfate) 2)
(check-expect (eoc-fun oxygen glucose) 6)
(check-expect (eoc-fun hydrogen cinnamaldehyde) 8)
(check-expect (eoc-fun carbon glucose) 6)
(check-expect (eoc-fun phosphorus calcium-phosphate) 2)

;;--------------------------------------------------------------------------------------------

;; Main function

;; min-elm : element compound compound -> symbol

;; Purpose: produces a symbol from the two given compounds comp1 comp2. If they have the same amount
;; of given elements, the function will produce a symbol 'both; if not, the function will produce name of
;; the one with less number of elements

;; Examples
;; (min-elm iron iron-sulfate iron-sulfate) => 'both
;; (min-elm oxygen po-four c123) => 'c123
;; (min-elm phosphorus po-four calcium-phosphate) => 'PO4

(define (min-elm elm comp1 comp2)
  (cond 
    [(= (eoc-fun elm comp1)
        (eoc-fun elm comp2)) 'both]
    [(< (eoc-fun elm comp1)
        (eoc-fun elm comp2)) 
     (compound-name comp1)]
    [(> (eoc-fun elm comp1)
        (eoc-fun elm comp2)) 
     (compound-name comp2)]))

;; Tests for min-elm
(check-expect (min-elm iron iron-sulfate iron-sulfate) 'both)
(check-expect (min-elm oxygen po-four so-four) 'both)
(check-expect (min-elm oxygen po-four c123) 'c123)
(check-expect (min-elm phosphorus po-four calcium-phosphate) 'PO4)
(check-expect (min-elm phosphorus cinnamaldehyde glucose) 'both)
(check-expect (min-elm carbon glucose cinnamaldehyde) 'glucose)