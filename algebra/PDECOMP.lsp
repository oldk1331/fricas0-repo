
(SDEFUN |PDECOMP;leftFactor;2UPU;1| ((|f| UP) (|h| UP) ($ |Union| UP "failed"))
        (SPROG
         ((|g| (UP)) (#1=#:G117 NIL) (|r| (UP))
          (|fr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (|spadConstant| $ 8) . #2=(|PDECOMP;leftFactor;2UPU;1|))
            (SEQ (LETT |i| 0 . #2#) G190
                 (COND
                  ((NULL (SPADCALL |f| (|spadConstant| $ 8) (QREFELT $ 11)))
                   (GO G191)))
                 (SEQ (LETT |fr| (SPADCALL |f| |h| (QREFELT $ 13)) . #2#)
                      (LETT |f| (QCAR |fr|) . #2#) (LETT |r| (QCDR |fr|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |r| (QREFELT $ 15)) 0
                                   (QREFELT $ 16))
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #2#)
                          (GO #3=#:G116)))
                        ('T
                         (LETT |g|
                               (SPADCALL |g|
                                         (SPADCALL |r|
                                                   (SPADCALL
                                                    (|spadConstant| $ 18) |i|
                                                    (QREFELT $ 19))
                                                   (QREFELT $ 20))
                                         (QREFELT $ 21))
                               . #2#)))))
                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |g|))))
          #3# (EXIT #1#)))) 

(SDEFUN |PDECOMP;decompose;UP2NniU;2|
        ((|f| UP) (|dg| |NonNegativeInteger|) (|dh| |NonNegativeInteger|)
         ($ |Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
        (SPROG
         ((|g| (|Union| UP "failed")) (|h| (UP)) (|df| (|NonNegativeInteger|)))
         (SEQ
          (LETT |df| (SPADCALL |f| (QREFELT $ 15))
                . #1=(|PDECOMP;decompose;UP2NniU;2|))
          (EXIT
           (COND
            ((SPADCALL (* |dg| |dh|) |df| (QREFELT $ 24)) (CONS 1 "failed"))
            (#2='T
             (SEQ (LETT |h| (SPADCALL |f| |dh| (QREFELT $ 25)) . #1#)
                  (LETT |g| (SPADCALL |f| |h| (QREFELT $ 23)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                         (#2# (CONS 0 (CONS (QCDR |g|) |h|)))))))))))) 

(SDEFUN |PDECOMP;decompose;UPL;3| ((|f| UP) ($ |List| UP))
        (SPROG
         ((#1=#:G139 NIL) (|g| (|Union| UP "failed")) (|h| (UP))
          (#2=#:G140 NIL) (|dh| NIL) (|df| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |df| (SPADCALL |f| (QREFELT $ 15))
                  . #3=(|PDECOMP;decompose;UPL;3|))
            (SEQ (LETT |dh| 2 . #3#) (LETT #2# (- |df| 1) . #3#) G190
                 (COND ((|greater_SI| |dh| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (REM |df| |dh|) 0)
                     (SEQ (LETT |h| (SPADCALL |f| |dh| (QREFELT $ 25)) . #3#)
                          (LETT |g| (SPADCALL |f| |h| (QREFELT $ 23)) . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |g| 0)
                             (PROGN
                              (LETT #1#
                                    (APPEND
                                     (SPADCALL (QCDR |g|) (QREFELT $ 30))
                                     (SPADCALL |h| (QREFELT $ 30)))
                                    . #3#)
                              (GO #4=#:G138))))))))))
                 (LETT |dh| (|inc_SI| |dh|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (LIST |f|))))
          #4# (EXIT #1#)))) 

(SDEFUN |PDECOMP;rightFactorCandidate;UPNniUP;4|
        ((|f| UP) (|dh| |NonNegativeInteger|) ($ UP))
        (SPROG
         ((|h| (UP)) (#1=#:G155 NIL) (|c| (F)) (#2=#:G154 NIL) (#3=#:G153 NIL)
          (|hdg| (UP)) (|k| NIL) (|dg| (|NonNegativeInteger|))
          (|df| (|NonNegativeInteger|)))
         (SEQ
          (LETT |f| (SPADCALL |f| (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 32))
                . #4=(|PDECOMP;rightFactorCandidate;UPNniUP;4|))
          (LETT |df| (SPADCALL |f| (QREFELT $ 15)) . #4#)
          (LETT |dg| (QUOTIENT2 |df| |dh|) . #4#)
          (LETT |h| (SPADCALL (|spadConstant| $ 18) |dh| (QREFELT $ 19)) . #4#)
          (SEQ (LETT |k| 1 . #4#) G190
               (COND ((|greater_SI| |k| |dh|) (GO G191)))
               (SEQ (LETT |hdg| (SPADCALL |h| |dg| (QREFELT $ 33)) . #4#)
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |f|
                                      (PROG1 (LETT #3# (- |df| |k|) . #4#)
                                        (|check_subtype| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         #3#))
                                      (QREFELT $ 34))
                            (SPADCALL |hdg|
                                      (PROG1 (LETT #2# (- |df| |k|) . #4#)
                                        (|check_subtype| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                      (QREFELT $ 34))
                            (QREFELT $ 35))
                           (SPADCALL |dg| (QREFELT $ 37)) (QREFELT $ 38))
                          . #4#)
                    (EXIT
                     (LETT |h|
                           (SPADCALL |h|
                                     (SPADCALL |c|
                                               (PROG1
                                                   (LETT #1# (- |dh| |k|)
                                                         . #4#)
                                                 (|check_subtype| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                               (QREFELT $ 19))
                                     (QREFELT $ 21))
                           . #4#)))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |h|
                     (SPADCALL (SPADCALL |h| 0 (QREFELT $ 34)) 0
                               (QREFELT $ 19))
                     (QREFELT $ 39)))))) 

(DECLAIM (NOTINLINE |PolynomialDecomposition;|)) 

(DEFUN |PolynomialDecomposition| (&REST #1=#:G160)
  (SPROG NIL
         (PROG (#2=#:G161)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialDecomposition|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialDecomposition|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialDecomposition;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialDecomposition|)))))))))) 

(DEFUN |PolynomialDecomposition;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialDecomposition|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PolynomialDecomposition| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 40) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PolynomialDecomposition|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PolynomialDecomposition| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|Boolean|) (8 . ~=)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (14 . |divide|)
              (|NonNegativeInteger|) (20 . |degree|) (25 . >) (31 . |One|)
              (35 . |One|) (39 . |monomial|) (45 . *) (51 . +)
              (|Union| 6 '"failed") |PDECOMP;leftFactor;2UPU;1| (57 . ~=)
              |PDECOMP;rightFactorCandidate;UPNniUP;4|
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 26 '"failed")
              |PDECOMP;decompose;UP2NniU;2| (|List| 6)
              |PDECOMP;decompose;UPL;3| (63 . |leadingCoefficient|) (68 . /)
              (74 . ^) (80 . |coefficient|) (86 . -) (|Integer|)
              (92 . |coerce|) (97 . /) (103 . -))
           '#(|rightFactorCandidate| 109 |leftFactor| 115 |decompose| 121) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(0 6 0 8 0 7 0 9 2 6 10 0 0
                                                   11 2 6 12 0 0 13 1 6 14 0 15
                                                   2 14 10 0 0 16 0 6 0 17 0 7
                                                   0 18 2 6 0 7 14 19 2 6 0 0 0
                                                   20 2 6 0 0 0 21 2 14 10 0 0
                                                   24 1 6 7 0 31 2 6 0 0 7 32 2
                                                   6 0 0 14 33 2 6 7 0 14 34 2
                                                   7 0 0 0 35 1 7 0 36 37 2 7 0
                                                   0 0 38 2 6 0 0 0 39 2 0 6 6
                                                   14 25 2 0 22 6 6 23 3 0 27 6
                                                   14 14 28 1 0 29 6 30)))))
           '|lookupComplete|)) 
