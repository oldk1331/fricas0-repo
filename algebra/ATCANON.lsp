
(DECLAIM (NOTINLINE |Canonical;|)) 

(DEFPARAMETER |Canonical;AL| 'NIL) 

(DEFUN |Canonical| ()
  (LET (#:G105)
    (COND (|Canonical;AL|) (T (SETQ |Canonical;AL| (|Canonical;|)))))) 

(DEFUN |Canonical;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Canonical|)
           (SETELT #1# 0 '(|Canonical|))))) 

(MAKEPROP '|Canonical| 'NILADIC T) 
