;; Из лаб. 6: 4-7

;; №1
(defun check-border (x a b)
	(and (>= x a) (<= x b)) )

(defun select-between (lst a b)
	(cond ((null lst) ())
	((symbolp (car lst)) (cons (car lst) (select-between (cdr lst) a b)))
	((listp (car lst)) (cons (select-between (car lst) a b) (select-between (cdr lst) a b)))
	((check-border (car lst) a b) (cons (car lst) (select-between (cdr lst) a b)))
	(T (select-between (cdr lst) a b))) )

(select-between '(1 2 (a b 3 4) T c 4 6 11 5) 2 7) ;; (2 (A B 3 4) T C 4 6 5)

;; №2 Декартово произведение

(defun decart-elem (lst elem)
	(cond ((null lst) ())
	(T (cons (list elem (car lst)) (decart-elem (cdr lst) elem)))) )

(decart-elem '(a b c) 'd) ;; => ((D A) (D B) (D C))

(defun decart (lst1 lst2)
	(cond ((null lst1) nil)
	(T (append (decart-elem lst2 (car lst1)) (decart (cdr lst1) lst2)))) )


;; ((A D) (A E) (A F) (B D) (B E) (B F) (C D) (C E) (C F))
(decart '(a b c) '(d e f)) 


;; №3
(reduce #'+ ()) ;; 0
(reduce #'* ()) ;; 1

;; №4
(defun list-of-list-rec (lst len)
	(cond ((null lst) len)
	(T (list-of-list-rec (cdr lst) (+ len (length (car lst)) )))))

(defun list-of-list (lst)
	(list-of-list-rec lst 0))

(list-of-list '((1 2 3) (4 5))) ;; => 5

;; Для структурированного списка:
(defun list-of-list-rec (lst len)
	(cond ((null lst) len)
		((listp (car lst)) 
		;; +1: потому что нужно ещё учесть сам список (который дальше будет просматриваться).
		(+ 1 (list-of-list-rec (car lst) 0) (list-of-list-rec (cdr lst) len))) 
		(T (list-of-list-rec (cdr lst) (+ 1 len))) ))

(defun list-of-list (lst)
	(- (list-of-list-rec lst 0) (length lst)))

(list-of-list '((1 2) (3 4) (5 6 (7 8) 9))) ;; => 10

;; №5 
;; Квадрат смешанного стуктурированного списка
;; В результирующем списке только числа.
(defun square-lst (lst) 
	(cond ((null lst) Nil)
	((symbolp (car lst)) (square-lst (cdr lst)))
	((listp (car lst)) (append (square-lst (car lst)) (square-lst (cdr lst))))
	(T (cons (* (car lst) (car lst)) (square-lst (cdr lst)))) )) 

(square-lst '((1 2 a) 'b 3 T 4)) ;; => (1 4 9 16)
