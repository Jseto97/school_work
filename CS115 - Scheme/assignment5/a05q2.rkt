;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a05q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; CS115 Fall 2012 Assignment 05
;; (making list of student by sorting last names in order)

;; Question 2

;; Constants
(define letterN "N")

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

(define student1 (make-student name1 '1a 32))
(define student2 (make-student name2 '5a 99.9))
(define student3 (make-student name3 '5a 75.5))

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

;; Helper functions

;; aloAM : (listof student) -> (listof student)
;; Purpose: produces a list of student with last name starting from "A" to "M"
;; Examples
;; (aloAM empty) => empty
;; (aloAM (list student1 student2 student3)) => (cons student1(cons student2 empty))
;; (aloAM list1) => (cons studentA(cons studentI(cons studentH(cons studentC empty))))
;; (aloAM list7) => (cons studentG(cons studentB(cons studentF(cons studentI(cons studentD empty)))))
;; (aloAM list8) => empty

(define (aloAM alostud)
  (cond
    [(empty? alostud) empty]
    [(string<? (fullname-last(student-name(first alostud))) letterN)
     (cons (first alostud) (aloAM (rest alostud)))]
    [else (aloAM (rest alostud))]))

;; Tests for aloAM
(check-expect (aloAM empty) empty)
(check-expect (aloAM (list student1 student2 student3)) (cons student1(cons student2 empty)))
(check-expect (aloAM list1)
              (cons studentA(cons studentI(cons studentH(cons studentC empty)))))
(check-expect (aloAM list2)
              (cons studentB(cons studentK(cons studentM empty)))) 
(check-expect (aloAM list3)
              (cons studentD(cons studentA(cons studentK(cons studentC empty)))))
(check-expect (aloAM list4)
              (cons studentG(cons studentL(cons studentI(cons studentE(cons studentH empty))))))
(check-expect (aloAM list5)
              (cons studentJ(cons studentF(cons studentI(cons studentA(cons studentE empty))))))
(check-expect (aloAM list6)
              (cons studentE(cons studentB(cons studentM(cons studentF empty)))))
(check-expect (aloAM list7)
              (cons studentG(cons studentB(cons studentF(cons studentI(cons studentD empty))))))
(check-expect (aloAM list8) empty)
(check-expect (aloAM list9)
              (cons studentC(cons studentH(cons studentK empty))))

;; aloNZ : (listof student) -> (listof student)
;; Purpose: produces a list of student with last name starting from "N" to "Z"
;; Examples
;; (aloNZ empty) => empty
;; (aloNZ (list student1 student2 student3)) => (cons student3 empty)
;; (aloAM list1) => (cons studentS empty)
;; (aloAM list7) => empty
;; (aloAM list8) => list8
(define (aloNZ alostud)
  (cond
    [(empty? alostud) empty]
    [(string>=? (fullname-last(student-name(first alostud))) letterN)
     (cons (first alostud) (aloNZ (rest alostud)))]
    [else (aloNZ (rest alostud))]))

;; Tests for aloNZ
(check-expect (aloNZ empty) empty)
(check-expect (aloNZ (list student1 student2 student3)) (cons student3 empty))
(check-expect (aloNZ list1)
              (cons studentS empty))
(check-expect (aloNZ list2)
              (cons studentY(cons studentW(cons studentP(cons studentX(cons studentQ empty)))))) 
(check-expect (aloNZ list3)
              (cons studentR(cons studentV(cons studentP empty))))
(check-expect (aloNZ list4)
              (cons studentN(cons studentZ(cons studentR(cons studentT empty)))))
(check-expect (aloNZ list5)
              (cons studentW(cons studentX(cons studentU(cons studentO(cons studentY(cons studentN empty)))))))
(check-expect (aloNZ list6)
              (cons studentQ(cons studentN(cons studentS(cons studentX(cons studentR(cons studentZ empty)))))))
(check-expect (aloNZ list7) empty)
(check-expect (aloNZ list8) list8)
(check-expect (aloNZ list9)
              (cons studentS(cons studentW(cons studentQ(cons studentN (cons studentP empty))))))

;; Main function
;; moving-order : (listof student) -> (listof student)

;; Purpose: produces a list of student with all the student with last name staring
;; from A to M first then all student with last name from N to Z

;; Examples
;; (moving-order empty) => empty
;; (moving-order (list student1 student2 student3)) => (cons student1(cons student2(cons student3 empty)))
;; (aloAM list1) =>  (cons studentA(cons studentI(cons studentH(cons studentC(cons studentS empty)
;; (aloAM list7) => list7
;; (aloAM list8) => list8

(define (moving-order alostud)
  (append (aloAM alostud) (aloNZ alostud)))

;; Tests for moving-order
(check-expect (moving-order empty) empty)
(check-expect (moving-order (list student1 student2 student3)) (cons student1(cons student2(cons student3 empty))))
(check-expect (moving-order list1)
              (cons studentA(cons studentI(cons studentH(cons studentC (cons studentS empty))))))
(check-expect (moving-order list2)
              (cons studentB(cons studentK(cons studentM (cons studentY(cons studentW(cons studentP(cons studentX(cons studentQ empty))))))))) 
(check-expect (moving-order list3)
              (cons studentD(cons studentA(cons studentK(cons studentC (cons studentR(cons studentV(cons studentP empty))))))))
(check-expect (moving-order list4)
              (cons studentG(cons studentL(cons studentI(cons studentE(cons studentH(cons studentN(cons studentZ(cons studentR(cons studentT empty))))))))))
(check-expect (moving-order list5)
              (cons studentJ(cons studentF(cons studentI(cons studentA(cons studentE(cons studentW(cons studentX(cons studentU(cons studentO(cons studentY(cons studentN empty))))))))))))
(check-expect (moving-order list6)
              (cons studentE(cons studentB(cons studentM(cons studentF (cons studentQ(cons studentN(cons studentS(cons studentX(cons studentR(cons studentZ empty)))))))))))
(check-expect (moving-order list7) list7)
(check-expect (moving-order list8) list8)
(check-expect (moving-order list9)
              (cons studentC(cons studentH(cons studentK (cons studentS(cons studentW(cons studentQ(cons studentN (cons studentP empty)))))))))
