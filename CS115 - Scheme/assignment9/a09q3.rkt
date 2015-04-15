;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a09q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 3 *********************************************

;; sorted-intersection : (listof num) (listof num) -> (listof num)

;; Purpose: produces a listof number in which each element in the list is in
;; both given list lst1 and lst2 and the elements are in desending order

;; Examples for sorted-intersection
;; (sorted-intersection (list 2 3 3)(list 2 3)) => (list 3 2)
;; (sorted-intersection (list 2 3 3)empty) => empty
;; (sorted-intersection (list 20 33 33)(list 33 20 33)) => (list 33 33 20)

(define (sorted-intersection lst1 lst2)
  (local
    [;; find : aritmetic expression(union > >= <) (listof num) (listof
     ;; num) -> (listof num)
     ;; Purpose: produces a listof num from the given lists of num lst1
     ;; and lst2 by the given arithmetic expression fn
     (define (find fn lst1 lst2)
       (cond
         [(fn (length lst1) (length lst2)) lst1]
         [else lst2]))
     (;; in-list : num -> boolean
      ;; Purpose: produces a boolean indicating whether the given number item
      ;; is an element of the given list produced by the function find
      define (in-list? item)
       (cond
         [(member? item (find >= lst1 lst2)) true]
         [else false]))
     (define find-common
       (filter in-list? (find < lst1 lst2)))]
    (sort find-common >)))

;; Tests for sorted-intersection
(check-expect (sorted-intersection empty empty) empty)
(check-expect (sorted-intersection empty (list 1 2 3)) empty)
(check-expect (sorted-intersection (list 2 3 3)(list 2 3)) (list 3 2))
(check-expect (sorted-intersection(list 13 1 12 12 13 33)
                                  (list 4 12 33 4))
              (list 33 12))
(check-expect (sorted-intersection (list 2 3 3)empty) empty)
(check-expect (sorted-intersection (list 20 33 33)(list 33 20 33))
              (list 33 33 20))
(check-expect (sorted-intersection (list 1 7 3 5 7 9 4) (list 5 7 9 6 1 4 3)) 
              (list 9 7 5 4 3 1))
(check-expect (sorted-intersection (list 1 2 3 4 5) (list 2 3 4 5 6)) (list 5 4 3 2))
(check-expect (sorted-intersection (list 10 11 12 13)(list 12 13 15)) (list 13 12))
(check-expect (sorted-intersection (list 13 12 12) (list 12 12 12 13)) (list 13 12 12))