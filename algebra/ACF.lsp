
(/VERSIONCHECK 2) 

(DEFPARAMETER |AlgebraicallyClosedField;AL| 'NIL) 

(DEFUN |AlgebraicallyClosedField| ()
  (LET (#:G140)
    (COND (|AlgebraicallyClosedField;AL|)
          (T
           (SETQ |AlgebraicallyClosedField;AL|
                   (|AlgebraicallyClosedField;|)))))) 

(DEFUN |AlgebraicallyClosedField;| ()
  (PROG (#1=#:G138)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Field|) (|RadicalCategory|)
                       (|mkCategory|
                        '(((|rootOf| ($ (|Polynomial| $))) T)
                          ((|rootOf| ($ (|SparseUnivariatePolynomial| $))) T)
                          ((|rootOf|
                            ($ (|SparseUnivariatePolynomial| $) (|Symbol|)))
                           T)
                          ((|rootsOf| ((|List| $) (|Polynomial| $))) T)
                          ((|rootsOf|
                            ((|List| $) (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|rootsOf|
                            ((|List| $) (|SparseUnivariatePolynomial| $)
                             (|Symbol|)))
                           T)
                          ((|zeroOf| ($ (|Polynomial| $))) T)
                          ((|zeroOf| ($ (|SparseUnivariatePolynomial| $))) T)
                          ((|zeroOf|
                            ($ (|SparseUnivariatePolynomial| $) (|Symbol|)))
                           T)
                          ((|zerosOf| ((|List| $) (|Polynomial| $))) T)
                          ((|zerosOf|
                            ((|List| $) (|SparseUnivariatePolynomial| $)))
                           T)
                          ((|zerosOf|
                            ((|List| $) (|SparseUnivariatePolynomial| $)
                             (|Symbol|)))
                           T))
                        NIL
                        '((|List| $) (|SparseUnivariatePolynomial| $)
                          (|Symbol|) (|Polynomial| $))
                        NIL))
               |AlgebraicallyClosedField|)
       (SETELT #1# 0 '(|AlgebraicallyClosedField|)))))) 

(MAKEPROP '|AlgebraicallyClosedField| 'NILADIC T) 
