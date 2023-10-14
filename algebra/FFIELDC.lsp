
(DECLAIM (NOTINLINE |FiniteFieldCategory;|)) 

(DEFPARAMETER |FiniteFieldCategory;AL| 'NIL) 

(DEFUN |FiniteFieldCategory| ()
  (LET (#:G112)
    (COND (|FiniteFieldCategory;AL|)
          (T (SETQ |FiniteFieldCategory;AL| (|FiniteFieldCategory;|)))))) 

(DEFUN |FiniteFieldCategory;| ()
  (PROG (#1=#:G110)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|FieldOfPrimeCharacteristic|) (|Finite|)
                       (|StepThrough|) (|DifferentialRing|)
                       (|mkCategory|
                        '(((|charthRoot| ($ $)) T)
                          ((|conditionP|
                            ((|Union| (|Vector| $) "failed") (|Matrix| $)))
                           T)
                          ((|factorsOfCyclicGroupSize|
                            ((|List|
                              (|Record| (|:| |factor| (|Integer|))
                                        (|:| |exponent| (|Integer|))))))
                           T)
                          ((|tableForDiscreteLogarithm|
                            ((|Table| (|PositiveInteger|)
                                      (|NonNegativeInteger|))
                             (|Integer|)))
                           T)
                          ((|createPrimitiveElement| ($)) T)
                          ((|primitiveElement| ($)) T)
                          ((|primitive?| ((|Boolean|) $)) T)
                          ((|discreteLog| ((|NonNegativeInteger|) $)) T)
                          ((|order| ((|PositiveInteger|) $)) T)
                          ((|representationType|
                            ((|Union| "prime" "polynomial" "normal" "cyclic")))
                           T))
                        NIL
                        '((|PositiveInteger|) (|NonNegativeInteger|)
                          (|Boolean|)
                          (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                          (|Integer|)
                          (|List|
                           (|Record| (|:| |factor| (|Integer|))
                                     (|:| |exponent| (|Integer|))))
                          (|Matrix| $))
                        NIL))
               |FiniteFieldCategory|)
       (SETELT #1# 0 '(|FiniteFieldCategory|)))))) 

(MAKEPROP '|FiniteFieldCategory| 'NILADIC T) 
