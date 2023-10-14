
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |PartialOrder;|)) 

(DEFPARAMETER |PartialOrder;AL| 'NIL) 

(DEFUN |PartialOrder| ()
  (LET (#:G105)
    (COND (|PartialOrder;AL|) (T (SETQ |PartialOrder;AL| (|PartialOrder;|)))))) 

(DEFUN |PartialOrder;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((< ((|Boolean|) $ $)) T) ((> ((|Boolean|) $ $)) T)
                   ((>= ((|Boolean|) $ $)) T) ((<= ((|Boolean|) $ $)) T))
                 NIL '((|Boolean|)) NIL))
               |PartialOrder|)
       (SETELT #1# 0 '(|PartialOrder|)))))) 

(MAKEPROP '|PartialOrder| 'NILADIC T) 
