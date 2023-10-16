
(SDEFUN |FFINTBAS;squaredFactors| ((|px| R) ($ R))
        (SPROG
         ((#1=#:G113 NIL) (#2=#:G112 (R)) (#3=#:G114 (R)) (#4=#:G117 NIL)
          (|ffe| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |ffe| NIL)
                (LETT #4#
                      (SPADCALL (SPADCALL |px| (QREFELT $ 10)) (QREFELT $ 15)))
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |ffe| (CAR #4#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (COND
                          ((SPADCALL (QVELT |ffe| 2) 1 (QREFELT $ 19))
                           (QVELT |ffe| 1))
                          ('T (|spadConstant| $ 16))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 16))))))) 

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
           (SEQ (LETT |n| (SPADCALL (QREFELT $ 22)))
                (LETT |tfm0| (SPADCALL |tfm| (QREFELT $ 24)))
                (LETT |disc0| |disc|)
                (LETT |rb| (SPADCALL |n| (|spadConstant| $ 16) (QREFELT $ 26)))
                (LETT |rbinv|
                      (SPADCALL |n| (|spadConstant| $ 16) (QREFELT $ 26)))
                (LETT |rbden| (|spadConstant| $ 16))
                (LETT |index| (|spadConstant| $ 16))
                (LETT |oldIndex| (|spadConstant| $ 16))
                (COND
                 ((NULL (SPADCALL (|spadConstant| $ 16) |sing| (QREFELT $ 27)))
                  (EXIT (VECTOR |rb| |rbden| |rbinv|))))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |idinv|
                             (SPADCALL
                              (SPADCALL (SPADCALL |tfm| |sing| (QREFELT $ 29))
                                        (QREFELT $ 30))
                              (QREFELT $ 31)))
                       (LETT |id|
                             (SPADCALL (SPADCALL |idinv| |sing| (QREFELT $ 33))
                                       (QREFELT $ 34)))
                       (LETT |idinv| (SPADCALL |id| |sing| (QREFELT $ 35)))
                       (LETT |rbinv|
                             (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 36))
                                       (SPADCALL |rbinv| |idinv|
                                                 (QREFELT $ 36))
                                       (SPADCALL |sing| |rbden| (QREFELT $ 20))
                                       (QREFELT $ 38)))
                       (LETT |index| (SPADCALL |rbinv| (QREFELT $ 39)))
                       (LETT |rb|
                             (SPADCALL
                              (SPADCALL |rbinv|
                                        (SPADCALL |rbden| |sing|
                                                  (QREFELT $ 20))
                                        (QREFELT $ 33))
                              (QREFELT $ 34)))
                       (LETT |g| (SPADCALL |rb| |sing| |n| (QREFELT $ 40)))
                       (COND
                        ((SPADCALL (|spadConstant| $ 16) |g| (QREFELT $ 27))
                         (LETT |rb|
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL |rb| |g| (QREFELT $ 42)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0)
                                                 (|Matrix| (QREFELT $ 6))
                                                 (|Union|
                                                  (|Matrix| (QREFELT $ 6))
                                                  #4="failed")
                                                 #1#)))))
                       (LETT |rbden|
                             (SPADCALL |rbden|
                                       (SPADCALL |sing| |g| (QREFELT $ 43))
                                       (QREFELT $ 20)))
                       (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 35)))
                       (LETT |disc|
                             (SPADCALL |disc0|
                                       (SPADCALL |index| |index|
                                                 (QREFELT $ 20))
                                       (QREFELT $ 43)))
                       (LETT |indexChange|
                             (SPADCALL |index| |oldIndex| (QREFELT $ 43)))
                       (LETT |oldIndex| |index|)
                       (LETT |sing|
                             (SPADCALL |indexChange|
                                       (|FFINTBAS;squaredFactors| |disc| $)
                                       (QREFELT $ 44)))
                       (COND
                        ((NULL
                          (SPADCALL (|spadConstant| $ 16) |sing|
                                    (QREFELT $ 27)))
                         (EXIT
                          (PROGN
                           (LETT #2# (VECTOR |rb| |rbden| |rbinv|))
                           (GO #5=#:G128)))))
                       (EXIT
                        (LETT |tfm|
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |rb| |tfm0| (QREFELT $ 36))
                                          (SPADCALL |rb| (QREFELT $ 31))
                                          (QREFELT $ 36))
                                         (SPADCALL |rbden| |rbden|
                                                   (QREFELT $ 20))
                                         (QREFELT $ 42)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|Matrix| (QREFELT $ 6))
                                                (|Union|
                                                 (|Matrix| (QREFELT $ 6)) #4#)
                                                #1#)))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #2#)))) 

(SDEFUN |FFINTBAS;integralBasis;R;3|
        (($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|sing| (R)) (|disc| (R)) (|tfm| (|Matrix| R))
          (|p| (|NonNegativeInteger|)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 22)))
              (LETT |p| (SPADCALL (QREFELT $ 45)))
              (COND
               ((NULL (ZEROP |p|))
                (COND
                 ((>= |n| |p|)
                  (EXIT
                   (|error| "integralBasis: possible wild ramification"))))))
              (LETT |tfm| (SPADCALL (QREFELT $ 46)))
              (LETT |disc| (SPADCALL |tfm| (QREFELT $ 47)))
              (LETT |sing| (|FFINTBAS;squaredFactors| |disc| $))
              (EXIT (|FFINTBAS;iIntegralBasis| |tfm| |disc| |sing| $))))) 

(SDEFUN |FFINTBAS;localIntegralBasis;RR;4|
        ((|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|disc| (R)) (|tfm| (|Matrix| R)) (|p| (|NonNegativeInteger|))
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 22)))
              (LETT |p| (SPADCALL (QREFELT $ 45)))
              (COND
               ((NULL (ZEROP |p|))
                (COND
                 ((>= |n| |p|)
                  (EXIT
                   (|error| "integralBasis: possible wild ramification"))))))
              (LETT |tfm| (SPADCALL (QREFELT $ 46)))
              (LETT |disc| (SPADCALL |tfm| (QREFELT $ 47)))
              (EXIT
               (COND
                ((QEQCAR
                  (SPADCALL |disc| (SPADCALL |prime| |prime| (QREFELT $ 20))
                            (QREFELT $ 50))
                  1)
                 (VECTOR (SPADCALL |n| (|spadConstant| $ 16) (QREFELT $ 26))
                         (|spadConstant| $ 16)
                         (SPADCALL |n| (|spadConstant| $ 16) (QREFELT $ 26))))
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
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionFieldIntegralBasis;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionFieldIntegralBasis|)))))))))) 

(DEFUN |FunctionFieldIntegralBasis;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|FunctionFieldIntegralBasis| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 52))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 11) (|:| |factor| 6) (|:| |exponent| 18))
              (|List| 12) (|Factored| 6) (5 . |factorList|) (10 . |One|)
              (|Boolean|) (|NonNegativeInteger|) (14 . >) (20 . *)
              (|PositiveInteger|) (26 . |rank|) (|Matrix| 6) (30 . |copy|)
              (35 . |One|) (39 . |scalarMatrix|) (45 . |sizeLess?|)
              (|ModularHermitianRowReduction| 6) (51 . |rowEchelon|)
              (57 . |squareTop|) (62 . |transpose|)
              (|TriangularMatrixOperations| 6 (|Vector| 6) (|Vector| 6) 23)
              (67 . |LowTriBddDenomInv|) (73 . |rowEchelon|)
              (78 . |UpTriBddDenomInv|) (84 . *) (|IntegralBasisTools| 6 7 8)
              (90 . |idealiser|) (97 . |diagonalProduct|) (102 . |matrixGcd|)
              (|Union| $ '"failed") (109 . |exquo|) (115 . |quo|) (121 . |gcd|)
              (127 . |characteristic|) (131 . |traceMatrix|)
              (135 . |determinant|)
              (|Record| (|:| |basis| 23) (|:| |basisDen| 6)
                        (|:| |basisInv| 23))
              |FFINTBAS;integralBasis;R;3| (140 . |exquo|)
              |FFINTBAS;localIntegralBasis;RR;4|)
           '#(|localIntegralBasis| 146 |integralBasis| 151) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|integralBasis|
                                 ((|Record| (|:| |basis| (|Matrix| |#1|))
                                            (|:| |basisDen| |#1|)
                                            (|:| |basisInv| (|Matrix| |#1|)))))
                                T)
                              '((|localIntegralBasis|
                                 ((|Record| (|:| |basis| (|Matrix| |#1|))
                                            (|:| |basisDen| |#1|)
                                            (|:| |basisInv| (|Matrix| |#1|)))
                                  |#1|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 51
                                            '(1 6 9 0 10 1 14 13 0 15 0 6 0 16
                                              2 18 17 0 0 19 2 6 0 0 0 20 0 8
                                              21 22 1 23 0 0 24 0 7 0 25 2 23 0
                                              18 6 26 2 6 17 0 0 27 2 28 23 23
                                              6 29 1 23 0 0 30 1 23 0 0 31 2 32
                                              23 23 6 33 1 23 0 0 34 2 32 23 23
                                              6 35 2 23 0 0 0 36 3 37 23 23 23
                                              6 38 1 37 6 23 39 3 37 6 23 6 18
                                              40 2 23 41 0 6 42 2 6 0 0 0 43 2
                                              6 0 0 0 44 0 8 18 45 0 8 23 46 1
                                              23 6 0 47 2 6 41 0 0 50 1 0 48 6
                                              51 0 0 48 49)))))
           '|lookupComplete|)) 
