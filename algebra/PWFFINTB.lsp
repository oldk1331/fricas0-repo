
(SDEFUN |PWFFINTB;reducedDiscriminant;UPR;1| ((|f| UP) ($ R))
        (SPROG
         ((|ans| (|Union| R "failed")) (|gg| (R)) (|denom| (R))
          (|cden| (|Record| (|:| |num| (|List| (|Fraction| R))) (|:| |den| R)))
          (|cc| (|List| (|Fraction| R)))
          (|ee|
           (|Record|
            (|:| |coef1| (|SparseUnivariatePolynomial| (|Fraction| R)))
            (|:| |coef2| (|SparseUnivariatePolynomial| (|Fraction| R)))
            (|:| |generator| (|SparseUnivariatePolynomial| (|Fraction| R)))))
          (|ff| (|SparseUnivariatePolynomial| (|Fraction| R))))
         (SEQ
          (LETT |ff| (SPADCALL (ELT $ 11) |f| (QREFELT $ 15))
                . #1=(|PWFFINTB;reducedDiscriminant;UPR;1|))
          (LETT |ee|
                (SPADCALL |ff| (SPADCALL |ff| (QREFELT $ 16)) (QREFELT $ 18))
                . #1#)
          (LETT |cc|
                (SPADCALL (SPADCALL (QVELT |ee| 0) (QREFELT $ 20))
                          (SPADCALL (QVELT |ee| 1) (QREFELT $ 20))
                          (QREFELT $ 21))
                . #1#)
          (LETT |cden| (SPADCALL |cc| (QREFELT $ 24)) . #1#)
          (LETT |denom| (QCDR |cden|) . #1#)
          (LETT |gg|
                (SPADCALL (SPADCALL (ELT $ 25) (QCAR |cden|) (QREFELT $ 29))
                          (QREFELT $ 31))
                . #1#)
          (LETT |ans| (SPADCALL |denom| |gg| (QREFELT $ 33)) . #1#)
          (EXIT
           (COND
            ((QEQCAR |ans| 1)
             (|error| "PWFFINTB: error in reduced discriminant computation"))
            ('T (QCDR |ans|))))))) 

(SDEFUN |PWFFINTB;compLocalBasis|
        ((|poly| UP) (|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|sae|
           (|Join| (|MonogenicAlgebra| R UP)
                   (CATEGORY |package|
                    (IF (|has| R (|Field|))
                        (IF (|has| R (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)))))
         (SEQ
          (LETT |sae|
                (|SimpleAlgebraicExtension| (QREFELT $ 7) (QREFELT $ 8) |poly|)
                |PWFFINTB;compLocalBasis|)
          (EXIT
           (SPADCALL |prime|
                     (|compiledLookupCheck| '|localIntegralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT $ 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7)))))
                                             (|devaluate| (ELT $ 7)))
                                            (|WildFunctionFieldIntegralBasis|
                                             (ELT $ 6) (ELT $ 7) (ELT $ 8)
                                             |sae|))))))) 

(SDEFUN |PWFFINTB;compLocalBasisOverExt|
        ((|poly0| UP) (|prime0| R) (|irrPoly0| UP) (|k| |NonNegativeInteger|)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|bDen| (R)) (|p| (|Union| R #1="failed")) (|bInv| (|Matrix| R))
          (|bas| (|Union| (|Matrix| R) #2="failed")) (|b| (|Matrix| R))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| (|SparseUnivariatePolynomial| E)))
                     (|:| |basisDen| (|SparseUnivariatePolynomial| E))
                     (|:| |basisInv|
                          (|Matrix| (|SparseUnivariatePolynomial| E)))))
          (|bs|
           (|List|
            (|Record| (|:| |basis| (|Matrix| (|SparseUnivariatePolynomial| E)))
                      (|:| |basisDen| (|SparseUnivariatePolynomial| E))
                      (|:| |basisInv|
                           (|Matrix| (|SparseUnivariatePolynomial| E))))))
          (|factorIb|
           (|Record| (|:| |basis| (|Matrix| (|SparseUnivariatePolynomial| E)))
                     (|:| |basisDen| (|SparseUnivariatePolynomial| E))
                     (|:| |basisInv|
                          (|Matrix| (|SparseUnivariatePolynomial| E)))))
          (FF
           (|Join|
            (|MonogenicAlgebra| #3=(|SparseUnivariatePolynomial| E)
                                (|SparseUnivariatePolynomial|
                                 (|SparseUnivariatePolynomial| E)))
            (CATEGORY |package|
             (IF (|has| #3# . #4=((|Field|)))
                 (IF (|has| #3# . #5=((|PolynomialFactorizationExplicit|)))
                     . #6=((ATTRIBUTE (|PolynomialFactorizationExplicit|))
                           |noBranch|))
                 . #7=(|noBranch|)))))
          (|psi1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| E)))
          (|henselFactors|
           #8=(|List|
               (|SparseUnivariatePolynomial|
                (|SparseUnivariatePolynomial| E))))
          (|henselInfo|
           (|Record| (|:| |plist| #8#)
                     (|:| |modulo| (|SparseUnivariatePolynomial| E))))
          (|deg| (|PositiveInteger|)) (#9=#:G133 NIL)
          (|primaries|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| E))))
          (#10=#:G154 NIL) (|ff| NIL) (#11=#:G153 NIL)
          (|redFactors| (|List| (|SparseUnivariatePolynomial| |sae|)))
          (#12=#:G152 NIL) (|f| NIL) (#13=#:G151 NIL)
          (|factorListSAE|
           (|List|
            (|Record|
             (|:| |flag|
                  (|Union| #14="nil" #15="sqfr" #16="irred" #17="prime"))
             (|:| |factor| (|SparseUnivariatePolynomial| |sae|))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|redIrrPoly| (|SparseUnivariatePolynomial| |sae|))
          (|pp|
           #18=(|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| E)))
          (|sae|
           (|Join| (|MonogenicAlgebra| E (|SparseUnivariatePolynomial| E))
                   (CATEGORY |package|
                    (IF (|has| E . #4#)
                        (IF (|has| E . #5#)
                            . #6#)
                        . #7#))))
          (|prime| #19=(|SparseUnivariatePolynomial| E)) (|redDisc| #19#)
          (|redDisc0| (R)) (|poly| #18#)
          (E
           (|Join| (|MonogenicAlgebra| K (|SparseUnivariatePolynomial| K))
                   (CATEGORY |package|
                    (IF (|has| K . #4#)
                        (IF (|has| K . #5#)
                            . #6#)
                        . #7#))))
          (|irrPoly| (|SparseUnivariatePolynomial| K)) (#20=#:G125 NIL)
          (|r| #21=(|NonNegativeInteger|)) (|disc0| (R)) (|n| #21#))
         (SEQ
          (LETT |n| (SPADCALL |poly0| (QREFELT $ 36))
                . #22=(|PWFFINTB;compLocalBasisOverExt|))
          (LETT |disc0| (SPADCALL |poly0| (QREFELT $ 37)) . #22#)
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |disc0| |prime0| (QREFELT $ 33)) 1)
             (VECTOR (SPADCALL |n| (|spadConstant| $ 39) (QREFELT $ 41))
                     (|spadConstant| $ 39)
                     (SPADCALL |n| (|spadConstant| $ 39) (QREFELT $ 41))))
            (#23='T
             (SEQ (LETT |r| (SPADCALL |irrPoly0| (QREFELT $ 36)) . #22#)
                  (LETT |irrPoly|
                        (SPADCALL
                         (PROG1 (LETT #20# |r| . #22#)
                           (|check_subtype2| (> #20# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #20#))
                         (QREFELT $ 45))
                        . #22#)
                  (LETT E
                        (|SimpleAlgebraicExtension| (QREFELT $ 6)
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 6))
                                                    |irrPoly|)
                        . #22#)
                  (LETT |poly|
                        (SPADCALL
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '$
                                                      (|devaluate| (ELT $ 6)))
                                                E)
                         |poly0|
                         (|compiledLookupCheck| '|mapBivariate|
                                                (LIST
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (|devaluate| E)))
                                                 (LIST '|Mapping|
                                                       (|devaluate| E)
                                                       (|devaluate| (ELT $ 6)))
                                                 (|devaluate| (ELT $ 8)))
                                                (|IntegralBasisPolynomialTools|
                                                 (ELT $ 6) (ELT $ 7) (ELT $ 8)
                                                 E)))
                        . #22#)
                  (LETT |redDisc0| (SPADCALL |poly0| (QREFELT $ 34)) . #22#)
                  (LETT |redDisc|
                        (SPADCALL
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '$
                                                      (|devaluate| (ELT $ 6)))
                                                E)
                         |redDisc0|
                         (|compiledLookupCheck| '|mapUnivariate|
                                                (LIST
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| E))
                                                 (LIST '|Mapping|
                                                       (|devaluate| E)
                                                       (|devaluate| (ELT $ 6)))
                                                 (|devaluate| (ELT $ 7)))
                                                (|IntegralBasisPolynomialTools|
                                                 (ELT $ 6) (ELT $ 7) (ELT $ 8)
                                                 E)))
                        . #22#)
                  (LETT |prime|
                        (SPADCALL
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '$
                                                      (|devaluate| (ELT $ 6)))
                                                E)
                         |prime0|
                         (|compiledLookupCheck| '|mapUnivariate|
                                                (LIST
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| E))
                                                 (LIST '|Mapping|
                                                       (|devaluate| E)
                                                       (|devaluate| (ELT $ 6)))
                                                 (|devaluate| (ELT $ 7)))
                                                (|IntegralBasisPolynomialTools|
                                                 (ELT $ 6) (ELT $ 7) (ELT $ 8)
                                                 E)))
                        . #22#)
                  (LETT |sae|
                        (|SimpleAlgebraicExtension| E
                                                    (|SparseUnivariatePolynomial|
                                                     E)
                                                    |prime|)
                        . #22#)
                  (LETT |redIrrPoly|
                        (SEQ
                         (LETT |pp|
                               (SPADCALL
                                (|compiledLookupCheck| '|coerce|
                                                       (LIST '$
                                                             (|devaluate|
                                                              (ELT $ 6)))
                                                       E)
                                |irrPoly0|
                                (|compiledLookupCheck| '|mapBivariate|
                                                       (LIST
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (|devaluate| E)))
                                                        (LIST '|Mapping|
                                                              (|devaluate| E)
                                                              (|devaluate|
                                                               (ELT $ 6)))
                                                        (|devaluate|
                                                         (ELT $ 8)))
                                                       (|IntegralBasisPolynomialTools|
                                                        (ELT $ 6) (ELT $ 7)
                                                        (ELT $ 8) E)))
                               . #22#)
                         (EXIT
                          (SPADCALL
                           (|compiledLookupCheck| '|reduce|
                                                  (LIST '$
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate| E)))
                                                  |sae|)
                           |pp|
                           (|compiledLookupCheck| '|mapUnivariate|
                                                  (LIST
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| |sae|))
                                                   (LIST '|Mapping|
                                                         (|devaluate| |sae|)
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (|devaluate| E)))
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| E))))
                                                  (|IntegralBasisPolynomialTools|
                                                   (|SparseUnivariatePolynomial|
                                                    E)
                                                   (|SparseUnivariatePolynomial|
                                                    (|SparseUnivariatePolynomial|
                                                     E))
                                                   (|SparseUnivariatePolynomial|
                                                    (|SparseUnivariatePolynomial|
                                                     (|SparseUnivariatePolynomial|
                                                      E)))
                                                   |sae|)))))
                        . #22#)
                  (LETT |factorListSAE|
                        (SPADCALL
                         (SPADCALL |redIrrPoly|
                                   (|compiledLookupCheck| '|factor|
                                                          (LIST
                                                           (LIST '|Factored|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   |sae|)))
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             |sae|)))
                                                          (|DistinctDegreeFactorize|
                                                           |sae|
                                                           (|SparseUnivariatePolynomial|
                                                            |sae|))))
                         (|compiledLookupCheck| '|factorList|
                                                (LIST
                                                 (LIST '|List|
                                                       (LIST '|Record|
                                                             (LIST '|:| '|flag|
                                                                   (LIST
                                                                    '|Union|
                                                                    '#14# '#15#
                                                                    '#16#
                                                                    '#17#))
                                                             (LIST '|:|
                                                                   '|factor|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     |sae|)))
                                                             (LIST '|:|
                                                                   '|exponent|
                                                                   (LIST
                                                                    '|NonNegativeInteger|))))
                                                 '$)
                                                (|Factored|
                                                 (|SparseUnivariatePolynomial|
                                                  |sae|))))
                        . #22#)
                  (LETT |redFactors|
                        (PROGN
                         (LETT #13# NIL . #22#)
                         (SEQ (LETT |f| NIL . #22#)
                              (LETT #12# |factorListSAE| . #22#) G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN (LETT |f| (CAR #12#) . #22#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #13#
                                      (CONS
                                       (SPADCALL (QVELT |f| 1) |k|
                                                 (|compiledLookupCheck| '^
                                                                        (LIST
                                                                         '$ '$
                                                                         (LIST
                                                                          '|NonNegativeInteger|))
                                                                        (|SparseUnivariatePolynomial|
                                                                         |sae|)))
                                       #13#)
                                      . #22#)))
                              (LETT #12# (CDR #12#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #13#))))
                        . #22#)
                  (LETT |primaries|
                        (PROGN
                         (LETT #11# NIL . #22#)
                         (SEQ (LETT |ff| NIL . #22#)
                              (LETT #10# |redFactors| . #22#) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |ff| (CAR #10#) . #22#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #11#
                                      (CONS
                                       (SPADCALL
                                        (|compiledLookupCheck| '|lift|
                                                               (LIST
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  E))
                                                                '$)
                                                               |sae|)
                                        |ff|
                                        (|compiledLookupCheck| '|mapUnivariate|
                                                               (LIST
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   E)))
                                                                (LIST
                                                                 '|Mapping|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   E))
                                                                 (|devaluate|
                                                                  |sae|))
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  |sae|)))
                                                               (|IntegralBasisPolynomialTools|
                                                                (|SparseUnivariatePolynomial|
                                                                 E)
                                                                (|SparseUnivariatePolynomial|
                                                                 (|SparseUnivariatePolynomial|
                                                                  E))
                                                                (|SparseUnivariatePolynomial|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (|SparseUnivariatePolynomial|
                                                                   E)))
                                                                |sae|)))
                                       #11#)
                                      . #22#)))
                              (LETT #10# (CDR #10#) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #11#))))
                        . #22#)
                  (LETT |deg|
                        (PROG1
                            (LETT #9#
                                  (+ 1
                                     (*
                                      (SPADCALL |redDisc| |prime|
                                                (|compiledLookupCheck| '|order|
                                                                       (LIST
                                                                        (LIST
                                                                         '|NonNegativeInteger|)
                                                                        '$ '$)
                                                                       (|SparseUnivariatePolynomial|
                                                                        E)))
                                      (SPADCALL |prime|
                                                (|compiledLookupCheck|
                                                 '|degree|
                                                 (LIST
                                                  (LIST '|NonNegativeInteger|)
                                                  '$)
                                                 (|SparseUnivariatePolynomial|
                                                  E)))))
                                  . #22#)
                          (|check_subtype2| (> #9# 0) '(|PositiveInteger|)
                                            '(|NonNegativeInteger|) #9#))
                        . #22#)
                  (LETT |henselInfo|
                        (SPADCALL |poly| |primaries| |prime| |deg|
                                  (|compiledLookupCheck| '|HenselLift|
                                                         (LIST
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|plist|
                                                                      (LIST
                                                                       '|List|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          E)))))
                                                                (LIST '|:|
                                                                      '|modulo|
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (|devaluate|
                                                                        E))))
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate| E)))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   E))))
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E))
                                                          (LIST
                                                           '|PositiveInteger|))
                                                         (|GeneralHenselPackage|
                                                          (|SparseUnivariatePolynomial|
                                                           E)
                                                          (|SparseUnivariatePolynomial|
                                                           (|SparseUnivariatePolynomial|
                                                            E)))))
                        . #22#)
                  (LETT |henselFactors| (QCAR |henselInfo|) . #22#)
                  (LETT |psi1| (|SPADfirst| |henselFactors|) . #22#)
                  (LETT FF
                        (|SimpleAlgebraicExtension|
                         (|SparseUnivariatePolynomial| E)
                         (|SparseUnivariatePolynomial|
                          (|SparseUnivariatePolynomial| E))
                         |psi1|)
                        . #22#)
                  (LETT |factorIb|
                        (SPADCALL |prime|
                                  (|compiledLookupCheck| '|localIntegralBasis|
                                                         (LIST
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|basis|
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E))))
                                                                (LIST '|:|
                                                                      '|basisDen|
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (|devaluate|
                                                                        E)))
                                                                (LIST '|:|
                                                                      '|basisInv|
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E)))))
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E)))
                                                         (|WildFunctionFieldIntegralBasis|
                                                          E
                                                          (|SparseUnivariatePolynomial|
                                                           E)
                                                          (|SparseUnivariatePolynomial|
                                                           (|SparseUnivariatePolynomial|
                                                            E))
                                                          FF)))
                        . #22#)
                  (LETT |bs|
                        (SPADCALL |factorIb| (SPADCALL (QREFELT $ 48)) |r|
                                  (|compiledLookupCheck| '|listConjugateBases|
                                                         (LIST
                                                          (LIST '|List|
                                                                (LIST '|Record|
                                                                      (LIST
                                                                       '|:|
                                                                       '|basis|
                                                                       (LIST
                                                                        '|Matrix|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          E))))
                                                                      (LIST
                                                                       '|:|
                                                                       '|basisDen|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E)))
                                                                      (LIST
                                                                       '|:|
                                                                       '|basisInv|
                                                                       (LIST
                                                                        '|Matrix|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          E))))))
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|basis|
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E))))
                                                                (LIST '|:|
                                                                      '|basisDen|
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (|devaluate|
                                                                        E)))
                                                                (LIST '|:|
                                                                      '|basisInv|
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E)))))
                                                          (LIST
                                                           '|NonNegativeInteger|)
                                                          (LIST
                                                           '|NonNegativeInteger|))
                                                         (|ChineseRemainderToolsForIntegralBases|
                                                          E
                                                          (|SparseUnivariatePolynomial|
                                                           E)
                                                          (|SparseUnivariatePolynomial|
                                                           (|SparseUnivariatePolynomial|
                                                            E)))))
                        . #22#)
                  (LETT |ib|
                        (SPADCALL |henselFactors| |bs| |n|
                                  (|compiledLookupCheck| '|chineseRemainder|
                                                         (LIST
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|basis|
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E))))
                                                                (LIST '|:|
                                                                      '|basisDen|
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (|devaluate|
                                                                        E)))
                                                                (LIST '|:|
                                                                      '|basisInv|
                                                                      (LIST
                                                                       '|Matrix|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E)))))
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   E))))
                                                          (LIST '|List|
                                                                (LIST '|Record|
                                                                      (LIST
                                                                       '|:|
                                                                       '|basis|
                                                                       (LIST
                                                                        '|Matrix|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          E))))
                                                                      (LIST
                                                                       '|:|
                                                                       '|basisDen|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         E)))
                                                                      (LIST
                                                                       '|:|
                                                                       '|basisInv|
                                                                       (LIST
                                                                        '|Matrix|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          E))))))
                                                          (LIST
                                                           '|NonNegativeInteger|))
                                                         (|ChineseRemainderToolsForIntegralBases|
                                                          E
                                                          (|SparseUnivariatePolynomial|
                                                           E)
                                                          (|SparseUnivariatePolynomial|
                                                           (|SparseUnivariatePolynomial|
                                                            E)))))
                        . #22#)
                  (LETT |b|
                        (SEQ
                         (LETT |bas|
                               (SPADCALL
                                (|compiledLookupCheck| '|retractIfCan|
                                                       (LIST
                                                        (LIST '|Union|
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              '#24="failed")
                                                        '$)
                                                       E)
                                (QVELT |ib| 0)
                                (|compiledLookupCheck| '|mapMatrixIfCan|
                                                       (LIST
                                                        (LIST '|Union|
                                                              (LIST '|Matrix|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7)))
                                                              '#2#)
                                                        (LIST '|Mapping|
                                                              (LIST '|Union|
                                                                    (|devaluate|
                                                                     (ELT $ 6))
                                                                    '#25="failed")
                                                              (|devaluate| E))
                                                        (LIST '|Matrix|
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                E))))
                                                       (|IntegralBasisPolynomialTools|
                                                        (ELT $ 6) (ELT $ 7)
                                                        (ELT $ 8) E)))
                               . #22#)
                         (EXIT
                          (COND
                           ((QEQCAR |bas| 1)
                            (|error| "retraction of basis failed"))
                           (#23# (QCDR |bas|)))))
                        . #22#)
                  (LETT |bInv|
                        (SEQ
                         (LETT |bas|
                               (SPADCALL
                                (|compiledLookupCheck| '|retractIfCan|
                                                       (LIST
                                                        (LIST '|Union|
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              '#24#)
                                                        '$)
                                                       E)
                                (QVELT |ib| 2)
                                (|compiledLookupCheck| '|mapMatrixIfCan|
                                                       (LIST
                                                        (LIST '|Union|
                                                              (LIST '|Matrix|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7)))
                                                              '#2#)
                                                        (LIST '|Mapping|
                                                              (LIST '|Union|
                                                                    (|devaluate|
                                                                     (ELT $ 6))
                                                                    '#25#)
                                                              (|devaluate| E))
                                                        (LIST '|Matrix|
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                E))))
                                                       (|IntegralBasisPolynomialTools|
                                                        (ELT $ 6) (ELT $ 7)
                                                        (ELT $ 8) E)))
                               . #22#)
                         (EXIT
                          (COND
                           ((QEQCAR |bas| 1)
                            (|error| "retraction of basis inverse failed"))
                           (#23# (QCDR |bas|)))))
                        . #22#)
                  (LETT |bDen|
                        (SEQ
                         (LETT |p|
                               (SPADCALL
                                (|compiledLookupCheck| '|retractIfCan|
                                                       (LIST
                                                        (LIST '|Union|
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              '#24#)
                                                        '$)
                                                       E)
                                (QVELT |ib| 1)
                                (|compiledLookupCheck| '|mapUnivariateIfCan|
                                                       (LIST
                                                        (LIST '|Union|
                                                              (|devaluate|
                                                               (ELT $ 7))
                                                              '#1#)
                                                        (LIST '|Mapping|
                                                              (LIST '|Union|
                                                                    (|devaluate|
                                                                     (ELT $ 6))
                                                                    '"failed")
                                                              (|devaluate| E))
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate| E)))
                                                       (|IntegralBasisPolynomialTools|
                                                        (ELT $ 6) (ELT $ 7)
                                                        (ELT $ 8) E)))
                               . #22#)
                         (EXIT
                          (COND
                           ((QEQCAR |p| 1)
                            (|error| "retraction of basis denominator failed"))
                           (#23# (QCDR |p|)))))
                        . #22#)
                  (EXIT (VECTOR |b| |bDen| |bInv|))))))))) 

(SDEFUN |PWFFINTB;padicLocalIntegralBasis|
        ((|p| UP) (|disc| R) (|redDisc| R) (|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R)) (|:| |discr| R)))
        (SPROG
         ((|index| (R))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R))))
          (|factorBases|
           (|List|
            (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                      (|:| |basisInv| (|Matrix| R)))))
          (|base|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R))))
          (|degPp| (|NonNegativeInteger|)) (#1=#:G191 NIL) (|pp| NIL)
          (#2=#:G192 NIL) (|k| NIL) (#3=#:G193 NIL) (|qq| NIL)
          (|degPrime| (|NonNegativeInteger|)) (|henselFactors| #4=(|List| UP))
          (|henselInfo| (|Record| (|:| |plist| #4#) (|:| |modulo| R)))
          (|deg| (|PositiveInteger|)) (#5=#:G170 NIL) (|primaries| (|List| UP))
          (#6=#:G190 NIL) (|ff| NIL) (#7=#:G189 NIL)
          (|redPrimaries| (|List| (|SparseUnivariatePolynomial| |sae|)))
          (#8=#:G188 NIL) (|f| NIL) (#9=#:G187 NIL)
          (|expons| (|List| (|NonNegativeInteger|))) (#10=#:G186 NIL)
          (#11=#:G185 NIL) (|primes| (|List| UP)) (#12=#:G184 NIL)
          (#13=#:G183 NIL)
          (|redPrimes| (|List| (|SparseUnivariatePolynomial| |sae|)))
          (#14=#:G182 NIL) (#15=#:G181 NIL)
          (|factorListSAE|
           (|List|
            (|Record|
             (|:| |flag|
                  (|Union| #16="nil" #17="sqfr" #18="irred" #19="prime"))
             (|:| |factor| (|SparseUnivariatePolynomial| |sae|))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|reducedP| (|SparseUnivariatePolynomial| |sae|))
          (|sae|
           (|Join| (|MonogenicAlgebra| K R)
                   (CATEGORY |package|
                    (IF (|has| K (|Field|))
                        (IF (|has| K (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)))))
         (SEQ
          (LETT |sae|
                (|SimpleAlgebraicExtension| (QREFELT $ 6) (QREFELT $ 7)
                                            |prime|)
                . #20=(|PWFFINTB;padicLocalIntegralBasis|))
          (LETT |reducedP|
                (SPADCALL
                 (|compiledLookupCheck| '|reduce|
                                        (LIST '$ (|devaluate| (ELT $ 7)))
                                        |sae|)
                 |p|
                 (|compiledLookupCheck| '|mapUnivariate|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|))
                                         (LIST '|Mapping| (|devaluate| |sae|)
                                               (|devaluate| (ELT $ 7)))
                                         (|devaluate| (ELT $ 8)))
                                        (|IntegralBasisPolynomialTools|
                                         (ELT $ 7) (ELT $ 8)
                                         (|SparseUnivariatePolynomial|
                                          (ELT $ 8))
                                         |sae|)))
                . #20#)
          (LETT |factorListSAE|
                (SPADCALL
                 (SPADCALL |reducedP|
                           (|compiledLookupCheck| '|factor|
                                                  (LIST
                                                   (LIST '|Factored|
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (|devaluate| |sae|)))
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| |sae|)))
                                                  (|DistinctDegreeFactorize|
                                                   |sae|
                                                   (|SparseUnivariatePolynomial|
                                                    |sae|))))
                 (|compiledLookupCheck| '|factorList|
                                        (LIST
                                         (LIST '|List|
                                               (LIST '|Record|
                                                     (LIST '|:| '|flag|
                                                           (LIST '|Union| '#16#
                                                                 '#17# '#18#
                                                                 '#19#))
                                                     (LIST '|:| '|factor|
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             |sae|)))
                                                     (LIST '|:| '|exponent|
                                                           (LIST
                                                            '|NonNegativeInteger|))))
                                         '$)
                                        (|Factored|
                                         (|SparseUnivariatePolynomial|
                                          |sae|))))
                . #20#)
          (EXIT
           (COND
            ((EQL (LENGTH |factorListSAE|) 1)
             (SEQ (LETT |ib| (SPADCALL |prime| (QREFELT $ 53)) . #20#)
                  (LETT |index| (SPADCALL (QVELT |ib| 2) (QREFELT $ 55))
                        . #20#)
                  (EXIT
                   (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)
                           (SPADCALL |disc|
                                     (SPADCALL |index| |index| (QREFELT $ 56))
                                     (QREFELT $ 57))))))
            ('T
             (SEQ
              (LETT |redPrimes|
                    (PROGN
                     (LETT #15# NIL . #20#)
                     (SEQ (LETT |f| NIL . #20#)
                          (LETT #14# |factorListSAE| . #20#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |f| (CAR #14#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #15# (CONS (QVELT |f| 1) #15#) . #20#)))
                          (LETT #14# (CDR #14#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #20#)
              (LETT |primes|
                    (PROGN
                     (LETT #13# NIL . #20#)
                     (SEQ (LETT |ff| NIL . #20#) (LETT #12# |redPrimes| . #20#)
                          G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |ff| (CAR #12#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|lift|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            '$)
                                                           |sae|)
                                    |ff|
                                    (|compiledLookupCheck| '|mapUnivariate|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT $ 8))
                                                            (LIST '|Mapping|
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  (|devaluate|
                                                                   |sae|))
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              |sae|)))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT $ 7) (ELT $ 8)
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT $ 8))
                                                            |sae|)))
                                   #13#)
                                  . #20#)))
                          (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #20#)
              (LETT |expons|
                    (PROGN
                     (LETT #11# NIL . #20#)
                     (SEQ (LETT |f| NIL . #20#)
                          (LETT #10# |factorListSAE| . #20#) G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT |f| (CAR #10#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #11# (CONS (QVELT |f| 2) #11#) . #20#)))
                          (LETT #10# (CDR #10#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #20#)
              (LETT |redPrimaries|
                    (PROGN
                     (LETT #9# NIL . #20#)
                     (SEQ (LETT |f| NIL . #20#)
                          (LETT #8# |factorListSAE| . #20#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |f| (CAR #8#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (SPADCALL (QVELT |f| 1) (QVELT |f| 2)
                                             (|compiledLookupCheck| '^
                                                                    (LIST '$ '$
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (|SparseUnivariatePolynomial|
                                                                     |sae|)))
                                   #9#)
                                  . #20#)))
                          (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    . #20#)
              (LETT |primaries|
                    (PROGN
                     (LETT #7# NIL . #20#)
                     (SEQ (LETT |ff| NIL . #20#)
                          (LETT #6# |redPrimaries| . #20#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |ff| (CAR #6#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|lift|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            '$)
                                                           |sae|)
                                    |ff|
                                    (|compiledLookupCheck| '|mapUnivariate|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT $ 8))
                                                            (LIST '|Mapping|
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  (|devaluate|
                                                                   |sae|))
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              |sae|)))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT $ 7) (ELT $ 8)
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT $ 8))
                                                            |sae|)))
                                   #7#)
                                  . #20#)))
                          (LETT #6# (CDR #6#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #20#)
              (LETT |deg|
                    (PROG1
                        (LETT #5#
                              (+ 1
                                 (* (SPADCALL |redDisc| |prime| (QREFELT $ 58))
                                    (SPADCALL |prime| (QREFELT $ 59))))
                              . #20#)
                      (|check_subtype2| (> #5# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #5#))
                    . #20#)
              (LETT |henselInfo|
                    (SPADCALL |p| |primaries| |prime| |deg| (QREFELT $ 63))
                    . #20#)
              (LETT |henselFactors| (QCAR |henselInfo|) . #20#)
              (LETT |factorBases| NIL . #20#)
              (LETT |degPrime| (SPADCALL |prime| (QREFELT $ 59)) . #20#)
              (SEQ (LETT |qq| NIL . #20#) (LETT #3# |henselFactors| . #20#)
                   (LETT |k| NIL . #20#) (LETT #2# |expons| . #20#)
                   (LETT |pp| NIL . #20#) (LETT #1# |primes| . #20#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #20#) NIL)
                         (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #20#) NIL)
                         (ATOM #3#) (PROGN (LETT |qq| (CAR #3#) . #20#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |base|
                          (SEQ
                           (LETT |degPp| (SPADCALL |pp| (QREFELT $ 36)) . #20#)
                           (COND
                            ((SPADCALL |degPp| 1 (QREFELT $ 65))
                             (COND
                              ((EQL (GCD |degPp| |degPrime|) 1)
                               (EXIT
                                (|PWFFINTB;compLocalBasisOverExt| |qq| |prime|
                                 |pp| |k| $))))))
                           (EXIT (|PWFFINTB;compLocalBasis| |qq| |prime| $)))
                          . #20#)
                    (EXIT
                     (LETT |factorBases| (CONS |base| |factorBases|) . #20#)))
                   (LETT #1#
                         (PROG1 (CDR #1#)
                           (LETT #2#
                                 (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #20#))
                                 . #20#))
                         . #20#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |factorBases| (NREVERSE |factorBases|) . #20#)
              (LETT |ib|
                    (SPADCALL |henselFactors| |factorBases|
                              (SPADCALL (QREFELT $ 66)) (QREFELT $ 69))
                    . #20#)
              (LETT |index| (SPADCALL (QVELT |ib| 2) (QREFELT $ 55)) . #20#)
              (EXIT
               (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)
                       (SPADCALL |disc|
                                 (SPADCALL |index| |index| (QREFELT $ 56))
                                 (QREFELT $ 57))))))))))) 

(SDEFUN |PWFFINTB;localIntegralBasis;RR;5|
        ((|prime| R)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|ib|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R)) (|:| |discr| R)))
          (|redDisc| (R)) (|disc| (R)) (|p| (UP)))
         (SEQ
          (LETT |p| (SPADCALL (QREFELT $ 70))
                . #1=(|PWFFINTB;localIntegralBasis;RR;5|))
          (LETT |disc| (SPADCALL |p| (QREFELT $ 37)) . #1#)
          (LETT |redDisc| (SPADCALL |p| (QREFELT $ 34)) . #1#)
          (LETT |ib|
                (|PWFFINTB;padicLocalIntegralBasis| |p| |disc| |redDisc|
                 |prime| $)
                . #1#)
          (EXIT (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)))))) 

(SDEFUN |PWFFINTB;listSquaredFactors| ((|px| R) ($ |List| R))
        (SPROG
         ((|ans| (|List| R)) (#1=#:G203 NIL) (|f| NIL)
          (|factored| (|Factored| R)))
         (SEQ (LETT |ans| NIL . #2=(|PWFFINTB;listSquaredFactors|))
              (LETT |factored| (SPADCALL |px| (QREFELT $ 74)) . #2#)
              (SEQ (LETT |f| NIL . #2#)
                   (LETT #1# (SPADCALL |factored| (QREFELT $ 78)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |f| 2) 1 (QREFELT $ 65))
                       (LETT |ans| (CONS (QVELT |f| 1) |ans|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |PWFFINTB;integralBasis;R;7|
        (($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|runningRbinv| #1=(|Matrix| R)) (|runningRb| #1#)
          (|runningRbden| (R)) (|mat| (|Matrix| R)) (|disc| (R)) (|rbden| (R))
          (|rbinv| #2=(|Matrix| R)) (|rb| #3=(|Matrix| R))
          (|lb|
           (|Record| (|:| |basis| #3#) (|:| |basisDen| R) (|:| |basisInv| #2#)
                     (|:| |discr| R)))
          (#4=#:G211 NIL) (|prime| NIL) (|redDisc| (R)) (|singList| (|List| R))
          (|n| (|PositiveInteger|)) (|p| (UP)))
         (SEQ
          (LETT |p| (SPADCALL (QREFELT $ 70))
                . #5=(|PWFFINTB;integralBasis;R;7|))
          (LETT |disc| (SPADCALL |p| (QREFELT $ 37)) . #5#)
          (LETT |n| (SPADCALL (QREFELT $ 66)) . #5#)
          (LETT |singList| (|PWFFINTB;listSquaredFactors| |disc| $) . #5#)
          (LETT |redDisc| (SPADCALL |p| (QREFELT $ 34)) . #5#)
          (LETT |runningRb|
                (LETT |runningRbinv|
                      (SPADCALL |n| (|spadConstant| $ 39) (QREFELT $ 41))
                      . #5#)
                . #5#)
          (LETT |runningRbden| (|spadConstant| $ 39) . #5#)
          (EXIT
           (COND
            ((NULL |singList|)
             (VECTOR |runningRb| |runningRbden| |runningRbinv|))
            ('T
             (SEQ
              (SEQ (LETT |prime| NIL . #5#) (LETT #4# |singList| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |prime| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |lb|
                          (|PWFFINTB;padicLocalIntegralBasis| |p| |disc|
                           |redDisc| |prime| $)
                          . #5#)
                    (LETT |rb| (QVELT |lb| 0) . #5#)
                    (LETT |rbinv| (QVELT |lb| 2) . #5#)
                    (LETT |rbden| (QVELT |lb| 1) . #5#)
                    (LETT |disc| (QVELT |lb| 3) . #5#)
                    (LETT |mat|
                          (SPADCALL
                           (SPADCALL |rbden| |runningRb| (QREFELT $ 79))
                           (SPADCALL |runningRbden| |rb| (QREFELT $ 79))
                           (QREFELT $ 80))
                          . #5#)
                    (LETT |runningRbden|
                          (SPADCALL |runningRbden| |rbden| (QREFELT $ 56))
                          . #5#)
                    (LETT |runningRb|
                          (SPADCALL
                           (SPADCALL |mat| |runningRbden| (QREFELT $ 82))
                           (QREFELT $ 83))
                          . #5#)
                    (EXIT
                     (LETT |runningRbinv|
                           (SPADCALL |runningRb| |runningRbden| (QREFELT $ 85))
                           . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|))))))))) 

(DECLAIM (NOTINLINE |PAdicWildFunctionFieldIntegralBasis;|)) 

(DEFUN |PAdicWildFunctionFieldIntegralBasis| (&REST #1=#:G212)
  (SPROG NIL
         (PROG (#2=#:G213)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PAdicWildFunctionFieldIntegralBasis|)
                                               '|domainEqualList|)
                    . #3=(|PAdicWildFunctionFieldIntegralBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |PAdicWildFunctionFieldIntegralBasis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PAdicWildFunctionFieldIntegralBasis|)))))))))) 

(DEFUN |PAdicWildFunctionFieldIntegralBasis;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PAdicWildFunctionFieldIntegralBasis|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$|
          (LIST '|PAdicWildFunctionFieldIntegralBasis| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 87) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PAdicWildFunctionFieldIntegralBasis|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|PAdicWildFunctionFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 7) (0 . |coerce|)
              (|SparseUnivariatePolynomial| 10) (|Mapping| 10 7)
              (|IntegralBasisPolynomialTools| 7 8
                                              (|SparseUnivariatePolynomial| 8)
                                              10)
              (5 . |mapUnivariate|) (11 . |differentiate|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (16 . |extendedEuclidean|) (|List| 10) (22 . |coefficients|)
              (27 . |concat|) (|Record| (|:| |num| 19) (|:| |den| 7))
              (|CommonDenominator| 7 10 19) (33 . |splitDenominator|)
              (38 . |numer|) (|List| 7) (|Mapping| 7 10)
              (|ListFunctions2| 10 7) (43 . |map|) (|List| $) (49 . |gcd|)
              (|Union| $ '"failed") (54 . |exquo|)
              |PWFFINTB;reducedDiscriminant;UPR;1| (|NonNegativeInteger|)
              (60 . |degree|) (65 . |discriminant|) (70 . |One|) (74 . |One|)
              (|Matrix| 7) (78 . |scalarMatrix|)
              (|SparseUnivariatePolynomial| 6) (|PositiveInteger|)
              (|IrredPolyOverFiniteField| 6) (84 . |generateIrredPoly|)
              (89 . |One|) (93 . |One|) (97 . |size|) (|Vector| $)
              (101 . |basis|)
              (|Record| (|:| |basis| 40) (|:| |basisDen| 7)
                        (|:| |basisInv| 40))
              (|WildFunctionFieldIntegralBasis| 6 7 8 9)
              (105 . |localIntegralBasis|) (|IntegralBasisTools| 7 8 9)
              (110 . |diagonalProduct|) (115 . *) (121 . |quo|) (127 . |order|)
              (133 . |degree|) (|Record| (|:| |plist| 61) (|:| |modulo| 7))
              (|List| 8) (|GeneralHenselPackage| 7 8) (138 . |HenselLift|)
              (|Boolean|) (146 . >) (152 . |rank|) (|List| 51)
              (|ChineseRemainderToolsForIntegralBases| 6 7 8)
              (156 . |chineseRemainder|) (163 . |definingPolynomial|)
              |PWFFINTB;localIntegralBasis;RR;5| (|Factored| 7)
              (|DistinctDegreeFactorize| 6 7) (167 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 75) (|:| |factor| 7) (|:| |exponent| 35))
              (|List| 76) (172 . |factorList|) (177 . *) (183 . |vertConcat|)
              (|ModularHermitianRowReduction| 7) (189 . |rowEchelon|)
              (195 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 40)
              (200 . |UpTriBddDenomInv|) |PWFFINTB;integralBasis;R;7|)
           '#(|reducedDiscriminant| 206 |localIntegralBasis| 211
              |integralBasis| 216)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 86
                                                 '(1 10 0 7 11 2 14 12 13 8 15
                                                   1 12 0 0 16 2 12 17 0 0 18 1
                                                   12 19 0 20 2 19 0 0 0 21 1
                                                   23 22 19 24 1 10 7 0 25 2 28
                                                   26 27 19 29 1 7 0 30 31 2 7
                                                   32 0 0 33 1 8 35 0 36 1 8 7
                                                   0 37 0 6 0 38 0 7 0 39 2 40
                                                   0 35 7 41 1 44 42 43 45 0 8
                                                   0 46 0 9 0 47 0 6 35 48 0 9
                                                   49 50 1 52 51 7 53 1 54 7 40
                                                   55 2 7 0 0 0 56 2 7 0 0 0 57
                                                   2 7 35 0 0 58 1 7 35 0 59 4
                                                   62 60 8 61 7 43 63 2 35 64 0
                                                   0 65 0 9 43 66 3 68 51 61 67
                                                   35 69 0 9 8 70 1 73 72 7 74
                                                   1 72 77 0 78 2 40 0 7 0 79 2
                                                   40 0 0 0 80 2 81 40 40 7 82
                                                   1 40 0 0 83 2 84 40 40 7 85
                                                   1 0 7 8 34 1 0 51 7 71 0 0
                                                   51 86)))))
           '|lookupComplete|)) 
