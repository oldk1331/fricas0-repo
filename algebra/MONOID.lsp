
(/VERSIONCHECK 2) 

(DEFPARAMETER |Monoid;AL| 'NIL) 

(DEFUN |Monoid| ()
  (LET (#:G130)
    (COND (|Monoid;AL|) (T (SETQ |Monoid;AL| (|Monoid;|)))))) 

(DEFUN |Monoid;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SemiGroup|)
                       (|mkCategory|
                        '(((|One| ($) |constant|) T)
                          ((|sample| ($) |constant|) T)
                          ((|one?| ((|Boolean|) $)) T)
                          ((^ ($ $ (|NonNegativeInteger|))) T)
                          ((|recip| ((|Union| $ "failed") $)) T))
                        NIL '((|NonNegativeInteger|) (|Boolean|)) NIL))
               |Monoid|)
       (SETELT #1# 0 '(|Monoid|)))))) 

(MAKEPROP '|Monoid| 'NILADIC T) 
