
(DECLAIM (NOTINLINE |OrderedFinite;|)) 

(DEFPARAMETER |OrderedFinite;AL| 'NIL) 

(DEFUN |OrderedFinite| ()
  (LET (#:G106)
    (COND (|OrderedFinite;AL|)
          (T (SETQ |OrderedFinite;AL| (|OrderedFinite;|)))))) 

(DEFUN |OrderedFinite;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|Finite|)) |OrderedFinite|)
           (SETELT #1# 0 '(|OrderedFinite|))))) 

(MAKEPROP '|OrderedFinite| 'NILADIC T) 
