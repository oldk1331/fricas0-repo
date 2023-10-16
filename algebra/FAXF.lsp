
(DEFPARAMETER |FiniteAlgebraicExtensionField;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteAlgebraicExtensionField;|)) 

(DEFPARAMETER |FiniteAlgebraicExtensionField;AL| 'NIL) 

(DEFUN |FiniteAlgebraicExtensionField| (|t#1|)
  (LET (#1=#:G112 (#2=#:G113 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |FiniteAlgebraicExtensionField;AL|)) (CDR #1#))
     (T
      (SETQ |FiniteAlgebraicExtensionField;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|FiniteAlgebraicExtensionField;| #2#)))
               |FiniteAlgebraicExtensionField;AL|))
      #1#)))) 

(DEFUN |FiniteAlgebraicExtensionField;| (|t#1|)
  (SPROG ((#1=#:G111 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|FiniteAlgebraicExtensionField;CAT|)
                                    ('T
                                     (LETT |FiniteAlgebraicExtensionField;CAT|
                                           (|Join| (|ExtensionField| '|t#1|)
                                                   (|RetractableTo| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|basis| ((|Vector| $)))
                                                       T)
                                                      ((|basis|
                                                        ((|Vector| $)
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|coordinates|
                                                        ((|Vector| |t#1|) $))
                                                       T)
                                                      ((|coordinates|
                                                        ((|Matrix| |t#1|)
                                                         (|Vector| $)))
                                                       T)
                                                      ((|represents|
                                                        ($ (|Vector| |t#1|)))
                                                       T)
                                                      ((|minimalPolynomial|
                                                        ((|SparseUnivariatePolynomial|
                                                          |t#1|)
                                                         $))
                                                       T)
                                                      ((|definingPolynomial|
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
                                                      ((|norm| (|t#1| $)) T)
                                                      ((|trace| (|t#1| $)) T)
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
                                                    '((|SparseUnivariatePolynomial|
                                                       |t#1|)
                                                      (|Boolean|)
                                                      (|PositiveInteger|)
                                                      (|SparseUnivariatePolynomial|
                                                       $)
                                                      (|Vector| |t#1|)
                                                      (|Matrix| |t#1|)
                                                      (|Vector| $))
                                                    NIL))
                                           . #2=(|FiniteAlgebraicExtensionField|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FiniteAlgebraicExtensionField|
                         (|devaluate| |t#1|)))))) 
