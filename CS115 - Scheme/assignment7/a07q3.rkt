;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07q3) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))
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

;; Question 3

;; insert-card : hand-bst int[>=1][<=10] (union 'clubs 'diamonds 'hearts 'spades) -> hand-bst

;; Purpose: produces a new binary search tree hand-bst by inserting another card (make-card alav asuit)
;; If the new value aval has already existed in hand-bst, then the suit asuit of the card is added to the
;; listof cards for suit

;; Examples for insert-card
;; (insert-card empty 9 'clubs) => (make-card-node 9 (list (make-card 9 'clubs)) empty empty)
;; (insert-card friendhand 5 'diamonds) => (make-card-node 7 (list (make-card 7 'spades)) (make-card-node 2
;;                                                           (list (make-card 2 'hearts)) (list (make-card 1 'diamonds) (make-card 1 'spades)) empty empty)
;;                                                           (make-card-node 5 (list (make-card 5 'diamonds) (make-card 5 'clubs)) empty empty)) empty)) 

(define (insert-card ahand aval asuit)
  (cond
    [(empty? ahand) 
     (make-card-node aval (list (make-card aval asuit)) empty empty)]
    [(= (card-node-value ahand) aval)
     (make-card-node (card-node-value ahand) 
                     (append (list (make-card aval asuit))
                             (card-node-cards ahand))
                     (card-node-left ahand)
                     (card-node-right ahand))]
    [(< (card-node-value ahand) aval)
     (make-card-node (card-node-value ahand)
                     (card-node-cards ahand)
                     (card-node-left ahand)
                     (insert-card (card-node-right ahand) aval asuit))]
    [(> (card-node-value ahand) aval)
     (make-card-node (card-node-value ahand)
                     (card-node-cards ahand)
                     (insert-card (card-node-left ahand) aval asuit)
                     (card-node-right ahand))]))

;; Tests for insert-card
(check-expect (insert-card empty 9 'clubs) (make-card-node 9 (list (make-card 9 'clubs)) empty empty))
(check-expect (insert-card friendhand 5 'diamonds) (make-card-node 7
                                                                   (list (make-card 7 'spades))
                                                                   (make-card-node 2
                                                                                   (list (make-card 2 'hearts))
                                                                                   (make-card-node 1
                                                                                                   (list (make-card 1 'diamonds) 
                                                                                                         (make-card 1 'spades)) empty empty)
                                                                                   (make-card-node 5
                                                                                                   (list (make-card 5 'diamonds) 
                                                                                                         (make-card 5 'clubs)) empty empty)) empty))
(check-expect (insert-card friendhand 9 'clubs) (make-card-node 7
                                                                (list (make-card 7 'spades))
                                                                (make-card-node 2
                                                                                (list (make-card 2 'hearts))
                                                                                (make-card-node 1
                                                                                                (list (make-card 1 'diamonds) (make-card 1 'spades))
                                                                                                empty
                                                                                                empty)
                                                                                (make-card-node 5
                                                                                                (list (make-card 5 'clubs))
                                                                                                empty
                                                                                                empty))
                                                                (make-card-node 9
                                                                                (list (make-card 9 'clubs))
                                                                                empty
                                                                                empty)))
(check-expect (insert-card friendleftsubtree 5 'diamond) (make-card-node 2 (list (make-card 2 'hearts))
                                                         (make-card-node 1 (list (make-card 1 'diamonds) (make-card 1 'spades)) empty empty)
                                                         (make-card-node 5 (list (make-card 5 'diamond) (make-card 5 'clubs)) empty empty)))
(check-expect (insert-card myrightsubtree 4 'spades) (make-card-node 5 (list (make-card 5 'hearts) (make-card 5 'spades))
                                                     (make-card-node 4 (list (make-card 4 'spades)) empty empty) empty))
(check-expect (insert-card myhand 4 'clubs) (make-card-node 3 (list (make-card 3 'hearts) (make-card 3 'diamonds) (make-card 3 'spades))
                                            (make-card-node 1 (list (make-card 1 'clubs)) empty 
                                            (make-card-node 2 (list (make-card 2 'clubs)) empty empty))
                                            (make-card-node 5 (list (make-card 5 'hearts) (make-card 5 'spades)) 
                                                            (make-card-node 4 (list (make-card 4 'clubs)) empty empty) empty)))