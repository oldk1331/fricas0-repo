
(/VERSIONCHECK 2) 

(DEFPARAMETER |Type;AL| 'NIL) 

(DEFUN |Type| ()
  (LET (#:G129)
    (COND (|Type;AL|) (T (SETQ |Type;AL| (|Type;|)))))) 

(DEFUN |Type;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |Type|)
       (SETELT #1# 0 '(|Type|)))))) 

(MAKEPROP '|Type| 'NILADIC T) 
