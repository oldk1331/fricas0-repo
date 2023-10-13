
(/VERSIONCHECK 2) 

(DEFPARAMETER |IntegralDomain;AL| 'NIL) 

(DEFUN |IntegralDomain| ()
  (LET (#:G133)
    (COND (|IntegralDomain;AL|)
          (T (SETQ |IntegralDomain;AL| (|IntegralDomain;|)))))) 

(DEFUN |IntegralDomain;| ()
  (PROG (#1=#:G131)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|CommutativeRing|) (|Algebra| '$) (|EntireRing|)
                       (|mkCategory|
                        '(((|exquo| ((|Union| $ "failed") $ $)) T)
                          ((|unitNormal|
                            ((|Record| (|:| |unit| $) (|:| |canonical| $)
                                       (|:| |associate| $))
                             $))
                           T)
                          ((|unitCanonical| ($ $)) T)
                          ((|associates?| ((|Boolean|) $ $)) T)
                          ((|unit?| ((|Boolean|) $)) T))
                        NIL '((|Boolean|)) NIL))
               |IntegralDomain|)
       (SETELT #1# 0 '(|IntegralDomain|)))))) 

(MAKEPROP '|IntegralDomain| 'NILADIC T) 
