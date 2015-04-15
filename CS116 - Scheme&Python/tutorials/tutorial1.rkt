;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tutorial1) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
(define-struct foodcan (height radius weight label))
;; a foodcan is a structure (make-foodcan h r w l) where h, r, and w are
;; positive numbers (the height in cm, radius in cm, and weight in grams,
;; respectively) and l is a symbol (the label which goes on the can).

;; Cans for examples and tests: 
(define tomatocan (make-foodcan 10 4 400 'tomatoes))
(define beancan (make-foodcan 9 3 200 'beans))

;; supersize-it: (listof foodcans) -> (listof foodcans)
(define (supersize-it alofoodcan)
  (foldr (lambda (foodcan restlist)
           (cons (make-foodcan (* 2 (foodcan-height foodcan))
                               (foodcan-radius foodcan)
                               (* 2 (foodcan-weight foodcan))
                               (foodcan-label foodcan)) restlist))
         empty alofoodcan))

(check-expect (supersize-it (list tomatocan)) (list (make-foodcan 20 4 800 'tomatoes)))

;; large-cans: (listof foodcans) num[>0] -> (listof symbol)
(define (large-cans alofoodcan weight)
  (map (lambda (foodcan) (foodcan-label foodcan))
       (filter (lambda (weigh) (>= (foodcan-weight weigh) weight))
               alofoodcan)))

(check-expect (large-cans (list beancan tomatocan) 300)
              (list 'tomatoes))

;; total-volume: (listof foodcans) -> num[>0]
(define (total-volume foodcans)
  (foldr + 0
         (map (lambda (foodcan) (* pi (sqr (foodcan-radius foodcan))
                                   (foodcan-height foodcan))) foodcans)))
(check-within (total-volume (list tomatocan)) (* pi 160) 0.001)

;; powers-of-two: int[>0] -> (listof int[>0])
(define (powers-of-two n)
  (cond
    [(zero? n) (list 1)]
    [else (cons (expt 2 n) (powers-of-two (sub1 n)))]))

;; factors
(define (factors n)
     (local 
       [(define (check-remainder numerator)
          (cond
            [(> numerator n) empty]
            [(zero? (remainder n numerator))
             (cons numerator (check-remainder (add1 numerator)))]
            [else (check-remainder (add1 numerator))]))]
     (check-remainder 1)))
