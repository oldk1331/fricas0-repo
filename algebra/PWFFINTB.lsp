
(DEFUN |PWFFINTB;reducedDiscriminant;UPR;1| (|f| $)
  (PROG (|ans| |gg| |denom| |cden| |cc| |ee| |ff|)
    (RETURN
     (SEQ
      (LETT |ff| (SPADCALL (ELT $ 11) |f| (QREFELT $ 15))
            . #1=(|PWFFINTB;reducedDiscriminant;UPR;1|))
      (LETT |ee| (SPADCALL |ff| (SPADCALL |ff| (QREFELT $ 16)) (QREFELT $ 18))
            . #1#)
      (LETT |cc|
            (SPADCALL (SPADCALL (QVELT |ee| 0) (QREFELT $ 20))
                      (SPADCALL (QVELT |ee| 1) (QREFELT $ 20)) (QREFELT $ 21))
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
        ('T (QCDR |ans|)))))))) 

(DEFUN |PWFFINTB;compLocalBasis| (|poly| |prime| $)
  (PROG (|sae|)
    (RETURN
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
                                                     (|devaluate| (ELT $ 7)))
                                               (LIST '|:| '|basisInv|
                                                     (LIST '|Matrix|
                                                           (|devaluate|
                                                            (ELT $ 7)))))
                                         (|devaluate| (ELT $ 7)))
                                        (|WildFunctionFieldIntegralBasis|
                                         (ELT $ 6) (ELT $ 7) (ELT $ 8)
                                         |sae|)))))))) 

(DEFUN |PWFFINTB;compLocalBasisOverExt| (|poly0| |prime0| |irrPoly0| |k| $)
  (PROG (|bDen| |p| |bInv| |bas| |b| |ib| |bs| |factorIb| FF |psi1|
         |henselFactors| |henselInfo| |deg| #1=#:G132 |primaries| #2=#:G153
         |ff| #3=#:G152 |redFactors| #4=#:G151 |f| #5=#:G150 |factorListSAE|
         |redIrrPoly| |pp| |sae| |prime| |redDisc| |redDisc0| |poly| E
         |irrPoly| #6=#:G124 |r| |disc0| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |poly0| (QREFELT $ 36))
            . #7=(|PWFFINTB;compLocalBasisOverExt|))
      (LETT |disc0| (SPADCALL |poly0| (QREFELT $ 37)) . #7#)
      (EXIT
       (COND
        ((QEQCAR (SPADCALL |disc0| |prime0| (QREFELT $ 33)) 1)
         (VECTOR (SPADCALL |n| (|spadConstant| $ 39) (QREFELT $ 41))
                 (|spadConstant| $ 39)
                 (SPADCALL |n| (|spadConstant| $ 39) (QREFELT $ 41))))
        (#8='T
         (SEQ (LETT |r| (SPADCALL |irrPoly0| (QREFELT $ 36)) . #7#)
              (LETT |irrPoly|
                    (SPADCALL
                     (PROG1 (LETT #6# |r| . #7#)
                       (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#))
                     (QREFELT $ 45))
                    . #7#)
              (LETT E
                    (|SimpleAlgebraicExtension| (QREFELT $ 6)
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 6))
                                                |irrPoly|)
                    . #7#)
              (LETT |poly|
                    (SPADCALL
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| (ELT $ 6)))
                                            E)
                     |poly0|
                     (|compiledLookupCheck| '|mapBivariate|
                                            (LIST
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (LIST
                                               '|SparseUnivariatePolynomial|
                                               (|devaluate| E)))
                                             (LIST '|Mapping| (|devaluate| E)
                                                   (|devaluate| (ELT $ 6)))
                                             (|devaluate| (ELT $ 8)))
                                            (|IntegralBasisPolynomialTools|
                                             (ELT $ 6) (ELT $ 7) (ELT $ 8) E)))
                    . #7#)
              (LETT |redDisc0| (SPADCALL |poly0| (QREFELT $ 34)) . #7#)
              (LETT |redDisc|
                    (SPADCALL
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| (ELT $ 6)))
                                            E)
                     |redDisc0|
                     (|compiledLookupCheck| '|mapUnivariate|
                                            (LIST
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (|devaluate| E))
                                             (LIST '|Mapping| (|devaluate| E)
                                                   (|devaluate| (ELT $ 6)))
                                             (|devaluate| (ELT $ 7)))
                                            (|IntegralBasisPolynomialTools|
                                             (ELT $ 6) (ELT $ 7) (ELT $ 8) E)))
                    . #7#)
              (LETT |prime|
                    (SPADCALL
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| (ELT $ 6)))
                                            E)
                     |prime0|
                     (|compiledLookupCheck| '|mapUnivariate|
                                            (LIST
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (|devaluate| E))
                                             (LIST '|Mapping| (|devaluate| E)
                                                   (|devaluate| (ELT $ 6)))
                                             (|devaluate| (ELT $ 7)))
                                            (|IntegralBasisPolynomialTools|
                                             (ELT $ 6) (ELT $ 7) (ELT $ 8) E)))
                    . #7#)
              (LETT |sae|
                    (|SimpleAlgebraicExtension| E
                                                (|SparseUnivariatePolynomial|
                                                 E)
                                                |prime|)
                    . #7#)
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
                                                    (|devaluate| (ELT $ 8)))
                                                   (|IntegralBasisPolynomialTools|
                                                    (ELT $ 6) (ELT $ 7)
                                                    (ELT $ 8) E)))
                           . #7#)
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
                                               (|SparseUnivariatePolynomial| E)
                                               (|SparseUnivariatePolynomial|
                                                (|SparseUnivariatePolynomial|
                                                 E))
                                               (|SparseUnivariatePolynomial|
                                                (|SparseUnivariatePolynomial|
                                                 (|SparseUnivariatePolynomial|
                                                  E)))
                                               |sae|)))))
                    . #7#)
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
                                                        (|devaluate| |sae|)))
                                                      (|DistinctDegreeFactorize|
                                                       |sae|
                                                       (|SparseUnivariatePolynomial|
                                                        |sae|))))
                     (|compiledLookupCheck| '|factors|
                                            (LIST
                                             (LIST '|List|
                                                   (LIST '|Record|
                                                         (LIST '|:| '|factor|
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 |sae|)))
                                                         (LIST '|:| '|exponent|
                                                               (LIST
                                                                '|Integer|))))
                                             '$)
                                            (|Factored|
                                             (|SparseUnivariatePolynomial|
                                              |sae|))))
                    . #7#)
              (LETT |redFactors|
                    (PROGN
                     (LETT #5# NIL . #7#)
                     (SEQ (LETT |f| NIL . #7#) (LETT #4# |factorListSAE| . #7#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL (QCAR |f|) |k|
                                             (|compiledLookupCheck| '^
                                                                    (LIST '$ '$
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (|SparseUnivariatePolynomial|
                                                                     |sae|)))
                                   #5#)
                                  . #7#)))
                          (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #7#)
              (LETT |primaries|
                    (PROGN
                     (LETT #3# NIL . #7#)
                     (SEQ (LETT |ff| NIL . #7#) (LETT #2# |redFactors| . #7#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |ff| (CAR #2#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|lift|
                                                           (LIST
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate| E))
                                                            '$)
                                                           |sae|)
                                    |ff|
                                    (|compiledLookupCheck| '|mapUnivariate|
                                                           (LIST
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate| E)))
                                                            (LIST '|Mapping|
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
                                   #3#)
                                  . #7#)))
                          (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #7#)
              (LETT |deg|
                    (PROG1
                        (LETT #1#
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
                                            (|compiledLookupCheck| '|degree|
                                                                   (LIST
                                                                    (LIST
                                                                     '|NonNegativeInteger|)
                                                                    '$)
                                                                   (|SparseUnivariatePolynomial|
                                                                    E)))))
                              . #7#)
                      (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                    . #7#)
              (LETT |henselInfo|
                    (SPADCALL |poly| |primaries| |prime| |deg|
                              (|compiledLookupCheck| '|HenselLift|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:| '|plist|
                                                                  (LIST '|List|
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
                    . #7#)
              (LETT |henselFactors| (QCAR |henselInfo|) . #7#)
              (LETT |psi1| (|SPADfirst| |henselFactors|) . #7#)
              (LETT FF
                    (|SimpleAlgebraicExtension|
                     (|SparseUnivariatePolynomial| E)
                     (|SparseUnivariatePolynomial|
                      (|SparseUnivariatePolynomial| E))
                     |psi1|)
                    . #7#)
              (LETT |factorIb|
                    (SPADCALL |prime|
                              (|compiledLookupCheck| '|localIntegralBasis|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:| '|basis|
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
                    . #7#)
              (LETT |bs|
                    (SPADCALL |factorIb| (SPADCALL (QREFELT $ 48)) |r|
                              (|compiledLookupCheck| '|listConjugateBases|
                                                     (LIST
                                                      (LIST '|List|
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
                                                                           E))))))
                                                      (LIST '|Record|
                                                            (LIST '|:| '|basis|
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
                    . #7#)
              (LETT |ib|
                    (SPADCALL |henselFactors| |bs| |n|
                              (|compiledLookupCheck| '|chineseRemainder|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:| '|basis|
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
                    . #7#)
              (LETT |b|
                    (SEQ
                     (LETT |bas|
                           (SPADCALL
                            (|compiledLookupCheck| '|retractIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          '#9="failed")
                                                    '$)
                                                   E)
                            (QVELT |ib| 0)
                            (|compiledLookupCheck| '|mapMatrixIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (LIST '|Matrix|
                                                                (|devaluate|
                                                                 (ELT $ 7)))
                                                          '#10="failed")
                                                    (LIST '|Mapping|
                                                          (LIST '|Union|
                                                                (|devaluate|
                                                                 (ELT $ 6))
                                                                '#11="failed")
                                                          (|devaluate| E))
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E))))
                                                   (|IntegralBasisPolynomialTools|
                                                    (ELT $ 6) (ELT $ 7)
                                                    (ELT $ 8) E)))
                           . #7#)
                     (EXIT
                      (COND
                       ((QEQCAR |bas| 1)
                        (|error| "retraction of basis failed"))
                       (#8# (QCDR |bas|)))))
                    . #7#)
              (LETT |bInv|
                    (SEQ
                     (LETT |bas|
                           (SPADCALL
                            (|compiledLookupCheck| '|retractIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          '#9#)
                                                    '$)
                                                   E)
                            (QVELT |ib| 2)
                            (|compiledLookupCheck| '|mapMatrixIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (LIST '|Matrix|
                                                                (|devaluate|
                                                                 (ELT $ 7)))
                                                          '#10#)
                                                    (LIST '|Mapping|
                                                          (LIST '|Union|
                                                                (|devaluate|
                                                                 (ELT $ 6))
                                                                '#11#)
                                                          (|devaluate| E))
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E))))
                                                   (|IntegralBasisPolynomialTools|
                                                    (ELT $ 6) (ELT $ 7)
                                                    (ELT $ 8) E)))
                           . #7#)
                     (EXIT
                      (COND
                       ((QEQCAR |bas| 1)
                        (|error| "retraction of basis inverse failed"))
                       (#8# (QCDR |bas|)))))
                    . #7#)
              (LETT |bDen|
                    (SEQ
                     (LETT |p|
                           (SPADCALL
                            (|compiledLookupCheck| '|retractIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          '#9#)
                                                    '$)
                                                   E)
                            (QVELT |ib| 1)
                            (|compiledLookupCheck| '|mapUnivariateIfCan|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (|devaluate|
                                                           (ELT $ 7))
                                                          '"failed")
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
                           . #7#)
                     (EXIT
                      (COND
                       ((QEQCAR |p| 1)
                        (|error| "retraction of basis denominator failed"))
                       (#8# (QCDR |p|)))))
                    . #7#)
              (EXIT (VECTOR |b| |bDen| |bInv|)))))))))) 

(DEFUN |PWFFINTB;padicLocalIntegralBasis| (|p| |disc| |redDisc| |prime| $)
  (PROG (|index| |ib| |factorBases| |base| |degPp| #1=#:G191 |pp| #2=#:G192 |k|
         #3=#:G193 |qq| |degPrime| |henselFactors| |henselInfo| |deg| #4=#:G171
         |primaries| #5=#:G190 |ff| #6=#:G189 |redPrimaries| #7=#:G167
         #8=#:G188 |f| #9=#:G187 |expons| #10=#:G165 #11=#:G186 #12=#:G185
         |primes| #13=#:G184 #14=#:G183 |redPrimes| #15=#:G182 #16=#:G181
         |factorListSAE| |reducedP| |sae|)
    (RETURN
     (SEQ
      (LETT |sae|
            (|SimpleAlgebraicExtension| (QREFELT $ 6) (QREFELT $ 7) |prime|)
            . #17=(|PWFFINTB;padicLocalIntegralBasis|))
      (LETT |reducedP|
            (SPADCALL
             (|compiledLookupCheck| '|reduce| (LIST '$ (|devaluate| (ELT $ 7)))
                                    |sae|)
             |p|
             (|compiledLookupCheck| '|mapUnivariate|
                                    (LIST
                                     (LIST '|SparseUnivariatePolynomial|
                                           (|devaluate| |sae|))
                                     (LIST '|Mapping| (|devaluate| |sae|)
                                           (|devaluate| (ELT $ 7)))
                                     (|devaluate| (ELT $ 8)))
                                    (|IntegralBasisPolynomialTools| (ELT $ 7)
                                                                    (ELT $ 8)
                                                                    (|SparseUnivariatePolynomial|
                                                                     (ELT $ 8))
                                                                    |sae|)))
            . #17#)
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
                                              (|DistinctDegreeFactorize| |sae|
                                                                         (|SparseUnivariatePolynomial|
                                                                          |sae|))))
             (|compiledLookupCheck| '|factors|
                                    (LIST
                                     (LIST '|List|
                                           (LIST '|Record|
                                                 (LIST '|:| '|factor|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate| |sae|)))
                                                 (LIST '|:| '|exponent|
                                                       (LIST '|Integer|))))
                                     '$)
                                    (|Factored|
                                     (|SparseUnivariatePolynomial| |sae|))))
            . #17#)
      (EXIT
       (COND
        ((EQL (LENGTH |factorListSAE|) 1)
         (SEQ (LETT |ib| (SPADCALL |prime| (QREFELT $ 53)) . #17#)
              (LETT |index| (SPADCALL (QVELT |ib| 2) (QREFELT $ 55)) . #17#)
              (EXIT
               (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)
                       (SPADCALL |disc|
                                 (SPADCALL |index| |index| (QREFELT $ 56))
                                 (QREFELT $ 57))))))
        ('T
         (SEQ
          (LETT |redPrimes|
                (PROGN
                 (LETT #16# NIL . #17#)
                 (SEQ (LETT |f| NIL . #17#) (LETT #15# |factorListSAE| . #17#)
                      G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |f| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #16# (CONS (QCAR |f|) #16#) . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |primes|
                (PROGN
                 (LETT #14# NIL . #17#)
                 (SEQ (LETT |ff| NIL . #17#) (LETT #13# |redPrimes| . #17#)
                      G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |ff| (CAR #13#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14#
                              (CONS
                               (SPADCALL
                                (|compiledLookupCheck| '|lift|
                                                       (LIST
                                                        (|devaluate| (ELT $ 7))
                                                        '$)
                                                       |sae|)
                                |ff|
                                (|compiledLookupCheck| '|mapUnivariate|
                                                       (LIST
                                                        (|devaluate| (ELT $ 8))
                                                        (LIST '|Mapping|
                                                              (|devaluate|
                                                               (ELT $ 7))
                                                              (|devaluate|
                                                               |sae|))
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate| |sae|)))
                                                       (|IntegralBasisPolynomialTools|
                                                        (ELT $ 7) (ELT $ 8)
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 8))
                                                        |sae|)))
                               #14#)
                              . #17#)))
                      (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #17#)
          (LETT |expons|
                (PROGN
                 (LETT #12# NIL . #17#)
                 (SEQ (LETT |f| NIL . #17#) (LETT #11# |factorListSAE| . #17#)
                      G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |f| (CAR #11#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12#
                              (CONS
                               (PROG1 (LETT #10# (QCDR |f|) . #17#)
                                 (|check_subtype| (>= #10# 0)
                                                  '(|NonNegativeInteger|)
                                                  #10#))
                               #12#)
                              . #17#)))
                      (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #17#)
          (LETT |redPrimaries|
                (PROGN
                 (LETT #9# NIL . #17#)
                 (SEQ (LETT |f| NIL . #17#) (LETT #8# |factorListSAE| . #17#)
                      G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |f| (CAR #8#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL (QCAR |f|)
                                         (PROG1 (LETT #7# (QCDR |f|) . #17#)
                                           (|check_subtype| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            #7#))
                                         (|compiledLookupCheck| '^
                                                                (LIST '$ '$
                                                                      (LIST
                                                                       '|NonNegativeInteger|))
                                                                (|SparseUnivariatePolynomial|
                                                                 |sae|)))
                               #9#)
                              . #17#)))
                      (LETT #8# (CDR #8#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #17#)
          (LETT |primaries|
                (PROGN
                 (LETT #6# NIL . #17#)
                 (SEQ (LETT |ff| NIL . #17#) (LETT #5# |redPrimaries| . #17#)
                      G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |ff| (CAR #5#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL
                                (|compiledLookupCheck| '|lift|
                                                       (LIST
                                                        (|devaluate| (ELT $ 7))
                                                        '$)
                                                       |sae|)
                                |ff|
                                (|compiledLookupCheck| '|mapUnivariate|
                                                       (LIST
                                                        (|devaluate| (ELT $ 8))
                                                        (LIST '|Mapping|
                                                              (|devaluate|
                                                               (ELT $ 7))
                                                              (|devaluate|
                                                               |sae|))
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate| |sae|)))
                                                       (|IntegralBasisPolynomialTools|
                                                        (ELT $ 7) (ELT $ 8)
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 8))
                                                        |sae|)))
                               #6#)
                              . #17#)))
                      (LETT #5# (CDR #5#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #17#)
          (LETT |deg|
                (PROG1
                    (LETT #4#
                          (+ 1
                             (* (SPADCALL |redDisc| |prime| (QREFELT $ 58))
                                (SPADCALL |prime| (QREFELT $ 59))))
                          . #17#)
                  (|check_subtype| (> #4# 0) '(|PositiveInteger|) #4#))
                . #17#)
          (LETT |henselInfo|
                (SPADCALL |p| |primaries| |prime| |deg| (QREFELT $ 63)) . #17#)
          (LETT |henselFactors| (QCAR |henselInfo|) . #17#)
          (LETT |factorBases| NIL . #17#)
          (LETT |degPrime| (SPADCALL |prime| (QREFELT $ 59)) . #17#)
          (SEQ (LETT |qq| NIL . #17#) (LETT #3# |henselFactors| . #17#)
               (LETT |k| NIL . #17#) (LETT #2# |expons| . #17#)
               (LETT |pp| NIL . #17#) (LETT #1# |primes| . #17#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #17#) NIL)
                     (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #17#) NIL)
                     (ATOM #3#) (PROGN (LETT |qq| (CAR #3#) . #17#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |base|
                      (SEQ (LETT |degPp| (SPADCALL |pp| (QREFELT $ 36)) . #17#)
                           (COND
                            ((SPADCALL |degPp| 1 (QREFELT $ 65))
                             (COND
                              ((EQL (GCD |degPp| |degPrime|) 1)
                               (EXIT
                                (|PWFFINTB;compLocalBasisOverExt| |qq| |prime|
                                 |pp| |k| $))))))
                           (EXIT (|PWFFINTB;compLocalBasis| |qq| |prime| $)))
                      . #17#)
                (EXIT (LETT |factorBases| (CONS |base| |factorBases|) . #17#)))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #17#))
                             . #17#))
                     . #17#)
               (GO G190) G191 (EXIT NIL))
          (LETT |factorBases| (NREVERSE |factorBases|) . #17#)
          (LETT |ib|
                (SPADCALL |henselFactors| |factorBases|
                          (SPADCALL (QREFELT $ 66)) (QREFELT $ 69))
                . #17#)
          (LETT |index| (SPADCALL (QVELT |ib| 2) (QREFELT $ 55)) . #17#)
          (EXIT
           (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)
                   (SPADCALL |disc| (SPADCALL |index| |index| (QREFELT $ 56))
                             (QREFELT $ 57)))))))))))) 

(DEFUN |PWFFINTB;localIntegralBasis;RR;5| (|prime| $)
  (PROG (|ib| |redDisc| |disc| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL (QREFELT $ 70))
            . #1=(|PWFFINTB;localIntegralBasis;RR;5|))
      (LETT |disc| (SPADCALL |p| (QREFELT $ 37)) . #1#)
      (LETT |redDisc| (SPADCALL |p| (QREFELT $ 34)) . #1#)
      (LETT |ib|
            (|PWFFINTB;padicLocalIntegralBasis| |p| |disc| |redDisc| |prime| $)
            . #1#)
      (EXIT (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2))))))) 

(DEFUN |PWFFINTB;listSquaredFactors| (|px| $)
  (PROG (|ans| #1=#:G203 |f| |factored|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|PWFFINTB;listSquaredFactors|))
          (LETT |factored| (SPADCALL |px| (QREFELT $ 74)) . #2#)
          (SEQ (LETT |f| NIL . #2#)
               (LETT #1# (SPADCALL |factored| (QREFELT $ 77)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QCDR |f|) 1 (QREFELT $ 79))
                   (LETT |ans| (CONS (QCAR |f|) |ans|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |PWFFINTB;integralBasis;R;7| ($)
  (PROG (|runningRbinv| |runningRb| |runningRbden| |mat| |disc| |rbden| |rbinv|
         |rb| |lb| #1=#:G211 |prime| |redDisc| |singList| |n| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL (QREFELT $ 70)) . #2=(|PWFFINTB;integralBasis;R;7|))
      (LETT |disc| (SPADCALL |p| (QREFELT $ 37)) . #2#)
      (LETT |n| (SPADCALL (QREFELT $ 66)) . #2#)
      (LETT |singList| (|PWFFINTB;listSquaredFactors| |disc| $) . #2#)
      (LETT |redDisc| (SPADCALL |p| (QREFELT $ 34)) . #2#)
      (LETT |runningRb|
            (LETT |runningRbinv|
                  (SPADCALL |n| (|spadConstant| $ 39) (QREFELT $ 41)) . #2#)
            . #2#)
      (LETT |runningRbden| (|spadConstant| $ 39) . #2#)
      (EXIT
       (COND
        ((NULL |singList|) (VECTOR |runningRb| |runningRbden| |runningRbinv|))
        ('T
         (SEQ
          (SEQ (LETT |prime| NIL . #2#) (LETT #1# |singList| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |prime| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lb|
                      (|PWFFINTB;padicLocalIntegralBasis| |p| |disc| |redDisc|
                       |prime| $)
                      . #2#)
                (LETT |rb| (QVELT |lb| 0) . #2#)
                (LETT |rbinv| (QVELT |lb| 2) . #2#)
                (LETT |rbden| (QVELT |lb| 1) . #2#)
                (LETT |disc| (QVELT |lb| 3) . #2#)
                (LETT |mat|
                      (SPADCALL (SPADCALL |rbden| |runningRb| (QREFELT $ 80))
                                (SPADCALL |runningRbden| |rb| (QREFELT $ 80))
                                (QREFELT $ 81))
                      . #2#)
                (LETT |runningRbden|
                      (SPADCALL |runningRbden| |rbden| (QREFELT $ 56)) . #2#)
                (LETT |runningRb|
                      (SPADCALL (SPADCALL |mat| |runningRbden| (QREFELT $ 83))
                                (QREFELT $ 84))
                      . #2#)
                (EXIT
                 (LETT |runningRbinv|
                       (SPADCALL |runningRb| |runningRbden| (QREFELT $ 86))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |runningRb| |runningRbden| |runningRbinv|)))))))))) 

(DECLAIM (NOTINLINE |PAdicWildFunctionFieldIntegralBasis;|)) 

(DEFUN |PAdicWildFunctionFieldIntegralBasis| (&REST #1=#:G212)
  (PROG ()
    (RETURN
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
                  (APPLY (|function| |PAdicWildFunctionFieldIntegralBasis;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PAdicWildFunctionFieldIntegralBasis|))))))))))) 

(DEFUN |PAdicWildFunctionFieldIntegralBasis;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|PAdicWildFunctionFieldIntegralBasis|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|PAdicWildFunctionFieldIntegralBasis| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 88) . #1#)
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
      $)))) 

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
              (|Record| (|:| |factor| 7) (|:| |exponent| 78)) (|List| 75)
              (172 . |factors|) (|Integer|) (177 . >) (183 . *)
              (189 . |vertConcat|) (|ModularHermitianRowReduction| 7)
              (195 . |rowEchelon|) (201 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 40)
              (206 . |UpTriBddDenomInv|) |PWFFINTB;integralBasis;R;7|)
           '#(|reducedDiscriminant| 212 |localIntegralBasis| 217
              |integralBasis| 222)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 87
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
                                                   1 72 76 0 77 2 78 64 0 0 79
                                                   2 40 0 7 0 80 2 40 0 0 0 81
                                                   2 82 40 40 7 83 1 40 0 0 84
                                                   2 85 40 40 7 86 1 0 7 8 34 1
                                                   0 51 7 71 0 0 51 87)))))
           '|lookupComplete|)) 
