
(DECLAIM (NOTINLINE |IntegralDomain;|)) 

(DEFPARAMETER |IntegralDomain;AL| 'NIL) 

(DEFUN |IntegralDomain| ()
  (LET (#:G105)
    (COND (|IntegralDomain;AL|)
          (T (SETQ |IntegralDomain;AL| (|IntegralDomain;|)))))) 

(DEFUN |IntegralDomain;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|CommutativeRing|) (|Algebra| '$) (|EntireRing|))
               |IntegralDomain|)
       (SETELT #1# 0 '(|IntegralDomain|)))))) 

(MAKEPROP '|IntegralDomain| 'NILADIC T) 
