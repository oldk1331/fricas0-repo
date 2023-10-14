
(SDEFUN |DLP;shanksDiscLogAlgorithm;2MNniU;1|
        ((|logbase| M) (|c| M) (|p| |NonNegativeInteger|)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|a| (M)) (|disclog| (|Integer|)) (|found| (|Boolean|))
          (|rho| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G126 NIL)
          (|i| NIL) (|b| (M)) (|end| (|Integer|)) (#2=#:G125 NIL)
          (#3=#:G113 NIL)
          (|exptable| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|l| (|Integer|)) (#4=#:G124 NIL)
          (|limit| (|Integer|)))
         (SEQ (LETT |limit| 30 . #5=(|DLP;shanksDiscLogAlgorithm;2MNniU;1|))
              (EXIT
               (COND
                ((< |p| |limit|)
                 (SEQ (LETT |a| (|spadConstant| $ 7) . #5#)
                      (LETT |disclog| 0 . #5#) (LETT |found| 'NIL . #5#)
                      (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |p| 1) . #5#) G190
                           (COND
                            ((OR (|greater_SI| |i| #4#)
                                 (NULL (COND (|found| 'NIL) ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |a| |c| (QREFELT $ 9))
                               (SEQ (LETT |disclog| |i| . #5#)
                                    (EXIT (LETT |found| 'T . #5#))))
                              ('T
                               (LETT |a|
                                     (SPADCALL |a| |logbase| (QREFELT $ 10))
                                     . #5#)))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND (|found| (CONS 0 |disclog|))
                             (#6='T
                              (SEQ
                               (SPADCALL
                                "discreteLog: second argument not in cyclic group generated by first argument"
                                (QREFELT $ 14))
                               (EXIT (CONS 1 "failed"))))))))
                (#6#
                 (SEQ (LETT |l| (INTEGER-LENGTH |p|) . #5#)
                      (COND
                       ((ODDP |l|)
                        (LETT |n| (ASH |p| (- (QUOTIENT2 |l| 2))) . #5#))
                       (#6# (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)) . #5#)))
                      (LETT |a| (|spadConstant| $ 7) . #5#)
                      (LETT |exptable| (SPADCALL (QREFELT $ 16)) . #5#)
                      (SEQ (LETT |i| 0 . #5#)
                           (LETT #2#
                                 (PROG1 (LETT #3# (- |n| 1) . #5#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 . #5#)
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (SPADCALL (CONS (SPADCALL |a| (QREFELT $ 18)) |i|)
                                      |exptable| (QREFELT $ 20))
                            (EXIT
                             (LETT |a| (SPADCALL |a| |logbase| (QREFELT $ 10))
                                   . #5#)))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |found| 'NIL . #5#)
                      (LETT |end| (QUOTIENT2 (- |p| 1) |n|) . #5#)
                      (LETT |disclog| 0 . #5#) (LETT |a| |c| . #5#)
                      (LETT |b| (SPADCALL |logbase| (- |n|) (QREFELT $ 22))
                            . #5#)
                      (SEQ (LETT |i| 0 . #5#) (LETT #1# |end| . #5#) G190
                           (COND
                            ((OR (|greater_SI| |i| #1#)
                                 (NULL (COND (|found| 'NIL) ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (LETT |rho|
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 18))
                                            |exptable| (QREFELT $ 24))
                                  . #5#)
                            (EXIT
                             (COND
                              ((QEQCAR |rho| 0)
                               (SEQ (LETT |found| 'T . #5#)
                                    (EXIT
                                     (LETT |disclog|
                                           (+ (* |n| |i|) (QCDR |rho|))
                                           . #5#))))
                              ('T
                               (LETT |a| (SPADCALL |a| |b| (QREFELT $ 10))
                                     . #5#)))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND (|found| (CONS 0 |disclog|))
                             (#6#
                              (SEQ
                               (SPADCALL
                                "discreteLog: second argument not in cyclic group generated by first argument"
                                (QREFELT $ 14))
                               (EXIT (CONS 1 "failed"))))))))))))) 

(DECLAIM (NOTINLINE |DiscreteLogarithmPackage;|)) 

(DEFUN |DiscreteLogarithmPackage| (#1=#:G127)
  (SPROG NIL
         (PROG (#2=#:G128)
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
                  (HREM |$ConstructorCache|
                        '|DiscreteLogarithmPackage|)))))))))) 

(DEFUN |DiscreteLogarithmPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DiscreteLogarithmPackage|))
          (LETT |dv$| (LIST '|DiscreteLogarithmPackage| DV$1) . #1#)
          (LETT $ (GETREFV 27) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DiscreteLogarithmPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

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
