
(DECLAIM (NOTINLINE |Monad;|)) 

(DEFPARAMETER |Monad;AL| 'NIL) 

(DEFUN |Monad| ()
  (LET (#:G105)
    (COND (|Monad;AL|) (T (SETQ |Monad;AL| (|Monad;|)))))) 

(DEFUN |Monad;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((* ($ $ $)) T)
                          ((|rightPower| ($ $ (|PositiveInteger|))) T)
                          ((|leftPower| ($ $ (|PositiveInteger|))) T)
                          ((^ ($ $ (|PositiveInteger|))) T))
                        NIL '((|PositiveInteger|)) NIL))
               |Monad|)
       (SETELT #1# 0 '(|Monad|)))))) 

(MAKEPROP '|Monad| 'NILADIC T) 
