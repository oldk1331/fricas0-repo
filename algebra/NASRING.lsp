
(DECLAIM (NOTINLINE |NonAssociativeRing;|)) 

(DEFPARAMETER |NonAssociativeRing;AL| 'NIL) 

(DEFUN |NonAssociativeRing| ()
  (LET (#:G105)
    (COND (|NonAssociativeRing;AL|)
          (T (SETQ |NonAssociativeRing;AL| (|NonAssociativeRing;|)))))) 

(DEFUN |NonAssociativeRing;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|NonAssociativeRng|) (|MonadWithUnit|)
                       (|mkCategory|
                        '(((|characteristic| ((|NonNegativeInteger|))) T)
                          ((|coerce| ($ (|Integer|))) T))
                        NIL '((|Integer|) (|NonNegativeInteger|)) NIL))
               |NonAssociativeRing|)
       (SETELT #1# 0 '(|NonAssociativeRing|)))))) 

(MAKEPROP '|NonAssociativeRing| 'NILADIC T) 
