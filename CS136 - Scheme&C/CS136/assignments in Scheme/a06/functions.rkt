#lang racket

;;**********************************************************
;; (sum lon)
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
(define (sum lon)
  (cond [(empty? lon) 0]
        [else (+ (first lon) (sum (rest lon)))]))

;;**********************************************************
;; (my-fun n)
;; Step 1. O(1), see below:
;;      zero?: O(1)
;;      *:     O(1)
;;      sub1:  O(1)
;;      +:     O(1)
;;      O(1) + O(1) + O(1) + O(1) = O(1)
;; Step 2. n - 1
;; Step 3. T(n) = O(1) + T(n - 1)
;; Step 4. T(n) = O(n)
;;   TIME: O(n), where n is the value of n
;;**********************************************************
(define (my-fun n)
  (cond
    ((zero? n) 0)
    (else (+ (* n n n) (my-fun (sub1 n))))))

;;**********************************************************
;; (fib n)
;; Step 1. O(1), see below:
;;      <:      O(1)
;;      sub1:   O(1)
;;      -:      O(1)
;;      +:      O(1)
;;      O(1) + O(1) + O(1) + O(1) = O(1)
;; Step 2. n - 1
;; Step 3. T(n) = O(1) + 2T(n - 1)
;; Step 4. T(n) = O(2^n)
;;   TIME: O(2^n), where n is the value of lon
;;**********************************************************
(define (fib n)
  (if (< n 2) n (+ (fib (sub1 n)) (fib (- n 2)))))

;;**********************************************************
;; (median-fast lon)
;; Step 1. O(n), see below:
;;      sorted:   O(n)
;;      len:      O(n)
;;      quotient: O(1)
;;      sub1:     O(1)
;;      +:        O(1)
;;      /:        O(1)
;;      sorted:   O(nlogn)
;;      O(n) + O(n) + O(1) + O(1) + O(1) + O(nlogn) = O(nlogn)
;; Step 2. no recursion in this case
;; Step 3. T(n) = O(nlogn)
;; Step 4. T(n) = O(nlogn)
;;   TIME: O(nlogn), where n is the length of lon
;;**********************************************************
(define (median-fast lon)
  (define sorted (sort lon <))
  (define len (length sorted))
  (/ (+ (list-ref sorted (quotient len 2)) 
        (list-ref sorted (quotient (sub1 len) 2))) 2))

;;**********************************************************
;; (median-slow lon)
;; Step 1. O(nlogn), see below:
;;      sort:       O(nlogn)
;;      empty?:     O(1)
;;      rest:       O(1)
;;      first:      O(1)
;;      second:     O(1)
;;      +:          O(1)
;;      /:          O(1)
;;      drop-right: O(n)
;;      O(nlogn) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(n) = O(nlogn)
;; Step 2. n - 1
;; Step 3. T(n) = O(nlogn) + T(n - 1)
;; Step 4. T(n) = O(n^2)
;;   TIME: O(n^2), where n is the length of lon
;;**********************************************************
(define (median-slow lon)
  (define (median-slow-helper sorted)
    (cond
      ((empty? (rest sorted)) (first sorted))
      ((empty? (rest (rest sorted))) 
       (/ (+ (first sorted) (second sorted)) 2))
      (else (median-slow-helper (drop-right (rest sorted) 1)))))
  (median-slow-helper (sort lon <)))

;; You can find out about the Tower of Hanoi problem here:
;; http://en.wikipedia.org/wiki/Tower_of_Hanoi
;;**********************************************************
;; (hanoi disks)
;; Step 1. O(1), see below:
;;      >:      O(1)
;;      -:      O(1)
;;      O(1) + O(1) = O(1)
;; Step 2. n - 1
;; Step 3. T(n) = O(1) + 2T(n - 1)
;; Step 4. T(n) = O(2^n)
;;   TIME: O(2^n), where n is the value of disks
;;**********************************************************
(define (hanoi disks)
  (define (hanoi-helper disks a b c)
    (cond 
      ((> disks 0) (hanoi-helper (- disks 1) a c b)
                   (printf "Move a disk from ~a to ~a\n" a b)
                   (hanoi-helper (- disks 1) c b a))))
  (hanoi-helper disks 'peg1 'peg2 'peg3))
