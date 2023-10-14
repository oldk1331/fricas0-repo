
(DECLAIM (NOTINLINE |BasicType;|)) 

(DEFPARAMETER |BasicType;AL| 'NIL) 

(DEFUN |BasicType| ()
  (LET (#:G105)
    (COND (|BasicType;AL|) (T (SETQ |BasicType;AL| (|BasicType;|)))))) 

(DEFUN |BasicType;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((= ((|Boolean|) $ $)) T) ((~= ((|Boolean|) $ $)) T)) NIL
                 '((|Boolean|)) NIL))
               |BasicType|)
       (SETELT #1# 0 '(|BasicType|)))))) 

(MAKEPROP '|BasicType| 'NILADIC T) 
