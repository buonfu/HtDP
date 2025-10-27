;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |The completion of design step 5 & ex34 string-fst|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; The completion of design step 5


; Number String Image -> Image
; adds s to img, y pixels from top, 10 pixels to the left
; given: 
;    5 for y, 
;    "hello" for s, and
;    (empty-scene 100 100) for img
; expected: 
;    (place-image (text "hello" 10 "red") 10 5 ...)
;    where ... is (empty-scene 100 100)

#|
(define (add-image y s img)
  (place-image (text s 10 "red") 10 y img))
|#

; String  -> 1String                                        ;; function signature
; extracts the first character from a non-empty string.     ;; purpose statement
; given: "Bye, world!", expect:"B"                          ;; functional example
; given: "Let's start with C instead of Racket.............", expect:"L"
(define (string-first str0)
  (substring str0 0 1))

;; testing
(string-first  "Bye, world!")
(string-first "Let's start with C instead of Racket.............")



;; Uh below is the work done by the A student.
#|
;; 1. Express how you wish to represent information as data.

; We use String data type to represent textual information.


;; 2. Write down:
;;   - a signature
;;   - a statement of purpose
;;   - a function header

; String -> 1String
; Extracts the first character from a string.
; (define (f str) "a")


;; 3. Illustrate the signature and the purpose statement
;; with some functional examples.

; "z" -> "z"
; "0-day" -> "0"
; "Fun Fact" -> "F"


;; 4. Write down function prototype: header and body template.

; (define (string-first s) (... s ...))


;; 5. Write down the function.

(define (string-first s)
  (substring s 0 1))


;; 6. Test the function on the step 3 examples.

(string-first "z")

(string-first "0-day")

(string-first "Fun Fact")
|#



; String -> 1String
; extracts the last character from a non-empty string.
; (define (f str) "a")

; given: "Bye, world!", expect:"!"
; given: "Let's start with C instead of Racket.............", expect:"."

(define (string-last str1)
  (substring str1 (- (string-length str1) 1)))

; testing
(string-last  "Bye, world!")
(string-last "Let's start with C instead of Racket.............")
  