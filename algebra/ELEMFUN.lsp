
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |ElementaryFunctionCategory;|)) 

(DEFPARAMETER |ElementaryFunctionCategory;AL| 'NIL) 

(DEFUN |ElementaryFunctionCategory| ()
  (LET (#:G105)
    (COND (|ElementaryFunctionCategory;AL|)
          (T
           (SETQ |ElementaryFunctionCategory;AL|
                   (|ElementaryFunctionCategory;|)))))) 

(DEFUN |ElementaryFunctionCategory;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|log| ($ $)) T) ((|exp| ($ $)) T) ((^ ($ $ $)) T)) NIL
                 'NIL NIL))
               |ElementaryFunctionCategory|)
       (SETELT #1# 0 '(|ElementaryFunctionCategory|)))))) 

(MAKEPROP '|ElementaryFunctionCategory| 'NILADIC T) 
