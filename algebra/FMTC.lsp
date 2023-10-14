
(DECLAIM (NOTINLINE |FortranMachineTypeCategory;|)) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (LET (#:G106)
    (COND (|FortranMachineTypeCategory;AL|)
          (T
           (SETQ |FortranMachineTypeCategory;AL|
                   (|FortranMachineTypeCategory;|)))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (PROG (#1=#:G104)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G103) (LIST '(|Integer|)))
                          (|Join| (|IntegralDomain|) (|OrderedSet|)
                                  (|RetractableTo| '#2#)))
               |FortranMachineTypeCategory|)
       (SETELT #1# 0 '(|FortranMachineTypeCategory|)))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
