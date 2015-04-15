;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a01interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Question 1

(define (ones nats)
  ...)


;; Question 2 and 3 use the mp structure
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

;; Question 2

(define (members-by-party members party)
  ...)

;; Question 3
 
(define (narrow-victories members)
  ...)

;; Question 4

;; A student is a list of the form (list id cav passed failed),
;; where
;; id is a natural number (the student id number)
;; cav is a number between 0 and 100, inclusive (student's cumulative
;; average)
;; passed is a non-negative number (number of credits student has passed)
;; failed is a non-negative number (number of credits student has failed)
 
(define (candidates students)
   ...)