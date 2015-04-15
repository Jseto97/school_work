;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l11q2) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; Lab 11, Question 02
;; A general tree (gen-tree) is either
;;      a string or
;;      a structure (make-t-node l c), where
;;           l is a string and
;;           c is a tree-list.

;; A tree-list is either
;;      (cons t empty), where
;;           t is a gen-tree or      
;;      (cons t tlist), where
;;           t is a gen-tree and
;;           tlist is a tree-list.

(define-struct aevx (fn args))


(define (evalx aevx x)
  (cond
    [(number? aevx) aevx]
    [(equal? 'x aevx) x]
    [else
     (applyx (aevx-fn aevx) (aevx-args aevx) x)]))

(define (applyx fn exlist x)     
     (cond
       [(and (empty? exlist)
             (symbol=? '* fn)) 1]
       [(and (empty? exlist) 
             (symbol=? '+ fn)) 0]
       [(symbol=? fn '+)
        (+ (evalx (first exlist) x)
           (applyx fn (rest exlist) x))]
       [(symbol=? fn '*)
        (* (evalx (first exlist) x)
           (applyx fn (rest exlist) x))]))


(check-expect (evalx (make-aevx '* empty) 3) 1)
(check-expect (evalx (make-aevx '* (list 3 4)) 100) 12)
(check-expect (evalx (make-aevx '+ (list 1 2 3)) 5) 6)
(check-expect (evalx (make-aevx '+ (list 3 'x)) 2) 5)
(check-expect (evalx (make-aevx '* (list 'x 'x 4)) 3) 36)
(check-expect (evalx (make-aevx '+ (list (make-aevx '*
    (list 3 'x 5)) (make-aevx '+ (list 1 4 'x)) 9)) 1) 30)