;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname l10q4) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))
;; Lab 10, Question 4
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

(define (odd-lengths bst)
  (cond 
    [(empty? bst) empty]
    [(odd? (string-length (node-val bst))) 
     (make-node (node-key bst)
                "odd"
                (odd-lengths (node-left bst))
                (odd-lengths (node-right bst)))]
    [else  (make-node (node-key bst)
                      (node-val bst)
                      (odd-lengths (node-left bst))
                      (odd-lengths (node-right bst)))]))

(check-expect (odd-lengths (make-node 5 "five"
                                      (make-node 1 "one" empty empty) 
                                      (make-node 6 "six" empty 
                                                 (make-node 14 "fourteen" empty empty))))
              (make-node 5 "five" 
                         (make-node 1 "odd"  empty empty)
                         (make-node 6 "odd" empty 
                                    (make-node 14 "fourteen" empty empty))))