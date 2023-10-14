
(DECLAIM (NOTINLINE |FortranMachineTypeCategory;|)) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (LET (#:G107)
    (COND (|FortranMachineTypeCategory;AL|)
          (T
           (SETQ |FortranMachineTypeCategory;AL|
                   (|FortranMachineTypeCategory;|)))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (SPROG ((#1=#:G105 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G104) (LIST '(|Integer|)))
                              (|Join| (|IntegralDomain|) (|OrderedSet|)
                                      (|RetractableTo| '#2#)))
                   |FortranMachineTypeCategory|)
           (SETELT #1# 0 '(|FortranMachineTypeCategory|))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
