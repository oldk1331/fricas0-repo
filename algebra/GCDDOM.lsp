
(/VERSIONCHECK 2) 

(DEFPARAMETER |GcdDomain;AL| 'NIL) 

(DEFUN |GcdDomain| ()
  (LET (#:G133)
    (COND (|GcdDomain;AL|) (T (SETQ |GcdDomain;AL| (|GcdDomain;|)))))) 

(DEFUN |GcdDomain;| ()
  (PROG (#1=#:G131)
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
