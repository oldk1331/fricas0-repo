
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |Canonical;|)) 

(DEFPARAMETER |Canonical;AL| 'NIL) 

(DEFUN |Canonical| ()
  (LET (#:G129)
    (COND (|Canonical;AL|) (T (SETQ |Canonical;AL| (|Canonical;|)))))) 

(DEFUN |Canonical;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Canonical|)
       (SETELT #1# 0 '(|Canonical|)))))) 

(MAKEPROP '|Canonical| 'NILADIC T) 
