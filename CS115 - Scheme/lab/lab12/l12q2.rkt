;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l12q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; Lab 12, Question 02
(define-struct card (value suit))
;; A card is a structure (make-card v s), where
;; * v is an integer in the range from 1 to 10 and
;; * s is a symbols from the set ’hearts, ’diamonds,
;; ’spades, and ’clubs.

(define (find-hearts aloc)
  (local
    [(define (heart item)
       (symbol=? (card-suit item) 'hearts))]
  (filter heart aloc)))

(check-expect (find-hearts
               (list (make-card 5 'hearts)
                     (make-card 10 'club)))
              (list (make-card 5 'hearts)))