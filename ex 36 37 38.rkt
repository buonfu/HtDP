;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ex 36 37 38|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Image -> Number
; counts the number of pixels in a given image.
; (define (f im) 6)

; given : 10*20 image, expect: 200
; given : 100*50 image, expect: 5000

(define (image-area im1)
  (* (image-width im1) (image-height im1)))

; testing
(image-area (empty-scene 10 20))
(image-area (empty-scene 100 50))



; String -> String
; produces a string like the given one with the first character removed.
; (define (f str) "blahblah")

; given: "Nihao", expect: "ihao"
; given: "Zaijian", expect: "aijian"

(define (string-rest str0)
  (substring str0 1))

; testing
(string-rest "Nihao")
(string-rest "Zaijian")


; String -> String
; produces a string like the given one with the last character removed.
; given: "Nihao", expect: "Niha"
; given: "Zaijian", expect: "Zaijia"
(define (string-remove-last str0)
  (substring str0 0 (- (string-length str0) 1)))
; testing
(string-remove-last "Nihao")
(string-remove-last "Zaijian")

; str0这种形参无所谓