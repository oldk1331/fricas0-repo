
(/VERSIONCHECK 2) 

(DEFPARAMETER |multiplicativeValuation;AL| 'NIL) 

(DEFUN |multiplicativeValuation| ()
  (LET (#:G127)
    (COND (|multiplicativeValuation;AL|)
          (T
           (SETQ |multiplicativeValuation;AL| (|multiplicativeValuation;|)))))) 

(DEFUN |multiplicativeValuation;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |multiplicativeValuation|)
       (SETELT #1# 0 '(|multiplicativeValuation|)))))) 

(MAKEPROP '|multiplicativeValuation| 'NILADIC T) 
