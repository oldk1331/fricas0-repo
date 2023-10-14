
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |OrderedIntegralDomain;|)) 

(DEFPARAMETER |OrderedIntegralDomain;AL| 'NIL) 

(DEFUN |OrderedIntegralDomain| ()
  (LET (#:G129)
    (COND (|OrderedIntegralDomain;AL|)
          (T (SETQ |OrderedIntegralDomain;AL| (|OrderedIntegralDomain;|)))))) 

(DEFUN |OrderedIntegralDomain;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|IntegralDomain|) (|OrderedRing|))
               |OrderedIntegralDomain|)
       (SETELT #1# 0 '(|OrderedIntegralDomain|)))))) 

(MAKEPROP '|OrderedIntegralDomain| 'NILADIC T) 
