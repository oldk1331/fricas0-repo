
(DEFUN |NORMMA;PolR2SUP| (|q| $) (SPADCALL (ELT $ 10) |q| (QREFELT $ 14))) 

(DEFUN |NORMMA;norm;PolEPolR;2| (|q| $)
  (PROG (|p|)
    (RETURN
     (SEQ (LETT |p| (|spadConstant| $ 17) . #1=(|NORMMA;norm;PolEPolR;2|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |q| (|spadConstant| $ 20) (QREFELT $ 22)))
                 (GO G191)))
               (SEQ
                (LETT |p|
                      (SPADCALL |p|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 23)
                                           (SPADCALL |q| (QREFELT $ 26))
                                           (QREFELT $ 27))
                                 (|NORMMA;PolR2SUP|
                                  (SPADCALL (SPADCALL |q| (QREFELT $ 28))
                                            (QREFELT $ 29))
                                  $)
                                 (QREFELT $ 30))
                                (QREFELT $ 31))
                      . #1#)
                (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 32)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |p| (QREFELT $ 16) (QREFELT $ 33))
                     (QREFELT $ 34))))))) 

(DECLAIM (NOTINLINE |NormInMonogenicAlgebra;|)) 

(DEFUN |NormInMonogenicAlgebra| (&REST #1=#:G108)
  (PROG ()
    (RETURN
     (PROG (#2=#:G109)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|NormInMonogenicAlgebra|)
                                           '|domainEqualList|)
                . #3=(|NormInMonogenicAlgebra|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |NormInMonogenicAlgebra;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|NormInMonogenicAlgebra|))))))))))) 

(DEFUN |NormInMonogenicAlgebra;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NormInMonogenicAlgebra|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|NormInMonogenicAlgebra| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 36) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NormInMonogenicAlgebra|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 16 (|NORMMA;PolR2SUP| (SPADCALL (QREFELT $ 15)) $))
      $)))) 

(MAKEPROP '|NormInMonogenicAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 11) (5 . |map|)
              (11 . |definingPolynomial|) '|defpol| (15 . |Zero|) (19 . |Zero|)
              (23 . |Zero|) (27 . |Zero|) (|Boolean|) (31 . ~=) (37 . |One|)
              (41 . |One|) (|NonNegativeInteger|) (45 . |degree|)
              (50 . |monomial|) (56 . |leadingCoefficient|) (61 . |lift|)
              (66 . *) (72 . +) (78 . |reductum|) (83 . |resultant|)
              (89 . |primitivePart|) |NORMMA;norm;PolEPolR;2|)
           '#(|norm| 94) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(1 7 0 6 10 2 13 11 12 7 14 0
                                                   8 7 15 0 11 0 17 0 6 0 18 0
                                                   7 0 19 0 9 0 20 2 9 21 0 0
                                                   22 0 6 0 23 0 7 0 24 1 9 25
                                                   0 26 2 7 0 6 25 27 1 9 8 0
                                                   28 1 8 7 0 29 2 11 0 7 0 30
                                                   2 11 0 0 0 31 1 9 0 0 32 2
                                                   11 7 0 0 33 1 7 0 0 34 1 0 7
                                                   9 35)))))
           '|lookupComplete|)) 
