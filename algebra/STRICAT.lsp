
(/VERSIONCHECK 2) 

(DEFPARAMETER |StringCategory;AL| 'NIL) 

(DEFUN |StringCategory| ()
  (LET (#:G127)
    (COND (|StringCategory;AL|)
          (T (SETQ |StringCategory;AL| (|StringCategory;|)))))) 

(DEFUN |StringCategory;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|StringAggregate|) (|SetCategory|) (|OpenMath|)
                       (|mkCategory| '(((|string| ($ (|Integer|))) T)) NIL
                                     '((|Integer|)) NIL))
               |StringCategory|)
       (SETELT #1# 0 '(|StringCategory|)))))) 

(MAKEPROP '|StringCategory| 'NILADIC T) 
