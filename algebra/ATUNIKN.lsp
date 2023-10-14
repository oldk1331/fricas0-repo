
(DECLAIM (NOTINLINE |unitsKnown;|)) 

(DEFPARAMETER |unitsKnown;AL| 'NIL) 

(DEFUN |unitsKnown| ()
  (LET (#:G105)
    (COND (|unitsKnown;AL|) (T (SETQ |unitsKnown;AL| (|unitsKnown;|)))))) 

(DEFUN |unitsKnown;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |unitsKnown|)
       (SETELT #1# 0 '(|unitsKnown|)))))) 

(MAKEPROP '|unitsKnown| 'NILADIC T) 
