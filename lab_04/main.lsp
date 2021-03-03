;; (or (equal '(1 1) '(1 1)) (= '(1 1) '(1 1)))
;; (or (= '(1 1) '(1 1)) (equal '(1 1) '(1 1)))

;; Номер 1
(defun c-to-f (temp) (+ (* 9/5 temp) 32.0))
(defun f-to-c (temp) (* 5/9 (- temp 32.0)))
;; (f-to-c 451) -> 232.77779
;; (c-to-f 232.77779) -> 451.0

;; Номер 2
;; (CONS T NIL)
;; Т.к. мы блокируем вычисления 'cons - будет 
;; Являться головой списка, а t и nil - хвостом.
(list 'cons t Nil)
;; (list 'cons t Nil) -> (CONS T NIL)
;; (CONS T NIL) -> (T)
;; (T) -> Error Undefined function: T
(eval (eval (list 'cons t Nil)))


;; apply (применить) - принимает два аргумента:
;; 1 - функциональный аргумент - 
;; Квотируемое имя функции ('*, '+, 'cons ...)
;; 2 - Список к которому будет применен первый аргумент.
;; Пример:
;; (apply '* '(2 5)) => 10
;; #' (или FUNCTION) - функциональная блокировка.
;; говорит о том, что за ней следует имя функции.
(apply #'cons '(t Nil)) ;; (T)

;; Конструирует список, в котором
;; eval - голова, Nil - хвост.
(list 'eval Nil) ;; (eval Nil)

;; (list 'cons t Nil) -> (cons t Nil)
;; (cons t Nil) -> (t)
(eval (list 'cons t Nil)) ;; (T)

;; Nil
;; См. схему вызова eval.
(eval Nil)

;; (list 'eval Nil) -> (eval Nil)
;; (eval Nil) -> Nil
(eval (list 'eval Nil)) ;; Nil

;; Номер 3 (Доп. 1)
;; Дано: a - катет, c - гипотенуза
;; Найти второй катет b.
(defun cathetus (c a) (sqrt (- (* c c) (* a a))))
;; (CATHETUS 10 6) -> 8

;; Номер 4 (Доп. 2)
;; Дано: a, b, h
(defun S (a b h) (* (+ a b) h 0.5))
;; (s 2 3 1) -> 2.5