
(/VERSIONCHECK 2) 

(DEFUN |VECTOR2;scan;MVBV;1| (|f| |v| |b| $)
  (SPADCALL |f| |v| |b| (QREFELT $ 12))) 

(DEFUN |VECTOR2;reduce;MV2B;2| (|f| |v| |b| $)
  (SPADCALL |f| |v| |b| (QREFELT $ 14))) 

(DEFUN |VECTOR2;map;MVV;3| (|f| |v| $) (SPADCALL |f| |v| (QREFELT $ 17))) 

(DEFUN |VECTOR2;map;MVU;4| (|f| |a| $)
  (PROG (|res| #1=#:G115 #2=#:G127 |r| #3=#:G128 |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |res| NIL . #4=(|VECTOR2;map;MVU;4|))
            (SEQ (LETT |u| NIL . #4#)
                 (LETT #3# (SPADCALL |a| (QREFELT $ 20)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |u| |f|) . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |r| (CONS 1 "failed") (QREFELT $ 23))
                         (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #2#)))
                        ('T
                         (LETT |res|
                               (CONS
                                (PROG2 (LETT #1# |r| . #4#)
                                    (QCDR #1#)
                                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                 #1#))
                                |res|)
                               . #4#)))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (SPADCALL (NREVERSE |res|) (QREFELT $ 25))))))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |VectorFunctions2;|)) 

(DEFUN |VectorFunctions2| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|VectorFunctions2|)
                                           '|domainEqualList|)
                . #3=(|VectorFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |VectorFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|VectorFunctions2|))))))))))) 

(DEFUN |VectorFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|VectorFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|VectorFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|VectorFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|VectorFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Vector| 7) (|Mapping| 7 6 7) (|Vector| 6)
              (|FiniteLinearAggregateFunctions2| 6 10 7 8) (0 . |scan|)
              |VECTOR2;scan;MVBV;1| (7 . |reduce|) |VECTOR2;reduce;MV2B;2|
              (|Mapping| 7 6) (14 . |map|) |VECTOR2;map;MVV;3| (|List| 6)
              (20 . |entries|) (|Boolean|) (|Union| 7 '"failed") (25 . =)
              (|List| 7) (31 . |vector|) (|Union| 8 '"failed") (|Mapping| 22 6)
              |VECTOR2;map;MVU;4|)
           '#(|scan| 36 |reduce| 43 |map| 50) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(3 11 8 9 10 7 12 3 11 7 9 10
                                                   7 14 2 11 8 16 10 17 1 10 19
                                                   0 20 2 22 21 0 0 23 1 8 0 24
                                                   25 3 0 8 9 10 7 13 3 0 7 9
                                                   10 7 15 2 0 26 27 10 28 2 0
                                                   8 16 10 18)))))
           '|lookupComplete|)) 
