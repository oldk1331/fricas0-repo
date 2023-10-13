
(/VERSIONCHECK 2) 

(DEFPARAMETER |Comparable;AL| 'NIL) 

(DEFUN |Comparable| ()
  (LET (#:G127)
    (COND (|Comparable;AL|) (T (SETQ |Comparable;AL| (|Comparable;|)))))) 

(DEFUN |Comparable;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory| '(((|smaller?| ((|Boolean|) $ $)) T)) NIL
                                     '((|Boolean|)) NIL))
               |Comparable|)
       (SETELT #1# 0 '(|Comparable|)))))) 

(MAKEPROP '|Comparable| 'NILADIC T) 
