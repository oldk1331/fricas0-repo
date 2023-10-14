
(DECLAIM (NOTINLINE |Type;|)) 

(DEFPARAMETER |Type;AL| 'NIL) 

(DEFUN |Type| ()
  (LET (#:G105)
    (COND (|Type;AL|) (T (SETQ |Type;AL| (|Type;|)))))) 

(DEFUN |Type;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Type|)
       (SETELT #1# 0 '(|Type|)))))) 

(MAKEPROP '|Type| 'NILADIC T) 
