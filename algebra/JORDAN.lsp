
(SDEFUN |JORDAN;*;3%;1| ((|a| (%)) (|b| (%)) (% (%)))
        (COND
         ((SPADCALL (QREFELT % 11) (QREFELT % 16))
          (|error|
           "constructor must no be called with Ring of characteristic 2"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |a| |b| (QREFELT % 17))
                     (SPADCALL |b| |a| (QREFELT % 17)) (QREFELT % 18))
           (QREFELT % 14) (QREFELT % 19))))) 

(PUT '|JORDAN;coerce;%A;2| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |JORDAN;coerce;%A;2| ((|a| (%)) (% (A))) |a|) 

(PUT '|JORDAN;coerce;A%;3| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |JORDAN;coerce;A%;3| ((|a| (A)) (% (%))) |a|) 

(PUT '|JORDAN;^;%Pi%;4| '|SPADreplace| '(XLAM (|a| |n|) |a|)) 

(SDEFUN |JORDAN;^;%Pi%;4| ((|a| (%)) (|n| (|PositiveInteger|)) (% (%))) |a|) 

(DECLAIM (NOTINLINE |AssociatedJordanAlgebra;|)) 

(DEFUN |AssociatedJordanAlgebra| (&REST #1=#:G15)
  (SPROG NIL
         (PROG (#2=#:G16)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AssociatedJordanAlgebra|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AssociatedJordanAlgebra;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AssociatedJordanAlgebra|)))))))))) 

(DEFUN |AssociatedJordanAlgebra;| (|#1| |#2|)
  (SPROG ((#1=#:G2 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AssociatedJordanAlgebra| DV$1 DV$2))
          (LETT % (GETREFV 43))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|FramedNonAssociativeAlgebra|
                                                              (|devaluate|
                                                               |#1|)))
                                              (AND
                                               (|HasCategory| |#1| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|FiniteRankNonAssociativeAlgebra|
                                                              (|devaluate|
                                                               |#1|)))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FiniteRankNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|))))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FramedNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|)))))
                                              (OR
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FiniteRankNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|)))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|Hashable|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|Finite|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FramedNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|))))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|Hashable|))
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|FramedNonAssociativeAlgebra|
                                                                (|devaluate|
                                                                 |#1|)))))
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))))))
          (|haddProp| |$ConstructorCache| '|AssociatedJordanAlgebra|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 5 |#2|)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 |#2|)
          (QSETREFV % 11
                    (SPADCALL (|spadConstant| % 9) (|spadConstant| % 9)
                              (QREFELT % 10)))
          (QSETREFV % 14
                    (PROG2
                        (LETT #1# #2=(SPADCALL (QREFELT % 11) (QREFELT % 13)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) #2# (|Union| #2# "failed")
                                      #1#)))
          %))) 

(MAKEPROP '|AssociatedJordanAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |One|) (4 . +) '|two| (|Union| % '"failed")
              (10 . |recip|) '|oneHalf| (|Boolean|) (15 . |zero?|) (20 . *)
              (26 . +) (32 . *) |JORDAN;*;3%;1| |JORDAN;coerce;%A;2|
              |JORDAN;coerce;A%;3| (|PositiveInteger|) |JORDAN;^;%Pi%;4|
              (|String|) (|OutputForm|) (|Integer|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| (|Polynomial| 6)) (|InputForm|)
              (|List| %) (|HashState|) (|SingleInteger|)
              (|SparseUnivariatePolynomial| 6) (|List| 42)
              (|Record| (|:| |particular| %) (|:| |basis| 31))
              (|Union| 36 '"failed") (|Vector| %) (|List| (|Polynomial| 6))
              (|Matrix| 6) (|Vector| 40) (|Vector| 6))
           '#(~= 38 |zero?| 44 |unit| 49 |subtractIfCan| 53
              |structuralConstants| 59 |someBasis| 68 |smaller?| 72 |size| 78
              |sample| 82 |rightUnits| 86 |rightUnit| 90 |rightTraceMatrix| 94
              |rightTrace| 103 |rightRegularRepresentation| 108 |rightRecip|
              119 |rightRankPolynomial| 124 |rightPower| 128 |rightNorm| 134
              |rightMinimalPolynomial| 139 |rightDiscriminant| 144
              |rightCharacteristicPolynomial| 153 |rightAlternative?| 158
              |represents| 162 |recip| 173 |rank| 178 |random| 182
              |powerAssociative?| 186 |plenaryPower| 190 |opposite?| 196
              |noncommutativeJordanAlgebra?| 202 |lookup| 206 |lieAlgebra?| 211
              |lieAdmissible?| 215 |leftUnits| 219 |leftUnit| 223
              |leftTraceMatrix| 227 |leftTrace| 236 |leftRegularRepresentation|
              241 |leftRecip| 252 |leftRankPolynomial| 257 |leftPower| 261
              |leftNorm| 267 |leftMinimalPolynomial| 272 |leftDiscriminant| 277
              |leftCharacteristicPolynomial| 286 |leftAlternative?| 291 |latex|
              295 |jordanAlgebra?| 300 |jordanAdmissible?| 304
              |jacobiIdentity?| 308 |index| 312 |hashUpdate!| 317 |hash| 323
              |flexible?| 328 |enumerate| 332 |elt| 336 |coordinates| 342
              |convert| 364 |conditionsForIdempotents| 379 |commutator| 388
              |commutative?| 394 |coerce| 398 |basis| 413
              |associatorDependence| 417 |associator| 421 |associative?| 428
              |apply| 432 |antiCommutator| 438 |antiCommutative?| 444
              |antiAssociative?| 448 |alternative?| 452 ^ 456 |Zero| 462 = 466
              - 472 + 483 * 489)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(1 5 0 0 1 0 0 0 0 0 0 2 0 0 2 0 0 7 0 2 4 0 0
                                  0))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| |FramedModule&| NIL NIL NIL |NonAssociativeRng&|
                |AbelianGroup&| NIL |Finite&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| NIL |Magma&| |AbelianSemiGroup&|
                |Hashable&| |SetCategory&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 6) (|Module| 6) (|FramedModule| 6)
                 (|BiModule| 6 6) (|LeftModule| 6) (|RightModule| 6)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|Hashable|) (|SetCategory|)
                 (|ConvertibleTo| 30) (|unitsKnown|) (|CoercibleTo| 26)
                 (|BasicType|) (|CoercibleTo| 7))
              (|makeByteWordVec2| 42
                                  '(0 6 0 9 2 6 0 0 0 10 1 6 12 0 13 1 6 15 0
                                    16 2 8 0 0 0 17 2 8 0 0 0 18 2 0 0 0 6 19 2
                                    0 15 0 0 1 1 0 15 0 1 0 4 12 1 2 0 12 0 0 1
                                    1 3 41 38 1 0 1 41 1 0 3 38 1 2 2 15 0 0 1
                                    0 2 28 1 0 0 0 1 0 4 37 1 0 4 12 1 1 3 40
                                    38 1 0 1 40 1 1 3 6 0 1 2 3 40 0 38 1 1 1
                                    40 0 1 1 4 12 0 1 0 8 29 1 2 0 0 0 23 1 1 3
                                    6 0 1 1 4 34 0 1 1 3 6 38 1 0 1 6 1 1 3 34
                                    0 1 0 3 15 1 2 3 0 42 38 1 1 1 0 42 1 1 4
                                    12 0 1 0 3 23 1 0 2 0 1 0 3 15 1 2 0 0 0 23
                                    1 2 0 15 0 0 1 0 3 15 1 1 2 23 0 1 0 3 15 1
                                    0 3 15 1 0 4 37 1 0 4 12 1 1 3 40 38 1 0 1
                                    40 1 1 3 6 0 1 2 3 40 0 38 1 1 1 40 0 1 1 4
                                    12 0 1 0 8 29 1 2 0 0 0 23 1 1 3 6 0 1 1 4
                                    34 0 1 1 3 6 38 1 0 1 6 1 1 3 34 0 1 0 3 15
                                    1 1 0 25 0 1 0 3 15 1 0 3 15 1 0 3 15 1 1 2
                                    0 23 1 2 6 32 32 0 1 1 6 33 0 1 0 3 15 1 0
                                    2 31 1 2 1 6 0 27 1 2 3 42 0 38 1 2 3 40 38
                                    38 1 1 1 40 38 1 1 1 42 0 1 1 2 30 0 1 1 1
                                    0 42 1 1 1 42 0 1 1 3 39 38 1 0 1 39 1 2 0
                                    0 0 0 1 0 3 15 1 1 0 26 0 1 1 0 5 0 21 1 0
                                    0 5 22 0 1 38 1 0 4 35 1 3 0 0 0 0 0 1 0 3
                                    15 1 2 1 0 40 0 1 2 0 0 0 0 1 0 3 15 1 0 3
                                    15 1 0 3 15 1 2 0 0 0 23 24 0 0 0 1 2 0 15
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 23 0 1 2 0 0 0 0 20 2 0 0 27 0 1 2 0 0 28
                                    0 1 2 0 0 6 0 1 2 0 0 0 6 19)))))
           '|lookupComplete|)) 
