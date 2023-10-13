
(/VERSIONCHECK 2) 

(DEFPARAMETER |OrderedSemiGroup;AL| 'NIL) 

(DEFUN |OrderedSemiGroup| ()
  (LET (#:G127)
    (COND (|OrderedSemiGroup;AL|)
          (T (SETQ |OrderedSemiGroup;AL| (|OrderedSemiGroup;|)))))) 

(DEFUN |OrderedSemiGroup;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|SemiGroup|)) |OrderedSemiGroup|)
       (SETELT #1# 0 '(|OrderedSemiGroup|)))))) 

(MAKEPROP '|OrderedSemiGroup| 'NILADIC T) 
