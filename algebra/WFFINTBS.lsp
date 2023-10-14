
(SDEFUN |WFFINTBS;listSquaredFactors| ((|px| R) ($ |List| R))
        (SPROG
         ((|ans| (|List| R)) (#1=#:G117 NIL) (|f| NIL)
          (|factored| (|Factored| R)))
         (SEQ (LETT |ans| NIL . #2=(|WFFINTBS;listSquaredFactors|))
              (LETT |factored| (SPADCALL |px| (QREFELT $ 12)) . #2#)
              (SEQ (LETT |f| NIL . #2#)
                   (LETT #1# (SPADCALL |factored| (QREFELT $ 15)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QCDR |f|) 1 (QREFELT $ 19))
                       (LETT |ans| (CONS (QCAR |f|) |ans|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |WFFINTBS;iLocalIntegralBasis|
        ((|bas| |Vector| F) (|pows| |Vector| F) (|tfm| |Matrix| R)
         (|matrixOut| |Matrix| R) (|disc| R) (|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R)) (|:| |discr| R)))
        (SPROG
         ((#1=#:G141 NIL) (#2=#:G145 NIL) (|oldIndex| (R)) (|indexChange| (R))
          (|rbinv| #3=(|Matrix| R)) (|rbden| (R)) (|rb| #3#) (|index| (R))
          (|idinv| (|Matrix| R)) (|id| (|Matrix| R)) (|j| NIL) (#4=#:G147 NIL)
          (|vec| NIL) (|i| NIL) (|ns| (|List| (|Vector| |sae|)))
          (|frobPow| (|Matrix| |sae|)) (#5=#:G146 NIL) (|r| NIL)
          (|tmpMat| (|Matrix| |sae|)) (|frob| (|Matrix| |sae|))
          (|pPows| (|Matrix| |sae|)) (|coMat| (|Matrix| R))
          (|coMat0| (|Union| (|Matrix| R) "failed")) (|denPow| (R))
          (#6=#:G123 NIL) (|coor0| (|Matrix| R)) (|bi| (F))
          (|lp| (|NonNegativeInteger|)) (|q| (|NonNegativeInteger|))
          (|p| (|NonNegativeInteger|)) (|sae| (|MonogenicAlgebra| K R))
          (|p2| (R)) (|standardBasis| (|Vector| F)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL (QREFELT $ 21))
                  . #7=(|WFFINTBS;iLocalIntegralBasis|))
            (LETT |standardBasis| (SPADCALL (QREFELT $ 23)) . #7#)
            (LETT |p2| (SPADCALL |prime| |prime| (QREFELT $ 24)) . #7#)
            (LETT |sae|
                  (|SimpleAlgebraicExtension| (QREFELT $ 6) (QREFELT $ 7)
                                              |prime|)
                  . #7#)
            (LETT |p| (SPADCALL (QREFELT $ 26)) . #7#)
            (LETT |q|
                  (SPADCALL
                   (|compiledLookupCheck| '|size|
                                          (LIST (LIST '|NonNegativeInteger|))
                                          |sae|))
                  . #7#)
            (LETT |lp| (SPADCALL |q| |n| (QREFELT $ 28)) . #7#)
            (LETT |rb| (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31))
                  . #7#)
            (LETT |rbinv| (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31))
                  . #7#)
            (LETT |rbden| (|spadConstant| $ 29) . #7#)
            (LETT |index| (|spadConstant| $ 29) . #7#)
            (LETT |oldIndex| (|spadConstant| $ 29) . #7#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (SEQ (LETT |i| 1 . #7#) G190
                        (COND ((|greater_SI| |i| |n|) (GO G191)))
                        (SEQ (LETT |bi| (|spadConstant| $ 32) . #7#)
                             (SEQ (LETT |j| 1 . #7#) G190
                                  (COND ((|greater_SI| |j| |n|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |bi|
                                          (SPADCALL |bi|
                                                    (SPADCALL
                                                     (QAREF2O |rb| |i| |j| 1 1)
                                                     (QAREF1O |standardBasis|
                                                              |j| 1)
                                                     (QREFELT $ 33))
                                                    (QREFELT $ 34))
                                          . #7#)))
                                  (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                  G191 (EXIT NIL))
                             (QSETAREF1O |bas| |i| |bi| 1)
                             (EXIT
                              (QSETAREF1O |pows| |i|
                                          (SPADCALL |bi| |p| (QREFELT $ 35))
                                          1)))
                        (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |coor0|
                         (SPADCALL (SPADCALL |pows| |bas| (QREFELT $ 36))
                                   (QREFELT $ 37))
                         . #7#)
                   (LETT |denPow|
                         (SPADCALL |rbden|
                                   (PROG1 (LETT #6# (- |p| 1) . #7#)
                                     (|check_subtype| (>= #6# 0)
                                                      '(|NonNegativeInteger|)
                                                      #6#))
                                   (QREFELT $ 38))
                         . #7#)
                   (LETT |coMat0| (SPADCALL |coor0| |denPow| (QREFELT $ 40))
                         . #7#)
                   (EXIT
                    (COND ((QEQCAR |coMat0| 1) (|error| "can't happen"))
                          ('T
                           (SEQ
                            (EXIT
                             (SEQ (LETT |coMat| (QCDR |coMat0|) . #7#)
                                  (LETT |pPows|
                                        (SPADCALL
                                         (|compiledLookupCheck| '|reduce|
                                                                (LIST '$
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))
                                                                |sae|)
                                         |coMat|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST
                                                                 (LIST
                                                                  '|Matrix|
                                                                  (|devaluate|
                                                                   |sae|))
                                                                 (LIST
                                                                  '|Mapping|
                                                                  (|devaluate|
                                                                   |sae|)
                                                                  (|devaluate|
                                                                   (ELT $ 7)))
                                                                 (LIST
                                                                  '|Matrix|
                                                                  (|devaluate|
                                                                   (ELT $ 7))))
                                                                (|MatrixCategoryFunctions2|
                                                                 (ELT $ 7)
                                                                 (|Vector|
                                                                  (ELT $ 7))
                                                                 (|Vector|
                                                                  (ELT $ 7))
                                                                 (|Matrix|
                                                                  (ELT $ 7))
                                                                 |sae|
                                                                 (|Vector|
                                                                  |sae|)
                                                                 (|Vector|
                                                                  |sae|)
                                                                 (|Matrix|
                                                                  |sae|))))
                                        . #7#)
                                  (LETT |frob|
                                        (SPADCALL |pPows|
                                                  (|compiledLookupCheck|
                                                   '|copy| (LIST '$ '$)
                                                   (|Matrix| |sae|)))
                                        . #7#)
                                  (LETT |tmpMat|
                                        (MAKE_MATRIX1 |n| |n|
                                                      (SPADCALL
                                                       (|compiledLookupCheck|
                                                        '|Zero| (LIST '$)
                                                        |sae|)))
                                        . #7#)
                                  (SEQ (LETT |r| 2 . #7#)
                                       (LETT #5#
                                             (SPADCALL |p| |q| (QREFELT $ 28))
                                             . #7#)
                                       G190
                                       (COND
                                        ((|greater_SI| |r| #5#) (GO G191)))
                                       (SEQ
                                        (SEQ (LETT |i| 1 . #7#) G190
                                             (COND
                                              ((|greater_SI| |i| |n|)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (SEQ (LETT |j| 1 . #7#) G190
                                                    (COND
                                                     ((|greater_SI| |j| |n|)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (QSETAREF2O |tmpMat| |i|
                                                                  |j|
                                                                  (SPADCALL
                                                                   (QAREF2O
                                                                    |frob| |i|
                                                                    |j| 1 1)
                                                                   |p|
                                                                   (|compiledLookupCheck|
                                                                    '^
                                                                    (LIST '$ '$
                                                                          (LIST
                                                                           '|Integer|))
                                                                    |sae|))
                                                                  1 1)))
                                                    (LETT |j| (|inc_SI| |j|)
                                                          . #7#)
                                                    (GO G190) G191
                                                    (EXIT NIL))))
                                             (LETT |i| (|inc_SI| |i|) . #7#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT
                                         (SPADCALL |frob| |pPows| |tmpMat|
                                                   (|compiledLookupCheck|
                                                    '|times!|
                                                    (LIST
                                                     (LIST '|Matrix|
                                                           (|devaluate| |sae|))
                                                     (LIST '|Matrix|
                                                           (|devaluate| |sae|))
                                                     (LIST '|Matrix|
                                                           (|devaluate| |sae|))
                                                     (LIST '|Matrix|
                                                           (|devaluate|
                                                            |sae|)))
                                                    (|StorageEfficientMatrixOperations|
                                                     |sae|)))))
                                       (LETT |r| (|inc_SI| |r|) . #7#)
                                       (GO G190) G191 (EXIT NIL))
                                  (LETT |frobPow|
                                        (SPADCALL |frob| |lp|
                                                  (|compiledLookupCheck| '^
                                                                         (LIST
                                                                          '$ '$
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                         (|Matrix|
                                                                          |sae|)))
                                        . #7#)
                                  (LETT |ns|
                                        (SPADCALL |frobPow|
                                                  (|compiledLookupCheck|
                                                   '|nullSpace|
                                                   (LIST
                                                    (LIST '|List|
                                                          (LIST '|Vector|
                                                                (|devaluate|
                                                                 |sae|)))
                                                    '$)
                                                   (|Matrix| |sae|)))
                                        . #7#)
                                  (SEQ (LETT |i| 1 . #7#) G190
                                       (COND
                                        ((|greater_SI| |i| |n|) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |j| 1 . #7#) G190
                                              (COND
                                               ((|greater_SI| |j| |n|)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (QSETAREF2O |tfm| |i| |j|
                                                            (|spadConstant| $
                                                                            42)
                                                            1 1)))
                                              (LETT |j| (|inc_SI| |j|) . #7#)
                                              (GO G190) G191 (EXIT NIL))))
                                       (LETT |i| (|inc_SI| |i|) . #7#)
                                       (GO G190) G191 (EXIT NIL))
                                  (SEQ (LETT |i| 1 . #7#)
                                       (LETT |vec| NIL . #7#)
                                       (LETT #4# |ns| . #7#) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN
                                              (LETT |vec| (CAR #4#) . #7#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |j| 1 . #7#) G190
                                              (COND
                                               ((|greater_SI| |j| |n|)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (QSETAREF2O |tfm| |i| |j|
                                                            (SPADCALL
                                                             (QAREF1O |vec| |j|
                                                                      1)
                                                             (|compiledLookupCheck|
                                                              '|lift|
                                                              (LIST
                                                               (|devaluate|
                                                                (ELT $ 7))
                                                               '$)
                                                              |sae|))
                                                            1 1)))
                                              (LETT |j| (|inc_SI| |j|) . #7#)
                                              (GO G190) G191 (EXIT NIL))))
                                       (LETT #4#
                                             (PROG1 (CDR #4#)
                                               (LETT |i| (|inc_SI| |i|) . #7#))
                                             . #7#)
                                       (GO G190) G191 (EXIT NIL))
                                  (LETT |id|
                                        (SPADCALL
                                         (SPADCALL |tfm| |prime|
                                                   (QREFELT $ 44))
                                         (QREFELT $ 45))
                                        . #7#)
                                  (LETT |idinv|
                                        (SPADCALL |id| |prime| (QREFELT $ 47))
                                        . #7#)
                                  (LETT |rbinv|
                                        (SPADCALL
                                         (SPADCALL |id| |rb| (QREFELT $ 48))
                                         (SPADCALL |rbinv| |idinv|
                                                   (QREFELT $ 48))
                                         (SPADCALL |prime| |rbden|
                                                   (QREFELT $ 24))
                                         (QREFELT $ 49))
                                        . #7#)
                                  (LETT |index|
                                        (SPADCALL |rbinv| (QREFELT $ 50))
                                        . #7#)
                                  (LETT |rb|
                                        (SPADCALL
                                         (SPADCALL |rbinv|
                                                   (SPADCALL |rbden| |prime|
                                                             (QREFELT $ 24))
                                                   (QREFELT $ 51))
                                         (QREFELT $ 52))
                                        . #7#)
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |rb| |matrixOut| |prime| |n|
                                               (QREFELT $ 53))
                                     (|spadConstant| $ 29) (QREFELT $ 54))
                                    (LETT |rb| |matrixOut| . #7#))
                                   ('T
                                    (LETT |rbden|
                                          (SPADCALL |rbden| |prime|
                                                    (QREFELT $ 24))
                                          . #7#)))
                                  (LETT |rbinv|
                                        (SPADCALL |rb| |rbden| (QREFELT $ 47))
                                        . #7#)
                                  (LETT |indexChange|
                                        (SPADCALL |index| |oldIndex|
                                                  (QREFELT $ 55))
                                        . #7#)
                                  (LETT |oldIndex| |index| . #7#)
                                  (LETT |disc|
                                        (SPADCALL |disc|
                                                  (SPADCALL |indexChange|
                                                            |indexChange|
                                                            (QREFELT $ 24))
                                                  (QREFELT $ 55))
                                        . #7#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL (|spadConstant| $ 29)
                                               |indexChange| (QREFELT $ 56))
                                     (COND
                                      ((QEQCAR
                                        (SPADCALL |disc| |p2| (QREFELT $ 57))
                                        1)
                                       (PROGN
                                        (LETT #1#
                                              (PROGN
                                               (LETT #2#
                                                     (VECTOR |rb| |rbden|
                                                             |rbinv| |disc|)
                                                     . #7#)
                                               (GO #2#))
                                              . #7#)
                                        (GO #1#)))))
                                    ('T
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2#
                                                   (VECTOR |rb| |rbden| |rbinv|
                                                           |disc|)
                                                   . #7#)
                                             (GO #2#))
                                            . #7#)
                                      (GO #1#)))))))
                            #1# (EXIT #1#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #2#)))) 

(SDEFUN |WFFINTBS;integralBasis;R;3|
        (($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|runningRbinv| #1=(|Matrix| R)) (|runningRb| #1#)
          (|runningRbden| (R)) (|mat| (|Matrix| R)) (|disc| (R)) (|rbden| (R))
          (|rbinv| #2=(|Matrix| R)) (|rb| #3=(|Matrix| R))
          (|lb|
           (|Record| (|:| |basis| #3#) (|:| |basisDen| R) (|:| |basisInv| #2#)
                     (|:| |discr| R)))
          (#4=#:G158 NIL) (|prime| NIL) (|matrixOut| #5=(|Matrix| R))
          (|tfm| #5#) (|pows| #6=(|Vector| F)) (|bas| #6#)
          (|singList| (|List| R)) (|n| (|PositiveInteger|))
          (|traceMat| (|Matrix| R)))
         (SEQ
          (LETT |traceMat| (SPADCALL (QREFELT $ 58))
                . #7=(|WFFINTBS;integralBasis;R;3|))
          (LETT |n| (SPADCALL (QREFELT $ 21)) . #7#)
          (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 59)) . #7#)
          (EXIT
           (COND
            ((SPADCALL |disc| (QREFELT $ 60))
             (|error| "integralBasis: polynomial must be separable"))
            (#8='T
             (SEQ
              (LETT |singList| (|WFFINTBS;listSquaredFactors| |disc| $) . #7#)
              (LETT |runningRb|
                    (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31)) . #7#)
              (LETT |runningRbinv|
                    (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31)) . #7#)
              (LETT |runningRbden| (|spadConstant| $ 29) . #7#)
              (EXIT
               (COND
                ((NULL |singList|)
                 (VECTOR |runningRb| |runningRbden| |runningRbinv|))
                (#8#
                 (SEQ (LETT |bas| (MAKEARR1 |n| (|spadConstant| $ 32)) . #7#)
                      (LETT |pows| (MAKEARR1 |n| (|spadConstant| $ 32)) . #7#)
                      (LETT |tfm| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42))
                            . #7#)
                      (LETT |matrixOut|
                            (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42)) . #7#)
                      (SEQ (LETT |prime| NIL . #7#) (LETT #4# |singList| . #7#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |prime| (CAR #4#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lb|
                                  (|WFFINTBS;iLocalIntegralBasis| |bas| |pows|
                                   |tfm| |matrixOut| |disc| |prime| $)
                                  . #7#)
                            (LETT |rb| (QVELT |lb| 0) . #7#)
                            (LETT |rbinv| (QVELT |lb| 2) . #7#)
                            (LETT |rbden| (QVELT |lb| 1) . #7#)
                            (LETT |disc| (QVELT |lb| 3) . #7#)
                            (EXIT
                             (COND
                              ((SPADCALL (|spadConstant| $ 29) |rbden|
                                         (QREFELT $ 56))
                               (SEQ
                                (LETT |mat|
                                      (SPADCALL
                                       (SPADCALL |rbden| |runningRb|
                                                 (QREFELT $ 61))
                                       (SPADCALL |runningRbden| |rb|
                                                 (QREFELT $ 61))
                                       (QREFELT $ 62))
                                      . #7#)
                                (LETT |runningRbden|
                                      (SPADCALL |runningRbden| |rbden|
                                                (QREFELT $ 24))
                                      . #7#)
                                (LETT |runningRb|
                                      (SPADCALL
                                       (SPADCALL |mat| |runningRbden|
                                                 (QREFELT $ 44))
                                       (QREFELT $ 45))
                                      . #7#)
                                (EXIT
                                 (LETT |runningRbinv|
                                       (SPADCALL |runningRb| |runningRbden|
                                                 (QREFELT $ 47))
                                       . #7#)))))))
                           (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (VECTOR |runningRb| |runningRbden|
                               |runningRbinv|))))))))))))) 

(SDEFUN |WFFINTBS;localIntegralBasis;RR;4|
        ((|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|lb|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R)) (|:| |discr| R)))
          (|matrixOut| #1=(|Matrix| R)) (|tfm| #1#) (|pows| #2=(|Vector| F))
          (|bas| #2#) (|disc| (R)) (|n| (|PositiveInteger|))
          (|traceMat| (|Matrix| R)))
         (SEQ
          (LETT |traceMat| (SPADCALL (QREFELT $ 58))
                . #3=(|WFFINTBS;localIntegralBasis;RR;4|))
          (LETT |n| (SPADCALL (QREFELT $ 21)) . #3#)
          (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 59)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |disc| (QREFELT $ 60))
             (|error| "localIntegralBasis: polynomial must be separable"))
            ((QEQCAR
              (SPADCALL |disc| (SPADCALL |prime| |prime| (QREFELT $ 24))
                        (QREFELT $ 57))
              1)
             (VECTOR (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31))
                     (|spadConstant| $ 29)
                     (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31))))
            ('T
             (SEQ (LETT |bas| (MAKEARR1 |n| (|spadConstant| $ 32)) . #3#)
                  (LETT |pows| (MAKEARR1 |n| (|spadConstant| $ 32)) . #3#)
                  (LETT |tfm| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42))
                        . #3#)
                  (LETT |matrixOut|
                        (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42)) . #3#)
                  (LETT |lb|
                        (|WFFINTBS;iLocalIntegralBasis| |bas| |pows| |tfm|
                         |matrixOut| |disc| |prime| $)
                        . #3#)
                  (EXIT
                   (VECTOR (QVELT |lb| 0) (QVELT |lb| 1) (QVELT |lb| 2)))))))))) 

(DECLAIM (NOTINLINE |WildFunctionFieldIntegralBasis;|)) 

(DEFUN |WildFunctionFieldIntegralBasis| (&REST #1=#:G168)
  (SPROG NIL
         (PROG (#2=#:G169)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|WildFunctionFieldIntegralBasis|)
                                               '|domainEqualList|)
                    . #3=(|WildFunctionFieldIntegralBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |WildFunctionFieldIntegralBasis;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|WildFunctionFieldIntegralBasis|)))))))))) 

(DEFUN |WildFunctionFieldIntegralBasis;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|WildFunctionFieldIntegralBasis|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|WildFunctionFieldIntegralBasis| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 66) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|WildFunctionFieldIntegralBasis|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|WildFunctionFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Factored| 7)
              (|DistinctDegreeFactorize| 6 7) (0 . |factor|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 18)) (|List| 13)
              (5 . |factors|) (10 . |One|) (|Boolean|) (|Integer|) (14 . >)
              (|PositiveInteger|) (20 . |rank|) (|Vector| $) (24 . |basis|)
              (28 . *) (|NonNegativeInteger|) (34 . |characteristic|)
              (|IntegralBasisTools| 7 8 9) (38 . |leastPower|) (44 . |One|)
              (|Matrix| 7) (48 . |scalarMatrix|) (54 . |Zero|) (58 . *)
              (64 . +) (70 . ^) (76 . |coordinates|) (82 . |transpose|)
              (87 . ^) (|Union| $ '"failed") (93 . |exquo|) (99 . |Zero|)
              (103 . |Zero|) (|ModularHermitianRowReduction| 7)
              (107 . |rowEchelon|) (113 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 30)
              (118 . |UpTriBddDenomInv|) (124 . *) (130 . |idealiser|)
              (137 . |diagonalProduct|) (142 . |LowTriBddDenomInv|)
              (148 . |rowEchelon|) (153 . |divideIfCan!|) (161 . =)
              (167 . |quo|) (173 . |sizeLess?|) (179 . |exquo|)
              (185 . |traceMatrix|) (189 . |determinant|) (194 . |zero?|)
              (199 . *) (205 . |vertConcat|)
              (|Record| (|:| |basis| 30) (|:| |basisDen| 7)
                        (|:| |basisInv| 30))
              |WFFINTBS;integralBasis;R;3| |WFFINTBS;localIntegralBasis;RR;4|)
           '#(|localIntegralBasis| 211 |integralBasis| 216) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(1 11 10 7 12 1 10 14 0 15 0
                                                   6 0 16 2 18 17 0 0 19 0 9 20
                                                   21 0 9 22 23 2 7 0 0 0 24 0
                                                   9 25 26 2 27 25 25 25 28 0 7
                                                   0 29 2 30 0 25 7 31 0 9 0 32
                                                   2 9 0 7 0 33 2 9 0 0 0 34 2
                                                   9 0 0 25 35 2 9 30 22 22 36
                                                   1 30 0 0 37 2 7 0 0 25 38 2
                                                   30 39 0 7 40 0 6 0 41 0 7 0
                                                   42 2 43 30 30 7 44 1 30 0 0
                                                   45 2 46 30 30 7 47 2 30 0 0
                                                   0 48 3 27 30 30 30 7 49 1 27
                                                   7 30 50 2 46 30 30 7 51 1 30
                                                   0 0 52 4 27 7 30 30 7 18 53
                                                   2 7 17 0 0 54 2 7 0 0 0 55 2
                                                   7 17 0 0 56 2 7 39 0 0 57 0
                                                   9 30 58 1 30 7 0 59 1 7 17 0
                                                   60 2 30 0 7 0 61 2 30 0 0 0
                                                   62 1 0 63 7 65 0 0 63
                                                   64)))))
           '|lookupComplete|)) 
