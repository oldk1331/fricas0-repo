
(DEFPARAMETER |AlgebraicallyClosedFunctionSpace;CAT| 'NIL) 

(DECLAIM (NOTINLINE |AlgebraicallyClosedFunctionSpace;|)) 

(DEFPARAMETER |AlgebraicallyClosedFunctionSpace;AL| 'NIL) 

(DEFUN |AlgebraicallyClosedFunctionSpace| (|t#1|)
  (LET (#1=#:G117 (#2=#:G118 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |AlgebraicallyClosedFunctionSpace;AL|)) (CDR #1#))
     (T
      (SETQ |AlgebraicallyClosedFunctionSpace;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|AlgebraicallyClosedFunctionSpace;| #2#)))
               |AlgebraicallyClosedFunctionSpace;AL|))
      #1#)))) 

(DEFUN |AlgebraicallyClosedFunctionSpace;| (|t#1|)
  (SPROG ((#1=#:G116 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|AlgebraicallyClosedFunctionSpace;CAT|)
                                    ('T
                                     (LETT
                                      |AlgebraicallyClosedFunctionSpace;CAT|
                                      (|Join| (|AlgebraicallyClosedField|)
                                              (|FunctionSpace| '|t#1|)
                                              (|mkCategory|
                                               '(((|rootOf| ($ $)) T)
                                                 ((|rootsOf| ((|List| $) $)) T)
                                                 ((|rootOf| ($ $ (|Symbol|)))
                                                  T)
                                                 ((|rootsOf|
                                                   ((|List| $) $ (|Symbol|)))
                                                  T)
                                                 ((|zeroOf| ($ $)) T)
                                                 ((|zerosOf| ((|List| $) $)) T)
                                                 ((|zeroOf| ($ $ (|Symbol|)))
                                                  T)
                                                 ((|zerosOf|
                                                   ((|List| $) $ (|Symbol|)))
                                                  T)
                                                 ((|rootSum|
                                                   ($ $
                                                    (|SparseUnivariatePolynomial|
                                                     $)
                                                    (|Symbol|)))
                                                  T))
                                               '(((|RetractableTo|
                                                   (|AlgebraicNumber|))
                                                  (|has| |t#1|
                                                         (|RetractableTo|
                                                          (|Integer|)))))
                                               '((|SparseUnivariatePolynomial|
                                                  $)
                                                 (|Symbol|) (|List| $))
                                               NIL))
                                      . #2=(|AlgebraicallyClosedFunctionSpace|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|AlgebraicallyClosedFunctionSpace|
                         (|devaluate| |t#1|)))))) 
