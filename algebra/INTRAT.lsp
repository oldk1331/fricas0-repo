
(SDEFUN |INTRAT;infieldint;FU;1|
        ((|f| |Fraction| UP) ($ |Union| (|Fraction| UP) "failed"))
        (SPROG
         ((|s1|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))
          (|rec|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F)))))
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| F))))
         (SEQ
          (LETT |ext| (CONS #'|INTRAT;infieldint;FU;1!0| $)
                . #1=(|INTRAT;infieldint;FU;1|))
          (LETT |rec|
                (SPADCALL (ELT $ 15) |ext| (ELT $ 12) (LIST |f|)
                          (QREFELT $ 24))
                . #1#)
          (EXIT
           (COND ((NULL |rec|) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |s1| (|SPADfirst| |rec|) . #1#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (SPADCALL (QCAR |s1|)
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (QCDR |s1|) 1
                                                     (QREFELT $ 31))
                                           (QREFELT $ 32))
                                          (QREFELT $ 33))
                                         (QREFELT $ 34))
                               (QREFELT $ 35))))))))))) 

(SDEFUN |INTRAT;infieldint;FU;1!0| ((|lg| NIL) ($ NIL))
        (SPROG ((#1=#:G113 NIL) (|bv| NIL) (#2=#:G112 NIL) (|r1| NIL))
               (SEQ
                (LETT |r1|
                      (SPADCALL (SPADCALL (LIST |lg|) (QREFELT $ 10))
                                (QREFELT $ 12))
                      NIL)
                (EXIT
                 (PROGN
                  (LETT #2# NIL NIL)
                  (SEQ (LETT |bv| NIL NIL) (LETT #1# |r1| NIL) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |bv| (CAR #1#) NIL) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (CONS (|spadConstant| $ 13) |bv|) #2#)
                               NIL)))
                       (LETT #1# (CDR #1#) NIL) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INTRAT;integrate;FIr;2|
        ((|f| |Fraction| UP) ($ |IntegrationResult| (|Fraction| UP)))
        (SPROG
         ((|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| (ELT $ 15) (QREFELT $ 40))
                |INTRAT;integrate;FIr;2|)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 41))
                       (QREFELT $ 33))
             (QREFELT $ 43))
            (QVELT |rec| 0) (QREFELT $ 44)))))) 

(DECLAIM (NOTINLINE |RationalIntegration;|)) 

(DEFUN |RationalIntegration| (&REST #1=#:G128)
  (SPROG NIL
         (PROG (#2=#:G129)
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
          (LETT $ (GETREFV 46) . #1#)
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
              (|List| (|List| 6)) (|Matrix| 6) (0 . |matrix|) (|List| 30)
              (5 . |nullSpace|) (10 . |Zero|) (14 . |Zero|)
              (18 . |differentiate|)
              (|Record| (|:| |ratpart| 27) (|:| |coeffs| 30)) (|List| 16)
              (|Mapping| 7 7) (|Record| (|:| |ratpart| 6) (|:| |coeffs| 30))
              (|Mapping| (|List| 19) (|List| 6)) (|Mapping| 11 9) (|List| 27)
              (|ParametricTranscendentalIntegration| 6 7) (23 . |primextint|)
              (31 . |One|) (35 . |One|) (|Fraction| 7) (39 . |One|) (|Integer|)
              (|Vector| 6) (43 . |elt|) (49 . |coerce|) (54 . |coerce|)
              (59 . /) (65 . -) (|Union| 27 '"failed") |INTRAT;infieldint;FU;1|
              (|Record| (|:| |ir| 42) (|:| |specpart| 27) (|:| |polypart| 7))
              (|TranscendentalIntegration| 6 7) (70 . |monomialIntegrate|)
              (76 . |integrate|) (|IntegrationResult| 27) (81 . |coerce|)
              (86 . +) |INTRAT;integrate;FIr;2|)
           '#(|integrate| 92 |infieldint| 97) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 9 0 8 10 1 9 11 0 12 0 6 0
                                                   13 0 7 0 14 1 7 0 0 15 4 23
                                                   17 18 20 21 22 24 0 6 0 25 0
                                                   7 0 26 0 27 0 28 2 30 6 0 29
                                                   31 1 7 0 6 32 1 27 0 7 33 2
                                                   27 0 0 0 34 1 27 0 0 35 2 39
                                                   38 27 18 40 1 7 0 0 41 1 42
                                                   0 27 43 2 42 0 0 0 44 1 0 42
                                                   27 45 1 0 36 27 37)))))
           '|lookupComplete|)) 
