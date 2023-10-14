
(SDEFUN |CLINDEP;kmap|
        ((|k| |Kernel| F) (|ldmvar| |List| (|Kernel| F))
         (|ldmval| |List| (|Expression| F)) (|ld| |List| (|Mapping| F F))
         ($ |Expression| F))
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
                    ((SPADCALL |k| |dmvar| (QREFELT $ 11))
                     (PROGN (LETT #6# |dmval| . #9#) (GO #10=#:G125))))))
                 (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#)) . #9#)
                 (GO G190) G191 (EXIT NIL))
            (LETT |is_const| 'T . #9#)
            (LETT |kf| (SPADCALL |k| (QREFELT $ 13)) . #9#)
            (SEQ
             (EXIT
              (SEQ (LETT |d| NIL . #9#) (LETT #5# |ld| . #9#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |kf| |d|) (|spadConstant| $ 14)
                                 (QREFELT $ 15))
                       (SEQ (LETT |is_const| 'NIL . #9#)
                            (EXIT
                             (PROGN
                              (LETT #4# |$NoValue| . #9#)
                              (GO #11=#:G110))))))))
                   (LETT #5# (CDR #5#) . #9#) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #4#))
            (EXIT
             (COND (|is_const| (SPADCALL |kf| (QREFELT $ 17)))
                   ('T
                    (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 19)) . #9#)
                         (LETT |args| (SPADCALL |k| (QREFELT $ 21)) . #9#)
                         (SEQ
                          (LETT |u|
                                (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 24))
                                . #9#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 0)
                             (SEQ (LETT |n| (QCDR |u|) . #9#)
                                  (LETT |da|
                                        (SPADCALL
                                         (SPADCALL |args| (QREFELT $ 25))
                                         (QREFELT $ 26))
                                        . #9#)
                                  (COND
                                   ((NULL
                                     (SPADCALL |da| |ldmvar| (QREFELT $ 28)))
                                    (SEQ
                                     (LETT |ldmvar| (CONS |da| |ldmvar|) . #9#)
                                     (EXIT
                                      (LETT |ldmval|
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 29))
                                              (QREFELT $ 30))
                                             |ldmval|)
                                            . #9#)))))
                                  (EXIT
                                   (COND
                                    ((EQL |n| 2)
                                     (SEQ
                                      (LETT |da2|
                                            (SPADCALL
                                             (SPADCALL |args| 3 (QREFELT $ 32))
                                             (QREFELT $ 26))
                                            . #9#)
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL |da2| |ldmvar|
                                                    (QREFELT $ 28)))
                                         (SEQ
                                          (LETT |ldmvar| (CONS |da2| |ldmvar|)
                                                . #9#)
                                          (EXIT
                                           (LETT |ldmval|
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 29))
                                                   (QREFELT $ 30))
                                                  |ldmval|)
                                                 . #9#)))))))))))))))
                         (LETT |kmap1|
                               (CONS #'|CLINDEP;kmap!0|
                                     (VECTOR $ |ld| |ldmval| |ldmvar|))
                               . #9#)
                         (EXIT
                          (SPADCALL |op|
                                    (PROGN
                                     (LETT #2# NIL . #9#)
                                     (SEQ (LETT |a| NIL . #9#)
                                          (LETT #1#
                                                (SPADCALL |k| (QREFELT $ 21))
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
                                    (QREFELT $ 34)))))))))
          #10# (EXIT #6#)))) 

(SDEFUN |CLINDEP;kmap!0| ((|kk| NIL) ($$ NIL))
        (PROG (|ldmvar| |ldmval| |ld| $)
          (LETT |ldmvar| (QREFELT $$ 3) . #1=(|CLINDEP;kmap|))
          (LETT |ldmval| (QREFELT $$ 2) . #1#)
          (LETT |ld| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;kmap| |kk| |ldmvar| |ldmval| |ld| $))))) 

(SDEFUN |CLINDEP;F_to_EF1|
        ((|f| F) (|kmap1| |Mapping| (|Expression| F) (|Kernel| F))
         ($ |Expression| F))
        (SPADCALL
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!0| $)
                   (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 42))
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!1| $)
                   (SPADCALL |f| (QREFELT $ 43)) (QREFELT $ 42))
         (QREFELT $ 44))) 

(SDEFUN |CLINDEP;F_to_EF1!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 35)) (QREFELT $ 17))) 

(SDEFUN |CLINDEP;F_to_EF1!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 35)) (QREFELT $ 17))) 

(SDEFUN |CLINDEP;F_to_EF|
        ((|f| F) (|ld| |List| (|Mapping| F F)) ($ |Expression| F))
        (SPROG NIL
               (|CLINDEP;F_to_EF1| |f|
                (CONS #'|CLINDEP;F_to_EF!0| (VECTOR $ |ld|)) $))) 

(SDEFUN |CLINDEP;F_to_EF!0| ((|k| NIL) ($$ NIL))
        (PROG (|ld| $)
          (LETT |ld| (QREFELT $$ 1) . #1=(|CLINDEP;F_to_EF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;kmap| |k| NIL NIL |ld| $))))) 

(SDEFUN |CLINDEP;VF_to_VEF|
        ((|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Vector| (|Expression| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|CLINDEP;VF_to_VEF!0| (VECTOR $ |ld|)) |v|
                         (QREFELT $ 49)))) 

(SDEFUN |CLINDEP;VF_to_VEF!0| ((|x| NIL) ($$ NIL))
        (PROG (|ld| $)
          (LETT |ld| (QREFELT $$ 1) . #1=(|CLINDEP;VF_to_VEF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;F_to_EF| |x| |ld| $))))) 

(SDEFUN |CLINDEP;MF_to_MEF|
        ((|m| |Matrix| F) (|ld| |List| (|Mapping| F F))
         ($ |Matrix| (|Expression| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|CLINDEP;MF_to_MEF!0| (VECTOR $ |ld|)) |m|
                         (QREFELT $ 53)))) 

(SDEFUN |CLINDEP;MF_to_MEF!0| ((|x| NIL) ($$ NIL))
        (PROG (|ld| $)
          (LETT |ld| (QREFELT $$ 1) . #1=(|CLINDEP;MF_to_MEF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;F_to_EF| |x| |ld| $))))) 

(SDEFUN |CLINDEP;linearlyDependentOverConstants?;VLB;6|
        ((|v| |Vector| F) (|ld| |List| (|Mapping| F F)) ($ |Boolean|))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 55))) 

(SDEFUN |CLINDEP;linearDependenceOverConstants;VLU;7|
        ((|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 60))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;VFLU;8|
        ((|v| |Vector| F) (|u| F) (|ld| |List| (|Mapping| F F))
         ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $)
                  (|CLINDEP;F_to_EF| |u| |ld| $) (QREFELT $ 62))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;MVLU;9|
        ((|m| |Matrix| F) (|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $)
                  (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 64))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;VFLR;10|
        ((|v| |Vector| F) (|u| F) (|ld| |List| (|Mapping| F F))
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $)
                  (|CLINDEP;F_to_EF| |u| |ld| $) (QREFELT $ 67))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;MVLR;11|
        ((|m| |Matrix| F) (|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $)
                  (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 69))) 

(SDEFUN |CLINDEP;reducedSystem;MLM;12|
        ((|m| |Matrix| F) (|ld| |List| (|Mapping| F F)) ($ |Matrix| F))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $) (QREFELT $ 72))) 

(SDEFUN |CLINDEP;reducedSystem;MVLR;13|
        ((|m| |Matrix| F) (|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $)
                  (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 76))) 

(DECLAIM (NOTINLINE |ConstantLinearDependence;|)) 

(DEFUN |ConstantLinearDependence| (&REST #1=#:G167)
  (SPROG NIL
         (PROG (#2=#:G168)
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

(DEFUN |ConstantLinearDependence;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ConstantLinearDependence|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ConstantLinearDependence| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 78) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ConstantLinearDependence|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%dummyVar|)
          $))) 

(MAKEPROP '|ConstantLinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'DUMMYVAR
              (|Boolean|) (|Kernel| 7) (0 . =) (|Kernel| $) (6 . |coerce|)
              (11 . |Zero|) (15 . ~=) (|Expression| 7) (21 . |coerce|)
              (|BasicOperator|) (26 . |operator|) (|List| 7) (31 . |argument|)
              (|Union| (|None|) '"failed") (|Symbol|) (36 . |property|)
              (42 . |second|) (47 . |retract|) (|List| 10) (52 . |member?|)
              (58 . |new|) (62 . |coerce|) (|Integer|) (67 . |elt|) (|List| $)
              (73 . |kernel|) (79 . |coerce|)
              (|SparseMultivariatePolynomial| 6 12) (84 . |numer|)
              (|Mapping| 16 10) (|Mapping| 16 6)
              (|SparseMultivariatePolynomial| 6 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 10) 10 6 40 16)
              (89 . |map|) (96 . |denom|) (101 . /) (|Vector| 16)
              (|Mapping| 16 7) (|Vector| 7) (|VectorFunctions2| 7 16)
              (107 . |map|) (|Matrix| 16) (|Matrix| 7)
              (|TwoDimensionalArrayFunctions| 7 47 47 51 16 45 45 50)
              (113 . |map|) (|LinearDependence| 7 16)
              (119 . |linearlyDependent?|) (|Mapping| 7 7) (|List| 56)
              |CLINDEP;linearlyDependentOverConstants?;VLB;6|
              (|Union| 47 '"failed") (124 . |linearDependence|)
              |CLINDEP;linearDependenceOverConstants;VLU;7|
              (129 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;VFLU;8|
              (135 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;MVLU;9|
              (|Record| (|:| |particular| 59) (|:| |basis| (|List| 47)))
              (141 . |solveLinear|) |CLINDEP;solveLinearOverConstants;VFLR;10|
              (147 . |solveLinear|) |CLINDEP;solveLinearOverConstants;MVLR;11|
              (|Matrix| $) (153 . |reducedSystem|)
              |CLINDEP;reducedSystem;MLM;12|
              (|Record| (|:| |mat| 51) (|:| |vec| 47)) (|Vector| $)
              (158 . |reducedSystem|) |CLINDEP;reducedSystem;MVLR;13|)
           '#(|solveLinearOverConstants| 164 |reducedSystem| 178
              |particularSolutionOverConstants| 191
              |linearlyDependentOverConstants?| 205
              |linearDependenceOverConstants| 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 77
                                                 '(2 10 9 0 0 11 1 7 0 12 13 0
                                                   7 0 14 2 7 9 0 0 15 1 16 0 7
                                                   17 1 10 18 0 19 1 10 20 0 21
                                                   2 18 22 0 23 24 1 20 7 0 25
                                                   1 7 12 0 26 2 27 9 10 0 28 0
                                                   23 0 29 1 16 0 23 30 2 20 7
                                                   0 31 32 2 16 0 18 33 34 1 7
                                                   0 6 35 1 7 36 0 37 3 41 16
                                                   38 39 40 42 1 7 36 0 43 2 16
                                                   0 0 0 44 2 48 45 46 47 49 2
                                                   52 50 46 51 53 1 54 9 45 55
                                                   1 54 59 45 60 2 54 59 45 16
                                                   62 2 54 59 50 45 64 2 54 66
                                                   45 16 67 2 54 66 50 45 69 1
                                                   16 51 71 72 2 16 74 71 75 76
                                                   3 0 66 51 47 57 70 3 0 66 47
                                                   7 57 68 2 0 51 51 57 73 3 0
                                                   74 51 47 57 77 3 0 59 51 47
                                                   57 65 3 0 59 47 7 57 63 2 0
                                                   9 47 57 58 2 0 59 47 57
                                                   61)))))
           '|lookupComplete|)) 
