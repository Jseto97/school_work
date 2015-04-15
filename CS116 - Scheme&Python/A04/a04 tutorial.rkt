;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |a04 tutorial|) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
(define-struct date (day month year))
;; A date is a structure (make-date d m y) where:
;;    * d is a nat in the range [1...30]
;;    * m is a nat in the range [1...12]
;;    * y is any integer

;; change-the-year: date int -> (void)
;; Purpose: consumes a date structure (birthday), and an 
;; integer (new-year), and produces nothing.

;; Effect: Mutates birthday so that its year is equal to new-year.

;; Example
;; (define date1 (make-date 1 1 1998))
;; (change-the-year date1 100) => (void)
;; date1 => (make-date 1 1 100)

(define (change-the-year birthday new-year)
  (set-date-year! birthday new-year))

;; Tests
(define date-test (make-date 1 1 0)) ; Testing variable

(check-expect (begin (set! date-test (make-date 4 10 1998))
                     (change-the-year date-test -3403)
                     (equal? date-test (make-date 4 10 -3403)))
              
              true)

;; change-year: (listof date) int -> string
;; Purpose: Consumes a list of date structures(birthdays), and an
;; integer(new-year), and produces the string "? dates changed", 
;; where ? is the length of birthdays.

;; Effect: Mutates each element of birthdays so that its year is 
;; equal to new-year.

;; Examples
;; --Ex1--
;; (define list0 empty)
;; (change-year list0 1992) => "0 dates changed"
;; list0 => empty

;; --Ex2--
;; (define list1 (list (make-date 1 7 3143) (make-date 2 14 100)))
;; (change-year list1 1998) => "2 dates changed"
;; list1 => (list (make-date 1 7 1998) (make-date 2 14 1998))

(define (change-year birthdays new-year)
  (local
    [;; birthday-acc: (listof date) nat -> string
     ;; Purpose: Consumes a list of date structure(birthdays-left), 
     ;; and a natural number(number-so-far), and produces the 
     ;; string "? dates changed" where ? is (number-so-far) plus 
     ;; the length of birthdays-left.
     ;; Effect: Mutates each element of birthdays-left so that its
     ;; year is equal to new-year.
     (define (birthday-acc birthdays-left number-so-far)
       (cond
         [(empty? birthdays-left)
          (string-append (number->string number-so-far) " dates changed")]
         [else
          (begin (change-the-year (first birthdays-left) new-year)
                 (birthday-acc (rest birthdays-left) (add1 number-so-far)))]))]
    (birthday-acc birthdays 0)))

;; Tests
(define produced (void)) ; Place holder for produced value in each test
(define test-list empty) ;testing constant

(check-expect (begin (set! test-list empty)
                     (set! produced (change-year test-list 1992))
                     (and (equal? test-list empty)
                          (equal? produced "0 dates changed")))
              true)
                     
(check-expect (begin (set! test-list (list (make-date 1 7 3143)))
                     (set! produced (change-year test-list -200))
                     (and (equal? test-list (list (make-date 1 7 -200)))
                          (equal? produced "1 dates changed")))
              true)

(check-expect (begin (set! test-list (list (make-date 8 3 1999)
                                           (make-date 12 12 1212)
                                           (make-date 23 6 1444)))
                     (set! produced (change-year test-list 2011))
                     (and (equal? test-list (list (make-date 8 3 2011)
                                                  (make-date 12 12 2011)
                                                  (make-date 23 6 2011)))
                          (equal? produced "3 dates changed")))
              true)