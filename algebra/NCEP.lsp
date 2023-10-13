
(/VERSIONCHECK 2) 

(DEFUN |NCEP;characteristicPolynomial;MP;1| (|m| $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (QREFELT $ 8)) |NCEP;characteristicPolynomial;MP;1|)
      (EXIT (SPADCALL (SPADCALL |m| (QREFELT $ 12)) |x| (QREFELT $ 14))))))) 

(DEFUN |NCEP;characteristicPolynomial;MSP;2| (A |x| $)
  (SPADCALL (SPADCALL A (QREFELT $ 12)) |x| (QREFELT $ 14))) 

(DEFUN |NCEP;complexEigenvalues;MParL;3| (|m| |eps| $)
  (SPADCALL (SPADCALL |m| (QREFELT $ 12)) |eps| (QREFELT $ 18))) 

(DEFUN |NCEP;complexEigenvectors;MParL;4| (|m| |eps| $)
  (SPADCALL |m| |eps| (ELT $ 22) (QREFELT $ 26))) 

(DEFUN |NumericComplexEigenPackage| (#1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|NumericComplexEigenPackage|)
                                           '|domainEqualList|)
                . #3=(|NumericComplexEigenPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|NumericComplexEigenPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|NumericComplexEigenPackage|))))))))))) 

(DEFUN |NumericComplexEigenPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NumericComplexEigenPackage|))
      (LETT |dv$| (LIST '|NumericComplexEigenPackage| DV$1) . #1#)
      (LETT $ (GETREFV 28) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NumericComplexEigenPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NumericComplexEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (0 . |new|)
              (|SparseUnivariatePolynomial|
               (|Complex| (|Fraction| (|Integer|))))
              (|Matrix| (|Complex| (|Fraction| (|Integer|))))
              (|InnerNumericEigenPackage| (|Complex| (|Fraction| (|Integer|)))
                                          (|Complex| 6) 6)
              (4 . |charpol|)
              (|Polynomial| (|Complex| (|Fraction| (|Integer|))))
              (9 . |multivariate|) |NCEP;characteristicPolynomial;MP;1|
              |NCEP;characteristicPolynomial;MSP;2| (|List| (|Complex| 6))
              (15 . |solve1|) |NCEP;complexEigenvalues;MParL;3| (|Factored| 9)
              (|ComplexFactorization| (|Fraction| (|Integer|)) 9)
              (21 . |factor|)
              (|Record| (|:| |outval| (|Complex| 6))
                        (|:| |outmult| (|Integer|))
                        (|:| |outvect| (|List| (|Matrix| (|Complex| 6)))))
              (|List| 23) (|Mapping| 20 9) (26 . |innerEigenvectors|)
              |NCEP;complexEigenvectors;MParL;4|)
           '#(|complexEigenvectors| 33 |complexEigenvalues| 39
              |characteristicPolynomial| 45)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(0 7 0 8 1 11 9 10 12 2 13 0
                                                   9 7 14 2 11 17 9 6 18 1 21
                                                   20 9 22 3 11 24 10 6 25 26 2
                                                   0 24 10 6 27 2 0 17 10 6 19
                                                   2 0 13 10 7 16 1 0 13 10
                                                   15)))))
           '|lookupComplete|)) 
