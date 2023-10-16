
(SDEFUN |ELINSOL;lin_coeff|
        ((|x| |SparseMultivariatePolynomial| R (|Kernel| F)) (|v| |Kernel| F)
         ($ F))
        (SPROG
         ((|d| (|NonNegativeInteger|))
          (|ux|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ (LETT |ux| (SPADCALL |x| |v| (QREFELT $ 11)))
              (LETT |d| (SPADCALL |ux| (QREFELT $ 14)))
              (EXIT
               (COND ((< |d| 1) (|spadConstant| $ 17))
                     ((SPADCALL |d| 1 (QREFELT $ 19))
                      (|error| "lin_coeff: x is nonlinear"))
                     ('T
                      (SPADCALL (SPADCALL |ux| (QREFELT $ 20))
                                (QREFELT $ 22)))))))) 

(SDEFUN |ELINSOL;F_to_LF| ((|x| F) (|vl| |List| (|Kernel| F)) ($ |List| F))
        (SPROG
         ((#1=#:G130 NIL) (|v| NIL) (#2=#:G129 NIL)
          (|nx0| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|nx1| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|ml| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#3=#:G127 NIL) (#4=#:G128 NIL) (|c| NIL) (#5=#:G126 NIL)
          (|res0| (|List| F)) (#6=#:G125 NIL) (#7=#:G124 NIL)
          (|nx| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT $ 23)))
              (LETT |res0|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |v| NIL) (LETT #6# |vl|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |v| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (|ELINSOL;lin_coeff| |nx| |v| $)
                                        #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |ml|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |c| NIL) (LETT #4# |res0|) (LETT |v| NIL)
                          (LETT #3# |vl|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL)
                                (ATOM #4#) (PROGN (LETT |c| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL (SPADCALL |c| (QREFELT $ 23))
                                             (SPADCALL (|spadConstant| $ 24)
                                                       |v| 1 (QREFELT $ 25))
                                             (QREFELT $ 26))
                                   #5#))))
                          (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                          (GO G190) G191 (EXIT (NREVERSE #5#)))))
              (LETT |nx1|
                    (SPADCALL (ELT $ 28) |ml| (|spadConstant| $ 29)
                              (QREFELT $ 32)))
              (LETT |nx0| (SPADCALL |nx| |nx1| (QREFELT $ 33)))
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (ELT $ 37)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |v| NIL) (LETT #1# |vl|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |v| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |nx0| |v| (QREFELT $ 35))
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 40))
                  0 (QREFELT $ 41))
                 (|error| "x is nonlinear in vl"))
                ('T (CONS (SPADCALL |nx0| (QREFELT $ 22)) |res0|))))))) 

(SDEFUN |ELINSOL;lin_sol;LLU;3|
        ((|eql| |List| F) (|vl| |List| (|Symbol|))
         ($ |Union| (|List| F) "failed"))
        (SPROG
         ((#1=#:G140 NIL)
          (|ss|
           (|Record| (|:| |particular| (|Union| (|Vector| F) #2="failed"))
                     (|:| |basis| (|List| (|Vector| F)))))
          (|eqm| (|Matrix| F)) (#3=#:G154 NIL) (|ll| NIL) (#4=#:G153 NIL)
          (|rh| (|Vector| F)) (#5=#:G152 NIL) (#6=#:G151 NIL)
          (|eqll| (|List| (|List| F))) (#7=#:G150 NIL) (|p| NIL)
          (#8=#:G149 NIL) (|coefk| (|List| (|Kernel| F))) (#9=#:G148 NIL)
          (|c| NIL) (#10=#:G147 NIL))
         (SEQ
          (LETT |coefk|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |c| NIL) (LETT #9# |vl|) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |c| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (SPADCALL (SPADCALL |c| (QREFELT $ 43))
                                         (QREFELT $ 45))
                               #10#))))
                      (LETT #9# (CDR #9#)) (GO G190) G191
                      (EXIT (NREVERSE #10#)))))
          (LETT |eqll|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |p| NIL) (LETT #7# |eql|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS (|ELINSOL;F_to_LF| |p| |coefk| $) #8#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (LETT |rh|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #6# NIL)
                   (SEQ (LETT |ll| NIL) (LETT #5# |eqll|) G190
                        (COND
                         ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #6# (CONS (|SPADfirst| |ll|) #6#))))
                        (LETT #5# (CDR #5#)) (GO G190) G191
                        (EXIT (NREVERSE #6#))))
                  (QREFELT $ 48))
                 (QREFELT $ 49)))
          (LETT |eqm|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL)
                  (SEQ (LETT |ll| NIL) (LETT #3# |eqll|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |ll| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #4# (CONS (CDR |ll|) #4#))))
                       (LETT #3# (CDR #3#)) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 52)))
          (LETT |ss| (SPADCALL |eqm| |rh| (QREFELT $ 56)))
          (EXIT
           (COND ((QEQCAR (QCAR |ss|) 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL
                         (PROG2 (LETT #1# (QCAR |ss|))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|Vector| (QREFELT $ 7))
                                           (|Union| (|Vector| (QREFELT $ 7))
                                                    #2#)
                                           #1#))
                         (QREFELT $ 57))))))))) 

(DECLAIM (NOTINLINE |ExpressionLinearSolve;|)) 

(DEFUN |ExpressionLinearSolve| (&REST #1=#:G155)
  (SPROG NIL
         (PROG (#2=#:G156)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionLinearSolve|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionLinearSolve;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ExpressionLinearSolve|)))))))))) 

(DEFUN |ExpressionLinearSolve;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ExpressionLinearSolve| DV$1 DV$2))
          (LETT $ (GETREFV 61))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ExpressionLinearSolve|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExpressionLinearSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| $) (|Kernel| 7)
              (|SparseMultivariatePolynomial| 6 9) (0 . |univariate|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 10)
              (6 . |degree|) (11 . |One|) (15 . |One|) (19 . |Zero|)
              (|Boolean|) (23 . >) (29 . |leadingCoefficient|)
              (|SparseMultivariatePolynomial| 6 44) (34 . |coerce|)
              (39 . |numer|) (44 . |One|) (48 . |monomial|) (55 . *) (61 . +)
              (67 . +) (73 . |Zero|) (|Mapping| 10 10 10) (|List| 10)
              (77 . |reduce|) (84 . -) (90 . |max|) (96 . |degree|) (|Integer|)
              (102 . |max|) (|Mapping| 36 36 36) (|List| 36) (108 . |reduce|)
              (114 . >) (|Symbol|) (120 . |coerce|) (|Kernel| $)
              (125 . |retract|) (|List| 7) (|Vector| 7) (130 . |vector|)
              (135 . -) (|List| 46) (|Matrix| 7) (140 . |matrix|)
              (|Union| 47 '"failed")
              (|Record| (|:| |particular| 53) (|:| |basis| (|List| 47)))
              (|LinearSystemMatrixPackage1| 7) (145 . |solve|) (151 . |parts|)
              (|Union| 46 '"failed") (|List| 42) |ELINSOL;lin_sol;LLU;3|)
           '#(|lin_sol| 156) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|lin_sol|
                                 ((|Union| (|List| |#2|) "failed")
                                  (|List| |#2|) (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 60
                                            '(2 10 8 0 9 11 1 13 12 0 14 0 6 0
                                              15 0 7 0 16 0 7 0 17 2 12 18 0 0
                                              19 1 13 10 0 20 1 7 0 21 22 1 7
                                              21 0 23 0 10 0 24 3 10 0 0 9 12
                                              25 2 10 0 0 0 26 2 7 0 0 0 27 2
                                              10 0 0 0 28 0 10 0 29 3 31 10 30
                                              0 10 32 2 10 0 0 0 33 2 9 0 0 0
                                              34 2 10 12 0 9 35 2 36 0 0 0 37 2
                                              39 36 38 0 40 2 36 18 0 0 41 1 7
                                              0 42 43 1 7 44 0 45 1 47 0 46 48
                                              1 47 0 0 49 1 51 0 50 52 2 55 54
                                              51 47 56 1 47 46 0 57 2 0 58 46
                                              59 60)))))
           '|lookupComplete|)) 
