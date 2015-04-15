;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07q1) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))

(define-struct card (value suit))
;; A card is a structure (make-card v s), where
;; v is an integer in the range from 1 to 10 and
;; s is a symbol from the set 'hearts, 'diamonds, 'spades, and 'clubs.

(define-struct card-node (value cards left right))
;;  A binary search tree hand-bst is either empty, 
;;  or a structure (make-card-node v c l r), where
;;   v is an integer, ranging between 1 and 10 
;;         showing the value of a playing card 
;;   c is a list of cards: (listof card) with the same value, v, 
;;         but from different suits
;;     and l, r  are of type hand-bst.
;;  all card values in l are less than v and 
;;  all card values in r are greater than v


;;Constants for cards
(define oneofdiamonds (make-card 1 'diamonds))
(define oneofspades (make-card 1 'spades))
(define oneofclubs (make-card 1 'clubs))
(define twoofhearts (make-card 2 'hearts))
(define twoofclubs (make-card 2 'clubs))
(define threeofhearts (make-card 3 'hearts))
(define threeofdiamonds (make-card 3 'diamonds))
(define threeofspades (make-card 3 'spades))
(define fiveofhearts (make-card 5 'hearts))
(define fiveofspades (make-card 5 'spades))
(define fiveofclubs (make-card 5 'clubs))
(define sevenofspades (make-card 7 'spades))

;;Constants for lists of cards
(define firstonelist (list oneofclubs))
(define firsttwolist (list twoofclubs))
(define firstthreelist (list threeofhearts threeofdiamonds threeofspades))
(define firstfivelist (list fiveofhearts fiveofspades))
(define secondonelist (list oneofdiamonds oneofspades))
(define secondtwolist (list twoofhearts))
(define secondfivelist (list fiveofclubs))
(define secondsevenlist (list sevenofspades))

;;Constants for hand-bsts
(define myrightsubtree (make-card-node 5 firstfivelist empty empty))
(define myleftsubtree (make-card-node 1 firstonelist empty 
                                      (make-card-node 2 firsttwolist empty empty)))
(define myhand (make-card-node 3 firstthreelist  
                               myleftsubtree             
                               myrightsubtree))

(define friendrightsubsubtree (make-card-node 5 secondfivelist empty empty))
(define friendleftsubsubtree (make-card-node 1 secondonelist empty empty))
(define friendleftsubtree (make-card-node 2 secondtwolist        
                                          friendleftsubsubtree  
                                          friendrightsubsubtree))

(define friendhand (make-card-node 7 secondsevenlist 
                                   friendleftsubtree 
                                   empty))

;; Question 1

;; A listof cards (aloc) is either
;; *empty or
;; *(cons c aloc), where
;;   c is a card
;;   aloc is a listof cards

;; constants
(define double 2)
(define c 'clubs)
(define d 'diamonds)
(define h 'hearts)
(define s 'spades)

;; count : card -> int[>0]
;; Purpose: produces a sum value of a given listof cards cards
;; Examples
;; (count firstonelist) => 1
;; (count firstthreelist) => 15
(define (count cards)
  (cond
    [(empty? cards) 0]
    [else (cond
            [(or (equal? (card-suit (first cards)) s) 
                 (equal? (card-suit (first cards)) c))
             (+ (card-value (first cards)) (count (rest cards)))]
            [(or (equal? (card-suit (first cards)) h)
                 (equal? (card-suit (first cards)) d))
             (+ (* double (card-value (first cards))) (count (rest cards)))])]))
;; Tests for count
(check-expect (count empty) 0)
(check-expect (count firstonelist) 1)
(check-expect (count firstthreelist) 15)
(check-expect (count secondsevenlist) 7)
(check-expect (count firstfivelist) 15)

;; sum:  hand-bst int[>=1][<=10] -> int[>0]
;; Purpose: produces a sum of all cards value in the given binary search tree hand without counting any
;; card value lower than the given value drawn-value
;; Examples for sum: (sum empty 5) => 0
;; (sum myrightsubtree 2) => 15
(define (sum hand drawn-value)
  (cond
    [(empty? hand) 0]
    [(< (card-node-value hand) drawn-value) 
     (sum (card-node-right hand) drawn-value)]
    [else (+ (count (card-node-cards hand))
             (sum (card-node-left hand) drawn-value) 
             (sum (card-node-right hand) drawn-value))]))
;; Tests for sum
(check-expect (sum empty 5) 0)
(check-expect (sum myrightsubtree 2) 15)
(check-expect (sum myhand 7) 0)
(check-expect (sum friendhand 3) 12)

;; winning-hand : hand-bst hand-bst int[>=1][<=10] -> (union 'handone 'handtwo 'tie) 

;; Purpose: produces a symbol indicating the winning-hand of the two given hand-bst hand1 and hand2

;; Examples
;; (winning-hand myhand friendhand 4) => 'handone
;; (winning-hand myhand friendhand 6) => 'handtwo

(define (winning-hand hand1 hand2 drawn-value)
  (cond
    [(> (sum hand1 drawn-value)
        (sum hand2 drawn-value)) 'handone]
    [(< (sum hand1 drawn-value)
        (sum hand2 drawn-value)) 'handtwo]
    [else 'tie]))

;; Tests for winning-hand
(check-expect (winning-hand myhand friendhand 4) 'handone)
(check-expect (winning-hand myhand friendhand 6) 'handtwo)
(check-expect (winning-hand friendhand myrightsubtree 3) 'handtwo)
(check-expect (winning-hand friendhand myleftsubtree 3) 'handone)
(check-expect (winning-hand myrightsubtree friendrightsubsubtree 2) 'handone)