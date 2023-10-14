
(DECLAIM (NOTINLINE |FortranMatrixFunctionCategory;|)) 

(DEFPARAMETER |FortranMatrixFunctionCategory;AL| 'NIL) 

(DEFUN |FortranMatrixFunctionCategory| ()
  (LET (#:G105)
    (COND (|FortranMatrixFunctionCategory;AL|)
          (T
           (SETQ |FortranMatrixFunctionCategory;AL|
                   (|FortranMatrixFunctionCategory;|)))))) 

(DEFUN |FortranMatrixFunctionCategory;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|FortranProgramCategory|)
                           (|mkCategory|
                            '(((|coerce| ($ (|List| (|FortranCode|)))) T)
                              ((|coerce| ($ (|FortranCode|))) T)
                              ((|coerce|
                                ($
                                 (|Record| (|:| |localSymbols| (|SymbolTable|))
                                           (|:| |code|
                                                (|List| (|FortranCode|))))))
                               T)
                              ((|retract|
                                ($ (|Matrix| (|Expression| (|Float|)))))
                               T)
                              ((|retractIfCan|
                                ((|Union| $ "failed")
                                 (|Matrix| (|Expression| (|Float|)))))
                               T)
                              ((|retract|
                                ($ (|Matrix| (|Expression| (|Integer|)))))
                               T)
                              ((|retractIfCan|
                                ((|Union| $ "failed")
                                 (|Matrix| (|Expression| (|Integer|)))))
                               T)
                              ((|retract|
                                ($ (|Matrix| (|Polynomial| (|Float|)))))
                               T)
                              ((|retractIfCan|
                                ((|Union| $ "failed")
                                 (|Matrix| (|Polynomial| (|Float|)))))
                               T)
                              ((|retract|
                                ($ (|Matrix| (|Polynomial| (|Integer|)))))
                               T)
                              ((|retractIfCan|
                                ((|Union| $ "failed")
                                 (|Matrix| (|Polynomial| (|Integer|)))))
                               T)
                              ((|retract|
                                ($
                                 (|Matrix|
                                  (|Fraction| (|Polynomial| (|Float|))))))
                               T)
                              ((|retractIfCan|
                                ((|Union| $ "failed")
                                 (|Matrix|
                                  (|Fraction| (|Polynomial| (|Float|))))))
                               T)
                              ((|retract|
                                ($
                                 (|Matrix|
                                  (|Fraction| (|Polynomial| (|Integer|))))))
                               T)
                              ((|retractIfCan|
                                ((|Union| $ "failed")
                                 (|Matrix|
                                  (|Fraction| (|Polynomial| (|Integer|))))))
                               T))
                            NIL
                            '((|Matrix|
                               (|Fraction| (|Polynomial| (|Integer|))))
                              (|Matrix| (|Fraction| (|Polynomial| (|Float|))))
                              (|Matrix| (|Polynomial| (|Integer|)))
                              (|Matrix| (|Polynomial| (|Float|)))
                              (|Matrix| (|Expression| (|Integer|)))
                              (|Matrix| (|Expression| (|Float|)))
                              (|FortranCode|) (|List| (|FortranCode|)))
                            NIL))
                   |FortranMatrixFunctionCategory|)
           (SETELT #1# 0 '(|FortranMatrixFunctionCategory|))))) 

(MAKEPROP '|FortranMatrixFunctionCategory| 'NILADIC T) 
