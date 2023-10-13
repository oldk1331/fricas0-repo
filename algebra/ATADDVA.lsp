
(/VERSIONCHECK 2) 

(DEFPARAMETER |additiveValuation;AL| 'NIL) 

(DEFUN |additiveValuation| ()
  (LET (#:G127)
    (COND (|additiveValuation;AL|)
          (T (SETQ |additiveValuation;AL| (|additiveValuation;|)))))) 

(DEFUN |additiveValuation;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |additiveValuation|)
       (SETELT #1# 0 '(|additiveValuation|)))))) 

(MAKEPROP '|additiveValuation| 'NILADIC T) 
