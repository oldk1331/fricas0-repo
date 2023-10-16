
(DECLAIM (NOTINLINE |FiniteGroup;|)) 

(DEFPARAMETER |FiniteGroup;AL| 'NIL) 

(DEFUN |FiniteGroup| ()
  (COND (|FiniteGroup;AL|) (T (SETQ |FiniteGroup;AL| (|FiniteGroup;|))))) 

(DEFUN |FiniteGroup;| ()
  (SPROG ((#1=#:G105 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Group|) (|Finite|)
                           (|mkCategory| '(((|order| ((|Integer|) $)) T)) NIL
                                         '((|Integer|)) NIL))
                   |FiniteGroup|)
           (SETELT #1# 0 '(|FiniteGroup|))))) 

(MAKEPROP '|FiniteGroup| 'NILADIC T) 
