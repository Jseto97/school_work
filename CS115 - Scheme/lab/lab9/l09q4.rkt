;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l09q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
(define (change pattern target)
  (cond
   [(empty? pattern) target]
   [(empty? target) target]
   [(char=? (first pattern) (first target))
    (cons (char-upcase (first target)) 
          (change (rest pattern) (rest target)))]
   [else (cons (first target) 
               (change pattern (rest target)))]))

(define (subseq-string pattern target)
  (list->string (change (string->list pattern) (string->list target))))

(check-expect (subseq-string "hat" "hhat") "HhAT")
(check-expect (subseq-string "atebr" "zebraebra") "zebrAebra")
(check-expect (subseq-string "abcd" "efg") "efg")
(check-expect (subseq-string "mmm" "mama") "MaMa")