
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |AbelianSemiGroup;|)) 

(DEFPARAMETER |AbelianSemiGroup;AL| 'NIL) 

(DEFUN |AbelianSemiGroup| ()
  (LET (#:G105)
    (COND (|AbelianSemiGroup;AL|)
          (T (SETQ |AbelianSemiGroup;AL| (|AbelianSemiGroup;|)))))) 

(DEFUN |AbelianSemiGroup;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((+ ($ $ $)) T) ((* ($ (|PositiveInteger|) $)) T))
                        NIL '((|PositiveInteger|)) NIL))
               |AbelianSemiGroup|)
       (SETELT #1# 0 '(|AbelianSemiGroup|)))))) 

(MAKEPROP '|AbelianSemiGroup| 'NILADIC T) 
