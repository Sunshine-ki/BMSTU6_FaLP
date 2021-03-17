;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; 

(defun my-reverse (lst res)
	(cond ((null lst) res) 
	(T (my-reverse (cdr lst) (cons (car lst) res)))) )

(defun my-reverse (lst)
	(cond ((null lst) NIL)
	(T (append (Reverse (cdr lst))
					(cons (car lst) NIL) )) ))


;; (defun f-mult-rec (lst num res)
;; 	(cond ((null lst) res) 
;; 	(T (f-mult-rec (cdr lst) num (list res (car lst))))) )

;; (defun f-mult (lst num)
;; 	(f-mult-rec (cdr lst) num (car lst)) )


;; (defun f (lst res)
;; 	(cond ((null lst) ())
;; 	(T (cons (car lst) (f (cdr lst)))) ) )

;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; 


;; №1 (Из лаб 5 №7)

;; А)
(defun f (lst num)
	(cond ((null lst) ())
	(T (cons (* num (car lst)) (f (cdr lst) num))) ) )

(f '(1 2 3 4) 5) ;; (5 10 15 20)

;; Б)
(defun f (lst num)
	(cond ((null lst) ())
	((symbolp (car lst)) (cons (car lst) (f (cdr lst) num)))
	((listp (car lst)) (cons (f (car lst) num) (f (cdr lst) num)))
	(T (cons (* num (car lst)) (f (cdr lst) num))) ) )

(f '(1 2 (3 4 a) (b) T 7) 2) ;; (2 4 (6 8 A) (B) T 14)


;; №2 (Из лаб 5 №8)
;; (1 2 3 4 5 6 7)

(defun check-border (x a b)
	(and (>= x a) (<= x b)) )

(defun select-between (lst a b)
	(cond ((null lst) ())
	((symbolp (car lst)) (cons (car lst) (select-between (cdr lst) a b)))
	((listp (car lst)) (cons (select-between (car lst) a b) (select-between (cdr lst) a b)))
	((check-border (car lst) a b) (cons (car lst) (select-between (cdr lst) a b)))
	(T (select-between (cdr lst) a b))) )

(select-between '(1 2 (a b 3 4) T c 4 6 11 5) 2 7) ;; (2 (A B 3 4) T C 4 6 5)

;; №3
;; mapcar примерняет свой первый аргумент поэлементно к своим аргументам.
;; Т.е. первым аргументом должна быть функция. В нашем случае 
;; Функции "вектор" нет. 
(mapcar 'вектор '(570-40-8)) ;; => Error: ВЕКТОР is undefined.

;; Пример mapcar:
(mapcar (lambda (x) (+ 1 x)) '(1 2 3)) ;; (2 3 4)

;; №4
(defun f-func (lst)
	(mapcar (lambda (x) (- x 10)) lst))

(defun f-rec (lst)
	(cond ((null lst) ())
	((symbolp (car lst)) (cons (car lst) (f-rec (cdr lst))))
	((listp (car lst)) (cons (f-rec (car lst)) (f-rec (cdr lst))))
	(T (cons (- (car lst) 10) (f-rec (cdr lst))))) )

(f-func '(11 12 13 14 1)) ;; (1 2 3 4 -9)  
(f-rec '(11 12 13 14 1))  ;; (1 2 3 4 -9)

;; №5

(defun f (lst)
	(cond ((null lst) NIL)
	((null (car lst)) NIL) ;; (f (cdr lst)) ???
	(T (car lst))) )

(f '(Nil 1 2 3)) ;; NIL
(f '((1 2 3) 4 5 6)) ;; (1 2 3)

;; Сумма числовых элементов смешанного структурированного списка
(defun f-rec (lst num)
	(cond ((null lst) num)
	((symbolp (car lst)) (f-rec (cdr lst) num))
	((listp (car lst)) (+ (f-rec (car lst) 0) (f-rec (cdr lst) num)))
	(T (f-rec (cdr lst) (+ num (car lst))))) )

(defun f (lst)
	(f-rec lst 0) )

(f '(1 2 3 (a b c) (a 2 b) (((c))) ((5)))) ;; => 13