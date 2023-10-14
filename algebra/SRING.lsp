
(/VERSIONCHECK 2) 

(DEFPARAMETER |SemiRing;AL| 'NIL) 

(DEFUN |SemiRing| ()
  (LET (#:G129)
    (COND (|SemiRing;AL|) (T (SETQ |SemiRing;AL| (|SemiRing;|)))))) 

(DEFUN |SemiRing;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|SemiRng|) (|AbelianMonoid|) (|Monoid|))
               |SemiRing|)
       (SETELT #1# 0 '(|SemiRing|)))))) 

(MAKEPROP '|SemiRing| 'NILADIC T) 
