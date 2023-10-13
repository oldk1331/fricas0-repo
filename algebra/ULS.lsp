
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

(DEFUN |UnivariateLaurentSeries| (&REST #1=#:G178)
  (PROG ()
    (RETURN
     (PROG (#2=#:G179)
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
  (PROG (#1=#:G177 |pv$| #2=#:G171 #3=#:G172 #4=#:G173 #5=#:G174 #6=#:G176 $
         |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|UnivariateLaurentSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT DV$3 (|devaluate| |#3|) . #7#)
      (LETT |dv$| (LIST '|UnivariateLaurentSeries| DV$1 DV$2 DV$3) . #7#)
      (LETT $ (GETREFV 81) . #7#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Integer|)
                                                         '(|SemiGroup|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (OR
                                           (|HasCategory| |#1| '(|SemiRing|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (OR (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #7#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #6#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           #6#)
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1| '(|Field|)) #6#)
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
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|Comparable|)))
                                          (LETT #5#
                                                (AND
                                                 (|HasCategory| |#1|
                                                                '(|Field|))
                                                 (|HasCategory|
                                                  (|UnivariateTaylorSeries|
                                                   |#1| |#2| |#3|)
                                                  '(|OrderedSet|)))
                                                . #7#)
                                          (OR
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|OrderedIntegralDomain|)))
                                           #5#)
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
                                           #5#)
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (LETT #4#
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|PolynomialFactorizationExplicit|))
                                                . #7#)
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               #4#)
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|UnivariateTaylorSeries| |#1|
                                                                           |#2|
                                                                           |#3|)
                                                 '(|CharacteristicNonZero|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (AND (|HasCategory| |#1| '(|Field|))
                                                #3#))
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianMonoid|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|Algebra|
                                                                 (|Fraction|
                                                                  (|Integer|))))
                                                . #7#)
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
                                              #5#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               #4#)
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
                                                             '(|CommutativeRing|))
                                              #6#
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
                                                             '(|AbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #6#
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
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #6#
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
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #6#
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
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              #6#
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
                      . #7#))
      (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|Field|))
                  (|HasCategory| $ '(|CharacteristicNonZero|))
                  (|HasCategory| (|UnivariateTaylorSeries| |#1| |#2| |#3|)
                                 '(|PolynomialFactorizationExplicit|)))
             . #7#)
       (|augmentPredVector| $ 1125899906842624))
      (AND
       (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#
           (AND (|HasCategory| |#1| '(|Field|)) #3#))
       (|augmentPredVector| $ 2251799813685248))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 43)
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
              (|Union| 38 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| 46) (|Pattern| 16) (|UnivariateTaylorSeries| 6 7 8)
              (|List| 32) (|Equation| 32) (|List| 34) (|List| 9)
              (|Record| (|:| |mat| 39) (|:| |vec| (|Vector| 16))) (|Vector| $)
              (|Matrix| 16) (|PatternMatchResult| 46 $)
              (|PatternMatchResult| 16 $) (|Factored| 43)
              (|SparseUnivariatePolynomial| $) (|Union| 45 '#1#) (|List| 43)
              (|Float|) (|DoubleFloat|) (|Union| 50 '#2="failed")
              (|Union| 16 '#2#) (|Fraction| 16) (|Union| 9 '#2#)
              (|Union| $ '"failed") (|NonNegativeInteger|) (|List| 53)
              (|Mapping| 32 32)
              (|Record| (|:| |mat| 57) (|:| |vec| (|Vector| 32))) (|Matrix| 32)
              (|List| $) (|Record| (|:| |coef| 58) (|:| |generator| $))
              (|Union| 58 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 63 '"failed")
              (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| (|Polynomial| 6)) (|Stream| 6) (|Union| 32 '"failed")
              (|Record| (|:| |k| 16) (|:| |c| 6)) (|Stream| 70)
              (|Mapping| 6 16) (|PositiveInteger|) (|List| 76) (|List| 16)
              (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(|variable| 49 |monomial| 54 |integrate| 60 |differentiate| 71
              |coerce| 82 |center| 87 |Zero| 92 |One| 96 + 100)
           'NIL
           (CONS
            (|makeByteWordVec2| 49
                                '(0 0 3 3 0 3 35 0 3 3 0 3 14 3 7 1 6 44 3 3 3
                                  1 7 6 44 37 10 13 14 3 20 21 3 22 0 8 44 14 3
                                  49 0 0 1 45 44 44 14 3 3 49 14 48 4 14 47 0 4
                                  31 46 3 0 0 32 16 3 25 26 0 44 12 18 3 0 0 0
                                  2 3 3 44 44 44 44 44 44 5 1 6 9 11 12 12 31
                                  15 15 17 18 19 23 24 3))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&| NIL
                |QuotientFieldCategory&| |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| |IntegralDomain&| |Algebra&| |Algebra&|
                |Algebra&| |Algebra&| |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Module&| NIL |Module&|
                |Module&| NIL NIL NIL |OrderedRing&| |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |Monoid&| |OrderedSet&|
                |AbelianMonoid&| NIL |AbelianSemiGroup&| |SemiGroup&| NIL NIL
                |FullyEvalableOver&| NIL NIL |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |Evalable&| NIL
                |RetractableTo&| |BasicType&| NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL NIL |RetractableTo&| NIL NIL NIL
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
                 (|PowerSeriesCategory| 6 16 76) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 16)
                 (|GcdDomain|) (|OrderedIntegralDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6) (|Algebra| $$) (|Algebra| 50)
                 (|Algebra| (|UnivariateTaylorSeries| 6 7 8))
                 (|DifferentialExtension| (|UnivariateTaylorSeries| 6 7 8))
                 (|FullyLinearlyExplicitRingOver|
                  (|UnivariateTaylorSeries| 6 7 8))
                 (|Module| 6) (|EntireRing|) (|Module| $$) (|Module| 50)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CommutativeRing|) (|OrderedRing|)
                 (|Module| (|UnivariateTaylorSeries| 6 7 8))
                 (|PartialDifferentialRing| 9) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|LinearlyExplicitRingOver| 16) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 50 50) (|OrderedAbelianGroup|)
                 (|BiModule| (|UnivariateTaylorSeries| 6 7 8)
                             (|UnivariateTaylorSeries| 6 7 8))
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 50) (|RightModule| 50)
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
                 (|BasicType|) (|CoercibleTo| 79) (|Eltable| $$ $$)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|RetractableTo| 9) (|ConvertibleTo| 29) (|ConvertibleTo| 47)
                 (|ConvertibleTo| 46) (|PartialOrder|) (|RetractableTo| 50)
                 (|RetractableTo| 16)
                 (|InnerEvalable| 9 (|UnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| (|UnivariateTaylorSeries| 6 7 8)
                                  (|UnivariateTaylorSeries| 6 7 8))
                 (|Eltable| (|UnivariateTaylorSeries| 6 7 8) $$)
                 (|ConvertibleTo| 30) (|ConvertibleTo| 31) (|Type|))
              (|makeByteWordVec2| 43
                                  '(1 6 12 0 13 0 6 0 14 0 0 0 15 2 0 0 6 16 17
                                    0 6 0 18 0 0 0 19 2 0 0 0 0 20 1 0 0 0 23 1
                                    0 0 0 25 2 0 0 0 21 26 1 0 9 0 10 2 0 0 6
                                    16 17 2 43 0 0 21 26 1 43 0 0 25 1 21 0 0
                                    23 2 0 0 0 21 24 1 0 0 21 22 1 0 6 0 11 0
                                    42 0 19 0 4 0 15 2 0 0 0 0 20)))))
           '|lookupIncomplete|)) 
