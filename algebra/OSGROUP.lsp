
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |OrderedSemiGroup;|)) 

(DEFPARAMETER |OrderedSemiGroup;AL| 'NIL) 

(DEFUN |OrderedSemiGroup| ()
  (LET (#:G129)
    (COND (|OrderedSemiGroup;AL|)
          (T (SETQ |OrderedSemiGroup;AL| (|OrderedSemiGroup;|)))))) 

(DEFUN |OrderedSemiGroup;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|SemiGroup|)) |OrderedSemiGroup|)
       (SETELT #1# 0 '(|OrderedSemiGroup|)))))) 

(MAKEPROP '|OrderedSemiGroup| 'NILADIC T) 
