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