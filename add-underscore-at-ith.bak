;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname add-underscore-at-ith) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ex3 Add the "_" at ith of given string

(define str "helloworld")
(define ind "0123456789")
(define i 5)
(define UNDERSCORE "_")

(define (add-underscore-at.ith str)
  (string-append
   (substring str 0 i) ; 0th up to ith (ith not included)
   UNDERSCORE
   (substring str i))) ; ith to the end (ith included)

; testing

(add-underscore-at.ith str) 