#lang racket

;; power1: Int Nat -> Int
;;   PRE: true
;;   POST: produces the value of a to the power of n
;;   TIME: O(n)
;;**********************************************************
;; (power1 a n)
;; Step 1. O(1), see below:
;;      zero?:  O(1)
;;      sub1:   O(1)
;;      *:      O(1)
;;      O(1) + O(1) + O(1)  = O(1)
;; Step 2. n - 1
;; Step 3. T(n) = O(1) + T(n - 1)
;; Step 4. T(n) = O(n)
;;   TIME: O(n), where n is the value of lon
;;**********************************************************
(define (power1 a n)
  (if (zero? n) 1 (* a (power1 a (sub1 n)))))

;; power2: Int Nat -> Int
;;   PRE: true
;;   POST: produces the value of a to the power of n
;;   TIME: logn
;;**********************************************************
;; (power2 a n)
;; Step 1. O(1), see below:
;;      =:        O(1)
;;      =:        O(1)
;;      even?:    O(1)
;;      sqr:      O(1)
;;      quotient: O(1)
;;      *:        O(1)
;;      O(1) + O(1) + O(1) + O(1) + O(1) +  O(1) = O(1)
;; Step 2. n / 2
;; Step 3. T(n) = O(1) + T(n / 2)
;; Step 4. T(n) = O(logn)
;;   TIME: O(logn), where n is the value of n
;;**********************************************************
(define (power2 a n)
  (cond
    ((= 0 n) 1)
    ((= 1 n) a)
    ((even? n) (power2 (sqr a) (quotient n 2)))
    (else (* a (power2 (sqr a) (quotient n 2))))))

;; power3: Int Nat -> Int
;;   PRE: true
;;   POST: produces the value of a to the power of n
;;   TIME: O(n)
;;**********************************************************
;; (power3 a n)
;; Step 1. O(1), see below:
;;      =:        O(1)
;;      =:        O(1)
;;      even?:    O(1)
;;      quotient: O(1)
;;      *:        O(1)
;;      O(1) + O(1) + O(1) + O(1) + O(1) = O(1)
;; Step 2. n / 2
;; Step 3. T(n) = O(1) + 2T(n / 2)
;; Step 4. T(n) = O(n)
;;   TIME: O(n), where n is the length of lon
;;**********************************************************
(define (power3 a n)
  (cond
    ((= 0 n) 1)
    ((= 1 n) a)
    ((even? n) (* (power3 a (quotient n 2))
                  (power3 a (quotient n 2))))
    (else (* (power3 a (quotient n 2))
             (power3 a (quotient n 2)) a))))
