
(/VERSIONCHECK 2) 

(DEFPARAMETER |UnivariateLaurentSeriesCategory;CAT| 'NIL) 

(DEFPARAMETER |UnivariateLaurentSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariateLaurentSeriesCategory| (#1=#:G129)
  (LET (#2=#:G130)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |UnivariateLaurentSeriesCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariateLaurentSeriesCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|UnivariateLaurentSeriesCategory;| #1#)))
               |UnivariateLaurentSeriesCategory;AL|))
      #2#)))) 

(DEFUN |UnivariateLaurentSeriesCategory;| (|t#1|)
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|sublisV| (PAIR '(#2=#:G127) (LIST '(|Integer|)))
                                     (COND
                                      (|UnivariateLaurentSeriesCategory;CAT|)
                                      ('T
                                       (LETT
                                        |UnivariateLaurentSeriesCategory;CAT|
                                        (|Join|
                                         (|UnivariatePowerSeriesCategory|
                                          '|t#1| '#2#)
                                         (|mkCategory|
                                          '(((|series|
                                              ($
                                               (|Stream|
                                                (|Record| (|:| |k| (|Integer|))
                                                          (|:| |c| |t#1|)))))
                                             T)
                                            ((|multiplyCoefficients|
                                              ($ (|Mapping| |t#1| (|Integer|))
                                               $))
                                             T)
                                            ((|rationalFunction|
                                              ((|Fraction|
                                                (|Polynomial| |t#1|))
                                               $ (|Integer|)))
                                             (|has| |t#1| (|IntegralDomain|)))
                                            ((|rationalFunction|
                                              ((|Fraction|
                                                (|Polynomial| |t#1|))
                                               $ (|Integer|) (|Integer|)))
                                             (|has| |t#1| (|IntegralDomain|)))
                                            ((|integrate| ($ $))
                                             (|has| |t#1|
                                                    (|Algebra|
                                                     (|Fraction|
                                                      (|Integer|)))))
                                            ((|integrate| ($ $ (|Symbol|)))
                                             (AND
                                              (|has| |t#1|
                                                     (SIGNATURE |variables|
                                                      ((|List| (|Symbol|))
                                                       |t#1|)))
                                              (|has| |t#1|
                                                     (SIGNATURE |integrate|
                                                      (|t#1| |t#1|
                                                       (|Symbol|))))
                                              (|has| |t#1|
                                                     (|Algebra|
                                                      (|Fraction|
                                                       (|Integer|))))))
                                            ((|integrate| ($ $ (|Symbol|)))
                                             (AND
                                              (|has| |t#1|
                                                     (|AlgebraicallyClosedFunctionSpace|
                                                      (|Integer|)))
                                              (|has| |t#1|
                                                     (|PrimitiveFunctionCategory|))
                                              (|has| |t#1|
                                                     (|TranscendentalFunctionCategory|))
                                              (|has| |t#1|
                                                     (|Algebra|
                                                      (|Fraction|
                                                       (|Integer|)))))))
                                          '(((|RadicalCategory|)
                                             (|has| |t#1|
                                                    (|Algebra|
                                                     (|Fraction|
                                                      (|Integer|)))))
                                            ((|TranscendentalFunctionCategory|)
                                             (|has| |t#1|
                                                    (|Algebra|
                                                     (|Fraction|
                                                      (|Integer|)))))
                                            ((|Field|)
                                             (|has| |t#1| (|Field|))))
                                          '((|Symbol|)
                                            (|Fraction| (|Polynomial| |t#1|))
                                            (|Integer|)
                                            (|Stream|
                                             (|Record| (|:| |k| (|Integer|))
                                                       (|:| |c| |t#1|))))
                                          NIL))
                                        . #3=(|UnivariateLaurentSeriesCategory|))))))
               . #3#)
       (SETELT #1# 0
               (LIST '|UnivariateLaurentSeriesCategory|
                     (|devaluate| |t#1|))))))) 
