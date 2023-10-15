
(SDEFUN |SUMFS;newk| (($ |Kernel| F))
        (SPADCALL (SPADCALL (QREFELT $ 9)) (QREFELT $ 11))) 

(SDEFUN |SUMFS;sum;FSbF;2| ((|x| F) (|s| |SegmentBinding| F) ($ F))
        (SPROG ((|u| (|Union| F "failed")) (|k| (|Kernel| F)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 13)) (QREFELT $ 11))
                      . #1=(|SUMFS;sum;FSbF;2|))
                (LETT |u| (|SUMFS;innersum| |x| |k| $) . #1#)
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |x| |s| (QREFELT $ 15)))
                       ('T
                        (SPADCALL
                         (SPADCALL (QCDR |u|) |k|
                                   (SPADCALL (|spadConstant| $ 17)
                                             (SPADCALL
                                              (SPADCALL |s| (QREFELT $ 19))
                                              (QREFELT $ 20))
                                             (QREFELT $ 21))
                                   (QREFELT $ 23))
                         (SPADCALL (QCDR |u|) |k|
                                   (SPADCALL (SPADCALL |s| (QREFELT $ 19))
                                             (QREFELT $ 24))
                                   (QREFELT $ 23))
                         (QREFELT $ 25)))))))) 

(SDEFUN |SUMFS;sum;FSF;3| ((|x| F) (|v| |Symbol|) ($ F))
        (SPROG ((|u| (|Union| F "failed")))
               (SEQ
                (LETT |u|
                      (|SUMFS;innersum| |x| (SPADCALL |v| (QREFELT $ 11)) $)
                      |SUMFS;sum;FSF;3|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |x| |v| (QREFELT $ 27)))
                       ('T (QCDR |u|))))))) 

(SDEFUN |SUMFS;notRF?| ((|f| F) (|k| |Kernel| F) ($ |Boolean|))
        (SPROG ((#1=#:G127 NIL) (#2=#:G128 NIL) (#3=#:G129 NIL) (|kk| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |kk| NIL . #4=(|SUMFS;notRF?|))
                         (LETT #3# (SPADCALL |f| (QREFELT $ 30)) . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |kk| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k|
                                       (SPADCALL (SPADCALL |kk| (QREFELT $ 31))
                                                 (QREFELT $ 30))
                                       (QREFELT $ 34))
                             (COND
                              ((QEQCAR (SPADCALL |kk| (QREFELT $ 36)) 1)
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# 'T . #4#)
                                       (GO #5=#:G126))
                                      . #4#)
                                (GO #6=#:G124))))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |SUMFS;innersum| ((|x| F) (|k| |Kernel| F) ($ |Union| F "failed"))
        (SPROG ((|u| (|Union| F "failed")) (|f| (F)) (|x1| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 37)) (CONS 0 (|spadConstant| $ 38)))
                 ((|SUMFS;notRF?|
                   (LETT |f|
                         (SPADCALL
                          (SPADCALL |x|
                                    (LETT |x1|
                                          (SPADCALL |x| |k|
                                                    (SPADCALL
                                                     (SPADCALL |k|
                                                               (QREFELT $ 31))
                                                     (|spadConstant| $ 17)
                                                     (QREFELT $ 25))
                                                    (QREFELT $ 23))
                                          . #1=(|SUMFS;innersum|))
                                    (QREFELT $ 39))
                          (QREFELT $ 41))
                         . #1#)
                   |k| $)
                  (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |u|
                         (SPADCALL |f| |k| (CONS (|function| |SUMFS;newk|) $)
                                   (QREFELT $ 45))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (SPADCALL |x1|
                                           (SPADCALL (QCDR |u|) |k|
                                                     (SPADCALL
                                                      (SPADCALL |k|
                                                                (QREFELT $ 31))
                                                      (|spadConstant| $ 17)
                                                      (QREFELT $ 25))
                                                     (QREFELT $ 23))
                                           (QREFELT $ 46)))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceSum;|)) 

(DEFUN |FunctionSpaceSum| (&REST #1=#:G137)
  (SPROG NIL
         (PROG (#2=#:G138)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceSum|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceSum|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceSum;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FunctionSpaceSum|)))))))))) 

(DEFUN |FunctionSpaceSum;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceSum|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpaceSum| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 47) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceSum| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FunctionSpaceSum| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (|Kernel| 7) (4 . |kernel|) (|SegmentBinding| 7)
              (9 . |variable|) (|SegmentBinding| $) (14 . |summation|)
              (20 . |One|) (24 . |One|) (|Segment| 7) (28 . |segment|)
              (33 . |hi|) (38 . +) (|Kernel| $) (44 . |eval|) (51 . |lo|)
              (56 . -) |SUMFS;sum;FSbF;2| (62 . |summation|) |SUMFS;sum;FSF;3|
              (|List| 22) (68 . |tower|) (73 . |coerce|) (|Boolean|)
              (|List| 10) (78 . |member?|) (|Union| 8 '"failed")
              (84 . |symbolIfCan|) (89 . |zero?|) (94 . |Zero|) (98 . /)
              (|ElementaryFunctionStructurePackage| 6 7) (104 . |normalize|)
              (|Union| 7 '"failed") (|Mapping| 10)
              (|GosperSummationMethod| (|IndexedExponents| 10) 10 6
                                       (|SparseMultivariatePolynomial| 6 10) 7)
              (109 . |GospersMethod|) (116 . *))
           '#(|sum| 122) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 46
                                                 '(0 8 0 9 1 10 0 8 11 1 12 8 0
                                                   13 2 7 0 0 14 15 0 6 0 16 0
                                                   7 0 17 1 12 18 0 19 1 18 7 0
                                                   20 2 7 0 0 0 21 3 7 0 0 22 0
                                                   23 1 18 7 0 24 2 7 0 0 0 25
                                                   2 7 0 0 8 27 1 7 29 0 30 1 7
                                                   0 22 31 2 33 32 10 0 34 1 10
                                                   35 0 36 1 7 32 0 37 0 7 0 38
                                                   2 7 0 0 0 39 1 40 7 7 41 3
                                                   44 42 7 10 43 45 2 7 0 0 0
                                                   46 2 0 7 7 12 26 2 0 7 7 8
                                                   28)))))
           '|lookupComplete|)) 
