
(/VERSIONCHECK 2) 

(DEFPARAMETER |SemiGroup;AL| 'NIL) 

(DEFUN |SemiGroup| ()
  (LET (#:G129)
    (COND (|SemiGroup;AL|) (T (SETQ |SemiGroup;AL| (|SemiGroup;|)))))) 

(DEFUN |SemiGroup;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((* ($ $ $)) T) ((^ ($ $ (|PositiveInteger|))) T))
                        NIL '((|PositiveInteger|)) NIL))
               |SemiGroup|)
       (SETELT #1# 0 '(|SemiGroup|)))))) 

(MAKEPROP '|SemiGroup| 'NILADIC T) 
