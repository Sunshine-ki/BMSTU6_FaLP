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
(alloddr '(1 1 a (3 5 7 (8)))) ;; Nil


;; №4 Последний элемент хвостовой рекурсией с одним тестом завершнеия.
(defun my-last (lst)
	(cond ((null (cdr lst)) (car lst))
	(T (my-last (cdr lst))) ))

(my-last '(1 2 3 4 5 6))	;; => 6
(my-last ())  				;; => NIL
(my-last '(a b c d (e f))) 	;; => (E F)

;; №5 Сумма всех чисел от 0 до n
;; Хвостовая.
(defun f-sum-rec (lst n sum)
	(cond ((= 0 n) sum)
	(T (f-sum-rec (cdr lst) (- n 1) (+ sum (car lst)))) ))  

(defun sum-rec (lst n)
	(f-sum-rec lst n 0))

(sum-rec '(1 2 3 4 5 6 7 8 9 10) 3) ;; => 6

;; Дополняемая
(defun sum-rec (lst n)
	(cond ((= 0 n) 0)
	(T (+ (car lst) (sum-rec (cdr lst) (- n 1)))) ))

(sum-rec '(1 2 3 4 5 6 7 8 9 10) 3) ;; => 6


;; Вариант 1: От n-аргумента функции до последнего.
(defun sum-n-last (lst n)
	(cond ((= 0 n) (sum-rec lst (length lst)))
	(T (sum-n-last (cdr lst) (- n 1))) ))
	
(sum-n-last '(1 2 3 4 5 6 7 8 9 10) 5) ;; => 40

;; Вариант 2: От n-аргумента функции до m-аргумента с шагом d
(defun do-step (lst step)
	(cond ((= 0 step) lst) 
	(T (do-step (cdr lst) (- step 1)))))

(do-step '(1 2 3 4 5 6) 2) ;; => (3 4 5 6)

(defun f-sum-rec-step (lst n step sum)
	(cond ((or (= 0 n) (> step n)) sum)
	(T (f-sum-rec-step (do-step lst step) (- n step) step (+ sum (car lst)))) ))  

(defun sum-n-m-d (lst n m d)
	(cond ((= 0 n) (f-sum-rec-step lst m d 0))
	(T (sum-n-m-d (cdr lst) (- n 1) m d)) ))

;; Нумерация с нуля!
(sum-n-m-d '(1 2 3 4 5 6 7 8 9 10) 0 10 1) ;; => 55
(sum-n-m-d '(1 2 3 4 5 6 7 8 9 10) 1 6 3)  ;; => 7

;; №6 Последнее нечетное
(defun last-odd-rec (lst last-odd-number)
	(cond ((null lst) last-odd-number)
	(T (last-odd-rec (cdr lst) 
		(if (oddp (car lst)) (car lst) last-odd-number))) ))

(defun last-odd (lst) 
	(last-odd-rec lst Nil))

(last-odd '(1 2 3 4 5 6 7)) 	;; => 7
(last-odd '(1 2 3 4 5 6)) 		;; => 5
(last-odd '(2 4 6 8))   		;; => NIL
(last-odd '(1 3 5))		     	;; => 5
(last-odd '(2 4 3 6 8 10)) 		;; => 3

;; №7 
;; Квадрат чисел списка-аргумента с cons-дополняемой 
;; Рекурсией и одним тестом завершения.
(defun square-lst (lst) 
	(cond ((null lst) Nil)
	(T (cons (* (car lst) (car lst)) (square-lst (cdr lst)))) )) 

(square-lst '(1 2 3 4 5 6)) ;; => (1 4 9 16 25 36)


;; №8 Из заданного списка все нечетные числа
(defun select-odd (lst) 
	(cond ((null lst) Nil)
	(T (if 
		(oddp (car lst)) (cons (car lst) (select-odd (cdr lst)))
		(select-odd (cdr lst)))) ))

(select-odd '(1 2 3 4 5 6 7 8 9 1)) ;; => (1 3 5 7 9 1)

;; Вариант 1: select-even
(defun select-even (lst) 
	(cond ((null lst) Nil)
	(T (if (evenp (car lst)) 
		(cons (car lst) (select-even (cdr lst)))
		(select-even (cdr lst)))) ))

(SELECT-EVEN '(1 2 3 4 5 6 7 8 9 1)) ;; => (2 4 6 8)

;; Вариант 2: Сумма нечетных чисел.
(defun sum-all-odd-rec (lst sum) 
	(cond ((null lst) sum) 
	(T (sum-all-odd-rec (cdr lst) 
		(if (oddp (car lst)) (+ (car lst) sum) sum))) ))

(defun sum-all-odd (lst)
	(sum-all-odd-rec lst 0))

(sum-all-odd '(1 2 3 4 5)) ;; => 9

;; Для смешанного стуктурированного списка:
(defun sum-all-odd-rec (lst sum) 
	(cond ((null lst) sum) 
	((symbolp (car lst)) (sum-all-odd-rec (cdr lst) sum))
	((listp (car lst)) 
	(+ (sum-all-odd-rec (car lst) 0) (sum-all-odd-rec (cdr lst) sum)))
	(T (sum-all-odd-rec (cdr lst) 
		(if (oddp (car lst)) (+ (car lst) sum) sum))) ))

(defun sum-all-odd (lst)
	(sum-all-odd-rec lst 0))

(sum-all-odd '((1 2) (3) abc a (b c 4 5) T a)) ;; => 9

;; №9 Обработка списка с информацией.

;; (ФИО зарплата возраст категория)
(defun get-fio (lst) (car lst))
(defun get-salary (lst) (cadr lst))
(defun get-age (lst) (caddr lst))
(defun get-category (lst) (car lst))

;; Изменить зарплату в зависимости от заданного условия
(defun set-new-salary (man new-salary)
	(list (get-fio man) new-salary (get-age man) (get-category man)) )

(defun change-salary (condition lst new-salary)
	(if (funcall condition lst) (set-new-salary lst new-salary) lst))

(change-salary (lambda (man) (< (get-salary man) 135000 ))
	 '(Alice 14 20 1) 14000) 
;; Result: (ALICE 14000 20 ALICE)

(defun change-all-salary (workers condition new-salary)
	(cond ((null workers) Nil)
	(T (cons (change-salary condition (car workers) new-salary)
	(change-all-salary (cdr workers) condition new-salary))) ))

;; Меняем у зарплату у всех, у кого она меньше, чем 13500 на 50000
(change-all-salary 
	'((Alice 12000 20 1)
	(Pasha 12000 20 2)
	(Nastya 80000 21 3))
	(lambda (man) (< (get-salary man) 13500 ))
	50000)
;; Result: ((ALICE 50000 20 ALICE) (PASHA 50000 20 PASHA) (NASTYA 80000 21 3))

;; Подсчитать сумарную зарплату.
(defun sum-salary-rec (workers sum)
	(cond ((null workers) sum)
	(T (sum-salary-rec (cdr workers) (+ sum (get-salary(car workers))))) ))

(defun sum-salary (workers)
	(sum-salary-rec workers 0))

(sum-salary '((Alice 120 20 1)
	(Pasha 120 20 2)
	(Nastya 150 21 3))) ;; => 390

;; Использовать композицию функций:
(sum-salary (change-all-salary 
	'((Alice 12000 20 1)
	(Pasha 12000 20 2)
	(Nastya 80000 21 3))
	(lambda (man) (< (get-salary man) 13500 ))
	50000)) ;; => 180000