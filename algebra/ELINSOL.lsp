
(SDEFUN |ELINSOL;lin_coeff|
        ((|x| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|v| |Kernel| (|Expression| R)) ($ |Expression| R))
        (SPROG
         ((|d| (|NonNegativeInteger|))
          (|ux|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))))
         (SEQ
          (LETT |ux| (SPADCALL |x| |v| (QREFELT $ 10))
                . #1=(|ELINSOL;lin_coeff|))
          (LETT |d| (SPADCALL |ux| (QREFELT $ 13)) . #1#)
          (EXIT
           (COND ((< |d| 1) (|spadConstant| $ 17))
                 ((SPADCALL |d| 1 (QREFELT $ 19))
                  (|error| "lin_coeff: x is nonlinear"))
                 ('T
                  (SPADCALL (SPADCALL |ux| (QREFELT $ 20)) (QREFELT $ 22)))))))) 

(SDEFUN |ELINSOL;F_to_LF|
        ((|x| |Expression| R) (|vl| |List| (|Kernel| (|Expression| R)))
         ($ |List| (|Expression| R)))
        (SPROG
         ((#1=#:G131 NIL) (|v| NIL) (#2=#:G130 NIL)
          (|nx0|
           (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
          (|nx1|
           (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
          (|ml|
           (|List|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (#3=#:G128 NIL) (#4=#:G129 NIL) (|c| NIL) (#5=#:G127 NIL)
          (|res0| (|List| (|Expression| R))) (#6=#:G126 NIL) (#7=#:G125 NIL)
          (|nx|
           (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
         (SEQ
          (LETT |nx| (SPADCALL |x| (QREFELT $ 23)) . #8=(|ELINSOL;F_to_LF|))
          (LETT |res0|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |v| NIL . #8#) (LETT #6# |vl| . #8#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |v| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7# (CONS (|ELINSOL;lin_coeff| |nx| |v| $) #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |ml|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |c| NIL . #8#) (LETT #4# |res0| . #8#)
                      (LETT |v| NIL . #8#) (LETT #3# |vl| . #8#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #8#) NIL)
                            (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL (SPADCALL |c| (QREFELT $ 23))
                                         (SPADCALL (|spadConstant| $ 24) |v| 1
                                                   (QREFELT $ 25))
                                         (QREFELT $ 26))
                               #5#)
                              . #8#)))
                      (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT (NREVERSE #5#))))
                . #8#)
          (LETT |nx1|
                (SPADCALL (ELT $ 28) |ml| (|spadConstant| $ 29) (QREFELT $ 32))
                . #8#)
          (LETT |nx0| (SPADCALL |nx| |nx1| (QREFELT $ 33)) . #8#)
          (EXIT
           (COND
            ((SPADCALL
              (SPADCALL (ELT $ 37)
                        (PROGN
                         (LETT #2# NIL . #8#)
                         (SEQ (LETT |v| NIL . #8#) (LETT #1# |vl| . #8#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |v| (CAR #1#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |nx0| |v| (QREFELT $ 35))
                                            #2#)
                                      . #8#)))
                              (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 40))
              0 (QREFELT $ 41))
             (SEQ (SPADCALL "x, vl" (QREFELT $ 44))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 44))
                  (SPADCALL (SPADCALL |vl| (QREFELT $ 47)) (QREFELT $ 44))
                  (SPADCALL (SPADCALL |res0| (QREFELT $ 49)) (QREFELT $ 44))
                  (EXIT (|error| "x is nonlinear in vl"))))
            ('T (CONS (SPADCALL |nx0| (QREFELT $ 22)) |res0|))))))) 

(SDEFUN |ELINSOL;lin_sol;LLU;3|
        ((|eql| |List| (|Expression| R)) (|vl| |List| (|Symbol|))
         ($ |Union| (|List| (|Expression| R)) "failed"))
        (SPROG
         ((#1=#:G148 NIL)
          (|ss|
           (|Record|
            (|:| |particular| (|Union| (|Vector| (|Expression| R)) "failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (|eqm| (|Matrix| (|Expression| R))) (#2=#:G162 NIL) (|ll| NIL)
          (#3=#:G161 NIL) (|rh| (|Vector| (|Expression| R))) (#4=#:G160 NIL)
          (#5=#:G159 NIL) (|eqll| (|List| (|List| (|Expression| R))))
          (#6=#:G158 NIL) (|p| NIL) (#7=#:G157 NIL)
          (|coefk| (|List| (|Kernel| (|Expression| R)))) (#8=#:G156 NIL)
          (|c| NIL) (#9=#:G155 NIL))
         (SEQ
          (LETT |coefk|
                (PROGN
                 (LETT #9# NIL . #10=(|ELINSOL;lin_sol;LLU;3|))
                 (SEQ (LETT |c| NIL . #10#) (LETT #8# |vl| . #10#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |c| (CAR #8#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL (SPADCALL |c| (QREFELT $ 51))
                                         (QREFELT $ 53))
                               #9#)
                              . #10#)))
                      (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #10#)
          (LETT |eqll|
                (PROGN
                 (LETT #7# NIL . #10#)
                 (SEQ (LETT |p| NIL . #10#) (LETT #6# |eql| . #10#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7# (CONS (|ELINSOL;F_to_LF| |p| |coefk| $) #7#)
                              . #10#)))
                      (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #10#)
          (LETT |rh|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #5# NIL . #10#)
                   (SEQ (LETT |ll| NIL . #10#) (LETT #4# |eqll| . #10#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |ll| (CAR #4#) . #10#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5# (CONS (|SPADfirst| |ll|) #5#) . #10#)))
                        (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  (QREFELT $ 55))
                 (QREFELT $ 56))
                . #10#)
          (LETT |eqm|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #10#)
                  (SEQ (LETT |ll| NIL . #10#) (LETT #2# |eqll| . #10#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |ll| (CAR #2#) . #10#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #3# (CONS (CDR |ll|) #3#) . #10#)))
                       (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 59))
                . #10#)
          (LETT |ss| (SPADCALL |eqm| |rh| (QREFELT $ 63)) . #10#)
          (EXIT
           (COND ((QEQCAR (QCAR |ss|) 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL
                         (PROG2 (LETT #1# (QCAR |ss|) . #10#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|Vector|
                                           (|Expression| (QREFELT $ 6)))
                                          #1#))
                         (QREFELT $ 64))))))))) 

(DECLAIM (NOTINLINE |ExpressionLinearSolve;|)) 

(DEFUN |ExpressionLinearSolve| (#1=#:G163)
  (SPROG NIL
         (PROG (#2=#:G164)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionLinearSolve|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionLinearSolve|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ExpressionLinearSolve;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ExpressionLinearSolve|)))))))))) 

(DEFUN |ExpressionLinearSolve;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionLinearSolve|))
          (LETT |dv$| (LIST '|ExpressionLinearSolve| DV$1) . #1#)
          (LETT $ (GETREFV 68) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionLinearSolve| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExpressionLinearSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|SparseUnivariatePolynomial| $) (|Kernel| 15)
              (|SparseMultivariatePolynomial| 6 8) (0 . |univariate|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 9)
              (6 . |degree|) (11 . |One|) (|Expression| 6) (15 . |One|)
              (19 . |Zero|) (|Boolean|) (23 . >) (29 . |leadingCoefficient|)
              (|SparseMultivariatePolynomial| 6 52) (34 . |coerce|)
              (39 . |numer|) (44 . |One|) (48 . |monomial|) (55 . *) (61 . +)
              (67 . +) (73 . |Zero|) (|Mapping| 9 9 9) (|List| 9)
              (77 . |reduce|) (84 . -) (90 . |max|) (96 . |degree|) (|Integer|)
              (102 . |max|) (|Mapping| 36 36 36) (|List| 36) (108 . |reduce|)
              (114 . >) (|Void|) (|OutputForm|) (120 . |print|)
              (125 . |coerce|) (|List| 8) (130 . |coerce|) (|List| 15)
              (135 . |coerce|) (|Symbol|) (140 . |coerce|) (|Kernel| $)
              (145 . |retract|) (|Vector| 15) (150 . |vector|) (155 . -)
              (|List| 48) (|Matrix| 15) (160 . |matrix|) (|Union| 54 '"failed")
              (|Record| (|:| |particular| 60) (|:| |basis| (|List| 54)))
              (|LinearSystemMatrixPackage1| 15) (165 . |solve|) (171 . |parts|)
              (|Union| 48 '"failed") (|List| 50) |ELINSOL;lin_sol;LLU;3|)
           '#(|lin_sol| 176) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 67
                                                 '(2 9 7 0 8 10 1 12 11 0 13 0
                                                   6 0 14 0 15 0 16 0 15 0 17 2
                                                   11 18 0 0 19 1 12 9 0 20 1
                                                   15 0 21 22 1 15 21 0 23 0 9
                                                   0 24 3 9 0 0 8 11 25 2 9 0 0
                                                   0 26 2 15 0 0 0 27 2 9 0 0 0
                                                   28 0 9 0 29 3 31 9 30 0 9 32
                                                   2 9 0 0 0 33 2 8 0 0 0 34 2
                                                   9 11 0 8 35 2 36 0 0 0 37 2
                                                   39 36 38 0 40 2 36 18 0 0 41
                                                   1 43 42 0 44 1 15 43 0 45 1
                                                   46 43 0 47 1 48 43 0 49 1 15
                                                   0 50 51 1 15 52 0 53 1 54 0
                                                   48 55 1 54 0 0 56 1 58 0 57
                                                   59 2 62 61 58 54 63 1 54 48
                                                   0 64 2 0 65 48 66 67)))))
           '|lookupComplete|)) 
