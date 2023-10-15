
(DECLAIM (NOTINLINE |NonAssociativeRng;|)) 

(DEFPARAMETER |NonAssociativeRng;AL| 'NIL) 

(DEFUN |NonAssociativeRng| ()
  (LET (#:G106)
    (COND (|NonAssociativeRng;AL|)
          (T (SETQ |NonAssociativeRng;AL| (|NonAssociativeRng;|)))))) 

(DEFUN |NonAssociativeRng;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|AbelianGroup|) (|Magma|)
                           (|mkCategory|
                            '(((|associator| ($ $ $ $)) T)
                              ((|commutator| ($ $ $)) T)
                              ((|antiCommutator| ($ $ $)) T))
                            NIL 'NIL NIL))
                   |NonAssociativeRng|)
           (SETELT #1# 0 '(|NonAssociativeRng|))))) 

(MAKEPROP '|NonAssociativeRng| 'NILADIC T) 
