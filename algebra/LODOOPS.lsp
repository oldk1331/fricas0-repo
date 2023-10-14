
(SDEFUN |LODOOPS;vec2LODO| ((|v| |Vector| A) ($ L))
        (SPROG
         ((#1=#:G106 NIL) (#2=#:G105 (L)) (#3=#:G107 (L)) (#4=#:G108 NIL)
          (#5=#:G110 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|LODOOPS;vec2LODO|))
           (SEQ (LETT |i| 1 . #6#) (LETT #5# (QVSIZE |v|) . #6#) G190
                (COND ((|greater_SI| |i| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |v| |i| (QREFELT $ 14))
                                   (PROG1 (LETT #4# (- |i| 1) . #6#)
                                     (|check_subtype2| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #4#))
                                   (QREFELT $ 18))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19)) . #6#))
                    ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 20))))))) 

(SDEFUN |LODOOPS;symmetricPower;LNniML;2|
        ((|l| L) (|m| |NonNegativeInteger|) (|diff| |Mapping| A A) ($ L))
        (SPROG
         ((#1=#:G111 NIL)
          (|a|
           (|DifferentialSparseMultivariatePolynomial| A (|Symbol|)
                                                       (|OrderlyDifferentialVariable|
                                                        (|Symbol|))))
          (|un| (|OrderlyDifferentialVariable| (|Symbol|)))
          (|n| (|NonNegativeInteger|))
          (|u| (|OrderlyDifferentialVariable| (|Symbol|))))
         (SEQ
          (LETT |u| (SPADCALL (QREFELT $ 10) (QREFELT $ 22))
                . #2=(|LODOOPS;symmetricPower;LNniML;2|))
          (LETT |n| (SPADCALL |l| (QREFELT $ 23)) . #2#)
          (LETT |un| (SPADCALL |u| |n| (QREFELT $ 24)) . #2#)
          (LETT |a|
                (|LODOOPS;applyLODO|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |l| (QREFELT $ 25)) (QREFELT $ 26))
                   (QREFELT $ 27))
                  (SPADCALL |l| (QREFELT $ 28)) (QREFELT $ 29))
                 |u| $)
                . #2#)
          (EXIT
           (|LODOOPS;killer|
            (SPADCALL (SPADCALL |u| (QREFELT $ 31)) |m| (QREFELT $ 32))
            (PROG1
                (LETT #1# (SPADCALL (- (+ |n| |m|) 1) (- |n| 1) (QREFELT $ 33))
                      . #2#)
              (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|) '(|Integer|)
                                #1#))
            (LIST |un|) (LIST |a|) |diff| $))))) 

(SDEFUN |LODOOPS;killer|
        ((|u|
          . #1=(|DifferentialSparseMultivariatePolynomial| A (|Symbol|)
                                                           (|OrderlyDifferentialVariable|
                                                            (|Symbol|))))
         (|m| |NonNegativeInteger|)
         (|lvar| |List| (|OrderlyDifferentialVariable| (|Symbol|)))
         (|lval| |List|
          (|DifferentialSparseMultivariatePolynomial| A (|Symbol|)
                                                      (|OrderlyDifferentialVariable|
                                                       (|Symbol|))))
         (|diff| |Mapping| A A) ($ L))
        (SPROG
         ((|lu| (|List| #1#)) (#2=#:G126 NIL) (|l| (|List| (|Vector| A)))
          (|mat| (|Matrix| A)) (|q| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lu| (LIST |u|) . #3=(|LODOOPS;killer|))
                (SEQ (LETT |q| 0 . #3#) G190
                     (COND ((|greater_SI| |q| |m|) (GO G191)))
                     (SEQ
                      (LETT |mat|
                            (SPADCALL (SPADCALL (LIST |lu|) (QREFELT $ 38))
                                      (QREFELT $ 41))
                            . #3#)
                      (LETT |l| (SPADCALL |mat| (QREFELT $ 43)) . #3#)
                      (COND
                       ((NULL (NULL |l|))
                        (EXIT
                         (PROGN
                          (LETT #2# (|LODOOPS;vec2LODO| (|SPADfirst| |l|) $)
                                . #3#)
                          (GO #4=#:G125)))))
                      (LETT |u|
                            (SPADCALL (SPADCALL |u| |diff| (QREFELT $ 44))
                                      |lvar| |lval| (QREFELT $ 47))
                            . #3#)
                      (EXIT
                       (LETT |lu| (SPADCALL |lu| (LIST |u|) (QREFELT $ 49))
                             . #3#)))
                     (LETT |q| (|inc_SI| |q|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "killer: no linear dependence found"))))
          #4# (EXIT #2#)))) 

(SDEFUN |LODOOPS;symmetricProduct;2LML;4|
        ((|l1| L) (|l2| L) (|diff| |Mapping| A A) ($ L))
        (SPROG
         ((|b|
           #1=(|DifferentialSparseMultivariatePolynomial| A (|Symbol|)
                                                          (|OrderlyDifferentialVariable|
                                                           (|Symbol|))))
          (|a| #1#) (|vn| #2=(|OrderlyDifferentialVariable| (|Symbol|)))
          (|un| #2#) (|n2| #3=(|NonNegativeInteger|)) (|n1| #3#)
          (|v| (|OrderlyDifferentialVariable| (|Symbol|)))
          (|u| (|OrderlyDifferentialVariable| (|Symbol|))))
         (SEQ
          (LETT |u| (SPADCALL (QREFELT $ 10) (QREFELT $ 22))
                . #4=(|LODOOPS;symmetricProduct;2LML;4|))
          (LETT |v| (SPADCALL (QREFELT $ 11) (QREFELT $ 22)) . #4#)
          (LETT |n1| (SPADCALL |l1| (QREFELT $ 23)) . #4#)
          (LETT |n2| (SPADCALL |l2| (QREFELT $ 23)) . #4#)
          (LETT |un| (SPADCALL |u| |n1| (QREFELT $ 24)) . #4#)
          (LETT |vn| (SPADCALL |v| |n2| (QREFELT $ 24)) . #4#)
          (LETT |a|
                (|LODOOPS;applyLODO|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |l1| (QREFELT $ 25)) (QREFELT $ 26))
                   (QREFELT $ 27))
                  (SPADCALL |l1| (QREFELT $ 28)) (QREFELT $ 29))
                 |u| $)
                . #4#)
          (LETT |b|
                (|LODOOPS;applyLODO|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |l2| (QREFELT $ 25)) (QREFELT $ 26))
                   (QREFELT $ 27))
                  (SPADCALL |l2| (QREFELT $ 28)) (QREFELT $ 29))
                 |v| $)
                . #4#)
          (EXIT
           (|LODOOPS;killer|
            (SPADCALL (SPADCALL |u| (QREFELT $ 31))
                      (SPADCALL |v| (QREFELT $ 31)) (QREFELT $ 50))
            (* |n1| |n2|) (LIST |un| |vn|) (LIST |a| |b|) |diff| $))))) 

(SDEFUN |LODOOPS;directSum;2LML;5|
        ((|l1| L) (|l2| L) (|diff| |Mapping| A A) ($ L))
        (SPROG
         ((|b|
           #1=(|DifferentialSparseMultivariatePolynomial| A (|Symbol|)
                                                          (|OrderlyDifferentialVariable|
                                                           (|Symbol|))))
          (|a| #1#) (|vn| #2=(|OrderlyDifferentialVariable| (|Symbol|)))
          (|un| #2#) (|n2| #3=(|NonNegativeInteger|)) (|n1| #3#)
          (|v| (|OrderlyDifferentialVariable| (|Symbol|)))
          (|u| (|OrderlyDifferentialVariable| (|Symbol|))))
         (SEQ
          (LETT |u| (SPADCALL (QREFELT $ 10) (QREFELT $ 22))
                . #4=(|LODOOPS;directSum;2LML;5|))
          (LETT |v| (SPADCALL (QREFELT $ 11) (QREFELT $ 22)) . #4#)
          (LETT |n1| (SPADCALL |l1| (QREFELT $ 23)) . #4#)
          (LETT |n2| (SPADCALL |l2| (QREFELT $ 23)) . #4#)
          (LETT |un| (SPADCALL |u| |n1| (QREFELT $ 24)) . #4#)
          (LETT |vn| (SPADCALL |v| |n2| (QREFELT $ 24)) . #4#)
          (LETT |a|
                (|LODOOPS;applyLODO|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |l1| (QREFELT $ 25)) (QREFELT $ 26))
                   (QREFELT $ 27))
                  (SPADCALL |l1| (QREFELT $ 28)) (QREFELT $ 29))
                 |u| $)
                . #4#)
          (LETT |b|
                (|LODOOPS;applyLODO|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |l2| (QREFELT $ 25)) (QREFELT $ 26))
                   (QREFELT $ 27))
                  (SPADCALL |l2| (QREFELT $ 28)) (QREFELT $ 29))
                 |v| $)
                . #4#)
          (EXIT
           (|LODOOPS;killer|
            (SPADCALL (SPADCALL |u| (QREFELT $ 31))
                      (SPADCALL |v| (QREFELT $ 31)) (QREFELT $ 52))
            (+ |n1| |n2|) (LIST |un| |vn|) (LIST |a| |b|) |diff| $))))) 

(SDEFUN |LODOOPS;applyLODO|
        ((|l| L) (|v| |OrderlyDifferentialVariable| (|Symbol|))
         ($ |DifferentialSparseMultivariatePolynomial| A (|Symbol|)
          (|OrderlyDifferentialVariable| (|Symbol|))))
        (SPROG
         ((|p|
           (|DifferentialSparseMultivariatePolynomial| A (|Symbol|)
                                                       (|OrderlyDifferentialVariable|
                                                        (|Symbol|)))))
         (SEQ (LETT |p| (|spadConstant| $ 54) . #1=(|LODOOPS;applyLODO|))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |l| (|spadConstant| $ 20) (QREFELT $ 57)))
                     (GO G191)))
                   (SEQ
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |l| (QREFELT $ 25))
                                               (QREFELT $ 58))
                                     (SPADCALL |v|
                                               (SPADCALL |l| (QREFELT $ 23))
                                               (QREFELT $ 24))
                                     1 (QREFELT $ 59))
                                    (QREFELT $ 52))
                          . #1#)
                    (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 28)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorsOps;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorsOps| (&REST #1=#:G137)
  (SPROG NIL
         (PROG (#2=#:G138)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperatorsOps|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperatorsOps|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperatorsOps;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperatorsOps|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperatorsOps;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|LinearOrdinaryDifferentialOperatorsOps|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperatorsOps| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperatorsOps|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 9)))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorsOps| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|var1| '|var2| (|Integer|) (|Vector| 6) (4 . |elt|)
              (10 . |One|) (14 . |One|) (|NonNegativeInteger|)
              (18 . |monomial|) (24 . +) (30 . |Zero|)
              (|OrderlyDifferentialVariable| 8) (34 . |coerce|) (39 . |degree|)
              (44 . |differentiate|) (50 . |leadingCoefficient|) (55 . -)
              (60 . |inv|) (65 . |reductum|) (70 . *)
              (|DifferentialSparseMultivariatePolynomial| 6 8 21)
              (76 . |coerce|) (81 . ^) (87 . |binomial|) (|Mapping| 6 6)
              |LODOOPS;symmetricPower;LNniML;2| (|List| 48) (|Matrix| 30)
              (93 . |matrix|) (|Matrix| 6) (|Matrix| $) (98 . |reducedSystem|)
              (|List| 13) (103 . |nullSpace|) (108 . |differentiate|)
              (|List| 21) (|List| $) (114 . |eval|) (|List| 30)
              (121 . |concat!|) (127 . *) |LODOOPS;symmetricProduct;2LML;4|
              (133 . +) |LODOOPS;directSum;2LML;5| (139 . |Zero|)
              (143 . |Zero|) (|Boolean|) (147 . ~=) (153 . |coerce|)
              (158 . |monomial|))
           '#(|symmetricProduct| 165 |symmetricPower| 172 |directSum| 179) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(0 8 0 9 2 13 6 0 12 14 0 6 0
                                                   15 0 7 0 16 2 7 0 6 17 18 2
                                                   7 0 0 0 19 0 7 0 20 1 21 0 8
                                                   22 1 7 17 0 23 2 21 0 0 17
                                                   24 1 7 6 0 25 1 6 0 0 26 1 6
                                                   0 0 27 1 7 0 0 28 2 7 0 6 0
                                                   29 1 30 0 21 31 2 30 0 0 17
                                                   32 2 12 0 0 0 33 1 37 0 36
                                                   38 1 30 39 40 41 1 39 42 0
                                                   43 2 30 0 0 34 44 3 30 0 0
                                                   45 46 47 2 48 0 0 0 49 2 30
                                                   0 0 0 50 2 30 0 0 0 52 0 30
                                                   0 54 0 6 0 55 2 7 56 0 0 57
                                                   1 30 0 6 58 3 30 0 0 21 17
                                                   59 3 0 7 7 7 34 51 3 0 7 7
                                                   17 34 35 3 0 7 7 7 34
                                                   53)))))
           '|lookupComplete|)) 
