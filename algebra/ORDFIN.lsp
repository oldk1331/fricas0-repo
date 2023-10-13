
(/VERSIONCHECK 2) 

(DEFPARAMETER |OrderedFinite;AL| 'NIL) 

(DEFUN |OrderedFinite| ()
  (LET (#:G127)
    (COND (|OrderedFinite;AL|)
          (T (SETQ |OrderedFinite;AL| (|OrderedFinite;|)))))) 

(DEFUN |OrderedFinite;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|Finite|)) |OrderedFinite|)
       (SETELT #1# 0 '(|OrderedFinite|)))))) 

(MAKEPROP '|OrderedFinite| 'NILADIC T) 
