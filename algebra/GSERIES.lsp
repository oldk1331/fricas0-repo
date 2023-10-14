
(PUT '|GSERIES;coerce;Ups$;1| '|SPADreplace| '(XLAM (|upxs|) |upxs|)) 

(DEFUN |GSERIES;coerce;Ups$;1| (|upxs| $) |upxs|) 

(PUT '|GSERIES;puiseux| '|SPADreplace| '(XLAM (|f|) |f|)) 

(DEFUN |GSERIES;puiseux| (|f| $) |f|) 

(DEFUN |GSERIES;differentiate;2$;3| (|f| $)
  (PROG (|str2| |str1|)
    (RETURN
     (SEQ
      (LETT |str1| "'differentiate' unavailable on this domain;  "
            . #1=(|GSERIES;differentiate;2$;3|))
      (LETT |str2| "use 'approximate' first" . #1#)
      (EXIT (|error| (SPADCALL (STRCONC |str1| |str2|) (QREFELT $ 12)))))))) 

(DEFUN |GSERIES;differentiate;$V$;4| (|f| |v| $) (SPADCALL |f| (QREFELT $ 13))) 

(DEFUN |GSERIES;differentiate;$S$;5| (|f| |s| $)
  (PROG (|deriv| |dcds| |str2| |str1|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL |s| (SPADCALL |f| (QREFELT $ 17)))
        (SEQ
         (LETT |str1| "'differentiate' unavailable on this domain;  "
               . #1=(|GSERIES;differentiate;$S$;5|))
         (LETT |str2| "use 'approximate' first" . #1#)
         (EXIT (|error| (SPADCALL (STRCONC |str1| |str2|) (QREFELT $ 12))))))
       ('T
        (SEQ
         (LETT |dcds|
               (SPADCALL (SPADCALL |f| (QREFELT $ 18)) |s| (QREFELT $ 19))
               . #1#)
         (LETT |deriv|
               (SPADCALL (SPADCALL (|GSERIES;puiseux| |f| $) (QREFELT $ 20))
                         (QREFELT $ 9))
               . #1#)
         (EXIT
          (SPADCALL
           (SPADCALL (CONS #'|GSERIES;differentiate;$S$;5!0| (VECTOR $ |s|))
                     |f| (QREFELT $ 22))
           (SPADCALL |dcds| |deriv| (QREFELT $ 23)) (QREFELT $ 24)))))))))) 

(DEFUN |GSERIES;differentiate;$S$;5!0| (|x| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|GSERIES;differentiate;$S$;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |s| (QREFELT $ 19)))))) 

(DEFUN |GSERIES;integrate;2$;6| (|f| $)
  (PROG (|str2| |str1|)
    (RETURN
     (SEQ
      (LETT |str1| "'integrate' unavailable on this domain;  "
            . #1=(|GSERIES;integrate;2$;6|))
      (LETT |str2| "use 'approximate' first" . #1#)
      (EXIT (|error| (SPADCALL (STRCONC |str1| |str2|) (QREFELT $ 12)))))))) 

(DEFUN |GSERIES;integrate;$V$;7| (|f| |v| $) (SPADCALL |f| (QREFELT $ 26))) 

(DEFUN |GSERIES;integrate;$S$;8| (|f| |s| $)
  (PROG (|str2| |str1|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL |s| (SPADCALL |f| (QREFELT $ 17)))
        (SEQ
         (LETT |str1| "'integrate' unavailable on this domain;  "
               . #1=(|GSERIES;integrate;$S$;8|))
         (LETT |str2| "use 'approximate' first" . #1#)
         (EXIT (|error| (SPADCALL (STRCONC |str1| |str2|) (QREFELT $ 12))))))
       ((NULL
         (SPADCALL |s| (SPADCALL (SPADCALL |f| (QREFELT $ 18)) (QREFELT $ 29))
                   (QREFELT $ 31)))
        (SPADCALL (CONS #'|GSERIES;integrate;$S$;8!0| (VECTOR $ |s|)) |f|
                  (QREFELT $ 22)))
       ('T
        (|error|
         "integrate: center is a function of variable of integration"))))))) 

(DEFUN |GSERIES;integrate;$S$;8!0| (|x| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|GSERIES;integrate;$S$;8|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |s| (QREFELT $ 32)))))) 

(DEFUN |GSERIES;integrateWithOneAnswer| (|f| |s| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL |f| |s| (QREFELT $ 36))
            |GSERIES;integrateWithOneAnswer|)
      (EXIT
       (COND ((QEQCAR |res| 0) (QCDR |res|))
             ('T (|SPADfirst| (QCDR |res|))))))))) 

(DEFUN |GSERIES;integrate;$S$;10| (|f| |s| $)
  (PROG (|str2| |str1|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL |s| (SPADCALL |f| (QREFELT $ 17)))
        (SEQ
         (LETT |str1| "'integrate' unavailable on this domain;  "
               . #1=(|GSERIES;integrate;$S$;10|))
         (LETT |str2| "use 'approximate' first" . #1#)
         (EXIT (|error| (SPADCALL (STRCONC |str1| |str2|) (QREFELT $ 12))))))
       ((NULL
         (SPADCALL |s| (SPADCALL (SPADCALL |f| (QREFELT $ 18)) (QREFELT $ 29))
                   (QREFELT $ 31)))
        (SPADCALL (CONS #'|GSERIES;integrate;$S$;10!0| (VECTOR $ |s|)) |f|
                  (QREFELT $ 22)))
       ('T
        (|error|
         "integrate: center is a function of variable of integration"))))))) 

(DEFUN |GSERIES;integrate;$S$;10!0| (|x| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|GSERIES;integrate;$S$;10|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GSERIES;integrateWithOneAnswer| |x| |s| $))))) 

(DECLAIM (NOTINLINE |GeneralUnivariatePowerSeries;|)) 

(DEFUN |GeneralUnivariatePowerSeries| (&REST #1=#:G164)
  (PROG ()
    (RETURN
     (PROG (#2=#:G165)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GeneralUnivariatePowerSeries|)
                                           '|domainEqualList|)
                . #3=(|GeneralUnivariatePowerSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GeneralUnivariatePowerSeries;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GeneralUnivariatePowerSeries|))))))))))) 

(DEFUN |GeneralUnivariatePowerSeries;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G155 #2=#:G156 #3=#:G157 #4=#:G158 #5=#:G159 #6=#:G160
         #7=#:G162 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #8=(|GeneralUnivariatePowerSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #8#)
      (LETT DV$3 (|devaluate| |#3|) . #8#)
      (LETT |dv$| (LIST '|GeneralUnivariatePowerSeries| DV$1 DV$2 DV$3) . #8#)
      (LETT $ (GETREFV 62) . #8#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Fraction|
                                                                   (|Integer|))
                                                                 (|devaluate|
                                                                  |#1|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|SemiGroup|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (LETT #7#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #8#)
                                          (OR #7#
                                              (|HasCategory| |#1| '(|Field|)))
                                          (|HasSignature| |#1|
                                                          (LIST '^
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Fraction|
                                                                   (|Integer|)))))
                                          (AND
                                           (|HasSignature| |#1|
                                                           (LIST '^
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|)))))
                                           (|HasSignature| |#1|
                                                           (LIST '|coerce|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Symbol|)))))
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasCategory| |#1|
                                                           '(|AlgebraicallyClosedFunctionSpace|
                                                             (|Integer|)))
                                            (|HasCategory| |#1|
                                                           '(|PrimitiveFunctionCategory|))
                                            (|HasCategory| |#1|
                                                           '(|TranscendentalFunctionCategory|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasSignature| |#1|
                                                            (LIST '|integrate|
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Symbol|))))
                                            (|HasSignature| |#1|
                                                            (LIST '|variables|
                                                                  (LIST
                                                                   '(|List|
                                                                     (|Symbol|))
                                                                   (|devaluate|
                                                                    |#1|))))))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #8#)
                                          (OR #7#
                                              (|HasCategory| |#1| '(|Field|))
                                              #6#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #6#)
                                          (LETT #5#
                                                (|HasCategory| |#1|
                                                               '(|SemiRing|))
                                                . #8#)
                                          (OR #5#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Fraction|
                                                                       (|Integer|))
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #4#
                                                (|HasCategory| |#1| '(|Ring|))
                                                . #8#)
                                          (OR #4#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Fraction|
                                                                       (|Integer|))
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #7#
                                              (|HasCategory| |#1| '(|Field|))
                                              #6# #4#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Fraction|
                                                                       (|Integer|))
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #7# (|HasCategory| |#1| '(|Field|))
                                           #6# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #8#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #7# (|HasCategory| |#1| '(|Field|))
                                           #6# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #8#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #7# (|HasCategory| |#1| '(|Field|))
                                           #6# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #8#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #1# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #7# (|HasCategory| |#1| '(|Field|))
                                           #6# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))))
                      . #8#))
      (|haddProp| |$ConstructorCache| '|GeneralUnivariatePowerSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 134217728))
      (AND
       (OR (|HasCategory| |#1| '(|Field|))
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 268435456))
      (AND
       (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #5#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 536870912))
      (AND
       (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #4#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 1073741824))
      (AND
       (OR #3#
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 2147483648))
      (AND
       (OR #2#
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 4294967296))
      (AND
       (OR #1#
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 8589934592))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 7)
        (PROGN
         (QSETREFV $ 13
                   (CONS (|dispatchFunction| |GSERIES;differentiate;2$;3|) $))
         (QSETREFV $ 15
                   (CONS (|dispatchFunction| |GSERIES;differentiate;$V$;4|) $))
         (COND
          ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
           (QSETREFV $ 25
                     (CONS (|dispatchFunction| |GSERIES;differentiate;$S$;5|)
                           $))))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |GSERIES;integrate;2$;6|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |GSERIES;integrate;$V$;7|) $))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|integrate|
                                 (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                       '(|Symbol|))))
           (COND
            ((|HasSignature| |#1|
                             (LIST '|variables|
                                   (LIST '(|List| (|Symbol|))
                                         (|devaluate| |#1|))))
             (QSETREFV $ 33
                       (CONS (|dispatchFunction| |GSERIES;integrate;$S$;8|)
                             $))))))
         (COND
          ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
           (COND
            ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
             (COND
              ((|HasCategory| |#1|
                              '(|AlgebraicallyClosedFunctionSpace|
                                (|Integer|)))
               (PROGN
                (QSETREFV $ 33
                          (CONS (|dispatchFunction| |GSERIES;integrate;$S$;10|)
                                $))))))))))))
      $)))) 

(MAKEPROP '|GeneralUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeries| 6 7 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              |GSERIES;coerce;Ups$;1| (|OutputForm|) (|String|) (0 . |coerce|)
              (5 . |differentiate|) (|Variable| 7) (10 . |differentiate|)
              (|Symbol|) (16 . |variable|) (21 . |center|)
              (26 . |differentiate|) (32 . |differentiate|) (|Mapping| 6 6)
              (37 . |map|) (43 . *) (49 . -) (55 . |differentiate|)
              (61 . |integrate|) (66 . |integrate|) (|List| 16)
              (72 . |variables|) (|Boolean|) (77 . |entry?|) (83 . |integrate|)
              (89 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 40 6) (95 . |integrate|) (|List| 38)
              (|NonNegativeInteger|) (|Fraction| 40) (|Integer|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 44 '"failed")
              (|Record| (|:| |coef| 44) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 49 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Stream| 6) (|Record| (|:| |k| 39) (|:| |c| 6))
              (|Stream| 54) (|PositiveInteger|) (|List| 58)
              (|SingletonAsOrderedSet|) (|List| 39) (|SingleInteger|)
              (|HashState|))
           '#(~= 101 |zero?| 107 |variables| 112 |variable| 117 |unitNormal|
              122 |unitCanonical| 127 |unit?| 132 |truncate| 137 |terms| 150
              |tanh| 155 |tan| 160 |subtractIfCan| 165 |squareFreePart| 171
              |squareFree| 176 |sqrt| 181 |sizeLess?| 186 |sinh| 192 |sin| 197
              |series| 202 |sech| 208 |sec| 213 |sample| 218 |rem| 222
              |reductum| 228 |recip| 233 |quo| 238 |principalIdeal| 244
              |prime?| 249 |pole?| 254 |pi| 259 |order| 263 |opposite?| 274
              |one?| 280 |nthRoot| 285 |multiplyExponents| 291 |multiEuclidean|
              303 |monomial?| 309 |monomial| 314 |map| 334 |log| 340
              |leadingMonomial| 345 |leadingCoefficient| 350 |lcmCoef| 355
              |lcm| 361 |latex| 372 |inv| 377 |integrate| 382 |hashUpdate!| 399
              |hash| 405 |gcdPolynomial| 410 |gcd| 416 |factor| 427
              |extendedEuclidean| 432 |extend| 445 |exquo| 451
              |expressIdealMember| 457 |exp| 463 |eval| 468 |euclideanSize| 474
              |elt| 479 |divide| 491 |differentiate| 497 |degree| 540 |csch|
              545 |csc| 550 |coth| 555 |cot| 560 |cosh| 565 |cos| 570
              |complete| 575 |coerce| 580 |coefficient| 615 |charthRoot| 621
              |characteristic| 626 |center| 630 |atanh| 635 |atan| 640
              |associates?| 645 |asinh| 651 |asin| 656 |asech| 661 |asec| 666
              |approximate| 671 |annihilate?| 677 |acsch| 683 |acsc| 688
              |acoth| 693 |acot| 698 |acosh| 703 |acos| 708 ^ 713 |Zero| 743
              |One| 747 D 751 = 788 / 794 - 806 + 817 * 823)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 6 0 6 0 6 6 0 6 15 6 9 15 6 7 1 2 9 4 3 15
                                  14 15 7 0 14 21 7 0 0 14 20 21 7 7 23 17 25 0
                                  17 27 0 0 0 7 0 0 0 5 19 14 15 6 6 7 7 7 7 7
                                  7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| |Algebra&| |Algebra&| NIL |Algebra&| NIL
                NIL |Module&| |PartialDifferentialRing&| |DifferentialRing&|
                |Module&| NIL |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL
                NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL
                |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 39) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 39 58) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 39)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 39)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 16) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 39)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 39 39) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 39)
                 (|RightModule| 39) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 10) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 61
                                  '(1 11 10 0 12 1 0 0 0 13 2 0 0 0 14 15 1 0
                                    16 0 17 1 0 6 0 18 2 6 0 0 16 19 1 5 0 0 20
                                    2 0 0 21 0 22 2 0 0 6 0 23 2 0 0 0 0 24 2 0
                                    0 0 16 25 1 0 0 0 26 2 0 0 0 14 27 1 6 28 0
                                    29 2 28 30 16 0 31 2 6 0 0 16 32 2 0 0 0 16
                                    33 2 35 34 6 16 36 2 0 30 0 0 1 1 34 30 0 1
                                    1 0 57 0 1 1 0 16 0 17 1 29 42 0 1 1 29 0 0
                                    1 1 29 30 0 1 2 0 0 0 39 1 3 0 0 0 39 39 1
                                    1 0 55 0 1 1 7 0 0 1 1 7 0 0 1 2 33 41 0 0
                                    1 1 6 0 0 1 1 6 52 0 1 1 7 0 0 1 2 6 30 0 0
                                    1 1 7 0 0 1 1 7 0 0 1 2 0 0 38 55 1 1 7 0 0
                                    1 1 7 0 0 1 0 34 0 1 2 6 0 0 0 1 1 0 0 0 1
                                    1 30 41 0 1 2 6 0 0 0 1 1 6 47 44 1 1 6 30
                                    0 1 1 0 30 0 1 0 7 0 1 1 0 39 0 1 2 0 39 0
                                    39 1 2 34 30 0 0 1 1 30 30 0 1 2 7 0 0 40 1
                                    2 0 0 0 39 1 2 0 0 0 56 1 2 6 46 44 0 1 1 0
                                    30 0 1 3 0 0 0 58 39 1 3 0 0 0 57 59 1 2 0
                                    0 6 39 1 2 0 0 21 0 22 1 7 0 0 1 1 0 0 0 1
                                    1 0 6 0 1 2 6 43 0 0 1 2 6 0 0 0 1 1 6 0 44
                                    1 1 0 11 0 1 1 6 0 0 1 2 12 0 0 16 33 2 7 0
                                    0 14 27 1 7 0 0 26 2 0 61 61 0 1 1 0 60 0 1
                                    2 6 45 45 45 1 2 6 0 0 0 1 1 6 0 44 1 1 6
                                    52 0 1 3 6 50 0 0 0 1 2 6 51 0 0 1 2 0 0 0
                                    39 1 2 29 41 0 0 1 2 6 46 44 0 1 1 7 0 0 1
                                    2 10 53 0 6 1 1 6 38 0 1 2 5 0 0 0 1 2 0 6
                                    0 39 1 2 6 48 0 0 1 2 4 0 0 16 25 2 4 0 0
                                    28 1 3 4 0 0 28 37 1 3 4 0 0 16 38 1 1 3 0
                                    0 13 2 3 0 0 38 1 2 0 0 0 14 15 1 0 39 0 1
                                    1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7
                                    0 0 1 1 7 0 0 1 1 0 0 0 1 1 28 0 6 1 1 31 0
                                    40 1 1 29 0 0 1 1 7 0 39 1 1 0 0 14 1 1 0 0
                                    5 9 1 0 10 0 1 2 0 6 0 39 1 1 1 41 0 1 0 31
                                    38 1 1 0 6 0 18 1 7 0 0 1 1 7 0 0 1 2 29 30
                                    0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0
                                    1 2 11 6 0 39 1 2 31 30 0 0 1 1 7 0 0 1 1 7
                                    0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0
                                    1 2 30 0 0 38 1 2 7 0 0 39 1 2 7 0 0 0 1 2
                                    6 0 0 40 1 2 0 0 0 56 1 0 34 0 1 0 30 0 1 2
                                    4 0 0 28 1 2 4 0 0 16 1 3 4 0 0 28 37 1 3 4
                                    0 0 16 38 1 1 3 0 0 1 2 3 0 0 38 1 2 0 30 0
                                    0 1 2 6 0 0 0 1 2 6 0 0 6 1 2 32 0 0 0 24 1
                                    32 0 0 1 2 0 0 0 0 1 2 32 0 40 0 1 2 34 0
                                    38 0 1 2 7 0 0 39 1 2 7 0 39 0 1 2 0 0 6 0
                                    23 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 56 0
                                    1)))))
           '|lookupComplete|)) 
