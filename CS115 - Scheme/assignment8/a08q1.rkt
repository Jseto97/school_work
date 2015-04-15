;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a08q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 1 *********************************************
;; Be sure to add the compound teachpack to your solution files.
;; Do NOT copy the compound definitions and constants into your solution files, or you 
;; will lose all correctness marks. 

;; element-in-compound : element compound -> nat
(define (element-in-compound elm comp) 
  (cond
    [(empty? (compound-pl comp)) 0]
    [(compound? (part-eoc (first(compound-pl comp))))
     (+ (* (part-size (first (compound-pl comp)))
           (element-in-compound elm (part-eoc (first(compound-pl comp)))))
        (element-in-compound elm
                             (make-compound (compound-name comp)
                                            (rest (compound-pl comp)))))]
    [(equal? elm (part-eoc (first(compound-pl comp))))
     (+ (part-size (first(compound-pl comp)))
        (element-in-compound elm
                             (make-compound (compound-name comp)
                                            (rest (compound-pl comp)))))]
    [else (element-in-compound elm
                             (make-compound (compound-name comp)
                                            (rest (compound-pl comp))))]))


;; Tests for element-in-compound
(check-expect (element-in-compound calcium so-four) 0)
(check-expect (element-in-compound argon po-four) 0)
(check-expect (element-in-compound iron iron-sulfate) 2)
(check-expect (element-in-compound oxygen glucose) 6)
(check-expect (element-in-compound hydrogen cinnamaldehyde) 8)
(check-expect (element-in-compound carbon glucose) 6)
(check-expect (element-in-compound phosphorus calcium-phosphate) 2)

;; min-elm : element compound compound -> symbol
(define (min-elm elm comp1 comp2)
  (cond 
    [(= (element-in-compound elm comp1)
        (element-in-compound elm comp2)) 'both]
    [(< (element-in-compound elm comp1)
        (element-in-compound elm comp2)) 
     (compound-name comp1)]
    [(> (element-in-compound elm comp1)
        (element-in-compound elm comp2)) 
     (compound-name comp2)]))

;; Tests for min-elm
(check-expect (min-elm iron iron-sulfate iron-sulfate) 'both)
(check-expect (min-elm oxygen po-four so-four) 'both)
(check-expect (min-elm oxygen po-four c123) 'c123)
(check-expect (min-elm phosphorus po-four calcium-phosphate) 'PO4)