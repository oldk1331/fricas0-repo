
(DECLAIM (NOTINLINE |Type;|)) 

(DEFPARAMETER |Type;AL| 'NIL) 

(DEFUN |Type| ()
  (LET (#:G106)
    (COND (|Type;AL|) (T (SETQ |Type;AL| (|Type;|)))))) 

(DEFUN |Type;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Type|)
           (SETELT #1# 0 '(|Type|))))) 

(MAKEPROP '|Type| 'NILADIC T) 
