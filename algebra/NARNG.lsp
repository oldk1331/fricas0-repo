
(/VERSIONCHECK 2) 

(DEFPARAMETER |NonAssociativeRng;AL| 'NIL) 

(DEFUN |NonAssociativeRng| ()
  (LET (#:G129)
    (COND (|NonAssociativeRng;AL|)
          (T (SETQ |NonAssociativeRng;AL| (|NonAssociativeRng;|)))))) 

(DEFUN |NonAssociativeRng;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|AbelianGroup|) (|Monad|)
                       (|mkCategory|
                        '(((|associator| ($ $ $ $)) T)
                          ((|commutator| ($ $ $)) T)
                          ((|antiCommutator| ($ $ $)) T))
                        NIL 'NIL NIL))
               |NonAssociativeRng|)
       (SETELT #1# 0 '(|NonAssociativeRng|)))))) 

(MAKEPROP '|NonAssociativeRng| 'NILADIC T) 
