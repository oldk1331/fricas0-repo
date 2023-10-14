
(/VERSIONCHECK 2) 

(DEFPARAMETER |BasicType;AL| 'NIL) 

(DEFUN |BasicType| ()
  (LET (#:G129)
    (COND (|BasicType;AL|) (T (SETQ |BasicType;AL| (|BasicType;|)))))) 

(DEFUN |BasicType;| ()
  (PROG (#1=#:G127)
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
