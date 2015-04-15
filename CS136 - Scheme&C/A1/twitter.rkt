#lang racket

; A simple twitter interface for Twitter Search
; See: http://twitter.com/search
;  (click on 'operators' for syntax examples)

; Developed by Dave Tompkins [dtompkins AT uwaterloo.ca]
; for cs136 assignments

(provide twitter-search tweet tweet? 
         tweet-user-id tweet-user-name tweet-text tweet-time)

; A tweet is a structure with 4 string fields:(user-id user-name text time)
; eg: (tweet "lindsaylohan" "Lindsay Lohan" "I'm a mess!" "Mon, 31 Dec 2012 23:59:59 +0000")
; the time format is always "ddd, DD MMM YYYY HH:MM:SS +####"
(struct tweet (user-id user-name text time) #:transparent)

; twitter-search: String -> (listof tweet)
;   PRE:  * you can connect to twitter (have online access)
;         * s is a valid twitter search string
;             (see http://twitter.com/search for examples)
;   POST: produces a list of length <= 100 (typically <= 15)
; (twitter-search s) will use the twitter search interface
;   and return matching tweets from approx the last 6-9 days

; EXAMPLES:

; (twitter-search "crazy geese")
; (twitter-search "\"exact phrase\"")
; (twitter-search "#yolo")
; (twitter-search "from:uWaterloo")
; (twitter-search "@ladygaga")
; (twitter-search "to:justinbieber")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require net/url)
(require "json.rkt")

; see interface above
(define (twitter-search s)
  (define (safe-hash-ref h k f)
    (if (and (hash? h) (hash-has-key? h k)) (hash-ref h k) f))
  (define (result->tweet r)
    (tweet (safe-hash-ref r 'from_user "error")
           (safe-hash-ref r 'from_user_name "error")
           (safe-hash-ref r 'text "error")
           (safe-hash-ref r 'created_at "error")))
  (define urlbase "http://search.twitter.com/search.json?q=")
  (define jsonhash (read-json (get-pure-port (string->url (string-append urlbase s)))))
  (define lor (safe-hash-ref jsonhash 'results empty))
  (map result->tweet lor))
