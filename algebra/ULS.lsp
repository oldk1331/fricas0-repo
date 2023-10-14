
(/VERSIONCHECK 2) 

(DEFUN |ULS;variable;$S;1| (|x| $) (QREFELT $ 7)) 

(DEFUN |ULS;center;$Coef;2| (|x| $) (QREFELT $ 8)) 

(DEFUN |ULS;coerce;V$;3| (|v| $)
  (COND
   ((SPADCALL (QREFELT $ 8) (QREFELT $ 13))
    (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 17)))
   ('T
    (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 17))
              (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 17)) (QREFELT $ 20))))) 

(DEFUN |ULS;differentiate;$V$;4| (|x| |v| $) (SPADCALL |x| (QREFELT $ 23))) 

(DEFUN |ULS;integrate;$V$;5| (|x| |v| $) (SPADCALL |x| (QREFELT $ 25))) 

(DEFUN |UnivariateLaurentSeries| (&REST #1=#:G184)
  (PROG ()
    (RETURN
     (PROG (#2=#:G185)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariateLaurentSeries|)
                                           '|domainEqualList|)
                . #3=(|UnivariateLaurentSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |UnivariateLaurentSeries;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|UnivariateLaurentSeries|))))))))))) 

(DEFUN |UnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (PROG (#1=#:G183 |pv$| #2=#:G174 #3=#:G175 #4=#:G177 #5=#:G178 #6=#:G179
         #7=#:G180 #8=#:G182 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #9=(|UnivariateLaurentSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #9#)
      (LETT DV$3 (|devaluate| |#3|) . #9#)
      (LETT |dv$| (LIST '|UnivariateLaurentSeries| DV$1 DV$2 DV$3) . #9#)
      (LETT $ (GETREFV 83) . #9#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Integer|)
                                                         '(|SemiGroup|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|RetractableTo| (|Symbol|))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|CharacteristicZero|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|ConvertibleTo|
                                                  (|InputForm|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|RealConstant|)))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|OrderedIntegralDomain|)))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|RetractableTo|
                                                  (|Integer|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|StepThrough|)))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                (LIST '|InnerEvalable|
                                                      '(|Symbol|)
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|)))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                (LIST '|Evalable|
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|)))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                (LIST '|Eltable|
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|))
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|)))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|LinearlyExplicitRingOver|
                                                  (|Integer|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                          (LETT #8#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #9#)
                                          (OR #8#
                                              (|HasCategory| |#1| '(|Field|)))
                                          (|HasSignature| |#1|
                                                          (LIST '^
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|))))
                                          (AND
                                           (|HasSignature| |#1|
                                                           (LIST '^
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|))))
                                           (|HasSignature| |#1|
                                                           (LIST '|coerce|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Symbol|)))))
                                          (LETT #7#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #9#)
                                          (OR #8#
                                              (|HasCategory| |#1| '(|Field|))
                                              #7#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #7#)
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|Comparable|)))
                                          (LETT #6#
                                                (AND
                                                 (|HasCategory| |#1|
                                                                '(|Field|))
                                                 (|HasCategory|
                                                  (|UnivariateTaylorSeries|
                                                   |#1| |#2| |#3|)
                                                  '(|OrderedSet|)))
                                                . #9#)
                                          (OR
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|OrderedIntegralDomain|)))
                                           #6#)
                                          (OR
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|Comparable|)))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|OrderedIntegralDomain|)))
                                           #6#)
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (LETT #5#
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|PolynomialFactorizationExplicit|))
                                                . #9#)
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               #5#)
                                          (LETT #4#
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|CharacteristicNonZero|))
                                                . #9#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                #4#))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|IntegerNumberSystem|)))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|EuclideanDomain|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|))))
                                          (OR (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|PartialDifferentialRing|
                                                             (|Symbol|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|PartialDifferentialRing|
                                                   (|Symbol|)))))
                                          (OR
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|DifferentialRing|)))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|SemiRing|))
                                                . #9#)
                                          (OR #3#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1|
                                                         '(|CancellationAbelianMonoid|))
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|Algebra|
                                                                 (|Fraction|
                                                                  (|Integer|))))
                                                . #9#)
                                          (OR #2# #8#
                                              (|HasCategory| |#1| '(|Field|))
                                              #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|ConvertibleTo|
                                                  (|InputForm|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                (LIST '|Eltable|
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|))
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                (LIST '|Evalable|
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                (LIST '|InnerEvalable|
                                                      '(|Symbol|)
                                                      (LIST
                                                       '|UnivariateTaylorSeries|
                                                       (|devaluate| |#1|)
                                                       (|devaluate| |#2|)
                                                       (|devaluate| |#3|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|LinearlyExplicitRingOver|
                                                  (|Integer|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|RetractableTo|
                                                  (|Integer|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|RetractableTo| (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|Comparable|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|OrderedIntegralDomain|)))
                                              #6#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|RealConstant|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|StepThrough|))))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #8#
                                              (|HasCategory| |#1| '(|Field|))
                                              #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #8#
                                              (|HasCategory| |#1| '(|Field|))
                                              #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #8#
                                              (|HasCategory| |#1| '(|Field|))
                                              #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              #8#
                                              (|HasCategory| |#1| '(|Field|))
                                              #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR
                                           (AND #2#
                                                (|HasCategory| |#1|
                                                               '(|AlgebraicallyClosedFunctionSpace|
                                                                 (|Integer|)))
                                                (|HasCategory| |#1|
                                                               '(|PrimitiveFunctionCategory|))
                                                (|HasCategory| |#1|
                                                               '(|TranscendentalFunctionCategory|)))
                                           (AND #2#
                                                (|HasSignature| |#1|
                                                                (LIST
                                                                 '|integrate|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Symbol|))))
                                                (|HasSignature| |#1|
                                                                (LIST
                                                                 '|variables|
                                                                 (LIST
                                                                  '(|List|
                                                                    (|Symbol|))
                                                                  (|devaluate|
                                                                   |#1|))))))))
                      . #9#))
      (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 9007199254740992))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|Field|))
                  (|HasCategory| $ '(|CharacteristicNonZero|))
                  (|HasCategory| (|UnivariateTaylorSeries| |#1| |#2| |#3|)
                                 '(|PolynomialFactorizationExplicit|)))
             . #9#)
       (|augmentPredVector| $ 18014398509481984))
      (AND
       (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#
           (AND (|HasCategory| |#1| '(|Field|)) #4#))
       (|augmentPredVector| $ 36028797018963968))
      (AND
       (OR (|HasCategory| |#1| '(|Field|))
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 72057594037927936))
      (AND
       (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|Ring|))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 144115188075855872))
      (AND
       (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #3#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 288230376151711744))
      (AND
       (OR (|HasCategory| |#1| '(|AbelianGroup|))
           (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 576460752303423488))
      (AND
       (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
           (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 1152921504606846976))
      (AND
       (OR (|HasCategory| |#1| '(|AbelianMonoid|))
           (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|) '(|Integer|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 2305843009213693952))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 46)
        (QSETREFV $ 26 (CONS (|dispatchFunction| |ULS;integrate;$V$;5|) $))))
      $)))) 

(MAKEPROP '|UnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariateLaurentSeriesConstructor| 6 32)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|Symbol|)
              |ULS;variable;$S;1| |ULS;center;$Coef;2| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Integer|)
              (13 . |monomial|) (19 . |Zero|) (23 . |Zero|) (27 . +)
              (|Variable| 7) |ULS;coerce;V$;3| (33 . |differentiate|)
              |ULS;differentiate;$V$;4| (38 . |integrate|) (43 . |integrate|)
              (|Union| 39 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| 46) (|Pattern| 16) (|UnivariateTaylorSeries| 6 7 8)
              (|List| 32) (|Equation| 32) (|List| 34) (|List| 9) (|Matrix| 16)
              (|Record| (|:| |mat| 37) (|:| |vec| (|Vector| 16))) (|Vector| $)
              (|PatternMatchResult| 46 $) (|PatternMatchResult| 16 $)
              (|Union| 43 '#1#) (|List| 44) (|SparseUnivariatePolynomial| $)
              (|Factored| 44) (|Float|) (|DoubleFloat|)
              (|Union| 49 '#2="failed") (|Fraction| 16) (|Union| 16 '#2#)
              (|Union| 9 '#2#) (|Union| $ '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 53) (|Mapping| 32 32)
              (|Record| (|:| |mat| 58) (|:| |vec| (|Vector| 32))) (|Matrix| 32)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 60) (|:| |generator| $))
              (|Union| 60 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 64 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Fraction| (|Polynomial| 6)) (|Stream| 6)
              (|Union| 32 '"failed") (|Mapping| 6 16)
              (|Record| (|:| |k| 16) (|:| |c| 6)) (|Stream| 72)
              (|PositiveInteger|) (|List| 77) (|List| 16)
              (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|HashState|)
              (|String|) (|OutputForm|) (|SingleInteger|))
           '#(|variable| 49 |monomial| 54 |integrate| 60 |differentiate| 71
              |coerce| 82 |center| 87 |Zero| 92 |One| 96 + 100)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 0 2 2 0 2 31 0 2 2 0 2 7 2 24 19 24 2 48 2
                                  2 2 19 24 24 48 33 4 23 7 2 39 40 2 13 0 23
                                  48 7 2 52 0 0 23 47 48 48 7 2 2 52 7 51 42 7
                                  50 0 42 27 49 2 0 0 28 9 2 16 17 0 48 6 11 2
                                  0 0 0 0 1 23 24 2 2 48 48 48 48 48 48 38 3 5
                                  6 6 27 8 8 10 11 12 14 15 2))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&| NIL
                |QuotientFieldCategory&| |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| NIL |Algebra&| |Algebra&| NIL |Algebra&|
                |Algebra&| |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Module&| |Module&|
                |EntireRing&| |Module&| NIL NIL NIL |OrderedRing&| |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |Monoid&| |OrderedSet&|
                |AbelianMonoid&| NIL |AbelianSemiGroup&| |SemiGroup&| NIL NIL
                |FullyEvalableOver&| NIL NIL |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |Evalable&| NIL
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL |RetractableTo&| NIL NIL NIL
                |PartialOrder&| |RetractableTo&| |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6
                                                               (|UnivariateTaylorSeries|
                                                                6 7 8))
                 (|UnivariateLaurentSeriesCategory| 6)
                 (|QuotientFieldCategory| (|UnivariateTaylorSeries| 6 7 8))
                 (|Field|) (|UnivariatePowerSeriesCategory| 6 16)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PowerSeriesCategory| 6 16 77) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 16)
                 (|GcdDomain|) (|OrderedIntegralDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 49)
                 (|Algebra| (|UnivariateTaylorSeries| 6 7 8))
                 (|DifferentialExtension| (|UnivariateTaylorSeries| 6 7 8))
                 (|FullyLinearlyExplicitRingOver|
                  (|UnivariateTaylorSeries| 6 7 8))
                 (|Module| 6) (|Module| $$) (|EntireRing|) (|Module| 49)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CommutativeRing|) (|OrderedRing|)
                 (|Module| (|UnivariateTaylorSeries| 6 7 8))
                 (|PartialDifferentialRing| 9) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|LinearlyExplicitRingOver| 16) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 49 49) (|OrderedAbelianGroup|)
                 (|BiModule| (|UnivariateTaylorSeries| 6 7 8)
                             (|UnivariateTaylorSeries| 6 7 8))
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 49) (|RightModule| 49)
                 (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|RightModule| (|UnivariateTaylorSeries| 6 7 8)) (|Rng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRng|) (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|FullyPatternMatchable| (|UnivariateTaylorSeries| 6 7 8))
                 (|AbelianSemiGroup|) (|SemiGroup|) (|Comparable|)
                 (|StepThrough|)
                 (|FullyEvalableOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|PatternMatchable| 46) (|PatternMatchable| 16)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|RealConstant|) (|Evalable| (|UnivariateTaylorSeries| 6 7 8))
                 (|Patternable| (|UnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| (|UnivariateTaylorSeries| 6 7 8))
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 81) (|Eltable| $$ $$) (|CommutativeStar|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|RetractableTo| 9) (|ConvertibleTo| 29)
                 (|ConvertibleTo| 47) (|ConvertibleTo| 46) (|PartialOrder|)
                 (|RetractableTo| 49) (|RetractableTo| 16)
                 (|InnerEvalable| 9 (|UnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| (|UnivariateTaylorSeries| 6 7 8)
                                  (|UnivariateTaylorSeries| 6 7 8))
                 (|Eltable| (|UnivariateTaylorSeries| 6 7 8) $$)
                 (|ConvertibleTo| 30) (|ConvertibleTo| 31) (|Type|))
              (|makeByteWordVec2| 62
                                  '(1 6 12 0 13 0 6 0 14 0 0 0 15 2 0 0 6 16 17
                                    0 6 0 18 0 0 0 19 2 0 0 0 0 20 1 0 0 0 23 1
                                    0 0 0 25 2 0 0 0 21 26 1 0 9 0 10 2 0 0 6
                                    16 17 2 46 0 0 21 26 1 46 0 0 25 1 40 0 0
                                    23 2 0 0 0 21 24 1 0 0 21 22 1 0 6 0 11 0
                                    62 0 19 0 59 0 15 2 0 0 0 0 20)))))
           '|lookupIncomplete|)) 
