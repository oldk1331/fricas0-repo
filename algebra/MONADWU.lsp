
(/VERSIONCHECK 2) 

(DEFPARAMETER |MonadWithUnit;AL| 'NIL) 

(DEFUN |MonadWithUnit| ()
  (LET (#:G132)
    (COND (|MonadWithUnit;AL|)
          (T (SETQ |MonadWithUnit;AL| (|MonadWithUnit;|)))))) 

(DEFUN |MonadWithUnit;| ()
  (PROG (#1=#:G130)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Monad|)
                       (|mkCategory|
                        '(((|One| ($) |constant|) T)
                          ((|one?| ((|Boolean|) $)) T)
                          ((|rightPower| ($ $ (|NonNegativeInteger|))) T)
                          ((|leftPower| ($ $ (|NonNegativeInteger|))) T)
                          ((^ ($ $ (|NonNegativeInteger|))) T)
                          ((|recip| ((|Union| $ "failed") $)) T)
                          ((|leftRecip| ((|Union| $ "failed") $)) T)
                          ((|rightRecip| ((|Union| $ "failed") $)) T))
                        NIL '((|NonNegativeInteger|) (|Boolean|)) NIL))
               |MonadWithUnit|)
       (SETELT #1# 0 '(|MonadWithUnit|)))))) 

(MAKEPROP '|MonadWithUnit| 'NILADIC T) 
