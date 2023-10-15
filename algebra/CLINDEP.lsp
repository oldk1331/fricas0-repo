
(SDEFUN |CLINDEP;kmap|
        ((|k| |Kernel| F) (|ldmvar| |List| (|Kernel| F))
         (|ldmval| |List| (|Expression| F)) (|ld| |List| (|Mapping| F F))
         ($ |Expression| F))
        (SPROG
         ((#1=#:G134 NIL) (|a| NIL) (#2=#:G133 NIL)
          (|kmap1| (|Mapping| (|Expression| F) (|Kernel| F)))
          (|sa2| #3=(|Symbol|)) (|da2| #4=(|Kernel| F)) (|a2| (F)) (|sa1| #3#)
          (|da| #4#) (|a1| (F)) (|n| (|NonNegativeInteger|))
          (|u| (|Union| (|None|) "failed")) (|args| (|List| F))
          (|op| (|BasicOperator|)) (#5=#:G128 NIL) (|is_const| (|Boolean|))
          (#6=#:G132 NIL) (|d| NIL) (|kf| (F)) (#7=#:G129 NIL) (#8=#:G130 NIL)
          (|dmvar| NIL) (#9=#:G131 NIL) (|dmval| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |dmval| NIL . #10=(|CLINDEP;kmap|))
                 (LETT #9# |ldmval| . #10#) (LETT |dmvar| NIL . #10#)
                 (LETT #8# |ldmvar| . #10#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |dmvar| (CAR #8#) . #10#) NIL)
                       (ATOM #9#) (PROGN (LETT |dmval| (CAR #9#) . #10#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |dmvar| (QREFELT $ 11))
                     (PROGN (LETT #7# |dmval| . #10#) (GO #11=#:G127))))))
                 (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #10#))
                       . #10#)
                 (GO G190) G191 (EXIT NIL))
            (LETT |is_const| 'T . #10#)
            (LETT |kf| (SPADCALL |k| (QREFELT $ 13)) . #10#)
            (SEQ
             (EXIT
              (SEQ (LETT |d| NIL . #10#) (LETT #6# |ld| . #10#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |d| (CAR #6#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |kf| |d|) (|spadConstant| $ 14)
                                 (QREFELT $ 15))
                       (SEQ (LETT |is_const| 'NIL . #10#)
                            (EXIT
                             (PROGN
                              (LETT #5# |$NoValue| . #10#)
                              (GO #12=#:G110))))))))
                   (LETT #6# (CDR #6#) . #10#) (GO G190) G191 (EXIT NIL)))
             #12# (EXIT #5#))
            (EXIT
             (COND (|is_const| (SPADCALL |kf| (QREFELT $ 17)))
                   ('T
                    (SEQ
                     (LETT |op|
                           (SPADCALL (SPADCALL |k| (QREFELT $ 19))
                                     (QREFELT $ 20))
                           . #10#)
                     (LETT |args| (SPADCALL |k| (QREFELT $ 22)) . #10#)
                     (SEQ
                      (LETT |u| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 25))
                            . #10#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (SEQ (LETT |n| (QCDR |u|) . #10#)
                              (LETT |da|
                                    (SPADCALL
                                     (LETT |a1|
                                           (SPADCALL |args| (QREFELT $ 26))
                                           . #10#)
                                     (QREFELT $ 27))
                                    . #10#)
                              (COND
                               ((NULL (SPADCALL |da| |ldmvar| (QREFELT $ 29)))
                                (SEQ
                                 (LETT |ldmvar| (CONS |da| |ldmvar|) . #10#)
                                 (LETT |ldmval|
                                       (CONS
                                        (SPADCALL (SPADCALL (QREFELT $ 30))
                                                  (QREFELT $ 31))
                                        |ldmval|)
                                       . #10#)
                                 (LETT |sa1| (SPADCALL |a1| (QREFELT $ 32))
                                       . #10#)
                                 (EXIT
                                  (LETT |ld|
                                        (CONS
                                         (CONS #'|CLINDEP;kmap!0|
                                               (VECTOR $ |sa1|))
                                         |ld|)
                                        . #10#)))))
                              (EXIT
                               (COND
                                ((EQL |n| 2)
                                 (SEQ
                                  (LETT |da2|
                                        (SPADCALL
                                         (LETT |a2|
                                               (SPADCALL |args| 3
                                                         (QREFELT $ 35))
                                               . #10#)
                                         (QREFELT $ 27))
                                        . #10#)
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL |da2| |ldmvar| (QREFELT $ 29)))
                                     (SEQ
                                      (LETT |ldmvar| (CONS |da2| |ldmvar|)
                                            . #10#)
                                      (LETT |ldmval|
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 30))
                                              (QREFELT $ 31))
                                             |ldmval|)
                                            . #10#)
                                      (LETT |sa2|
                                            (SPADCALL |a2| (QREFELT $ 32))
                                            . #10#)
                                      (EXIT
                                       (LETT |ld|
                                             (CONS
                                              (CONS #'|CLINDEP;kmap!1|
                                                    (VECTOR $ |sa2|))
                                              |ld|)
                                             . #10#)))))))))))))))
                     (LETT |kmap1|
                           (CONS #'|CLINDEP;kmap!2|
                                 (VECTOR $ |ld| |ldmval| |ldmvar|))
                           . #10#)
                     (EXIT
                      (SPADCALL |op|
                                (PROGN
                                 (LETT #2# NIL . #10#)
                                 (SEQ (LETT |a| NIL . #10#)
                                      (LETT #1# (SPADCALL |k| (QREFELT $ 22))
                                            . #10#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |a| (CAR #1#) . #10#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (|CLINDEP;F_to_EF1| |a| |kmap1|
                                                $)
                                               #2#)
                                              . #10#)))
                                      (LETT #1# (CDR #1#) . #10#) (GO G190)
                                      G191 (EXIT (NREVERSE #2#))))
                                (QREFELT $ 37)))))))))
          #11# (EXIT #7#)))) 

(SDEFUN |CLINDEP;kmap!2| ((|kk| NIL) ($$ NIL))
        (PROG (|ldmvar| |ldmval| |ld| $)
          (LETT |ldmvar| (QREFELT $$ 3) . #1=(|CLINDEP;kmap|))
          (LETT |ldmval| (QREFELT $$ 2) . #1#)
          (LETT |ld| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;kmap| |kk| |ldmvar| |ldmval| |ld| $))))) 

(SDEFUN |CLINDEP;kmap!1| ((|ff| NIL) ($$ NIL))
        (PROG (|sa2| $)
          (LETT |sa2| (QREFELT $$ 1) . #1=(|CLINDEP;kmap|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |ff| |sa2| (QREFELT $ 33)))))) 

(SDEFUN |CLINDEP;kmap!0| ((|ff| NIL) ($$ NIL))
        (PROG (|sa1| $)
          (LETT |sa1| (QREFELT $$ 1) . #1=(|CLINDEP;kmap|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |ff| |sa1| (QREFELT $ 33)))))) 

(SDEFUN |CLINDEP;F_to_EF1|
        ((|f| F) (|kmap1| |Mapping| (|Expression| F) (|Kernel| F))
         ($ |Expression| F))
        (SPADCALL
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!0| $)
                   (SPADCALL |f| (QREFELT $ 40)) (QREFELT $ 45))
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!1| $)
                   (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 45))
         (QREFELT $ 47))) 

(SDEFUN |CLINDEP;F_to_EF1!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 38)) (QREFELT $ 17))) 

(SDEFUN |CLINDEP;F_to_EF1!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 38)) (QREFELT $ 17))) 

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
                         (QREFELT $ 52)))) 

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
                         (QREFELT $ 56)))) 

(SDEFUN |CLINDEP;MF_to_MEF!0| ((|x| NIL) ($$ NIL))
        (PROG (|ld| $)
          (LETT |ld| (QREFELT $$ 1) . #1=(|CLINDEP;MF_to_MEF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CLINDEP;F_to_EF| |x| |ld| $))))) 

(SDEFUN |CLINDEP;linearlyDependentOverConstants?;VLB;6|
        ((|v| |Vector| F) (|ld| |List| (|Mapping| F F)) ($ |Boolean|))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 58))) 

(SDEFUN |CLINDEP;linearDependenceOverConstants;VLU;7|
        ((|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 63))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;VFLU;8|
        ((|v| |Vector| F) (|u| F) (|ld| |List| (|Mapping| F F))
         ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $)
                  (|CLINDEP;F_to_EF| |u| |ld| $) (QREFELT $ 65))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;MVLU;9|
        ((|m| |Matrix| F) (|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Union| (|Vector| F) "failed"))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $)
                  (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 67))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;VFLR;10|
        ((|v| |Vector| F) (|u| F) (|ld| |List| (|Mapping| F F))
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| $)
                  (|CLINDEP;F_to_EF| |u| |ld| $) (QREFELT $ 70))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;MVLR;11|
        ((|m| |Matrix| F) (|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $)
                  (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 72))) 

(SDEFUN |CLINDEP;reducedSystem;MLM;12|
        ((|m| |Matrix| F) (|ld| |List| (|Mapping| F F)) ($ |Matrix| F))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $) (QREFELT $ 75))) 

(SDEFUN |CLINDEP;reducedSystem;MVLR;13|
        ((|m| |Matrix| F) (|v| |Vector| F) (|ld| |List| (|Mapping| F F))
         ($ |Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| $)
                  (|CLINDEP;VF_to_VEF| |v| |ld| $) (QREFELT $ 79))) 

(DECLAIM (NOTINLINE |ConstantLinearDependence;|)) 

(DEFUN |ConstantLinearDependence| (&REST #1=#:G169)
  (SPROG NIL
         (PROG (#2=#:G170)
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
          (LETT $ (GETREFV 81) . #1#)
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
              (|BasicOperator|) (26 . |operator|) (31 . |operator|) (|List| 7)
              (36 . |argument|) (|Union| (|None|) '"failed") (|Symbol|)
              (41 . |property|) (47 . |second|) (52 . |retract|) (|List| 10)
              (57 . |member?|) (63 . |new|) (67 . |coerce|) (72 . |retract|)
              (77 . |differentiate|) (|Integer|) (83 . |elt|) (|List| $)
              (89 . |kernel|) (95 . |coerce|)
              (|SparseMultivariatePolynomial| 6 12) (100 . |numer|)
              (|Mapping| 16 10) (|Mapping| 16 6)
              (|SparseMultivariatePolynomial| 6 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 10) 10 6 43 16)
              (105 . |map|) (112 . |denom|) (117 . /) (|Vector| 16)
              (|Mapping| 16 7) (|Vector| 7) (|VectorFunctions2| 7 16)
              (123 . |map|) (|Matrix| 16) (|Matrix| 7)
              (|TwoDimensionalArrayFunctions| 7 50 50 54 16 48 48 53)
              (129 . |map|) (|LinearDependence| 7 16)
              (135 . |linearlyDependent?|) (|Mapping| 7 7) (|List| 59)
              |CLINDEP;linearlyDependentOverConstants?;VLB;6|
              (|Union| 50 '"failed") (140 . |linearDependence|)
              |CLINDEP;linearDependenceOverConstants;VLU;7|
              (145 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;VFLU;8|
              (151 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;MVLU;9|
              (|Record| (|:| |particular| 62) (|:| |basis| (|List| 50)))
              (157 . |solveLinear|) |CLINDEP;solveLinearOverConstants;VFLR;10|
              (163 . |solveLinear|) |CLINDEP;solveLinearOverConstants;MVLR;11|
              (|Matrix| $) (169 . |reducedSystem|)
              |CLINDEP;reducedSystem;MLM;12|
              (|Record| (|:| |mat| 54) (|:| |vec| 50)) (|Vector| $)
              (174 . |reducedSystem|) |CLINDEP;reducedSystem;MVLR;13|)
           '#(|solveLinearOverConstants| 180 |reducedSystem| 194
              |particularSolutionOverConstants| 207
              |linearlyDependentOverConstants?| 221
              |linearDependenceOverConstants| 227)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 80
                                                 '(2 10 9 0 0 11 1 7 0 12 13 0
                                                   7 0 14 2 7 9 0 0 15 1 16 0 7
                                                   17 1 10 18 0 19 1 16 18 18
                                                   20 1 10 21 0 22 2 18 23 0 24
                                                   25 1 21 7 0 26 1 7 12 0 27 2
                                                   28 9 10 0 29 0 24 0 30 1 16
                                                   0 24 31 1 7 24 0 32 2 7 0 0
                                                   24 33 2 21 7 0 34 35 2 16 0
                                                   18 36 37 1 7 0 6 38 1 7 39 0
                                                   40 3 44 16 41 42 43 45 1 7
                                                   39 0 46 2 16 0 0 0 47 2 51
                                                   48 49 50 52 2 55 53 49 54 56
                                                   1 57 9 48 58 1 57 62 48 63 2
                                                   57 62 48 16 65 2 57 62 53 48
                                                   67 2 57 69 48 16 70 2 57 69
                                                   53 48 72 1 16 54 74 75 2 16
                                                   77 74 78 79 3 0 69 54 50 60
                                                   73 3 0 69 50 7 60 71 2 0 54
                                                   54 60 76 3 0 77 54 50 60 80
                                                   3 0 62 54 50 60 68 3 0 62 50
                                                   7 60 66 2 0 9 50 60 61 2 0
                                                   62 50 60 64)))))
           '|lookupComplete|)) 
