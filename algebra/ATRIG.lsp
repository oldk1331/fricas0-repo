
(/VERSIONCHECK 2) 

(DEFPARAMETER |ArcTrigonometricFunctionCategory;AL| 'NIL) 

(DEFUN |ArcTrigonometricFunctionCategory| ()
  (LET (#:G127)
    (COND (|ArcTrigonometricFunctionCategory;AL|)
          (T
           (SETQ |ArcTrigonometricFunctionCategory;AL|
                   (|ArcTrigonometricFunctionCategory;|)))))) 

(DEFUN |ArcTrigonometricFunctionCategory;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|acos| ($ $)) T) ((|acot| ($ $)) T) ((|acsc| ($ $)) T)
                   ((|asec| ($ $)) T) ((|asin| ($ $)) T) ((|atan| ($ $)) T))
                 NIL 'NIL NIL))
               |ArcTrigonometricFunctionCategory|)
       (SETELT #1# 0 '(|ArcTrigonometricFunctionCategory|)))))) 

(MAKEPROP '|ArcTrigonometricFunctionCategory| 'NILADIC T) 
