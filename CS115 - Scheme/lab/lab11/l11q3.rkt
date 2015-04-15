;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l11q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
(define-struct t-node (label children))


(define (llt-count value llt)
  (cond
    [(empty? llt) 0]
    [(cons? (first llt))
     (+ (llt-count value (first llt))
        (llt-count value (rest llt)))]
    [(equal? value (first llt))
     (+ 1 (llt-count value (rest llt)))]
    [else (llt-count value (rest llt))]))

(check-expect (llt-count 2 '((1 2) ((2 3) 1 (3 4)) 2 (4))) 3)
(check-expect (llt-count 2 empty) 0)
(check-expect (llt-count 2 '(2 (1 2))) 2)
(check-expect (llt-count 3 '((1 2) ((2 3) 1 (3 4)) 2 (4))) 2)
(check-expect (llt-count 1 '((1 2) ((2 3) 1 (3 4)) 2 (4))) 2)
(check-expect (llt-count 4 '((1 2) ((2 3) 1 (3 4)) 2 (4))) 2)
