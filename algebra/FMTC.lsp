
(/VERSIONCHECK 2) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (LET (#:G128)
    (COND (|FortranMachineTypeCategory;AL|)
          (T
           (SETQ |FortranMachineTypeCategory;AL|
                   (|FortranMachineTypeCategory;|)))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (PROG (#1=#:G126)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G125) (LIST '(|Integer|)))
                          (|Join| (|IntegralDomain|) (|OrderedSet|)
                                  (|RetractableTo| '#2#)))
               |FortranMachineTypeCategory|)
       (SETELT #1# 0 '(|FortranMachineTypeCategory|)))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
