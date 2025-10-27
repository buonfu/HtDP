;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname check-expect) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Number -> Number 
; converts Fahrenheit temperatures to Celsius
; given 32, expect 0
; given 212, expect 100
; given -40, expect -40
(define (f2c f)
  (* 5/9 (- f 32)))

(check-expect (f2c -40) 40)
(check-expect (f2c 32) 0)
(check-expect (f2c 212) 100)

#|
Because it is so useful to have DrRacket conduct the tests and not to check everything yourself manually, we immediately switch to this style of testing for the rest of the book. This form of testing is dubbed unit testing, and BSL’s unit-testing framework is especially tuned for novice programmers. One day you will switch to some other programming language; one of your first tasks will be to figure out its unit-testing framework.
由于让 DrRacket 自动执行测试而非手动检查所有内容非常实用，本书后续部分将立即改用这种测试方式。这种测试形式被称为单元测试 ，而 BSL 由于让 DrRacket 自动执行测试而非手动检查所有内容非常实用,本书后续部分将立即改用这种测试方式。这种测试形式被称为单元测试 ,而 BSL 的单元测试框架尤其适合编程新手。终有一天你会转向其他编程语言,那时你的首要任务之一就是掌握该语言的单元测试框架。
|#