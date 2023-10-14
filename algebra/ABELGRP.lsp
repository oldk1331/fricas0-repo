
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |AbelianGroup;|)) 

(DEFPARAMETER |AbelianGroup;AL| 'NIL) 

(DEFUN |AbelianGroup| ()
  (LET (#:G106)
    (COND (|AbelianGroup;AL|) (T (SETQ |AbelianGroup;AL| (|AbelianGroup;|)))))) 

(DEFUN |AbelianGroup;| ()
  (PROG (#1=#:G104)
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
