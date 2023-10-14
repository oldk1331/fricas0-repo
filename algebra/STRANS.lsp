
(/VERSIONCHECK 2) 

(DEFUN |STRANS;STransform1;DUTSR;1| (|x| $)
  (PROG (|res| |chi| |mom|)
    (RETURN
     (SEQ
      (LETT |mom| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 14))
            . #1=(|STRANS;STransform1;DUTSR;1|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |mom| (QREFELT $ 15)) (QREFELT $ 17))
         (|error| "mean is zero!"))
        ('T
         (SEQ
          (LETT |mom| (SPADCALL (|spadConstant| $ 18) |mom| (QREFELT $ 20))
                . #1#)
          (LETT |chi| (SPADCALL |mom| (QREFELT $ 22)) . #1#)
          (LETT |res|
                (SPADCALL (SPADCALL |chi| (QREFELT $ 23))
                          (SPADCALL (SPADCALL |chi| (QREFELT $ 24))
                                    (QREFELT $ 23))
                          (QREFELT $ 25))
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL |res| (QREFELT $ 14)) (QREFELT $ 26))))))))))) 

(DEFUN |STRANS;STransform2;DUPSR;2| (|x| $)
  (PROG (S2 |res2| |chi2| |mom2| |mom|)
    (RETURN
     (SEQ
      (LETT |mom| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 14))
            . #1=(|STRANS;STransform2;DUPSR;2|))
      (COND
       ((NULL (SPADCALL (SPADCALL |mom| (QREFELT $ 15)) (QREFELT $ 17)))
        (EXIT (|error| "mean is nonzero!"))))
      (LETT |mom2|
            (SPADCALL (|spadConstant| $ 18)
                      (SPADCALL (SPADCALL 1 2 (QREFELT $ 32))
                                (SPADCALL |mom| (QREFELT $ 24)) (QREFELT $ 33))
                      (QREFELT $ 20))
            . #1#)
      (LETT |chi2| (SPADCALL |mom2| (QREFELT $ 22)) . #1#)
      (LETT |res2| (SPADCALL |chi2| (QREFELT $ 26)) . #1#)
      (LETT S2
            (SPADCALL (SPADCALL -2 |res2| (QREFELT $ 34))
                      (SPADCALL 0 |res2| (QREFELT $ 34)) (QREFELT $ 35))
            . #1#)
      (EXIT (SPADCALL (SPADCALL 1 2 (QREFELT $ 32)) S2 (QREFELT $ 36))))))) 

(DEFUN |STRANS;STransform;DUPSR;3| (|x| $)
  (PROG (S |res| |chi| |mom| S2 |res2| |chi2| |mom2|)
    (RETURN
     (SEQ
      (LETT |mom| (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 14))
            . #1=(|STRANS;STransform;DUPSR;3|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |mom| (QREFELT $ 15)) (QREFELT $ 17))
         (SEQ
          (LETT |mom2|
                (SPADCALL (|spadConstant| $ 18)
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 32))
                                    (SPADCALL |mom| (QREFELT $ 24))
                                    (QREFELT $ 33))
                          (QREFELT $ 20))
                . #1#)
          (LETT |chi2| (SPADCALL |mom2| (QREFELT $ 22)) . #1#)
          (LETT |res2| (SPADCALL |chi2| (QREFELT $ 26)) . #1#)
          (LETT S2
                (SPADCALL (SPADCALL -2 |res2| (QREFELT $ 34))
                          (SPADCALL 0 |res2| (QREFELT $ 34)) (QREFELT $ 35))
                . #1#)
          (EXIT (SPADCALL (SPADCALL 1 2 (QREFELT $ 32)) S2 (QREFELT $ 36)))))
        ('T
         (SEQ
          (LETT |mom| (SPADCALL (|spadConstant| $ 18) |mom| (QREFELT $ 20))
                . #1#)
          (LETT |chi| (SPADCALL |mom| (QREFELT $ 22)) . #1#)
          (LETT |res|
                (SPADCALL (SPADCALL |chi| (QREFELT $ 23))
                          (SPADCALL (SPADCALL |chi| (QREFELT $ 24))
                                    (QREFELT $ 23))
                          (QREFELT $ 25))
                . #1#)
          (LETT S (SPADCALL (SPADCALL |res| (QREFELT $ 14)) (QREFELT $ 26))
                . #1#)
          (EXIT
           (SPADCALL (|spadConstant| $ 38) (SPADCALL 0 S (QREFELT $ 34))
                     (QREFELT $ 36))))))))))) 

(DEFUN |STRANS;distributionBySTransform;UPSRD;4| (S $)
  (PROG (|psi| |psi2| |chi2| |z1z| S2 #1=#:G149 |chi| S1)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL S (QREFELT $ 40)) (|spadConstant| $ 41)
                    (QREFELT $ 42))
          (SEQ
           (LETT S1 (SPADCALL (SPADCALL S (QREFELT $ 43)) (QREFELT $ 44))
                 . #2=(|STRANS;distributionBySTransform;UPSRD;4|))
           (LETT |z1z|
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 18)
                            (SPADCALL
                             (LIST (|spadConstant| $ 28)
                                   (SPADCALL (|spadConstant| $ 28)
                                             (QREFELT $ 48)))
                             (QREFELT $ 50))
                            (QREFELT $ 20))
                  (QREFELT $ 26))
                 . #2#)
           (LETT |chi|
                 (SPADCALL (SPADCALL S1 |z1z| (QREFELT $ 51)) (QREFELT $ 52))
                 . #2#)
           (LETT |psi| (SPADCALL |chi| (QREFELT $ 22)) . #2#)
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL
                    (SPADCALL (SPADCALL |psi| (QREFELT $ 24)) (QREFELT $ 23))
                    (QREFELT $ 53))
                   . #2#)
             (GO #1#)))))
         ((NULL
           (SPADCALL (SPADCALL S (QREFELT $ 40))
                     (SPADCALL (SPADCALL 1 2 (QREFELT $ 32)) (QREFELT $ 54))
                     (QREFELT $ 42)))
          (|error| "Not an S-transform")))
        (COND
         ((NULL
           (SPADCALL (SPADCALL S (QREFELT $ 55)) (SPADCALL 1 2 (QREFELT $ 32))
                     (QREFELT $ 42)))
          (|error| "Not an S-transform")))
        (LETT S2 (SPADCALL S (QREFELT $ 56)) . #2#)
        (LETT |z1z|
              (SPADCALL
               (SPADCALL (|spadConstant| $ 18)
                         (SPADCALL
                          (LIST (|spadConstant| $ 18) (|spadConstant| $ 28)
                                (|spadConstant| $ 18)
                                (SPADCALL (|spadConstant| $ 28)
                                          (QREFELT $ 48)))
                          (QREFELT $ 50))
                         (QREFELT $ 20))
               (QREFELT $ 26))
              . #2#)
        (LETT |chi2|
              (SPADCALL
               (SPADCALL S2 (SPADCALL 0 |z1z| (QREFELT $ 34)) (QREFELT $ 58))
               (QREFELT $ 44))
              . #2#)
        (LETT |psi2| (SPADCALL (SPADCALL |chi2| (QREFELT $ 52)) (QREFELT $ 22))
              . #2#)
        (LETT |psi|
              (SPADCALL (SPADCALL 2 (QREFELT $ 59)) |psi2| (QREFELT $ 33))
              . #2#)
        (EXIT
         (SPADCALL (SPADCALL (SPADCALL |psi| (QREFELT $ 24)) (QREFELT $ 23))
                   (QREFELT $ 53)))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |STransformPackage;|)) 

(DEFUN |STransformPackage| (&REST #1=#:G150)
  (PROG ()
    (RETURN
     (PROG (#2=#:G151)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|STransformPackage|)
                                           '|domainEqualList|)
                . #3=(|STransformPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |STransformPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|STransformPackage|))))))))))) 

(DEFUN |STransformPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|STransformPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|STransformPackage| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 61) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|STransformPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|STransformPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Sequence| 6) (|Distribution| 6)
              (0 . |moments|) (|Stream| 6) (5 . |stream|) (10 . |first|)
              (|Boolean|) (15 . |zero?|) (20 . |Zero|) (24 . |Zero|)
              (28 . |cons|) (|StreamTaylorSeriesOperations| 6) (34 . |revert|)
              (39 . |sequence|) (44 . |rest|) (49 . +) (55 . |series|)
              |STRANS;STransform1;DUTSR;1| (60 . |One|) (64 . |One|)
              (|Integer|) (|Fraction| 30) (68 . /) (74 . |powern|)
              (80 . |laurent|) (86 . +) (92 . |puiseux|)
              |STRANS;STransform2;DUPSR;2| (98 . |One|)
              |STRANS;STransform;DUPSR;3| (102 . |order|) (107 . |Zero|)
              (111 . =) (117 . |retract|) (122 . |retract|) (127 . |Zero|)
              (131 . |Zero|) (135 . |Zero|) (139 . -) (|List| 6)
              (144 . |repeating|) (149 . *) (155 . |coefficients|)
              (160 . |distributionByMoments|) (165 . -) (170 . |rationalPower|)
              (175 . |laurentRep|) (180 . |Zero|) (184 . *) (190 . |coerce|)
              |STRANS;distributionBySTransform;UPSRD;4|)
           '#(|freeMultiplicativeConvolution| 195 |distributionBySTransform|
              201 |STransform2| 206 |STransform1| 211 |STransform| 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(1 11 10 0 12 1 10 13 0 14 1
                                                   13 6 0 15 1 6 16 0 17 0 6 0
                                                   18 0 7 0 19 2 13 0 6 0 20 1
                                                   21 13 13 22 1 10 0 13 23 1
                                                   13 0 0 24 2 10 0 0 0 25 1 7
                                                   0 13 26 0 6 0 28 0 7 0 29 2
                                                   31 0 30 30 32 2 21 13 31 13
                                                   33 2 8 0 30 7 34 2 8 0 0 0
                                                   35 2 9 0 31 8 36 0 31 0 38 1
                                                   9 31 0 40 0 31 0 41 2 31 16
                                                   0 0 42 1 9 8 0 43 1 8 7 0 44
                                                   0 8 0 45 0 9 0 46 0 11 0 47
                                                   1 6 0 0 48 1 13 0 49 50 2 7
                                                   0 0 0 51 1 7 13 0 52 1 11 0
                                                   10 53 1 31 0 0 54 1 9 31 0
                                                   55 1 9 8 0 56 0 10 0 57 2 8
                                                   0 0 0 58 1 31 0 30 59 2 0 11
                                                   11 11 1 1 0 11 9 60 1 0 9 11
                                                   37 1 0 7 11 27 1 0 9 11
                                                   39)))))
           '|lookupComplete|)) 
