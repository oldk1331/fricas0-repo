
(/VERSIONCHECK 2) 

(DEFUN |MONOTOOL;normalDenom;FMUP;1| (|f| |derivation| $)
  (QCAR (SPADCALL (SPADCALL |f| (QREFELT $ 9)) |derivation| (QREFELT $ 12)))) 

(DEFUN |MONOTOOL;split;UPMR;2| (|p| |derivation| $)
  (PROG (|rec| #1=#:G136 |pbar|)
    (RETURN
     (SEQ
      (LETT |pbar|
            (PROG2
                (LETT #1#
                      (SPADCALL
                       (SPADCALL |p| (SPADCALL |p| |derivation|)
                                 (QREFELT $ 14))
                       (SPADCALL |p| (SPADCALL |p| (QREFELT $ 15))
                                 (QREFELT $ 14))
                       (QREFELT $ 17))
                      . #2=(|MONOTOOL;split;UPMR;2|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
            . #2#)
      (EXIT
       (COND
        ((ZEROP (SPADCALL |pbar| (QREFELT $ 19)))
         (CONS |p| (|spadConstant| $ 21)))
        ('T
         (SEQ
          (LETT |rec|
                (SPADCALL
                 (PROG2 (LETT #1# (SPADCALL |p| |pbar| (QREFELT $ 17)) . #2#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                 |derivation| (QREFELT $ 12))
                . #2#)
          (EXIT
           (CONS (QCAR |rec|)
                 (SPADCALL |pbar| (QCDR |rec|) (QREFELT $ 22)))))))))))) 

(DEFUN |MONOTOOL;splitSquarefree;UPMR;3| (|p| |derivation| $)
  (PROG (|n| |h| #1=#:G146 |s| |g| |r| #2=#:G153 |rec| |q|)
    (RETURN
     (SEQ
      (LETT |s| (|spadConstant| $ 24) . #3=(|MONOTOOL;splitSquarefree;UPMR;3|))
      (LETT |n| |s| . #3#) (LETT |q| (SPADCALL |p| (QREFELT $ 26)) . #3#)
      (SEQ (LETT |rec| NIL . #3#)
           (LETT #2# (SPADCALL |q| (QREFELT $ 29)) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |r| (QCAR |rec|) . #3#)
                (LETT |g|
                      (SPADCALL |r| (SPADCALL |r| |derivation|) (QREFELT $ 14))
                      . #3#)
                (COND
                 ((NULL (SPADCALL |g| (QREFELT $ 31)))
                  (LETT |s|
                        (SPADCALL |s|
                                  (SPADCALL |g| (QCDR |rec|) (QREFELT $ 33))
                                  (QREFELT $ 34))
                        . #3#)))
                (LETT |h|
                      (PROG2 (LETT #1# (SPADCALL |r| |g| (QREFELT $ 17)) . #3#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                      . #3#)
                (EXIT
                 (COND
                  ((NULL (SPADCALL |h| (QREFELT $ 31)))
                   (LETT |n|
                         (SPADCALL |n|
                                   (SPADCALL |h| (QCDR |rec|) (QREFELT $ 33))
                                   (QREFELT $ 34))
                         . #3#)))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (CONS |n|
             (SPADCALL (SPADCALL |q| (QREFELT $ 35)) |s| (QREFELT $ 36)))))))) 

(DEFUN |MONOTOOL;decompose;FMR;4| (|f| |derivation| $)
  (PROG (|eeu| #1=#:G160 |rec| |qr|)
    (RETURN
     (SEQ
      (LETT |qr|
            (SPADCALL (SPADCALL |f| (QREFELT $ 39))
                      (SPADCALL |f| (QREFELT $ 9)) (QREFELT $ 41))
            . #2=(|MONOTOOL;decompose;FMR;4|))
      (LETT |rec|
            (SPADCALL (SPADCALL |f| (QREFELT $ 9)) |derivation| (QREFELT $ 12))
            . #2#)
      (LETT |eeu|
            (PROG2
                (LETT #1#
                      (SPADCALL (QCAR |rec|) (QCDR |rec|) (QCDR |qr|)
                                (QREFELT $ 44))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0)
                             (|Record| (|:| |coef1| (QREFELT $ 7))
                                       (|:| |coef2| (QREFELT $ 7)))
                             #1#))
            . #2#)
      (EXIT
       (VECTOR (QCAR |qr|) (SPADCALL (QCDR |eeu|) (QCAR |rec|) (QREFELT $ 45))
               (SPADCALL (QCAR |eeu|) (QCDR |rec|) (QREFELT $ 45)))))))) 

(DEFUN |MonomialExtensionTools| (&REST #1=#:G165)
  (PROG ()
    (RETURN
     (PROG (#2=#:G166)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MonomialExtensionTools|)
                                           '|domainEqualList|)
                . #3=(|MonomialExtensionTools|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MonomialExtensionTools;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MonomialExtensionTools|))))))))))) 

(DEFUN |MonomialExtensionTools;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MonomialExtensionTools|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|MonomialExtensionTools| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 48) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MonomialExtensionTools|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MonomialExtensionTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| 7) (0 . |denom|)
              (|Record| (|:| |normal| 7) (|:| |special| 7)) (|Mapping| 7 7)
              |MONOTOOL;split;UPMR;2| |MONOTOOL;normalDenom;FMUP;1| (5 . |gcd|)
              (11 . |differentiate|) (|Union| $ '"failed") (16 . |exquo|)
              (|NonNegativeInteger|) (22 . |degree|) (27 . |One|) (31 . |One|)
              (35 . *) (|Factored| 7) (41 . |One|) (|Factored| $)
              (45 . |squareFree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 32)) (|List| 27)
              (50 . |factors|) (|Boolean|) (55 . |ground?|) (|Integer|)
              (60 . |sqfrFactor|) (66 . *) (72 . |unit|) (77 . *)
              (|Record| (|:| |normal| 23) (|:| |special| 23))
              |MONOTOOL;splitSquarefree;UPMR;3| (83 . |numer|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (88 . |divide|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 42 '"failed")
              (94 . |extendedEuclidean|) (101 . /)
              (|Record| (|:| |poly| 7) (|:| |normal| 8) (|:| |special| 8))
              |MONOTOOL;decompose;FMR;4|)
           '#(|splitSquarefree| 107 |split| 113 |normalDenom| 119 |decompose|
              125)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(1 8 7 0 9 2 7 0 0 0 14 1 7 0
                                                   0 15 2 7 16 0 0 17 1 7 18 0
                                                   19 0 6 0 20 0 7 0 21 2 7 0 0
                                                   0 22 0 23 0 24 1 7 25 0 26 1
                                                   23 28 0 29 1 7 30 0 31 2 23
                                                   0 7 32 33 2 23 0 0 0 34 1 23
                                                   7 0 35 2 23 0 7 0 36 1 8 7 0
                                                   39 2 7 40 0 0 41 3 7 43 0 0
                                                   0 44 2 8 0 7 7 45 2 0 37 7
                                                   11 38 2 0 10 7 11 12 2 0 7 8
                                                   11 13 2 0 46 8 11 47)))))
           '|lookupComplete|)) 
