
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |arbitraryExponent;|)) 

(DEFPARAMETER |arbitraryExponent;AL| 'NIL) 

(DEFUN |arbitraryExponent| ()
  (LET (#:G105)
    (COND (|arbitraryExponent;AL|)
          (T (SETQ |arbitraryExponent;AL| (|arbitraryExponent;|)))))) 

(DEFUN |arbitraryExponent;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |arbitraryExponent|)
       (SETELT #1# 0 '(|arbitraryExponent|)))))) 

(MAKEPROP '|arbitraryExponent| 'NILADIC T) 
