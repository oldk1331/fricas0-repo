
(SDEFUN |FSRROOT;get_rational_roots;FKL;1|
        ((|eq1f| F) (|k1| |Kernel| F) ($ |List| (|Fraction| (|Integer|))))
        (SPROG
         ((|res| (|List| (|Fraction| (|Integer|))))
          (|val1r| (|Fraction| (|Integer|)))
          (|fac| #1=(|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G114 NIL)
          (|facr| NIL)
          (|facl|
           (|List| (|Record| (|:| |factor| #1#) (|:| |exponent| (|Integer|)))))
          (|ff| (|Factored| (|SparseUnivariatePolynomial| (|Integer|))))
          (|eq2z| (|SparseUnivariatePolynomial| (|Integer|)))
          (|pl2| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (#3=#:G113 NIL) (|i| NIL) (#4=#:G112 NIL)
          (|vvr| (|Matrix| (|Integer|))) (|vm| (|Matrix| F))
          (|vv| (|Vector| F)) (|nn| (|NonNegativeInteger|))
          (|eq2p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |eq2p|
                (SPADCALL (SPADCALL |eq1f| |k1| (QREFELT $ 10)) (QREFELT $ 13))
                . #5=(|FSRROOT;get_rational_roots;FKL;1|))
          (LETT |nn| (+ (SPADCALL |eq2p| (QREFELT $ 15)) 1) . #5#)
          (LETT |vv| (SPADCALL |eq2p| |nn| (QREFELT $ 17)) . #5#)
          (LETT |vm|
                (SPADCALL (LIST (SPADCALL |vv| (QREFELT $ 19))) (QREFELT $ 22))
                . #5#)
          (LETT |vvr| (SPADCALL |vm| (QREFELT $ 25)) . #5#)
          (LETT |pl2|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) (LETT #3# (ANROWS |vvr|) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |vvr| |i| (QREFELT $ 28))
                                         (QREFELT $ 30))
                               #4#)
                              . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |eq2z| (SPADCALL |pl2| (QREFELT $ 32)) . #5#)
          (LETT |ff| (SPADCALL |eq2z| (QREFELT $ 35)) . #5#)
          (LETT |facl| (SPADCALL |ff| (QREFELT $ 38)) . #5#)
          (LETT |res| NIL . #5#)
          (SEQ (LETT |facr| NIL . #5#) (LETT #2# |facl| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |facr| (CAR #2#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |fac| (QCAR |facr|) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |fac| (QREFELT $ 39)) 1
                                 (QREFELT $ 41))
                       "iterate")
                      ('T
                       (SEQ
                        (LETT |val1r|
                              (SPADCALL
                               (SPADCALL (SPADCALL |fac| 0 (QREFELT $ 44))
                                         (SPADCALL |fac| (QREFELT $ 45))
                                         (QREFELT $ 47))
                               (QREFELT $ 48))
                              . #5#)
                        (EXIT (LETT |res| (CONS |val1r| |res|) . #5#)))))))
               (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |FunctionSpaceRationalRoots;|)) 

(DEFUN |FunctionSpaceRationalRoots| (&REST #1=#:G115)
  (SPROG NIL
         (PROG (#2=#:G116)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceRationalRoots|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceRationalRoots|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceRationalRoots;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceRationalRoots|)))))))))) 

(DEFUN |FunctionSpaceRationalRoots;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceRationalRoots|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpaceRationalRoots| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceRationalRoots|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FunctionSpaceRationalRoots| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| (|SparseUnivariatePolynomial| $)) (|Kernel| $)
              (0 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|Fraction| 11) (6 . |numer|) (|NonNegativeInteger|)
              (11 . |degree|) (|Vector| 7) (16 . |vectorise|) (|List| 7)
              (22 . |parts|) (|List| 18) (|Matrix| 7) (27 . |matrix|)
              (|Matrix| 27) (|Matrix| $) (32 . |reducedSystem|) (|Vector| 27)
              (|Integer|) (37 . |row|) (|SparseUnivariatePolynomial| 27)
              (43 . |unvectorise|) (|List| $) (48 . |gcd|) (|Factored| 29)
              (|MultivariateFactorize| (|SingletonAsOrderedSet|) 14 27 29)
              (53 . |factor|) (|Record| (|:| |factor| 29) (|:| |exponent| 27))
              (|List| 36) (58 . |factors|) (63 . |degree|) (|Boolean|)
              (68 . ~=) (74 . |Zero|) (78 . |Zero|) (82 . |coefficient|)
              (88 . |leadingCoefficient|) (|Fraction| 27) (93 . /) (99 . -)
              (|List| 46) (|Kernel| 7) |FSRROOT;get_rational_roots;FKL;1|)
           '#(|get_rational_roots| 104) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(2 7 8 0 9 10 1 12 11 0 13 1
                                                   11 14 0 15 2 11 16 0 14 17 1
                                                   16 18 0 19 1 21 0 20 22 1 7
                                                   23 24 25 2 23 26 0 27 28 1
                                                   29 0 26 30 1 29 0 31 32 1 34
                                                   33 29 35 1 33 37 0 38 1 29
                                                   14 0 39 2 14 40 0 0 41 0 6 0
                                                   42 0 7 0 43 2 29 27 0 14 44
                                                   1 29 27 0 45 2 46 0 27 27 47
                                                   1 46 0 0 48 2 0 49 7 50
                                                   51)))))
           '|lookupComplete|)) 
