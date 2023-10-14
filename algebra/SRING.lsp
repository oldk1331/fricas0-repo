
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |SemiRing;|)) 

(DEFPARAMETER |SemiRing;AL| 'NIL) 

(DEFUN |SemiRing| ()
  (LET (#:G105)
    (COND (|SemiRing;AL|) (T (SETQ |SemiRing;AL| (|SemiRing;|)))))) 

(DEFUN |SemiRing;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|SemiRng|) (|AbelianMonoid|) (|Monoid|))
               |SemiRing|)
       (SETELT #1# 0 '(|SemiRing|)))))) 

(MAKEPROP '|SemiRing| 'NILADIC T) 
