;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;;*******************************************************
;;
;; CS 116 Assignment 01, Question 2
;; (list of members from the given party)
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

;; members-by-party: (listof mp) -> (listof mp)

;; Purpose: produces a listof mp which are in the given party name
;; party

;; Examples: (members-by-party empty 'NDP) => empty
;; (members-by-party (list rQC rSK rBC) 'CON) => (list rSK)
;; (members-by-party (list rNL rON rYT) 'CON) => (list rON rYT)

(define (members-by-party members party)
  
  (local
    [;; check-party: mp -> boolean
     ;; Purpose: produces a boolean indicating if the given
     ;; mp is in the given party name
     (define (check-party memp)
       (symbol=? party
                 (mp-party memp)))]
    
    (filter check-party members)))

;; Tests for members-by-party
;; test for empty list
(check-expect (members-by-party empty 'NDP) empty)
;; test for list with no member in the given party name
(check-expect (members-by-party (list rBC rON rNL) 'LIB) empty)
;; test for list with some members in the given party name
(check-expect (members-by-party (list rQC rSK rBC) 'CON) (list rSK))
(check-expect (members-by-party (list rNL rON rYT) 'CON) (list rON rYT))
(check-expect (members-by-party (list rAB rMB rNT rPE) 'CON) (list rAB rPE))