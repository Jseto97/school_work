;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a08q3) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 3 *********************************************

;; A leaf-labelled tree llt is one of the following:
;; empty
;; (cons l1 l2) where
;;      l1 is a non-empty llt and
;;      l2 is a llt
;; (cons v l) where
;;      v is a string and
;;      l is a llt


;;Constants for tests and examples
(define myllt '(("hat" ("cat" "dog" "wow") ("abcba" "Wow" "nice") ("halah" "lol")) ("was saw" "end")))
(define myllt2 '(("hat" ("cat" "dog" "woww") ("abcbda" "nice") ("hala" "lolo")) ("was see" "end")))
(define myllt3 '("aaa" ("hat" ("cat" "dog" "woww") ("hala" "baab")) ("was see" "end")))
(define myllt4 '("xyz" ("hat" ("cat" "dog" "wow") ("abcba" "Wow" "nice") ("halah" "lol")) ("was saw" "end")))
(define res1 '("wow" "abcba" "halah" "lol" "was saw"))

;; A listof char (loc) is either
;; *empty
;; *(cons c l) where
;;     c is a character and 
;;     l is a loc

;; A listof str (los) is either
;; *empty
;; *(cons s l) where
;;     s is a string and 
;;     l is a loc

;;***************************************************************************
;;Helper functions

;;---------------------------------------------------------------------------

;; last : loc[nonempty] -> char

;; Purpose: produces the last element of the given list alist

;; Examples for last
;; (last (list #\a #\b)) => #\b
;; (last (list #\a #\c #\b)) => #\b
;; (last (list #\a #\p #\p #\l #\e)) => #\e

(define (last alist)
  (cond
    [(empty? (rest alist)) (first alist)]
    [else (last (rest alist))]))

;; Tests for last
(check-expect (last (list #\a)) #\a)
(check-expect (last (list #\a #\b)) #\b)
(check-expect (last (list #\a #\c #\b)) #\b)
(check-expect (last (list #\a #\p #\p #\l #\e)) #\e)
(check-expect (last (list #\a #\a #\a #\a #\a)) #\a)

;;---------------------------------------------------------------------------

;; remove-end : loc[nonempty] -> loc

;; Purpose: produces a new loc by removing the last element of the given list
;; alist

;; Examples for remove-end
;; (remove-end (list #\a)) => empty
;; (remove-end (list #\a #\b)) => (list #\a)
;; (remove-end (list #\a #\c #\b)) => (list #\a #\c)

(define (remove-end alist)
  (cond
    [(empty? (rest alist)) empty]
    [else (cons (first alist) (remove-end (rest alist)))]))

;; Tests for remove-end
(check-expect (remove-end (list #\a)) empty)
(check-expect (remove-end (list #\a #\b)) (list #\a))
(check-expect (remove-end (list #\a #\c #\b)) (list #\a #\c))
(check-expect (remove-end (list #\a #\p #\p #\l #\e)) (list #\a #\p #\p #\l))
(check-expect (remove-end (list #\a #\a #\a #\a #\a)) (list #\a #\a #\a #\a))

;;---------------------------------------------------------------------------

;; symmetry : loc -> boolean

;; Purpose: produces a boolean value indicating whether the given list alist
;; is palindrome, that is, alist is symmetric from the middle of the list

;; Examples for symmetry
;; (symmetry empty) => true
;; (symmetry (list #\h)) => true
;; (symmetry (list #\b #\e #\e)) => false
;; (symmetry (list #\a #\b #\c #\b #\a)) => true

(define (symmetry alist)
  (cond
    [(or (empty? alist)
         (empty? (rest alist))) true]
    [(equal? (first alist) (last alist))
     (symmetry (remove-end (rest alist)))]
    [else false]))

;; Tests
(check-expect (symmetry empty) true)
(check-expect (symmetry (list #\h)) true)
(check-expect (symmetry (list #\h #\a #\t)) false)
(check-expect (symmetry (list #\b #\e #\e)) false)
(check-expect (symmetry (list #\a #\b #\c #\b #\a)) true)
(check-expect (symmetry (list #\w #\a #\s #\space #\s #\a #\w)) true)
(check-expect (symmetry (list #\t #\e #\s #\t #\s)) false)
(check-expect (symmetry (list #\l #\o #\l)) true)

;;***************************************************************************

;; Main function

;; palindrome-strings : llt -> los

;; Purpose: produces a los which contains all the palindrome strings from the
;; given llt sllt

;; Examples for palindrome-string
;; (palindrome-strings myllt) => res1
;; (palindrome-strings myllt2) => empty

(define (palindrome-strings sllt)
  (cond
    [(empty? sllt) empty]
    [(and (string? (first sllt))
          (symmetry (string->list (first sllt))))
     (cons (first sllt)
           (palindrome-strings (rest sllt)))]
    [(string? (first sllt))
     (palindrome-strings (rest sllt))]
    [(cons? (first sllt))
     (append (palindrome-strings (first sllt))
             (palindrome-strings (rest sllt)))]))

;; Tests for palindrome-string
(check-expect (palindrome-strings empty) empty)
(check-expect (palindrome-strings myllt) res1)
(check-expect (palindrome-strings res1) res1)
(check-expect (palindrome-strings myllt2) empty)
(check-expect (palindrome-strings myllt3) (list "aaa" "baab"))
(check-expect (palindrome-strings (list myllt myllt2)) res1)
(check-expect (palindrome-strings (list myllt myllt3)) (append res1 (list "aaa" "baab")))