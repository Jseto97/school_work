;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a06q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;; CS 115 Assignment 06, Question 1
;; Tianlu Zhu
;; (making necklace)
;;
;;************************************************

;; A (listof knots) is either
;;  empty or
;;  (cons k l), where
;;       k is a symbol ('red 'blue 'green), and
;;       l is a listof knots

;; A (listof beads) is either
;;  empty or
;;  (cons b r), where
;;       b is a symbol ('round 'square 'oval), and
;;       r is a listof beads

;; An association listof necklace is either
;;  empty or
;;  (list k alob alok alst), where
;;       k is a symbol (knot), 
;;       alob is a listof beads,
;;       alok is a listof knots, and
;;       alst is an association necklace list

;; constant
(define base 1)

;; create-necklace : (union listof knots[nonempty] listof beads[nonempty]) -> listof necklace[nonempty]

;; Purpose: produces listof necklace which contains (beads) list of some beads with different shapes and
;; (knots) list of knots with different colours. The listof necklace should contain at least one knots and
;; to keep the beads stay on the necklace, there should be knots at the start and the end of necklace

(define (create-necklace knots beads)
  (cond
    [(= base (length knots)) knots]
    [else (append (list (first knots) beads)
                (create-necklace (rest knots) beads))]))

;; Tests for create-necklace
(check-expect (create-necklace (list 'red) (list 'square 'square)) (list 'red))
(check-expect (create-necklace (list 'red 'blue) (list 'oval 'oval))
              (list 'red (list 'oval 'oval) 'blue))
(check-expect (create-necklace (list 'red 'green 'blue) (list 'round))
              (list 'red (list 'round) 'green (list 'round) 'blue))
(check-expect (create-necklace (list 'red 'blue 'blue 'red) (list 'oval 'oval))
              (list 'red (list 'oval 'oval) 'blue (list 'oval 'oval) 'blue (list 'oval 'oval) 'red))
(check-expect (create-necklace (list 'red 'blue 'blue) (list 'oval 'oval))
              (list 'red (list 'oval 'oval) 'blue (list 'oval 'oval) 'blue))