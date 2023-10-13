
(/VERSIONCHECK 2) 

(DEFUN |RegularChain| (&REST #1=#:G158)
  (PROG ()
    (RETURN
     (PROG (#2=#:G159)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RegularChain|)
                                           '|domainEqualList|)
                . #3=(|RegularChain|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |RegularChain;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|RegularChain|))))))))))) 

(DEFUN |RegularChain;| (|#1| |#2|)
  (PROG (#1=#:G157 |pv$| #2=#:G156 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|RegularChain|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT |dv$| (LIST '|RegularChain| DV$1 DV$2) . #3#)
      (LETT $ (GETREFV 42) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|NewSparseMultivariatePolynomial|
                                            |#1| (|OrderedVariableList| |#2|))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (LETT #2#
                                                (|HasCategory|
                                                 (|NewSparseMultivariatePolynomial|
                                                  |#1|
                                                  (|OrderedVariableList| |#2|))
                                                 '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory|
                                            (|NewSparseMultivariatePolynomial|
                                             |#1| (|OrderedVariableList| |#2|))
                                            (LIST '|Evalable|
                                                  (LIST
                                                   '|NewSparseMultivariatePolynomial|
                                                   (|devaluate| |#1|)
                                                   (LIST '|OrderedVariableList|
                                                         (|devaluate| |#2|)))))
                                           #2#)
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#2|)
                                           '(|Finite|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|RegularChain| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32))
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #3#)
           (|augmentPredVector| $ 64))
      (AND #1# #2# (|augmentPredVector| $ 128))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RegularChain| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|RegularTriangularSet| 6 (|IndexedExponents| 28) 28 9)
              (|local| |#1|) (|local| |#2|) (|List| 10)
              (|NewSparseMultivariatePolynomial| 6 28) (|Equation| 9)
              (|List| 9) (|NonNegativeInteger|) (|Boolean|) (|Mapping| 9 9 9)
              (|InputForm|) (|Mapping| 13 9) (|Mapping| 9 9)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (|Record| (|:| |num| 9) (|:| |den| 6)) (|List| $)
              (|Record| (|:| |val| 9) (|:| |tower| $)) (|List| 21)
              (|Union| 9 20) (|Record| (|:| |val| 13) (|:| |tower| $))
              (|List| 24) (|Union| 13 20) (|Union| $ '#1="failed")
              (|OrderedVariableList| 7) (|Union| 9 '#1#) (|List| 28)
              (|Record| (|:| |close| $) (|:| |open| 11)) (|List| 31)
              (|Mapping| 13 9 9) (|Mapping| 13 9 11)
              (|Record| (|:| |close| 11) (|:| |open| 11))
              (|Record| (|:| |bas| $) (|:| |top| 11)) (|Union| 36 '#1#)
              (|Record| (|:| |under| $) (|:| |floor| $) (|:| |upper| $))
              (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 0 |zeroSetSplitIntoTriangularSystems| 6 |zeroSetSplit| 11
              |variables| 29 |trivialIdeal?| 34 |triangular?| 39
              |stronglyReduced?| 44 |stronglyReduce| 55 |squareFreePart| 61
              |sort| 67 |size?| 73 |select| 79 |sample| 91 |roughUnitIdeal?| 95
              |roughSubIdeal?| 100 |roughEqualIdeals?| 106 |roughBase?| 112
              |rewriteSetWithReduction| 117 |rewriteIdealWithRemainder| 125
              |rewriteIdealWithHeadRemainder| 131 |retractIfCan| 137 |retract|
              142 |rest| 147 |removeZero| 152 |removeDuplicates| 158 |remove|
              163 |remainder| 175 |reduced?| 181 |reduceByQuasiMonic| 188
              |reduce| 194 |quasiComponent| 223 |purelyTranscendental?| 228
              |purelyAlgebraicLeadingMonomial?| 234 |purelyAlgebraic?| 240
              |parts| 251 |normalized?| 256 |mvar| 267 |more?| 272 |members|
              278 |member?| 283 |map!| 289 |map| 295 |mainVariables| 301
              |mainVariable?| 306 |less?| 312 |latex| 318
              |lastSubResultantElseSplit| 323 |lastSubResultant| 330 |last| 337
              |invertibleSet| 342 |invertibleElseSplit?| 348 |invertible?| 354
              |intersect| 366 |internalAugment| 390 |initials| 402
              |initiallyReduced?| 407 |initiallyReduce| 418 |infRittWu?| 424
              |iexactQuo| 430 |headRemainder| 436 |headReduced?| 442
              |headReduce| 453 |hash| 459 |first| 464 |find| 469 |extendIfCan|
              475 |extend| 481 |every?| 511 |eval| 517 |eq?| 543 |empty?| 549
              |empty| 554 |degree| 558 |count| 563 |copy| 575 |convert| 580
              |construct| 585 |collectUpper| 590 |collectUnder| 596
              |collectQuasiMonic| 602 |collect| 607 |coerce| 613 |coHeight| 628
              |basicSet| 633 |autoReduced?| 646 |augment| 652 |any?| 676
              |algebraicVariables| 682 |algebraicCoefficients?| 687
              |algebraic?| 693 = 699 |#| 705)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 3 1))
                 (CONS
                  '#(|RegularTriangularSetCategory&| |TriangularSetCategory&|
                     |PolynomialSetCategory&| |Collection&|
                     |HomogeneousAggregate&| |SetCategory&| |Aggregate&|
                     |Evalable&| |BasicType&| NIL NIL |RetractableFrom&| NIL
                     NIL NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|RegularTriangularSetCategory| 6
                                                      (|IndexedExponents|
                                                       (|OrderedVariableList|
                                                        7))
                                                      (|OrderedVariableList| 7)
                                                      (|NewSparseMultivariatePolynomial|
                                                       6
                                                       (|OrderedVariableList|
                                                        7)))
                      (|TriangularSetCategory| 6
                                               (|IndexedExponents|
                                                (|OrderedVariableList| 7))
                                               (|OrderedVariableList| 7)
                                               (|NewSparseMultivariatePolynomial|
                                                6 (|OrderedVariableList| 7)))
                      (|PolynomialSetCategory| 6
                                               (|IndexedExponents|
                                                (|OrderedVariableList| 7))
                                               (|OrderedVariableList| 7)
                                               (|NewSparseMultivariatePolynomial|
                                                6 (|OrderedVariableList| 7)))
                      (|Collection|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|HomogeneousAggregate|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|SetCategory|) (|Aggregate|)
                      (|Evalable|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|BasicType|) (|shallowlyMutable|) (|finiteAggregate|)
                      (|RetractableFrom|
                       (|List|
                        (|NewSparseMultivariatePolynomial| 6
                                                           (|OrderedVariableList|
                                                            7))))
                      (|CoercibleTo|
                       (|List|
                        (|NewSparseMultivariatePolynomial| 6
                                                           (|OrderedVariableList|
                                                            7))))
                      (|Type|) (|CoercibleTo| 40)
                      (|InnerEvalable|
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7))
                       (|NewSparseMultivariatePolynomial| 6
                                                          (|OrderedVariableList|
                                                           7)))
                      (|ConvertibleTo| 15))
                   (|makeByteWordVec2| 41
                                       '(2 0 13 0 0 1 1 0 32 11 1 3 0 20 11 13
                                         13 1 2 0 20 11 13 1 1 0 20 11 1 1 0 30
                                         0 1 1 0 13 0 1 1 4 13 0 1 1 0 13 0 1 2
                                         0 13 9 0 1 2 0 9 9 0 1 2 0 22 9 0 1 2
                                         0 38 0 28 1 2 0 13 0 12 1 2 7 0 16 0 1
                                         2 0 29 0 28 1 0 0 0 1 1 4 13 0 1 2 4
                                         13 0 0 1 2 4 13 0 0 1 1 4 13 0 1 4 0
                                         11 11 0 14 33 1 2 4 11 11 0 1 2 4 11
                                         11 0 1 1 0 27 11 1 1 0 0 11 1 1 0 27 0
                                         1 2 0 9 9 0 1 1 8 0 0 1 2 8 0 9 0 1 2
                                         7 0 16 0 1 2 4 18 9 0 1 3 0 13 9 0 33
                                         1 2 0 9 9 0 1 4 8 9 14 0 9 9 1 2 7 9
                                         14 0 1 3 7 9 14 0 9 1 4 0 9 9 0 14 33
                                         1 1 0 35 0 1 2 0 13 9 0 1 2 0 13 9 0 1
                                         1 0 13 0 1 2 0 13 9 0 1 1 7 11 0 1 2 0
                                         13 9 0 1 1 0 13 0 1 1 0 28 0 1 2 0 13
                                         0 12 1 1 7 11 0 1 2 8 13 9 0 1 2 6 0
                                         17 0 1 2 0 0 17 0 1 1 0 30 0 1 2 0 13
                                         28 0 1 2 0 13 0 12 1 1 0 39 0 1 3 0 23
                                         9 9 0 1 3 0 22 9 9 0 1 1 0 29 0 1 2 0
                                         20 9 0 1 2 0 26 9 0 1 2 0 25 9 0 1 2 0
                                         13 9 0 1 2 0 20 9 20 1 2 0 20 11 0 1 2
                                         0 20 11 20 1 2 0 20 9 0 1 2 0 0 11 0 1
                                         2 0 0 9 0 1 1 0 11 0 1 1 0 13 0 1 2 0
                                         13 9 0 1 2 0 9 9 0 1 2 0 13 0 0 1 2 4
                                         6 6 6 1 2 4 19 9 0 1 1 0 13 0 1 2 0 13
                                         9 0 1 2 0 9 9 0 1 1 0 41 0 1 1 0 29 0
                                         1 2 0 29 16 0 1 2 0 27 0 9 1 2 0 20 11
                                         20 1 2 0 20 9 20 1 2 0 20 11 0 1 2 0
                                         20 9 0 1 2 0 0 0 9 1 2 7 13 16 0 1 2 3
                                         0 0 8 1 3 3 0 0 9 9 1 2 3 0 0 10 1 3 3
                                         0 0 11 11 1 2 0 13 0 0 1 1 0 13 0 1 0
                                         0 0 1 1 0 12 0 1 2 8 12 9 0 1 2 7 12
                                         16 0 1 1 0 0 0 1 1 1 15 0 1 1 0 0 11 1
                                         2 0 0 0 28 1 2 0 0 0 28 1 1 0 0 0 1 2
                                         0 0 0 28 1 1 0 11 0 1 1 0 11 0 1 1 0
                                         40 0 1 1 5 12 0 1 3 0 37 11 16 33 1 2
                                         0 37 11 33 1 2 0 13 0 34 1 2 0 20 11
                                         20 1 2 0 20 9 20 1 2 0 20 11 0 1 2 0
                                         20 9 0 1 2 7 13 16 0 1 1 0 30 0 1 2 0
                                         13 9 0 1 2 0 13 28 0 1 2 0 13 0 0 1 1
                                         7 12 0 1)))))
           '|lookupComplete|)) 
