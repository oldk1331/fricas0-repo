
(SDEFUN |UFFACT;get_deg_GF| ((% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G117 NIL) (|n| (|PositiveInteger|))
          (|ss| (|NonNegativeInteger|)) (#2=#:G112 NIL))
         (SEQ
          (COND
           ((EQL (QREFELT % 12) 0)
            (SEQ (LETT |n| 1) (LETT |ss| (SPADCALL (QREFELT % 15)))
                 (SEQ G190 (COND ((NULL (> |ss| (QREFELT % 10))) (GO G191)))
                      (SEQ
                       (LETT |ss|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |ss| (QREFELT % 10)
                                                 (QREFELT % 17)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #2#)))
                       (EXIT (LETT |n| (+ |n| 1))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (SETELT % 12 |n|)))))
          (EXIT
           (PROG1 (LETT #1# (QREFELT % 12))
             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                               '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |UFFACT;sufactor2|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|mf1| (|SparseUnivariatePolynomial| F)) (#1=#:G126 NIL) (|f1| NIL)
          (|lfp| (|List| (|PrimitiveArray| F))) (|pa| (|PrimitiveArray| F)))
         (SEQ (LETT |pa| (SPADCALL |m| (QREFELT % 23)))
              (LETT |lfp| (SPADCALL |pa| (QREFELT % 20) (QREFELT % 27)))
              (LETT |res| NIL)
              (SEQ (LETT |f1| NIL) (LETT #1# |lfp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |mf1| (SPADCALL |f1| (QREFELT % 28)))
                        (EXIT (LETT |res| (CONS |mf1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |UFFACT;sufact_gen|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|facs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G140 NIL) (|f1| NIL) (|e1| #2=(|NonNegativeInteger|))
          (|lf1| (|List| (|SparseUnivariatePolynomial| F)))
          (|m1| #3=(|SparseUnivariatePolynomial| F)) (|lc1| (F))
          (#4=#:G139 NIL) (|sf| NIL)
          (|lsf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#) (|:| |exponent| #2#))))
          (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |lc| (SPADCALL |m| (QREFELT % 29)))
                      (|spadConstant| % 18) (QREFELT % 31))
            (LETT |m|
                  (SPADCALL (SPADCALL |lc| (QREFELT % 32)) |m|
                            (QREFELT % 33)))))
          (LETT |facs| NIL)
          (LETT |lsf| (SPADCALL (SPADCALL |m| (QREFELT % 35)) (QREFELT % 40)))
          (SEQ (LETT |sf| NIL) (LETT #4# |lsf|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |sf| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |m1| (QVELT |sf| 1))
                    (COND
                     ((SPADCALL (LETT |lc1| (SPADCALL |m1| (QREFELT % 29)))
                                (|spadConstant| % 18) (QREFELT % 31))
                      (LETT |m1|
                            (SPADCALL (SPADCALL |lc1| (QREFELT % 32)) |m1|
                                      (QREFELT % 33)))))
                    (LETT |lf1| (|UFFACT;sufactor2| |m1| %))
                    (LETT |e1| (QVELT |sf| 2))
                    (EXIT
                     (SEQ (LETT |f1| NIL) (LETT #1# |lf1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT |facs| (CONS (CONS |f1| |e1|) |facs|))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lc| |facs|))))) 

(SDEFUN |UFFACT;sufactor1|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|mf1| (|SparseUnivariatePolynomial| F))
          (|if1| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G146 NIL)
          (|f1| NIL) (|lfp| (|List| (|U32Vector|))) (|pa| (|U32Vector|))
          (|mi| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ (LETT |mi| (SPADCALL (ELT % 42) |m| (QREFELT % 46)))
              (LETT |pa| (SPADCALL |mi| (QREFELT % 10) (QREFELT % 49)))
              (LETT |lfp| (SPADCALL |pa| (QREFELT % 10) (QREFELT % 52)))
              (LETT |res| NIL)
              (SEQ (LETT |f1| NIL) (LETT #1# |lfp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |if1| (SPADCALL |f1| (QREFELT % 53)))
                        (LETT |mf1| (SPADCALL (ELT % 54) |if1| (QREFELT % 57)))
                        (EXIT (LETT |res| (CONS |mf1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |UFFACT;sufact_small|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|facs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G159 NIL) (|f1| NIL) (|e1| #2=(|NonNegativeInteger|))
          (|lf1| (|List| (|SparseUnivariatePolynomial| F)))
          (|m1| #3=(|SparseUnivariatePolynomial| F)) (|lc1| (F))
          (#4=#:G158 NIL) (|sf| NIL)
          (|lsf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#) (|:| |exponent| #2#))))
          (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |lc| (SPADCALL |m| (QREFELT % 29)))
                      (|spadConstant| % 18) (QREFELT % 31))
            (LETT |m|
                  (SPADCALL (SPADCALL |lc| (QREFELT % 32)) |m|
                            (QREFELT % 33)))))
          (LETT |facs| NIL)
          (LETT |lsf| (SPADCALL (SPADCALL |m| (QREFELT % 35)) (QREFELT % 40)))
          (SEQ (LETT |sf| NIL) (LETT #4# |lsf|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |sf| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |m1| (QVELT |sf| 1))
                    (COND
                     ((SPADCALL (LETT |lc1| (SPADCALL |m1| (QREFELT % 29)))
                                (|spadConstant| % 18) (QREFELT % 31))
                      (LETT |m1|
                            (SPADCALL (SPADCALL |lc1| (QREFELT % 32)) |m1|
                                      (QREFELT % 33)))))
                    (LETT |lf1| (|UFFACT;sufactor1| |m1| %))
                    (LETT |e1| (QVELT |sf| 2))
                    (EXIT
                     (SEQ (LETT |f1| NIL) (LETT #1# |lf1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT |facs| (CONS (CONS |f1| |e1|) |facs|))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lc| |facs|))))) 

(SDEFUN |UFFACT;sufactor;SupR;6|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 58)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;sufact_small| |m| %))
         ('T (|UFFACT;sufact_gen| |m| %)))) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;7|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (COND
         ((< (* (SPADCALL |m| (QREFELT % 58)) (EXPT (QREFELT % 10) 2))
             MOST-POSITIVE-FIXNUM)
          (|UFFACT;sufactor1| |m| %))
         ('T (|UFFACT;sufactor2| |m| %)))) 

(SDEFUN |UFFACT;sufactor;SupR;8|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|UFFACT;sufact_gen| |m| %)) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;9|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (|UFFACT;sufactor2| |m| %)) 

(SDEFUN |UFFACT;sufactor;SupR;10|
        ((|m| (|SparseUnivariatePolynomial| F))
         (%
          (|Record| (|:| |cont| F)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| F))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|UFFACT;sufact_gen| |m| %)) 

(SDEFUN |UFFACT;sufactor_square_free;SupL;11|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (|UFFACT;sufactor2| |m| %)) 

(SDEFUN |UFFACT;factor;UPF;12| ((|pol| (UP)) (% (|Factored| UP)))
        (SPROG
         ((|rl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G181 NIL) (|f1| NIL)
          (|ru|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| F))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (|upol| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 64))
            (|spadConstant| % 66))
           ('T
            (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 67)))
                 (LETT |ru| (SPADCALL |upol| (QREFELT % 61))) (LETT |rl| NIL)
                 (SEQ (LETT |f1| NIL) (LETT #1# (QCDR |ru|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |rl|
                              (CONS
                               (VECTOR (CONS 3 "prime")
                                       (SPADCALL (QCAR |f1|) (QREFELT % 68))
                                       (QCDR |f1|))
                               |rl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL (QCAR |ru|) (QREFELT % 69)) |rl|
                            (QREFELT % 72))))))))) 

(SDEFUN |UFFACT;factorSquareFree;UPF;13| ((|pol| (UP)) (% (|Factored| UP)))
        (SPROG
         ((|rl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f1| (|SparseUnivariatePolynomial| F)) (|lc1| (F)) (#1=#:G193 NIL)
          (|rlu| (|List| (|SparseUnivariatePolynomial| F)))
          (|upol| (|SparseUnivariatePolynomial| F)) (|lc| (F)))
         (SEQ
          (COND
           ((SPADCALL |pol| (|spadConstant| % 14) (QREFELT % 64))
            (|spadConstant| % 66))
           ('T
            (SEQ (LETT |upol| (SPADCALL |pol| (QREFELT % 67)))
                 (LETT |lc| (SPADCALL |upol| (QREFELT % 29)))
                 (LETT |upol|
                       (SPADCALL (SPADCALL |lc| (QREFELT % 32)) |upol|
                                 (QREFELT % 33)))
                 (LETT |rlu| (SPADCALL |upol| (QREFELT % 63))) (LETT |rl| NIL)
                 (SEQ (LETT #1# |rlu|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |lc1| (SPADCALL |f1| (QREFELT % 29)))
                           (LETT |f1|
                                 (SPADCALL (SPADCALL |lc1| (QREFELT % 32)) |f1|
                                           (QREFELT % 33)))
                           (EXIT
                            (LETT |rl|
                                  (CONS
                                   (VECTOR (CONS 1 "sqfr")
                                           (SPADCALL |f1| (QREFELT % 68)) 1)
                                   |rl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL |lc| (QREFELT % 69)) |rl|
                            (QREFELT % 72))))))))) 

(DECLAIM (NOTINLINE |UnivariateFiniteFieldFactorize;|)) 

(DEFUN |UnivariateFiniteFieldFactorize| (&REST #1=#:G194)
  (SPROG NIL
         (PROG (#2=#:G195)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateFiniteFieldFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |UnivariateFiniteFieldFactorize;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateFiniteFieldFactorize|)))))))))) 

(DEFUN |UnivariateFiniteFieldFactorize;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|UnivariateFiniteFieldFactorize| DV$1 DV$2))
          (LETT % (GETREFV 75))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|UnivariateFiniteFieldFactorize|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 11 (|VectorPolynomialOperationsF| |#1|))
          (QSETREFV % 12 0)
          (QSETREFV % 20 (CONS (QREFELT % 10) (|UFFACT;get_deg_GF| %)))
          (COND
           ((|domainEqual| |#1| (|PrimeField| (QREFELT % 10)))
            (COND
             ((|HasSignature| |#1|
                              (LIST '|convert|
                                    (LIST '(|Integer|) (|devaluate| |#1|))))
              (PROGN
               (QSETREFV % 61
                         (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;6|)
                               %))
               (QSETREFV % 63
                         (CONS
                          (|dispatchFunction|
                           |UFFACT;sufactor_square_free;SupL;7|)
                          %))))
             ('T
              (PROGN
               (QSETREFV % 61
                         (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;8|)
                               %))
               (QSETREFV % 63
                         (CONS
                          (|dispatchFunction|
                           |UFFACT;sufactor_square_free;SupL;9|)
                          %))))))
           ('T
            (PROGN
             (QSETREFV % 61
                       (CONS (|dispatchFunction| |UFFACT;sufactor;SupR;10|) %))
             (QSETREFV % 63
                       (CONS
                        (|dispatchFunction|
                         |UFFACT;sufactor_square_free;SupL;11|)
                        %)))))
          %))) 

(MAKEPROP '|UnivariateFiniteFieldFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |characteristic|) '|ch_prime| '|pV|
              '|deg_GF| (4 . |Zero|) (8 . |Zero|) (12 . |size|)
              (|Union| % '"failed") (16 . |exquo|) (22 . |One|) (26 . |One|)
              '|mD| (|PrimitiveArray| 6) (|SparseUnivariatePolynomial| 6)
              (30 . |to_mod_pa|) (|List| 21)
              (|Record| (|:| |i_mod| 41) (|:| |deg| 41))
              (|ModularFactorizationK| 6) (35 . |mfactor|) (41 . |pa_to_sup|)
              (46 . |leadingCoefficient|) (|Boolean|) (51 . ~=) (57 . |inv|)
              (62 . *) (|Factored| %) (68 . |squareFree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 36) (|:| |factor| 22) (|:| |exponent| 8))
              (|List| 37) (|Factored| 22) (73 . |factorList|) (|Integer|)
              (78 . |convert|) (|SparseUnivariatePolynomial| 41)
              (|Mapping| 41 6) (|SparseUnivariatePolynomialFunctions2| 6 41)
              (83 . |map|) (|U32Vector|) (|U32VectorPolynomialOperations|)
              (89 . |to_mod_pa|) (|List| 47) (|ModularFactorization|)
              (95 . |mfactor|) (101 . |pa_to_sup|) (106 . |coerce|)
              (|Mapping| 6 41) (|SparseUnivariatePolynomialFunctions2| 41 6)
              (111 . |map|) (117 . |degree|)
              (|Record| (|:| |factor| 22) (|:| |exponent| 8))
              (|Record| (|:| |cont| 6) (|:| |factors| (|List| 59)))
              (122 . |sufactor|) (|List| 22) (127 . |sufactor_square_free|)
              (132 . =) (|Factored| 7) (138 . |Zero|) (142 . |makeSUP|)
              (147 . |unmakeSUP|) (152 . |coerce|)
              (|Record| (|:| |flag| 36) (|:| |factor| 7) (|:| |exponent| 8))
              (|List| 70) (157 . |makeFR|) |UFFACT;factor;UPF;12|
              |UFFACT;factorSquareFree;UPF;13|)
           '#(|sufactor_square_free| 163 |sufactor| 168 |factorSquareFree| 173
              |factor| 178)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#2|) |#2|)) T)
                                   '((|factorSquareFree|
                                      ((|Factored| |#2|) |#2|))
                                     T)
                                   '((|sufactor|
                                      ((|Record| (|:| |cont| |#1|)
                                                 (|:| |factors|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |factor|
                                                             (|SparseUnivariatePolynomial|
                                                              |#1|))
                                                        (|:| |exponent|
                                                             (|NonNegativeInteger|))))))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T)
                                   '((|sufactor_square_free|
                                      ((|List|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       (|SparseUnivariatePolynomial| |#1|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 74
                                            '(0 6 8 9 0 6 0 13 0 7 0 14 0 6 8
                                              15 2 8 16 0 0 17 0 6 0 18 0 7 0
                                              19 1 11 21 22 23 2 26 24 21 25 27
                                              1 11 22 21 28 1 22 6 0 29 2 6 30
                                              0 0 31 1 6 0 0 32 2 22 0 6 0 33 1
                                              22 34 0 35 1 39 38 0 40 1 6 41 0
                                              42 2 45 43 44 22 46 2 48 47 43 41
                                              49 2 51 50 47 41 52 1 48 43 47 53
                                              1 6 0 41 54 2 56 22 55 43 57 1 22
                                              8 0 58 1 0 60 22 61 1 0 62 22 63
                                              2 7 30 0 0 64 0 65 0 66 1 7 22 0
                                              67 1 7 0 22 68 1 7 0 6 69 2 65 0
                                              7 71 72 1 0 62 22 63 1 0 60 22 61
                                              1 0 65 7 74 1 0 65 7 73)))))
           '|lookupComplete|)) 
