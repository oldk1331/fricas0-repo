
(/VERSIONCHECK 2) 

(DEFUN |AN;zero?;$B;1| (|a| $)
  (SPADCALL |a| (|spadConstant| $ 7) (QREFELT $ 10))) 

(DEFUN |AN;one?;$B;2| (|a| $)
  (SPADCALL |a| (|spadConstant| $ 12) (QREFELT $ 10))) 

(DEFUN |AN;=;2$B;3| (|a| |b| $)
  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 15)) (|spadConstant| $ 7)
            (QREFELT $ 10))) 

(DEFUN |AN;convert;$If;4| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 20))) 

(DECLAIM (NOTINLINE |AlgebraicNumber;|)) 

(DEFUN |AlgebraicNumber| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G138)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|AlgebraicNumber|)
                . #2=(|AlgebraicNumber|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|AlgebraicNumber|
                         (LIST (CONS NIL (CONS 1 (|AlgebraicNumber;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|AlgebraicNumber|))))))))))) 

(DEFUN |AlgebraicNumber;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|AlgebraicNumber|) . #1=(|AlgebraicNumber|))
      (LETT $ (GETREFV 68) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraicNumber| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 1))
      (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
           (|augmentPredVector| $ 2))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|InnerAlgebraicNumber|))
      $)))) 

(MAKEPROP '|AlgebraicNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerAlgebraicNumber|) '|Rep| (0 . |Zero|)
              (4 . |Zero|) (|Boolean|) (8 . |trueEqual|) |AN;zero?;$B;1|
              (14 . |One|) (18 . |One|) |AN;one?;$B;2| (22 . -) |AN;=;2$B;3|
              (|InputForm|) (28 . |convert|) (|InputFormFunctions1| $$)
              (33 . |coerceToType|) |AN;convert;$If;4|
              (|SparseUnivariatePolynomial| $) (|Kernel| $) (|List| 23)
              (|SparseMultivariatePolynomial| 37 23) (|NonNegativeInteger|)
              (|Complex| 34)
              (|Record| (|:| |mat| 31) (|:| |vec| (|Vector| 35))) (|Matrix| $)
              (|Vector| $) (|Matrix| 35) (|DoubleFloat|) (|Matrix| 37)
              (|Float|) (|Fraction| 37)
              (|Record| (|:| |mat| 33) (|:| |vec| (|Vector| 37))) (|Integer|)
              (|Union| 35 '#1="failed") (|Union| 37 '#1#) (|PositiveInteger|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 44) (|:| |generator| $))
              (|Union| 44 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 49 '"failed")
              (|Factored| $) (|Polynomial| $) (|Symbol|) (|BasicOperator|)
              (|Mapping| $ 44) (|Mapping| $ $) (|List| 54) (|List| 56)
              (|List| 55) (|List| 53) (|Union| 23 '"failed") (|List| 63)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 38 |zerosOf| 44 |zeroOf| 60 |zero?| 76 |unitNormal| 81
              |unitCanonical| 86 |unit?| 91 |tower| 96 |subtractIfCan| 101
              |subst| 107 |squareFreePart| 126 |squareFree| 131 |sqrt| 136
              |smaller?| 141 |sizeLess?| 147 |sample| 153 |rootsOf| 157
              |rootOf| 173 |retractIfCan| 189 |retract| 204 |rem| 219
              |reducedSystem| 225 |reduce| 247 |recip| 252 |quo| 257
              |principalIdeal| 263 |prime?| 268 |paren| 273 |opposite?| 283
              |operators| 289 |operator| 294 |one?| 299 |odd?| 304 |numer| 309
              |nthRoot| 314 |norm| 320 |multiEuclidean| 344 |minPoly| 350 |map|
              355 |mainKernel| 361 |lcmCoef| 366 |lcm| 372 |latex| 383
              |kernels| 388 |kernel| 393 |is?| 405 |inv| 417 |height| 422
              |hashUpdate!| 427 |hash| 433 |gcdPolynomial| 438 |gcd| 444
              |freeOf?| 455 |factor| 467 |extendedEuclidean| 472 |exquo| 485
              |expressIdealMember| 491 |even?| 497 |eval| 502 |euclideanSize|
              598 |elt| 603 |divide| 699 |distribute| 705 |differentiate| 716
              |denom| 727 |definingPolynomial| 732 |convert| 737 |coerce| 757
              |characteristic| 787 |box| 791 |belong?| 801 |associates?| 806
              |annihilate?| 812 ^ 818 |Zero| 842 |One| 846 D 850 = 861 / 867 -
              873 + 884 * 890)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedField&| |Field&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |DifferentialRing&| NIL NIL NIL
                |Module&| |EntireRing&| |Module&| NIL NIL NIL |Ring&| NIL NIL
                NIL NIL |Rng&| |AbelianGroup&| NIL NIL |ExpressionSpace&|
                |Monoid&| NIL |AbelianMonoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| NIL |SetCategory&| |Evalable&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| |RadicalCategory&| NIL
                NIL NIL NIL NIL |BasicType&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL)
             (CONS
              '#((|AlgebraicallyClosedField|) (|Field|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 35) (|LeftOreRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 35)
                 (|LinearlyExplicitRingOver| 37) (|Module| 35) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|BiModule| 35 35)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 35)
                 (|LeftModule| 35) (|LeftModule| $$) (|RightModule| $$) (|Rng|)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|ExpressionSpace|) (|Monoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|Evalable| $$)
                 (|ConvertibleTo| 17) (|ConvertibleTo| 27) (|ConvertibleTo| 34)
                 (|ConvertibleTo| 32) (|RetractableTo| 35) (|RetractableTo| 37)
                 (|RadicalCategory|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 67))
              (|makeByteWordVec2| 67
                                  '(0 0 0 7 0 6 0 8 2 6 9 0 0 10 0 0 0 12 0 6 0
                                    13 2 0 0 0 0 15 1 6 17 0 18 1 19 17 17 20 2
                                    0 9 0 0 1 1 0 44 22 1 1 0 44 52 1 2 0 44 22
                                    53 1 1 0 0 22 1 1 0 0 52 1 2 0 0 22 53 1 1
                                    0 9 0 11 1 0 42 0 1 1 0 0 0 1 1 0 9 0 1 1 0
                                    24 0 1 2 0 41 0 0 1 2 0 0 0 62 1 3 0 0 0 24
                                    44 1 2 0 0 0 63 1 1 0 0 0 1 1 0 51 0 1 1 0
                                    0 0 1 2 0 9 0 0 1 2 0 9 0 0 1 0 0 0 1 1 0
                                    44 52 1 2 0 44 22 53 1 1 0 44 22 1 1 0 0 52
                                    1 2 0 0 22 53 1 1 0 0 22 1 1 0 38 0 1 1 0
                                    39 0 1 1 0 61 0 1 1 0 35 0 1 1 0 37 0 1 1 0
                                    23 0 1 2 0 0 0 0 1 2 0 28 29 30 1 1 0 31 29
                                    1 1 0 33 29 1 2 0 36 29 30 1 1 0 0 0 1 1 0
                                    41 0 1 2 0 0 0 0 1 1 0 45 44 1 1 0 9 0 1 1
                                    0 0 44 1 1 0 0 0 1 2 0 9 0 0 1 1 0 57 0 1 1
                                    0 54 54 1 1 0 9 0 14 1 2 9 0 1 1 0 25 0 1 2
                                    0 0 0 37 1 2 0 0 0 23 1 2 0 0 0 24 1 2 0 22
                                    22 23 1 2 0 22 22 24 1 2 0 46 44 0 1 1 1 22
                                    23 1 2 0 0 56 23 1 1 0 61 0 1 2 0 43 0 0 1
                                    2 0 0 0 0 1 1 0 0 44 1 1 0 64 0 1 1 0 24 0
                                    1 2 0 0 54 44 1 2 0 0 54 0 1 2 0 9 0 53 1 2
                                    0 9 0 54 1 1 0 0 0 1 1 0 26 0 1 2 0 66 66 0
                                    1 1 0 65 0 1 2 0 22 22 22 1 2 0 0 0 0 1 1 0
                                    0 44 1 2 0 9 0 53 1 2 0 9 0 0 1 1 0 51 0 1
                                    2 0 48 0 0 1 3 0 50 0 0 0 1 2 0 41 0 0 1 2
                                    0 46 44 0 1 1 2 9 0 1 3 0 0 0 54 55 1 3 0 0
                                    0 54 56 1 3 0 0 0 57 58 1 3 0 0 0 57 59 1 3
                                    0 0 0 53 55 1 3 0 0 0 53 56 1 3 0 0 0 60 59
                                    1 3 0 0 0 60 58 1 3 0 0 0 44 44 1 2 0 0 0
                                    63 1 3 0 0 0 0 0 1 2 0 0 0 62 1 3 0 0 0 23
                                    0 1 3 0 0 0 24 44 1 1 0 26 0 1 10 0 0 54 0
                                    0 0 0 0 0 0 0 0 1 2 0 0 54 44 1 8 0 0 54 0
                                    0 0 0 0 0 0 1 9 0 0 54 0 0 0 0 0 0 0 0 1 7
                                    0 0 54 0 0 0 0 0 0 1 5 0 0 54 0 0 0 0 1 6 0
                                    0 54 0 0 0 0 0 1 3 0 0 54 0 0 1 4 0 0 54 0
                                    0 0 1 2 0 0 54 0 1 2 0 47 0 0 1 2 0 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 0 0 26 1 1 0 25 0 1
                                    1 1 0 0 1 1 0 27 0 1 1 0 17 0 21 1 0 32 0 1
                                    1 0 34 0 1 1 0 0 25 1 1 0 0 37 1 1 0 0 0 1
                                    1 0 0 35 1 1 0 0 23 1 1 0 67 0 1 0 0 26 1 1
                                    0 0 0 1 1 0 0 44 1 1 0 9 54 1 2 0 9 0 0 1 2
                                    0 9 0 0 1 2 0 0 0 40 1 2 0 0 0 26 1 2 0 0 0
                                    37 1 2 0 0 0 35 1 0 0 0 7 0 0 0 12 1 0 0 0
                                    1 2 0 0 0 26 1 2 0 9 0 0 16 2 0 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 15 2 0 0 0 0 1 2 0 0 40 0 1
                                    2 0 0 26 0 1 2 0 0 37 0 1 2 0 0 0 0 1 2 0 0
                                    0 35 1 2 0 0 35 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|AlgebraicNumber| 'NILADIC T) 
