#lang racket
(define (sum-range a b)
  (foldr + 0 (build-list (add1 (- b a))
              (lambda (k) (+ k a)))))