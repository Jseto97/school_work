;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname midterm) (read-case-sensitive #t) (teachpacks ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "compound.rkt.txt" "installed-teachpacks") (lib "product.rkt.txt" "installed-teachpacks")))))
(define-struct app-time (hr min tod))

;; conflicts: (listof appts) int[>0,<13] (union 'AM 'PM) -> (listof appts)

(define (conflicts appts new-hr new-tod)
  (filter 
   (lambda (appt) (and (= new-hr (app-time-hr appt))
                       (equal? new-tod (app-time-tod appt))))
   appts))

(conflicts (list (make-app-time 10 15 'AM)
                 (make-app-time 1 30 'PM)
                 (make-app-time 10 0 'PM)
                 (make-app-time 10 55 'AM)) 10 'AM)

;; rescuedule: (listof appts) -> (listof appts)
(define (reschedule appts)
  (local
    [(define (change app list)
       (cons (make-app-time (+ 5 (app-time-hr app))
                            (app-time-min app)
                            (app-time-tod app)) list))]
    
    (foldr change empty
           (filter
            (lambda (app) (and (or (= 1 (app-time-hr app))
                                   (= 2 (app-time-hr app)))
                               (symbol=? 'PM (app-time-tod app))))
            appts))))

(reschedule (list (make-app-time 10 15 'AM)
                  (make-app-time 1 30 'PM)
                  (make-app-time 2 0 'PM)
                  (make-app-time 8 55 'AM)
                  (make-app-time 1 0 'PM)))

;; 3
(check-expect (build-list 2 add1) (list 1 2))
(check-expect (build-list 4 (lambda (k) (and (> k 0) (even? k)))) 
              (list false false true false))
(check-expect (build-list 4 (lambda (n) (build-list n sqr)))
              (list empty (list 0) (list 0 1) (list 0 1 4)))