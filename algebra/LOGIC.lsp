
(DECLAIM (NOTINLINE |Logic;|)) 

(DEFPARAMETER |Logic;AL| 'NIL) 

(DEFUN |Logic| ()
  (LET (#:G106)
    (COND (|Logic;AL|) (T (SETQ |Logic;AL| (|Logic;|)))))) 

(DEFUN |Logic;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|BasicType|)
                           (|mkCategory|
                            '(((~ ($ $)) T) ((|/\\| ($ $ $)) T)
                              ((|\\/| ($ $ $)) T))
                            NIL 'NIL NIL))
                   |Logic|)
           (SETELT #1# 0 '(|Logic|))))) 

(MAKEPROP '|Logic| 'NILADIC T) 
