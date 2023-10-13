
(/VERSIONCHECK 2) 

(DEFPARAMETER |DivisionRing;AL| 'NIL) 

(DEFUN |DivisionRing| ()
  (LET (#:G130)
    (COND (|DivisionRing;AL|) (T (SETQ |DivisionRing;AL| (|DivisionRing;|)))))) 

(DEFUN |DivisionRing;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G127) (LIST '(|Fraction| (|Integer|))))
                          (|Join| (|EntireRing|) (|Algebra| '#2#)
                                  (|mkCategory|
                                   '(((^ ($ $ (|Integer|))) T)
                                     ((|inv| ($ $)) T))
                                   NIL '((|Integer|)) NIL)))
               |DivisionRing|)
       (SETELT #1# 0 '(|DivisionRing|)))))) 

(MAKEPROP '|DivisionRing| 'NILADIC T) 
