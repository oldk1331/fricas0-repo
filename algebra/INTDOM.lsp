
(/VERSIONCHECK 2) 

(DEFPARAMETER |IntegralDomain;AL| 'NIL) 

(DEFUN |IntegralDomain| ()
  (LET (#:G127)
    (COND (|IntegralDomain;AL|)
          (T (SETQ |IntegralDomain;AL| (|IntegralDomain;|)))))) 

(DEFUN |IntegralDomain;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|CommutativeRing|) (|Algebra| '$) (|EntireRing|))
               |IntegralDomain|)
       (SETELT #1# 0 '(|IntegralDomain|)))))) 

(MAKEPROP '|IntegralDomain| 'NILADIC T) 
