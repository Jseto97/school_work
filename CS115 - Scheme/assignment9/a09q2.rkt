;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a09q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 2 *********************************************

;; find-common (list

(define (find-common lst1 lst2)
  (local
    [(define (member2? item)
       (cond
         [(member? item lst2) true]
         [else false]))]
    (filter member2? lst1)))

(check-expect (find-common empty empty) empty)
(check-expect (find-common (list 2 3 56 23 3) (list 3 2 4 56 4 14))
              (list 2 3 56 3))
(check-expect (find-common (list 56 29) (list 156 329 43)) empty)