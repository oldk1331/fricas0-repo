
(DECLAIM (NOTINLINE |SemiGroup;|)) 

(DEFPARAMETER |SemiGroup;AL| 'NIL) 

(DEFUN |SemiGroup| ()
  (LET (#:G106)
    (COND (|SemiGroup;AL|) (T (SETQ |SemiGroup;AL| (|SemiGroup;|)))))) 

(DEFUN |SemiGroup;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((* ($ $ $)) T)
                              ((^ ($ $ (|PositiveInteger|))) T))
                            NIL '((|PositiveInteger|)) NIL))
                   |SemiGroup|)
           (SETELT #1# 0 '(|SemiGroup|))))) 

(MAKEPROP '|SemiGroup| 'NILADIC T) 
