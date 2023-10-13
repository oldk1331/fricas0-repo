
(/VERSIONCHECK 2) 

(DEFPARAMETER |PolynomialCategory;CAT| 'NIL) 

(DEFPARAMETER |PolynomialCategory;AL| 'NIL) 

(DEFUN |PolynomialCategory| (&REST #1=#:G149)
  (LET (#2=#:G150)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |PolynomialCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |PolynomialCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|PolynomialCategory;| #1#)))
               |PolynomialCategory;AL|))
      #2#)))) 

(DEFUN |PolynomialCategory;| (|t#1| |t#2| |t#3|)
  (PROG (#1=#:G148)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2| |t#3|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                            (|devaluate| |t#3|)))
                (COND (|PolynomialCategory;CAT|)
                      ('T
                       (LETT |PolynomialCategory;CAT|
                             (|Join| (|PartialDifferentialRing| '|t#3|)
                                     (|FiniteAbelianMonoidRing| '|t#1| '|t#2|)
                                     (|Evalable| '$)
                                     (|InnerEvalable| '|t#3| '|t#1|)
                                     (|InnerEvalable| '|t#3| '$)
                                     (|RetractableTo| '|t#3|)
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
                                        ((|univariate|
                                          ((|SparseUnivariatePolynomial| $) $
                                           |t#3|))
                                         T)
                                        ((|univariate|
                                          ((|SparseUnivariatePolynomial| |t#1|)
                                           $))
                                         T)
                                        ((|mainVariable|
                                          ((|Union| |t#3| "failed") $))
                                         T)
                                        ((|minimumDegree|
                                          ((|NonNegativeInteger|) $ |t#3|))
                                         T)
                                        ((|minimumDegree|
                                          ((|List| (|NonNegativeInteger|)) $
                                           (|List| |t#3|)))
                                         T)
                                        ((|monicDivide|
                                          ((|Record| (|:| |quotient| $)
                                                     (|:| |remainder| $))
                                           $ $ |t#3|))
                                         T)
                                        ((|monomial|
                                          ($ $ |t#3| (|NonNegativeInteger|)))
                                         T)
                                        ((|monomial|
                                          ($ $ (|List| |t#3|)
                                           (|List| (|NonNegativeInteger|))))
                                         T)
                                        ((|multivariate|
                                          ($
                                           (|SparseUnivariatePolynomial| |t#1|)
                                           |t#3|))
                                         T)
                                        ((|multivariate|
                                          ($ (|SparseUnivariatePolynomial| $)
                                           |t#3|))
                                         T)
                                        ((|isPlus|
                                          ((|Union| (|List| $) "failed") $))
                                         T)
                                        ((|isTimes|
                                          ((|Union| (|List| $) "failed") $))
                                         T)
                                        ((|isExpt|
                                          ((|Union|
                                            (|Record| (|:| |var| |t#3|)
                                                      (|:| |exponent|
                                                           (|NonNegativeInteger|)))
                                            "failed")
                                           $))
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
                                         T)
                                        ((|resultant| ($ $ $ |t#3|))
                                         (|has| |t#1| (|CommutativeRing|)))
                                        ((|discriminant| ($ $ |t#3|))
                                         (|has| |t#1| (|CommutativeRing|)))
                                        ((|content| ($ $ |t#3|))
                                         (|has| |t#1| (|GcdDomain|)))
                                        ((|primitivePart| ($ $))
                                         (|has| |t#1| (|GcdDomain|)))
                                        ((|primitivePart| ($ $ |t#3|))
                                         (|has| |t#1| (|GcdDomain|)))
                                        ((|squareFree| ((|Factored| $) $))
                                         (|has| |t#1| (|GcdDomain|)))
                                        ((|squareFreePart| ($ $))
                                         (|has| |t#1| (|GcdDomain|))))
                                      '(((|Comparable|)
                                         (|has| |t#1| (|Comparable|)))
                                        ((|ConvertibleTo| (|InputForm|))
                                         (AND
                                          (|has| |t#3|
                                                 (|ConvertibleTo|
                                                  (|InputForm|)))
                                          (|has| |t#1|
                                                 (|ConvertibleTo|
                                                  (|InputForm|)))))
                                        ((|ConvertibleTo|
                                          (|Pattern| (|Integer|)))
                                         (AND
                                          (|has| |t#3|
                                                 (|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))
                                          (|has| |t#1|
                                                 (|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        ((|ConvertibleTo|
                                          (|Pattern| (|Float|)))
                                         (AND
                                          (|has| |t#3|
                                                 (|ConvertibleTo|
                                                  (|Pattern| (|Float|))))
                                          (|has| |t#1|
                                                 (|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        ((|PatternMatchable| (|Integer|))
                                         (AND
                                          (|has| |t#3|
                                                 (|PatternMatchable|
                                                  (|Integer|)))
                                          (|has| |t#1|
                                                 (|PatternMatchable|
                                                  (|Integer|)))))
                                        ((|PatternMatchable| (|Float|))
                                         (AND
                                          (|has| |t#3|
                                                 (|PatternMatchable|
                                                  (|Float|)))
                                          (|has| |t#1|
                                                 (|PatternMatchable|
                                                  (|Float|)))))
                                        ((|GcdDomain|)
                                         (|has| |t#1| (|GcdDomain|)))
                                        ((|canonicalUnitNormal|)
                                         (|has| |t#1| (|canonicalUnitNormal|)))
                                        ((|PolynomialFactorizationExplicit|)
                                         (|has| |t#1|
                                                (|PolynomialFactorizationExplicit|))))
                                      '((|Factored| $) (|List| $)
                                        (|List| |t#3|) (|NonNegativeInteger|)
                                        (|SparseUnivariatePolynomial| $)
                                        (|SparseUnivariatePolynomial| |t#1|)
                                        (|List| (|NonNegativeInteger|)))
                                      NIL))
                             . #2=(|PolynomialCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|PolynomialCategory| (|devaluate| |t#1|)
                     (|devaluate| |t#2|) (|devaluate| |t#3|))))))) 
