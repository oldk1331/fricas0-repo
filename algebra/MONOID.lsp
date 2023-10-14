
(DECLAIM (NOTINLINE |Monoid;|)) 

(DEFPARAMETER |Monoid;AL| 'NIL) 

(DEFUN |Monoid| ()
  (LET (#:G106)
    (COND (|Monoid;AL|) (T (SETQ |Monoid;AL| (|Monoid;|)))))) 

(DEFUN |Monoid;| ()
  (PROG (#1=#:G104)
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
