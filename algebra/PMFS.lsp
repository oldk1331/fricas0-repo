
(/VERSIONCHECK 2) 

(DEFUN |PMFS;patternMatch;FP2Pmr;1| (|x| |p| |l| $)
  (PROG (#1=#:G187 |ex| |ep| |uur| |uu| |u| |lx| |uq| |q| |v| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 11)) (SPADCALL |p| |x| |l| (QREFELT $ 13)))
       (#2='T
        (SEQ
         (LETT |r| (SPADCALL |x| (QREFELT $ 15))
               . #3=(|PMFS;patternMatch;FP2Pmr;1|))
         (EXIT
          (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |p| |l| (QREFELT $ 17)))
                (#2#
                 (SEQ (LETT |v| (SPADCALL |x| (QREFELT $ 19)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 0)
                         (SPADCALL (QCDR |v|) |p| |l| (QREFELT $ 22)))
                        (#2#
                         (SEQ (LETT |q| (SPADCALL |p| (QREFELT $ 25)) . #3#)
                              (EXIT
                               (COND
                                ((QEQCAR |q| 0)
                                 (SEQ (LETT |uq| (QCDR |q|) . #3#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (LETT |l|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |x| (QREFELT $ 27))
                                                  (QREFELT $ 28))
                                                 (QCAR |uq|) |l|
                                                 (QREFELT $ 29))
                                                . #3#)
                                          (QREFELT $ 30))
                                         |l|)
                                        (#2#
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT $ 31))
                                           (QREFELT $ 28))
                                          (QCDR |uq|) |l| (QREFELT $ 29)))))))
                                (#2#
                                 (SEQ
                                  (LETT |u| (SPADCALL |p| (QREFELT $ 33))
                                        . #3#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 0)
                                     (SEQ
                                      (LETT |lx| (SPADCALL |x| (QREFELT $ 34))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |lx| 0)
                                         (SPADCALL (QCDR |lx|) (QCDR |u|)
                                                   (CONS
                                                    #'|PMFS;patternMatch;FP2Pmr;1!0|
                                                    $)
                                                   |l| (ELT $ 29)
                                                   (QREFELT $ 42)))
                                        (#2#
                                         (SEQ
                                          (LETT |u|
                                                (SPADCALL (QCDR |u|)
                                                          (QREFELT $ 44))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |u| 0)
                                             (COND
                                              ((SPADCALL
                                                (LETT |l|
                                                      (SPADCALL
                                                       (|SPADfirst| (QCDR |u|))
                                                       (|spadConstant| $ 36)
                                                       |l| (QREFELT $ 13))
                                                      . #3#)
                                                (QREFELT $ 30))
                                               (SPADCALL (QREFELT $ 45)))
                                              (#2#
                                               (SPADCALL |x|
                                                         (SPADCALL (QCDR |u|)
                                                                   (QREFELT $
                                                                            46))
                                                         |l| (QREFELT $ 29)))))
                                            (#2#
                                             (SPADCALL (QREFELT $ 45)))))))))))
                                    (#2#
                                     (SEQ
                                      (LETT |u| (SPADCALL |p| (QREFELT $ 47))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |u| 0)
                                         (SEQ
                                          (LETT |lx|
                                                (SPADCALL |x| (QREFELT $ 48))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |lx| 0)
                                             (SPADCALL (QCDR |lx|) (QCDR |u|)
                                                       |l| (ELT $ 29)
                                                       (QREFELT $ 49)))
                                            (#2#
                                             (SEQ
                                              (LETT |u|
                                                    (SPADCALL (QCDR |u|)
                                                              (QREFELT $ 44))
                                                    . #3#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |u| 0)
                                                 (COND
                                                  ((SPADCALL
                                                    (LETT |l|
                                                          (SPADCALL
                                                           (|SPADfirst|
                                                            (QCDR |u|))
                                                           (|spadConstant| $
                                                                           50)
                                                           |l| (QREFELT $ 13))
                                                          . #3#)
                                                    (QREFELT $ 30))
                                                   (SPADCALL (QREFELT $ 45)))
                                                  (#2#
                                                   (SPADCALL |x|
                                                             (SPADCALL
                                                              (QCDR |u|)
                                                              (QREFELT $ 46))
                                                             |l|
                                                             (QREFELT $ 29)))))
                                                (#2#
                                                 (SPADCALL
                                                  (QREFELT $ 45)))))))))))
                                        (#2#
                                         (SEQ
                                          (LETT |uu|
                                                (SPADCALL |p| (QREFELT $ 53))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |uu| 0)
                                             (SEQ
                                              (LETT |uur| (QCDR |uu|) . #3#)
                                              (LETT |ex|
                                                    (SPADCALL |x|
                                                              (QREFELT $ 56))
                                                    . #3#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |ex| 0)
                                                 (COND
                                                  ((SPADCALL
                                                    (LETT |l|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (QCDR (QCDR |ex|))
                                                            (QREFELT $ 58))
                                                           (QCDR |uur|) |l|
                                                           (QREFELT $ 29))
                                                          . #3#)
                                                    (QREFELT $ 30))
                                                   (SPADCALL (QREFELT $ 45)))
                                                  (#2#
                                                   (SPADCALL (QCAR (QCDR |ex|))
                                                             (QCAR |uur|) |l|
                                                             (QREFELT $ 22)))))
                                                ((SPADCALL (QCDR |uur|)
                                                           (QREFELT $ 59))
                                                 (COND
                                                  ((SPADCALL
                                                    (LETT |l|
                                                          (SPADCALL
                                                           (QCDR |uur|)
                                                           (|spadConstant| $
                                                                           50)
                                                           |l| (QREFELT $ 13))
                                                          . #3#)
                                                    (QREFELT $ 30))
                                                   (SPADCALL (QREFELT $ 45)))
                                                  (#2#
                                                   (SPADCALL |x| (QCAR |uur|)
                                                             |l|
                                                             (QREFELT $ 29)))))
                                                (#2#
                                                 (SPADCALL (QREFELT $ 45)))))))
                                            (#2#
                                             (SEQ
                                              (EXIT
                                               (SEQ
                                                (SEQ
                                                 (LETT |ep|
                                                       (SPADCALL |p|
                                                                 (QREFELT $
                                                                          62))
                                                       . #3#)
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |ep| 0)
                                                    (SEQ
                                                     (LETT |ex|
                                                           (SPADCALL |x|
                                                                     (QREFELT $
                                                                              56))
                                                           . #3#)
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |ex| 0)
                                                        (COND
                                                         ((EQL
                                                           (QCDR (QCDR |ex|))
                                                           (QCDR (QCDR |ep|)))
                                                          (PROGN
                                                           (LETT #1#
                                                                 (SPADCALL
                                                                  (QCAR
                                                                   (QCDR |ex|))
                                                                  (QCAR
                                                                   (QCDR |ep|))
                                                                  |l|
                                                                  (QREFELT $
                                                                           22))
                                                                 . #3#)
                                                           (GO #1#))))))))))))
                                                (EXIT
                                                 (SPADCALL (QREFELT $ 45)))))
                                              #1#
                                              (EXIT
                                               #1#)))))))))))))))))))))))))))))))) 

(DEFUN |PMFS;patternMatch;FP2Pmr;1!0| (|l1| $)
  (PROG (#1=#:G152 #2=#:G151 #3=#:G153 #4=#:G155 #5=#:G125)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL NIL)
       (SEQ (LETT #5# NIL NIL) (LETT #4# |l1| NIL) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) NIL) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# #5# NIL)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 35)) NIL))
                     ('T (PROGN (LETT #2# #3# NIL) (LETT #1# 'T NIL)))))))
            (LETT #4# (CDR #4#) NIL) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 36)))))))) 

(DEFUN |PatternMatchFunctionSpace| (&REST #1=#:G196)
  (PROG ()
    (RETURN
     (PROG (#2=#:G197)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchFunctionSpace|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchFunctionSpace|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternMatchFunctionSpace;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternMatchFunctionSpace|))))))))))) 

(DEFUN |PatternMatchFunctionSpace;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchFunctionSpace|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|PatternMatchFunctionSpace| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 63) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchFunctionSpace|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternMatchFunctionSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (|Pattern| 6) (0 . |generic?|)
              (|PatternMatchResult| 6 8) (5 . |addMatch|)
              (|Union| 7 '#1="failed") (12 . |retractIfCan|)
              (|PatternMatchPushDown| 6 7 8) (17 . |patternMatch|)
              (|Union| (|Kernel| $) '#1#) (24 . |retractIfCan|) (|Kernel| 8)
              (|PatternMatchKernel| 6 8) (29 . |patternMatch|)
              (|Record| (|:| |num| $) (|:| |den| $)) (|Union| 23 '"failed")
              (36 . |isQuotient|)
              (|SparseMultivariatePolynomial| 7 (|Kernel| $)) (41 . |numer|)
              (46 . |coerce|) |PMFS;patternMatch;FP2Pmr;1| (51 . |failed?|)
              (56 . |denom|) (|Union| 43 '"failed") (61 . |isPlus|)
              (66 . |isPlus|) (71 . +) (77 . |Zero|) (|List| 8) (|List| 10)
              (|Mapping| 8 37) (|Mapping| 12 8 10 12)
              (|PatternMatchTools| 6 7 8) (81 . |patternMatch|) (|List| $)
              (90 . |optpair|) (95 . |failed|) (99 . |second|)
              (104 . |isTimes|) (109 . |isTimes|) (114 . |patternMatchTimes|)
              (122 . |One|) (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 51 '"failed") (126 . |isPower|)
              (|Record| (|:| |var| (|Kernel| $)) (|:| |exponent| 57))
              (|Union| 54 '"failed") (131 . |isExpt|) (|Integer|)
              (136 . |coerce|) (141 . |optional?|)
              (|Record| (|:| |val| $) (|:| |exponent| (|NonNegativeInteger|)))
              (|Union| 60 '"failed") (146 . |isExpt|))
           '#(|patternMatch| 151) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(1 10 9 0 11 3 12 0 10 8 0 13
                                                   1 8 14 0 15 3 16 12 7 10 12
                                                   17 1 8 18 0 19 3 21 12 20 10
                                                   12 22 1 10 24 0 25 1 8 26 0
                                                   27 1 8 0 26 28 1 12 9 0 30 1
                                                   8 26 0 31 1 10 32 0 33 1 8
                                                   32 0 34 2 8 0 0 0 35 0 8 0
                                                   36 5 41 12 37 38 39 12 40 42
                                                   1 10 32 43 44 0 12 0 45 1 38
                                                   10 0 46 1 10 32 0 47 1 8 32
                                                   0 48 4 41 12 37 38 12 40 49
                                                   0 8 0 50 1 10 52 0 53 1 8 55
                                                   0 56 1 8 0 57 58 1 10 9 0 59
                                                   1 10 61 0 62 3 0 12 8 10 12
                                                   29)))))
           '|lookupComplete|)) 
