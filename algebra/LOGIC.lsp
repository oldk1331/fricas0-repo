
(/VERSIONCHECK 2) 

(DEFPARAMETER |Logic;AL| 'NIL) 

(DEFUN |Logic| ()
  (LET (#:G127)
    (COND (|Logic;AL|) (T (SETQ |Logic;AL| (|Logic;|)))))) 

(DEFUN |Logic;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|BasicType|)
                       (|mkCategory|
                        '(((~ ($ $)) T) ((|/\\| ($ $ $)) T)
                          ((|\\/| ($ $ $)) T))
                        NIL 'NIL NIL))
               |Logic|)
       (SETELT #1# 0 '(|Logic|)))))) 

(MAKEPROP '|Logic| 'NILADIC T) 
