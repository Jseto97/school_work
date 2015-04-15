#lang racket
(provide filter-sums)

;; filter-sums: (listof Int) -> (listof Int)
;;   PRE: true
;;   POST: produces a list containing the unique elements of lst
;;   that are a sum of any two other elements in lst
;;**********************************************************
;; (filter-sums lst)
;; Step 1. O(1), see below:
;;      empty?: O(1)
;;      first:  O(1)
;;      rest:   O(1)
;;      +:      O(1)
;;      O(1) + O(1) + O(1) + O(1) = O(1)
;; Step 2. n - 1
;; Step 3. T(n) = O(1) + T(n - 1)
;; Step 4. T(n) = O(n)
;;   TIME: O(n), where n is the length of lon
;;**********************************************************
(define (filter-sums lst)
  (local
    [;;since the run time for sort is logn, where n is the number
     ;; of elements in the given list, the run time for sorted is 
     ;; logn
     (define sorted (sort lst <))
     ;; the run time for same-adjacent-lst is O(n),
     ;; where n is the length of lon
     ;;**********************************************************
     ;; (same-adjacent-lst lon)
     ;; Step 1. O(1), see below:
     ;;      empty?: O(1)
     ;;      rest:   O(1)
     ;;      first:  O(1)
     ;;      second: O(1)
     ;;      cons:   O(1)
     ;;      =:      O(1)
     ;;      O(1) + O(1) + O(1) + O(1) + O(1) + O(1) = O(1)
     ;; Step 2. n - 1
     ;; Step 3. T(n) = O(1) + T(n - 1)
     ;; Step 4. T(n) = O(n)
     ;;   TIME: O(n), where n is the length of lon
     ;;**********************************************************
     (define (same-adjacent-lst lon)
       (cond
         [(or (empty? lon) (empty? (rest lon))) empty]
         [(= (first lon) (second lon)) 
          (cons (first lon) (same-adjacent-lst (rest lon)))]
         [else (same-adjacent-lst (rest lon))]))
     ;; the run time for remove-duplicates is O(n), where
     ;; n is the length of lst
     ;;**********************************************************
     ;; (remove-duplicates dlst lst)
     ;; Step 1. O(1), see below:
     ;;      empty?:   O(1)
     ;;      member:   O(n)
     ;;      remove:   O(n)
     ;;      first:    O(1)
     ;;      rest:     O(1)
     ;;      O(1) + O(n) + O(n) + O(1) + O(1) + O(1) = O(n)
     ;; Step 2. n - 1
     ;; Step 3. T(n) = O(n) + T(n - 1)
     ;; Step 4. T(n) = O(n^2)
     ;;   TIME: O(n^2), where n is the length of lon
     ;;**********************************************************
     (define (remove-duplicates dlst lst)
       (cond [(empty? dlst) lst]
             [(member (first dlst) lst) 
              (remove-duplicates dlst (remove (first dlst) lst))]
             [else (remove-duplicates (rest dlst) lst)]))
      ;;**********************************************************
     ;; (check-sum num alst)
     ;; Step 1. O(n), see below:
     ;;      empty?:   O(1)
     ;;      rest:     O(1)
     ;;      -:        O(1)
     ;;      member:   O(n)
     ;;      O(1) + O(1) + O(1) + O(n) = O(n)
     ;; Step 2. n - 1
     ;; Step 3. T(n) = O(n) + T(n - 1)
     ;; Step 4. T(n) = O(n^2)
     ;;   TIME: O(n^2), where n is the length of lon
     ;;**********************************************************
     (define (check-sum num alst)
       (cond [(or (empty? alst) (empty? (rest alst))) #f]
             [(member (- num (first alst)) (rest alst)) #t]
             [else (check-sum num (rest alst))]))
     (define (sum-lst dlst lon)
       (cond [(empty? dlst) empty]
             [(check-sum (first dlst) (remove (first dlst) lon))
              (cons (first dlst) (sum-lst (rest dlst) lon))]
             [else (sum-lst (rest dlst) lon)]))
     (define sorted-sum (sum-lst sorted sorted))]
    
    (remove-duplicates (same-adjacent-lst sorted) sorted-sum)))
