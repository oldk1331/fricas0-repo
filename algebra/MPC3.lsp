
(/VERSIONCHECK 2) 

(DEFUN |MPC3;map;MPR1PR2;1| (|f| |p| $)
  (PROG (|up| |ans| |x2| |c| |x1|)
    (RETURN
     (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 14)) . #1=(|MPC3;map;MPR1PR2;1|))
          (EXIT
           (COND
            ((QEQCAR |x1| 1)
             (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 15)) . #1#)
                  (EXIT (SPADCALL |c| (QREFELT $ 16)))))
            ('T
             (SEQ (LETT |up| (SPADCALL |p| (QCDR |x1|) (QREFELT $ 18)) . #1#)
                  (LETT |x2| (SPADCALL (QCDR |x1|) |f|) . #1#)
                  (LETT |ans| (|spadConstant| $ 19) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |up| (|spadConstant| $ 23) (QREFELT $ 25)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (SPADCALL |f|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 26))
                                                   (QREFELT $ 28))
                                         |x2| (SPADCALL |up| (QREFELT $ 30))
                                         (QREFELT $ 31))
                                        (QREFELT $ 32))
                              . #1#)
                        (EXIT
                         (LETT |up| (SPADCALL |up| (QREFELT $ 33)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))))) 

(DECLAIM (NOTINLINE |MPolyCatFunctions3;|)) 

(DEFUN |MPolyCatFunctions3| (&REST #1=#:G138)
  (PROG ()
    (RETURN
     (PROG (#2=#:G139)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MPolyCatFunctions3|)
                                           '|domainEqualList|)
                . #3=(|MPolyCatFunctions3|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MPolyCatFunctions3;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MPolyCatFunctions3|))))))))))) 

(DEFUN |MPolyCatFunctions3;| (|#1| |#2| |#3| |#4| |#5| |#6| |#7|)
  (PROG (|pv$| $ |dv$| DV$7 DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MPolyCatFunctions3|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT DV$7 (|devaluate| |#7|) . #1#)
      (LETT |dv$|
            (LIST '|MPolyCatFunctions3| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7)
            . #1#)
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MPolyCatFunctions3|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (QSETREFV $ 12 |#7|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MPolyCatFunctions3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|Union| 6 '"failed") (0 . |mainVariable|)
              (5 . |retract|) (10 . |coerce|) (|SparseUnivariatePolynomial| $)
              (15 . |univariate|) (21 . |Zero|) (25 . |Zero|) (29 . |Zero|)
              (|SparseUnivariatePolynomial| 11) (33 . |Zero|) (|Boolean|)
              (37 . ~=) (43 . |leadingCoefficient|) (|Mapping| 7 6)
              |MPC3;map;MPR1PR2;1| (|NonNegativeInteger|) (48 . |degree|)
              (53 . |monomial|) (60 . +) (66 . |reductum|))
           '#(|map| 71) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(1 11 13 0 14 1 11 10 0 15 1
                                                   12 0 10 16 2 11 17 0 6 18 0
                                                   12 0 19 0 8 0 20 0 9 0 21 0
                                                   22 0 23 2 22 24 0 0 25 1 22
                                                   11 0 26 1 22 29 0 30 3 12 0
                                                   0 7 29 31 2 12 0 0 0 32 1 22
                                                   0 0 33 2 0 12 27 11 28)))))
           '|lookupComplete|)) 
