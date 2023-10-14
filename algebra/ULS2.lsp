
(/VERSIONCHECK 2) 

(DEFUN |ULS2;map;MUlsUls;1| (|f| |ups| $)
  (SPADCALL (SPADCALL |ups| (QREFELT $ 14))
            (SPADCALL |f| (SPADCALL |ups| (QREFELT $ 16)) (QREFELT $ 20))
            (QREFELT $ 22))) 

(DEFUN |UnivariateLaurentSeriesFunctions2| (&REST #1=#:G129)
  (PROG ()
    (RETURN
     (PROG (#2=#:G130)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariateLaurentSeriesFunctions2|)
                                           '|domainEqualList|)
                . #3=(|UnivariateLaurentSeriesFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |UnivariateLaurentSeriesFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|UnivariateLaurentSeriesFunctions2|))))))))))) 

(DEFUN |UnivariateLaurentSeriesFunctions2;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (PROG (|pv$| $ |dv$| DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariateLaurentSeriesFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT |dv$|
            (LIST '|UnivariateLaurentSeriesFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5
                  DV$6)
            . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeriesFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariateLaurentSeriesFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|Integer|) (|UnivariateLaurentSeries| 6 8 10) (0 . |degree|)
              (|UnivariateTaylorSeries| 6 8 10) (5 . |taylorRep|)
              (|UnivariateTaylorSeries| 7 9 11) (|Mapping| 7 6)
              (|UnivariateTaylorSeriesFunctions2| 6 7 15 17) (10 . |map|)
              (|UnivariateLaurentSeries| 7 9 11) (16 . |laurent|)
              |ULS2;map;MUlsUls;1|)
           '#(|map| 22) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 13 12 0 14 1 13 15 0 16 2
                                                   19 17 18 15 20 2 21 0 12 17
                                                   22 2 0 21 18 13 23)))))
           '|lookupComplete|)) 
