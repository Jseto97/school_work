#lang racket
;; Spring 2013 CS 136
;; Assignment 1, Question 5

;;----------------------------------------------------------
;; interface

(provide hashtag exact search-and search-or tweets-from
         username tweet-time->seconds recent-from happy)

;; hashtag: String -> (listof tweet)

;; exact: String -> (listof tweet)

;; search-and: (listof String) -> (listof tweet)

;; search-or: (listof String) -> (listof tweet)

;; tweets-from: String -> (listof String)

;; username: String -> String

;; tweet-time->seconds: String -> Int

;; recent-from: String -> String

;; happy: -> String

;;----------------------------------------------------------

(require "twitter.rkt")

; see interface above

(define (hashtag tag)
  (twitter-search (string-append "#" tag)))

(define (exact str)
  (twitter-search (string-append "\" str "\")))

(define (search-and los)
  (define (mapping str) 
    (cond
      [(member #\space (string->list str))
       (string-append "\" str "\")]
      [else str]))
  (define (append-str str accum)
    (string-append str " " accum))
  
  (twitter-search (foldr append-str "" (map mapping los))))

(define (search-or los)
  (define (mapping str) 
    (cond
      [(member #\space (string->list str))
       (string-append "\" str "\")]
      [else str]))
  (define (append-str str accum)
    (string-append str " OR " accum))
  
  (twitter-search (foldr append-str "" (map mapping los))))

(define (tweets-from userid)
  (map tweet-text 
       (twitter-search (string-append "from:" userid))))

(define (username userid)
  (define twts 
    (twitter-search (string-append "from:" userid)))
  
  (if (empty? twts) "unknown" (tweet-user-name (first twts))))

(require racket/date)
(define (tweet-time->seconds tt)
  (define dd (string->number (substring tt 5 7)))
  (define mon (substring tt 8 11))
  (define mmm
    (cond
      [(string=? "Jan" mon) 1]
      [(string=? "Feb" mon) 2]
      [(string=? "Mar" mon) 3]
      [(string=? "Apr" mon) 4]
      [(string=? "May" mon) 5]
      [(string=? "Jun" mon) 6]
      [(string=? "Jul" mon) 7]
      [(string=? "Aug" mon) 8]
      [(string=? "Sep" mon) 9]
      [(string=? "Oct" mon) 10]
      [(string=? "Nov" mon) 11]
      [else 12]))
  (define yyyy (string->number (substring tt 12 16)))
  (define hour (string->number (substring tt 17 19)))
  (define min (string->number (substring tt 20 22)))
  (define sec (string->number (substring tt 23 25)))
  
  (find-seconds sec min hour dd mmm yyyy #f))

(define (recent-from userid)
  (define (twts)
    (twitter-search (string-append "from:" userid)))
  (define (more-recent twt recent)
    (cond 
      [(empty? twt) recent]
      [(> (tweet-time->seconds (tweet-time (first twt)))
          (tweet-time->seconds (tweet-time recent))) 
       (more-recent (rest twt) recent)]
      [else (more-recent (rest twt) (first twt))]))
  (cond
    [(empty? twts) "No Tweets Found"]   
    [else (tweet-text (more-recent (rest twts) (first twts)))]))

(define (happy)
  (define (happy-list)
    (twitter-search ":)"))
  (define (more-recent twt recent)
    (cond 
      [(empty? twt) recent]
      [(> (tweet-time->seconds (tweet-time (first twt)))
          (tweet-time->seconds (tweet-time recent))) 
       (more-recent (rest twt) recent)]
      [else (more-recent (rest twt) (first twt))]))
  (if (empty? happy-list) "No Tweets Found"
      (tweet-text (more-recent (rest happy-list) (first happy-list)))))