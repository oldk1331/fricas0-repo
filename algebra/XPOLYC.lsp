
(DEFPARAMETER |XPolynomialsCat;CAT| 'NIL) 

(DECLAIM (NOTINLINE |XPolynomialsCat;|)) 

(DEFPARAMETER |XPolynomialsCat;AL| 'NIL) 

(DEFUN |XPolynomialsCat| (|t#1| |t#2|)
  (LET (#1=#:G105 (#2=#:G106 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |XPolynomialsCat;AL|)) (CDR #1#))
          (T
           (SETQ |XPolynomialsCat;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|XPolynomialsCat;| #2#)))
                    |XPolynomialsCat;AL|))
           #1#)))) 

(DEFUN |XPolynomialsCat;| (|t#1| |t#2|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|XPolynomialsCat;CAT|)
                                    ('T
                                     (LETT |XPolynomialsCat;CAT|
                                           (|Join|
                                            (|XFreeAlgebra| '|t#1| '|t#2|)
                                            (|mkCategory|
                                             '(((|maxdeg|
                                                 ((|FreeMonoid| |t#1|) $))
                                                T)
                                               ((|degree|
                                                 ((|NonNegativeInteger|) $))
                                                T)
                                               ((|trunc|
                                                 ($ $ (|NonNegativeInteger|)))
                                                T))
                                             NIL
                                             '((|NonNegativeInteger|)
                                               (|FreeMonoid| |t#1|))
                                             NIL))
                                           . #2=(|XPolynomialsCat|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|XPolynomialsCat| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
