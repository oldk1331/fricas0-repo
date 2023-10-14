
(DECLAIM (NOTINLINE |PolynomialFactorizationExplicit;|)) 

(DEFPARAMETER |PolynomialFactorizationExplicit;AL| 'NIL) 

(DEFUN |PolynomialFactorizationExplicit| ()
  (LET (#:G110)
    (COND (|PolynomialFactorizationExplicit;AL|)
          (T
           (SETQ |PolynomialFactorizationExplicit;AL|
                   (|PolynomialFactorizationExplicit;|)))))) 

(DEFUN |PolynomialFactorizationExplicit;| ()
  (PROG (#1=#:G108)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|UniqueFactorizationDomain|)
                       (|mkCategory|
                        '(((|squareFreePolynomial|
                            ((|Factored| (|SparseUnivariatePolynomial| $))
                             (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|factorPolynomial|
                            ((|Factored| (|SparseUnivariatePolynomial| $))
                             (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|factorSquareFreePolynomial|
                            ((|Factored| (|SparseUnivariatePolynomial| $))
                             (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|gcdPolynomial|
                            ((|SparseUnivariatePolynomial| $)
                             (|SparseUnivariatePolynomial| $)
                             (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|solveLinearPolynomialEquation|
                            ((|Union| (|List| (|SparseUnivariatePolynomial| $))
                                      "failed")
                             (|List| (|SparseUnivariatePolynomial| $))
                             (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|conditionP|
                            ((|Union| (|Vector| $) "failed") (|Matrix| $)))
                           (|has| $ (|CharacteristicNonZero|)))
                          ((|charthRoot| ((|Union| $ "failed") $))
                           (|has| $ (|CharacteristicNonZero|))))
                        NIL
                        '((|Matrix| $)
                          (|List| (|SparseUnivariatePolynomial| $))
                          (|SparseUnivariatePolynomial| $)
                          (|Factored| (|SparseUnivariatePolynomial| $)))
                        NIL))
               |PolynomialFactorizationExplicit|)
       (SETELT #1# 0 '(|PolynomialFactorizationExplicit|)))))) 

(MAKEPROP '|PolynomialFactorizationExplicit| 'NILADIC T) 
