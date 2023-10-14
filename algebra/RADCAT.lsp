
(/VERSIONCHECK 2) 

(DEFPARAMETER |RadicalCategory;AL| 'NIL) 

(DEFUN |RadicalCategory| ()
  (LET (#:G129)
    (COND (|RadicalCategory;AL|)
          (T (SETQ |RadicalCategory;AL| (|RadicalCategory;|)))))) 

(DEFUN |RadicalCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|sqrt| ($ $)) T) ((|nthRoot| ($ $ (|Integer|))) T)
                   ((^ ($ $ (|Fraction| (|Integer|)))) T))
                 NIL '((|Fraction| (|Integer|)) (|Integer|)) NIL))
               |RadicalCategory|)
       (SETELT #1# 0 '(|RadicalCategory|)))))) 

(MAKEPROP '|RadicalCategory| 'NILADIC T) 
