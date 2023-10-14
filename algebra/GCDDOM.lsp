
(DECLAIM (NOTINLINE |GcdDomain;|)) 

(DEFPARAMETER |GcdDomain;AL| 'NIL) 

(DEFUN |GcdDomain| ()
  (LET (#:G112)
    (COND (|GcdDomain;AL|) (T (SETQ |GcdDomain;AL| (|GcdDomain;|)))))) 

(DEFUN |GcdDomain;| ()
  (SPROG ((#1=#:G110 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|IntegralDomain|) (|LeftOreRing|)
                           (|mkCategory|
                            '(((|gcd| ($ $ $)) T) ((|gcd| ($ (|List| $))) T)
                              ((|lcm| ($ $ $)) T) ((|lcm| ($ (|List| $))) T)
                              ((|gcdPolynomial|
                                ((|SparseUnivariatePolynomial| $)
                                 (|SparseUnivariatePolynomial| $)
                                 (|SparseUnivariatePolynomial| $)))
                               T))
                            NIL '((|SparseUnivariatePolynomial| $) (|List| $))
                            NIL))
                   |GcdDomain|)
           (SETELT #1# 0 '(|GcdDomain|))))) 

(MAKEPROP '|GcdDomain| 'NILADIC T) 
