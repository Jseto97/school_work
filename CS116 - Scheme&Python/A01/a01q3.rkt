;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;;*******************************************************
;;
;; CS 116 Assignment 01, Question 3
;; (finding the member with least number from the given party)
;;
;;********************************************************

(define-struct mp (name riding party victory-margin))
;; An mp is a structure (make-mp n r p vm)
;; n is a nonempty string (name of the member of parliament)
;; r is a nonempty string (name of the riding the mp represents)
;; p is a symbol (name of the party for the mp), 
;;   for example 'CON, 'LIB, 'NDP, 'BQ, 'GRN 
;; vm is a positive integer (how many more votes the mp had than the 
;;   runner-up in their riding, in the most recent election)

;; Sample data
;; Source: http://www.cbc.ca/news/politics/canadavotes2011/myelection/ridings/
;; The mp information is correct (names, ridings, parties, but some victory margins have been
;; adjusted for testing purposes.
;; One riding for each province/territory.
(define rAB (make-mp "Lee Richardson" "Calgary Centre, AB" 'CON 19731))
(define rBC (make-mp "Elizabeth May" "Saanich - Gulf Islands, BC" 'GRN 2144)) ; was really 2359
(define rMB (make-mp "Niki Ashton" "Churchill, MB" 'NDP 4983))
(define rNB (make-mp "Dominic LeBlanc" "Beausejour, NB" 'LIB 2585))
(define rNL (make-mp "Jack Harris" "St. John's East, NL" 'NDP 22193))
(define rNT (make-mp "Dennis Bevington" "Western Arctic, NT" 'NDP 2144)) ; was really 2139
(define rNS (make-mp "Mark Eyking" "Sydney-Victoria, NS" 'LIB 860))
(define rNU (make-mp "Leona Aglukkaq" "Nunavut" 'CON 1751))
(define rON (make-mp "Peter Braid" "Kitchener-Waterloo, ON" 'CON 2144))
(define rPE (make-mp "Gail Shea" "Egmont, PE" 'CON 4469))
(define rQC (make-mp "Maria Mourani" "Ahuntsic, QC" 'BQ 708))
(define rSK (make-mp "Lynne Yelich" "Blackstrap, SK" 'CON 7412))
(define rYT (make-mp "Ryan Leef" "Yukon" 'CON 132))

;; narrow-victories: (listof mp)[nonempty] -> (listof string)

;; Purpose: produces a listof string indicates the name of the mp
;; who has the least victory margin in the given list members

;; Examples: (narrow-voctories rON) =>  (list "Peter Braid")
;; (narrow-victories (list
;; (make-mp "Lee Richardson" "Calgary Centre, AB" 'CON 19731)
;; (make-mp "Elizabeth May" "Saanich - Gulf Islands, BC" 'GRN 2144)
;; (make-mp "Dominic LeBlanc" "Beausejour, NB" 'LIB 2585)
;; (make-mp "Dennis Bevington" "Western Arctic, NT" 'NDP 2144)))
;; => (list "Elizabeth May" "Dennis Bevington")

(define (narrow-victories members)
  
  (local
    [(define margin-list
       (map mp-victory-margin members))
     ;; equal: int[four digits] -> boolean
     ;; Purpose: produces a boolean indicating whether the 
     ;; given mp item has the same victory-margin as the
     ;; least victory-margin in the given list margin-list
     (define (equal item)
       (= (mp-victory-margin item)
          (foldr min (first margin-list) margin-list)))]
    
    (map mp-name (filter equal members))))

;; Tests
(check-expect (narrow-victories (list rON)) (list "Peter Braid"))
(check-expect (narrow-victories (list rNT rBC rPE))
              (list "Dennis Bevington" "Elizabeth May"))
(check-expect (narrow-victories (list rYT rQC)) (list "Ryan Leef"))
(check-expect (narrow-victories (list rQC rON rNT)) (list "Maria Mourani"))
(check-expect (narrow-victories (list rAB rBC)) (list "Elizabeth May"))
(check-expect (narrow-victories (list rNL rON rBC rNT))
              (list "Peter Braid" "Elizabeth May" "Dennis Bevington"))