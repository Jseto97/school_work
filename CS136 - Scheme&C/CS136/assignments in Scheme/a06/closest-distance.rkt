#lang racket
(provide closest-distance)
;; closest-distance: (listof Int) -> Int
;;**********************************************************
;; (closest-distance lst)
;; Step 1. O(1), see below:
;;      len:      O(1)
;;      mid:      O(1)
;;      left:     O(1)
;;      right:    O(1)
;;      <=:       O(1)
;;      O(1) + O(1) + O(1) + O(1)+ O(1) = O(1)
;; Step 2. n/2
;; Step 3. T(n) = O(1) + 2T(n/2)
;; Step 4. T(n) = O(nlogn)
;;   TIME: O(nlogn), where n is the length of lon
;;**********************************************************

(define (closest-distance lst)
  (define len (length lst))
  (define mid (quotient len 2))
  (define left (drop-right lst mid))
  (define right (take-right lst mid))
  (cond [(<= len 1) lst]
        (define (compare lst1 lst2 accum)
          (cond
            [(empty? lst1) accum]
            [(empty? (rest lst1)) 
             (min accum (- (first lst2) (first lst1)))]
            [else (min 
            [(> num (first lon)) (compare num (rest lon))]
            [else (compare (first lon) (rest lon))]))
        [(> (first lst)