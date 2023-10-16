
(DECLAIM (NOTINLINE |canonicalUnitNormal;|)) 

(DEFPARAMETER |canonicalUnitNormal;AL| 'NIL) 

(DEFUN |canonicalUnitNormal| ()
  (COND (|canonicalUnitNormal;AL|)
        (T (SETQ |canonicalUnitNormal;AL| (|canonicalUnitNormal;|))))) 

(DEFUN |canonicalUnitNormal;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |canonicalUnitNormal|)
           (SETELT #1# 0 '(|canonicalUnitNormal|))))) 

(MAKEPROP '|canonicalUnitNormal| 'NILADIC T) 
