;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a03q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;;**************************
;; Assignment 03 : CS116 W13
;;**************************

;;----------------  
;; Question #1
;;----------------

(define-struct trans (action amount))
;; A trans is a structure (make-trans a amt), 
;; that represents a transaction for a bank account, where
;; a is a symbol, either 'deposit or 'withdraw. A deposit is a 
;; payment made into the account. A withdrawal is a payment 
;; made out of the account.
;; amt is a positive number representing the amount added
;; or removed from the account.

;;For Testing 
(define trans1 (make-trans 'withdraw 604.34))
(define trans2 (make-trans 'deposit 300))
(define trans3 (make-trans 'withdraw 20.99))
(define trans4 (make-trans 'deposit 60)) 
(define trans5 (make-trans 'deposit 900))
(define trans6 (make-trans 'withdraw 55.5))
(define trans7 (make-trans 'deposit 100))
(define trans8 (make-trans 'deposit 40))

;; update-balance: (listof trans) num -> ((listof num) -> num)

;; Purpose: produces a number, which is either negative or positive,
;; indicating the sum of the starting value(start-bal) and all the 
;; values in the given list(lot)

;; Examples: (update-balance empty 20) => 20
;; (update-balance empty -5) => -5
;; (update-balance empty 0) => 0
;; (update-balance (list trans1) 0) => -604.34
;; (update-balance (list trans1 trans2) 0) => -304.34
;; (update-balance (list trans3 trans4 trans5 trans6 trans7 trans8) 50) => 1073.51

(define (update-balance lot start-bal)
  
  (local
    [;; add-bal: (listof trans) num -> num
     ;; Purpose: produces a number that adding up the values from
     ;; the given listof trans(lst) and the starting value(accum)
     (define (add-bal lst accum)
       (cond
         [(empty? lst) accum]
         [else
          (add-bal (rest lst) 
                   (+ accum (first lst)))]))
     
     ;; transfer: tran -> num
     ;; Purpose: produces a value of the given trans(tran) whose sign
     ;; depends on the action of tran. As the action symbol of tran is 
     ;; 'withdraw, the value amount of tran is negative; as the action 
     ;; symbol of tran is 'deposit, the value amount of tran is positive
     (define (transfer tran)
       (cond
         [(symbol=? 'withdraw (trans-action tran))
          (- (trans-amount tran))]
         [(symbol=? 'deposit (trans-action tran))
          (+ (trans-amount tran))]))
     
     ;; amt-lst is the value list of lot
     (define amt-lst (map transfer lot))]
    
    (add-bal amt-lst start-bal)))

;; Tests
;; Tests for empty trans list
(check-expect (update-balance empty -5) -5)
(check-expect (update-balance empty 0) 0)
(check-expect (update-balance empty 20) 20)
;; Tests for list with one element
(check-expect (update-balance (list trans1) 0) -604.34)
(check-expect (update-balance (list trans3) 51) 30.01)
(check-expect (update-balance (list trans2) -20) 280)
;; Tests for list with several elements
(check-expect (update-balance (list trans1 trans2) 0) -304.34)
(check-expect (update-balance (list trans2 trans3 trans4) -50) 289.01)
(check-expect (update-balance (list trans3 trans4 trans5 trans6 trans7 trans8) 50) 1073.51)