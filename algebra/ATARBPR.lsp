
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |arbitraryPrecision;|)) 

(DEFPARAMETER |arbitraryPrecision;AL| 'NIL) 

(DEFUN |arbitraryPrecision| ()
  (LET (#:G129)
    (COND (|arbitraryPrecision;AL|)
          (T (SETQ |arbitraryPrecision;AL| (|arbitraryPrecision;|)))))) 

(DEFUN |arbitraryPrecision;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |arbitraryPrecision|)
       (SETELT #1# 0 '(|arbitraryPrecision|)))))) 

(MAKEPROP '|arbitraryPrecision| 'NILADIC T) 
