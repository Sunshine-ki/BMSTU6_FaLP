;; Из лаб. №6 8-15
;; №1 Сумма чисел заданного списка.

(defun add-rec (lst sum)
 (cond ((null lst) sum)
 (T (add-rec (cdr lst) (+ sum (car lst)) )) ))

(defun rec-add (lst)
	(add-rec lst 0))

(rec-add '(1 2 3))

;; Для структурированного списка:
(defun add-rec (lst sum)
	(cond ((null lst) sum) 
	((listp (car lst)) (+ (add-rec (car lst) 0) (add-rec (cdr lst) sum)))
	(T (add-rec (cdr lst) (+ (car lst) sum)))))

(defun rec-add (lst)
	(add-rec lst 0))

(rec-add '(1 2 (3 4 5) 6)) ;; => 21

;; №2 Свой nth

(nth 0 '(a w c)) ;; => A

(defun rec-nth (n lst)
	(cond ((null lst) nil)
	((= n 0) (car lst))
	(T (rec-nth (- n 1) (cdr lst))) ))

(rec-nth 0 '(a w c)) ;; => A

;; №3 Все элементы списка нечентные - вернуть T, иначе Nil.
(defun alloddr (lst)
	(cond ((null lst) T)
	((evenp (car lst)) nil)
	(T (alloddr (cdr lst)))))

(alloddr '(2 1 3 5))   ;; Nil
(alloddr '(11 1 3 5))  ;; T

;; Для смешанного структурированного списка:
(defun alloddr (lst)
	(cond ((null lst) T)
	((symbolp (car lst)) (alloddr (cdr lst)))
	((listp (car lst)) (and (alloddr (car lst)) (alloddr (cdr lst))))
	((evenp (car lst)) nil)
	(T (alloddr (cdr lst)))))

(alloddr '(1 1 (3 5 7 (9)))) ;; T
