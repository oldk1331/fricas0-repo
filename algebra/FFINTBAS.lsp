
(/VERSIONCHECK 2) 

(DEFUN |FFINTBAS;squaredFactors| (|px| $)
  (PROG (#1=#:G136 #2=#:G135 #3=#:G137 #4=#:G140 |ffe|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|FFINTBAS;squaredFactors|))
       (SEQ (LETT |ffe| NIL . #5#)
            (LETT #4# (SPADCALL (SPADCALL |px| (QREFELT $ 10)) (QREFELT $ 14))
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
                      ((SPADCALL (QCDR |ffe|) 1 (QREFELT $ 18)) (QCAR |ffe|))
                      ('T (|spadConstant| $ 15)))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 15)))))))) 

(DEFUN |FFINTBAS;iIntegralBasis| (|tfm| |disc| |sing| $)
  (PROG (#1=#:G144 #2=#:G151 |oldIndex| |indexChange| |rbinv| |rbden| |rb| |g|
         |index| |idinv| |id| |disc0| |tfm0| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL (QREFELT $ 21)) . #3=(|FFINTBAS;iIntegralBasis|))
        (LETT |tfm0| (SPADCALL |tfm| (QREFELT $ 23)) . #3#)
        (LETT |disc0| |disc| . #3#)
        (LETT |rb| (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 26)) . #3#)
        (LETT |rbinv| (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 26))
              . #3#)
        (LETT |rbden| (|spadConstant| $ 15) . #3#)
        (LETT |index| (|spadConstant| $ 15) . #3#)
        (LETT |oldIndex| (|spadConstant| $ 15) . #3#)
        (COND
         ((NULL (SPADCALL (|spadConstant| $ 15) |sing| (QREFELT $ 27)))
          (EXIT (VECTOR |rb| |rbden| |rbinv|))))
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (LETT |idinv|
                     (SPADCALL
                      (SPADCALL (SPADCALL |tfm| |sing| (QREFELT $ 29))
                                (QREFELT $ 30))
                      (QREFELT $ 31))
                     . #3#)
               (LETT |id|
                     (SPADCALL (SPADCALL |idinv| |sing| (QREFELT $ 33))
                               (QREFELT $ 34))
                     . #3#)
               (LETT |idinv| (SPADCALL |id| |sing| (QREFELT $ 35)) . #3#)
               (LETT |rbinv|
                     (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 36))
                               (SPADCALL |rbinv| |idinv| (QREFELT $ 36))
                               (SPADCALL |sing| |rbden| (QREFELT $ 19))
                               (QREFELT $ 38))
                     . #3#)
               (LETT |index| (SPADCALL |rbinv| (QREFELT $ 39)) . #3#)
               (LETT |rb|
                     (SPADCALL
                      (SPADCALL |rbinv|
                                (SPADCALL |rbden| |sing| (QREFELT $ 19))
                                (QREFELT $ 33))
                      (QREFELT $ 34))
                     . #3#)
               (LETT |g| (SPADCALL |rb| |sing| |n| (QREFELT $ 40)) . #3#)
               (COND
                ((SPADCALL (|spadConstant| $ 15) |g| (QREFELT $ 27))
                 (LETT |rb|
                       (PROG2
                           (LETT #1# (SPADCALL |rb| |g| (QREFELT $ 42)) . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (|Matrix| (QREFELT $ 6))
                                        #1#))
                       . #3#)))
               (LETT |rbden|
                     (SPADCALL |rbden| (SPADCALL |sing| |g| (QREFELT $ 43))
                               (QREFELT $ 19))
                     . #3#)
               (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 35)) . #3#)
               (LETT |disc|
                     (SPADCALL |disc0|
                               (SPADCALL |index| |index| (QREFELT $ 19))
                               (QREFELT $ 43))
                     . #3#)
               (LETT |indexChange| (SPADCALL |index| |oldIndex| (QREFELT $ 43))
                     . #3#)
               (LETT |oldIndex| |index| . #3#)
               (LETT |sing|
                     (SPADCALL |indexChange|
                               (|FFINTBAS;squaredFactors| |disc| $)
                               (QREFELT $ 44))
                     . #3#)
               (COND
                ((NULL (SPADCALL (|spadConstant| $ 15) |sing| (QREFELT $ 27)))
                 (EXIT
                  (PROGN
                   (LETT #2# (VECTOR |rb| |rbden| |rbinv|) . #3#)
                   (GO #2#)))))
               (EXIT
                (LETT |tfm|
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |rb| |tfm0| (QREFELT $ 36))
                                  (SPADCALL |rb| (QREFELT $ 31))
                                  (QREFELT $ 36))
                                 (SPADCALL |rbden| |rbden| (QREFELT $ 19))
                                 (QREFELT $ 42))
                                . #3#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (|Matrix| (QREFELT $ 6))
                                       #1#))
                      . #3#)))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |FFINTBAS;integralBasis;R;3| ($)
  (PROG (|sing| |disc| |tfm| |p| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 21)) . #1=(|FFINTBAS;integralBasis;R;3|))
      (LETT |p| (SPADCALL (QREFELT $ 45)) . #1#)
      (COND
       ((NULL (ZEROP |p|))
        (COND
         ((>= |n| |p|)
          (EXIT (|error| "integralBasis: possible wild ramification"))))))
      (LETT |tfm| (SPADCALL (QREFELT $ 46)) . #1#)
      (LETT |disc| (SPADCALL |tfm| (QREFELT $ 47)) . #1#)
      (LETT |sing| (|FFINTBAS;squaredFactors| |disc| $) . #1#)
      (EXIT (|FFINTBAS;iIntegralBasis| |tfm| |disc| |sing| $)))))) 

(DEFUN |FFINTBAS;localIntegralBasis;RR;4| (|prime| $)
  (PROG (|disc| |tfm| |p| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 21))
            . #1=(|FFINTBAS;localIntegralBasis;RR;4|))
      (LETT |p| (SPADCALL (QREFELT $ 45)) . #1#)
      (COND
       ((NULL (ZEROP |p|))
        (COND
         ((>= |n| |p|)
          (EXIT (|error| "integralBasis: possible wild ramification"))))))
      (LETT |tfm| (SPADCALL (QREFELT $ 46)) . #1#)
      (LETT |disc| (SPADCALL |tfm| (QREFELT $ 47)) . #1#)
      (EXIT
       (COND
        ((QEQCAR
          (SPADCALL |disc| (SPADCALL |prime| |prime| (QREFELT $ 19))
                    (QREFELT $ 50))
          1)
         (VECTOR (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 26))
                 (|spadConstant| $ 15)
                 (SPADCALL |n| (|spadConstant| $ 15) (QREFELT $ 26))))
        ('T (|FFINTBAS;iIntegralBasis| |tfm| |disc| |prime| $)))))))) 

(DEFUN |FunctionFieldIntegralBasis| (&REST #1=#:G164)
  (PROG ()
    (RETURN
     (PROG (#2=#:G165)
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
              (HREM |$ConstructorCache| '|FunctionFieldIntegralBasis|))))))))))) 

(DEFUN |FunctionFieldIntegralBasis;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionFieldIntegralBasis|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|FunctionFieldIntegralBasis| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 52) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionFieldIntegralBasis|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FunctionFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Factored| $) (0 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 17)) (|List| 11)
              (|Factored| 6) (5 . |factors|) (10 . |One|) (|Boolean|)
              (|Integer|) (14 . >) (20 . *) (|PositiveInteger|) (26 . |rank|)
              (|Matrix| 6) (30 . |copy|) (35 . |One|) (|NonNegativeInteger|)
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
                             (|makeByteWordVec2| 51
                                                 '(1 6 9 0 10 1 13 12 0 14 0 6
                                                   0 15 2 17 16 0 0 18 2 6 0 0
                                                   0 19 0 8 20 21 1 22 0 0 23 0
                                                   7 0 24 2 22 0 25 6 26 2 6 16
                                                   0 0 27 2 28 22 22 6 29 1 22
                                                   0 0 30 1 22 0 0 31 2 32 22
                                                   22 6 33 1 22 0 0 34 2 32 22
                                                   22 6 35 2 22 0 0 0 36 3 37
                                                   22 22 22 6 38 1 37 6 22 39 3
                                                   37 6 22 6 25 40 2 22 41 0 6
                                                   42 2 6 0 0 0 43 2 6 0 0 0 44
                                                   0 8 25 45 0 8 22 46 1 22 6 0
                                                   47 2 6 41 0 0 50 1 0 48 6 51
                                                   0 0 48 49)))))
           '|lookupComplete|)) 
