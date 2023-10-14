
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |canonicalUnitNormal;|)) 

(DEFPARAMETER |canonicalUnitNormal;AL| 'NIL) 

(DEFUN |canonicalUnitNormal| ()
  (LET (#:G105)
    (COND (|canonicalUnitNormal;AL|)
          (T (SETQ |canonicalUnitNormal;AL| (|canonicalUnitNormal;|)))))) 

(DEFUN |canonicalUnitNormal;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |canonicalUnitNormal|)
       (SETELT #1# 0 '(|canonicalUnitNormal|)))))) 

(MAKEPROP '|canonicalUnitNormal| 'NILADIC T) 
