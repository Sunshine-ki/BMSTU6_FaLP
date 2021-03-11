;; №1
(defvar lst1)
(defvar lst2)

(setf lst1 '(a b))
(setf lst2 '(c d))

(cons lst1 lst2) 	;; ((A B) C D)
(list lst1 lst2) 	;; ((A B) (C D))
(append lst1 lst2) 	;; (A B C D)


;; №2
(reverse ()) 			;; Nil
(last ())				;; Nil
(reverse '(a)) 			;; (a)
(last '(a))				;; (a)
(reverse '((a b c)))  	;; ((A B C))
(last '((a b c)))		;; ((A B C))


;; №3	

(defun f-last (lst)
	(car (reverse lst)) )

(defun f-last-rec (lst)
	(cond ((null (cdr lst)) (car lst))
	(T (f-last-rec (cdr lst)))) )

;; (defun factorial (N) 
;; 	(cond ((= n 0) 1)
;; 	(T (* n (factorial(- n 1))))) )

;; №4	
(defun f1 (lst)
	(reverse (cdr (reverse lst))) )

(defun f1-rec (lst)
	(cond ((null (cdr lst)) ())
	(T (cons (car lst) (f1-rec (cdr lst))))) )


;; №5
;; Написать простой вариант игры в кости, в котором бросаются две правильные кости.
;; Если сумма выпавших очков равна 7 или 11 — выигрыш, если выпало (1, 1) или (6, 6) — игрок получает право
;; снова бросить кости, во всех остальных случаях ход переходит ко второму игроку, но запоминается сумма выпавших очков.
;; Если второй игрок не выигрывает абсолютно, то выигрывает тот игрок, у которого больше очков.

(defvar name-first)
(defvar name-second)

(setf name-first "Alice")
(setf name-second "Pasha")

;; dice = ((1-6 1-6) 1/0)
;; Первый список: то, что выпало.
;; Второй атом: 1 - выиграл, 0 - проиграл.
(defvar dice-first)
(defvar dice-second)
(defvar tmp-dice)

(defun roll-one-dice ()
	(+ (random 6) 1 ) )

(defun roll-two-dice ()
	(list (roll-one-dice) (roll-one-dice)) )

(defun sum (dice) 
	(+ (car dice) (cadr dice)) )

(defun is-win (dice) 
	(cond ((= (sum dice) 7 )) 
		((= (sum dice) 11)) ) )

(defun repeat-roll (dice)
	(cond ((= (car dice) (cadr dice) 6))
		((= (car dice) (cadr dice) 1))) )


;; NIL заставляет FORMAT сформировать свой вывод в виде строки 
;; (Т.е. это будет результат, а при T это будет просто промежуточный вывод)
;; a - Наиболее универсальная директива - ~A, которая использует один аргумент формата любого типа
;; и печатает его в эстетичной (удобочитаемой) форме.
(defun print-res (name dice) 
	(format Nil "~%Win ~a ~a ~a~%" name  (car dice) (sum (car dice))) )

(defun user-round (name)
	(setf tmp-dice (roll-two-dice))
	(format T "Player name: ~a ~a sum = ~a ~%" name tmp-dice (sum tmp-dice))
	(cond ((is-win tmp-dice) (list tmp-dice 1))
		((repeat-roll tmp-dice) (user-round name))
		(T (list tmp-dice 0))) )
		

(defun play ()
	(setf dice-first (user-round name-first))
	(if (= (cadr dice-first) 1) (print-res name-first dice-first)
	(and (setf dice-second (user-round name-second))
	(cond ((= (cadr dice-second) 1) (print-res name-second dice-second))
		((> (sum (car dice-first)) (sum (car dice-second))) (print-res name-first dice-first))
		((< (sum (car dice-first)) (sum (car dice-second))) (print-res name-second dice-second))
		((format Nil "Draw"))))))

;; (defun play ()
;; 	(setf dice-first (user-round name-first))
;; 	(setf dice-second (user-round name-second))
;; 	(cond ((= (cadr dice-first) 1) (print-res name-first dice-first))
;; 		((= (cadr dice-second) 1) (print-res name-second dice-second))
;; 		((> (sum (car dice-first)) (sum (car dice-second))) (print-res name-first dice-first))
;; 		((< (sum (car dice-first)) (sum (car dice-second))) (print-res name-second dice-second))
;; 		((format Nil "Ничья"))) )
