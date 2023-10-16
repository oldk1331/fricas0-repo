
(SDEFUN |NFINTBAS;frobMatrix|
        ((|rb| |Matrix| (|Integer|)) (|rbinv| |Matrix| (|Integer|))
         (|rbden| |Integer|) (|p| |NonNegativeInteger|)
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G119 NIL) (|mat| (|Matrix| (|Integer|))) (|a| (F))
          (#2=#:G125 NIL) (|j| NIL) (#3=#:G126 NIL) (|jj| NIL) (#4=#:G123 NIL)
          (|i| NIL) (#5=#:G124 NIL) (|ii| NIL) (|v| (|Vector| F))
          (|b| (|Vector| F)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)))
              (LETT |b| (SPADCALL (QREFELT $ 11)))
              (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 13)))
              (SEQ (LETT |ii| (PROGN |rb| 1))
                   (LETT #5# (SPADCALL |rb| (QREFELT $ 18)))
                   (LETT |i| (SPADCALL |v| (QREFELT $ 16)))
                   (LETT #4# (QVSIZE |v|)) G190
                   (COND ((OR (> |i| #4#) (> |ii| #5#)) (GO G191)))
                   (SEQ (LETT |a| (|spadConstant| $ 13))
                        (SEQ (LETT |jj| (PROGN |rb| 1))
                             (LETT #3# (SPADCALL |rb| (QREFELT $ 19)))
                             (LETT |j| (SPADCALL |b| (QREFELT $ 16)))
                             (LETT #2# (QVSIZE |b|)) G190
                             (COND ((OR (> |j| #2#) (> |jj| #3#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |a|
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (QAREF2O |rb| |ii| |jj| 1 1)
                                                (QAREF1O |b| |j| 1)
                                                (QREFELT $ 20))
                                               (QREFELT $ 21)))))
                             (LETT |j|
                                   (PROG1 (+ |j| 1) (LETT |jj| (+ |jj| 1))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (QSETAREF1O |v| |i| (SPADCALL |a| |p| (QREFELT $ 23))
                                     1)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |ii| (+ |ii| 1))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |mat|
                    (SPADCALL (SPADCALL |v| (QREFELT $ 24)) (QREFELT $ 25)))
              (EXIT
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |rbinv| (QREFELT $ 25)) |mat|
                                    (QREFELT $ 26))
                          (EXPT |rbden| |p|) (QREFELT $ 28)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Matrix| (|Integer|))
                                 (|Union| (|Matrix| (|Integer|)) "failed")
                                 #1#)))))) 

(SDEFUN |NFINTBAS;wildPrimes|
        ((|factoredDisc| |Factored| (|Integer|)) (|n| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG ((|ans| (|List| (|Integer|))) (#1=#:G133 NIL) (|f| NIL))
               (SEQ (LETT |ans| NIL)
                    (SEQ (LETT |f| NIL)
                         (LETT #1# (SPADCALL |factoredDisc| (QREFELT $ 33)))
                         G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |f| 2) 1 (QREFELT $ 35))
                             (COND
                              ((SPADCALL (QVELT |f| 1) |n| (QREFELT $ 36))
                               (LETT |ans| (CONS (QVELT |f| 1) |ans|))))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |NFINTBAS;tameProduct|
        ((|factoredDisc| |Factored| (|Integer|)) (|n| |Integer|) ($ |Integer|))
        (SPROG ((|ans| (|Integer|)) (#1=#:G140 NIL) (|f| NIL))
               (SEQ (LETT |ans| 1)
                    (SEQ (LETT |f| NIL)
                         (LETT #1# (SPADCALL |factoredDisc| (QREFELT $ 33)))
                         G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |f| 2) 1 (QREFELT $ 35))
                             (COND
                              ((SPADCALL (QVELT |f| 1) |n| (QREFELT $ 35))
                               (LETT |ans| (* (QVELT |f| 1) |ans|))))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |NFINTBAS;integralBasis;R;4|
        (($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|))
          (|:| |basisInv| (|Matrix| (|Integer|)))))
        (SPROG
         ((|runningRbinv| #1=(|Matrix| (|Integer|))) (|runningRb| #1#)
          (|runningRbden| (|Integer|)) (|mat| (|Matrix| (|Integer|)))
          (|disc| #2=(|Integer|)) (|rbden| #3=(|Integer|))
          (|rbinv| #4=(|Matrix| (|Integer|))) (|rb| #5=(|Matrix| (|Integer|)))
          (|lb|
           (|Record| (|:| |basis| #5#) (|:| |basisDen| #3#)
                     (|:| |basisInv| #4#) (|:| |discr| (|Integer|))))
          (#6=#:G152 NIL) (|p| NIL) (|matrixOut| #1#) (|sing| (|Integer|))
          (|wilds| (|List| (|Integer|)))
          (|factoredDisc| (|Factored| (|Integer|))) (|disc0| #2#)
          (|n| (|PositiveInteger|)) (|traceMat| (|Matrix| (|Integer|))))
         (SEQ (LETT |traceMat| (SPADCALL (QREFELT $ 37)))
              (LETT |n| (SPADCALL (QREFELT $ 9)))
              (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 38)))
              (LETT |disc0| |disc|)
              (LETT |factoredDisc| (SPADCALL |disc0| (QREFELT $ 40)))
              (LETT |wilds| (|NFINTBAS;wildPrimes| |factoredDisc| |n| $))
              (LETT |sing| (|NFINTBAS;tameProduct| |factoredDisc| |n| $))
              (LETT |runningRb| (SPADCALL |n| 1 (QREFELT $ 43)))
              (LETT |runningRbinv| (SPADCALL |n| 1 (QREFELT $ 43)))
              (LETT |runningRbden| 1)
              (COND
               ((EQL |sing| 1)
                (COND
                 ((NULL |wilds|)
                  (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|))))))
              (LETT |matrixOut| (SPADCALL |n| 0 (QREFELT $ 43)))
              (SEQ (LETT |p| NIL) (LETT #6# |wilds|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |lb|
                          (|NFINTBAS;iWildLocalIntegralBasis| |matrixOut|
                           |disc| |p| $))
                    (LETT |rb| (QVELT |lb| 0)) (LETT |rbinv| (QVELT |lb| 2))
                    (LETT |rbden| (QVELT |lb| 1)) (LETT |disc| (QVELT |lb| 3))
                    (EXIT
                     (COND
                      ((SPADCALL 1 |rbden| (QREFELT $ 44))
                       (SEQ
                        (LETT |mat|
                              (SPADCALL
                               (SPADCALL |rbden| |runningRb| (QREFELT $ 45))
                               (SPADCALL |runningRbden| |rb| (QREFELT $ 45))
                               (QREFELT $ 46)))
                        (LETT |runningRbden| (* |runningRbden| |rbden|))
                        (LETT |runningRb|
                              (SPADCALL
                               (SPADCALL |mat| |runningRbden| (QREFELT $ 48))
                               (QREFELT $ 49)))
                        (EXIT
                         (LETT |runningRbinv|
                               (SPADCALL |runningRb| |runningRbden|
                                         (QREFELT $ 51)))))))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (LETT |lb|
                    (|NFINTBAS;iTameLocalIntegralBasis| |traceMat| |disc|
                     |sing| $))
              (LETT |rb| (QVELT |lb| 0)) (LETT |rbinv| (QVELT |lb| 2))
              (LETT |rbden| (QVELT |lb| 1)) (LETT |disc| (QVELT |lb| 3))
              (COND
               ((SPADCALL 1 |rbden| (QREFELT $ 44))
                (SEQ
                 (LETT |mat|
                       (SPADCALL (SPADCALL |rbden| |runningRb| (QREFELT $ 45))
                                 (SPADCALL |runningRbden| |rb| (QREFELT $ 45))
                                 (QREFELT $ 46)))
                 (LETT |runningRbden| (* |runningRbden| |rbden|))
                 (LETT |runningRb|
                       (SPADCALL (SPADCALL |mat| |runningRbden| (QREFELT $ 48))
                                 (QREFELT $ 49)))
                 (EXIT
                  (LETT |runningRbinv|
                        (SPADCALL |runningRb| |runningRbden|
                                  (QREFELT $ 51)))))))
              (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|))))) 

(SDEFUN |NFINTBAS;localIntegralBasis;IR;5|
        ((|p| |Integer|)
         ($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|))
          (|:| |basisInv| (|Matrix| (|Integer|)))))
        (SPROG
         ((|lb|
           (|Record| (|:| |basis| (|Matrix| (|Integer|)))
                     (|:| |basisDen| (|Integer|))
                     (|:| |basisInv| (|Matrix| (|Integer|)))
                     (|:| |discr| (|Integer|))))
          (|disc| (|Integer|)) (|n| (|PositiveInteger|))
          (|traceMat| (|Matrix| (|Integer|))))
         (SEQ (LETT |traceMat| (SPADCALL (QREFELT $ 37)))
              (LETT |n| (SPADCALL (QREFELT $ 9)))
              (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 38)))
              (EXIT
               (COND
                ((QEQCAR (SPADCALL |disc| (* |p| |p|) (QREFELT $ 54)) 1)
                 (VECTOR (SPADCALL |n| 1 (QREFELT $ 43)) 1
                         (SPADCALL |n| 1 (QREFELT $ 43))))
                (#1='T
                 (SEQ
                  (LETT |lb|
                        (COND
                         ((SPADCALL |p| (SPADCALL (QREFELT $ 9))
                                    (QREFELT $ 35))
                          (|NFINTBAS;iTameLocalIntegralBasis| |traceMat| |disc|
                           |p| $))
                         (#1#
                          (|NFINTBAS;iWildLocalIntegralBasis|
                           (SPADCALL |n| 0 (QREFELT $ 43)) |disc| |p| $))))
                  (EXIT
                   (VECTOR (QVELT |lb| 0) (QVELT |lb| 1) (QVELT |lb| 2)))))))))) 

(SDEFUN |NFINTBAS;iTameLocalIntegralBasis|
        ((|traceMat| . #1=(|Matrix| (|Integer|))) (|disc| . #2=(|Integer|))
         (|sing| |Integer|)
         ($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|)) (|:| |basisInv| (|Matrix| (|Integer|)))
          (|:| |discr| (|Integer|))))
        (SPROG
         ((|tfm| #1#) (#3=#:G163 NIL) (#4=#:G170 NIL) (|oldIndex| (|Integer|))
          (|indexChange| (|Integer|)) (|rbinv| #5=(|Matrix| (|Integer|)))
          (|rbden| (|Integer|)) (|rb| #5#) (|g| (|Integer|))
          (|index| (|Integer|)) (|idinv| (|Matrix| (|Integer|)))
          (|id| (|Matrix| (|Integer|))) (|disc0| #2#)
          (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT $ 9))) (LETT |disc0| |disc|)
                (LETT |rb| (SPADCALL |n| 1 (QREFELT $ 43)))
                (LETT |rbinv| (SPADCALL |n| 1 (QREFELT $ 43))) (LETT |rbden| 1)
                (LETT |index| 1) (LETT |oldIndex| 1) (LETT |tfm| |traceMat|)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |idinv|
                             (SPADCALL
                              (SPADCALL (SPADCALL |tfm| |sing| (QREFELT $ 48))
                                        (QREFELT $ 49))
                              (QREFELT $ 25)))
                       (LETT |id|
                             (SPADCALL (SPADCALL |idinv| |sing| (QREFELT $ 56))
                                       (QREFELT $ 57)))
                       (LETT |idinv| (SPADCALL |id| |sing| (QREFELT $ 51)))
                       (LETT |rbinv|
                             (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 26))
                                       (SPADCALL |rbinv| |idinv|
                                                 (QREFELT $ 26))
                                       (* |sing| |rbden|) (QREFELT $ 59)))
                       (LETT |index| (SPADCALL |rbinv| (QREFELT $ 60)))
                       (LETT |rb|
                             (SPADCALL
                              (SPADCALL |rbinv| (* |sing| |rbden|)
                                        (QREFELT $ 56))
                              (QREFELT $ 57)))
                       (LETT |g| (SPADCALL |rb| |sing| |n| (QREFELT $ 61)))
                       (COND
                        ((SPADCALL 1 |g| (QREFELT $ 44))
                         (LETT |rb|
                               (PROG2
                                   (LETT #3#
                                         (SPADCALL |rb| |g| (QREFELT $ 28)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0)
                                                 (|Matrix| (|Integer|))
                                                 (|Union|
                                                  (|Matrix| (|Integer|))
                                                  #6="failed")
                                                 #3#)))))
                       (LETT |rbden| (* |rbden| (QUOTIENT2 |sing| |g|)))
                       (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 51)))
                       (LETT |disc| (QUOTIENT2 |disc0| (* |index| |index|)))
                       (LETT |indexChange| (QUOTIENT2 |index| |oldIndex|))
                       (LETT |oldIndex| |index|)
                       (EXIT
                        (COND
                         ((EQL |indexChange| 1)
                          (PROGN
                           (LETT #4# (VECTOR |rb| |rbden| |rbinv| |disc|))
                           (GO #7=#:G169)))
                         ('T
                          (LETT |tfm|
                                (PROG2
                                    (LETT #3#
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |rb| |traceMat|
                                                      (QREFELT $ 26))
                                            (SPADCALL |rb| (QREFELT $ 25))
                                            (QREFELT $ 26))
                                           (* |rbden| |rbden|) (QREFELT $ 28)))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0)
                                                  (|Matrix| (|Integer|))
                                                  (|Union|
                                                   (|Matrix| (|Integer|)) #6#)
                                                  #3#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #4#)))) 

(SDEFUN |NFINTBAS;iWildLocalIntegralBasis|
        ((|matrixOut| |Matrix| (|Integer|)) (|disc| . #1=(|Integer|))
         (|p| |Integer|)
         ($ |Record| (|:| |basis| (|Matrix| (|Integer|)))
          (|:| |basisDen| (|Integer|)) (|:| |basisInv| (|Matrix| (|Integer|)))
          (|:| |discr| (|Integer|))))
        (SPROG
         ((#2=#:G214 NIL) (#3=#:G215 NIL) (|oldIndex| (|Integer|))
          (|indexChange| (|Integer|)) (|rbinv| #4=(|Matrix| (|Integer|)))
          (|rbden| (|Integer|)) (|rb| #4#) (|index| (|Integer|))
          (|idinv| (|Matrix| (|Integer|))) (|id| (|Matrix| (|Integer|)))
          (|tfm| (|Matrix| (|Integer|))) (#5=#:G207 NIL)
          (|lp| (|NonNegativeInteger|)) (#6=#:G173 NIL) (|p2| (|Integer|))
          (|disc0| #1#) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT $ 9))) (LETT |disc0| |disc|)
                (LETT |rb| (SPADCALL |n| 1 (QREFELT $ 43)))
                (LETT |rbinv| (SPADCALL |n| 1 (QREFELT $ 43))) (LETT |rbden| 1)
                (LETT |index| 1) (LETT |oldIndex| 1) (LETT |p2| (* |p| |p|))
                (LETT |lp|
                      (SPADCALL
                       (PROG1 (LETT #6# |p|)
                         (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #6#))
                       |n| (QREFELT $ 62)))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |tfm|
                             (SPADCALL
                              (|NFINTBAS;frobMatrix| |rb| |rbinv| |rbden|
                               (PROG1 (LETT #5# |p|)
                                 (|check_subtype2| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #5#))
                               $)
                              |lp| (QREFELT $ 63)))
                       (LETT |idinv|
                             (SPADCALL
                              (SPADCALL (SPADCALL |tfm| |p| (QREFELT $ 48))
                                        (QREFELT $ 49))
                              (QREFELT $ 25)))
                       (LETT |id|
                             (SPADCALL (SPADCALL |idinv| |p| (QREFELT $ 56))
                                       (QREFELT $ 57)))
                       (LETT |idinv| (SPADCALL |id| |p| (QREFELT $ 51)))
                       (LETT |rbinv|
                             (SPADCALL (SPADCALL |id| |rb| (QREFELT $ 26))
                                       (SPADCALL |rbinv| |idinv|
                                                 (QREFELT $ 26))
                                       (* |p| |rbden|) (QREFELT $ 59)))
                       (LETT |index| (SPADCALL |rbinv| (QREFELT $ 60)))
                       (LETT |rb|
                             (SPADCALL
                              (SPADCALL |rbinv| (* |p| |rbden|) (QREFELT $ 56))
                              (QREFELT $ 57)))
                       (COND
                        ((EQL
                          (SPADCALL |rb| |matrixOut| |p| |n| (QREFELT $ 64)) 1)
                         (LETT |rb| |matrixOut|))
                        ('T (LETT |rbden| (* |p| |rbden|))))
                       (LETT |rbinv| (SPADCALL |rb| |rbden| (QREFELT $ 51)))
                       (LETT |indexChange| (QUOTIENT2 |index| |oldIndex|))
                       (LETT |oldIndex| |index|)
                       (LETT |disc|
                             (QUOTIENT2 |disc|
                                        (* |indexChange| |indexChange|)))
                       (EXIT
                        (COND
                         ((EQL |indexChange| 1)
                          (PROGN
                           (LETT #3# (VECTOR |rb| |rbden| |rbinv| |disc|))
                           (GO #7=#:G213)))
                         ('T
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (GCD |p2| |disc|) |p2| (QREFELT $ 65))
                              (PROGN
                               (LETT #2#
                                     (PROGN
                                      (LETT #3#
                                            (VECTOR |rb| |rbden| |rbinv|
                                                    |disc|))
                                      (GO #7#)))
                               (GO #8=#:G209)))))
                           #8# (EXIT #2#))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #3#)))) 

(SDEFUN |NFINTBAS;discriminant;I;8| (($ |Integer|))
        (SPROG
         ((#1=#:G218 NIL) (|index| (|Integer|)) (|rbden| #2=(|Integer|))
          (|rb| #3=(|Matrix| (|Integer|)))
          (|intBas|
           (|Record| (|:| |basis| #3#) (|:| |basisDen| #2#)
                     (|:| |basisInv| (|Matrix| (|Integer|)))))
          (|disc| (|Integer|)))
         (SEQ (LETT |disc| (SPADCALL (SPADCALL (QREFELT $ 37)) (QREFELT $ 38)))
              (LETT |intBas| (SPADCALL (QREFELT $ 53)))
              (LETT |rb| (QVELT |intBas| 0)) (LETT |rbden| (QVELT |intBas| 1))
              (LETT |index|
                    (PROG2
                        (LETT #1#
                              (SPADCALL (EXPT |rbden| (SPADCALL (QREFELT $ 9)))
                                        (SPADCALL |rb| (QREFELT $ 38))
                                        (QREFELT $ 54)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                      (|Union| (|Integer|) #4="failed") #1#)))
              (EXIT
               (PROG2
                   (LETT #1#
                         (SPADCALL |disc| (* |index| |index|) (QREFELT $ 54)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                 (|Union| (|Integer|) #4#) #1#)))))) 

(DECLAIM (NOTINLINE |NumberFieldIntegralBasis;|)) 

(DEFUN |NumberFieldIntegralBasis| (&REST #1=#:G222)
  (SPROG NIL
         (PROG (#2=#:G223)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NumberFieldIntegralBasis|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NumberFieldIntegralBasis;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NumberFieldIntegralBasis|)))))))))) 

(DEFUN |NumberFieldIntegralBasis;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|NumberFieldIntegralBasis| DV$1 DV$2))
          (LETT $ (GETREFV 67))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NumberFieldIntegralBasis|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NumberFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| $) (4 . |basis|)
              (8 . |Zero|) (12 . |Zero|) (|Integer|) (|Vector| 7)
              (16 . |minIndex|) (|Matrix| 14) (21 . |maxRowIndex|)
              (26 . |maxColIndex|) (31 . *) (37 . +) (|NonNegativeInteger|)
              (43 . ^) (49 . |coordinates|) (54 . |transpose|) (59 . *)
              (|Union| $ '"failed") (65 . |exquo|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 29) (|:| |factor| 14) (|:| |exponent| 22))
              (|List| 30) (|Factored| 14) (71 . |factorList|) (|Boolean|)
              (76 . >) (82 . <=) (88 . |traceMatrix|) (92 . |determinant|)
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
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|discriminant| ((|Integer|))) T)
                                   '((|integralBasis|
                                      ((|Record|
                                        (|:| |basis| (|Matrix| (|Integer|)))
                                        (|:| |basisDen| (|Integer|))
                                        (|:| |basisInv|
                                             (|Matrix| (|Integer|))))))
                                     T)
                                   '((|localIntegralBasis|
                                      ((|Record|
                                        (|:| |basis| (|Matrix| (|Integer|)))
                                        (|:| |basisDen| (|Integer|))
                                        (|:| |basisInv|
                                             (|Matrix| (|Integer|))))
                                       (|Integer|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 66
                                            '(0 7 8 9 0 7 10 11 0 6 0 12 0 7 0
                                              13 1 15 14 0 16 1 17 14 0 18 1 17
                                              14 0 19 2 7 0 14 0 20 2 7 0 0 0
                                              21 2 7 0 0 22 23 1 7 17 10 24 1
                                              17 0 0 25 2 17 0 0 0 26 2 17 27 0
                                              14 28 1 32 31 0 33 2 14 34 0 0 35
                                              2 14 34 0 0 36 0 7 17 37 1 17 14
                                              0 38 1 39 32 14 40 0 6 0 41 0 7 0
                                              42 2 17 0 22 14 43 2 14 34 0 0 44
                                              2 17 0 14 0 45 2 17 0 0 0 46 2 47
                                              17 17 14 48 1 17 0 0 49 2 50 17
                                              17 14 51 2 14 27 0 0 54 2 50 17
                                              17 14 56 1 17 0 0 57 3 58 17 17
                                              17 14 59 1 58 14 17 60 3 58 14 17
                                              14 22 61 2 58 22 22 22 62 2 17 0
                                              0 22 63 4 58 14 17 17 14 14 64 2
                                              14 34 0 0 65 1 0 52 14 55 0 0 52
                                              53 0 0 14 66)))))
           '|lookupComplete|)) 
