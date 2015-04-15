#lang racket

; dist: Int Int Int Int -> Int
;   PRE:  true
;   POST: produces value >= 0
(define (dist x1 y1 x2 y2)
  (+ (sqr (- x1 x2)) (sqr (- y1 y2))))

; sum_squares: Int -> Int
;   PRE:  n >= 1
;   POST: produces value >= 1
(define (sum_squares n)
  (/ (* n (+ n 1) (+ (* 2 n) 1)) 6))

; gcd: Int Int -> Int
;   PRE:  n >= 0
;         m >= 0
;   POST: produces value >= 0
(define (gcd n m)
  (cond
    [(zero? m) n]
    [else (gcd m (remainder n m))]))

; collatz: Int -> Int
;   PRE:  n >= 1
;   POST: produces value >= 1
(define (collatz n)
  (add1 (cond
          [(= n 1) 0]
          [(even? n) (collatz (/ n 2))]
          [else (collatz (+ 1 (* 3 n)))])))

; max3: Int Int Int -> Int
;   PRE:  true
;   POST: produces one of the arguments
(define (max3 a b c)
  (max a b c))
; NOTE: there is no built-in max in C.
;       you will have to write your own
;       to practice programming in C,
;       you can *NOT* create a helper function

