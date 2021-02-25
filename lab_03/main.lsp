;; № 2
;; Заданы катеты a и b.
;; Вычислить гипотенузу.
(defun hypotenuse (a b) (sqrt (+ (* a a) (* b b))))
;; (HYPOTENUSE 6 8) -> 10

;; № 3
;; Заданы длина a, ширина b и высота c
;; Найти объем.
(defun volume (a b c) (* a (* b c)))
;; (volume 2 3 4) -> 24

;; №4
;; Каковы результаты вычисления следующих выражений?
(list 'a 'b c) 		;; Error (The variable C is unbound).
(cons 'a (b c)) 	;; Error undefined function: B
(cons 'a '(b c))	;; (A B C)
;; Error illegal function call 
;; Недопустимый вызов функции, т.к. имя функции не может быть цифрой.
(caddr (1 2 3 4 5)) 
;; Error The function was called with three arguments, but wants exactly two.
;; cons принимает два аргумента, а мы ей передаем три.  
(cons 'a 'b 'c) 
;; Error undefined function: B
;; Т.к. мы не поставили quote перед (b c)
;; Lisp воспринимает b как имя функции, а у нас такой функции нет.
(list 'a (b c))
;; Error The variable A is unbound.
;; Т.к. первый аргумент a не является списком,
;; Он проверяется на T и на nil. 
;; Далее, т.к. нет совпадений возвращается значения,
;; Но так как у нас нет значения в a, возвращается ошибка. 
(list a '(b c))
;; '(length '(1 2 3 4)) -> (length '(1 2 3 4))
;; (+ 1 (length '(1 2 3)))) =>
;; Error is (LENGTH '(1 2 3 4)) not a NUMBER
;; Функция + принимает NUMBER значения, а мы ей передаем 
;; (LENGTH '(1 2 3 4)) => она не может вычислить.
(list (+ 1 '(length '(1 2 3)))) ;; (4)

;; №5
;; Два списка a и b
;; Возвращает T, если длина a больше длины b.
(defun longer_then(a b) (cond ((> (length a) (length b)) T) (Nil)))
;; (LONGER_THEN '(a b c) '(a)) 			;; -> T
;; (LONGER_THEN '(a b c) '(a b c))		;; --> nil
;; (LONGER_THEN '(a b c) '(a b c d)) 	;; --> nil

;; №6_1
;; Каковы результаты вычисления следующих выражений?
;; (list 5 6) -> (5 6)
;; (cons 3 '(5 6)) ;; -> 3 - голова, (5 6) - хвост 
(cons 3 (list 5 6)) ;; (3 5 6)
;; (3 FROM 9 GIVES 6)
(list 3 'from 9 'gives (- 9 3)) 
;; (length '(1 foo 2 too)) -> 4
;; (car '(21 22 23)) -> 21
;; (+ 4 21) -> 25
(+ (length '(1 foo 2 too)) (car '(21 22 23))) ;; 25
;;(IS SHORT FOR ANS)
(cdr '(cons is short for ans)) 
;; Error undefined variable: ONE
(car (list one two))
;; (3 LIST 5 6)
(cons 3 '(list 5 6))
;; (list 'one 'two) -> (one two)
;; (car '(one two)) -> one
(car (list 'one 'two)) ;; one

;; №6_2
;; Дана функция 
;; (first list)    ==   (car list)
;; (second list)   ==   (car (cdr list))
;; Принимает список x
;; Возвращает список, содержащий второй и первый элемент 
;; (Именно в таком порядке).
(defun mystery (x) (list (second x) (first x)))

;; Какие результаты вычислений следующий выражений?
(mystery '(one two)) 	;; (TWO ONE)
;; Error The value FREE is not of type LIST
;; (cdr 'free) - выдаст ошибку.
(mystery 'free)
;; Error The value ONE is not of type LIST when binding LIST
;; (last 'one 'two) - выдаст ошибку.
(mystery (last 'one 'two))
;; Error invalid number of arguments: 2
;; Должен быть один аргумент.
(mystery 'one 'two)