
(/VERSIONCHECK 2) 

(DEFPARAMETER |canonicalUnitNormal;AL| 'NIL) 

(DEFUN |canonicalUnitNormal| ()
  (LET (#:G127)
    (COND (|canonicalUnitNormal;AL|)
          (T (SETQ |canonicalUnitNormal;AL| (|canonicalUnitNormal;|)))))) 

(DEFUN |canonicalUnitNormal;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |canonicalUnitNormal|)
       (SETELT #1# 0 '(|canonicalUnitNormal|)))))) 

(MAKEPROP '|canonicalUnitNormal| 'NILADIC T) 
