
(DECLAIM (NOTINLINE |Group;|)) 

(DEFPARAMETER |Group;AL| 'NIL) 

(DEFUN |Group| ()
  (LET (#:G107)
    (COND (|Group;AL|) (T (SETQ |Group;AL| (|Group;|)))))) 

(DEFUN |Group;| ()
  (SPROG ((#1=#:G105 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Monoid|) (|TwoSidedRecip|) (|unitsKnown|)
                           (|mkCategory|
                            '(((|inv| ($ $)) T) ((/ ($ $ $)) T)
                              ((^ ($ $ (|Integer|))) T)
                              ((|conjugate| ($ $ $)) T)
                              ((|commutator| ($ $ $)) T))
                            NIL '((|Integer|)) NIL))
                   |Group|)
           (SETELT #1# 0 '(|Group|))))) 

(MAKEPROP '|Group| 'NILADIC T) 
