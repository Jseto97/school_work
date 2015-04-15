;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l10q5) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; Lab 10, Question 5

(define-struct node (key val left right))
;; A binary search tree(bst) is either
;; *empty or
;; *a structure (make-node k v l r), where
;;   k is a number,
;;   v is a string,
;;   l is a bst, and
;;   r is a bst.
;;    (Every key in l is less than k.)
;;    (Every key in r is greater than k.)


(define (leftmost bst)
  (cond
    [(empty? bst) bst]
    [(empty? (node-left bst)) bst]
    [else (leftmost (node-left bst))]))