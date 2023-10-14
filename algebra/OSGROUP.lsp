
(DECLAIM (NOTINLINE |OrderedSemiGroup;|)) 

(DEFPARAMETER |OrderedSemiGroup;AL| 'NIL) 

(DEFUN |OrderedSemiGroup| ()
  (LET (#:G105)
    (COND (|OrderedSemiGroup;AL|)
          (T (SETQ |OrderedSemiGroup;AL| (|OrderedSemiGroup;|)))))) 

(DEFUN |OrderedSemiGroup;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|OrderedSet|) (|SemiGroup|))
                   |OrderedSemiGroup|)
           (SETELT #1# 0 '(|OrderedSemiGroup|))))) 

(MAKEPROP '|OrderedSemiGroup| 'NILADIC T) 
