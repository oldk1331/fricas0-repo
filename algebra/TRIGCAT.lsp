
(/VERSIONCHECK 2) 

(DEFPARAMETER |TrigonometricFunctionCategory;AL| 'NIL) 

(DEFUN |TrigonometricFunctionCategory| ()
  (LET (#:G129)
    (COND (|TrigonometricFunctionCategory;AL|)
          (T
           (SETQ |TrigonometricFunctionCategory;AL|
                   (|TrigonometricFunctionCategory;|)))))) 

(DEFUN |TrigonometricFunctionCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|cos| ($ $)) T) ((|cot| ($ $)) T) ((|csc| ($ $)) T)
                   ((|sec| ($ $)) T) ((|sin| ($ $)) T) ((|tan| ($ $)) T))
                 NIL 'NIL NIL))
               |TrigonometricFunctionCategory|)
       (SETELT #1# 0 '(|TrigonometricFunctionCategory|)))))) 

(MAKEPROP '|TrigonometricFunctionCategory| 'NILADIC T) 
