
(/VERSIONCHECK 2) 

(DEFPARAMETER |canonicalUnitNormal;AL| 'NIL) 

(DEFUN |canonicalUnitNormal| ()
  (LET (#:G129)
    (COND (|canonicalUnitNormal;AL|)
          (T (SETQ |canonicalUnitNormal;AL| (|canonicalUnitNormal;|)))))) 

(DEFUN |canonicalUnitNormal;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |canonicalUnitNormal|)
       (SETELT #1# 0 '(|canonicalUnitNormal|)))))) 

(MAKEPROP '|canonicalUnitNormal| 'NILADIC T) 
