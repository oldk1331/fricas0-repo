
(/VERSIONCHECK 2) 

(DEFPARAMETER |OrderedMonoid;AL| 'NIL) 

(DEFUN |OrderedMonoid| ()
  (LET (#:G127)
    (COND (|OrderedMonoid;AL|)
          (T (SETQ |OrderedMonoid;AL| (|OrderedMonoid;|)))))) 

(DEFUN |OrderedMonoid;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|OrderedSemiGroup|) (|Monoid|)) |OrderedMonoid|)
       (SETELT #1# 0 '(|OrderedMonoid|)))))) 

(MAKEPROP '|OrderedMonoid| 'NILADIC T) 
