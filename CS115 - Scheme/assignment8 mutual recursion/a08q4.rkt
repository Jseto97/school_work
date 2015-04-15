;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a08q4) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "compound.rkt.txt" "installed-teachpacks")))))
;; *****************************  Question 4 *********************************************

(define-struct directory (name contents))
;; A directory is a structure (make-directory n c) where
;; n is a symbol (directory name)
;; c is lof (listof files)

;; A file is either
;;  a symbol (file name) or
;;  a directory (make-directory n c) where
;;  n is a symbol (directory name) and
;;  c is lof (listof files) 

;; A list of files lof is either
;; empty    or
;; (cons f lofd) where
;; f is a file and
;; lofd is a lof

;; Constants for examples and tests
(define dir2 (make-directory 'd2 (list 'f6 'f7)))
(define dir1 (make-directory 'd1 (list 'f4 'f5)))
(define dir12 (make-directory 'd12 (list 'f16 'f17)))
(define dir5 (make-directory 'd5 (list 'f14 'f55 dir12 )))
(define dir1b (make-directory 'd1 (list 'f4 'MMM)))
(define dir5b (make-directory 'd5 (list 'f14 'f55 (make-directory 'MMM (list 'f16 'f17)))))

(define mylof (list 'f1 'f2 dir1 dir2 'f8))
(define mylof2 (list 'f1 'f2 dir1 dir2 'f8 dir5))
(define mylof3 (list dir1b dir2 'f1 'f2  'f8 dir5b))

;;****************************************************************************************

;; Mutual recursive functions

;;-----------------------------------------------------------------------------------

;; directory-fun : symbol directory -> boolean

;; Purpose: produces a boolean value indicating whether the file with the given name
;; fname is in the given listof files flist. This function particularly checks if the
;; file fname is in the given directory dire

;; Examples for directory-fun
;; (directory-fun 'f7 dir1) => false
;; (directory-fun 'f7 dir2) => true

(define (directory-fun fname dire)
  (cond
    [(symbol=? fname (directory-name dire)) true]
    [else (find-file-lof? fname (directory-contents dire))]))

;; Tests for directory-fun
(check-expect (directory-fun 'f7 dir1) false)
(check-expect (directory-fun 'f7 dir2) true)
(check-expect (directory-fun 'f5 dir1b) false)
(check-expect (directory-fun 'f3 dir5) false)
(check-expect (directory-fun 'f6 dir12) false)
(check-expect (directory-fun 'f55 dir5b) true)

;;-----------------------------------------------------------------------------------

;; file-fun : symbol file -> boolean

;; Purpose: produces a boolean value indicating whether the file with the given name
;; fname is in the given listof files flist. This function particularly checks if the
;; file fname is in the given file flies

(define (file-fun fname flies)
  (cond 
    [(symbol? flies)
     (cond
       [(symbol=? fname flies) true]
       [else false])]
    [else (directory-fun fname flies)]))

;;****************************************************************************************

;; Main function

;; find-file-lof? : symbol lof -> boolean

;; Purpose: produces a boolean value indicating whether the file with the given name fname
;; is in the given listof files flist. This function checks the property of flist (lof, 
;; directory, or file) and send the parameter to the proper helper functions

;; Examples for find-file-lof?
;; (find-file-lof? 'f7 mylof) => true
;; (find-file-lof? 'fff mylof) => false

(define (find-file-lof? fname flist)
  (cond
    [(empty? flist) false]
    [(file-fun fname (first flist)) true]
    [else (find-file-lof? fname (rest flist))]))


;; Tests for find-file-lof?
(check-expect (find-file-lof? 'f2 empty) false)
(check-expect (find-file-lof? 'f7 mylof) true)
(check-expect (find-file-lof? 'fff mylof) false)
(check-expect (find-file-lof? 'f14 mylof2) true)
(check-expect (find-file-lof? 'fff mylof2) false)
(check-expect (find-file-lof? 'f16 mylof3) true)
(check-expect (find-file-lof? 'f55 mylof3) true)
(check-expect (find-file-lof? 'fff mylof3) false)
(check-expect (find-file-lof? 'd2 mylof3) true)