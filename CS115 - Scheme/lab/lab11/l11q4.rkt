;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l11q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
;; lab 11, Question 4


;; (define-struct single-product (name origin))
;; A single-product is a structure (make-single-product n o), where 
;; n is a string and o is a string denoting the country of origin.

;; (define-struct sales-product (ID prod) #:transparent)
;; A sales-product is a structure (make-sales-product i p), where i is an
;; integer and p is either a single-product or a product-list.

;; A product-list is either empty or it is (cons sp pl),
;; where sp is a sales-product and pl is a product-list.

(define (from-country? sales-product string)
  (cond
    [(single-product? sales-product)
     (cond
       [(equal? string (single-product-origin sales-product)) true]
       [else false])]
    [(sales-product? sales-product)
     (from-country? (sales-product-prod sales-product) string)]
    [(cons? sales-product)
     (or (from-country? (first sales-product) string)
          (from-country? (rest sales-product) string))]
    [else false]))

(check-expect (from-country? lipkit "Denmark") true)
(check-expect (from-country? promokit "Kenya") false)
(check-expect (from-country? lipbalmpack "Denmark") true)