;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;**************************************************************
;;
;; CS 115 Assignment 04, Question 4
;; Tianlu Zhu
;; (changing order of a list)
;;
;;**************************************************************

;; A (listof String) is:
;; *empty
;; *(list String)

;; Constants
(define N "N")

;; Helper functions

;; listAM : (listof string) -> (listof string)
;; produces a list that contains all the elements starting with
;; "A" to "M"

;; Examples
;; (aloAM empty) => empty
;; (aloAM (cons "Moore" empty) => (cons "Moore" empty)
;; (aloAM (cons "Zorro" empty) => empty
;; (aloAM (cons "Zheng" (cons "Zorro" (cons "King" empty)))) => (cons "King" empty)
;; (aloAM (cons "King" (cons "Zheng" (cons "Abbasi" (cons "Zorro"  (cons "Nehru" 
;;        (cons "Moore" empty))))))) => (cons "King" (cons "Abbasi" (cons "Moore" empty))))

(define (aloAM alist)
  (cond
    [(empty? alist) empty]
    [(string<? (first alist) N)
     (cons (first alist) (aloAM (rest alist)))]
    [else (aloAM (rest alist))]))

;; Tests for aloAM
(check-expect (aloAM empty) empty)
(check-expect (aloAM (cons "Moore" empty)) (cons "Moore" empty))
(check-expect (aloAM (cons "Zorro" empty)) empty)
(check-expect (aloAM (cons "Zheng" (cons "Zorro" (cons "King" empty))))
              (cons "King" empty))
(check-expect (aloAM (cons "King" (cons "Zheng" (cons "Abbasi"
                                                      (cons "Zorro" (cons "Nehru" (cons "Moore" empty)))))))
              (cons "King" (cons "Abbasi" (cons "Moore" empty))))
(check-expect (aloAM (cons "Zorro" (cons "Aden" (cons "Nehru" (cons "Aden" 
                                                                    (cons "Moore" empty))))))
              (cons "Aden" (cons "Aden" (cons "Moore" empty))))

;; listNZ : (listof string) -> (listof string)
;; produces a list that contains all the elements starting with
;; "N" to "Z"

;; Examples
;; (aloNZ empty) => empty
;; (aloNZ (cons "Moore" empty)) => empty
;; (aloNZ (cons"Zorro" empty)) => (cons "Zorro" empty)
;; (aloNZ (cons "King" (cons "Zheng" (cons "Abbasi" (cons "Zorro" (cons "Nehru" 
;;        (cons "Moore" empty))))))) => (cons "Zheng" (cons "Zorro" (cons "Nehru" empty)))
;; (aloNZ (cons "Zorro" (cons "Aden" (cons "Nehru" (cons "Aden" (cons "Moore" empty))))))
;;         =>(cons "Zorro" (cons "Nehru" empty)

(define (aloNZ alist)
  (cond
    [(empty? alist) empty]
    [(string>=? (first alist) N)
     (cons (first alist) (aloNZ (rest alist)))]
    [else (aloNZ (rest alist))]))

;; Tests for aloNZ
(check-expect (aloNZ empty) empty)
(check-expect (aloNZ (cons "Moore" empty)) empty)
(check-expect (aloNZ (cons"Zorro" empty)) (cons "Zorro" empty))
(check-expect (aloNZ (cons "Zheng" (cons "Zorro" (cons "King" empty))))
              (cons "Zheng" (cons "Zorro" empty)))
(check-expect (aloNZ (cons "King" (cons "Zheng" (cons "Abbasi"
                                                      (cons "Zorro" (cons "Nehru" (cons "Moore" empty)))))))
              (cons "Zheng" (cons "Zorro" (cons "Nehru" empty))))
(check-expect (aloNZ (cons "Zorro" (cons "Aden" (cons "Nehru" (cons "Aden" 
                                                                    (cons "Moore" empty)))))) 
              (cons "Zorro" (cons "Nehru" empty)))

;; moveing-order : list -> list
;; produces a new list indicating the order for students to move 
;; in the new residence by their last names
;; Examples
;; (moving-order empty) => empty
;; (moving-order (cons "Aden" empty)) => (cons "Aden" empty)
;; (moving-order (cons "King" (cons "Zheng" (cons "Abbasi"(cons "Zorro" (cons "Nehru" (cons "Moore" empty)))))))
;;                => (cons "King" (cons "Abbasi"(cons "Moore"(cons "Zheng" (cons "Zorro" (cons "Nehru" empty))))))
;; (moving-order (cons "Zheng" (cons "Zorro" (cons "King" empty))))
;;                => (cons "King" (cons "Zheng" (cons "Zorro" empty)))
;; (moving-order (cons "Zheng" (cons "Zorro" (cons "King" empty))))
;;                => (cons "King" (cons "Zheng" (cons "Zorro"empty)))
;; (moving-order (cons "Zorro" (cons "Aden" (cons "Nehru" (cons "Aden" (cons "Moore" empty))))))
;;                => (cons "Aden" (cons "Aden" (cons "Moore" (cons "Zorro" (cons "Nehru" empty)))))

(define (moving-order alist)
  (append (aloAM alist) (aloNZ alist)))

;; Tests for moving order
(check-expect (moving-order empty) empty)
(check-expect (moving-order (cons "Aden" empty))(cons "Aden" empty))
(check-expect (moving-order (cons "King" (cons "Zheng" (cons "Abbasi"(cons "Zorro" (cons "Nehru" (cons "Moore" empty)))))))
              (cons "King" (cons "Abbasi"(cons "Moore"(cons "Zheng" (cons "Zorro" (cons "Nehru" empty)))))))
(check-expect (moving-order (cons "Zheng" (cons "Zorro" (cons "King" empty))))
              (cons "King" (cons "Zheng" (cons "Zorro" empty))))
(check-expect (moving-order (cons "Zheng" (cons "Zorro" (cons "King" empty))))
              (cons "King" (cons "Zheng" (cons "Zorro"empty))))
(check-expect (moving-order (cons "Zorro" (cons "Aden" (cons "Nehru" (cons "Aden" (cons "Moore" empty))))))
              (cons "Aden" (cons "Aden" (cons "Moore" (cons "Zorro" (cons "Nehru" empty))))))
(check-expect(moving-order (cons "Sam"(cons "Tom" (cons"Tim" (cons"Calvin" (cons"Clive"(cons "Zheng" empty)))))))
             (cons "Calvin"(cons "Clive"(cons "Sam"(cons "Tom"(cons "Tim"(cons "Zheng" empty)))))))