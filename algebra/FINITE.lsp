
(/VERSIONCHECK 2) 

(DEFPARAMETER |Finite;AL| 'NIL) 

(DEFUN |Finite| ()
  (LET (#:G130)
    (COND (|Finite;AL|) (T (SETQ |Finite;AL| (|Finite;|)))))) 

(DEFUN |Finite;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G127) (LIST '(|InputForm|)))
                          (|Join| (|SetCategory|) (|ConvertibleTo| '#2#)
                                  (|mkCategory|
                                   '(((|size| ((|NonNegativeInteger|))) T)
                                     ((|index| ($ (|PositiveInteger|))) T)
                                     ((|lookup| ((|PositiveInteger|) $)) T)
                                     ((|random| ($)) T)
                                     ((|enumerate| ((|List| $))) T))
                                   NIL
                                   '((|List| $) (|PositiveInteger|)
                                     (|NonNegativeInteger|))
                                   NIL)))
               |Finite|)
       (SETELT #1# 0 '(|Finite|)))))) 

(MAKEPROP '|Finite| 'NILADIC T) 
