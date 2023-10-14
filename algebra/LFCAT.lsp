
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |LiouvillianFunctionCategory;|)) 

(DEFPARAMETER |LiouvillianFunctionCategory;AL| 'NIL) 

(DEFUN |LiouvillianFunctionCategory| ()
  (LET (#:G105)
    (COND (|LiouvillianFunctionCategory;AL|)
          (T
           (SETQ |LiouvillianFunctionCategory;AL|
                   (|LiouvillianFunctionCategory;|)))))) 

(DEFUN |LiouvillianFunctionCategory;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|PrimitiveFunctionCategory|)
                       (|TranscendentalFunctionCategory|)
                       (|mkCategory|
                        '(((|Ei| ($ $)) T) ((|Si| ($ $)) T) ((|Ci| ($ $)) T)
                          ((|Shi| ($ $)) T) ((|Chi| ($ $)) T) ((|li| ($ $)) T)
                          ((|dilog| ($ $)) T) ((|erf| ($ $)) T)
                          ((|fresnelS| ($ $)) T) ((|fresnelC| ($ $)) T))
                        NIL 'NIL NIL))
               |LiouvillianFunctionCategory|)
       (SETELT #1# 0 '(|LiouvillianFunctionCategory|)))))) 

(MAKEPROP '|LiouvillianFunctionCategory| 'NILADIC T) 
