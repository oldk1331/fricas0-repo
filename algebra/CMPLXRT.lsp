
(/VERSIONCHECK 2) 

(DEFUN |CMPLXRT;complexZeros;UPParL;1| (|p| |eps| $)
  (PROG (|ris| #1=#:G137 |z| #2=#:G136 |lz| |p2| |p1| |q| |pp| #3=#:G135 |pf|
         |lpf| |vv| |x2| |x1|)
    (RETURN
     (SEQ
      (LETT |x1| (SPADCALL (QREFELT $ 9))
            . #4=(|CMPLXRT;complexZeros;UPParL;1|))
      (LETT |x2| (SPADCALL (QREFELT $ 9)) . #4#)
      (LETT |vv| (SPADCALL (QREFELT $ 9)) . #4#)
      (LETT |lpf| (SPADCALL (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 15))
            . #4#)
      (LETT |ris| NIL . #4#)
      (SEQ (LETT |pf| NIL . #4#) (LETT #3# |lpf| . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |pf| (CAR #3#) . #4#) NIL))
             (GO G191)))
           (SEQ (LETT |pp| (QCAR |pf|) . #4#)
                (LETT |q| (SPADCALL |pp| |vv| (QREFELT $ 18)) . #4#)
                (LETT |q|
                      (SPADCALL |q| |vv|
                                (SPADCALL (SPADCALL |x1| (QREFELT $ 19))
                                          (SPADCALL
                                           (SPADCALL 0 1 (QREFELT $ 25))
                                           (SPADCALL |x2| (QREFELT $ 19))
                                           (QREFELT $ 26))
                                          (QREFELT $ 27))
                                (QREFELT $ 28))
                      . #4#)
                (LETT |p1| (SPADCALL (ELT $ 29) |q| (QREFELT $ 33)) . #4#)
                (LETT |p2| (SPADCALL (ELT $ 34) |q| (QREFELT $ 33)) . #4#)
                (LETT |lz|
                      (SPADCALL (LIST |p1| |p2|) NIL (LIST |x1| |x2|) |eps|
                                (QREFELT $ 39))
                      . #4#)
                (EXIT
                 (LETT |ris|
                       (APPEND
                        (PROGN
                         (LETT #2# NIL . #4#)
                         (SEQ (LETT |z| NIL . #4#) (LETT #1# |lz| . #4#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |z| (CAR #1#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL (|SPADfirst| |z|)
                                                 (SPADCALL |z| (QREFELT $ 41))
                                                 (QREFELT $ 43))
                                       #2#)
                                      . #4#)))
                              (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        |ris|)
                       . #4#)))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |ris|))))) 

(DEFUN |ComplexRootPackage| (&REST #1=#:G138)
  (PROG ()
    (RETURN
     (PROG (#2=#:G139)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ComplexRootPackage|)
                                           '|domainEqualList|)
                . #3=(|ComplexRootPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ComplexRootPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ComplexRootPackage|))))))))))) 

(DEFUN |ComplexRootPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexRootPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ComplexRootPackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 46) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ComplexRootPackage| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ComplexRootPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (|Factored| 6) (|ComplexFactorization| 23 6)
              (4 . |factor|) (|Record| (|:| |factor| 6) (|:| |exponent| 23))
              (|List| 13) (9 . |factors|) (|SparseUnivariatePolynomial| 24)
              (|Polynomial| 24) (14 . |multivariate|) (20 . |coerce|)
              (25 . |Zero|) (29 . |Zero|) (33 . |One|) (|Integer|)
              (|Complex| 23) (37 . |complex|) (43 . *) (49 . +) (55 . |eval|)
              (62 . |real|) (|Polynomial| 23) (|Mapping| 23 24)
              (|PolynomialFunctions2| 24 23) (67 . |map|) (73 . |imag|)
              (|List| 40) (|List| 30) (|List| 8)
              (|InnerNumericFloatSolvePackage| 23 7 7) (78 . |innerSolve|)
              (|List| 7) (86 . |second|) (|Complex| 7) (91 . |complex|)
              (|List| 42) |CMPLXRT;complexZeros;UPParL;1|)
           '#(|complexZeros| 97) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(0 8 0 9 1 11 10 6 12 1 10 14
                                                   0 15 2 17 0 16 8 18 1 17 0 8
                                                   19 0 6 0 20 0 7 0 21 0 6 0
                                                   22 2 24 0 23 23 25 2 17 0 24
                                                   0 26 2 17 0 0 0 27 3 17 0 0
                                                   8 0 28 1 24 23 0 29 2 32 30
                                                   31 17 33 1 24 23 0 34 4 38
                                                   35 36 36 37 7 39 1 40 7 0 41
                                                   2 42 0 7 7 43 2 0 44 6 7
                                                   45)))))
           '|lookupComplete|)) 
