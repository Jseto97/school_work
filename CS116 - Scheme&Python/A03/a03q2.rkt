;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a03q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;**************************
;; Assignment 03 : CS116 W13
;;**************************

;;----------------  
;; Question #2
;;----------------

;; repeat: string -> string

;; Purpose: produces a string that repeats every single elements
;; in that original string(str)

;; Examples: (repeat "") => ""
;; (repeat "a") => "aa"
;; (repeat "C") => "CC"
;; (repeat "abc") => "aabbcc"
;; (repeat "CS") => "CCSS"
;; (repeat "Nice") => "NNiiccee"

(define (repeat str)
  
  (local
    [;; combine: (listof char) (listof char) -> (listof char)
     ;; Purpose: produces a list of characters that combines 
     ;; (lst) and (accum) together with every elements in (lst)
     ;; appears twice
     (define (combine lst accum)
       (cond
         [(empty? lst) accum]
         [else 
          (combine (rest lst) 
                   (append 
                    (list (first lst) (first lst)) accum))]))]
    
    (list->string (reverse (combine (string->list str) empty)))))

;; Tests for repeat
(check-expect (repeat "") "")
(check-expect (repeat "a") "aa")
(check-expect (repeat "C") "CC")
(check-expect (repeat "abc") "aabbcc")
(check-expect (repeat "CS") "CCSS")
(check-expect (repeat "Nice") "NNiiccee")
(check-expect (repeat "defg") "ddeeffgg")
