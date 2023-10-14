
(/VERSIONCHECK 2) 

(DEFPARAMETER |EntireRing;AL| 'NIL) 

(DEFUN |EntireRing| ()
  (LET (#:G135)
    (COND (|EntireRing;AL|) (T (SETQ |EntireRing;AL| (|EntireRing;|)))))) 

(DEFUN |EntireRing;| ()
  (PROG (#1=#:G133)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Ring|) (|BiModule| '$ '$) (|noZeroDivisors|)
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
               |EntireRing|)
       (SETELT #1# 0 '(|EntireRing|)))))) 

(MAKEPROP '|EntireRing| 'NILADIC T) 
