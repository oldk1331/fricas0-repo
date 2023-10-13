
(/VERSIONCHECK 2) 

(DEFPARAMETER |FortranVectorCategory;AL| 'NIL) 

(DEFUN |FortranVectorCategory| ()
  (LET (#:G127)
    (COND (|FortranVectorCategory;AL|)
          (T (SETQ |FortranVectorCategory;AL| (|FortranVectorCategory;|)))))) 

(DEFUN |FortranVectorCategory;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|FortranProgramCategory|)
                       (|mkCategory|
                        '(((|coerce| ($ (|Vector| (|MachineFloat|)))) T)
                          ((|coerce| ($ (|List| (|FortranCode|)))) T)
                          ((|coerce| ($ (|FortranCode|))) T)
                          ((|coerce|
                            ($
                             (|Record| (|:| |localSymbols| (|SymbolTable|))
                                       (|:| |code| (|List| (|FortranCode|))))))
                           T))
                        NIL
                        '((|FortranCode|) (|List| (|FortranCode|))
                          (|Vector| (|MachineFloat|)))
                        NIL))
               |FortranVectorCategory|)
       (SETELT #1# 0 '(|FortranVectorCategory|)))))) 

(MAKEPROP '|FortranVectorCategory| 'NILADIC T) 
