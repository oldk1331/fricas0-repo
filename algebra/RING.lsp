
(/VERSIONCHECK 2) 

(DEFPARAMETER |Ring;AL| 'NIL) 

(DEFUN |Ring| ()
  (LET (#:G129)
    (COND (|Ring;AL|) (T (SETQ |Ring;AL| (|Ring;|)))))) 

(DEFUN |Ring;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Rng|) (|SemiRing|) (|LeftModule| '$) (|unitsKnown|)
                       (|mkCategory|
                        '(((|characteristic| ((|NonNegativeInteger|))) T)
                          ((|coerce| ($ (|Integer|))) T))
                        NIL '((|Integer|) (|NonNegativeInteger|)) NIL))
               |Ring|)
       (SETELT #1# 0 '(|Ring|)))))) 

(MAKEPROP '|Ring| 'NILADIC T) 
