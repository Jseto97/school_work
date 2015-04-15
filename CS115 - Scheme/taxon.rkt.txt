#lang racket
  (provide make-t-modern t-modern-name t-modern-pop t-modern?
           make-t-ancient t-ancient-name t-ancient-age t-ancient-left
           t-ancient-right t-ancient?
           human chimp rat chicken worm fruit-fly 
           primate mammal vertebrate invertebrate animal)
           
           
  ;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ;;
  ;; THIS FILE IS A TEACHPACK. DO NOT COPY THESE DEFINITIONS INTO
  ;; YOUR ASSIGNMENT. INSTALL THIS TEACHPACK BY FOLLOWING THESE INSTRUCTIONS
  ;;    
  ;;   1) Save this teachpack on your computer.
  ;;   2) In Dr. Racket, go to Language > Add Teachpack.
  ;;   3) Click "Add Teachpack to List" at the bottom right.
  ;;   4) Chose the taxon.rkt teachpack. The teachpack will be added to the "User-installed Teachpacks" list.
  ;;   5) Click taxon.rkt in the list, and click OK.
  ;;   6) Run your program. In the interactions window, it should say "Teachpack: taxon.rkt"
  ;; 
  ;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ;;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  
  
  
  
  
  
  
  ;; A taxon is a t-modern or a t-ancient.
  
  (define-struct t-modern (name pop) #:transparent)
  (define-struct t-ancient (name age left right) #:transparent)
  
  ;; A t-modern is a structure (make-t-modern n p), where 
  ;;   n is a string (name of species), and 
  ;;   p is a nat (current population).
  
  ;; A t-ancient is a structure (make-t-ancient n a l r), where 
  ;;   n is a string (name of species), 
  ;;   a is a nat (in millions of years), and
  ;;   l and r are taxons.
  
  ;; Sample data
  
  (define human (make-t-modern "Homo Sapiens" 6500000000))
  (define chimp (make-t-modern "Pan Troglodytes" 100000))
  (define rat (make-t-modern "Rattus Norvegicus" 1000000000))
  (define chicken (make-t-modern "Gallus Gallus" 15000000000))
  (define worm (make-t-modern "Caenorhabditis Elegans" 50000000000))
  (define fruit-fly (make-t-modern "Drosophila Melanogaster" 100000000000))
  
  (define primate (make-t-ancient "Primate" 5 human chimp))
  (define mammal (make-t-ancient "Mammal" 65 primate rat))
  (define vertebrate (make-t-ancient "Vertebrate" 320 mammal chicken))
  (define invertebrate (make-t-ancient "Invertebrate" 530 worm fruit-fly))
  (define animal (make-t-ancient "Animal" 535 vertebrate invertebrate))
  