;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07interface) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))

(define-struct card (value suit))
;; A card is a structure (make-card v s), where
;; v is an integer in the range from 1 to 10 and
;; s is a symbol from the set 'hearts, 'diamonds, 'spades, and 'clubs.

(define-struct card-node (value cards left right))
;;  A binary search tree hand-bst is either empty, 
;;  or a structure (make-card-node v c l r), where
;;  v is an integer, ranging between 1 and 10 
;;  showing the value of a playing card 
;;  c is a list of cards: (listof card) with the same value, v, 
;;  but from different suits
;;  and l, r  are of type hand-bst.
;;  all card values in l are less than v and 
;;  all card values in r are greater than v

(define-struct bae (fn arg1 arg2))
;; A binary arithmetic expression (binexp) is either
;; a number or
;; a structure (make-bae f a1 a2), where
;;   - f is a symbol in the set '*, '+, '/, '-,
;;   - a1 is a binexp, and
;;   - a2 is a binexp.

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

;;Constants for binary arithmetic expressions
(define bae1 (make-bae '+ 2 3))
(define left-bae (make-bae '* 2 3))
(define right-bae (make-bae '- 7 3))
(define root-bae (make-bae '/ left-bae right-bae))

;; Question 1

(define (winning-hand hand1 hand2 drawn-value) 
  ...)

;; Question 2

(define (multiply-exp m n multexp)
  ...)
  
;; Question 3

(define (insert-card ahand aval asuit)
  ...)

;; Question 4

(define (modern-species t)
  ...)