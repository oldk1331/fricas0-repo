
(DEFPARAMETER |UnivariatePuiseuxSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesCategory;|)) 

(DEFPARAMETER |UnivariatePuiseuxSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariatePuiseuxSeriesCategory| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |UnivariatePuiseuxSeriesCategory;AL|)) (CDR #1#))
     (T
      (SETQ |UnivariatePuiseuxSeriesCategory;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|UnivariatePuiseuxSeriesCategory;| #2#)))
               |UnivariatePuiseuxSeriesCategory;AL|))
      #1#)))) 

(DEFUN |UnivariatePuiseuxSeriesCategory;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (|subst_in_cat| '(#2=#:G103)
                                                   (LIST
                                                    '(|Fraction| (|Integer|)))
                                                   (COND
                                                    (|UnivariatePuiseuxSeriesCategory;CAT|)
                                                    ('T
                                                     (LETT
                                                      |UnivariatePuiseuxSeriesCategory;CAT|
                                                      (|Join|
                                                       (|UnivariateSeriesWithRationalExponents|
                                                        '|t#1| '#2#)
                                                       (|mkCategory|
                                                        '(((|series|
                                                            ($
                                                             (|NonNegativeInteger|)
                                                             (|Stream|
                                                              (|Record|
                                                               (|:| |k|
                                                                    (|Fraction|
                                                                     (|Integer|)))
                                                               (|:| |c|
                                                                    |t#1|)))))
                                                           T)
                                                          ((|multiplyExponents|
                                                            ($ $
                                                             (|Fraction|
                                                              (|Integer|))))
                                                           T))
                                                        '(((|Field|)
                                                           (|has| |t#1|
                                                                  (|Field|))))
                                                        NIL NIL))))))))
           (SETELT #1# 0 (LIST '|UnivariatePuiseuxSeriesCategory| |t#1|))))) 
