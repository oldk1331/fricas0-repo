
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |FortranProgramCategory;|)) 

(DEFPARAMETER |FortranProgramCategory;AL| 'NIL) 

(DEFUN |FortranProgramCategory| ()
  (LET (#:G106)
    (COND (|FortranProgramCategory;AL|)
          (T (SETQ |FortranProgramCategory;AL| (|FortranProgramCategory;|)))))) 

(DEFUN |FortranProgramCategory;| ()
  (PROG (#1=#:G104)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G103) (LIST '(|OutputForm|)))
                          (|Join| (|Type|) (|CoercibleTo| '#2#)
                                  (|mkCategory|
                                   '(((|outputAsFortran| ((|Void|) $)) T)) NIL
                                   '((|Void|)) NIL)))
               |FortranProgramCategory|)
       (SETELT #1# 0 '(|FortranProgramCategory|)))))) 

(MAKEPROP '|FortranProgramCategory| 'NILADIC T) 
