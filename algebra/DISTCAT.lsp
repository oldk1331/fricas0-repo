
(DEFPARAMETER |DistributionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DistributionCategory;|)) 

(DEFPARAMETER |DistributionCategory;AL| 'NIL) 

(DEFUN |DistributionCategory| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |DistributionCategory;AL|)) (CDR #1#))
          (T
           (SETQ |DistributionCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|DistributionCategory;| #2#)))
                            |DistributionCategory;AL|))
           #1#)))) 

(DEFUN |DistributionCategory;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|DistributionCategory;CAT|)
                                    ('T
                                     (LETT |DistributionCategory;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|mkCategory|
                                                    '(((|Zero| ($) |constant|)
                                                       T)
                                                      ((|moment|
                                                        (|t#1| $
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((|classicalCumulant|
                                                        (|t#1| $
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|freeCumulant|
                                                        (|t#1| $
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|booleanCumulant|
                                                        (|t#1| $
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|moments|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|classicalCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|freeCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|booleanCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|hankelDeterminants|
                                                        ((|Stream| |t#1|) $))
                                                       T)
                                                      ((|monotoneCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       (|has| |t#1|
                                                              (|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                                      ((|jacobiParameters|
                                                        ((|Record|
                                                          (|:| |an|
                                                               (|Stream|
                                                                |t#1|))
                                                          (|:| |bn|
                                                               (|Stream|
                                                                |t#1|)))
                                                         $))
                                                       (|has| |t#1| (|Field|)))
                                                      ((|orthogonalPolynomials|
                                                        ((|Stream|
                                                          (|SparseUnivariatePolynomial|
                                                           |t#1|))
                                                         $))
                                                       (|has| |t#1| (|Field|)))
                                                      ((|jacobiParameters|
                                                        ((|Record|
                                                          (|:| |an|
                                                               (|Stream|
                                                                (|Fraction|
                                                                 |t#1|)))
                                                          (|:| |bn|
                                                               (|Stream|
                                                                (|Fraction|
                                                                 |t#1|))))
                                                         $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|IntegralDomain|))
                                                        (|not|
                                                         (|has| |t#1|
                                                                (|Field|)))))
                                                      ((|orthogonalPolynomials|
                                                        ((|Stream|
                                                          (|SparseUnivariatePolynomial|
                                                           (|Fraction| |t#1|)))
                                                         $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|IntegralDomain|))
                                                        (|not|
                                                         (|has| |t#1|
                                                                (|Field|)))))
                                                      ((|classicalConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((|freeConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((|booleanConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((|monotoneConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((^
                                                        ($ $
                                                         (|PositiveInteger|)))
                                                       T))
                                                    NIL NIL NIL))
                                           . #2=(|DistributionCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|DistributionCategory| |t#1|))))) 
