;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l11q5) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;; Lab 11, Q5

(define (pl-fun pl)
  (cond
    [(empty? pl) 0]
    [(part? (first pl))
     (+ (* (part-size (first pl))
           (molar-mass (part-eoc (first pl))))
        (pl-fun (rest pl)))]))

(define (molar-mass comp)
  (cond
    [(compound? comp)
     (pl-fun (compound-pl comp))]
    [(element? comp) (element-mmass comp)]))

(check-expect (molar-mass c489) 489)
(check-within (molar-mass calcium) 40.08 0.1)