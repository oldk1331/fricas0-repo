
(DECLAIM (NOTINLINE |MultivariatePolynomial;|)) 

(DEFUN |MultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G46 NIL) (#2=#:G45 NIL)
    (#3=#:G44 NIL) (#4=#:G43 NIL) (#5=#:G42 NIL) (#6=#:G41 NIL) (#7=#:G39 NIL)
    (#8=#:G40 NIL) (#9=#:G38 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|MultivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 60))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #1#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #1#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|OrderedVariableList| |#1|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#2| '(|Hashable|))
                                             (|HasCategory|
                                              (|OrderedVariableList| |#1|)
                                              '(|Hashable|)))
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
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# #2#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #1# #2#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# #2#)
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
                                         #1# #2#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #3#
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
                                          #1#
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
                                         #3#)
                                        (LETT #4#
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
                                          #1#
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
                                         #4#)
                                        (LETT #5#
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
                                          #1#
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
                                         #5#)
                                        (LETT #6#
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
                                          #1#
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
                                         #6#)
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #8#
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
                                          #7#)
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #7# #1#)
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #8#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #9#
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
                                         #9#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #9#)))))
    (|haddProp| |$ConstructorCache| '|MultivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 17592186044416))
    (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 35184372088832))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 70368744177664))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #1# (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 140737488355328))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #1# (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 281474976710656))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #9#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 18014398509481984))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |MultivariatePolynomial| (&REST #1=#:G47)
  (SPROG NIL
         (PROG (#2=#:G48)
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

(MAKEPROP '|MultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 7 24)
              (|local| |#1|) (|local| |#2|) (|Boolean|) (|OutputForm|)
              (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 14) (|:| |c| 7)) (|List| 12)
              (|IndexedExponents| 24) (|Mapping| 7 7) (|List| %) (|List| 7)
              (|List| 14) (|NonNegativeInteger|) (|Union| 7 '#1="failed")
              (|Mapping| 14 14) (|List| 19) (|List| 24)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 6)))
              (|Union| 24 '"failed") (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomial| %) (|Union| 16 '#2="failed")
              (|Union| 40 '#3="failed") (|Matrix| %) (|Union| % '#3#)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 37) (|HashState|)
              (|SingleInteger|) (|Integer|) (|Matrix| 37)
              (|Record| (|:| |mat| 38) (|:| |vec| (|Vector| 37))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 37 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 37) (|Mapping| 7 14) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 49 '#3#) (|List| 27) (|Factored| 27) (|Union| 44 '#1#)
              (|Union| 37 '#1#)
              (|Record| (|:| |mat| 54) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 24) (|:| |exponent| 19)) (|Union| 56 '#2#)
              (|List| 59) (|Equation| %))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 10 0 10 0 16 0 25 14 24 4 17 26 15 3 2 1 27
                                  27 26 12 15 1 0 26 4 5 1 0 0 38 4 4 1 0 0 0
                                  27 38 1 1 0 0 0 0 0 11 12 12 44 12 43 0 0 31
                                  29 9 0 0 0 12 12 19 26 7 6 0 0 12 12 18 35 33
                                  13 26 8 7 6 4 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                NIL NIL NIL |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |Evalable&| |Hashable&| NIL |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&| NIL
                |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 7
                                       (|IndexedExponents|
                                        (|OrderedVariableList| 6))
                                       (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 7
                                                (|IndexedExponents|
                                                 (|OrderedVariableList| 6))
                                                (|OrderedVariableList| 6))
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 7
                                            (|IndexedExponents|
                                             (|OrderedVariableList| 6)))
                 (|GcdDomain|)
                 (|AbelianMonoidRing| 7
                                      (|IndexedExponents|
                                       (|OrderedVariableList| 6)))
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 7)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 44) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| 44)
                 (|FreeModuleCategory| 7
                                       (|IndexedExponents|
                                        (|OrderedVariableList| 6)))
                 (|Module| $$) (|FullyLinearlyExplicitOver| 7) (|Module| 7)
                 (|Module| 44)
                 (|IndexedDirectProductCategory| 7
                                                 (|IndexedExponents|
                                                  (|OrderedVariableList| 6)))
                 (|SemiRng|) (|LinearlyExplicitOver| 37)
                 (|LinearlyExplicitOver| 7) (|NonAssociativeRing|)
                 (|BiModule| 44 44) (|BiModule| $$ $$) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7
                                           (|IndexedExponents|
                                            (|OrderedVariableList| 6)))
                 (|NonAssociativeRng|) (|RightModule| 37) (|RightModule| 44)
                 (|LeftModule| 44) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|PatternMatchable| 37)
                 (|PatternMatchable| (|Float|)) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 7)
                 (|RetractableTo| (|OrderedVariableList| 6)) (|Evalable| $$)
                 (|Hashable|) (|CommutativeStar|) (|RetractableTo| 37)
                 (|RetractableTo| 44) (|SetCategory|) (|RetractableTo| 7)
                 (|CoercibleFrom| (|OrderedVariableList| 6))
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 32)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 33) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 37)
                 (|CoercibleFrom| 44) (|unitsKnown|) (|CoercibleTo| 9)
                 (|BasicType|) (|CoercibleFrom| 7)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
