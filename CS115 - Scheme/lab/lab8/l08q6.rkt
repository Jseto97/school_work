;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l08q6) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
(define (make-sqr-al n b)
  (cond 
    [(= n b) (list (list b (sqr b)))]
    [else (append (list (list n (sqr n))) (make-sqr-al (add1 n) b))]))

(check-expect (make-sqr-al 1 2) (list (list 1 1) (list 2 4)))
(check-expect (make-sqr-al 5 5) (list (list 5 25)))
(check-expect (make-sqr-al 3 5) (list (list 3 9) (list 4 16) (list 5 25)))
(check-expect (make-sqr-al -3 0) (list (list -3 9) (list -2 4) (list -1 1) (list 0 0)))