;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l1204) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; Lab 12, Question 04
(define (switch-case str)
  (local
    [(define (switch item)
       (cond
         [(char-upper-case? item) (char-downcase item)]
         [(char-lower-case? item) (char-upcase item)]
         [else item]))]
    (list->string (map switch (string->list str)))))