
(/VERSIONCHECK 2) 

(DEFPARAMETER |FortranVectorFunctionCategory;AL| 'NIL) 

(DEFUN |FortranVectorFunctionCategory| ()
  (LET (#:G127)
    (COND (|FortranVectorFunctionCategory;AL|)
          (T
           (SETQ |FortranVectorFunctionCategory;AL|
                   (|FortranVectorFunctionCategory;|)))))) 

(DEFUN |FortranVectorFunctionCategory;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|FortranProgramCategory|)
                       (|mkCategory|
                        '(((|coerce| ($ (|List| (|FortranCode|)))) T)
                          ((|coerce| ($ (|FortranCode|))) T)
                          ((|coerce|
                            ($
                             (|Record| (|:| |localSymbols| (|SymbolTable|))
                                       (|:| |code| (|List| (|FortranCode|))))))
                           T)
                          ((|retract| ($ (|Vector| (|Expression| (|Float|)))))
                           T)
                          ((|retractIfCan|
                            ((|Union| $ "failed")
                             (|Vector| (|Expression| (|Float|)))))
                           T)
                          ((|retract|
                            ($ (|Vector| (|Expression| (|Integer|)))))
                           T)
                          ((|retractIfCan|
                            ((|Union| $ "failed")
                             (|Vector| (|Expression| (|Integer|)))))
                           T)
                          ((|retract| ($ (|Vector| (|Polynomial| (|Float|)))))
                           T)
                          ((|retractIfCan|
                            ((|Union| $ "failed")
                             (|Vector| (|Polynomial| (|Float|)))))
                           T)
                          ((|retract|
                            ($ (|Vector| (|Polynomial| (|Integer|)))))
                           T)
                          ((|retractIfCan|
                            ((|Union| $ "failed")
                             (|Vector| (|Polynomial| (|Integer|)))))
                           T)
                          ((|retract|
                            ($
                             (|Vector| (|Fraction| (|Polynomial| (|Float|))))))
                           T)
                          ((|retractIfCan|
                            ((|Union| $ "failed")
                             (|Vector| (|Fraction| (|Polynomial| (|Float|))))))
                           T)
                          ((|retract|
                            ($
                             (|Vector|
                              (|Fraction| (|Polynomial| (|Integer|))))))
                           T)
                          ((|retractIfCan|
                            ((|Union| $ "failed")
                             (|Vector|
                              (|Fraction| (|Polynomial| (|Integer|))))))
                           T))
                        NIL
                        '((|Vector| (|Fraction| (|Polynomial| (|Integer|))))
                          (|Vector| (|Fraction| (|Polynomial| (|Float|))))
                          (|Vector| (|Polynomial| (|Integer|)))
                          (|Vector| (|Polynomial| (|Float|)))
                          (|Vector| (|Expression| (|Integer|)))
                          (|Vector| (|Expression| (|Float|))) (|FortranCode|)
                          (|List| (|FortranCode|)))
                        NIL))
               |FortranVectorFunctionCategory|)
       (SETELT #1# 0 '(|FortranVectorFunctionCategory|)))))) 

(MAKEPROP '|FortranVectorFunctionCategory| 'NILADIC T) 
