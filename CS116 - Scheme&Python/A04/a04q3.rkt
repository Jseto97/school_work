;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a04q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;; Question 3

;;--------------------------------------------------------------------
;; Structures

(define-struct RPS-player (name points current-streak))
;; A RPS-player is a structure (make-RPS-player n p c) where
;; * n is a nonempty string, for the player's name
;; * p is a nonnegative number, for the number of points the player 
;;   has in the current match
;; * c is a nat, for the number of rounds in a row that this player has 
;;   won in the current match 


(define-struct RPS-match (player1 player2 num-rounds))
;; A RPS-match is a structure (make-RPS-match p1 p2 n) where
;; * p1 and p2 are of type RPS-player, corresponding to 
;;   player 1 and player 2, 
;; * n is a nat, for the number of rounds completed in this match.


;; The type Legal-RPS-play is a symbol, one of 'rock, 'paper, 'scissors

;; state variables - 
;; Information about current RPS-match - the players are initially (void) and num-rounds is 0.
;; When a new match starts, the player structures will be initialized
(define current-match (make-RPS-match (void) (void) 0))
;; past-matches is the list of all completed matches of at least one play, in reverse order 
;; (i.e. most recently completed at the front of the list) - initialized to empty
(define past-matches empty)
;; highest-rate is the highest percentage (a number between 0 and 100) observed for a player
;; in a completed match - initialized to 0
(define highest-rate 0)

;;---------------------------------------------------------------------

(define (new-players name1 name2)
  ...)