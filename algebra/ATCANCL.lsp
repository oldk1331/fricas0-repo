
(/VERSIONCHECK 2) 

(DEFPARAMETER |canonicalsClosed;AL| 'NIL) 

(DEFUN |canonicalsClosed| ()
  (LET (#:G127)
    (COND (|canonicalsClosed;AL|)
          (T (SETQ |canonicalsClosed;AL| (|canonicalsClosed;|)))))) 

(DEFUN |canonicalsClosed;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |canonicalsClosed|)
       (SETELT #1# 0 '(|canonicalsClosed|)))))) 

(MAKEPROP '|canonicalsClosed| 'NILADIC T) 
