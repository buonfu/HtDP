;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname guideonworldprogram) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define WHEEL-RADIUS 5)                           ; wishlist 1 ; Single point of control over the rendered image sizes.
(define WHEEL-DIAMETER (* WHEEL-RADIUS 2))
(define VELOCITY (/ WHEEL-RADIUS 2))


(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define TWO-WHEELS (underlay/offset WHEEL (* WHEEL-DIAMETER 2) 0 WHEEL))


(define CAR-BODY (rectangle (* WHEEL-DIAMETER 4) WHEEL-DIAMETER "solid" "blue"))
(define CAR-BODY-TOP (rectangle (* WHEEL-DIAMETER 2) WHEEL-DIAMETER "solid" "blue"))
(define CAR
  (underlay/offset CAR-BODY-TOP
                   0 WHEEL-DIAMETER
                   (underlay/offset CAR-BODY
                                    0 WHEEL-RADIUS
                                    TWO-WHEELS)))
(define CAR-WIDTH (image-width CAR))

(define TREE
  (underlay/offset (circle WHEEL-DIAMETER "solid" "green")
               0 WHEEL-DIAMETER
               (rectangle (/ WHEEL-RADIUS 2) (* WHEEL-RADIUS 3) "solid" "brown")))


(define BACKGROUND-WIDTH (* (image-width CAR) 8))
(define BACKGROUND-HEIGHT (* (image-height CAR) 2))
(define BACKGROUND
  (place-image TREE
               (/ BACKGROUND-WIDTH 3)
               (- BACKGROUND-HEIGHT (/ (image-height TREE) 2))
               (empty-scene BACKGROUND-WIDTH BACKGROUND-HEIGHT)))

(define Y-CAR (- BACKGROUND-HEIGHT (/ (image-height CAR) 2)))
(define X-CAR-START (- 0 (/ CAR-WIDTH 2)))
(define X-CAR-STOP (+ BACKGROUND-WIDTH (/ CAR-WIDTH 2)))


; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; render

; clock-tick-handler
; keystroke-handler
; mouse-event-handler

; end?

; WorldState -> Image                            ; wishlist 3
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image 
; (define (render x)
;  BACKGROUND)
; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))
 
; WorldState -> WorldState                       ; wishlist 2
; adds 3 to x to move the car right 
; (define (tock x)
;  x)

;; WorldState -> WorldState
;; Sets world state for every clock tick.
(define (tick-handler ws)
  (+ ws VELOCITY))

;; WorldState String -> WorldState
;; Sets world state on a key press:
;; "s" stops the car,
;; "r" resets the car position.
(define (key-handler ws key)
  (cond
    [(key=? (string-downcase key) "s")  X-CAR-STOP]
    [(key=? (string-downcase key) "r")  X-CAR-START]
    [else ws]))

;; WorldState -> Number
;; Calculates when to stop the car.
(define (end? ws)
  (> ws X-CAR-STOP))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-tick tick-handler]
    [on-key key-handler]
    [stop-when end?]))

;; Application
(main X-CAR-START)

;; Unit tests
(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))

(check-expect (tick-handler 20) (+ VELOCITY 20))
(check-expect (tick-handler 78) (+ VELOCITY 78))

(check-expect (key-handler 20 "a") 20)
(check-expect (key-handler 20 "s") X-CAR-STOP)
(check-expect (key-handler 20 "r") X-CAR-START)

(check-expect (end? (+ X-CAR-STOP 1)) #true)
(check-expect (end? 30) #false)