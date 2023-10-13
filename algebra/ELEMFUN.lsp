
(/VERSIONCHECK 2) 

(DEFPARAMETER |ElementaryFunctionCategory;AL| 'NIL) 

(DEFUN |ElementaryFunctionCategory| ()
  (LET (#:G127)
    (COND (|ElementaryFunctionCategory;AL|)
          (T
           (SETQ |ElementaryFunctionCategory;AL|
                   (|ElementaryFunctionCategory;|)))))) 

(DEFUN |ElementaryFunctionCategory;| ()
  (PROG (#1=#:G125)
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
