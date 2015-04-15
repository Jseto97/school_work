#lang racket
(provide list-unique list-unique-fast)

;; list-unique: (listof Int) -> (listof Int)
;;   PRE: true
;;   POST: produces a list containing the unique elements of lst
;;   TIME: O(n^2), n is the length of lst
;;**********************************************************
;; (list-unique lst)
;; Step 1. O(1), see below:
;;      empty?: O(1)
;;      first:  O(1)
;;      filter:   O(n)
;;      cons:      O(1)
;;      O(1) + O(1) + O(n) + O(1) = O(n)
;; Step 2. n - 1
;; Step 3. T(n) = O(n) + T(n - 1)
;; Step 4. T(n) = O(n^2)
;;   TIME: O(n^2), where n is the length of lst
;;**********************************************************
;; there is no best or wrost case in this algorithm, it will go over the
;; entire list anyways. Thus the run time for this function is always n^2
(define (list-unique lst)
  (cond
    ((empty? lst) empty)
    (else
     (define el (first lst))
     (define el-free-lst (filter (lambda (x) (not (= el x))) (rest lst)))
     (cons el (list-unique el-free-lst)))))

;; list-unique-fast: (listof Int) -> (listof Int)
;;   PRE: true
;;   POST: prouces a list containing the unique elements of lst
;;   TIME: O(nlogn)
;;**********************************************************
;; (list-unique-fast lst)
;; Step 1. O(1), see below:
;;      sorted:                O(nlogn)
;;      not-same-adjacent-lst: O(n)
;;      wrapper:               O(n)
;;      O(n) + O(n) + O(nlogn) = O(nlogn)
;; Step 2. n - 1
;; Step 3. T(n) = O(nlogn) + T(n-1)
;; Step 4. T(n) = O(nlog n) + T(n-1) = O(nlogn)
;;   TIME: O(n), where n is the length of lst
;;**********************************************************
(define (list-unique-fast lst)
  (local
    [;; the run time for sorted is O(nlogn), where n is the 
     ;; length of lst
     (define sorted (sort lst <)) 
     ;; the run time for same-adjacent-lst is O(n),
     ;; where n is the length of lon
     ;;*****************************************************
     ;; (not-same-adjacent-lst num lon)
     ;; Step 1. O(1), see below:
     ;;      empty?: O(1)
     ;;      =:      O(1)
     ;;      first:  O(1)
     ;;      rest:   O(1)
     ;;      not:    O(1)
     ;;      cons:   O(1)
     ;;      O(1) + O(1) + O(1) + O(1) + O(1) + O(1) = O(1)
     ;; Step 2. n - 1
     ;; Step 3. T(n) = O(1) + T(n - 1)
     ;; Step 4. T(n) = O(n)
     ;;   TIME: O(n), where n is the length of lon
     ;;*****************************************************
     (define (not-same-adjacent-lst num lon)
       (cond
         [(or (empty? lon) (empty? (rest lon))) lon]
         [(not (= (first lon) num))
          (cons (first lon)
                (not-same-adjacent-lst (first lon) (rest lon)))]
         [else (not-same-adjacent-lst (first lon) (rest lon))]))
     ;;*****************************************************
     ;; (wrapper alist)
     ;; Step 1. O(1), see below:
     ;;      empty?: O(1)
     ;;      rest:   O(1)
     ;;      first:  O(1)
     ;;      second: O(1)
     ;;      not:    O(1)
     ;;      =:      O(1)
     ;;      O(1) + O(1) + O(1) + O(1) + O(1) + O(1) = O(1)
     ;; Step 2. n - 1
     ;; Step 3. T(n) = O(1) + T(n - 1)
     ;; Step 4. T(n) = O(n)
     ;;   TIME: O(n), where n is the length of lon
     ;;*****************************************************
     (define (wrapper alist)
       (cond
         [(or (empty? alist) (empty? (rest alist))) alist]
         [else (cons (first alist)
                     (not-same-adjacent-lst (first alist) (rest alist)))]))] 
    (wrapper sorted)))
;; Same here. There is no best or worst case in this algorithm, as it
;; will go over the entire list anyways. The run time is always nlogn