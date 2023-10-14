
(/VERSIONCHECK 2) 

(DEFPARAMETER |MaybeSkewPolynomialCategory;CAT| 'NIL) 

(DEFPARAMETER |MaybeSkewPolynomialCategory;AL| 'NIL) 

(DEFUN |MaybeSkewPolynomialCategory| (&REST #1=#:G131)
  (LET (#2=#:G132)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |MaybeSkewPolynomialCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |MaybeSkewPolynomialCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|MaybeSkewPolynomialCategory;| #1#)))
               |MaybeSkewPolynomialCategory;AL|))
      #2#)))) 

(DEFUN |MaybeSkewPolynomialCategory;| (|t#1| |t#2| |t#3|)
  (PROG (#1=#:G130)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2| |t#3|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                            (|devaluate| |t#3|)))
                (COND (|MaybeSkewPolynomialCategory;CAT|)
                      ('T
                       (LETT |MaybeSkewPolynomialCategory;CAT|
                             (|Join| (|FiniteAbelianMonoidRing| '|t#1| '|t#2|)
                                     (|FullyLinearlyExplicitRingOver| '|t#1|)
                                     (|mkCategory|
                                      '(((|degree|
                                          ((|NonNegativeInteger|) $ |t#3|))
                                         T)
                                        ((|degree|
                                          ((|List| (|NonNegativeInteger|)) $
                                           (|List| |t#3|)))
                                         T)
                                        ((|coefficient|
                                          ($ $ |t#3| (|NonNegativeInteger|)))
                                         T)
                                        ((|coefficient|
                                          ($ $ (|List| |t#3|)
                                           (|List| (|NonNegativeInteger|))))
                                         T)
                                        ((|monomials| ((|List| $) $)) T)
                                        ((|mainVariable|
                                          ((|Union| |t#3| "failed") $))
                                         T)
                                        ((|monomial|
                                          ($ $ |t#3| (|NonNegativeInteger|)))
                                         T)
                                        ((|monomial|
                                          ($ $ (|List| |t#3|)
                                           (|List| (|NonNegativeInteger|))))
                                         T)
                                        ((|totalDegree|
                                          ((|NonNegativeInteger|) $))
                                         T)
                                        ((|totalDegree|
                                          ((|NonNegativeInteger|) $
                                           (|List| |t#3|)))
                                         T)
                                        ((|totalDegreeSorted|
                                          ((|NonNegativeInteger|) $
                                           (|List| |t#3|)))
                                         T)
                                        ((|variables| ((|List| |t#3|) $)) T)
                                        ((|primitiveMonomials| ((|List| $) $))
                                         T))
                                      '(((|Comparable|)
                                         (|has| |t#1| (|Comparable|)))
                                        ((|canonicalUnitNormal|)
                                         (|has| |t#1|
                                                (|canonicalUnitNormal|))))
                                      '((|List| $) (|List| |t#3|)
                                        (|NonNegativeInteger|)
                                        (|List| (|NonNegativeInteger|)))
                                      NIL))
                             . #2=(|MaybeSkewPolynomialCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|MaybeSkewPolynomialCategory| (|devaluate| |t#1|)
                     (|devaluate| |t#2|) (|devaluate| |t#3|))))))) 
