
(SDEFUN |CLINDEP;kmap|
        ((|k| |Kernel| F) (|ldmvar| |List| (|Kernel| F))
         (|ldmval| |List| (|Expression| F)) ($ |Expression| F))
        (SPROG
         ((#1=#:G132 NIL) (|a| NIL) (#2=#:G131 NIL)
          (|kmap1| (|Mapping| (|Expression| F) (|Kernel| F)))
          (|da2| #3=(|Kernel| F)) (|da| #3#) (|n| (|NonNegativeInteger|))
          (|u| (|Union| (|None|) "failed")) (|args| (|List| F))
          (|op| (|BasicOperator|)) (#4=#:G126 NIL) (|is_const| (|Boolean|))
          (#5=#:G130 NIL) (|d| NIL) (|kf| (F)) (#6=#:G127 NIL) (#7=#:G128 NIL)
          (|dmvar| NIL) (#8=#:G129 NIL) (|dmval| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |dmval| NIL . #9=(|CLINDEP;kmap|))
                 (LETT #8# |ldmval| . #9#) (LETT |dmvar| NIL . #9#)
                 (LETT #7# |ldmvar| . #9#) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |dmvar| (CAR #7#) . #9#) NIL)
                       (ATOM #8#) (PROGN (LETT |dmval| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |dmvar| (QREFELT $ 12))
                     (PROGN (LETT #6# |dmval| . #9#) (GO #10=#:G125))))))
                 (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#)) . #9#)
                 (GO G190) G191 (EXIT NIL))
            (LETT |is_const| 'T . #9#)
            (LETT |kf| (SPADCALL |k| (QREFELT $ 14)) . #9#)
            (SEQ
             (EXIT
              (SEQ (LETT |d| NIL . #9#) (LETT #5# (QREFELT $ 8) . #9#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |kf| |d|) (|spadConstant| $ 15)
                                 (QREFELT $ 16))
                       (SEQ (LETT |is_const| 'NIL . #9#)
                            (EXIT
                             (PROGN
                              (LETT #4# |$NoValue| . #9#)
                              (GO #11=#:G110))))))))
                   (LETT #5# (CDR #5#) . #9#) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #4#))
            (EXIT
             (COND (|is_const| (SPADCALL |kf| (QREFELT $ 18)))
                   ('T
                    (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 20)) . #9#)
                         (LETT |args| (SPADCALL |k| (QREFELT $ 22)) . #9#)
                         (SEQ
                          (LETT |u|
                                (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 25))
                                . #9#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 0)
                             (SEQ (LETT |n| (QCDR |u|) . #9#)
                                  (LETT |da|
                                        (SPADCALL
                                         (SPADCALL |args| (QREFELT $ 26))
                                         (QREFELT $ 27))
                                        . #9#)
                                  (COND
                                   ((NULL
                                     (SPADCALL |da| |ldmvar| (QREFELT $ 29)))
                                    (SEQ
                                     (LETT |ldmvar| (CONS |da| |ldmvar|) . #9#)
                                     (EXIT
                                      (LETT |ldmval|
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 30))
                                              (QREFELT $ 31))
                                             |ldmval|)
                                            . #9#)))))
                                  (EXIT
                                   (COND
                                    ((EQL |n| 2)
                                     (SEQ
                                      (LETT |da2|
                                            (SPADCALL
                                             (SPADCALL |args| 3 (QREFELT $ 33))
                                             (QREFELT $ 27))
                                            . #9#)
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL |da2| |ldmvar|
                                                    (QREFELT $ 29)))
                                         (SEQ
                                          (LETT |ldmvar| (CONS |da2| |ldmvar|)
                                                . #9#)
                                          (EXIT
                                           (LETT |ldmval|
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 30))
                                                   (QREFELT $ 31))
                                                  |ldmval|)
                                                 . #9#)))))))))))))))
                         (LETT |kmap1|
                               (CONS #'|CLINDEP;kmap!0|
                                     (VECTOR $ |ldmval| |ldmvar|))
                               . #9#)
                         (EXIT
                          (SPADCALL |op|
                                    (PROGN
                                     (LETT #2# NIL . #9#)
                                     (SEQ (LETT |a| NIL . #9#)
                                          (LETT #1#
                                                (SPADCALL |k| (QREFELT $ 22))
                                                . #9#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |a| (CAR #1#) . #9#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (|CLINDEP;F_to_EF1| |a|
                                                    |kmap1| $)
                                                   #2#)
                                                  . #9#)))
                                          (LETT #1# (CDR #1#) . #9#) (GO G190)
                                          G191 (EXIT (NREVERSE #2#))))
                                    (QREFELT $ 35)))))))))
          #10# (EXIT #6#)))) 

(SDEFUN |CLINDEP;kmap!0| ((|kk| NIL) ($$ NIL))
        (PROG (|ldmvar| |ldmval| $)
          (LETT |ldmvar| (QREFELT $$ 2) . #1=(|CLINDEP;kmap|))
          (LETT |ldmval| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;kmap| |kk| |ldmvar| |ldmval| $))))) 

(SDEFUN |CLINDEP;F_to_EF1|
        ((|f| F) (|kmap1| |Mapping| (|Expression| F) (|Kernel| F))
         ($ |Expression| F))
        (SPADCALL
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!0| $)
                   (SPADCALL |f| (QREFELT $ 38)) (QREFELT $ 43))
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!1| $)
                   (SPADCALL |f| (QREFELT $ 44)) (QREFELT $ 43))
         (QREFELT $ 45))) 

(SDEFUN |CLINDEP;F_to_EF1!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 36)) (QREFELT $ 18))) 

(SDEFUN |CLINDEP;F_to_EF1!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 36)) (QREFELT $ 18))) 

(SDEFUN |CLINDEP;F_to_EF| ((|f| F) ($ |Expression| F))
        (|CLINDEP;F_to_EF1| |f| (CONS #'|CLINDEP;F_to_EF!0| $) $)) 

(SDEFUN |CLINDEP;F_to_EF!0| ((|k| NIL) ($ NIL)) (|CLINDEP;kmap| |k| NIL NIL $)) 

(SDEFUN |CLINDEP;VF_to_VEF| ((|v| |Vector| F) ($ |Vector| (|Expression| F)))
        (SPADCALL (CONS (|function| |CLINDEP;F_to_EF|) $) |v| (QREFELT $ 50))) 

(SDEFUN |CLINDEP;MF_to_MEF| ((|m| |Matrix| F) ($ |Matrix| (|Expression| F)))
        (SPADCALL (CONS (|function| |CLINDEP;F_to_EF|) $) |m| (QREFELT $ 54))) 

(SDEFUN |CLINDEP;linearlyDependentOverConstants?;VB;6|
        ((|v| |Vector| F) ($ |Boolean|))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (QREFELT $ 56))) 

(SDEFUN |CLINDEP;linearDependenceOverConstants;VU;7|
        ((|v| |Vector| F) ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (QREFELT $ 59))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;VFU;8|
        ((|v| |Vector| F) (|u| F) ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (|CLINDEP;F_to_EF| |u| $)
                  (QREFELT $ 61))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;MVU;9|
        ((|m| |Matrix| F) (|v| |Vector| F) ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (|CLINDEP;VF_to_VEF| |v| $)
                  (QREFELT $ 63))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;VFR;10|
        ((|v| |Vector| F) (|u| F)
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| $) (|CLINDEP;F_to_EF| |u| $)
                  (QREFELT $ 66))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;MVR;11|
        ((|m| |Matrix| F) (|v| |Vector| F)
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (|CLINDEP;VF_to_VEF| |v| $)
                  (QREFELT $ 68))) 

(SDEFUN |CLINDEP;reducedSystem;2M;12| ((|m| |Matrix| F) ($ |Matrix| F))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (QREFELT $ 71))) 

(SDEFUN |CLINDEP;reducedSystem;MVR;13|
        ((|m| |Matrix| F) (|v| |Vector| F)
         ($ |Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| $) (|CLINDEP;VF_to_VEF| |v| $)
                  (QREFELT $ 75))) 

(DECLAIM (NOTINLINE |ConstantLinearDependence;|)) 

(DEFUN |ConstantLinearDependence| (&REST #1=#:G165)
  (SPROG NIL
         (PROG (#2=#:G166)
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
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ConstantLinearDependence|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 '|%dummyVar|)
          $))) 

(MAKEPROP '|ConstantLinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'DUMMYVAR (|Boolean|) (|Kernel| 7) (0 . =)
              (|Kernel| $) (6 . |coerce|) (11 . |Zero|) (15 . ~=)
              (|Expression| 7) (21 . |coerce|) (|BasicOperator|)
              (26 . |operator|) (|List| 7) (31 . |argument|)
              (|Union| (|None|) '"failed") (|Symbol|) (36 . |property|)
              (42 . |second|) (47 . |retract|) (|List| 11) (52 . |member?|)
              (58 . |new|) (62 . |coerce|) (|Integer|) (67 . |elt|) (|List| $)
              (73 . |kernel|) (79 . |coerce|)
              (|SparseMultivariatePolynomial| 6 13) (84 . |numer|)
              (|Mapping| 17 11) (|Mapping| 17 6)
              (|SparseMultivariatePolynomial| 6 11)
              (|PolynomialCategoryLifting| (|IndexedExponents| 11) 11 6 41 17)
              (89 . |map|) (96 . |denom|) (101 . /) (|Vector| 17)
              (|Mapping| 17 7) (|Vector| 7) (|VectorFunctions2| 7 17)
              (107 . |map|) (|Matrix| 17) (|Matrix| 7)
              (|TwoDimensionalArrayFunctions| 7 48 48 52 17 46 46 51)
              (113 . |map|) (|LinearDependence| 7 17)
              (119 . |linearlyDependent?|)
              |CLINDEP;linearlyDependentOverConstants?;VB;6|
              (|Union| 48 '"failed") (124 . |linearDependence|)
              |CLINDEP;linearDependenceOverConstants;VU;7|
              (129 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;VFU;8|
              (135 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;MVU;9|
              (|Record| (|:| |particular| 58) (|:| |basis| (|List| 48)))
              (141 . |solveLinear|) |CLINDEP;solveLinearOverConstants;VFR;10|
              (147 . |solveLinear|) |CLINDEP;solveLinearOverConstants;MVR;11|
              (|Matrix| $) (153 . |reducedSystem|)
              |CLINDEP;reducedSystem;2M;12|
              (|Record| (|:| |mat| 52) (|:| |vec| 48)) (|Vector| $)
              (158 . |reducedSystem|) |CLINDEP;reducedSystem;MVR;13|)
           '#(|solveLinearOverConstants| 164 |reducedSystem| 176
              |particularSolutionOverConstants| 187
              |linearlyDependentOverConstants?| 199
              |linearDependenceOverConstants| 204)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(2 11 10 0 0 12 1 7 0 13 14 0
                                                   7 0 15 2 7 10 0 0 16 1 17 0
                                                   7 18 1 11 19 0 20 1 11 21 0
                                                   22 2 19 23 0 24 25 1 21 7 0
                                                   26 1 7 13 0 27 2 28 10 11 0
                                                   29 0 24 0 30 1 17 0 24 31 2
                                                   21 7 0 32 33 2 17 0 19 34 35
                                                   1 7 0 6 36 1 7 37 0 38 3 42
                                                   17 39 40 41 43 1 7 37 0 44 2
                                                   17 0 0 0 45 2 49 46 47 48 50
                                                   2 53 51 47 52 54 1 55 10 46
                                                   56 1 55 58 46 59 2 55 58 46
                                                   17 61 2 55 58 51 46 63 2 55
                                                   65 46 17 66 2 55 65 51 46 68
                                                   1 17 52 70 71 2 17 73 70 74
                                                   75 2 0 65 52 48 69 2 0 65 48
                                                   7 67 1 0 52 52 72 2 0 73 52
                                                   48 76 2 0 58 52 48 64 2 0 58
                                                   48 7 62 1 0 10 48 57 1 0 58
                                                   48 60)))))
           '|lookupComplete|)) 
