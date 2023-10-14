
(/VERSIONCHECK 2) 

(DEFUN |LIE;*;3$;1| (|a| |b| $)
  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 9)) (SPADCALL |b| |a| (QREFELT $ 9))
            (QREFELT $ 10))) 

(PUT '|LIE;coerce;$A;2| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |LIE;coerce;$A;2| (|a| $) |a|) 

(PUT '|LIE;coerce;A$;3| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |LIE;coerce;A$;3| (|a| $) |a|) 

(DEFUN |LIE;^;$Pi$;4| (|a| |n| $)
  (COND ((EQL |n| 1) |a|) ('T (|spadConstant| $ 15)))) 

(DECLAIM (NOTINLINE |AssociatedLieAlgebra;|)) 

(DEFUN |AssociatedLieAlgebra| (&REST #1=#:G139)
  (PROG ()
    (RETURN
     (PROG (#2=#:G140)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AssociatedLieAlgebra|)
                                           '|domainEqualList|)
                . #3=(|AssociatedLieAlgebra|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AssociatedLieAlgebra;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|AssociatedLieAlgebra|))))))))))) 

(DEFUN |AssociatedLieAlgebra;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AssociatedLieAlgebra|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|AssociatedLieAlgebra| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 36) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         (LIST
                                                          '|FramedNonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
                                          (|HasCategory| |#2|
                                                         (LIST
                                                          '|FiniteRankNonAssociativeAlgebra|
                                                          (|devaluate| |#1|)))
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
                                                           (|devaluate| |#1|)))
                                           (|HasCategory| |#2|
                                                          (LIST
                                                           '|FramedNonAssociativeAlgebra|
                                                           (|devaluate|
                                                            |#1|))))
                                          (AND (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FramedNonAssociativeAlgebra|
                                                               (|devaluate|
                                                                |#1|))))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|AssociatedLieAlgebra| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 5 |#2|)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 |#2|)
      $)))) 

(MAKEPROP '|AssociatedLieAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#2|) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . *) (6 . -) |LIE;*;3$;1| |LIE;coerce;$A;2|
              |LIE;coerce;A$;3| (12 . |One|) (16 . |Zero|) (|PositiveInteger|)
              |LIE;^;$Pi$;4| (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|Union| $ '#1="failed")
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 20 '#1#) (|SparseUnivariatePolynomial| 6) (|List| 27)
              (|Boolean|) (|Matrix| 6) (|Vector| $) (|Vector| 6)
              (|List| (|Polynomial| 6)) (|Vector| 25) (|Integer|)
              (|NonNegativeInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 20 |zero?| 26 |unit| 31 |subtractIfCan| 35
              |structuralConstants| 41 |someBasis| 50 |sample| 54 |rightUnits|
              58 |rightUnit| 62 |rightTraceMatrix| 66 |rightTrace| 75
              |rightRegularRepresentation| 80 |rightRecip| 91
              |rightRankPolynomial| 96 |rightPower| 100 |rightNorm| 106
              |rightMinimalPolynomial| 111 |rightDiscriminant| 116
              |rightCharacteristicPolynomial| 125 |rightAlternative?| 130
              |represents| 134 |recip| 145 |rank| 150 |powerAssociative?| 154
              |plenaryPower| 158 |noncommutativeJordanAlgebra?| 164
              |lieAlgebra?| 168 |lieAdmissible?| 172 |leftUnits| 176 |leftUnit|
              180 |leftTraceMatrix| 184 |leftTrace| 193
              |leftRegularRepresentation| 198 |leftRecip| 209
              |leftRankPolynomial| 214 |leftPower| 218 |leftNorm| 224
              |leftMinimalPolynomial| 229 |leftDiscriminant| 234
              |leftCharacteristicPolynomial| 243 |leftAlternative?| 248 |latex|
              252 |jordanAlgebra?| 257 |jordanAdmissible?| 261
              |jacobiIdentity?| 265 |hashUpdate!| 269 |hash| 275 |flexible?|
              280 |elt| 284 |coordinates| 290 |convert| 312
              |conditionsForIdempotents| 322 |commutator| 331 |commutative?|
              337 |coerce| 341 |basis| 356 |associatorDependence| 360
              |associator| 364 |associative?| 371 |apply| 375 |antiCommutator|
              381 |antiCommutative?| 387 |antiAssociative?| 391 |alternative?|
              395 ^ 399 |Zero| 405 = 409 - 415 + 426 * 432)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(1 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3))
                 (CONS
                  '#(|FramedNonAssociativeAlgebra&|
                     |FiniteRankNonAssociativeAlgebra&|
                     |NonAssociativeAlgebra&| |Module&| NIL
                     |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL
                     |AbelianMonoid&| |AbelianSemiGroup&| |Monad&|
                     |SetCategory&| NIL |BasicType&| NIL NIL)
                  (CONS
                   '#((|FramedNonAssociativeAlgebra| 6)
                      (|FiniteRankNonAssociativeAlgebra| 6)
                      (|NonAssociativeAlgebra| 6) (|Module| 6) (|BiModule| 6 6)
                      (|NonAssociativeRng|) (|RightModule| 6) (|LeftModule| 6)
                      (|AbelianGroup|) (|CancellationAbelianMonoid|)
                      (|AbelianMonoid|) (|AbelianSemiGroup|) (|Monad|)
                      (|SetCategory|) (|CoercibleTo| 7) (|BasicType|)
                      (|CoercibleTo| 35) (|unitsKnown|))
                   (|makeByteWordVec2| 35
                                       '(2 8 0 0 0 9 2 8 0 0 0 10 0 6 0 14 0 0
                                         0 15 2 0 24 0 0 1 1 0 24 0 1 0 3 19 1
                                         2 0 19 0 0 1 1 2 29 26 1 0 1 29 1 0 2
                                         26 1 0 0 0 1 0 3 21 1 0 3 19 1 1 2 25
                                         26 1 0 1 25 1 1 2 6 0 1 2 2 25 0 26 1
                                         1 1 25 0 1 1 3 19 0 1 0 5 18 1 2 0 0 0
                                         16 1 1 2 6 0 1 1 3 22 0 1 1 2 6 26 1 0
                                         1 6 1 1 2 22 0 1 0 2 24 1 2 2 0 27 26
                                         1 1 1 0 27 1 1 3 19 0 1 0 2 16 1 0 2
                                         24 1 2 0 0 0 16 1 0 2 24 1 0 2 24 1 0
                                         2 24 1 0 3 21 1 0 3 19 1 1 2 25 26 1 0
                                         1 25 1 1 2 6 0 1 2 2 25 0 26 1 1 1 25
                                         0 1 1 3 19 0 1 0 5 18 1 2 0 0 0 16 1 1
                                         2 6 0 1 1 3 22 0 1 1 2 6 26 1 0 1 6 1
                                         1 2 22 0 1 0 2 24 1 1 0 32 0 1 0 2 24
                                         1 0 2 24 1 0 2 24 1 2 0 34 34 0 1 1 0
                                         33 0 1 0 2 24 1 2 1 6 0 30 1 2 2 25 26
                                         26 1 2 2 27 0 26 1 1 1 25 26 1 1 1 27
                                         0 1 1 1 0 27 1 1 1 27 0 1 1 2 28 26 1
                                         0 1 28 1 2 0 0 0 0 1 0 2 24 1 1 0 0 5
                                         13 1 0 5 0 12 1 0 35 0 1 0 1 26 1 0 3
                                         23 1 3 0 0 0 0 0 1 0 2 24 1 2 1 0 25 0
                                         1 2 0 0 0 0 1 0 2 24 1 0 2 24 1 0 2 24
                                         1 2 0 0 0 16 17 0 0 0 15 2 0 24 0 0 1
                                         2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                         0 0 6 1 2 0 0 6 0 1 2 0 0 0 0 11 2 0 0
                                         30 0 1 2 0 0 31 0 1 2 0 0 16 0 1)))))
           '|lookupComplete|)) 
