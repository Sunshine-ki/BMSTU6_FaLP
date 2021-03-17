;; TODO: Сделать все эти задания для структурированных списков!

;; №1. Список полиндром?
;; (defvar lst)
;; (setf lst '(1 2 3 4 5))

(defun same-rec (lst1 lst2)
	(cond ((null lst1)) 
		((= (car lst1) (car lst2)) (same-rec (cdr lst1) (cdr lst2)))
		(T Nil)) )

(defun same (lst1 lst2)
		(if (= (length lst1) (length lst2) ) 
			(same-rec lst1 lst2)) )

;; TODO:
;; (defun my-reverse (lst)
;; 	()
;;  )

(defun is-palindrome (lst) 
		(same lst (reverse lst)))

(is-palindrome '(1 2 3 3 2 1))

;; №2 Множества равны?

;; TODO:
;; (defun my-sort (lst)
;; 	() )

(defun find-elem-in-set (set1 elem) 
	(cond ((null set1) Nil)
		((= (car set1) elem) T)
		(T (find-elem-in-set (cdr set1) elem)) ) )

(defun set-equal-rec (set1 set2) 
	(cond ((null set1))
		((find-elem-in-set set2 (car set1)) (set-equal-rec (cdr set1) set2))
		(T Nil)) )

(defun set-equal (set1 set2)
    (if (= (length set1) (length set2)) 
        (set-equal-rec set1 set2) Nil) )

(set-equal '(1 2 3) '(4 5 6)) ;; Nil
(set-equal '(1 2 3) '(3 1 2)) ;; T

;; №3 (Страна . Столица) 
;; Вернуть по стране столицу и по столице странц.

(defun find-capital (table country)
	(cond ((null table) Nil)
		((eq (caar table) country) (cdar table)) 
		(T (find-capital (cdr table) country))) )

(defun find-country (table capital)
	(cond ((null table) Nil)
		((eq (cdar table) capital) (caar table)) 
		(T (find-country (cdr table) capital))) )

(find-capital 
    '((Russia . Moscow)
    (Spain . Madrid)
    (France . Paris)) 'Russia) ;; MOSCOW

(find-capital 
    '((Russia . Moscow)
    (Spain . Madrid)
    (France . Paris)) 'Hungary) ;; Nil


(find-country
    '((Russia . Moscow)
    (Spain . Madrid)
    (France . Paris)) 'Moscow) ;; RUSSIA

(find-country
    '((Russia . Moscow)
    (Spain . Madrid)
    (France . Paris)) 'Budapest) ;; Nil

;; №4 Меняем местами первый и последний элемент.

;; Возвращает все, кроме последнего
(defun f1 (lst)
	(reverse (cdr (reverse lst))) )

;; Добавляем к последнему элементу весь список 
;; без последнего элемента, а к нему первый элемент.
(defun swap-first-last (lst)
	(append (append (last lst) (cdr (f1 lst))) (cons (car lst) Nil)))

(swap-first-last '(1 2 3 4 5)) ;; (5 2 3 4 1)
(swap-first-last '(1 2)) ;; (2 1)

;; №5 Меняем местами два элемента по индексу.

(defun my-length-rec (lst n)
	(cond 
	((null lst) n)
	(T (my-length-rec (cdr lst) (+ n 1)))) )	

(defun my-length (lst)	
	(my-length-rec lst 0) )

(defun find-by-index-rec (lst index curr-index) 
	(cond ((null lst) Nil)
	((= index curr-index ) (car lst))
	(T (find-by-index-rec (cdr lst) index (+ curr-index 1)))) )

(defun find-by-index (lst index) 
	(find-by-index-rec lst index 0))

(defun swap-two-elements-rec (lst index1 index2 curr-index source-list)
	(cond ((null lst) nil)
		((= curr-index index1) (cons (find-by-index source-list index2) (swap-two-elements-rec (cdr lst) index1 index2 (+ curr-index 1) source-list)))
		((= curr-index index2) (cons (find-by-index source-list index1) (swap-two-elements-rec (cdr lst) index1 index2 (+ curr-index 1) source-list)))
		(T (cons (car lst) (swap-two-elements-rec (cdr lst) index1 index2 (+ curr-index 1) source-list) )) ) )

(defun swap-two-elements (lst i1 i2)
	(cond 
	((>= i1 (my-length lst)) "Первый индекс больше, чем размер списка")
	((>= i2 (my-length lst)) "Второй индекс больше, чем размер списка")
	((< i1 0) "Первый индекс меньше нуля")
	((< i2 0) "Второй индекс меньше нуля")
	((= i1 i2) lst)
	(T (swap-two-elements-rec lst i1 i2 0 lst))) )

(swap-two-elements '(11 12 13 14 15) 0 4) ;; (15 12 13 14 11)
(swap-two-elements '(11 12 13 14 15) 4 0) ;; (15 12 13 14 11)
(swap-two-elements '(11 12 13 14 15) 0 0) ;; (11 12 13 14 15)
(swap-two-elements '(11 12 13 14 15) 5 0)

;; №6 
;; 1
;; Возвращает список без последнего элемента.
(defun f1 (lst)
	(reverse (cdr (reverse lst))) )

;; Аналогично рекурсивый вариант
;; (defun f1-rec (lst)
;; 	(cond ((null (cdr lst)) ())
;; 	(T (cons (car lst) (f1-rec (cdr lst))))) )


;; Возвращает последний элемент.
(defun f-last (lst)
	(car (reverse lst)) )

;; Аналогично рекурсивый вариант
;; (defun f-last-rec (lst)
;; 	(cond ((null (cdr lst)) (car lst))
;; 	(T (f-last-rec (cdr lst)))) )

(defun swap-to-right (lst)
	(cons (f-last lst) (f1 lst)))

;; 2

(defun swap-to-left (lst)
	(append (cdr lst) (cons (car lst) nil)) )

(swap-to-right '(1 2 3 4 5 6))
(swap-to-left '(1 2 3 4 5 6))