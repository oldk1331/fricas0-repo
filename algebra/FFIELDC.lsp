
(DECLAIM (NOTINLINE |FiniteFieldCategory;|)) 

(DEFPARAMETER |FiniteFieldCategory;AL| 'NIL) 

(DEFUN |FiniteFieldCategory| ()
  (COND (|FiniteFieldCategory;AL|)
        (T (SETQ |FiniteFieldCategory;AL| (|FiniteFieldCategory;|))))) 

(DEFUN |FiniteFieldCategory;| ()
  (SPROG ((#1=#:G111 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|FieldOfPrimeCharacteristic|) (|Finite|)
                           (|StepThrough|) (|DifferentialRing|)
                           (|PolynomialFactorizationExplicit|)
                           (|mkCategory|
                            '(((|charthRoot| ($ $)) T)
                              ((|factorsOfCyclicGroupSize|
                                ((|List|
                                  (|Record| (|:| |factor| (|Integer|))
                                            (|:| |exponent|
                                                 (|NonNegativeInteger|))))))
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
                                ((|Union| "prime" "polynomial" "normal"
                                          "cyclic")))
                               T))
                            NIL
                            '((|PositiveInteger|) (|NonNegativeInteger|)
                              (|Boolean|)
                              (|Table| (|PositiveInteger|)
                                       (|NonNegativeInteger|))
                              (|Integer|)
                              (|List|
                               (|Record| (|:| |factor| (|Integer|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|)))))
                            NIL))
                   |FiniteFieldCategory|)
           (SETELT #1# 0 '(|FiniteFieldCategory|))))) 

(MAKEPROP '|FiniteFieldCategory| 'NILADIC T) 
