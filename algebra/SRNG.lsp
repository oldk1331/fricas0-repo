
(/VERSIONCHECK 2) 

(DEFPARAMETER |SemiRng;AL| 'NIL) 

(DEFUN |SemiRng| ()
  (LET (#:G127)
    (COND (|SemiRng;AL|) (T (SETQ |SemiRng;AL| (|SemiRng;|)))))) 

(DEFUN |SemiRng;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|AbelianSemiGroup|) (|SemiGroup|)) |SemiRng|)
       (SETELT #1# 0 '(|SemiRng|)))))) 

(MAKEPROP '|SemiRng| 'NILADIC T) 
