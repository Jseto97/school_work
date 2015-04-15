;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;
;;************************************************
;;
;; CS 115 Assignment 02, Question 4
;; Tianlu Zhu
;; (cost of mango order calculations)
;;
;;************************************************

;; constants for mango order
;; unit of weight
(define unit 100)
;; cost for mangoes
(define mango-cost 180)
;; cost for packaging
(define carton-cost 25)
(define container-cost 22)
;; cost for shipping
(define air-cost 75)
(define train-cost 27)
(define truck-cost 38)
;; discount price for heavy weight
(define mango-discount (- 1 .05))
(define shipping-discount (- 1 .03))
;; discount mass
(define mango-discount-mass 10000)
(define shipping-discount-mass 8000)

;; unit-weight: int[>0] -> int[>0]
;; Purpose: produces unit-weight the smallest integer
;; bigger than the hundredth of weight, which is 
;; used in most calculations
(define (unit-weight weight)
  (/ weight unit))

;; cost-for-mangoes: int -> int
;; Purpose: produces cost-for-mangoes the cost of
;; mangoes by multiplying myweight by 180
(define (cost-for-mangoes weight)
  (* mango-cost (unit-weight weight)))

;; cost-for-packaging: int symbol -> int
;; Purpose: produces cost-for-packaging the cost
;; of packaging mangoes, given the two methods of
;; packaging with different costs
(define (cost-for-packaging weight packaging)
  (cond [(symbol=? 'carton packaging) 
         (* carton-cost (unit-weight weight))]
        [(symbol=? 'container packaging) 
         (* container-cost (unit-weight weight))]))

;; cost-for-shipping: int symbol -> int
;; Purpose: produces cost-for-shipping the cost of
;; shipping mangoes, given the three methods of
;; shipping with different costs
(define (cost-for-shipping weight method)
  (cond [(symbol=? 'air method) 
         (* air-cost (unit-weight weight))]
        [(symbol=? 'train method) 
         (* train-cost (unit-weight weight))]
        [(symbol=? 'truck method) 
         (* truck-cost (unit-weight weight))]))

;; mango-order: int symbol symbol -> num[>0]
;; Purpose: produces mango-order the total cost of
;; ordering mangoes by adding the cost of buying
;; mangoes and packaging and shipping them

;; Examples for mango-order:
;; (mango-order 10100 'carton 'air) -> 27143.75
;; (mango-order 10100 'carton 'train) -> 22441.19
;; (mango-order 10100 'carton 'truck) -> 23518.86
;; (mango-order 10100 'container 'air) -> 26840.75
;; (mango-order 10100 'container 'train) -> 22138.19
;; (mango-order 10100 'container 'truck) -> 23215.86
;; (mango-order 10000 'carton 'air) -> 26875
;; (mango-order 10000 'carton 'train) -> 22219
;; (mango-order 10000 'carton 'truck) -> 23286
;; (mango-order 10000 'container 'air) -> 26575
;; (mango-order 10000 'container 'train) -> 21919
;; (mango-order 10000 'container 'truck) -> 22986
;; (mango-order 9000 'carton 'air) -> 24997.5
;; (mango-order 9000 'carton 'train) -> 20807.1
;; (mango-order 9000 'carton 'truck) -> 21767.4
;; (mango-order 9000 'container 'air) -> 24727.5
;; (mango-order 9000 'container 'train) -> 20537.1
;; (mango-order 9000 'container 'truck) -> 21497.4
;; (mango-order 8000 'carton 'air) -> 22220
;; (mango-order 8000 'carton 'train) -> 18495.2
;; (mango-order 8000 'carton 'truck) -> 19348.8
;; (mango-order 8000 'container 'air) -> 21980
;; (mango-order 8000 'container 'train) -> 18255.2
;; (mango-order 8000 'container 'truck) -> 19108.8
;; (mango-order 6000 'carton 'air) -> 16800
;; (mango-order 6000 'carton 'train) -> 13920
;; (mango-order 100 'carton 'truck) -> 243
;; (mango-order 5000 'container 'air) -> 13850
;; (mango-order 7900 'container 'train) -> 18091
;; (mango-order 5000 'container 'truck) -> 12000

(define (mango-order weight packaging method)
  (cond [(>= weight mango-discount-mass)
         (+ (* mango-discount
               (cost-for-mangoes weight))
            (cost-for-packaging weight packaging)
            (* shipping-discount
               (cost-for-shipping weight method)))]
        [(>= weight shipping-discount-mass)
         (+ (cost-for-mangoes weight)
            (cost-for-packaging weight packaging)
            (* shipping-discount
               (cost-for-shipping weight method)))]
        [else (+ (cost-for-mangoes weight)
                 (cost-for-packaging weight packaging)
                 (cost-for-shipping weight method))]))

;; Tests for mango-order
;; order mass greater than 10000kg
;; packaging by carton
;; shipping by air
(check-expect (mango-order 10100 'carton 'air) 27143.75)
;; shipping by train
(check-expect (mango-order 10100 'carton 'train) 22441.19)
;; shipping by truck
(check-expect (mango-order 10100 'carton 'truck) 23518.86)
;; packaging by container
;; shipping by air
(check-expect (mango-order 10100 'container 'air) 26840.75)
;; shipping by train
(check-expect (mango-order 10100 'container 'train) 22138.19)
;; shipping by truck
(check-expect (mango-order 10100 'container 'truck) 23215.86)
;; order mass equal to 10000kg
;; packaging by carton
;; shipping by air
(check-expect (mango-order 10000 'carton 'air) 26875)
;; shipping by train
(check-expect (mango-order 10000 'carton 'train) 22219)
;; shipping by truck
(check-expect (mango-order 10000 'carton 'truck) 23286)
;; packaging by container
;; shipping by air
(check-expect (mango-order 10000 'container 'air) 26575)
;; shipping by train
(check-expect (mango-order 10000 'container 'train) 21919)
;; shipping by truck
(check-expect (mango-order 10000 'container 'truck) 22986)
;; order mass between 8000kg and 10000kg
;; packaging by carton
;; shipping by air
(check-expect (mango-order 9000 'carton 'air) 24997.5)
;; shipping by train
(check-expect (mango-order 9000 'carton 'train) 20807.1)
;; shipping by truck
(check-expect (mango-order 9000 'carton 'truck) 21767.4)
;; packaging by container
;; shipping by air
(check-expect (mango-order 9000 'container 'air) 24727.5)
;; shipping by train
(check-expect (mango-order 9000 'container 'train) 20537.1)
;; shipping by truck
(check-expect (mango-order 9000 'container 'truck) 21497.4)
;; order weight equal to 8000
;; packaging by carton
;; shipping by air
(check-expect (mango-order 8000 'carton 'air) 22220)
;; shipping by train
(check-expect (mango-order 8000 'carton 'train) 18495.2)
;; shipping by truck
(check-expect (mango-order 8000 'carton 'truck) 19348.8)
;; packaging by container
;; shipping by air
(check-expect (mango-order 8000 'container 'air) 21980)
;; shipping by train
(check-expect (mango-order 8000 'container 'train) 18255.2)
;; shipping by truck
(check-expect (mango-order 8000 'container 'truck) 19108.8)
;; order mass less than 8000kg
;; packaging by carton
;; shipping by air
(check-expect (mango-order 6000 'carton 'air) 16800)
;; shipping by train
(check-expect (mango-order 6000 'carton 'train) 13920)
;; shipping by truck
(check-expect (mango-order 100 'carton 'truck) 243)
;; packaging by container
;; shipping by air
(check-expect (mango-order 5000 'container 'air) 13850)
;; shipping by train
(check-expect (mango-order 7900 'container 'train) 18091)
;; shipping by truck
(check-expect (mango-order 5000 'container 'truck) 12000)