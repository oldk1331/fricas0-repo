
(/VERSIONCHECK 2) 

(DEFPARAMETER |FortranProgramCategory;AL| 'NIL) 

(DEFUN |FortranProgramCategory| ()
  (LET (#:G130)
    (COND (|FortranProgramCategory;AL|)
          (T (SETQ |FortranProgramCategory;AL| (|FortranProgramCategory;|)))))) 

(DEFUN |FortranProgramCategory;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G127) (LIST '(|OutputForm|)))
                          (|Join| (|Type|) (|CoercibleTo| '#2#)
                                  (|mkCategory|
                                   '(((|outputAsFortran| ((|Void|) $)) T)) NIL
                                   '((|Void|)) NIL)))
               |FortranProgramCategory|)
       (SETELT #1# 0 '(|FortranProgramCategory|)))))) 

(MAKEPROP '|FortranProgramCategory| 'NILADIC T) 
