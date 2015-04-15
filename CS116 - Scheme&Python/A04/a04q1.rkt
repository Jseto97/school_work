;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname a04q1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;; Question 1

;;--------------------------------------------------------------------
(define-struct info (one two three))
;; An info  is a structure (make-info o tw th), 
;; where o, tw, th can be any values.

;; The following state variables are used in Question 1. 
(define a (void))
(define b (void))
(define c (void))
(define d (void))
(define f (void))

(define (part-A)
  (begin (set! a -1)
         (set! b -1)
         (set! c (make-info #\X true -1))
         (set! d (make-info "a" -1 "a"))
         (set! f d)))

(define (part-B)
  ...)