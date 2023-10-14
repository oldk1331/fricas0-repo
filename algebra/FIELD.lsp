
(DECLAIM (NOTINLINE |Field;|)) 

(DEFPARAMETER |Field;AL| 'NIL) 

(DEFUN |Field| ()
  (LET (#:G110)
    (COND (|Field;AL|) (T (SETQ |Field;AL| (|Field;|)))))) 

(DEFUN |Field;| ()
  (PROG (#1=#:G108)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                       (|DivisionRing|) (|canonicalUnitNormal|)
                       (|canonicalsClosed|)
                       (|mkCategory| '(((/ ($ $ $)) T)) NIL 'NIL NIL))
               |Field|)
       (SETELT #1# 0 '(|Field|)))))) 

(MAKEPROP '|Field| 'NILADIC T) 
