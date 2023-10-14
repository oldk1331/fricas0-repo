
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |FloatingPointSystem;|)) 

(DEFPARAMETER |FloatingPointSystem;AL| 'NIL) 

(DEFUN |FloatingPointSystem| ()
  (LET (#:G105)
    (COND (|FloatingPointSystem;AL|)
          (T (SETQ |FloatingPointSystem;AL| (|FloatingPointSystem;|)))))) 

(DEFUN |FloatingPointSystem;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|RealNumberSystem|) (|Approximate|)
                       (|mkCategory|
                        '(((|float| ($ (|Integer|) (|Integer|))) T)
                          ((|float|
                            ($ (|Integer|) (|Integer|) (|PositiveInteger|)))
                           T)
                          ((|order| ((|Integer|) $)) T)
                          ((|base| ((|PositiveInteger|))) T)
                          ((|exponent| ((|Integer|) $)) T)
                          ((|mantissa| ((|Integer|) $)) T)
                          ((|toString| ((|String|) $ (|NonNegativeInteger|)))
                           T)
                          ((|bits| ((|PositiveInteger|))) T)
                          ((|digits| ((|PositiveInteger|))) T)
                          ((|precision| ((|PositiveInteger|))) T)
                          ((|bits| ((|PositiveInteger|) (|PositiveInteger|)))
                           (|has| $ (|arbitraryPrecision|)))
                          ((|digits| ((|PositiveInteger|) (|PositiveInteger|)))
                           (|has| $ (|arbitraryPrecision|)))
                          ((|precision|
                            ((|PositiveInteger|) (|PositiveInteger|)))
                           (|has| $ (|arbitraryPrecision|)))
                          ((|increasePrecision|
                            ((|PositiveInteger|) (|Integer|)))
                           (|has| $ (|arbitraryPrecision|)))
                          ((|decreasePrecision|
                            ((|PositiveInteger|) (|Integer|)))
                           (|has| $ (|arbitraryPrecision|)))
                          ((|min| ($))
                           (AND (|not| (|has| $ (|arbitraryPrecision|)))
                                (|not| (|has| $ (|arbitraryExponent|)))))
                          ((|max| ($))
                           (AND (|not| (|has| $ (|arbitraryPrecision|)))
                                (|not| (|has| $ (|arbitraryExponent|))))))
                        NIL
                        '((|PositiveInteger|) (|Integer|) (|String|)
                          (|NonNegativeInteger|))
                        NIL))
               |FloatingPointSystem|)
       (SETELT #1# 0 '(|FloatingPointSystem|)))))) 

(MAKEPROP '|FloatingPointSystem| 'NILADIC T) 
