
(/VERSIONCHECK 2) 

(DEFUN |IAN;reducedSystem;MM;1| (|m| $)
  (PROG (|mz|)
    (RETURN
     (SEQ (LETT |mz| (SPADCALL |m| (QREFELT $ 10)) |IAN;reducedSystem;MM;1|)
          (EXIT (SPADCALL (ELT $ 13) |mz| (QREFELT $ 17))))))) 

(DEFUN |IAN;reducedSystem;MVR;2| (|m| |v| $)
  (PROG (|vq| |mq| |mzr|)
    (RETURN
     (SEQ
      (LETT |mzr| (SPADCALL |m| |v| (QREFELT $ 21))
            . #1=(|IAN;reducedSystem;MVR;2|))
      (LETT |mq| (SPADCALL (ELT $ 13) (QCAR |mzr|) (QREFELT $ 17)) . #1#)
      (LETT |vq| (SPADCALL (ELT $ 13) (QCDR |mzr|) (QREFELT $ 25)) . #1#)
      (EXIT (CONS |mq| |vq|)))))) 

(DEFUN |IAN;mainRatDenom| (|f| $) (SPADCALL |f| (QREFELT $ 29))) 

(DEFUN |IAN;findDenominator| (|z| $)
  (PROG (#1=#:G122 |rec| |zz| |dd|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |zz| |z| . #2=(|IAN;findDenominator|))
            (SEQ G190
                 (COND
                  ((NULL
                    (COND
                     ((SPADCALL |zz| (|spadConstant| $ 33) (QREFELT $ 35))
                      'NIL)
                     ('T 'T)))
                   (GO G191)))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (SPADCALL (SPADCALL |zz| (QREFELT $ 36))
                                   (QREFELT $ 38))
                         (QREFELT $ 39))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |dd| (|spadConstant| $ 40) (QREFELT $ 42))
                     (LETT |zz| (SPADCALL |zz| (QREFELT $ 43)) . #2#))
                    ('T
                     (SEQ
                      (LETT |rec|
                            (|IAN;findDenominator|
                             (SPADCALL |dd| |z| (QREFELT $ 44)) $)
                            . #2#)
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (CONS (QCAR |rec|)
                                    (SPADCALL (QCDR |rec|) |dd|
                                              (QREFELT $ 45)))
                              . #2#)
                        (GO #1#))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS |z| (|spadConstant| $ 40)))))
      #1# (EXIT #1#))))) 

(DEFUN |IAN;makeUnivariate| (|p| |k| $)
  (SPADCALL (ELT $ 39) (SPADCALL |p| |k| (QREFELT $ 49)) (QREFELT $ 53))) 

(DEFUN |IAN;differentiate;2$;6| (|x| $) (|spadConstant| $ 30)) 

(DEFUN |IAN;zero?;$B;7| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 55)) (QREFELT $ 56))) 

(DEFUN |IAN;one?;$B;8| (|a| $)
  (COND
   ((SPADCALL (SPADCALL |a| (QREFELT $ 55)) (|spadConstant| $ 58)
              (QREFELT $ 59))
    (SPADCALL (SPADCALL |a| (QREFELT $ 38)) (|spadConstant| $ 58)
              (QREFELT $ 59)))
   ('T 'NIL))) 

(DEFUN |IAN;/;3$;9| (|x| |y| $)
  (|IAN;mainRatDenom| (SPADCALL |x| |y| (QREFELT $ 61)) $)) 

(DEFUN |IAN;^;$I$;10| (|x| |n| $)
  (COND ((< |n| 0) (|IAN;mainRatDenom| (SPADCALL |x| |n| (QREFELT $ 63)) $))
        ('T (SPADCALL |x| |n| (QREFELT $ 63))))) 

(DEFUN |IAN;trueEqual;2$B;11| (|a| |b| $)
  (PROG (|dg| |g| |sb| |sa| |nb| |na| |pb| |pa| |kb| |ka|)
    (RETURN
     (SEQ
      (LETT |ka| (REVERSE (SPADCALL |a| (QREFELT $ 66)))
            . #1=(|IAN;trueEqual;2$B;11|))
      (LETT |kb| (REVERSE (SPADCALL |b| (QREFELT $ 66))) . #1#)
      (COND
       ((NULL |ka|)
        (COND
         ((NULL |kb|)
          (EXIT
           (SPADCALL (SPADCALL |a| (QREFELT $ 67))
                     (SPADCALL |b| (QREFELT $ 67)) (QREFELT $ 68)))))))
      (LETT |pa|
            (SPADCALL (SPADCALL (|spadConstant| $ 40) 1 (QREFELT $ 70))
                      (SPADCALL |a| 0 (QREFELT $ 70)) (QREFELT $ 71))
            . #1#)
      (LETT |pb|
            (SPADCALL (SPADCALL (|spadConstant| $ 40) 1 (QREFELT $ 70))
                      (SPADCALL |b| 0 (QREFELT $ 70)) (QREFELT $ 71))
            . #1#)
      (LETT |na|
            (SPADCALL (ELT $ 67) (SPADCALL |pa| |ka| (QREFELT $ 72))
                      (QREFELT $ 76))
            . #1#)
      (LETT |nb|
            (SPADCALL (ELT $ 67) (SPADCALL |pb| |kb| (QREFELT $ 72))
                      (QREFELT $ 76))
            . #1#)
      (LETT |sa| (SPADCALL |na| (QREFELT $ 77)) . #1#)
      (LETT |sb| (SPADCALL |nb| (QREFELT $ 77)) . #1#)
      (EXIT
       (COND ((SPADCALL |sa| |sb| (QREFELT $ 78)) 'T)
             ('T
              (SEQ (LETT |g| (SPADCALL |sa| |sb| (QREFELT $ 79)) . #1#)
                   (LETT |dg| (SPADCALL |g| (QREFELT $ 80)) . #1#)
                   (EXIT
                    (COND
                     ((OR (EQL |dg| 0)
                          (NULL
                           (OR (EQL |dg| (SPADCALL |sa| (QREFELT $ 80)))
                               (EQL |dg| (SPADCALL |sb| (QREFELT $ 80))))))
                      'NIL)
                     ('T 'T))))))))))) 

(DEFUN |IAN;norm;$K$;12| (|z| |k| $)
  (PROG (|d| |n| |p|)
    (RETURN
     (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 83)) . #1=(|IAN;norm;$K$;12|))
          (LETT |n| (|IAN;makeUnivariate| (SPADCALL |z| (QREFELT $ 55)) |k| $)
                . #1#)
          (LETT |d| (|IAN;makeUnivariate| (SPADCALL |z| (QREFELT $ 38)) |k| $)
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL |n| |p| (QREFELT $ 84))
                     (SPADCALL |d| |p| (QREFELT $ 84)) (QREFELT $ 62))))))) 

(DEFUN |IAN;norm;$L$;13| (|z| |l| $)
  (PROG (#1=#:G145 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|IAN;norm;$L$;13|)) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (LETT |z| (SPADCALL |z| |k| (QREFELT $ 85)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |IAN;norm;SupKSup;14| (|z| |k| $)
  (PROG (|zz| |f| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL (ELT $ 87) (SPADCALL |k| (QREFELT $ 83)) (QREFELT $ 91))
            . #1=(|IAN;norm;SupKSup;14|))
      (LETT |f| (|IAN;findDenominator| |z| $) . #1#)
      (LETT |zz|
            (SPADCALL (CONS #'|IAN;norm;SupKSup;14!0| (VECTOR |k| $))
                      (QCAR |f|) (QREFELT $ 91))
            . #1#)
      (LETT |zz| (SPADCALL |zz| (QREFELT $ 93)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |p| |zz| (QREFELT $ 94))
                 (SPADCALL (QCDR |f|) |k| (QREFELT $ 85)) (QREFELT $ 95))))))) 

(DEFUN |IAN;norm;SupKSup;14!0| (|x| $$)
  (PROG ($ |k|)
    (LETT $ (QREFELT $$ 1) . #1=(|IAN;norm;SupKSup;14|))
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|IAN;makeUnivariate| (SPADCALL |x| (QREFELT $ 55)) |k| $))))) 

(DEFUN |IAN;norm;SupLSup;15| (|z| |l| $)
  (PROG (#1=#:G152 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|IAN;norm;SupLSup;15|)) (LETT #1# |l| . #2#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (LETT |z| (SPADCALL |z| |k| (QREFELT $ 96)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |z|))))) 

(DEFUN |IAN;belong?;BoB;16| (|op| $)
  (COND ((SPADCALL |op| (QREFELT $ 99)) 'T)
        ('T (SPADCALL |op| (QREFELT $ 7) (QREFELT $ 101))))) 

(DEFUN |IAN;convert;$If;17| (|x| $) (SPADCALL |x| (QREFELT $ 104))) 

(DEFUN |IAN;convert;$F;18| (|x| $)
  (SPADCALL (SPADCALL (ELT $ 107) |x| (QREFELT $ 111)) (QREFELT $ 112))) 

(DEFUN |IAN;convert;$Df;19| (|x| $)
  (SPADCALL (SPADCALL (ELT $ 115) |x| (QREFELT $ 119)) (QREFELT $ 120))) 

(DEFUN |IAN;convert;$C;20| (|x| $)
  (SPADCALL (SPADCALL (ELT $ 123) |x| (QREFELT $ 127)) (QREFELT $ 128))) 

(DECLAIM (NOTINLINE |InnerAlgebraicNumber;|)) 

(DEFUN |InnerAlgebraicNumber| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G188)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|InnerAlgebraicNumber|)
                . #2=(|InnerAlgebraicNumber|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|InnerAlgebraicNumber|
                         (LIST (CONS NIL (CONS 1 (|InnerAlgebraicNumber;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|InnerAlgebraicNumber|))))))))))) 

(DEFUN |InnerAlgebraicNumber;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|InnerAlgebraicNumber|) . #1=(|InnerAlgebraicNumber|))
      (LETT $ (GETREFV 158) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerAlgebraicNumber| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 1))
      (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
           (|augmentPredVector| $ 2))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|Expression| (|Integer|)))
      (QSETREFV $ 7 '|%alg|)
      $)))) 

(MAKEPROP '|InnerAlgebraicNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 11) '|Rep| 'ALGOP (|Matrix| 11)
              (|Matrix| $) (0 . |reducedSystem|) (|Integer|) (|Fraction| 11)
              (5 . |coerce|) (|Matrix| 12) (|Mapping| 12 11)
              (|MatrixCategoryFunctions2| 11 23 23 8 12 22 22 14) (10 . |map|)
              |IAN;reducedSystem;MM;1| (|Record| (|:| |mat| 8) (|:| |vec| 23))
              (|Vector| $) (16 . |reducedSystem|) (|Vector| 12) (|Vector| 11)
              (|VectorFunctions2| 11 12) (22 . |map|)
              (|Record| (|:| |mat| 14) (|:| |vec| 22))
              |IAN;reducedSystem;MVR;2| (|AlgebraicManipulations| 11 5)
              (28 . |ratDenom|) (33 . |Zero|) (37 . |Zero|)
              (|SparseUnivariatePolynomial| $$) (41 . |Zero|) (|Boolean|)
              (45 . =) (51 . |leadingCoefficient|)
              (|SparseMultivariatePolynomial| 11 82) (56 . |denom|)
              (61 . |coerce|) (66 . |One|) (70 . |One|) (74 . =)
              (80 . |reductum|) (85 . *) (91 . *)
              (|SparseUnivariatePolynomial| $) (|Kernel| $$)
              (|SparseMultivariatePolynomial| 11 47) (97 . |univariate|)
              (|Mapping| $$ 48) (|SparseUnivariatePolynomial| 48)
              (|SparseUnivariatePolynomialFunctions2| 48 $$) (103 . |map|)
              |IAN;differentiate;2$;6| (109 . |numer|) (114 . |zero?|)
              |IAN;zero?;$B;7| (119 . |One|) (123 . =) |IAN;one?;$B;8|
              (129 . /) |IAN;/;3$;9| (135 . ^) |IAN;^;$I$;10| (|List| 82)
              (141 . |tower|) (146 . |retract|) (151 . =)
              (|NonNegativeInteger|) (157 . |monomial|) (163 . -)
              |IAN;norm;SupLSup;15| (|SparseUnivariatePolynomial| 12)
              (|Mapping| 12 $$) (|SparseUnivariatePolynomialFunctions2| $$ 12)
              (169 . |map|) (175 . |squareFreePart|) (180 . =) (186 . |gcd|)
              (192 . |degree|) |IAN;trueEqual;2$B;11| (|Kernel| $)
              (197 . |minPoly|) (202 . |resultant|) |IAN;norm;$K$;12|
              |IAN;norm;$L$;13| (208 . |coerce|)
              (|SparseUnivariatePolynomial| 32) (|Mapping| 32 $$)
              (|SparseUnivariatePolynomialFunctions2| $$ 32) (213 . |map|)
              (|CommuteUnivariatePolynomialCategory| $$ 32 88) (219 . |swap|)
              (224 . |resultant|) (230 . /) |IAN;norm;SupKSup;14|
              (|BasicOperator|) (|ExpressionSpace&| $$) (236 . |belong?|)
              (|Symbol|) (241 . |has?|) |IAN;belong?;BoB;16| (|InputForm|)
              (247 . |convert|) |IAN;convert;$If;17| (|Float|) (252 . |coerce|)
              (|Expression| 106) (|Mapping| 106 11)
              (|ExpressionFunctions2| 11 106) (257 . |map|) (263 . |retract|)
              |IAN;convert;$F;18| (|DoubleFloat|) (268 . |coerce|)
              (|Expression| 114) (|Mapping| 114 11)
              (|ExpressionFunctions2| 11 114) (273 . |map|) (279 . |retract|)
              |IAN;convert;$Df;19| (|Complex| 106) (284 . |coerce|)
              (|Expression| 122) (|Mapping| 122 11)
              (|ExpressionFunctions2| 11 122) (289 . |map|) (295 . |retract|)
              |IAN;convert;$C;20| (|Union| 12 '#1="failed") (|Union| 11 '#1#)
              (|PositiveInteger|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 136) (|:| |generator| $))
              (|Union| 136 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 141 '"failed") (|Factored| $) (|Polynomial| $)
              (|Mapping| $ 136) (|Mapping| $ $) (|List| 97) (|List| 146)
              (|List| 145) (|List| 100) (|Union| 82 '"failed") (|List| 153)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 300 |zerosOf| 306 |zeroOf| 322 |zero?| 338 |unitNormal| 343
              |unitCanonical| 348 |unit?| 353 |trueEqual| 358 |tower| 364
              |subtractIfCan| 369 |subst| 375 |squareFreePart| 394 |squareFree|
              399 |sqrt| 404 |smaller?| 409 |sizeLess?| 415 |sample| 421
              |rootsOf| 425 |rootOf| 441 |retractIfCan| 457 |retract| 472 |rem|
              487 |reducedSystem| 493 |reduce| 515 |recip| 520 |quo| 525
              |principalIdeal| 531 |prime?| 536 |paren| 541 |operators| 551
              |operator| 556 |one?| 561 |odd?| 566 |numer| 571 |nthRoot| 576
              |norm| 582 |multiEuclidean| 606 |minPoly| 612 |map| 617
              |mainKernel| 623 |lcmCoef| 628 |lcm| 634 |latex| 645 |kernels|
              650 |kernel| 655 |is?| 667 |inv| 679 |height| 684 |hashUpdate!|
              689 |hash| 695 |gcdPolynomial| 700 |gcd| 706 |freeOf?| 717
              |factor| 729 |extendedEuclidean| 734 |exquo| 747
              |expressIdealMember| 753 |even?| 759 |eval| 764 |euclideanSize|
              860 |elt| 865 |divide| 961 |distribute| 967 |differentiate| 978
              |denom| 989 |definingPolynomial| 994 |convert| 999 |coerce| 1019
              |characteristic| 1049 |box| 1053 |belong?| 1063 |associates?|
              1068 ^ 1074 |Zero| 1098 |One| 1102 D 1106 = 1117 / 1123 - 1129 +
              1140 * 1146)
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
                NIL NIL NIL |AbelianGroup&| NIL NIL |ExpressionSpace&|
                |Monoid&| NIL |AbelianMonoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| NIL |SetCategory&| |Evalable&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| |RadicalCategory&| NIL
                NIL NIL NIL NIL |BasicType&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL)
             (CONS
              '#((|AlgebraicallyClosedField|) (|Field|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 12) (|LeftOreRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 12)
                 (|LinearlyExplicitRingOver| 11) (|Module| 12) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|BiModule| 12 12)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 12)
                 (|LeftModule| 12) (|LeftModule| $$) (|RightModule| $$) (|Rng|)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|ExpressionSpace|) (|Monoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|Evalable| $$)
                 (|ConvertibleTo| 103) (|ConvertibleTo| 122)
                 (|ConvertibleTo| 106) (|ConvertibleTo| 114)
                 (|RetractableTo| 12) (|RetractableTo| 11) (|RadicalCategory|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|InnerEvalable| $$ $$) (|InnerEvalable| 47 $$)
                 (|RetractableTo| 47) (|CoercibleTo| 157))
              (|makeByteWordVec2| 157
                                  '(1 6 8 9 10 1 12 0 11 13 2 16 14 15 8 17 2 6
                                    19 9 20 21 2 24 22 15 23 25 1 28 5 5 29 0 0
                                    0 30 0 6 0 31 0 32 0 33 2 32 34 0 0 35 1 32
                                    2 0 36 1 0 37 0 38 1 0 0 37 39 0 0 0 40 0 6
                                    0 41 2 0 34 0 0 42 1 32 0 0 43 2 32 0 2 0
                                    44 2 0 0 0 0 45 2 48 46 0 47 49 2 52 32 50
                                    51 53 1 0 37 0 55 1 48 34 0 56 0 48 0 58 2
                                    48 34 0 0 59 2 6 0 0 0 61 2 6 0 0 11 63 1 0
                                    65 0 66 1 0 12 0 67 2 12 34 0 0 68 2 32 0 2
                                    69 70 2 32 0 0 0 71 2 75 73 74 32 76 1 73 0
                                    0 77 2 73 34 0 0 78 2 73 0 0 0 79 1 73 69 0
                                    80 1 0 46 82 83 2 32 2 0 0 84 1 32 0 2 87 2
                                    90 88 89 32 91 1 92 88 88 93 2 88 32 0 0 94
                                    2 32 0 0 2 95 1 98 34 97 99 2 97 34 0 100
                                    101 1 6 103 0 104 1 106 0 11 107 2 110 108
                                    109 5 111 1 108 106 0 112 1 114 0 11 115 2
                                    118 116 117 5 119 1 116 114 0 120 1 122 0
                                    11 123 2 126 124 125 5 127 1 124 122 0 128
                                    2 0 34 0 0 1 1 0 136 46 1 1 0 136 144 1 2 0
                                    136 46 100 1 1 0 0 46 1 1 0 0 144 1 2 0 0
                                    46 100 1 1 0 34 0 57 1 0 134 0 1 1 0 0 0 1
                                    1 0 34 0 1 2 0 34 0 0 81 1 0 65 0 66 2 0
                                    133 0 0 1 2 0 0 0 152 1 3 0 0 0 65 136 1 2
                                    0 0 0 153 1 1 0 0 0 1 1 0 143 0 1 1 0 0 0 1
                                    2 0 34 0 0 1 2 0 34 0 0 1 0 0 0 1 1 0 136
                                    144 1 2 0 136 46 100 1 1 0 136 46 1 1 0 0
                                    144 1 2 0 0 46 100 1 1 0 0 46 1 1 0 130 0 1
                                    1 0 131 0 1 1 0 151 0 1 1 0 12 0 67 1 0 11
                                    0 1 1 0 82 0 1 2 0 0 0 0 1 1 0 14 9 18 2 0
                                    26 9 20 27 1 0 8 9 1 2 0 19 9 20 1 1 0 0 0
                                    1 1 0 133 0 1 2 0 0 0 0 1 1 0 137 136 1 1 0
                                    34 0 1 1 0 0 136 1 1 0 0 0 1 1 0 147 0 1 1
                                    0 97 97 1 1 0 34 0 60 1 2 34 0 1 1 0 37 0
                                    55 2 0 0 0 11 1 2 0 0 0 82 85 2 0 0 0 65 86
                                    2 0 46 46 82 96 2 0 46 46 65 72 2 0 138 136
                                    0 1 1 1 46 82 83 2 0 0 146 82 1 1 0 151 0 1
                                    2 0 135 0 0 1 2 0 0 0 0 1 1 0 0 136 1 1 0
                                    154 0 1 1 0 65 0 1 2 0 0 97 136 1 2 0 0 97
                                    0 1 2 0 34 0 100 1 2 0 34 0 97 1 1 0 0 0 1
                                    1 0 69 0 1 2 0 156 156 0 1 1 0 155 0 1 2 0
                                    46 46 46 1 2 0 0 0 0 1 1 0 0 136 1 2 0 34 0
                                    100 1 2 0 34 0 0 1 1 0 143 0 1 2 0 140 0 0
                                    1 3 0 142 0 0 0 1 2 0 133 0 0 1 2 0 138 136
                                    0 1 1 2 34 0 1 3 0 0 0 97 145 1 3 0 0 0 97
                                    146 1 3 0 0 0 147 148 1 3 0 0 0 147 149 1 3
                                    0 0 0 100 145 1 3 0 0 0 100 146 1 3 0 0 0
                                    150 149 1 3 0 0 0 150 148 1 3 0 0 0 136 136
                                    1 2 0 0 0 153 1 3 0 0 0 0 0 1 2 0 0 0 152 1
                                    3 0 0 0 82 0 1 3 0 0 0 65 136 1 1 0 69 0 1
                                    10 0 0 97 0 0 0 0 0 0 0 0 0 1 2 0 0 97 136
                                    1 8 0 0 97 0 0 0 0 0 0 0 1 9 0 0 97 0 0 0 0
                                    0 0 0 0 1 7 0 0 97 0 0 0 0 0 0 1 5 0 0 97 0
                                    0 0 0 1 6 0 0 97 0 0 0 0 0 1 3 0 0 97 0 0 1
                                    4 0 0 97 0 0 0 1 2 0 0 97 0 1 2 0 139 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 54 2 0 0 0 69
                                    1 1 0 37 0 38 1 1 0 0 1 1 0 122 0 129 1 0
                                    103 0 105 1 0 114 0 121 1 0 106 0 113 1 0 0
                                    37 39 1 0 0 11 1 1 0 0 0 1 1 0 0 12 1 1 0 0
                                    82 1 1 0 157 0 1 0 0 69 1 1 0 0 0 1 1 0 0
                                    136 1 1 0 34 97 102 2 0 34 0 0 1 2 0 0 0
                                    132 1 2 0 0 0 69 1 2 0 0 0 11 64 2 0 0 0 12
                                    1 0 0 0 30 0 0 0 40 1 0 0 0 1 2 0 0 0 69 1
                                    2 0 34 0 0 42 2 0 0 0 0 62 2 0 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 132 0 1 2 0 0 69 0
                                    1 2 0 0 11 0 1 2 0 0 0 0 45 2 0 0 0 12 1 2
                                    0 0 12 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|InnerAlgebraicNumber| 'NILADIC T) 
