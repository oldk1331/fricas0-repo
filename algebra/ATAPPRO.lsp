
(DECLAIM (NOTINLINE |Approximate;|)) 

(DEFPARAMETER |Approximate;AL| 'NIL) 

(DEFUN |Approximate| ()
  (LET (#:G105)
    (COND (|Approximate;AL|) (T (SETQ |Approximate;AL| (|Approximate;|)))))) 

(DEFUN |Approximate;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Approximate|)
           (SETELT #1# 0 '(|Approximate|))))) 

(MAKEPROP '|Approximate| 'NILADIC T) 
