
(/VERSIONCHECK 2) 

(DEFUN |POLYCATQ;univariate;FVF;1| (|f| |x| $)
  (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
            (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
            (QREFELT $ 15))) 

(DEFUN |POLYCATQ;univariate;FV2Sup;2| (|f| |x| |modulus| $)
  (PROG (|bc|)
    (RETURN
     (SEQ
      (LETT |bc|
            (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
                      |modulus| (|spadConstant| $ 17) (QREFELT $ 20))
            |POLYCATQ;univariate;FV2Sup;2|)
      (EXIT
       (COND ((QEQCAR |bc| 1) (|error| "univariate: denominator is 0 mod p"))
             ('T
              (SPADCALL
               (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
                         (QCAR (QCDR |bc|)) (QREFELT $ 21))
               |modulus| (QREFELT $ 22))))))))) 

(DEFUN |POLYCATQ;multivariate;FVF;3| (|f| |x| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 25))
            |POLYCATQ;multivariate;FVF;3|)
      (EXIT
       (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 26)) |v| (QREFELT $ 27))
                 (SPADCALL (SPADCALL |f| (QREFELT $ 28)) |v| (QREFELT $ 27))
                 (QREFELT $ 29))))))) 

(DEFUN |POLYCATQ;mymerge| (|l| |m| $)
  (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
        ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 32))
         (CONS (|SPADfirst| |l|) (|POLYCATQ;mymerge| (CDR |l|) (CDR |m|) $)))
        ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 33))
         (CONS (|SPADfirst| |l|) (|POLYCATQ;mymerge| (CDR |l|) |m| $)))
        ('T (CONS (|SPADfirst| |m|) (|POLYCATQ;mymerge| |l| (CDR |m|) $))))) 

(DEFUN |POLYCATQ;variables;FL;5| (|f| $)
  (|POLYCATQ;mymerge| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 35))
   (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 35)) $)) 

(DEFUN |POLYCATQ;isPower;FU;6| (|f| $)
  (PROG (|r| |ur| |den|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |den| (SPADCALL |f| (QREFELT $ 12))
               . #1=(|POLYCATQ;isPower;FU;6|))
         (|spadConstant| $ 37) (QREFELT $ 38))
        (COND
         ((SPADCALL (SPADCALL |f| (QREFELT $ 11)) (|spadConstant| $ 37)
                    (QREFELT $ 38))
          (CONS 1 "failed"))
         (#2='T
          (SEQ (LETT |ur| (SPADCALL |den| (QREFELT $ 41)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |ur| 1)
                  (CONS 0 (CONS (SPADCALL |den| (QREFELT $ 25)) -1)))
                 (#2#
                  (SEQ (LETT |r| (QCDR |ur|) . #1#)
                       (EXIT
                        (CONS 0
                              (CONS
                               (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 24))
                                         (QREFELT $ 25))
                               (- (QCDR |r|)))))))))))))
       (#2#
        (SEQ
         (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 41))
               . #1#)
         (EXIT
          (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                (#2#
                 (SEQ (LETT |r| (QCDR |ur|) . #1#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 24))
                                        (QREFELT $ 25))
                              (QCDR |r|))))))))))))))) 

(DEFUN |POLYCATQ;isExpt;FU;7| (|f| $)
  (PROG (|r| |ur|)
    (RETURN
     (SEQ
      (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 41))
            . #1=(|POLYCATQ;isExpt;FU;7|))
      (EXIT
       (COND
        ((QEQCAR |ur| 1)
         (COND
          ((SPADCALL (SPADCALL |f| (QREFELT $ 11)) (|spadConstant| $ 37)
                     (QREFELT $ 46))
           (SEQ
            (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 41))
                  . #1#)
            (EXIT
             (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                   (#2='T
                    (SEQ (LETT |r| (QCDR |ur|) . #1#)
                         (EXIT (CONS 0 (CONS (QCAR |r|) (- (QCDR |r|)))))))))))
          (#2# (CONS 1 "failed"))))
        (#2#
         (SEQ (LETT |r| (QCDR |ur|) . #1#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 37)
                           (QREFELT $ 46))
                 (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))
                (#2# (CONS 1 "failed")))))))))))) 

(DEFUN |POLYCATQ;isTimes;FU;8| (|f| $)
  (PROG (|d| |den| |l| #1=#:G200 |x| #2=#:G199 |t| |num|)
    (RETURN
     (SEQ
      (LETT |t|
            (SPADCALL
             (LETT |num| (SPADCALL |f| (QREFELT $ 11))
                   . #3=(|POLYCATQ;isTimes;FU;8|))
             (QREFELT $ 51))
            . #3#)
      (LETT |l|
            (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                  (#4='T
                   (CONS 0
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |x| NIL . #3#) (LETT #1# (QCDR |t|) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |x| (QREFELT $ 25)) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))))
            . #3#)
      (LETT |den| (SPADCALL |f| (QREFELT $ 12)) . #3#)
      (EXIT
       (COND ((SPADCALL |den| (|spadConstant| $ 37) (QREFELT $ 46)) |l|)
             ((SPADCALL |num| (|spadConstant| $ 37) (QREFELT $ 46))
              (CONS 1 "failed"))
             (#4#
              (SEQ
               (LETT |d|
                     (SPADCALL (SPADCALL |den| (QREFELT $ 25)) (QREFELT $ 52))
                     . #3#)
               (EXIT
                (COND
                 ((QEQCAR |l| 1)
                  (CONS 0 (LIST (SPADCALL |num| (QREFELT $ 25)) |d|)))
                 (#4#
                  (CONS 0 (SPADCALL (QCDR |l|) |d| (QREFELT $ 54)))))))))))))) 

(DEFUN |POLYCATQ;isPlus;FU;9| (|f| $)
  (PROG (#1=#:G212 |x| #2=#:G211 |s|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 37)
                  (QREFELT $ 38))
        (CONS 1 "failed"))
       (#3='T
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 57))
               . #4=(|POLYCATQ;isPlus;FU;9|))
         (EXIT
          (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                (#3#
                 (CONS 0
                       (PROGN
                        (LETT #2# NIL . #4#)
                        (SEQ (LETT |x| NIL . #4#) (LETT #1# (QCDR |s|) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |x| (QREFELT $ 25)) #2#)
                                     . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |POLYCATQ;mainVariable;FU;10| (|f| $)
  (PROG (|b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 60))
            . #1=(|POLYCATQ;mainVariable;FU;10|))
      (LETT |b| (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 60)) . #1#)
      (EXIT
       (COND ((QEQCAR |b| 1) |a|) ((QEQCAR |a| 1) |b|)
             ('T (CONS 0 (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT $ 61)))))))))) 

(DEFUN |POLYCATQ;P2UP| (|p| |x| $)
  (SPADCALL (ELT $ 25) (SPADCALL |p| |x| (QREFELT $ 64)) (QREFELT $ 68))) 

(DEFUN |PolynomialCategoryQuotientFunctions| (&REST #1=#:G219)
  (PROG ()
    (RETURN
     (PROG (#2=#:G220)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialCategoryQuotientFunctions|)
                                           '|domainEqualList|)
                . #3=(|PolynomialCategoryQuotientFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |PolynomialCategoryQuotientFunctions;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PolynomialCategoryQuotientFunctions|))))))))))) 

(DEFUN |PolynomialCategoryQuotientFunctions;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|PolynomialCategoryQuotientFunctions|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|PolynomialCategoryQuotientFunctions| DV$1 DV$2 DV$3 DV$4
                  DV$5)
            . #1#)
      (LETT $ (GETREFV 69) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialCategoryQuotientFunctions|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PolynomialCategoryQuotientFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |numer|)
              (5 . |denom|) (|SparseUnivariatePolynomial| 10) (|Fraction| 13)
              (10 . /) |POLYCATQ;univariate;FVF;1| (16 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 18 '"failed")
              (20 . |extendedEuclidean|) (27 . *) (33 . |rem|)
              |POLYCATQ;univariate;FV2Sup;2| (39 . |coerce|) (44 . |coerce|)
              (49 . |numer|) (54 . |elt|) (60 . |denom|) (65 . /)
              |POLYCATQ;multivariate;FVF;3| (|Boolean|) (71 . =) (77 . >)
              (|List| 7) (83 . |variables|) |POLYCATQ;variables;FL;5|
              (88 . |One|) (92 . ~=)
              (|Record| (|:| |var| 7) (|:| |exponent| (|NonNegativeInteger|)))
              (|Union| 39 '#1="failed") (98 . |isExpt|) (103 . |One|)
              (|Record| (|:| |val| 10) (|:| |exponent| (|Integer|)))
              (|Union| 43 '"failed") |POLYCATQ;isPower;FU;6| (107 . =)
              (|Record| (|:| |var| 7) (|:| |exponent| (|Integer|)))
              (|Union| 47 '"failed") |POLYCATQ;isExpt;FU;7|
              (|Union| (|List| $) '#1#) (113 . |isTimes|) (118 . |inv|)
              (|List| 10) (123 . |concat!|) (|Union| 53 '"failed")
              |POLYCATQ;isTimes;FU;8| (129 . |isPlus|) |POLYCATQ;isPlus;FU;9|
              (|Union| 7 '"failed") (134 . |mainVariable|) (139 . |max|)
              |POLYCATQ;mainVariable;FU;10| (|SparseUnivariatePolynomial| $)
              (145 . |univariate|) (|Mapping| 10 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 10) (151 . |map|))
           '#(|variables| 157 |univariate| 162 |multivariate| 175
              |mainVariable| 181 |isTimes| 186 |isPower| 191 |isPlus| 196
              |isExpt| 201)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 68
                                                 '(1 10 9 0 11 1 10 9 0 12 2 14
                                                   0 13 13 15 0 13 0 17 3 13 19
                                                   0 0 0 20 2 13 0 0 0 21 2 13
                                                   0 0 0 22 1 9 0 7 24 1 10 0 9
                                                   25 1 14 13 0 26 2 13 10 0 10
                                                   27 1 14 13 0 28 2 10 0 0 0
                                                   29 2 7 31 0 0 32 2 7 31 0 0
                                                   33 1 9 34 0 35 0 9 0 37 2 9
                                                   31 0 0 38 1 9 40 0 41 0 8 0
                                                   42 2 9 31 0 0 46 1 9 50 0 51
                                                   1 10 0 0 52 2 53 0 0 10 54 1
                                                   9 50 0 57 1 9 59 0 60 2 7 0
                                                   0 0 61 2 9 63 0 7 64 2 67 13
                                                   65 66 68 1 0 34 10 36 2 0 14
                                                   10 7 16 3 0 13 10 7 13 23 2
                                                   0 10 14 7 30 1 0 59 10 62 1
                                                   0 55 10 56 1 0 44 10 45 1 0
                                                   55 10 58 1 0 48 10 49)))))
           '|lookupComplete|)) 
