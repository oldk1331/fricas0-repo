
(DEFPARAMETER |PAdicIntegerCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PAdicIntegerCategory;|)) 

(DEFPARAMETER |PAdicIntegerCategory;AL| 'NIL) 

(DEFUN |PAdicIntegerCategory| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |PAdicIntegerCategory;AL|)) (CDR #1#))
          (T
           (SETQ |PAdicIntegerCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|PAdicIntegerCategory;| #2#)))
                            |PAdicIntegerCategory;AL|))
           #1#)))) 

(DEFUN |PAdicIntegerCategory;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|PAdicIntegerCategory;CAT|)
                                    ('T
                                     (LETT |PAdicIntegerCategory;CAT|
                                           (|Join| (|EuclideanDomain|)
                                                   (|CharacteristicZero|)
                                                   (|mkCategory|
                                                    '(((|digits|
                                                        ((|Stream| (|Integer|))
                                                         $))
                                                       T)
                                                      ((|order|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|extend|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|complete| ($ $)) T)
                                                      ((|modulus|
                                                        ((|Integer|)))
                                                       T)
                                                      ((|moduloP|
                                                        ((|Integer|) $))
                                                       T)
                                                      ((|quotientByP| ($ $)) T)
                                                      ((|approximate|
                                                        ((|Integer|) $
                                                         (|Integer|)))
                                                       T)
                                                      ((|sqrt|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|root|
                                                        ($
                                                         (|SparseUnivariatePolynomial|
                                                          (|Integer|))
                                                         (|Integer|)))
                                                       T))
                                                    NIL NIL NIL))
                                           . #2=(|PAdicIntegerCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|PAdicIntegerCategory| |t#1|))))) 
