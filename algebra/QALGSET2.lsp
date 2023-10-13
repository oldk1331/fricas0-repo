
(/VERSIONCHECK 2) 

(DEFUN |QALGSET2;f| (|v| $)
  (PROG (#1=#:G129)
    (RETURN
     (SPADCALL
      (PROG2
          (LETT #1# (SPADCALL (SPADCALL |v| (QREFELT $ 17)) (QREFELT $ 14))
                |QALGSET2;f|)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0) (|OrderedVariableList| (QREFELT $ 11))
                       #1#))
      (QREFELT $ 19))))) 

(DEFUN |QALGSET2;g| (|v| $)
  (PROG (#1=#:G133)
    (RETURN
     (COND ((SPADCALL |v| (QREFELT $ 15) (QREFELT $ 21)) (|spadConstant| $ 23))
           ('T
            (SPADCALL
             (PROG2
                 (LETT #1#
                       (SPADCALL (SPADCALL |v| (QREFELT $ 24)) (QREFELT $ 25))
                       |QALGSET2;g|)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0)
                              (|OrderedVariableList| (QREFELT $ 6)) #1#))
             (QREFELT $ 26))))))) 

(DEFUN |QALGSET2;npoly| (|p| $)
  (SPADCALL (CONS #'|QALGSET2;npoly!0| $) (ELT $ 28) |p| (QREFELT $ 32))) 

(DEFUN |QALGSET2;npoly!0| (|z1| $) (|QALGSET2;f| |z1| $)) 

(DEFUN |QALGSET2;oldpoly| (|q| $)
  (PROG (|x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |q| (QREFELT $ 34)) |QALGSET2;oldpoly|)
          (EXIT
           (COND
            ((QEQCAR |x| 1)
             (CONS 0 (SPADCALL (SPADCALL |q| (QREFELT $ 35)) (QREFELT $ 36))))
            ((SPADCALL (QCDR |x|) (QREFELT $ 15) (QREFELT $ 21))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (CONS #'|QALGSET2;oldpoly!0| $) (ELT $ 36) |q|
                             (QREFELT $ 40)))))))))) 

(DEFUN |QALGSET2;oldpoly!0| (|z1| $) (|QALGSET2;g| |z1| $)) 

(DEFUN |QALGSET2;radicalSimplify;2Qas;5| (|x| $)
  (PROG (|y| |ngb| |gb| |k| |id| |gen| #1=#:G157 |g| #2=#:G156 |tp| |t| |n0|
         |z0|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 43)) (CONS 0 'T) (QREFELT $ 44))
        |x|)
       (#3='T
        (SEQ
         (LETT |z0| (SPADCALL |x| (QREFELT $ 46))
               . #4=(|QALGSET2;radicalSimplify;2Qas;5|))
         (LETT |n0| (SPADCALL |x| (QREFELT $ 47)) . #4#)
         (LETT |t| (SPADCALL (QREFELT $ 15) (QREFELT $ 19)) . #4#)
         (LETT |tp|
               (SPADCALL
                (SPADCALL |t| (|QALGSET2;npoly| |n0| $) (QREFELT $ 48))
                (|spadConstant| $ 49) (QREFELT $ 50))
               . #4#)
         (LETT |gen|
               (CONS |tp|
                     (PROGN
                      (LETT #2# NIL . #4#)
                      (SEQ (LETT |g| NIL . #4#) (LETT #1# |z0| . #4#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |g| (CAR #1#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2# (CONS (|QALGSET2;npoly| |g| $) #2#)
                                   . #4#)))
                           (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))
               . #4#)
         (LETT |id| (SPADCALL |gen| (QREFELT $ 53)) . #4#)
         (LETT |ngb| (SPADCALL (SPADCALL |id| (QREFELT $ 55)) (QREFELT $ 56))
               . #4#)
         (EXIT
          (COND
           ((SPADCALL (|spadConstant| $ 49) |ngb| (QREFELT $ 57))
            (SPADCALL (QREFELT $ 58)))
           (#3#
            (SEQ (LETT |gb| NIL . #4#)
                 (SEQ G190
                      (COND
                       ((NULL (COND ((NULL |ngb|) 'NIL) ('T 'T))) (GO G191)))
                      (SEQ
                       (SEQ
                        (LETT |k| (|QALGSET2;oldpoly| (|SPADfirst| |ngb|) $)
                              . #4#)
                        (EXIT
                         (COND
                          ((QEQCAR |k| 0)
                           (LETT |gb| (CONS (QCDR |k|) |gb|) . #4#)))))
                       (EXIT (LETT |ngb| (CDR |ngb|) . #4#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |y|
                       (SPADCALL |gb|
                                 (SPADCALL (SPADCALL |n0| |gb| (QREFELT $ 60))
                                           (QREFELT $ 61))
                                 (QREFELT $ 62))
                       . #4#)
                 (EXIT (SPADCALL |y| (CONS 0 'NIL) (QREFELT $ 63)))))))))))))) 

(DEFUN |QuasiAlgebraicSet2| (&REST #1=#:G158)
  (PROG ()
    (RETURN
     (PROG (#2=#:G159)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|QuasiAlgebraicSet2|)
                                           '|domainEqualList|)
                . #3=(|QuasiAlgebraicSet2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |QuasiAlgebraicSet2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|QuasiAlgebraicSet2|))))))))))) 

(DEFUN |QuasiAlgebraicSet2;| (|#1| |#2|)
  (PROG (#1=#:G129 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|QuasiAlgebraicSet2|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|QuasiAlgebraicSet2| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 65) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #2#))
      (|haddProp| |$ConstructorCache| '|QuasiAlgebraicSet2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (QSETREFV $ 11 (CONS (QREFELT $ 10) |#1|))
      (QSETREFV $ 15
                (PROG2
                    (LETT #1# (SPADCALL (QREFELT $ 10) (QREFELT $ 14)) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|OrderedVariableList| (QREFELT $ 11)) #1#)))
      $)))) 

(MAKEPROP '|QuasiAlgebraicSet2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|ts| '|newvl| (|Union| $ '"failed")
              (|OrderedVariableList| 11) (4 . |variable|) '|tv|
              (|OrderedVariableList| 6) (9 . |convert|)
              (|DistributedMultivariatePolynomial| 11 27) (14 . |coerce|)
              (|Boolean|) (19 . =) (|DistributedMultivariatePolynomial| 6 27)
              (25 . |Zero|) (29 . |convert|) (34 . |variable|) (39 . |coerce|)
              (|Fraction| (|Integer|)) (44 . |coerce|) (|Mapping| 18 16)
              (|Mapping| 18 27)
              (|PolynomialCategoryLifting|
               (|DirectProduct| 7 (|NonNegativeInteger|)) 16 27 22 18)
              (49 . |map|) (|Union| 13 '"failed") (56 . |mainVariable|)
              (61 . |leadingCoefficient|) (66 . |coerce|) (|Mapping| 22 13)
              (|Mapping| 22 27)
              (|PolynomialCategoryLifting|
               (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 11)))
                                (|NonNegativeInteger|))
               13 27 18 22)
              (71 . |map|) (|Union| 20 '"failed")
              (|QuasiAlgebraicSet| 27 16
                                   (|DirectProduct| 7 (|NonNegativeInteger|))
                                   22)
              (78 . |status|) (83 . =) (|List| 22) (89 . |definingEquations|)
              (94 . |definingInequation|) (99 . *) (105 . |One|) (109 . -)
              (|List| 18)
              (|PolynomialIdeal| 27
                                 (|DirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT $ 11)))
                                  (|NonNegativeInteger|))
                                 13 18)
              (115 . |ideal|)
              (|IdealDecompositionPackage| 11
                                           (NRTEVAL (LENGTH (QREFELT $ 11))))
              (120 . |radical|) (125 . |generators|) (130 . |member?|)
              (136 . |empty|)
              (|GroebnerPackage| 27 (|DirectProduct| 7 (|NonNegativeInteger|))
                                 16 22)
              (140 . |normalForm|) (146 . |primitivePart|)
              (151 . |quasiAlgebraicSet|) (157 . |setStatus|)
              |QALGSET2;radicalSimplify;2Qas;5|)
           '#(|radicalSimplify| 163) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 64
                                                 '(0 8 0 9 1 13 12 8 14 1 16 8
                                                   0 17 1 18 0 13 19 2 13 20 0
                                                   0 21 0 22 0 23 1 13 8 0 24 1
                                                   16 12 8 25 1 22 0 16 26 1 18
                                                   0 27 28 3 31 18 29 30 22 32
                                                   1 18 33 0 34 1 18 27 0 35 1
                                                   22 0 27 36 3 39 22 37 38 18
                                                   40 1 42 41 0 43 2 41 20 0 0
                                                   44 1 42 45 0 46 1 42 22 0 47
                                                   2 18 0 0 0 48 0 18 0 49 2 18
                                                   0 0 0 50 1 52 0 51 53 1 54
                                                   52 52 55 1 52 51 0 56 2 51
                                                   20 18 0 57 0 42 0 58 2 59 22
                                                   22 45 60 1 22 0 0 61 2 42 0
                                                   45 22 62 2 42 0 0 41 63 1 0
                                                   42 42 64)))))
           '|lookupComplete|)) 
