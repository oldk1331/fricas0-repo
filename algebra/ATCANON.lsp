
(/VERSIONCHECK 2) 

(DEFPARAMETER |Canonical;AL| 'NIL) 

(DEFUN |Canonical| ()
  (LET (#:G127)
    (COND (|Canonical;AL|) (T (SETQ |Canonical;AL| (|Canonical;|)))))) 

(DEFUN |Canonical;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Canonical|)
       (SETELT #1# 0 '(|Canonical|)))))) 

(MAKEPROP '|Canonical| 'NILADIC T) 
