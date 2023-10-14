
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |SemiRng;|)) 

(DEFPARAMETER |SemiRng;AL| 'NIL) 

(DEFUN |SemiRng| ()
  (LET (#:G105)
    (COND (|SemiRng;AL|) (T (SETQ |SemiRng;AL| (|SemiRng;|)))))) 

(DEFUN |SemiRng;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|AbelianSemiGroup|) (|SemiGroup|)) |SemiRng|)
       (SETELT #1# 0 '(|SemiRng|)))))) 

(MAKEPROP '|SemiRng| 'NILADIC T) 
