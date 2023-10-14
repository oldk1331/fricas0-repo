
(/VERSIONCHECK 2) 

(DEFUN |NFINTBAS;frobMatrix| (|rb| |rbinv| |rbden| |p| $)
  (PROG (#1=#:G142 |mat| |a| #2=#:G148 |j| #3=#:G149 |jj| #4=#:G146 |i|
         #5=#:G147 |ii| |v| |b| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)) . #6=(|NFINTBAS;frobMatrix|))
          (LETT |b| (SPADCALL (QREFELT $ 11)) . #6#)
          (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 13)) . #6#)
          (SEQ (LETT |ii| 1 . #6#)
               (LETT #5# (SPADCALL |rb| (QREFELT $ 18)) . #6#)
               (LETT |i| (SPADCALL |v| (QREFELT $ 16)) . #6#)
               (LETT #4# (QVSIZE |v|) . #6#) G190
               (COND ((OR (> |i| #4#) (|greater_SI| |ii| #5#)) (GO G191)))
               (SEQ (LETT |a| (|spadConstant| $ 13) . #6#)
                    (SEQ (LETT |jj| 1 . #6#)
                         (LETT #3# (SPADCALL |rb| (QREFELT $ 19)) . #6#)
                         (LETT |j| (SPADCALL |b| (QREFELT $ 16)) . #6#)
                         (LETT #2# (QVSIZE |b|) . #6#) G190
                         (COND
                          ((OR (> |j| #2#) (|greater_SI| |jj| #3#)) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |a|
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (QAREF2O |rb| |ii| |jj| 1 1)
                                            (QAREF1O |b| |j| 1) (QREFELT $ 20))
                                           (QREFELT $ 21))
                                 . #6#)))
                         (LETT |j|
                               (PROG1 (+ |j| 1)
                                 (LETT |jj| (|inc_SI| |jj|) . #6#))
                               . #6#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (QSETAREF1O |v| |i| (SPADCALL |a| |p| (QREFELT $ 23)) 1)))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |ii| (|inc_SI| |ii|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (LETT |mat| (SPADCALL (SPADCALL |v| (QREFELT $ 24)) (QREFELT $ 25))
                . #6#)
          (EXIT
           (PROG2
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |rbinv| (QREFELT $ 25)) |mat|
                                (QREFELT $ 26))
                      (EXPT |rbden| |p|) (QREFELT $ 28))
                     . #6#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 0) (|Matrix| (|Integer|)) #1#))))))) 

(DEFUN |NFINTBAS;wildPrimes| (|factoredDisc| |n| $)
  (PROG (|ans| #1=#:G156 |f|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|NFINTBAS;wildPrimes|))
          (SEQ (LETT |f| NIL . #2#)
               (LETT #1# (SPADCALL |factoredDisc| (QREFELT $ 32)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QCDR |f|) 1 (QREFELT $ 34))
                   (COND
                    ((SPADCALL (QCAR |f|) |n| (QREFELT $ 35))
                     (LETT |ans| (CONS (QCAR |f|) |ans|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |NFINTBAS;tameProduct| (|factoredDisc| |n| $)
  (PROG (|ans| #1=#:G163 |f|)
    (RETURN
     (SEQ (LETT |ans| 1 . #2=(|NFINTBAS;tameProduct|))
          (SEQ (LETT |f| NIL . #2#)
               (LETT #1# (SPADCALL |factoredDisc| (QREFELT $ 32)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QCDR |f|) 1 (QREFELT $ 34))
                   (COND
                    ((SPADCALL (QCAR |f|) |n| (QREFELT $ 34))
                     (LETT |ans| (* (QCAR |f|) |ans|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |NFINTBAS;integralBasis;R;4| ($)
  (PROG (|runningRbinv| |runningRb| |runningRbden| |mat| |disc| |rbden| |rbinv|
         |rb| |lb| #1=#:G175 |p| |matrixOut| |sing| |wilds| |factoredDisc|
         |disc0| |n| |traceMat|)
    (RETURN
     (SEQ
      (LETT |traceMat| (SPADCALL (QREFELT $ 36))
            . #2=(|NFINTBAS;integralBasis;R;4|))
      (LETT |n| (SPADCALL (QREFELT $ 9)) . #2#)
      (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 37)) . #2#)
      (LETT |disc0| |disc| . #2#)
      (LETT |factoredDisc| (SPADCALL |disc0| (QREFELT $ 39)) . #2#)
      (LETT |wilds| (|NFINTBAS;wildPrimes| |factoredDisc| |n| $) . #2#)
      (LETT |sing| (|NFINTBAS;tameProduct| |factoredDisc| |n| $) . #2#)
      (LETT |runningRb| (SPADCALL |n| 1 (QREFELT $ 42)) . #2#)
      (LETT |runningRbinv| (SPADCALL |n| 1 (QREFELT $ 42)) . #2#)
      (LETT |runningRbden| 1 . #2#)
      (COND
       ((EQL |sing| 1)
        (COND
         ((NULL |wilds|)
          (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|))))))
      (LETT |matrixOut| (SPADCALL |n| 0 (QREFELT $ 42)) . #2#)
      (SEQ (LETT |p| NIL . #2#) (LETT #1# |wilds| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (LETT |lb|
                  (|NFINTBAS;iWildLocalIntegralBasis| |matrixOut| |disc| |p| $)
                  . #2#)
            (LETT |rb| (QVELT |lb| 0) . #2#)
            (LETT |rbinv| (QVELT |lb| 2) . #2#)
            (LETT |rbden| (QVELT |lb| 1) . #2#)
            (LETT |disc| (QVELT |lb| 3) . #2#)
            (EXIT
             (COND
              ((SPADCALL 1 |rbden| (QREFELT $ 43))
               (SEQ
                (LETT |mat|
                      (SPADCALL (SPADCALL |rbden| |runningRb| (QREFELT $ 44))
                                (SPADCALL |runningRbden| |rb| (QREFELT $ 44))
                                (QREFELT $ 45))
                      . #2#)
                (LETT |runningRbden| (* |runningRbden| |rbden|) . #2#)
                (LETT |runningRb|
                      (SPADCALL (SPADCALL |mat| |runningRbden| (QREFELT $ 47))
                                (QREFELT $ 48))
                      . #2#)
                (EXIT
                 (LETT |runningRbinv|
                       (SPADCALL |runningRb| |runningRbden| (QREFELT $ 50))
                       . #2#)))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |lb|
            (|NFINTBAS;iTameLocalIntegralBasis| |traceMat| |disc| |sing| $)
            . #2#)
      (LETT |rb| (QVELT |lb| 0) . #2#) (LETT |rbinv| (QVELT |lb| 2) . #2#)
      (LETT |rbden| (QVELT |lb| 1) . #2#) (LETT |disc| (QVELT |lb| 3) . #2#)
      (COND
       ((SPADCALL 1 |rbden| (QREFELT $ 43))
        (SEQ
         (LETT |mat|
               (SPADCALL (SPADCALL |rbden| |runningRb| (QREFELT $ 44))
                         (SPADCALL |runningRbden| |rb| (QREFELT $ 44))
                         (QREFELT $ 45))
               . #2#)
         (LETT |runningRbden| (* |runningRbden| |rbden|) . #2#)
         (LETT |runningRb|
               (SPADCALL (SPADCALL |mat| |runningRbden| (QREFELT $ 47))
                         (QREFELT $ 48))
               . #2#)
         (EXIT
          (LETT |runningRbinv|
                (SPADCALL |runningRb| |runningRbden| (QREFELT $ 50)) . #2#)))))
      (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|)))))) 

(DEFUN |NFINTBAS;localIntegralBasis;IR;5| (|p| $)
  (PROG (|lb| |disc| |n| |traceMat|)
    (RETURN
     (SEQ
      (LETT |traceMat| (SPADCALL (QREFELT $ 36))
            . #1=(|NFINTBAS;localIntegralBasis;IR;5|))
      (LETT |n| (SPADCALL (QREFELT $ 9)) . #1#)
      (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 37)) . #1#)
      (EXIT
       (COND
        ((QEQCAR (SPADCALL |disc| (* |p| |p|) (QREFELT $ 53)) 1)
         (VECTOR (SPADCALL |n| 1 (QREFELT $ 42)) 1
                 (SPADCALL |n| 1 (QREFELT $ 42))))
        (#2='T
         (SEQ
          (LETT |lb|
                (COND
                 ((SPADCALL |p| (SPADCALL (QREFELT $ 9)) (QREFELT $ 34))
                  (|NFINTBAS;iTameLocalIntegralBasis| |traceMat| |disc| |p| $))
                 (#2#
                  (|NFINTBAS;iWildLocalIntegralBasis|
                   (SPADCALL |n| 0 (QREFELT $ 42)) |disc| |p| $)))
                . #1#)
          (EXIT (VECTOR (QVELT |lb| 0) (QVELT |lb| 1) (QVELT |lb| 2))))))))))) 

(DEFUN |NFINTBAS;iTameLocalIntegralBasis| (|traceMat| |disc| |sing| $)
  (PROG (|tfm| #1=#:G186 #2=#:G192 |oldIndex| |indexChange| |rbinv| |rbden|
         |rb| |g| |index| |idinv| |id| |disc0| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL (QREFELT $ 9))
              . #3=(|NFINTBAS;iTameLocalIntegralBasis|))
        (LETT |disc0| |disc| . #3#)
        (LETT |rb| (SPADCALL |n| 1 (QREFELT $ 42)) . #3#)
        (LETT |rbinv| (SPADCALL |n| 1 (QREFELT $ 42)) . #3#)
        (LETT |rbden| 1 . #3#) (LETT |index| 1 . #3#) (LETT |oldIndex| 1 . #3#)
        (LETT |tfm| |traceMat| . #3#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (LETT |idinv|
                     (SPADCALL
                      (SPADCALL (SPADCALL |tfm| |sing| (QREFELT $ 47))
                                (QREFELT $ 48))
                      (QREFELT $ 25))
                     . #3#)
               (LETT |id|
                     (SPADCALL (SPADCALL |idinv| |sing| (QREFELT $ 55))
                               (QREFELT $ 56))
                     . #3#)
               (LETT |idinv| (SPADCALL |id| |sing| (QREFELT $ 50)) . #3#)
               (LETT |rbinv|
                     (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 26))
                               (SPADCALL |rbinv| |idinv| (QREFELT $ 26))
                               (* |sing| |rbden|) (QREFELT $ 58))
                     . #3#)
               (LETT |index| (SPADCALL |rbinv| (QREFELT $ 59)) . #3#)
               (LETT |rb|
                     (SPADCALL
                      (SPADCALL |rbinv| (* |sing| |rbden|) (QREFELT $ 55))
                      (QREFELT $ 56))
                     . #3#)
               (LETT |g| (SPADCALL |rb| |sing| |n| (QREFELT $ 60)) . #3#)
               (COND
                ((SPADCALL 1 |g| (QREFELT $ 43))
                 (LETT |rb|
                       (PROG2
                           (LETT #1# (SPADCALL |rb| |g| (QREFELT $ 28)) . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (|Matrix| (|Integer|))
                                        #1#))
                       . #3#)))
               (LETT |rbden| (* |rbden| (QUOTIENT2 |sing| |g|)) . #3#)
               (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 50)) . #3#)
               (LETT |disc| (QUOTIENT2 |disc0| (* |index| |index|)) . #3#)
               (LETT |indexChange| (QUOTIENT2 |index| |oldIndex|) . #3#)
               (LETT |oldIndex| |index| . #3#)
               (EXIT
                (COND
                 ((EQL |indexChange| 1)
                  (PROGN
                   (LETT #2# (VECTOR |rb| |rbden| |rbinv| |disc|) . #3#)
                   (GO #2#)))
                 ('T
                  (LETT |tfm|
                        (PROG2
                            (LETT #1#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |rb| |traceMat| (QREFELT $ 26))
                                    (SPADCALL |rb| (QREFELT $ 25))
                                    (QREFELT $ 26))
                                   (* |rbden| |rbden|) (QREFELT $ 28))
                                  . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (|Matrix| (|Integer|))
                                         #1#))
                        . #3#)))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |NFINTBAS;iWildLocalIntegralBasis| (|matrixOut| |disc| |p| $)
  (PROG (#1=#:G231 #2=#:G235 |oldIndex| |indexChange| |rbinv| |rbden| |rb|
         |index| |idinv| |id| |tfm| #3=#:G229 |lp| #4=#:G195 |p2| |disc0| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL (QREFELT $ 9))
              . #5=(|NFINTBAS;iWildLocalIntegralBasis|))
        (LETT |disc0| |disc| . #5#)
        (LETT |rb| (SPADCALL |n| 1 (QREFELT $ 42)) . #5#)
        (LETT |rbinv| (SPADCALL |n| 1 (QREFELT $ 42)) . #5#)
        (LETT |rbden| 1 . #5#) (LETT |index| 1 . #5#) (LETT |oldIndex| 1 . #5#)
        (LETT |p2| (* |p| |p|) . #5#)
        (LETT |lp|
              (SPADCALL
               (PROG1 (LETT #4# |p| . #5#)
                 (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
               |n| (QREFELT $ 61))
              . #5#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (LETT |tfm|
                     (SPADCALL
                      (|NFINTBAS;frobMatrix| |rb| |rbinv| |rbden|
                       (PROG1 (LETT #3# |p| . #5#)
                         (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                          #3#))
                       $)
                      |lp| (QREFELT $ 62))
                     . #5#)
               (LETT |idinv|
                     (SPADCALL
                      (SPADCALL (SPADCALL |tfm| |p| (QREFELT $ 47))
                                (QREFELT $ 48))
                      (QREFELT $ 25))
                     . #5#)
               (LETT |id|
                     (SPADCALL (SPADCALL |idinv| |p| (QREFELT $ 55))
                               (QREFELT $ 56))
                     . #5#)
               (LETT |idinv| (SPADCALL |id| |p| (QREFELT $ 50)) . #5#)
               (LETT |rbinv|
                     (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 26))
                               (SPADCALL |rbinv| |idinv| (QREFELT $ 26))
                               (* |p| |rbden|) (QREFELT $ 58))
                     . #5#)
               (LETT |index| (SPADCALL |rbinv| (QREFELT $ 59)) . #5#)
               (LETT |rb|
                     (SPADCALL
                      (SPADCALL |rbinv| (* |p| |rbden|) (QREFELT $ 55))
                      (QREFELT $ 56))
                     . #5#)
               (COND
                ((EQL (SPADCALL |rb| |matrixOut| |p| |n| (QREFELT $ 63)) 1)
                 (LETT |rb| |matrixOut| . #5#))
                ('T (LETT |rbden| (* |p| |rbden|) . #5#)))
               (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 50)) . #5#)
               (LETT |indexChange| (QUOTIENT2 |index| |oldIndex|) . #5#)
               (LETT |oldIndex| |index| . #5#)
               (LETT |disc| (QUOTIENT2 |disc| (* |indexChange| |indexChange|))
                     . #5#)
               (EXIT
                (COND
                 ((EQL |indexChange| 1)
                  (PROGN
                   (LETT #2# (VECTOR |rb| |rbden| |rbinv| |disc|) . #5#)
                   (GO #2#)))
                 ('T
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL (GCD |p2| |disc|) |p2| (QREFELT $ 64))
                      (PROGN
                       (LETT #1#
                             (PROGN
                              (LETT #2# (VECTOR |rb| |rbden| |rbinv| |disc|)
                                    . #5#)
                              (GO #2#))
                             . #5#)
                       (GO #1#)))))
                   #1# (EXIT #1#))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |NFINTBAS;discriminant;I;8| ($)
  (PROG (#1=#:G238 |index| |rbden| |rb| |intBas| |disc|)
    (RETURN
     (SEQ
      (LETT |disc| (SPADCALL (SPADCALL (QREFELT $ 36)) (QREFELT $ 37))
            . #2=(|NFINTBAS;discriminant;I;8|))
      (LETT |intBas| (SPADCALL (QREFELT $ 52)) . #2#)
      (LETT |rb| (QVELT |intBas| 0) . #2#)
      (LETT |rbden| (QVELT |intBas| 1) . #2#)
      (LETT |index|
            (PROG2
                (LETT #1#
                      (SPADCALL (EXPT |rbden| (SPADCALL (QREFELT $ 9)))
                                (SPADCALL |rb| (QREFELT $ 37)) (QREFELT $ 53))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
            . #2#)
      (EXIT
       (PROG2
           (LETT #1# (SPADCALL |disc| (* |index| |index|) (QREFELT $ 53))
                 . #2#)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))))))) 

(DEFUN |NumberFieldIntegralBasis| (&REST #1=#:G242)
  (PROG ()
    (RETURN
     (PROG (#2=#:G243)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|NumberFieldIntegralBasis|)
                                           '|domainEqualList|)
                . #3=(|NumberFieldIntegralBasis|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |NumberFieldIntegralBasis;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|NumberFieldIntegralBasis|))))))))))) 

(DEFUN |NumberFieldIntegralBasis;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NumberFieldIntegralBasis|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|NumberFieldIntegralBasis| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 66) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NumberFieldIntegralBasis|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NumberFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| $) (4 . |basis|)
              (8 . |Zero|) (12 . |Zero|) (|Integer|) (|Vector| 7)
              (16 . |minIndex|) (|Matrix| 14) (21 . |maxRowIndex|)
              (26 . |maxColIndex|) (31 . *) (37 . +) (|NonNegativeInteger|)
              (43 . ^) (49 . |coordinates|) (54 . |transpose|) (59 . *)
              (|Union| $ '"failed") (65 . |exquo|)
              (|Record| (|:| |factor| 14) (|:| |exponent| 14)) (|List| 29)
              (|Factored| 14) (71 . |factors|) (|Boolean|) (76 . >) (82 . <=)
              (88 . |traceMatrix|) (92 . |determinant|)
              (|IntegerFactorizationPackage| 14) (97 . |factor|) (102 . |One|)
              (106 . |One|) (110 . |scalarMatrix|) (116 . |sizeLess?|)
              (122 . *) (128 . |vertConcat|)
              (|ModularHermitianRowReduction| 14) (134 . |rowEchelon|)
              (140 . |squareTop|)
              (|TriangularMatrixOperations| 14 (|Vector| 14) (|Vector| 14) 17)
              (145 . |UpTriBddDenomInv|)
              (|Record| (|:| |basis| 17) (|:| |basisDen| 14)
                        (|:| |basisInv| 17))
              |NFINTBAS;integralBasis;R;4| (151 . |exquo|)
              |NFINTBAS;localIntegralBasis;IR;5| (157 . |LowTriBddDenomInv|)
              (163 . |rowEchelon|) (|IntegralBasisTools| 14 6 7)
              (168 . |idealiser|) (175 . |diagonalProduct|) (180 . |matrixGcd|)
              (187 . |leastPower|) (193 . ^) (199 . |divideIfCan!|) (207 . ~=)
              |NFINTBAS;discriminant;I;8|)
           '#(|localIntegralBasis| 213 |integralBasis| 218 |discriminant| 222)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(0 7 8 9 0 7 10 11 0 6 0 12 0
                                                   7 0 13 1 15 14 0 16 1 17 14
                                                   0 18 1 17 14 0 19 2 7 0 14 0
                                                   20 2 7 0 0 0 21 2 7 0 0 22
                                                   23 1 7 17 10 24 1 17 0 0 25
                                                   2 17 0 0 0 26 2 17 27 0 14
                                                   28 1 31 30 0 32 2 14 33 0 0
                                                   34 2 14 33 0 0 35 0 7 17 36
                                                   1 17 14 0 37 1 38 31 14 39 0
                                                   6 0 40 0 7 0 41 2 17 0 22 14
                                                   42 2 14 33 0 0 43 2 17 0 14
                                                   0 44 2 17 0 0 0 45 2 46 17
                                                   17 14 47 1 17 0 0 48 2 49 17
                                                   17 14 50 2 14 27 0 0 53 2 49
                                                   17 17 14 55 1 17 0 0 56 3 57
                                                   17 17 17 14 58 1 57 14 17 59
                                                   3 57 14 17 14 22 60 2 57 22
                                                   22 22 61 2 17 0 0 22 62 4 57
                                                   14 17 17 14 14 63 2 14 33 0
                                                   0 64 1 0 51 14 54 0 0 51 52
                                                   0 0 14 65)))))
           '|lookupComplete|)) 
