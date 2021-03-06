;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname l10q3) (read-case-sensitive #t) (teachpacks ((lib "taxon.rkt.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "taxon.rkt.txt" "installed-teachpacks")))))
;; lab 10 Question 3
(define (desc-list whatever)
  (cond
    [(t-modern? whatever) (cons (t-modern-name whatever) empty)]
    [(t-ancient? whatever)
     (append
      (desc-list (t-ancient-left whatever))
      (desc-list (t-ancient-right whatever)))]))

(check-expect (desc-list mammal)
              (list "Homo Sapiens" "Pan Troglodytes" 
                    "Rattus Norvegicus"))
(check-expect (desc-list animal)
              (list "Homo Sapiens" "Pan Troglodytes" 
                    "Rattus Norvegicus" "Gallus Gallus"
                    "Caenorhabditis Elegans" "Drosophila Melanogaster"))
