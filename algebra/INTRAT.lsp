
(SDEFUN |INTRAT;infieldint;FU;1|
        ((|f| |Fraction| UP) ($ |Union| (|Fraction| UP) "failed"))
        (SPROG
         ((|rec|
           (|Record| (|:| |ans| (|Fraction| UP)) (|:| |nosol| (|Boolean|)))))
         (SEQ
          (LETT |rec| (SPADCALL (|spadConstant| $ 11) |f| (QREFELT $ 14))
                |INTRAT;infieldint;FU;1|)
          (EXIT
           (COND ((QCDR |rec|) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR |rec|)))))))) 

(SDEFUN |INTRAT;integrate;FIr;2|
        ((|f| |Fraction| UP) ($ |IntegrationResult| (|Fraction| UP)))
        (SPROG
         ((|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| (ELT $ 17) (QREFELT $ 21))
                |INTRAT;integrate;FIr;2|)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 22))
                       (QREFELT $ 23))
             (QREFELT $ 25))
            (QVELT |rec| 0) (QREFELT $ 26)))))) 

(DECLAIM (NOTINLINE |RationalIntegration;|)) 

(DEFUN |RationalIntegration| (&REST #1=#:G118)
  (SPROG NIL
         (PROG (#2=#:G119)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RationalIntegration|)
                                               '|domainEqualList|)
                    . #3=(|RationalIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RationalIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RationalIntegration|)))))))))) 

(DEFUN |RationalIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RationalIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 28) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RationalIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RationalIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|Fraction| 7) (8 . |Zero|)
              (|Record| (|:| |ans| 10) (|:| |nosol| (|Boolean|)))
              (|TranscendentalRischDE| 6 7) (12 . |baseRDE|)
              (|Union| 10 '"failed") |INTRAT;infieldint;FU;1|
              (18 . |differentiate|)
              (|Record| (|:| |ir| 24) (|:| |specpart| 10) (|:| |polypart| 7))
              (|Mapping| 7 7) (|TranscendentalIntegration| 6 7)
              (23 . |monomialIntegrate|) (29 . |integrate|) (34 . |coerce|)
              (|IntegrationResult| 10) (39 . |coerce|) (44 . +)
              |INTRAT;integrate;FIr;2|)
           '#(|integrate| 50 |infieldint| 55) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(0 6 0 8 0 7 0 9 0 10 0 11 2
                                                   13 12 10 10 14 1 7 0 0 17 2
                                                   20 18 10 19 21 1 7 0 0 22 1
                                                   10 0 7 23 1 24 0 10 25 2 24
                                                   0 0 0 26 1 0 24 10 27 1 0 15
                                                   10 16)))))
           '|lookupComplete|)) 
