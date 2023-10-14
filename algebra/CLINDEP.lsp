
(SDEFUN |CLINDEP;kmap| ((|k| |Kernel| F) ($ |Expression| F))
        (SPROG
         ((#1=#:G115 NIL) (|a| NIL) (#2=#:G114 NIL) (|op| (|BasicOperator|))
          (#3=#:G112 NIL) (|is_const| (|Boolean|)) (#4=#:G113 NIL) (|d| NIL)
          (|kf| (F)))
         (SEQ (LETT |is_const| 'T . #5=(|CLINDEP;kmap|))
              (LETT |kf| (SPADCALL |k| (QREFELT $ 10)) . #5#)
              (SEQ
               (EXIT
                (SEQ (LETT |d| NIL . #5#) (LETT #4# (QREFELT $ 8) . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |kf| |d|) (|spadConstant| $ 11)
                                   (QREFELT $ 13))
                         (SEQ (LETT |is_const| 'NIL . #5#)
                              (EXIT
                               (PROGN
                                (LETT #3# |$NoValue| . #5#)
                                (GO #6=#:G107))))))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #3#))
              (EXIT
               (COND (|is_const| (SPADCALL |kf| (QREFELT $ 15)))
                     ('T
                      (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 18)) . #5#)
                           (EXIT
                            (SPADCALL |op|
                                      (PROGN
                                       (LETT #2# NIL . #5#)
                                       (SEQ (LETT |a| NIL . #5#)
                                            (LETT #1#
                                                  (SPADCALL |k| (QREFELT $ 20))
                                                  . #5#)
                                            G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |a| (CAR #1#) . #5#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (|CLINDEP;F_to_EF| |a| $)
                                                     #2#)
                                                    . #5#)))
                                            (LETT #1# (CDR #1#) . #5#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 22)))))))))) 

(SDEFUN |CLINDEP;F_to_EF| ((|f| F) ($ |Expression| F))
        (SPADCALL
         (SPADCALL (CONS (|function| |CLINDEP;kmap|) $)
                   (CONS #'|CLINDEP;F_to_EF!0| $) (SPADCALL |f| (QREFELT $ 25))
                   (QREFELT $ 30))
         (SPADCALL (CONS (|function| |CLINDEP;kmap|) $)
                   (CONS #'|CLINDEP;F_to_EF!1| $) (SPADCALL |f| (QREFELT $ 31))
                   (QREFELT $ 30))
         (QREFELT $ 32))) 

(SDEFUN |CLINDEP;F_to_EF!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 23)) (QREFELT $ 15))) 

(SDEFUN |CLINDEP;F_to_EF!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 23)) (QREFELT $ 15))) 

(SDEFUN |CLINDEP;VF_to_VEF| ((|v| |Vector| F) ($ |Vector| (|Expression| F)))
        (SPADCALL (CONS (|function| |CLINDEP;F_to_EF|) $) |v| (QREFELT $ 37))) 

(SDEFUN |CLINDEP;MF_to_MEF| ((|m| |Matrix| F) ($ |Matrix| (|Expression| F)))
        (SPADCALL (CONS (|function| |CLINDEP;F_to_EF|) $) |m| (QREFELT $ 41))) 

(SDEFUN |CLINDEP;linearlyDependentOverConstants?;VB;5|
        ((|v| |Vector| F) ($ |Boolean|))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (QREFELT $ 43))) 

(SDEFUN |CLINDEP;linearDependenceOverConstants;VU;6|
        ((|v| |Vector| F) ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (QREFELT $ 46))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;VFU;7|
        ((|v| |Vector| F) (|u| F) ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (|CLINDEP;F_to_EF| |u| $)
                  (QREFELT $ 48))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;MVU;8|
        ((|m| |Matrix| F) (|v| |Vector| F) ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (|CLINDEP;VF_to_VEF| |v| $)
                  (QREFELT $ 50))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;VFR;9|
        ((|v| |Vector| F) (|u| F)
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (|CLINDEP;F_to_EF| |u| $)
                  (QREFELT $ 53))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;MVR;10|
        ((|m| |Matrix| F) (|v| |Vector| F)
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (|CLINDEP;VF_to_VEF| |v| $)
                  (QREFELT $ 55))) 

(SDEFUN |CLINDEP;reducedSystem;2M;11| ((|m| |Matrix| F) ($ |Matrix| F))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (QREFELT $ 58))) 

(SDEFUN |CLINDEP;reducedSystem;MVR;12|
        ((|m| |Matrix| F) (|v| |Vector| F)
         ($ |Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (|CLINDEP;VF_to_VEF| |v| $)
                  (QREFELT $ 62))) 

(DECLAIM (NOTINLINE |ConstantLinearDependence;|)) 

(DEFUN |ConstantLinearDependence| (&REST #1=#:G146)
  (SPROG NIL
         (PROG (#2=#:G147)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ConstantLinearDependence|)
                                               '|domainEqualList|)
                    . #3=(|ConstantLinearDependence|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ConstantLinearDependence;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ConstantLinearDependence|)))))))))) 

(DEFUN |ConstantLinearDependence;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ConstantLinearDependence|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ConstantLinearDependence| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 64) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ConstantLinearDependence|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ConstantLinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Kernel| $) (0 . |coerce|) (5 . |Zero|)
              (|Boolean|) (9 . ~=) (|Expression| 7) (15 . |coerce|)
              (|BasicOperator|) (|Kernel| 7) (20 . |operator|) (|List| 7)
              (25 . |argument|) (|List| $) (30 . |kernel|) (36 . |coerce|)
              (|SparseMultivariatePolynomial| 6 9) (41 . |numer|)
              (|Mapping| 14 17) (|Mapping| 14 6)
              (|SparseMultivariatePolynomial| 6 17)
              (|PolynomialCategoryLifting| (|IndexedExponents| 17) 17 6 28 14)
              (46 . |map|) (53 . |denom|) (58 . /) (|Vector| 14)
              (|Mapping| 14 7) (|Vector| 7) (|VectorFunctions2| 7 14)
              (64 . |map|) (|Matrix| 14) (|Matrix| 7)
              (|TwoDimensionalArrayFunctions| 7 35 35 39 14 33 33 38)
              (70 . |map|) (|LinearDependence| 7 14)
              (76 . |linearlyDependent?|)
              |CLINDEP;linearlyDependentOverConstants?;VB;5|
              (|Union| 35 '"failed") (81 . |linearDependence|)
              |CLINDEP;linearDependenceOverConstants;VU;6|
              (86 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;VFU;7|
              (92 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;MVU;8|
              (|Record| (|:| |particular| 45) (|:| |basis| (|List| 35)))
              (98 . |solveLinear|) |CLINDEP;solveLinearOverConstants;VFR;9|
              (104 . |solveLinear|) |CLINDEP;solveLinearOverConstants;MVR;10|
              (|Matrix| $) (110 . |reducedSystem|)
              |CLINDEP;reducedSystem;2M;11|
              (|Record| (|:| |mat| 39) (|:| |vec| 35)) (|Vector| $)
              (115 . |reducedSystem|) |CLINDEP;reducedSystem;MVR;12|)
           '#(|solveLinearOverConstants| 121 |reducedSystem| 133
              |particularSolutionOverConstants| 144
              |linearlyDependentOverConstants?| 156
              |linearDependenceOverConstants| 161)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 63
                                                 '(1 7 0 9 10 0 7 0 11 2 7 12 0
                                                   0 13 1 14 0 7 15 1 17 16 0
                                                   18 1 17 19 0 20 2 14 0 16 21
                                                   22 1 7 0 6 23 1 7 24 0 25 3
                                                   29 14 26 27 28 30 1 7 24 0
                                                   31 2 14 0 0 0 32 2 36 33 34
                                                   35 37 2 40 38 34 39 41 1 42
                                                   12 33 43 1 42 45 33 46 2 42
                                                   45 33 14 48 2 42 45 38 33 50
                                                   2 42 52 33 14 53 2 42 52 38
                                                   33 55 1 14 39 57 58 2 14 60
                                                   57 61 62 2 0 52 39 35 56 2 0
                                                   52 35 7 54 1 0 39 39 59 2 0
                                                   60 39 35 63 2 0 45 39 35 51
                                                   2 0 45 35 7 49 1 0 12 35 44
                                                   1 0 45 35 47)))))
           '|lookupComplete|)) 
