
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |additiveValuation;|)) 

(DEFPARAMETER |additiveValuation;AL| 'NIL) 

(DEFUN |additiveValuation| ()
  (LET (#:G129)
    (COND (|additiveValuation;AL|)
          (T (SETQ |additiveValuation;AL| (|additiveValuation;|)))))) 

(DEFUN |additiveValuation;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |additiveValuation|)
       (SETELT #1# 0 '(|additiveValuation|)))))) 

(MAKEPROP '|additiveValuation| 'NILADIC T) 
