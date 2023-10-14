
(DECLAIM (NOTINLINE |Group;|)) 

(DEFPARAMETER |Group;AL| 'NIL) 

(DEFUN |Group| ()
  (LET (#:G106)
    (COND (|Group;AL|) (T (SETQ |Group;AL| (|Group;|)))))) 

(DEFUN |Group;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Monoid|) (|unitsKnown|)
                           (|mkCategory|
                            '(((|inv| ($ $)) T) ((/ ($ $ $)) T)
                              ((^ ($ $ (|Integer|))) T)
                              ((|conjugate| ($ $ $)) T)
                              ((|commutator| ($ $ $)) T))
                            NIL '((|Integer|)) NIL))
                   |Group|)
           (SETELT #1# 0 '(|Group|))))) 

(MAKEPROP '|Group| 'NILADIC T) 
