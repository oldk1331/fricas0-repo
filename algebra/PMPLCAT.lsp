
(DEFUN |PMPLCAT;patternMatch;PP2Pmr;1| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (ELT $ 14) (QREFELT $ 16))) 

(DEFUN |PMPLCAT;patternMatch;PPPmrMPmr;2| (|x| |p| |l| |vmatch| $)
  (PROG (#1=#:G177 |ex| |ep| |uur| |uu| |u| |lx| |v| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 19)) (SPADCALL |p| |x| |l| (QREFELT $ 20)))
       (#2='T
        (SEQ
         (LETT |r| (SPADCALL |x| (QREFELT $ 22))
               . #3=(|PMPLCAT;patternMatch;PPPmrMPmr;2|))
         (EXIT
          (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |p| |l| (QREFELT $ 24)))
                (#2#
                 (SEQ (LETT |v| (SPADCALL |x| (QREFELT $ 26)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 0) (SPADCALL (QCDR |v|) |p| |l| |vmatch|))
                        (#2#
                         (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 28)) . #3#)
                              (EXIT
                               (COND
                                ((QEQCAR |u| 0)
                                 (SEQ
                                  (LETT |lx| (SPADCALL |x| (QREFELT $ 29))
                                        . #3#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |lx| 0)
                                     (SPADCALL (QCDR |lx|) (QCDR |u|)
                                               (CONS
                                                #'|PMPLCAT;patternMatch;PPPmrMPmr;2!0|
                                                $)
                                               |l|
                                               (CONS
                                                #'|PMPLCAT;patternMatch;PPPmrMPmr;2!1|
                                                (VECTOR $ |vmatch|))
                                               (QREFELT $ 37)))
                                    (#2#
                                     (SEQ
                                      (LETT |u|
                                            (SPADCALL (QCDR |u|)
                                                      (QREFELT $ 39))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |u| 0)
                                         (COND
                                          ((SPADCALL
                                            (LETT |l|
                                                  (SPADCALL
                                                   (|SPADfirst| (QCDR |u|))
                                                   (|spadConstant| $ 31) |l|
                                                   (QREFELT $ 20))
                                                  . #3#)
                                            (QREFELT $ 40))
                                           (SPADCALL (QREFELT $ 41)))
                                          (#2#
                                           (SPADCALL |x|
                                                     (SPADCALL (QCDR |u|)
                                                               (QREFELT $ 42))
                                                     |l| |vmatch|
                                                     (QREFELT $ 16)))))
                                        (#2# (SPADCALL (QREFELT $ 41)))))))))))
                                (#2#
                                 (SEQ
                                  (LETT |u| (SPADCALL |p| (QREFELT $ 43))
                                        . #3#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 0)
                                     (SEQ
                                      (LETT |lx| (SPADCALL |x| (QREFELT $ 44))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |lx| 0)
                                         (SPADCALL (QCDR |lx|) (QCDR |u|) |l|
                                                   (CONS
                                                    #'|PMPLCAT;patternMatch;PPPmrMPmr;2!2|
                                                    (VECTOR $ |vmatch|))
                                                   (QREFELT $ 45)))
                                        (#2#
                                         (SEQ
                                          (LETT |u|
                                                (SPADCALL (QCDR |u|)
                                                          (QREFELT $ 39))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |u| 0)
                                             (COND
                                              ((SPADCALL
                                                (LETT |l|
                                                      (SPADCALL
                                                       (|SPADfirst| (QCDR |u|))
                                                       (|spadConstant| $ 46)
                                                       |l| (QREFELT $ 20))
                                                      . #3#)
                                                (QREFELT $ 40))
                                               (SPADCALL (QREFELT $ 41)))
                                              (#2#
                                               (SPADCALL |x|
                                                         (SPADCALL (QCDR |u|)
                                                                   (QREFELT $
                                                                            42))
                                                         |l| |vmatch|
                                                         (QREFELT $ 16)))))
                                            (#2#
                                             (SPADCALL (QREFELT $ 41)))))))))))
                                    (#2#
                                     (SEQ
                                      (LETT |uu| (SPADCALL |p| (QREFELT $ 49))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |uu| 0)
                                         (SEQ (LETT |uur| (QCDR |uu|) . #3#)
                                              (LETT |ex|
                                                    (SPADCALL |x|
                                                              (QREFELT $ 52))
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
                                                            (QREFELT $ 54))
                                                           (QCDR |uur|) |l|
                                                           |vmatch|
                                                           (QREFELT $ 16))
                                                          . #3#)
                                                    (QREFELT $ 40))
                                                   (SPADCALL (QREFELT $ 41)))
                                                  (#2#
                                                   (SPADCALL (QCAR (QCDR |ex|))
                                                             (QCAR |uur|) |l|
                                                             |vmatch|))))
                                                ((SPADCALL (QCDR |uur|)
                                                           (QREFELT $ 55))
                                                 (COND
                                                  ((SPADCALL
                                                    (LETT |l|
                                                          (SPADCALL
                                                           (QCDR |uur|)
                                                           (|spadConstant| $
                                                                           46)
                                                           |l| (QREFELT $ 20))
                                                          . #3#)
                                                    (QREFELT $ 40))
                                                   (SPADCALL (QREFELT $ 41)))
                                                  (#2#
                                                   (SPADCALL |x| (QCAR |uur|)
                                                             |l| |vmatch|
                                                             (QREFELT $ 16)))))
                                                (#2#
                                                 (SPADCALL (QREFELT $ 41)))))))
                                        (#2#
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (SEQ
                                             (LETT |ep|
                                                   (SPADCALL |p|
                                                             (QREFELT $ 58))
                                                   . #3#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |ep| 0)
                                                (SEQ
                                                 (LETT |ex|
                                                       (SPADCALL |x|
                                                                 (QREFELT $
                                                                          52))
                                                       . #3#)
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |ex| 0)
                                                    (COND
                                                     ((EQL (QCDR (QCDR |ex|))
                                                           (QCDR (QCDR |ep|)))
                                                      (PROGN
                                                       (LETT #1#
                                                             (SPADCALL
                                                              (QCAR
                                                               (QCDR |ex|))
                                                              (QCAR
                                                               (QCDR |ep|))
                                                              |l| |vmatch|)
                                                             . #3#)
                                                       (GO #1#))))))))))))
                                            (EXIT (SPADCALL (QREFELT $ 41)))))
                                          #1#
                                          (EXIT #1#)))))))))))))))))))))))))))) 

(DEFUN |PMPLCAT;patternMatch;PPPmrMPmr;2!2| (|p1| |p2| |p3| $$)
  (PROG (|vmatch| $)
    (LETT |vmatch| (QREFELT $$ 1) . #1=(|PMPLCAT;patternMatch;PPPmrMPmr;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p1| |p2| |p3| |vmatch| (QREFELT $ 16)))))) 

(DEFUN |PMPLCAT;patternMatch;PPPmrMPmr;2!1| (|p1| |p2| |p3| $$)
  (PROG (|vmatch| $)
    (LETT |vmatch| (QREFELT $$ 1) . #1=(|PMPLCAT;patternMatch;PPPmrMPmr;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p1| |p2| |p3| |vmatch| (QREFELT $ 16)))))) 

(DEFUN |PMPLCAT;patternMatch;PPPmrMPmr;2!0| (|l1| $)
  (PROG (#1=#:G128 #2=#:G127 #3=#:G129 #4=#:G131 #5=#:G103)
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
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 30)) NIL))
                     ('T (PROGN (LETT #2# #3# NIL) (LETT #1# 'T NIL)))))))
            (LETT #4# (CDR #4#) NIL) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 31)))))))) 

(DECLAIM (NOTINLINE |PatternMatchPolynomialCategory;|)) 

(DEFUN |PatternMatchPolynomialCategory| (&REST #1=#:G185)
  (PROG ()
    (RETURN
     (PROG (#2=#:G186)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchPolynomialCategory|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchPolynomialCategory|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternMatchPolynomialCategory;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PatternMatchPolynomialCategory|))))))))))) 

(DEFUN |PatternMatchPolynomialCategory;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchPolynomialCategory|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|PatternMatchPolynomialCategory| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 59) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#3|
                                                         (LIST
                                                          '|PatternMatchable|
                                                          (|devaluate|
                                                           |#1|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchPolynomialCategory|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 17
                  (CONS (|dispatchFunction| |PMPLCAT;patternMatch;PP2Pmr;1|)
                        $))))
      $)))) 

(MAKEPROP '|PatternMatchPolynomialCategory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|PatternMatchResult| 6 10) (|Pattern| 6)
              (|PatternMatchPushDown| 6 8 10) (0 . |patternMatch|)
              (|Mapping| 11 8 12 11) |PMPLCAT;patternMatch;PPPmrMPmr;2|
              (7 . |patternMatch|) (|Boolean|) (14 . |generic?|)
              (19 . |addMatch|) (|Union| 9 '#1="failed") (26 . |retractIfCan|)
              (|PatternMatchPushDown| 6 9 10) (31 . |patternMatch|)
              (|Union| 8 '#1#) (38 . |retractIfCan|) (|Union| 38 '"failed")
              (43 . |isPlus|) (48 . |isPlus|) (53 . +) (59 . |Zero|)
              (|List| 10) (|List| 12) (|Mapping| 10 32) (|Mapping| 11 10 12 11)
              (|PatternMatchTools| 6 9 10) (63 . |patternMatch|) (|List| $)
              (72 . |optpair|) (77 . |failed?|) (82 . |failed|) (86 . |second|)
              (91 . |isTimes|) (96 . |isTimes|) (101 . |patternMatchTimes|)
              (109 . |One|) (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 47 '"failed") (113 . |isPower|)
              (|Record| (|:| |var| 8) (|:| |exponent| (|NonNegativeInteger|)))
              (|Union| 50 '"failed") (118 . |isExpt|) (|Integer|)
              (123 . |coerce|) (128 . |optional?|)
              (|Record| (|:| |val| $) (|:| |exponent| (|NonNegativeInteger|)))
              (|Union| 56 '"failed") (133 . |isExpt|))
           '#(|patternMatch| 138) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 58
                                                 '(3 13 11 8 12 11 14 3 0 11 10
                                                   12 11 17 1 12 18 0 19 3 11 0
                                                   12 10 0 20 1 10 21 0 22 3 23
                                                   11 9 12 11 24 1 10 25 0 26 1
                                                   12 27 0 28 1 10 27 0 29 2 10
                                                   0 0 0 30 0 10 0 31 5 36 11
                                                   32 33 34 11 35 37 1 12 27 38
                                                   39 1 11 18 0 40 0 11 0 41 1
                                                   33 12 0 42 1 12 27 0 43 1 10
                                                   27 0 44 4 36 11 32 33 11 35
                                                   45 0 10 0 46 1 12 48 0 49 1
                                                   10 51 0 52 1 10 0 53 54 1 12
                                                   18 0 55 1 12 57 0 58 3 1 11
                                                   10 12 11 17 4 0 11 10 12 11
                                                   15 16)))))
           '|lookupComplete|)) 
