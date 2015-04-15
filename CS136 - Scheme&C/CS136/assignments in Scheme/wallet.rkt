#lang racket
(provide new-wallet become-freegan wallet-balance count-n-dollar-bills
         earn spend)

;; if there is no wallet, it is an empty list
;; if there is no money in the wallet, the wallet should contain 0
(define wallet empty)

(define (new-wallet)
  (cond
    [(empty? wallet)
     (begin
       (set! wallet '(0))
       (printf "You now have a wallet.\n"))]
    [else 
     (printf "You already have a wallet.\n")]))

(define (become-freegan)
  (cond
    [(empty? wallet)
     (printf "You have no wallet. You are already a freegan.\n")]
    [else
     (begin
       (printf "Thanks for the ~a dollars!\n" 
               (foldr + 0 wallet))
       (set! wallet empty))]))

(define (wallet-balance)
  (if (empty? wallet)
      (printf "You have no wallet.\n")
      (foldr + 0 wallet)))

(define (count-n-dollar-bills n)
  (if (empty? wallet)
      (printf "You have no wallet.\n")
      (length (filter (lambda (k)
                        (= k n)) wallet))))

(define (earn lob)
  (cond
    [(empty? wallet)
     (printf "You have no wallet.\n")]
    [(equal? wallet '(0))
     (begin 
       (set! wallet lob)
       (wallet-balance))]
    [else
     (begin
       (set! wallet (append wallet lob))
       (wallet-balance))]))

(define (spend x)
  (cond
    [(empty? wallet) ; no wallet exist, print error message
     (printf "You have no wallet.\n")]
    ; if there's wallet, trying to extract money
    [(and (> x (wallet-balance)) (= x 1))
     (printf "You cannot spend 1 dollar. Your wallet has only 0.\n")]
    [(> x (wallet-balance)) ; money is more than the wallet balance
     (printf "You cannot spend ~a dollars. Your wallet has only ~a.\n"
             x (wallet-balance))]
    ;; money is less than the wallet balance
    [else
     (local
       [(define (list-max accum rlob)
          (cond
            [(empty? rlob) accum]
            [(> accum (first rlob))
             (list-max accum (rest rlob))]
            [else
             (list-max (first rlob) (rest rlob))]))
        ; trying to find the max money in the list by accumlative 
        ; resursion
        (define (find-max lob)
          (list-max (first lob) (rest lob)))
        (define y (find-max wallet))]
       ; the function to extract x
       (cond
         [(zero? x) (wallet-balance)]
         [(> x y)
          (begin
            (set! wallet (remove y wallet))
            (spend (- x y)))] ; remove the amount first
         [(= x y)
          (cond
            [(empty? (rest wallet))
             (begin
               (set! wallet '(0))
               (wallet-balance))]
            [else
             (begin
               (set! wallet (remove y wallet))
               (wallet-balance))])]
         [else ; the required money is less than the list max
          (local
            [(define (add-n lob n) ; add n $1 to the list
               (cond
                 [(<= n 1) 
                  (begin 
                    (set! lob (append lob '(1)))
                    lob)]
                 [else
                  (begin
                    (set! lob (append lob '(1)))
                    (add-n lob (sub1 n)))]))]  
            (set! wallet (remove y wallet))
            (set! wallet (add-n wallet (- y x)))
            (wallet-balance))]))]))
