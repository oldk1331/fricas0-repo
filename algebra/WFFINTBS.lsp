
(SDEFUN |WFFINTBS;listSquaredFactors| ((|px| R) ($ |List| R))
        (SPROG
         ((|ans| (|List| R)) (#1=#:G118 NIL) (|f| NIL)
          (|factored| (|Factored| R)))
         (SEQ (LETT |ans| NIL) (LETT |factored| (SPADCALL |px| (QREFELT $ 12)))
              (SEQ (LETT |f| NIL)
                   (LETT #1# (SPADCALL |factored| (QREFELT $ 16))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |f| 2) 1 (QREFELT $ 20))
                       (LETT |ans| (CONS (QVELT |f| 1) |ans|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |WFFINTBS;iLocalIntegralBasis|
        ((|bas| |Vector| F) (|pows| |Vector| F) (|tfm| |Matrix| R)
         (|matrixOut| |Matrix| R) (|disc| R) (|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R)) (|:| |discr| R)))
        (SPROG
         ((#1=#:G147 NIL) (#2=#:G148 NIL) (|oldIndex| (R)) (|indexChange| (R))
          (|rbinv| #3=(|Matrix| R)) (|rbden| (R)) (|rb| #3#) (|index| (R))
          (|idinv| (|Matrix| R)) (|id| (|Matrix| R)) (#4=#:G157 NIL) (|j| NIL)
          (#5=#:G156 NIL) (|vec| NIL) (|i| NIL) (#6=#:G155 NIL) (#7=#:G154 NIL)
          (|ns| (|List| (|Vector| |sae|))) (|frobPow| (|Matrix| |sae|))
          (#8=#:G153 NIL) (#9=#:G152 NIL) (#10=#:G151 NIL) (|r| NIL)
          (|tmpMat| (|Matrix| |sae|)) (|frob| (|Matrix| |sae|))
          (|pPows| (|Matrix| |sae|)) (|coMat| (|Matrix| R))
          (|coMat0| (|Union| (|Matrix| R) "failed")) (|denPow| (R))
          (#11=#:G124 NIL) (|coor0| (|Matrix| R)) (|bi| (F)) (#12=#:G150 NIL)
          (#13=#:G149 NIL) (|lp| (|NonNegativeInteger|))
          (|q| (|NonNegativeInteger|)) (|p| (|NonNegativeInteger|))
          (|sae|
           (|Join| (|MonogenicAlgebra| K R)
                   (CATEGORY |package|
                    (IF (|has| K (|Field|))
                        (IF (|has| K (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|))))
          (|p2| (R)) (|standardBasis| (|Vector| F)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT $ 22)))
                (LETT |standardBasis| (SPADCALL (QREFELT $ 24)))
                (LETT |p2| (SPADCALL |prime| |prime| (QREFELT $ 25)))
                (LETT |sae|
                      (|SimpleAlgebraicExtension| (QREFELT $ 6) (QREFELT $ 7)
                                                  |prime|))
                (LETT |p| (SPADCALL (QREFELT $ 26)))
                (LETT |q|
                      (SPADCALL
                       (|compiledLookupCheck| '|size|
                                              (LIST
                                               (LIST '|NonNegativeInteger|))
                                              |sae|)))
                (LETT |lp| (SPADCALL |q| |n| (QREFELT $ 28)))
                (LETT |rb| (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31)))
                (LETT |rbinv|
                      (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31)))
                (LETT |rbden| (|spadConstant| $ 29))
                (LETT |index| (|spadConstant| $ 29))
                (LETT |oldIndex| (|spadConstant| $ 29))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (SEQ (LETT |i| 1) (LETT #13# |n|) G190
                            (COND ((|greater_SI| |i| #13#) (GO G191)))
                            (SEQ (LETT |bi| (|spadConstant| $ 32))
                                 (SEQ (LETT |j| 1) (LETT #12# |n|) G190
                                      (COND
                                       ((|greater_SI| |j| #12#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |bi|
                                              (SPADCALL |bi|
                                                        (SPADCALL
                                                         (QAREF2O |rb| |i| |j|
                                                                  1 1)
                                                         (QAREF1O
                                                          |standardBasis| |j|
                                                          1)
                                                         (QREFELT $ 33))
                                                        (QREFELT $ 34)))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (QSETAREF1O |bas| |i| |bi| 1)
                                 (EXIT
                                  (QSETAREF1O |pows| |i|
                                              (SPADCALL |bi| |p|
                                                        (QREFELT $ 35))
                                              1)))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (LETT |coor0|
                             (SPADCALL (SPADCALL |pows| |bas| (QREFELT $ 36))
                                       (QREFELT $ 37)))
                       (LETT |denPow|
                             (SPADCALL |rbden|
                                       (PROG1 (LETT #11# (- |p| 1))
                                         (|check_subtype2| (>= #11# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #11#))
                                       (QREFELT $ 38)))
                       (LETT |coMat0|
                             (SPADCALL |coor0| |denPow| (QREFELT $ 40)))
                       (EXIT
                        (COND ((QEQCAR |coMat0| 1) (|error| "can't happen"))
                              ('T
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |coMat| (QCDR |coMat0|))
                                      (LETT |pPows|
                                            (SPADCALL
                                             (|compiledLookupCheck| '|reduce|
                                                                    (LIST '$
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
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
                                                                       (ELT $
                                                                            7)))
                                                                     (LIST
                                                                      '|Matrix|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7))))
                                                                    (|MatrixCategoryFunctions2|
                                                                     (ELT $ 7)
                                                                     (|Vector|
                                                                      (ELT $
                                                                           7))
                                                                     (|Vector|
                                                                      (ELT $
                                                                           7))
                                                                     (|Matrix|
                                                                      (ELT $
                                                                           7))
                                                                     |sae|
                                                                     (|Vector|
                                                                      |sae|)
                                                                     (|Vector|
                                                                      |sae|)
                                                                     (|Matrix|
                                                                      |sae|)))))
                                      (LETT |frob|
                                            (SPADCALL |pPows|
                                                      (|compiledLookupCheck|
                                                       '|copy| (LIST '$ '$)
                                                       (|Matrix| |sae|))))
                                      (LETT |tmpMat|
                                            (MAKE_MATRIX1 |n| |n|
                                                          (SPADCALL
                                                           (|compiledLookupCheck|
                                                            '|Zero| (LIST '$)
                                                            |sae|))))
                                      (SEQ (LETT |r| 2)
                                           (LETT #10#
                                                 (SPADCALL |p| |q|
                                                           (QREFELT $ 28)))
                                           G190
                                           (COND
                                            ((|greater_SI| |r| #10#)
                                             (GO G191)))
                                           (SEQ
                                            (SEQ (LETT |i| 1) (LETT #9# |n|)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #9#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ (LETT |j| 1)
                                                        (LETT #8# |n|) G190
                                                        (COND
                                                         ((|greater_SI| |j|
                                                                        #8#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (QSETAREF2O |tmpMat|
                                                                      |i| |j|
                                                                      (SPADCALL
                                                                       (QAREF2O
                                                                        |frob|
                                                                        |i| |j|
                                                                        1 1)
                                                                       |p|
                                                                       (|compiledLookupCheck|
                                                                        '^
                                                                        (LIST
                                                                         '$ '$
                                                                         (LIST
                                                                          '|Integer|))
                                                                        |sae|))
                                                                      1 1)))
                                                        (LETT |j|
                                                              (|inc_SI| |j|))
                                                        (GO G190) G191
                                                        (EXIT NIL))))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (SPADCALL |frob| |pPows| |tmpMat|
                                                       (|compiledLookupCheck|
                                                        '|times!|
                                                        (LIST
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                |sae|))
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                |sae|))
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                |sae|))
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                |sae|)))
                                                        (|StorageEfficientMatrixOperations|
                                                         |sae|)))))
                                           (LETT |r| (|inc_SI| |r|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (LETT |frobPow|
                                            (SPADCALL |frob| |lp|
                                                      (|compiledLookupCheck| '^
                                                                             (LIST
                                                                              '$
                                                                              '$
                                                                              (LIST
                                                                               '|NonNegativeInteger|))
                                                                             (|Matrix|
                                                                              |sae|))))
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
                                                       (|Matrix| |sae|))))
                                      (SEQ (LETT |i| 1) (LETT #7# |n|) G190
                                           (COND
                                            ((|greater_SI| |i| #7#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |j| 1) (LETT #6# |n|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |j| #6#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (QSETAREF2O |tfm| |i| |j|
                                                                (|spadConstant|
                                                                 $ 42)
                                                                1 1)))
                                                  (LETT |j| (|inc_SI| |j|))
                                                  (GO G190) G191 (EXIT NIL))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (SEQ (LETT |i| 1) (LETT |vec| NIL)
                                           (LETT #5# |ns|) G190
                                           (COND
                                            ((OR (ATOM #5#)
                                                 (PROGN
                                                  (LETT |vec| (CAR #5#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |j| 1) (LETT #4# |n|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |j| #4#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (QSETAREF2O |tfm| |i| |j|
                                                                (SPADCALL
                                                                 (QAREF1O |vec|
                                                                          |j|
                                                                          1)
                                                                 (|compiledLookupCheck|
                                                                  '|lift|
                                                                  (LIST
                                                                   (|devaluate|
                                                                    (ELT $ 7))
                                                                   '$)
                                                                  |sae|))
                                                                1 1)))
                                                  (LETT |j| (|inc_SI| |j|))
                                                  (GO G190) G191 (EXIT NIL))))
                                           (LETT #5#
                                                 (PROG1 (CDR #5#)
                                                   (LETT |i| (|inc_SI| |i|))))
                                           (GO G190) G191 (EXIT NIL))
                                      (LETT |id|
                                            (SPADCALL
                                             (SPADCALL |tfm| |prime|
                                                       (QREFELT $ 44))
                                             (QREFELT $ 45)))
                                      (LETT |idinv|
                                            (SPADCALL |id| |prime|
                                                      (QREFELT $ 47)))
                                      (LETT |rbinv|
                                            (SPADCALL
                                             (SPADCALL |id| |rb|
                                                       (QREFELT $ 48))
                                             (SPADCALL |rbinv| |idinv|
                                                       (QREFELT $ 48))
                                             (SPADCALL |prime| |rbden|
                                                       (QREFELT $ 25))
                                             (QREFELT $ 49)))
                                      (LETT |index|
                                            (SPADCALL |rbinv| (QREFELT $ 50)))
                                      (LETT |rb|
                                            (SPADCALL
                                             (SPADCALL |rbinv|
                                                       (SPADCALL |rbden|
                                                                 |prime|
                                                                 (QREFELT $
                                                                          25))
                                                       (QREFELT $ 51))
                                             (QREFELT $ 52)))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |rb| |matrixOut| |prime| |n|
                                                   (QREFELT $ 54))
                                         (|spadConstant| $ 29) (QREFELT $ 55))
                                        (LETT |rb| |matrixOut|))
                                       ('T
                                        (LETT |rbden|
                                              (SPADCALL |rbden| |prime|
                                                        (QREFELT $ 25)))))
                                      (LETT |rbinv|
                                            (SPADCALL |rb| |rbden|
                                                      (QREFELT $ 47)))
                                      (LETT |indexChange|
                                            (SPADCALL |index| |oldIndex|
                                                      (QREFELT $ 56)))
                                      (LETT |oldIndex| |index|)
                                      (LETT |disc|
                                            (SPADCALL |disc|
                                                      (SPADCALL |indexChange|
                                                                |indexChange|
                                                                (QREFELT $ 25))
                                                      (QREFELT $ 56)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL (|spadConstant| $ 29)
                                                   |indexChange|
                                                   (QREFELT $ 57))
                                         (COND
                                          ((QEQCAR
                                            (SPADCALL |disc| |p2|
                                                      (QREFELT $ 58))
                                            1)
                                           (PROGN
                                            (LETT #1#
                                                  (PROGN
                                                   (LETT #2#
                                                         (VECTOR |rb| |rbden|
                                                                 |rbinv|
                                                                 |disc|))
                                                   (GO #14=#:G146)))
                                            (GO #15=#:G142)))))
                                        ('T
                                         (PROGN
                                          (LETT #1#
                                                (PROGN
                                                 (LETT #2#
                                                       (VECTOR |rb| |rbden|
                                                               |rbinv| |disc|))
                                                 (GO #14#)))
                                          (GO #15#)))))))
                                #15# (EXIT #1#))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #14# (EXIT #2#)))) 

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
          (#4=#:G168 NIL) (|prime| NIL) (|matrixOut| #5=(|Matrix| R))
          (|tfm| #5#) (|pows| #6=(|Vector| F)) (|bas| #6#)
          (|singList| (|List| R)) (|n| (|PositiveInteger|))
          (|traceMat| (|Matrix| R)))
         (SEQ (LETT |traceMat| (SPADCALL (QREFELT $ 59)))
              (LETT |n| (SPADCALL (QREFELT $ 22)))
              (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 60)))
              (EXIT
               (COND
                ((SPADCALL |disc| (QREFELT $ 61))
                 (|error| "integralBasis: polynomial must be separable"))
                (#7='T
                 (SEQ
                  (LETT |singList| (|WFFINTBS;listSquaredFactors| |disc| $))
                  (LETT |runningRb|
                        (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31)))
                  (LETT |runningRbinv|
                        (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31)))
                  (LETT |runningRbden| (|spadConstant| $ 29))
                  (EXIT
                   (COND
                    ((NULL |singList|)
                     (VECTOR |runningRb| |runningRbden| |runningRbinv|))
                    (#7#
                     (SEQ (LETT |bas| (MAKEARR1 |n| (|spadConstant| $ 32)))
                          (LETT |pows| (MAKEARR1 |n| (|spadConstant| $ 32)))
                          (LETT |tfm|
                                (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42)))
                          (LETT |matrixOut|
                                (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42)))
                          (SEQ (LETT |prime| NIL) (LETT #4# |singList|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |prime| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |lb|
                                      (|WFFINTBS;iLocalIntegralBasis| |bas|
                                       |pows| |tfm| |matrixOut| |disc| |prime|
                                       $))
                                (LETT |rb| (QVELT |lb| 0))
                                (LETT |rbinv| (QVELT |lb| 2))
                                (LETT |rbden| (QVELT |lb| 1))
                                (LETT |disc| (QVELT |lb| 3))
                                (EXIT
                                 (COND
                                  ((SPADCALL (|spadConstant| $ 29) |rbden|
                                             (QREFELT $ 57))
                                   (SEQ
                                    (LETT |mat|
                                          (SPADCALL
                                           (SPADCALL |rbden| |runningRb|
                                                     (QREFELT $ 62))
                                           (SPADCALL |runningRbden| |rb|
                                                     (QREFELT $ 62))
                                           (QREFELT $ 63)))
                                    (LETT |runningRbden|
                                          (SPADCALL |runningRbden| |rbden|
                                                    (QREFELT $ 25)))
                                    (LETT |runningRb|
                                          (SPADCALL
                                           (SPADCALL |mat| |runningRbden|
                                                     (QREFELT $ 44))
                                           (QREFELT $ 45)))
                                    (EXIT
                                     (LETT |runningRbinv|
                                           (SPADCALL |runningRb| |runningRbden|
                                                     (QREFELT $ 47)))))))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
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
         (SEQ (LETT |traceMat| (SPADCALL (QREFELT $ 59)))
              (LETT |n| (SPADCALL (QREFELT $ 22)))
              (LETT |disc| (SPADCALL |traceMat| (QREFELT $ 60)))
              (EXIT
               (COND
                ((SPADCALL |disc| (QREFELT $ 61))
                 (|error| "localIntegralBasis: polynomial must be separable"))
                ((QEQCAR
                  (SPADCALL |disc| (SPADCALL |prime| |prime| (QREFELT $ 25))
                            (QREFELT $ 58))
                  1)
                 (VECTOR (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31))
                         (|spadConstant| $ 29)
                         (SPADCALL |n| (|spadConstant| $ 29) (QREFELT $ 31))))
                ('T
                 (SEQ (LETT |bas| (MAKEARR1 |n| (|spadConstant| $ 32)))
                      (LETT |pows| (MAKEARR1 |n| (|spadConstant| $ 32)))
                      (LETT |tfm| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42)))
                      (LETT |matrixOut|
                            (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 42)))
                      (LETT |lb|
                            (|WFFINTBS;iLocalIntegralBasis| |bas| |pows| |tfm|
                             |matrixOut| |disc| |prime| $))
                      (EXIT
                       (VECTOR (QVELT |lb| 0) (QVELT |lb| 1)
                               (QVELT |lb| 2)))))))))) 

(DECLAIM (NOTINLINE |WildFunctionFieldIntegralBasis;|)) 

(DEFUN |WildFunctionFieldIntegralBasis| (&REST #1=#:G178)
  (SPROG NIL
         (PROG (#2=#:G179)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|WildFunctionFieldIntegralBasis|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |WildFunctionFieldIntegralBasis;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|WildFunctionFieldIntegralBasis|)))))))))) 

(DEFUN |WildFunctionFieldIntegralBasis;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|WildFunctionFieldIntegralBasis| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 67))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 13) (|:| |factor| 7) (|:| |exponent| 19))
              (|List| 14) (5 . |factorList|) (10 . |One|) (|Boolean|)
              (|NonNegativeInteger|) (14 . >) (|PositiveInteger|) (20 . |rank|)
              (|Vector| $) (24 . |basis|) (28 . *) (34 . |characteristic|)
              (|IntegralBasisTools| 7 8 9) (38 . |leastPower|) (44 . |One|)
              (|Matrix| 7) (48 . |scalarMatrix|) (54 . |Zero|) (58 . *)
              (64 . +) (70 . ^) (76 . |coordinates|) (82 . |transpose|)
              (87 . ^) (|Union| $ '"failed") (93 . |exquo|) (99 . |Zero|)
              (103 . |Zero|) (|ModularHermitianRowReduction| 7)
              (107 . |rowEchelon|) (113 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 30)
              (118 . |UpTriBddDenomInv|) (124 . *) (130 . |idealiser|)
              (137 . |diagonalProduct|) (142 . |LowTriBddDenomInv|)
              (148 . |rowEchelon|) (|Integer|) (153 . |divideIfCan!|) (161 . =)
              (167 . |quo|) (173 . |sizeLess?|) (179 . |exquo|)
              (185 . |traceMatrix|) (189 . |determinant|) (194 . |zero?|)
              (199 . *) (205 . |vertConcat|)
              (|Record| (|:| |basis| 30) (|:| |basisDen| 7)
                        (|:| |basisInv| 30))
              |WFFINTBS;integralBasis;R;3| |WFFINTBS;localIntegralBasis;RR;4|)
           '#(|localIntegralBasis| 211 |integralBasis| 216) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|integralBasis|
                                 ((|Record| (|:| |basis| (|Matrix| |#2|))
                                            (|:| |basisDen| |#2|)
                                            (|:| |basisInv| (|Matrix| |#2|)))))
                                T)
                              '((|localIntegralBasis|
                                 ((|Record| (|:| |basis| (|Matrix| |#2|))
                                            (|:| |basisDen| |#2|)
                                            (|:| |basisInv| (|Matrix| |#2|)))
                                  |#2|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 66
                                            '(1 11 10 7 12 1 10 15 0 16 0 6 0
                                              17 2 19 18 0 0 20 0 9 21 22 0 9
                                              23 24 2 7 0 0 0 25 0 9 19 26 2 27
                                              19 19 19 28 0 7 0 29 2 30 0 19 7
                                              31 0 9 0 32 2 9 0 7 0 33 2 9 0 0
                                              0 34 2 9 0 0 19 35 2 9 30 23 23
                                              36 1 30 0 0 37 2 7 0 0 19 38 2 30
                                              39 0 7 40 0 6 0 41 0 7 0 42 2 43
                                              30 30 7 44 1 30 0 0 45 2 46 30 30
                                              7 47 2 30 0 0 0 48 3 27 30 30 30
                                              7 49 1 27 7 30 50 2 46 30 30 7 51
                                              1 30 0 0 52 4 27 7 30 30 7 53 54
                                              2 7 18 0 0 55 2 7 0 0 0 56 2 7 18
                                              0 0 57 2 7 39 0 0 58 0 9 30 59 1
                                              30 7 0 60 1 7 18 0 61 2 30 0 7 0
                                              62 2 30 0 0 0 63 1 0 64 7 66 0 0
                                              64 65)))))
           '|lookupComplete|)) 
