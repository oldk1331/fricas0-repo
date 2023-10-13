
(/VERSIONCHECK 2) 

(DEFPARAMETER |AbelianGroup;AL| 'NIL) 

(DEFUN |AbelianGroup| ()
  (LET (#:G128)
    (COND (|AbelianGroup;AL|) (T (SETQ |AbelianGroup;AL| (|AbelianGroup;|)))))) 

(DEFUN |AbelianGroup;| ()
  (PROG (#1=#:G126)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|CancellationAbelianMonoid|)
                       (|mkCategory|
                        '(((- ($ $)) T) ((- ($ $ $)) T)
                          ((* ($ (|Integer|) $)) T))
                        NIL '((|Integer|)) NIL))
               |AbelianGroup|)
       (SETELT #1# 0 '(|AbelianGroup|)))))) 

(MAKEPROP '|AbelianGroup| 'NILADIC T) 
