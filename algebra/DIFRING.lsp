
(/VERSIONCHECK 2) 

(DEFPARAMETER |DifferentialRing;AL| 'NIL) 

(DEFUN |DifferentialRing| ()
  (LET (#:G129)
    (COND (|DifferentialRing;AL|)
          (T (SETQ |DifferentialRing;AL| (|DifferentialRing;|)))))) 

(DEFUN |DifferentialRing;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Ring|)
                       (|mkCategory|
                        '(((|differentiate| ($ $)) T) ((D ($ $)) T)
                          ((|differentiate| ($ $ (|NonNegativeInteger|))) T)
                          ((D ($ $ (|NonNegativeInteger|))) T))
                        NIL '((|NonNegativeInteger|)) NIL))
               |DifferentialRing|)
       (SETELT #1# 0 '(|DifferentialRing|)))))) 

(MAKEPROP '|DifferentialRing| 'NILADIC T) 
