
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |CombinatorialFunctionCategory;|)) 

(DEFPARAMETER |CombinatorialFunctionCategory;AL| 'NIL) 

(DEFUN |CombinatorialFunctionCategory| ()
  (LET (#:G129)
    (COND (|CombinatorialFunctionCategory;AL|)
          (T
           (SETQ |CombinatorialFunctionCategory;AL|
                   (|CombinatorialFunctionCategory;|)))))) 

(DEFUN |CombinatorialFunctionCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|binomial| ($ $ $)) T) ((|factorial| ($ $)) T)
                   ((|permutation| ($ $ $)) T))
                 NIL 'NIL NIL))
               |CombinatorialFunctionCategory|)
       (SETELT #1# 0 '(|CombinatorialFunctionCategory|)))))) 

(MAKEPROP '|CombinatorialFunctionCategory| 'NILADIC T) 
