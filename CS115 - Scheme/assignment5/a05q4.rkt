;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a05q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; constants for testing functions
(define name1 (make-fullname "Peter" "Lowenbrau" "Griffin"))
(define name2 (make-fullname "Agnes" "Gonxha" "Bojaxhiu"))
(define name3 (make-fullname "Jerome" "Allen" "Seinfeld")) 

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

;; find-lastname : student -> string
;; Purpose: produces the last name of given student stud
;; Example: (find-lastname studentA) => "Ali"
(define (find-lastname stud)
  (fullname-last(student-name stud)))
;; Tests for find-lastname
(check-expect (find-lastname studentA) "Ali")
(check-expect (find-lastname studentK) "Kyle")
(check-expect (find-lastname studentW) "Wang")

;; insert: (union of student listof student) -> listof student
;; Purpose: produces the list by inserting the given student stud into the list in front of the 
;; first student in the list that has a last name later than stud alphabetically
;; Examples: 
;; (insert studentA empty) => (list studentA)
;; (insert studentZ list8) => (list studentY studentR studentO studentT studentX studentZ)
;; (insert studentD list1) => (list studentA studentD studentI studentS studentH studentC)
;; (insert studentK list3) => (list studentK studentR studentV studentP studentD studentA studentK studentC)
(define (insert stud alostud)
  (cond
    [(empty? alostud) (cons stud empty)]
    [(string<? (find-lastname stud) (find-lastname (first alostud)))
     (cons stud alostud)]
    [else (cons (first alostud) (insert stud (rest alostud)))]))
;; Tests for insert
(check-expect (insert studentA empty) (list studentA)) ; test for inserting into an empty list
(check-expect (insert studentZ list8) (list studentY studentR studentO studentT studentX studentZ)) ; test for inserting into the end of the list
(check-expect (insert studentD list1) (list studentA studentD studentI studentS studentH studentC)) ; test for inserting into middle of the list
(check-expect (insert studentG list1) (list studentA studentG studentI studentS studentH studentC))
(check-expect (insert studentK list3) (list studentK studentR studentV studentP studentD studentA studentK studentC)) ; test for inserting into the front of the list
(check-expect (insert studentT list6) (list studentE studentQ studentN studentS studentB studentM studentT studentX studentR studentZ studentF))
(check-expect (insert studentH list7) (list studentG studentB studentF studentH studentI studentD))

;; Main function

;; sort-students : listof student -> list of student

;; Purpose: produces a list of student by consuming the original list alostud and sorting them by their last names

(define (sort-students alostud)
  (cond
    [(or(empty? alostud)(empty? (rest alostud))) alostud]
    [(string<? (find-lastname(first alostud)) (find-lastname(first(rest alostud))))
     (cons (first alostud) (sort-students (rest alostud)))]
    [else (cons (first(rest alostud)) (insert (first alostud)(rest(rest alostud))))]))


;; Tests for sort-students
(check-expect (sort-students empty) empty)
(check-expect (sort-students list1) (list studentA studentC studentH studentI studentS))
(check-expect (sort-students list2) (list studentB studentK studentM studentP studentQ studentW studentX studentY))
(check-expect (sort-students list3) (list studentA studentC studentD studentK studentP studentR studentV))
(check-expect (sort-students list4) (list studentE studentG studentH studentI studentL studentN studentR studentT studentZ))
(check-expect (sort-students list5) (list studentA studentE studentF studentI studentJ studentN studentO studentU studentW studentX studentY))
(check-expect (sort-students list6) (list studentB studentE studentF studentM studentN studentQ studentR studentS studentX studentZ))
(check-expect (sort-students list7) (list studentB studentD studentF studentG studentI))
(check-expect (sort-students list8) (list studentO studentR studentT studentX studentY))
(check-expect (sort-students list9) (list studentC studentH studentK studentN studentP studentQ studentS studentW))