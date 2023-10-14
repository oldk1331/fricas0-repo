
(/VERSIONCHECK 2) 

(DEFPARAMETER |Aggregate;AL| 'NIL) 

(DEFUN |Aggregate| ()
  (LET (#:G129)
    (COND (|Aggregate;AL|) (T (SETQ |Aggregate;AL| (|Aggregate;|)))))) 

(DEFUN |Aggregate;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Type|)
                       (|mkCategory|
                        '(((|eq?| ((|Boolean|) $ $)) T) ((|copy| ($ $)) T)
                          ((|empty| ($)) T) ((|empty?| ((|Boolean|) $)) T)
                          ((|less?| ((|Boolean|) $ (|NonNegativeInteger|))) T)
                          ((|more?| ((|Boolean|) $ (|NonNegativeInteger|))) T)
                          ((|size?| ((|Boolean|) $ (|NonNegativeInteger|))) T)
                          ((|sample| ($) |constant|) T)
                          ((|#| ((|NonNegativeInteger|) $))
                           (|has| $ (|finiteAggregate|))))
                        NIL '((|NonNegativeInteger|) (|Boolean|)) NIL))
               |Aggregate|)
       (SETELT #1# 0 '(|Aggregate|)))))) 

(MAKEPROP '|Aggregate| 'NILADIC T) 
