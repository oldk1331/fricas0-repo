
(/VERSIONCHECK 2) 

(DEFUN |DLP;shanksDiscLogAlgorithm;2MNniU;1| (|logbase| |c| |p| $)
  (PROG (|a| |disclog| |found| |rho| |i| |b| |end| #1=#:G124 #2=#:G112
         |exptable| |n| |l| #3=#:G123 |limit|)
    (RETURN
     (SEQ (LETT |limit| 30 . #4=(|DLP;shanksDiscLogAlgorithm;2MNniU;1|))
          (EXIT
           (COND
            ((< |p| |limit|)
             (SEQ (LETT |a| (|spadConstant| $ 7) . #4#)
                  (LETT |disclog| 0 . #4#) (LETT |found| 'NIL . #4#)
                  (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |p| 1) . #4#) G190
                       (COND
                        ((OR (|greater_SI| |i| #3#)
                             (NULL (COND (|found| 'NIL) ('T 'T))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |c| (QREFELT $ 9))
                           (SEQ (LETT |disclog| |i| . #4#)
                                (EXIT (LETT |found| 'T . #4#))))
                          ('T
                           (LETT |a| (SPADCALL |a| |logbase| (QREFELT $ 10))
                                 . #4#)))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (COND (|found| (CONS 0 |disclog|))
                         (#5='T
                          (SEQ
                           (SPADCALL
                            "discreteLog: second argument not in cyclic group generated by first argument"
                            (QREFELT $ 14))
                           (EXIT (CONS 1 "failed"))))))))
            (#5#
             (SEQ (LETT |l| (INTEGER-LENGTH |p|) . #4#)
                  (COND
                   ((ODDP |l|)
                    (LETT |n| (ASH |p| (- (QUOTIENT2 |l| 2))) . #4#))
                   (#5# (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)) . #4#)))
                  (LETT |a| (|spadConstant| $ 7) . #4#)
                  (LETT |exptable| (SPADCALL (QREFELT $ 16)) . #4#)
                  (SEQ (LETT |i| 0 . #4#)
                       (LETT #1#
                             (PROG1 (LETT #2# (- |n| 1) . #4#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             . #4#)
                       G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (SPADCALL (CONS (SPADCALL |a| (QREFELT $ 18)) |i|)
                                  |exptable| (QREFELT $ 20))
                        (EXIT
                         (LETT |a| (SPADCALL |a| |logbase| (QREFELT $ 10))
                               . #4#)))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |found| 'NIL . #4#)
                  (LETT |end| (QUOTIENT2 (- |p| 1) |n|) . #4#)
                  (LETT |disclog| 0 . #4#) (LETT |a| |c| . #4#)
                  (LETT |b| (SPADCALL |logbase| (- |n|) (QREFELT $ 22)) . #4#)
                  (SEQ (LETT |i| 0 . #4#) G190
                       (COND
                        ((OR (|greater_SI| |i| |end|)
                             (NULL (COND (|found| 'NIL) ('T 'T))))
                         (GO G191)))
                       (SEQ
                        (LETT |rho|
                              (SPADCALL (SPADCALL |a| (QREFELT $ 18))
                                        |exptable| (QREFELT $ 24))
                              . #4#)
                        (EXIT
                         (COND
                          ((QEQCAR |rho| 0)
                           (SEQ (LETT |found| 'T . #4#)
                                (EXIT
                                 (LETT |disclog| (+ (* |n| |i|) (QCDR |rho|))
                                       . #4#))))
                          ('T
                           (LETT |a| (SPADCALL |a| |b| (QREFELT $ 10))
                                 . #4#)))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (COND (|found| (CONS 0 |disclog|))
                         (#5#
                          (SEQ
                           (SPADCALL
                            "discreteLog: second argument not in cyclic group generated by first argument"
                            (QREFELT $ 14))
                           (EXIT (CONS 1 "failed")))))))))))))) 

(DECLAIM (NOTINLINE |DiscreteLogarithmPackage;|)) 

(DEFUN |DiscreteLogarithmPackage| (#1=#:G125)
  (PROG ()
    (RETURN
     (PROG (#2=#:G126)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|DiscreteLogarithmPackage|)
                                           '|domainEqualList|)
                . #3=(|DiscreteLogarithmPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|DiscreteLogarithmPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|DiscreteLogarithmPackage|))))))))))) 

(DEFUN |DiscreteLogarithmPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DiscreteLogarithmPackage|))
      (LETT |dv$| (LIST '|DiscreteLogarithmPackage| DV$1) . #1#)
      (LETT $ (GETREFV 27) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DiscreteLogarithmPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DiscreteLogarithmPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Boolean|)
              (4 . =) (10 . *) (|Void|) (|String|) (|OutputForm|)
              (16 . |messagePrint|) (|Table| 17 25) (21 . |table|)
              (|PositiveInteger|) (25 . |lookup|)
              (|Record| (|:| |key| 17) (|:| |entry| 25)) (30 . |insert!|)
              (|Integer|) (36 . ^) (|Union| 25 '"failed") (42 . |search|)
              (|NonNegativeInteger|) |DLP;shanksDiscLogAlgorithm;2MNniU;1|)
           '#(|shanksDiscLogAlgorithm| 48) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(0 6 0 7 2 6 8 0 0 9 2 6 0 0
                                                   0 10 1 13 11 12 14 0 15 0 16
                                                   1 6 17 0 18 2 15 0 19 0 20 2
                                                   6 0 0 21 22 2 15 23 17 0 24
                                                   3 0 23 6 6 25 26)))))
           '|lookupComplete|)) 
