
(/VERSIONCHECK 2) 

(DEFPARAMETER |Group;AL| 'NIL) 

(DEFUN |Group| ()
  (LET (#:G128)
    (COND (|Group;AL|) (T (SETQ |Group;AL| (|Group;|)))))) 

(DEFUN |Group;| ()
  (PROG (#1=#:G126)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Monoid|) (|unitsKnown|)
                       (|mkCategory|
                        '(((|inv| ($ $)) T) ((/ ($ $ $)) T)
                          ((^ ($ $ (|Integer|))) T) ((|conjugate| ($ $ $)) T)
                          ((|commutator| ($ $ $)) T))
                        NIL '((|Integer|)) NIL))
               |Group|)
       (SETELT #1# 0 '(|Group|)))))) 

(MAKEPROP '|Group| 'NILADIC T) 
