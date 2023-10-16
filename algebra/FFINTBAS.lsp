
(SDEFUN |FFINTBAS;squaredFactors| ((|px| R) ($ R))
        (SPROG
         ((#1=#:G113 NIL) (#2=#:G112 (R)) (#3=#:G114 (R)) (#4=#:G117 NIL)
          (|ffe| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|FFINTBAS;squaredFactors|))
           (SEQ (LETT |ffe| NIL . #5#)
                (LETT #4#
                      (SPADCALL (SPADCALL |px| (QREFELT $ 10)) (QREFELT $ 14))
                      . #5#)
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |ffe| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (COND
                          ((SPADCALL (QCDR |ffe|) 1 (QREFELT $ 18))
                           (QCAR |ffe|))
                          ('T (|spadConstant| $ 15)))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |FFINTBAS;iIntegralBasis|
        ((|tfm| |Matrix| R) (|disc| R) (|sing| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((#1=#:G121 NIL) (#2=#:G129 NIL) (|oldIndex| (R)) (|indexChange| (R))
          (|rbinv| #3=(|Matrix| R)) (|rbden| (R)) (|rb| #3#) (|g| (R))
          (|index| (R)) (|idinv| (|Matrix| R)) (|id| (|Matrix| R))
          (|disc0| (R)) (|tfm0| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL (QREFELT $ 21))
                  . #4=(|FFINTBAS;iIntegralBasis|))
            (LETT |tfm0| (SPADCALL |tfm| (QREFELT $ 23)) . #4#)
            (LETT |disc0| |disc| . #4#)
            (LETT |rb| (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 25))
                  . #4#)
            (LETT |rbinv| (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 25))
                  . #4#)
            (LETT |rbden| (|spadConstant| $ 15) . #4#)
            (LETT |index| (|spadConstant| $ 15) . #4#)
            (LETT |oldIndex| (|spadConstant| $ 15) . #4#)
            (COND
             ((NULL (SPADCALL (|spadConstant| $ 15) |sing| (QREFELT $ 26)))
              (EXIT (VECTOR |rb| |rbden| |rbinv|))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |idinv|
                         (SPADCALL
                          (SPADCALL (SPADCALL |tfm| |sing| (QREFELT $ 28))
                                    (QREFELT $ 29))
                          (QREFELT $ 30))
                         . #4#)
                   (LETT |id|
                         (SPADCALL (SPADCALL |idinv| |sing| (QREFELT $ 32))
                                   (QREFELT $ 33))
                         . #4#)
                   (LETT |idinv| (SPADCALL |id| |sing| (QREFELT $ 34)) . #4#)
                   (LETT |rbinv|
                         (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 35))
                                   (SPADCALL |rbinv| |idinv| (QREFELT $ 35))
                                   (SPADCALL |sing| |rbden| (QREFELT $ 19))
                                   (QREFELT $ 37))
                         . #4#)
                   (LETT |index| (SPADCALL |rbinv| (QREFELT $ 38)) . #4#)
                   (LETT |rb|
                         (SPADCALL
                          (SPADCALL |rbinv|
                                    (SPADCALL |rbden| |sing| (QREFELT $ 19))
                                    (QREFELT $ 32))
                          (QREFELT $ 33))
                         . #4#)
                   (LETT |g| (SPADCALL |rb| |sing| |n| (QREFELT $ 39)) . #4#)
                   (COND
                    ((SPADCALL (|spadConstant| $ 15) |g| (QREFELT $ 26))
                     (LETT |rb|
                           (PROG2
                               (LETT #1# (SPADCALL |rb| |g| (QREFELT $ 41))
                                     . #4#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0)
                                             (|Matrix| (QREFELT $ 6))
                                             (|Union| (|Matrix| (QREFELT $ 6))
                                                      #5="failed")
                                             #1#))
                           . #4#)))
                   (LETT |rbden|
                         (SPADCALL |rbden| (SPADCALL |sing| |g| (QREFELT $ 42))
                                   (QREFELT $ 19))
                         . #4#)
                   (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 34)) . #4#)
                   (LETT |disc|
                         (SPADCALL |disc0|
                                   (SPADCALL |index| |index| (QREFELT $ 19))
                                   (QREFELT $ 42))
                         . #4#)
                   (LETT |indexChange|
                         (SPADCALL |index| |oldIndex| (QREFELT $ 42)) . #4#)
                   (LETT |oldIndex| |index| . #4#)
                   (LETT |sing|
                         (SPADCALL |indexChange|
                                   (|FFINTBAS;squaredFactors| |disc| $)
                                   (QREFELT $ 43))
                         . #4#)
                   (COND
                    ((NULL
                      (SPADCALL (|spadConstant| $ 15) |sing| (QREFELT $ 26)))
                     (EXIT
                      (PROGN
                       (LETT #2# (VECTOR |rb| |rbden| |rbinv|) . #4#)
                       (GO #6=#:G128)))))
                   (EXIT
                    (LETT |tfm|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |rb| |tfm0| (QREFELT $ 35))
                                      (SPADCALL |rb| (QREFELT $ 30))
                                      (QREFELT $ 35))
                                     (SPADCALL |rbden| |rbden| (QREFELT $ 19))
                                     (QREFELT $ 41))
                                    . #4#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|Matrix| (QREFELT $ 6))
                                            (|Union| (|Matrix| (QREFELT $ 6))
                                                     #5#)
                                            #1#))
                          . #4#)))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |FFINTBAS;integralBasis;R;3|
        (($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|sing| (R)) (|disc| (R)) (|tfm| (|Matrix| R))
          (|p| (|NonNegativeInteger|)) (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 21))
                . #1=(|FFINTBAS;integralBasis;R;3|))
          (LETT |p| (SPADCALL (QREFELT $ 44)) . #1#)
          (COND
           ((NULL (ZEROP |p|))
            (COND
             ((>= |n| |p|)
              (EXIT (|error| "integralBasis: possible wild ramification"))))))
          (LETT |tfm| (SPADCALL (QREFELT $ 45)) . #1#)
          (LETT |disc| (SPADCALL |tfm| (QREFELT $ 46)) . #1#)
          (LETT |sing| (|FFINTBAS;squaredFactors| |disc| $) . #1#)
          (EXIT (|FFINTBAS;iIntegralBasis| |tfm| |disc| |sing| $))))) 

(SDEFUN |FFINTBAS;localIntegralBasis;RR;4|
        ((|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|disc| (R)) (|tfm| (|Matrix| R)) (|p| (|NonNegativeInteger|))
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |n| (SPADCALL (QREFELT $ 21))
                . #1=(|FFINTBAS;localIntegralBasis;RR;4|))
          (LETT |p| (SPADCALL (QREFELT $ 44)) . #1#)
          (COND
           ((NULL (ZEROP |p|))
            (COND
             ((>= |n| |p|)
              (EXIT (|error| "integralBasis: possible wild ramification"))))))
          (LETT |tfm| (SPADCALL (QREFELT $ 45)) . #1#)
          (LETT |disc| (SPADCALL |tfm| (QREFELT $ 46)) . #1#)
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL |disc| (SPADCALL |prime| |prime| (QREFELT $ 19))
                        (QREFELT $ 49))
              1)
             (VECTOR (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 25))
                     (|spadConstant| $ 15)
                     (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 25))))
            ('T (|FFINTBAS;iIntegralBasis| |tfm| |disc| |prime| $))))))) 

(DECLAIM (NOTINLINE |FunctionFieldIntegralBasis;|)) 

(DEFUN |FunctionFieldIntegralBasis| (&REST #1=#:G142)
  (SPROG NIL
         (PROG (#2=#:G143)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionFieldIntegralBasis|)
                                               '|domainEqualList|)
                    . #3=(|FunctionFieldIntegralBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionFieldIntegralBasis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionFieldIntegralBasis|)))))))))) 

(DEFUN |FunctionFieldIntegralBasis;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionFieldIntegralBasis|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FunctionFieldIntegralBasis| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 51) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionFieldIntegralBasis|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FunctionFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Factored| $) (0 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 17)) (|List| 11)
              (|Factored| 6) (5 . |factors|) (10 . |One|) (|Boolean|)
              (|NonNegativeInteger|) (14 . >) (20 . *) (|PositiveInteger|)
              (26 . |rank|) (|Matrix| 6) (30 . |copy|) (35 . |One|)
              (39 . |scalarMatrix|) (45 . |sizeLess?|)
              (|ModularHermitianRowReduction| 6) (51 . |rowEchelon|)
              (57 . |squareTop|) (62 . |transpose|)
              (|TriangularMatrixOperations| 6 (|Vector| 6) (|Vector| 6) 22)
              (67 . |LowTriBddDenomInv|) (73 . |rowEchelon|)
              (78 . |UpTriBddDenomInv|) (84 . *) (|IntegralBasisTools| 6 7 8)
              (90 . |idealiser|) (97 . |diagonalProduct|) (102 . |matrixGcd|)
              (|Union| $ '"failed") (109 . |exquo|) (115 . |quo|) (121 . |gcd|)
              (127 . |characteristic|) (131 . |traceMatrix|)
              (135 . |determinant|)
              (|Record| (|:| |basis| 22) (|:| |basisDen| 6)
                        (|:| |basisInv| 22))
              |FFINTBAS;integralBasis;R;3| (140 . |exquo|)
              |FFINTBAS;localIntegralBasis;RR;4|)
           '#(|localIntegralBasis| 146 |integralBasis| 151) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 50
                                                 '(1 6 9 0 10 1 13 12 0 14 0 6
                                                   0 15 2 17 16 0 0 18 2 6 0 0
                                                   0 19 0 8 20 21 1 22 0 0 23 0
                                                   7 0 24 2 22 0 17 6 25 2 6 16
                                                   0 0 26 2 27 22 22 6 28 1 22
                                                   0 0 29 1 22 0 0 30 2 31 22
                                                   22 6 32 1 22 0 0 33 2 31 22
                                                   22 6 34 2 22 0 0 0 35 3 36
                                                   22 22 22 6 37 1 36 6 22 38 3
                                                   36 6 22 6 17 39 2 22 40 0 6
                                                   41 2 6 0 0 0 42 2 6 0 0 0 43
                                                   0 8 17 44 0 8 22 45 1 22 6 0
                                                   46 2 6 40 0 0 49 1 0 47 6 50
                                                   0 0 47 48)))))
           '|lookupComplete|)) 
