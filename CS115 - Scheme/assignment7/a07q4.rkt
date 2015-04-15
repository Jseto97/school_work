;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a07q4) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))
;; Question 4

;; A listof string (alos) is either
;; *empty or
;; *(cons s l), where
;;    s is a string
;;    l is a listof string

;; Helper functions

;; modern-list : taxon -> alos[nonempty]
;; Purpose: produces a listof string modern-list which contains a list of
;; modern descendants' names of this taxon on evolution tree
;; Example
;; (modern-list human) => (list "Homo Sapiens")
(define (modern-list t)
  (cond
    [(t-modern? t) (list (t-modern-name t))]
    [(t-ancient? t)
     (append (modern-list (t-ancient-left t))
             (modern-list (t-ancient-right t)))]))
;; tests for modern-list
(check-expect (modern-list human)(list "Homo Sapiens"))
(check-expect (modern-list primate) (list "Homo Sapiens" "Pan Troglodytes"))
(check-expect (modern-list vertebrate)
              (list "Homo Sapiens" "Pan Troglodytes" "Rattus Norvegicus" "Gallus Gallus"))

;; insert : string alos -> alos
;; Purpose: produces a new listof string by consuming a string name and a list name
;; and the new element name is placed before the elment after it in alphabeltic order
;; Examples
;; (insert "A" empty) => (cons "A" empty)
;; (insert "D" (list "B" "A" "E")) => (list "B" "A" "D" "E")
(define (insert name alist)
  (cond
    [(empty? alist) (cons name empty)]
    [(string<? name (first alist)) (cons name alist)]
    [else (cons (first alist) 
                (insert name (rest alist)))]))
;; Tests for insert
(check-expect (insert "A" empty) (cons "A" empty))
(check-expect (insert "A" (list "B" "C")) (list "A" "B" "C"))
(check-expect (insert "D" (list "B" "A" "E")) (list "B" "A" "D" "E"))

;; sort : alos -> alos
;; Purpose: produces a new listof string sorting the original listof string in
;; alphabetic order
;; Examples
;; (sort empty) => empty
;; (sort (list "C" "D" "A")) => (list "A" "C" "D")
(define (sort alist)
  (cond
    [(empty? alist) empty]
    [else (insert (first alist) (sort (rest alist)))]))
;; Tests for sort
(check-expect (sort empty) empty)
(check-expect (sort (list "B" "C" "I" "A" "H")) (list "A" "B" "C" "H" "I"))
(check-expect (sort (list "C" "D" "A")) (list "A" "C" "D"))
(check-expect (sort (list "D" "O" "L" "C")) (list "C" "D" "L" "O"))

;; modern-species : taxon -> alos

;; Purpose: produces a listof string indicating a list of modern descendants' names
;; of that given taxon t in alphabetic order

;; Examples
;; (modern-species human) => (list "Homo Sapiens")
;; (modern-species mammal) => (list "Homo Sapiens" "Pan Troglodytes" "Rattus Norvegicus")

(define (modern-species t)
  (sort (modern-list t)))

;; Tests for modern-species
(check-expect (modern-species human) (list "Homo Sapiens"))
(check-expect (modern-species rat) (list "Rattus Norvegicus"))
(check-expect (modern-species invertebrate) (list "Caenorhabditis Elegans" "Drosophila Melanogaster"))
(check-expect (modern-species mammal) (list "Homo Sapiens" "Pan Troglodytes" "Rattus Norvegicus"))
(check-expect (modern-species vertebrate) (list "Gallus Gallus" "Homo Sapiens" "Pan Troglodytes" "Rattus Norvegicus"))