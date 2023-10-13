
(/VERSIONCHECK 2) 

(DEFPARAMETER |Rng;AL| 'NIL) 

(DEFUN |Rng| ()
  (LET (#:G127)
    (COND (|Rng;AL|) (T (SETQ |Rng;AL| (|Rng;|)))))) 

(DEFUN |Rng;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|AbelianGroup|) (|SemiRng|)) |Rng|)
       (SETELT #1# 0 '(|Rng|)))))) 

(MAKEPROP '|Rng| 'NILADIC T) 
