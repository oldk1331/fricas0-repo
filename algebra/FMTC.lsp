
(/VERSIONCHECK 2) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (LET (#:G130)
    (COND (|FortranMachineTypeCategory;AL|)
          (T
           (SETQ |FortranMachineTypeCategory;AL|
                   (|FortranMachineTypeCategory;|)))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G127) (LIST '(|Integer|)))
                          (|Join| (|IntegralDomain|) (|OrderedSet|)
                                  (|RetractableTo| '#2#)))
               |FortranMachineTypeCategory|)
       (SETELT #1# 0 '(|FortranMachineTypeCategory|)))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
