
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |ArcHyperbolicFunctionCategory;|)) 

(DEFPARAMETER |ArcHyperbolicFunctionCategory;AL| 'NIL) 

(DEFUN |ArcHyperbolicFunctionCategory| ()
  (LET (#:G105)
    (COND (|ArcHyperbolicFunctionCategory;AL|)
          (T
           (SETQ |ArcHyperbolicFunctionCategory;AL|
                   (|ArcHyperbolicFunctionCategory;|)))))) 

(DEFUN |ArcHyperbolicFunctionCategory;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|acosh| ($ $)) T) ((|acoth| ($ $)) T) ((|acsch| ($ $)) T)
                   ((|asech| ($ $)) T) ((|asinh| ($ $)) T) ((|atanh| ($ $)) T))
                 NIL 'NIL NIL))
               |ArcHyperbolicFunctionCategory|)
       (SETELT #1# 0 '(|ArcHyperbolicFunctionCategory|)))))) 

(MAKEPROP '|ArcHyperbolicFunctionCategory| 'NILADIC T) 
