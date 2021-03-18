;; Задания на защиту 7-10 лр.
;; (По сути это просто правки к данным лабам).

;; 1. Поменять местами
(defun my-last (lst)
	(cond ((null (cdr lst)) (car lst))
	(T (my-last (cdr lst)))) )

(defun change-last-elem (lst elem) 
	(cond ((null (cdr lst)) (cons elem Nil))
		(T (cons (car lst) (change-last-elem (cdr lst) elem)))))

(defun swap-first-last (lst)
	(cons (my-last lst)
		(change-last-elem (cdr lst) (car lst))))

;; 2. select-between 
(defun check-border (x a b)
    (and (>= x a) (<= x b)) )

(defun select-between (lst a b)
	(cond ((null lst) ())
	((check-border (car lst) a b) (cons (car lst) (select-between (cdr lst) a b)))
	(T (select-between (cdr lst) a b)) ))

;; 3. Квадрат элементов смешанного структурированного списка.

(defun square-lst (lst)
	(mapcar (lambda (x) (* x x)) 
			(remove-if #'symbolp lst) ))

;; (defun f (elem)
;; 	(cond ((symbolp elem) Nil)
;; 		(T (* elem elem)) ))


;; (mapcar (lambda (x) 
;; 		(cond ((symbolp elem) Nil)
;; 		(T (* elem elem)) ))) lst)

(defun square-lst (lst)
	(cond ((null lst) ())
	((symbolp (car lst)) (square-lst (cdr lst)))
	((listp (car lst)) (cons (square-lst (car lst)) (square-lst (cdr lst))))
	(T (cons (* (car lst) (car lst)) (square-lst (cdr lst)))) ))

;; 4. Сумма чисел смешанного структурированного списка.

(defun add-rec (lst sum)
    (cond ((null lst) sum) 
    ((listp (car lst)) (+ (add-rec (car lst) 0) (add-rec (cdr lst) sum)))
	((symbolp (car lst)) (add-rec (cdr lst) sum))
    (T (add-rec (cdr lst) (+ (car lst) sum)))))

(defun rec-add (lst)
    (add-rec lst 0))