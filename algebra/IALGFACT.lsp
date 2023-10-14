
(SDEFUN |IALGFACT;perturbfactor|
        ((|f| |AlPol|) (|k| |Integer|) (|fact| |Mapping| (|Factored| UP) UP)
         ($ |List| |AlPol|))
        (SPROG
         ((#1=#:G113 NIL) (|pp| NIL) (#2=#:G112 NIL) (|pol| (|AlPol|))
          (|lsols| (|List| |AlPol|)) (|newf| (|AlPol|)))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 13))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT $ 15)) 1
                                      (QREFELT $ 17))
                            (QREFELT $ 18))
                           0 (QREFELT $ 13))
                          (QREFELT $ 19))
                . #3=(|IALGFACT;perturbfactor|))
          (LETT |newf| (SPADCALL |f| |pol| (QREFELT $ 20)) . #3#)
          (LETT |lsols| (|IALGFACT;irrfactor| |newf| |k| |fact| $) . #3#)
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 13))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT $ 15)) 1
                                      (QREFELT $ 17))
                            (QREFELT $ 18))
                           0 (QREFELT $ 13))
                          (QREFELT $ 21))
                . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |pp| NIL . #3#) (LETT #1# |lsols| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |pp| |pol| (QREFELT $ 20)) #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |IALGFACT;irrfactor|
        ((|f| |AlPol|) (|k| |Integer|) (|fact| |Mapping| (|Factored| UP) UP)
         ($ |List| |AlPol|))
        (SPROG
         ((|listerm| (|List| |AlPol|)) (|newf| (|AlPol|)) (#1=#:G119 NIL)
          (|g| (|AlPol|)) (#2=#:G129 NIL) (|pelt| NIL)
          (|listfact|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|nn| (UP)))
         (SEQ
          (COND ((EQL (SPADCALL |f| (QREFELT $ 22)) 1) (LIST |f|))
                (#3='T
                 (SEQ (LETT |newf| |f| . #4=(|IALGFACT;irrfactor|))
                      (LETT |nn| (|IALGFACT;pnorm| |f| $) . #4#)
                      (LETT |listfact|
                            (SPADCALL (SPADCALL |nn| |fact|) (QREFELT $ 26))
                            . #4#)
                      (EXIT
                       (COND
                        ((EQL (LENGTH |listfact|) 1)
                         (COND
                          ((EQL (QCDR (|SPADfirst| |listfact|)) 1) (LIST |f|))
                          (#3#
                           (|IALGFACT;perturbfactor| |f| (+ |k| 1) |fact| $))))
                        (#3#
                         (SEQ (LETT |listerm| NIL . #4#)
                              (SEQ (LETT |pelt| NIL . #4#)
                                   (LETT #2# |listfact| . #4#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |pelt| (CAR #2#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL
                                           (|IALGFACT;change| (QCAR |pelt|) $)
                                           |newf| (QREFELT $ 27))
                                          . #4#)
                                    (LETT |newf|
                                          (PROG2
                                              (LETT #1#
                                                    (SPADCALL |newf| |g|
                                                              (QREFELT $ 29))
                                                    . #4#)
                                              (QCDR #1#)
                                            (|check_union| (QEQCAR #1# 0)
                                                           (QREFELT $ 9) #1#))
                                          . #4#)
                                    (EXIT
                                     (LETT |listerm|
                                           (COND
                                            ((EQL (QCDR |pelt|) 1)
                                             (CONS |g| |listerm|))
                                            ('T
                                             (APPEND
                                              (|IALGFACT;perturbfactor| |g|
                                               (+ |k| 1) |fact| $)
                                              |listerm|)))
                                           . #4#)))
                                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT |listerm|))))))))))) 

(SDEFUN |IALGFACT;factor;AlPolMF;3|
        ((|f| |AlPol|) (|fact| |Mapping| (|Factored| UP) UP)
         ($ |Factored| |AlPol|))
        (SPROG
         ((#1=#:G132 NIL) (#2=#:G131 #3=(|Factored| |AlPol|)) (#4=#:G133 #3#)
          (#5=#:G136 NIL) (#6=#:G135 #3#) (#7=#:G137 #3#) (#8=#:G142 NIL)
          (|pol| NIL) (#9=#:G141 NIL) (|sqterm| NIL)
          (|sqf| (|Factored| |AlPol|)))
         (SEQ
          (LETT |sqf| (SPADCALL |f| (QREFELT $ 31))
                . #10=(|IALGFACT;factor;AlPolMF;3|))
          (EXIT
           (SPADCALL (SPADCALL |sqf| (QREFELT $ 33))
                     (PROGN
                      (LETT #1# NIL . #10#)
                      (SEQ (LETT |sqterm| NIL . #10#)
                           (LETT #9# (SPADCALL |sqf| (QREFELT $ 36)) . #10#)
                           G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |sqterm| (CAR #9#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (PROGN
                                     (LETT #5# NIL . #10#)
                                     (SEQ (LETT |pol| NIL . #10#)
                                          (LETT #8#
                                                (|IALGFACT;irrfactor|
                                                 (QCAR |sqterm|) 0 |fact| $)
                                                . #10#)
                                          G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |pol| (CAR #8#) . #10#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #7#
                                                   (SPADCALL |pol|
                                                             (QCDR |sqterm|)
                                                             (QREFELT $ 37))
                                                   . #10#)
                                             (COND
                                              (#5#
                                               (LETT #6#
                                                     (SPADCALL #6# #7#
                                                               (QREFELT $ 38))
                                                     . #10#))
                                              ('T
                                               (PROGN
                                                (LETT #6# #7# . #10#)
                                                (LETT #5# 'T . #10#)))))))
                                          (LETT #8# (CDR #8#) . #10#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#5# #6#)
                                           ('T (|spadConstant| $ 39))))
                                    . #10#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 38))
                                      . #10#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #10#)
                                 (LETT #1# 'T . #10#)))))))
                           (LETT #9# (CDR #9#) . #10#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 39))))
                     (QREFELT $ 40)))))) 

(SDEFUN |IALGFACT;pnorm| ((|q| |AlPol|) ($ UP))
        (SPADCALL (|IALGFACT;convrt| |q| $) (QREFELT $ 50) (QREFELT $ 51))) 

(SDEFUN |IALGFACT;change| ((|q| UP) ($ |AlPol|))
        (SPADCALL (ELT $ 52) |q| (QREFELT $ 55))) 

(SDEFUN |IALGFACT;convrt| ((|q| |AlPol|) ($ |SparseUnivariatePolynomial| UP))
        (SPADCALL (SPADCALL (ELT $ 56) |q| (QREFELT $ 59)) (QREFELT $ 61))) 

(DECLAIM (NOTINLINE |InnerAlgFactor;|)) 

(DEFUN |InnerAlgFactor| (&REST #1=#:G148)
  (SPROG NIL
         (PROG (#2=#:G149)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerAlgFactor|)
                                               '|domainEqualList|)
                    . #3=(|InnerAlgFactor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerAlgFactor;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerAlgFactor|)))))))))) 

(DEFUN |InnerAlgFactor;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerAlgFactor|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|InnerAlgFactor| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 62) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|InnerAlgFactor|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 44 (SPADCALL (QREFELT $ 43)))
    (QSETREFV $ 50 (SPADCALL (ELT $ 45) (QREFELT $ 44) (QREFELT $ 49)))
    $))) 

(MAKEPROP '|InnerAlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |One|) (4 . |One|)
              (|NonNegativeInteger|) (8 . |monomial|) (|Integer|)
              (14 . |coerce|) (19 . |One|) (23 . |monomial|) (29 . |reduce|)
              (34 . -) (40 . |elt|) (46 . +) (52 . |degree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 14)) (|List| 23)
              (|Factored| 7) (57 . |factors|) (62 . |gcd|)
              (|Union| $ '"failed") (68 . |exquo|) (|Factored| $)
              (74 . |squareFree|) (|Factored| 9) (79 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 14)) (|List| 34)
              (84 . |factors|) (89 . |primeFactor|) (95 . *) (101 . |One|)
              (105 . *) (|Mapping| 25 7) |IALGFACT;factor;AlPolMF;3|
              (111 . |definingPolynomial|) '|p| (115 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 46) (120 . |map|)
              '|newp| (126 . |resultant|) (132 . |coerce|) (|Mapping| 8 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 8 9) (137 . |map|)
              (143 . |lift|) (|Mapping| 7 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 9 7 46) (148 . |map|)
              (|CommuteUnivariatePolynomialCategory| 6 7 46) (154 . |swap|))
           '#(|factor| 159) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 61
                                                 '(0 8 0 10 0 6 0 11 2 9 0 8 12
                                                   13 1 6 0 14 15 0 7 0 16 2 7
                                                   0 6 12 17 1 8 0 7 18 2 9 0 0
                                                   0 19 2 9 0 0 0 20 2 9 0 0 0
                                                   21 1 9 12 0 22 1 25 24 0 26
                                                   2 9 0 0 0 27 2 9 28 0 0 29 1
                                                   9 30 0 31 1 32 9 0 33 1 32
                                                   35 0 36 2 32 0 9 14 37 2 32
                                                   0 0 0 38 0 32 0 39 2 32 0 9
                                                   0 40 0 8 7 43 1 7 0 6 45 2
                                                   48 46 47 7 49 2 46 7 0 0 51
                                                   1 8 0 6 52 2 54 9 53 7 55 1
                                                   8 7 0 56 2 58 46 57 9 59 1
                                                   60 46 46 61 2 0 32 9 41
                                                   42)))))
           '|lookupComplete|)) 
