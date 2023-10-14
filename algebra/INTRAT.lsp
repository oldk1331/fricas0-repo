
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

(SDEFUN |INTRAT;limitedint;FLU;3|
        ((|f| |Fraction| UP) (|lu| |List| (|Fraction| UP))
         ($ |Union|
          (|Record| (|:| |mainpart| (|Fraction| UP))
                    (|:| |limitedlogs|
                         (|List|
                          (|Record| (|:| |coeff| (|Fraction| UP))
                                    (|:| |logand| (|Fraction| UP))))))
          "failed"))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |mainpart| (|Fraction| UP))
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| (|Fraction| UP))
                                      (|:| |logand| (|Fraction| UP))))))
            "failed"))
          (|quorem| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))))
         (SEQ
          (LETT |quorem|
                (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                          (SPADCALL |f| (QREFELT $ 29)) (QREFELT $ 31))
                . #1=(|INTRAT;limitedint;FLU;3|))
          (LETT |u|
                (SPADCALL
                 (SPADCALL (QCDR |quorem|) (SPADCALL |f| (QREFELT $ 29))
                           (QREFELT $ 32))
                 (ELT $ 17) |lu| (QREFELT $ 37))
                . #1#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (CONS
                         (SPADCALL (QCAR (QCDR |u|))
                                   (SPADCALL
                                    (SPADCALL (QCAR |quorem|) (QREFELT $ 22))
                                    (QREFELT $ 23))
                                   (QREFELT $ 38))
                         (QCDR (QCDR |u|)))))))))) 

(SDEFUN |INTRAT;extendedint;2FU;4|
        ((|f| |Fraction| UP) (|g| |Fraction| UP)
         ($ |Union|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeff| (|Fraction| UP)))
          "failed"))
        (SPROG
         ((|i2| (|Fraction| UP))
          (|i1|
           (|Union|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeff| (|Fraction| UP)))
            "failed"))
          (|gqr| #1=(|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|fqr| #1#))
         (SEQ
          (LETT |fqr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                          (SPADCALL |f| (QREFELT $ 29)) (QREFELT $ 31))
                . #2=(|INTRAT;extendedint;2FU;4|))
          (LETT |gqr|
                (SPADCALL (SPADCALL |g| (QREFELT $ 28))
                          (SPADCALL |g| (QREFELT $ 29)) (QREFELT $ 31))
                . #2#)
          (LETT |i1|
                (SPADCALL
                 (SPADCALL (QCDR |fqr|) (SPADCALL |f| (QREFELT $ 29))
                           (QREFELT $ 32))
                 (ELT $ 17)
                 (SPADCALL (QCDR |gqr|) (SPADCALL |g| (QREFELT $ 29))
                           (QREFELT $ 32))
                 (QREFELT $ 42))
                . #2#)
          (EXIT
           (COND ((QEQCAR |i1| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |i2|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCAR |fqr|)
                                     (SPADCALL
                                      (SPADCALL (QCDR (QCDR |i1|))
                                                (QREFELT $ 43))
                                      (QCAR |gqr|) (QREFELT $ 44))
                                     (QREFELT $ 45))
                           (QREFELT $ 22))
                          (QREFELT $ 23))
                         . #2#)
                   (EXIT
                    (CONS 0
                          (CONS
                           (SPADCALL |i2| (QCAR (QCDR |i1|)) (QREFELT $ 38))
                           (QCDR (QCDR |i1|)))))))))))) 

(DECLAIM (NOTINLINE |RationalIntegration;|)) 

(DEFUN |RationalIntegration| (&REST #1=#:G135)
  (SPROG NIL
         (PROG (#2=#:G136)
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
          (LETT $ (GETREFV 47) . #1#)
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
              |INTRAT;integrate;FIr;2| (50 . |numer|) (55 . |denom|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (60 . |divide|)
              (66 . /) (|Record| (|:| |coeff| 10) (|:| |logand| 10))
              (|Record| (|:| |mainpart| 10) (|:| |limitedlogs| (|List| 33)))
              (|Union| 34 '"failed") (|List| 10) (72 . |primlogintfrac|)
              (79 . +) |INTRAT;limitedint;FLU;3|
              (|Record| (|:| |ratpart| 10) (|:| |coeff| 10))
              (|Union| 40 '"failed") (85 . |primextintfrac|) (92 . |retract|)
              (97 . *) (103 . -) |INTRAT;extendedint;2FU;4|)
           '#(|limitedint| 109 |integrate| 115 |infieldint| 120 |extendedint|
              125)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 46
                                                 '(0 6 0 8 0 7 0 9 0 10 0 11 2
                                                   13 12 10 10 14 1 7 0 0 17 2
                                                   20 18 10 19 21 1 7 0 0 22 1
                                                   10 0 7 23 1 24 0 10 25 2 24
                                                   0 0 0 26 1 10 7 0 28 1 10 7
                                                   0 29 2 7 30 0 0 31 2 10 0 7
                                                   7 32 3 20 35 10 19 36 37 2
                                                   10 0 0 0 38 3 20 41 10 19 10
                                                   42 1 10 7 0 43 2 7 0 0 0 44
                                                   2 7 0 0 0 45 2 0 35 10 36 39
                                                   1 0 24 10 27 1 0 15 10 16 2
                                                   0 41 10 10 46)))))
           '|lookupComplete|)) 
