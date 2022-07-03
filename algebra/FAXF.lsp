
(DEFPARAMETER |FiniteAlgebraicExtensionField;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteAlgebraicExtensionField;|)) 

(DEFPARAMETER |FiniteAlgebraicExtensionField;AL| 'NIL) 

(DEFUN |FiniteAlgebraicExtensionField| (|t#1|)
  (LET (#1=#:G128 (#2=#:G129 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |FiniteAlgebraicExtensionField;AL|)) (CDR #1#))
     (T
      (SETQ |FiniteAlgebraicExtensionField;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|FiniteAlgebraicExtensionField;| #2#)))
               |FiniteAlgebraicExtensionField;AL|))
      #1#)))) 

(DEFUN |FiniteAlgebraicExtensionField;| (|t#1|)
  (SPROG ((#1=#:G127 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G126)
                                           (LIST
                                            '(|SparseUnivariatePolynomial|
                                              |t#1|)))
                               (COND (|FiniteAlgebraicExtensionField;CAT|)
                                     ('T
                                      (LETT |FiniteAlgebraicExtensionField;CAT|
                                            (|Join| (|ExtensionField| '|t#1|)
                                                    (|FramedAlgebra| '|t#1|
                                                                     '#2#)
                                                    (|RetractableTo| '|t#1|)
                                                    (|mkCategory|
                                                     '(((|definingPolynomial|
                                                         ((|SparseUnivariatePolynomial|
                                                           |t#1|)))
                                                        T)
                                                       ((|extensionDegree|
                                                         ((|PositiveInteger|)))
                                                        T)
                                                       ((|degree|
                                                         ((|PositiveInteger|)
                                                          $))
                                                        T)
                                                       ((|basis|
                                                         ((|Vector| $)
                                                          (|PositiveInteger|)))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|minimalPolynomial|
                                                         ((|SparseUnivariatePolynomial|
                                                           $)
                                                          $
                                                          (|PositiveInteger|)))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|norm|
                                                         ($ $
                                                          (|PositiveInteger|)))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|trace|
                                                         ($ $
                                                          (|PositiveInteger|)))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|createNormalElement|
                                                         ($))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|normalElement| ($))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|normal?|
                                                         ((|Boolean|) $))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|generator| ($))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|linearAssociatedExp|
                                                         ($ $
                                                          (|SparseUnivariatePolynomial|
                                                           |t#1|)))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|linearAssociatedOrder|
                                                         ((|SparseUnivariatePolynomial|
                                                           |t#1|)
                                                          $))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|linearAssociatedLog|
                                                         ((|SparseUnivariatePolynomial|
                                                           |t#1|)
                                                          $))
                                                        (|has| |t#1|
                                                               (|Finite|)))
                                                       ((|linearAssociatedLog|
                                                         ((|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            |t#1|)
                                                           "failed")
                                                          $ $))
                                                        (|has| |t#1|
                                                               (|Finite|))))
                                                     '(((|FiniteFieldCategory|)
                                                        (|has| |t#1|
                                                               (|Finite|))))
                                                     NIL NIL))))))))
           (SETELT #1# 0 (LIST '|FiniteAlgebraicExtensionField| |t#1|))))) 
