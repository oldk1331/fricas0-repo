
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |GcdDomain;|)) 

(DEFPARAMETER |GcdDomain;AL| 'NIL) 

(DEFUN |GcdDomain| ()
  (LET (#:G135)
    (COND (|GcdDomain;AL|) (T (SETQ |GcdDomain;AL| (|GcdDomain;|)))))) 

(DEFUN |GcdDomain;| ()
  (PROG (#1=#:G133)
    (RETURN
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
       (SETELT #1# 0 '(|GcdDomain|)))))) 

(MAKEPROP '|GcdDomain| 'NILADIC T) 
