;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; CS115 Fall 2012 Assignment 05

;; Question 1

(define-struct fullname (first middle last))
;; A fullname is a structure (make-fullname f m l), where
;; f is a string (first name)
;; m is a string (middle name)
;; l is a string (last name)

(define-struct student (name term term-grade))
;; A student is a structure (make-student n t tg), where
;; n is a fullname
;; t is a symbol from the set '1a, '1b, . . . , '5a, and '5b (latest completed term), and
;; tg is a number between 0 and 100 (student's average for the latest completed term)

(define name1 (make-fullname "Peter" "Lowenbrau" "Griffin"))
(define name2 (make-fullname "Agnes" "Gonxha" "Bojaxhiu"))
(define name3 (make-fullname "Jerome" "Allen" "Seinfeld")) 

;; More constants for tests
(define nameA (make-fullname "Angle" "Allen" "Ali"))
(define nameB (make-fullname "Bob" "Bean" "Bercirker"))
(define nameC (make-fullname "Care" "Cake" "Caityln"))
(define nameD (make-fullname "Dare" "Dell" "Daly"))
(define nameE (make-fullname "Eddie" "Eat" "Eve"))
(define nameF (make-fullname "Farm" "Fly" "Fat"))
(define nameG (make-fullname "Gell" "Gate" "Gage"))
(define nameH (make-fullname "Happy" "Helen" "Heroine"))
(define nameI (make-fullname "Inn" "Ink" "Ian"))
(define nameJ (make-fullname "Jake" "Joe" "Jonathan"))
(define nameK (make-fullname "Kate" "King" "Kyle"))
(define nameL (make-fullname "Lucy" "Lily" "Lynn"))
(define nameM (make-fullname "Mike" "Man" "Mean"))
(define nameN (make-fullname "Nick" "Neat" "Ning"))
(define nameO (make-fullname "Olive" "Ola" "Obama"))
(define nameP (make-fullname "Penny" "Page" "Peng"))
(define nameQ (make-fullname "Queen" "Qian" "Qin"))
(define nameR (make-fullname "Riddle" "Ray" "Risk"))
(define nameS (make-fullname "Susan" "Sexy" "Shen"))
(define nameT (make-fullname "Tian" "Tory" "Ted"))
(define nameU (make-fullname "Uren" "Idea" "Uk"))
(define nameV (make-fullname "Vitas" "Vote" "Vickie"))
(define nameW (make-fullname "Weight" "Window" "Wang"))
(define nameX (make-fullname "Xiang" "Xiao" "Xi"))
(define nameY (make-fullname "Yuri" "Yellow" "Yu"))
(define nameZ (make-fullname "Zoe" "Zheng" "Zhang"))


(define student1 (make-student name1 '1a 32))
(define student2 (make-student name2 '5a 99.9))
(define student3 (make-student name3 '5a 75.5))

(define studentA (make-student nameA '2a 68))
(define studentB (make-student nameB '1a 85))
(define studentC (make-student nameC '3b 98))
(define studentD (make-student nameD '1a 72))
(define studentE (make-student nameE '1b 84))
(define studentF (make-student nameF '1a 79))
(define studentG (make-student nameG '2a 71))
(define studentH (make-student nameH '3a 95))
(define studentI (make-student nameI '1b 83))
(define studentJ (make-student nameJ '1a 80))
(define studentK (make-student nameK '1a 76))
(define studentL (make-student nameL '1b 45))
(define studentM (make-student nameM '1a 32))
(define studentN (make-student nameN '2a 75))
(define studentO (make-student nameO '4a 73))
(define studentP (make-student nameP '2a 67))
(define studentQ (make-student nameQ '1b 74))
(define studentR (make-student nameR '3b 55))
(define studentS (make-student nameS '1a 85))
(define studentT (make-student nameT '1a 93))
(define studentU (make-student nameU '3a 68))
(define studentV (make-student nameV '1b 65))
(define studentW (make-student nameW '1a 75))
(define studentX (make-student nameX '2a 83))
(define studentY (make-student nameY '1a 66))
(define studentZ (make-student nameZ '4a 88))

(define list1 (list studentA studentI studentS studentH studentC))
(define list2 (list studentY studentW studentB studentK studentP studentX studentQ studentM))
(define list3 (list studentR studentV studentP studentD studentA studentK studentC))
(define list4 (list studentG studentN studentL studentZ studentI studentE studentR studentT studentH))
(define list5 (list studentJ studentF studentW studentX studentU studentI studentA studentO studentE studentY studentN))
(define list6 (list studentE studentQ studentN studentS studentB studentM studentX studentR studentZ studentF))
(define list7 (list studentG studentB studentF studentI studentD))
(define list8 (list studentY studentR studentO studentT studentX))
(define list9 (list studentS studentW studentQ studentC studentH studentN studentP studentK))

;; count-stud : (union of listof student symbol) -> nat
;; Purpose: produces the number of cases in the list alostud that contains the symbol aterm
;; Examples:
;; (count-stud empty '1a) => 0
;; (count-stud list1 '1a) => 1
;; (count-stud list2 '2b) => 0
;; (count-stud list2 '1a) => 5

(define (count-stud alostud aterm)
  (cond
    [(empty? alostud) 0]
    [(symbol=? aterm (student-term(first alostud)))
     (+ 1 (count-stud (rest alostud) aterm))]
    [else (count-stud (rest alostud) aterm)]))
;; Tests for count-stud
(check-expect (count-stud empty '1a) 0)
(check-expect (count-stud list1 '1a) 1)
(check-expect (count-stud list2 '1a) 5)
(check-expect (count-stud list2 '2b) 0)
(check-expect (count-stud list7 '1a) 3)

;; sum-grade : (union of listod student symbol) -> nat
;; Purpose: produces the sum of the grades of students in the term aterm
;; Examples:
;; (sum-grade empty '1a) => 0
;; (sum-grade list1 '2b) => 0
;; (sum-grade list2 '2a) => 150
(define (sum-grade alostud aterm)
  (cond
    [(empty? alostud) 0]
    [(symbol=? aterm (student-term(first alostud)))
     (+ (student-term-grade(first alostud)) (sum-grade (rest alostud) aterm))]
    [else (sum-grade (rest alostud) aterm)]))
;; Tests for sum-grade
(check-expect (sum-grade empty '1a) 0)
(check-expect (sum-grade list1 '2b) 0)
(check-expect (sum-grade list2 '2a) 150)
(check-expect (sum-grade list7 '1a) 236)
(check-expect (sum-grade list6 '1b) 158)

;; term-grade-stats : (union of listof student symbol) -> (union of symbol num[>=0])

;; Purpose: produces the average grade of given term aterm over a list of students; if there is no students
;; in the given term, then produces a symbol 'unknown

;; Examples
;; (term-grade-stats empty '1a) => 'unknown
;; (term-grade-stats list1 '2b) => 'unknown
;; (term-grade-stats list2 '2a) => 75
;; (term-grade-stats (list student1 student2 student3)'5a) => 87.7

(define (term-grade-stats alostud aterm)
  (cond
    [(zero? (count-stud alostud aterm)) 'unknown]
    [else (/ (sum-grade alostud aterm) (count-stud alostud aterm))]))

;; Tests for term-grade-stats
(check-expect (term-grade-stats empty '1a) 'unknown)
(check-expect (term-grade-stats list1 '2b) 'unknown)
(check-expect (term-grade-stats list2 '2a) 75)
(check-expect (term-grade-stats list6 '1b) 79)
(check-within (term-grade-stats list7 '1a) 78.6 0.1)
(check-expect (term-grade-stats list5 '1a) 75)
(check-expect (term-grade-stats list4 '2a) 73)
(check-within (term-grade-stats list5 '2a) 75.3 0.1)
(check-expect (term-grade-stats (list student1 student2 student3)'5a) 87.7)