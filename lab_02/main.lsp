;; №2
;; CAR - вернуть первый элемент.
;; CDR - список, без первого элемента.
(CAR (CDR '(a b c d e f))) 				;; Второй
(CAR (CDR (CDR '(a b c d e f)))) 		;; Третий
(CAR (CDR (CDR (CDR '(a b c d e f))))) 	;; Четвертый


;; №3
(CAADR '((blue cube) (red pyramid))) ;; red
(CDAR '((abc) (def) (ghi)))			 ;; nil
(CADR '((abc) (def) (ghi)))			 ;; (def)

;; 1. CDR = ((def) (ghi))
;; 2. CDR = ((ghi))
;; 3. CAR = (ghi)
(CADDR '((abc) (def) (ghi)))		 ;; (ghi)


;; №4
;; cons - конструирует спискок.
;; list  
(list 'Fred 'and Wilma) 		;; Error (The variable WILMA is unbound). 
(list 'Fred '(and Wilma)) 		;; (Fred (and Wilma))
(cons Nil Nil)					;; (Nil)
(cons T Nil)					;; (T) ;; T - true (bool)
(cons Nil T)					;; (Nil . T) ;; TODO: ???
(list Nil)						;; (Nil)
(cons (T) Nil)					;; Error fixme: (cons '(T) Nil)
(list '(one two) '(free temp)) 	;; (one two) (free temp)

(cons 'Fred '(and Willma))		;; (Fred and Willma)
(cons 'Fred '(Wilma))			;; (Fred Willma)
(list Nil Nil)					;; (Nil Nil)
(list T Nil)					;; (T Nil)
(list Nil T)					;; (Nil T)

(cons T (list Nil))				;;  (T Nil)
;; 1. (list Nil) = (Nil)
;; 2. (cons T (Nil)) = (T Nil)

(list (T) Nil)					;; Error fixme: (list '(T) Nil)
(cons '(one two) '(free temp))	;; ((one two) free temp))