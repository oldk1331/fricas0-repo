
(/VERSIONCHECK 2) 

(DEFUN |INTHERTR;HermiteIntegrate;FMR;1| (|f| |derivation| $)
  (PROG (|qr| |hi| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 12))
            . #1=(|INTHERTR;HermiteIntegrate;FMR;1|))
      (LETT |hi|
            (|INTHERTR;normalHermiteIntegrate| (QVELT |rec| 1) |derivation| $)
            . #1#)
      (LETT |qr| (SPADCALL (QVELT |hi| 1) (QVELT |hi| 2) (QREFELT $ 14)) . #1#)
      (EXIT
       (VECTOR (QVELT |hi| 0)
               (SPADCALL (QCDR |qr|) (QVELT |hi| 2) (QREFELT $ 15))
               (QVELT |rec| 2)
               (SPADCALL (QCAR |qr|) (QVELT |rec| 0) (QREFELT $ 16)))))))) 

(DEFUN |INTHERTR;normalHermiteIntegrate| (|f| |derivation| $)
  (PROG (|mult| |p| |a| #1=#:G138 |qr| |bc| #2=#:G142 |qtil| |qbarhat| |g|
         |qbar| |qhat| |g0| |q|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL |f| (QREFELT $ 19))
            . #3=(|INTHERTR;normalHermiteIntegrate|))
      (LETT |q| (SPADCALL |f| (QREFELT $ 20)) . #3#)
      (LETT |p| (|spadConstant| $ 21) . #3#)
      (LETT |mult| (|spadConstant| $ 22) . #3#)
      (LETT |qhat|
            (PROG2
                (LETT #1#
                      (SPADCALL |q|
                                (LETT |g0|
                                      (LETT |g|
                                            (SPADCALL |q|
                                                      (SPADCALL |q|
                                                                (QREFELT $ 23))
                                                      (QREFELT $ 24))
                                            . #3#)
                                      . #3#)
                                (QREFELT $ 26))
                      . #3#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
            . #3#)
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL (LETT |qbar| |g| . #3#) (QREFELT $ 28)) 0
                        (QREFELT $ 31)))
             (GO G191)))
           (SEQ
            (LETT |qbarhat|
                  (PROG2
                      (LETT #1#
                            (SPADCALL |qbar|
                                      (LETT |g|
                                            (SPADCALL |qbar|
                                                      (SPADCALL |qbar|
                                                                (QREFELT $ 23))
                                                      (QREFELT $ 24))
                                            . #3#)
                                      (QREFELT $ 26))
                            . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                  . #3#)
            (LETT |qtil|
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL |qhat| (SPADCALL |qbar| |derivation|)
                                        (QREFELT $ 32))
                              |qbar| (QREFELT $ 26))
                             . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                   (QREFELT $ 33))
                  . #3#)
            (LETT |bc|
                  (PROG2
                      (LETT #2# (SPADCALL |qtil| |qbarhat| |a| (QREFELT $ 36))
                            . #3#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0)
                                   (|Record| (|:| |coef1| (QREFELT $ 7))
                                             (|:| |coef2| (QREFELT $ 7)))
                                   #2#))
                  . #3#)
            (LETT |qr| (SPADCALL (QCAR |bc|) |qbarhat| (QREFELT $ 14)) . #3#)
            (LETT |a|
                  (SPADCALL
                   (SPADCALL (QCDR |bc|)
                             (SPADCALL |qtil| (QCAR |qr|) (QREFELT $ 32))
                             (QREFELT $ 16))
                   (SPADCALL (SPADCALL (QCDR |qr|) |derivation|)
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL |qhat| |qbarhat|
                                                 (QREFELT $ 26))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                              #1#))
                             (QREFELT $ 32))
                   (QREFELT $ 37))
                  . #3#)
            (LETT |p|
                  (SPADCALL |p| (SPADCALL |mult| (QCDR |qr|) (QREFELT $ 32))
                            (QREFELT $ 16))
                  . #3#)
            (EXIT
             (LETT |mult| (SPADCALL |mult| |qbarhat| (QREFELT $ 32)) . #3#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR (SPADCALL |p| |g0| (QREFELT $ 15)) |a| |qhat|)))))) 

(DEFUN |TranscendentalHermiteIntegration| (&REST #1=#:G149)
  (PROG ()
    (RETURN
     (PROG (#2=#:G150)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TranscendentalHermiteIntegration|)
                                           '|domainEqualList|)
                . #3=(|TranscendentalHermiteIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |TranscendentalHermiteIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|TranscendentalHermiteIntegration|))))))))))) 

(DEFUN |TranscendentalHermiteIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalHermiteIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|TranscendentalHermiteIntegration| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 38) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TranscendentalHermiteIntegration|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TranscendentalHermiteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |poly| 7) (|:| |normal| 9) (|:| |special| 9))
              (|Fraction| 7) (|Mapping| 7 7) (|MonomialExtensionTools| 6 7)
              (0 . |decompose|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (6 . |divide|)
              (12 . /) (18 . +)
              (|Record| (|:| |answer| 9) (|:| |logpart| 9) (|:| |specpart| 9)
                        (|:| |polypart| 7))
              |INTHERTR;HermiteIntegrate;FMR;1| (24 . |numer|) (29 . |denom|)
              (34 . |Zero|) (38 . |One|) (42 . |differentiate|) (47 . |gcd|)
              (|Union| $ '"failed") (53 . |exquo|) (|NonNegativeInteger|)
              (59 . |degree|) (64 . |Zero|) (|Boolean|) (68 . >) (74 . *)
              (80 . -) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 34 '"failed") (85 . |extendedEuclidean|) (92 . -))
           '#(|HermiteIntegrate| 98) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(2 11 8 9 10 12 2 7 13 0 0 14
                                                   2 9 0 7 7 15 2 7 0 0 0 16 1
                                                   9 7 0 19 1 9 7 0 20 0 7 0 21
                                                   0 7 0 22 1 7 0 0 23 2 7 0 0
                                                   0 24 2 7 25 0 0 26 1 7 27 0
                                                   28 0 6 0 29 2 27 30 0 0 31 2
                                                   7 0 0 0 32 1 7 0 0 33 3 7 35
                                                   0 0 0 36 2 7 0 0 0 37 2 0 17
                                                   9 10 18)))))
           '|lookupComplete|)) 
