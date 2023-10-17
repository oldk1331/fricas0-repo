
(DECLAIM (NOTINLINE |MultivariatePolynomial;|)) 

(DEFUN |MultivariatePolynomial| (&REST #1=#:G151)
  (SPROG NIL
         (PROG (#2=#:G152)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|MultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariatePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariatePolynomial|)))))))))) 

(DEFUN |MultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G150 NIL) (|pv$| NIL) (#2=#:G141 NIL) (#3=#:G143 NIL) (#4=#:G142 NIL)
    (#5=#:G144 NIL) (#6=#:G145 NIL) (#7=#:G146 NIL) (#8=#:G147 NIL)
    (#9=#:G148 NIL) (#10=#:G149 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|MultivariatePolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 60))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|OrderedVariableList| |#1|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory|
                                         (|IndexedExponents|
                                          (|OrderedVariableList| |#1|))
                                         '(|Comparable|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10# #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #10#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|MultivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 8796093022208))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 17592186044416))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 9007199254740992))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 7 27)
              (|local| |#1|) (|local| |#2|) (|Union| 15 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 16)
              (|Matrix| 16) (|Record| (|:| |mat| 13) (|:| |vec| (|Vector| 16)))
              (|Vector| $) (|Integer|) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 16 $) (|Union| $ '#1#) (|Boolean|)
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 16) (|IndexedExponents| 27)
              (|Record| (|:| |k| 24) (|:| |c| 7)) (|List| 25)
              (|OrderedVariableList| (NRTEVAL (QREFELT $ 6))) (|Mapping| 7 24)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Factored| 31) (|Union| 35 '#1#) (|List| 31)
              (|Union| 23 '#2="failed") (|Union| 16 '#2#) (|List| 27)
              (|List| 21) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Matrix| 7) (|Record| (|:| |mat| 41) (|:| |vec| (|Vector| 7)))
              (|Union| 27 '#2#) (|Equation| $) (|List| 44)
              (|Record| (|:| |var| 27) (|:| |exponent| 21))
              (|Union| 46 '#3="failed") (|Union| 30 '#3#)
              (|SparseUnivariatePolynomial| 7) (|List| 7) (|Mapping| 24 24)
              (|Union| 7 '#2#) (|List| 24) (|Mapping| 7 7) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 43
                                '(0 0 10 0 10 0 16 24 23 14 1 2 3 15 25 17 4 26
                                  0 12 26 0 0 1 5 4 25 0 0 0 1 4 4 37 0 0 0 0 0
                                  1 1 37 26 11 43 12 12 0 0 42 12 0 0 0 9 28 30
                                  0 0 6 7 25 12 12 0 0 0 0 0 0 4 6 7 8 25 13 32
                                  34 18 12 12))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |Algebra&| NIL NIL |Algebra&| |Algebra&|
                |EntireRing&| |PartialDifferentialRing&| NIL
                |FreeModuleCategory&| NIL |Rng&| NIL NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL |Evalable&| |RetractableTo&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 7
                                       (|IndexedExponents|
                                        (|OrderedVariableList| 6))
                                       (|OrderedVariableList| 6))
                 (|MaybeSkewPolynomialCategory| 7
                                                (|IndexedExponents|
                                                 (|OrderedVariableList| 6))
                                                (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 7
                                            (|IndexedExponents|
                                             (|OrderedVariableList| 6)))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 7
                                      (|IndexedExponents|
                                       (|OrderedVariableList| 6)))
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 23) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 7) (|Algebra| $$)
                 (|EntireRing|)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6)) (|Ring|)
                 (|FreeModuleCategory| 7
                                       (|IndexedExponents|
                                        (|OrderedVariableList| 6)))
                 (|SemiRing|) (|Rng|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 7
                                                 (|IndexedExponents|
                                                  (|OrderedVariableList| 6)))
                 (|Module| 23) (|Module| 7) (|FullyLinearlyExplicitOver| 7)
                 (|Module| $$)
                 (|IndexedProductCategory| 7
                                           (|IndexedExponents|
                                            (|OrderedVariableList| 6)))
                 (|BiModule| 7 7) (|BiModule| $$ $$) (|BiModule| 23 23)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 16) (|AbelianProductCategory| 7)
                 (|LeftModule| 7) (|RightModule| 7) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 23) (|RightModule| 23)
                 (|RightModule| 16) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 7)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 16)
                 (|RetractableTo| 7) (|SetCategory|) (|RetractableTo| 23)
                 (|RetractableTo| 16) (|CommutativeStar|) (|Evalable| $$)
                 (|RetractableTo| (|OrderedVariableList| 6))
                 (|VariablesCommuteWithCoefficients|)
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|CoercibleFrom| 7) (|BasicType|) (|CoercibleTo| 59)
                 (|unitsKnown|) (|CoercibleFrom| 23) (|CoercibleFrom| 16)
                 (|canonicalUnitNormal|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|ConvertibleTo| 11) (|ConvertibleTo| 12) (|ConvertibleTo| 10)
                 (|InnerEvalable| $$ $$)
                 (|CoercibleFrom| (|OrderedVariableList| 6)))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
