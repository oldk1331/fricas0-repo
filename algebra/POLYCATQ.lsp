
(/VERSIONCHECK 2) 

(DEFUN |POLYCATQ;univariate;FVF;1| (|f| |x| $)
  (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
            (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
            (QREFELT $ 15))) 

(DEFUN |POLYCATQ;univ_root| (|f| |x| |a| |k| |modulus| $)
  (PROG (|nd| |cofact| |cf2| #1=#:G141 |ndu| |nd1| |cf1| |c0| |c1| |c2| |df|
         |nf|)
    (RETURN
     (SEQ
      (LETT |nf|
            (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
                      |modulus| (QREFELT $ 20))
            . #2=(|POLYCATQ;univ_root|))
      (LETT |df|
            (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
                      |modulus| (QREFELT $ 20))
            . #2#)
      (LETT |cofact|
            (COND
             ((EQL |k| 2)
              (SPADCALL |df| (QREFELT $ 19)
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 21) (QREFELT $ 22)) 1
                         (QREFELT $ 24))
                        (QREFELT $ 25)))
             ((EQL |k| 3)
              (SEQ (LETT |c2| (SPADCALL |df| 2 (QREFELT $ 26)) . #2#)
                   (LETT |c1| (SPADCALL |df| 1 (QREFELT $ 26)) . #2#)
                   (LETT |c0| (SPADCALL |df| 0 (QREFELT $ 26)) . #2#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |c0| 2 (QREFELT $ 32))
                                 (SPADCALL (SPADCALL |c2| |c1| (QREFELT $ 33))
                                           |a| (QREFELT $ 33))
                                 (QREFELT $ 34))
                       (QREFELT $ 35))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |c2| 2 (QREFELT $ 32)) |a|
                                  (QREFELT $ 33))
                        (SPADCALL |c0| |c1| (QREFELT $ 33)) (QREFELT $ 34))
                       1 (QREFELT $ 24))
                      (QREFELT $ 36))
                     (SPADCALL
                      (SPADCALL (SPADCALL |c1| 2 (QREFELT $ 32))
                                (SPADCALL |c0| |c2| (QREFELT $ 33))
                                (QREFELT $ 34))
                      2 (QREFELT $ 24))
                     (QREFELT $ 36)))))
             ((EQL |k| 4)
              (SEQ
               (LETT |cf1|
                     (SPADCALL |df| (QREFELT $ 19)
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 21) (QREFELT $ 22))
                                1 (QREFELT $ 24))
                               (QREFELT $ 25))
                     . #2#)
               (LETT |nd1| (SPADCALL |df| |cf1| (QREFELT $ 37)) . #2#)
               (LETT |ndu| (SPADCALL |nd1| 2 (QREFELT $ 39)) . #2#)
               (LETT |cf2|
                     (SPADCALL
                      (PROG2 (LETT #1# |ndu| . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 10))
                                       #1#))
                      (QREFELT $ 19)
                      (SPADCALL (SPADCALL (|spadConstant| $ 21) (QREFELT $ 22))
                                2 (QREFELT $ 24))
                      (QREFELT $ 25))
                     . #2#)
               (EXIT (SPADCALL |cf1| |cf2| (QREFELT $ 37))))))
            . #2#)
      (LETT |nd|
            (SPADCALL
             (SPADCALL (SPADCALL |df| |cofact| (QREFELT $ 37)) |modulus|
                       (QREFELT $ 20))
             (QREFELT $ 40))
            . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |nf| |cofact| (QREFELT $ 37)) |modulus|
                  (QREFELT $ 20))
        |nd| (QREFELT $ 41))))))) 

(DEFUN |POLYCATQ;univariate;FV2Sup;3| (|f| |x| |modulus| $)
  (PROG (|bc| |m0|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |modulus| (QREFELT $ 42)) 4 (QREFELT $ 44))
        (COND
         ((SPADCALL
           (LETT |m0| (SPADCALL |modulus| (QREFELT $ 45))
                 . #1=(|POLYCATQ;univariate;FV2Sup;3|))
           (QREFELT $ 46))
          (EXIT
           (|POLYCATQ;univ_root| |f| |x|
            (SPADCALL
             (SPADCALL (SPADCALL |m0| (QREFELT $ 47))
                       (SPADCALL |modulus| (QREFELT $ 48)) (QREFELT $ 49))
             (QREFELT $ 22))
            (SPADCALL |modulus| (QREFELT $ 42)) |modulus| $))))))
      (LETT |bc|
            (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 12)) |x| $)
                      |modulus| (|spadConstant| $ 50) (QREFELT $ 53))
            . #1#)
      (EXIT
       (COND ((QEQCAR |bc| 1) (|error| "univariate: denominator is 0 mod p"))
             ('T
              (SPADCALL
               (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT $ 11)) |x| $)
                         (QCAR (QCDR |bc|)) (QREFELT $ 37))
               |modulus| (QREFELT $ 20))))))))) 

(DEFUN |POLYCATQ;multivariate;FVF;4| (|f| |x| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |x| (QREFELT $ 55)) (QREFELT $ 56))
            |POLYCATQ;multivariate;FVF;4|)
      (EXIT
       (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 57)) |v| (QREFELT $ 58))
                 (SPADCALL (SPADCALL |f| (QREFELT $ 59)) |v| (QREFELT $ 58))
                 (QREFELT $ 49))))))) 

(DEFUN |POLYCATQ;mymerge| (|l| |m| $)
  (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
        ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 61))
         (CONS (|SPADfirst| |l|) (|POLYCATQ;mymerge| (CDR |l|) (CDR |m|) $)))
        ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 62))
         (CONS (|SPADfirst| |l|) (|POLYCATQ;mymerge| (CDR |l|) |m| $)))
        ('T (CONS (|SPADfirst| |m|) (|POLYCATQ;mymerge| |l| (CDR |m|) $))))) 

(DEFUN |POLYCATQ;variables;FL;6| (|f| $)
  (|POLYCATQ;mymerge| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 64))
   (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 64)) $)) 

(DEFUN |POLYCATQ;isPower;FU;7| (|f| $)
  (PROG (|r| |ur| |den|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |den| (SPADCALL |f| (QREFELT $ 12))
               . #1=(|POLYCATQ;isPower;FU;7|))
         (|spadConstant| $ 28) (QREFELT $ 66))
        (COND
         ((SPADCALL (SPADCALL |f| (QREFELT $ 11)) (|spadConstant| $ 28)
                    (QREFELT $ 66))
          (CONS 1 "failed"))
         (#2='T
          (SEQ (LETT |ur| (SPADCALL |den| (QREFELT $ 69)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |ur| 1)
                  (CONS 0 (CONS (SPADCALL |den| (QREFELT $ 56)) -1)))
                 (#2#
                  (SEQ (LETT |r| (QCDR |ur|) . #1#)
                       (EXIT
                        (CONS 0
                              (CONS
                               (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 55))
                                         (QREFELT $ 56))
                               (- (QCDR |r|)))))))))))))
       (#2#
        (SEQ
         (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 69))
               . #1#)
         (EXIT
          (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                (#2#
                 (SEQ (LETT |r| (QCDR |ur|) . #1#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 55))
                                        (QREFELT $ 56))
                              (QCDR |r|))))))))))))))) 

(DEFUN |POLYCATQ;isExpt;FU;8| (|f| $)
  (PROG (|r| |ur|)
    (RETURN
     (SEQ
      (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 69))
            . #1=(|POLYCATQ;isExpt;FU;8|))
      (EXIT
       (COND
        ((QEQCAR |ur| 1)
         (COND
          ((SPADCALL (SPADCALL |f| (QREFELT $ 11)) (|spadConstant| $ 28)
                     (QREFELT $ 73))
           (SEQ
            (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 69))
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
                ((SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 28)
                           (QREFELT $ 73))
                 (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))
                (#2# (CONS 1 "failed")))))))))))) 

(DEFUN |POLYCATQ;isTimes;FU;9| (|f| $)
  (PROG (|d| |den| |l| #1=#:G213 |x| #2=#:G212 |t| |num|)
    (RETURN
     (SEQ
      (LETT |t|
            (SPADCALL
             (LETT |num| (SPADCALL |f| (QREFELT $ 11))
                   . #3=(|POLYCATQ;isTimes;FU;9|))
             (QREFELT $ 78))
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
                                       (CONS (SPADCALL |x| (QREFELT $ 56)) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))))
            . #3#)
      (LETT |den| (SPADCALL |f| (QREFELT $ 12)) . #3#)
      (EXIT
       (COND ((SPADCALL |den| (|spadConstant| $ 28) (QREFELT $ 73)) |l|)
             ((SPADCALL |num| (|spadConstant| $ 28) (QREFELT $ 73))
              (CONS 1 "failed"))
             (#4#
              (SEQ
               (LETT |d|
                     (SPADCALL (SPADCALL |den| (QREFELT $ 56)) (QREFELT $ 79))
                     . #3#)
               (EXIT
                (COND
                 ((QEQCAR |l| 1)
                  (CONS 0 (LIST (SPADCALL |num| (QREFELT $ 56)) |d|)))
                 (#4#
                  (CONS 0 (SPADCALL (QCDR |l|) |d| (QREFELT $ 81)))))))))))))) 

(DEFUN |POLYCATQ;isPlus;FU;10| (|f| $)
  (PROG (#1=#:G225 |x| #2=#:G224 |s|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 28)
                  (QREFELT $ 66))
        (CONS 1 "failed"))
       (#3='T
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 84))
               . #4=(|POLYCATQ;isPlus;FU;10|))
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
                                     (CONS (SPADCALL |x| (QREFELT $ 56)) #2#)
                                     . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |POLYCATQ;mainVariable;FU;11| (|f| $)
  (PROG (|b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |f| (QREFELT $ 11)) (QREFELT $ 87))
            . #1=(|POLYCATQ;mainVariable;FU;11|))
      (LETT |b| (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 87)) . #1#)
      (EXIT
       (COND ((QEQCAR |b| 1) |a|) ((QEQCAR |a| 1) |b|)
             ('T (CONS 0 (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT $ 88)))))))))) 

(DEFUN |POLYCATQ;P2UP| (|p| |x| $)
  (SPADCALL (ELT $ 56) (SPADCALL |p| |x| (QREFELT $ 91)) (QREFELT $ 95))) 

(DEFUN |PolynomialCategoryQuotientFunctions| (&REST #1=#:G232)
  (PROG ()
    (RETURN
     (PROG (#2=#:G233)
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
      (LETT $ (GETREFV 96) . #1#)
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
      (QSETREFV $ 19 (SPADCALL (QREFELT $ 18)))
      $)))) 

(MAKEPROP '|PolynomialCategoryQuotientFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |numer|)
              (5 . |denom|) (|SparseUnivariatePolynomial| 10) (|Fraction| 13)
              (10 . /) |POLYCATQ;univariate;FVF;1| (|SingletonAsOrderedSet|)
              (16 . |create|) '|dummys| (20 . |rem|) (26 . |One|) (30 . -)
              (|NonNegativeInteger|) (35 . |monomial|) (41 . |eval|)
              (48 . |coefficient|) (54 . |One|) (58 . |One|) (62 . |Zero|)
              (66 . |Zero|) (|PositiveInteger|) (70 . ^) (76 . *) (82 . -)
              (88 . |coerce|) (93 . +) (99 . *) (|Union| $ '"failed")
              (105 . |divideExponents|) (111 . |retract|) (116 . /)
              (122 . |degree|) (|Boolean|) (127 . <=) (133 . |reductum|)
              (138 . |ground?|) (143 . |ground|) (148 . |leadingCoefficient|)
              (153 . /) (159 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 51 '"failed")
              (163 . |extendedEuclidean|) |POLYCATQ;univariate;FV2Sup;3|
              (170 . |coerce|) (175 . |coerce|) (180 . |numer|) (185 . |elt|)
              (191 . |denom|) |POLYCATQ;multivariate;FVF;4| (196 . =) (202 . >)
              (|List| 7) (208 . |variables|) |POLYCATQ;variables;FL;6|
              (213 . ~=) (|Record| (|:| |var| 7) (|:| |exponent| 23))
              (|Union| 67 '#1="failed") (219 . |isExpt|)
              (|Record| (|:| |val| 10) (|:| |exponent| (|Integer|)))
              (|Union| 70 '"failed") |POLYCATQ;isPower;FU;7| (224 . =)
              (|Record| (|:| |var| 7) (|:| |exponent| (|Integer|)))
              (|Union| 74 '"failed") |POLYCATQ;isExpt;FU;8|
              (|Union| (|List| $) '#1#) (230 . |isTimes|) (235 . |inv|)
              (|List| 10) (240 . |concat!|) (|Union| 80 '"failed")
              |POLYCATQ;isTimes;FU;9| (246 . |isPlus|) |POLYCATQ;isPlus;FU;10|
              (|Union| 7 '"failed") (251 . |mainVariable|) (256 . |max|)
              |POLYCATQ;mainVariable;FU;11| (|SparseUnivariatePolynomial| $)
              (262 . |univariate|) (|Mapping| 10 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 10) (268 . |map|))
           '#(|variables| 274 |univariate| 279 |multivariate| 292
              |mainVariable| 298 |isTimes| 303 |isPower| 308 |isPlus| 313
              |isExpt| 318)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 95
                                                 '(1 10 9 0 11 1 10 9 0 12 2 14
                                                   0 13 13 15 0 17 0 18 2 13 0
                                                   0 0 20 0 10 0 21 1 10 0 0 22
                                                   2 13 0 10 23 24 3 13 0 0 17
                                                   0 25 2 13 10 0 23 26 0 8 0
                                                   27 0 9 0 28 0 6 0 29 0 8 0
                                                   30 2 10 0 0 31 32 2 10 0 0 0
                                                   33 2 10 0 0 0 34 1 13 0 10
                                                   35 2 13 0 0 0 36 2 13 0 0 0
                                                   37 2 13 38 0 23 39 1 13 10 0
                                                   40 2 13 0 0 10 41 1 13 23 0
                                                   42 2 23 43 0 0 44 1 13 0 0
                                                   45 1 13 43 0 46 1 13 10 0 47
                                                   1 13 10 0 48 2 10 0 0 0 49 0
                                                   13 0 50 3 13 52 0 0 0 53 1 9
                                                   0 7 55 1 10 0 9 56 1 14 13 0
                                                   57 2 13 10 0 10 58 1 14 13 0
                                                   59 2 7 43 0 0 61 2 7 43 0 0
                                                   62 1 9 63 0 64 2 9 43 0 0 66
                                                   1 9 68 0 69 2 9 43 0 0 73 1
                                                   9 77 0 78 1 10 0 0 79 2 80 0
                                                   0 10 81 1 9 77 0 84 1 9 86 0
                                                   87 2 7 0 0 0 88 2 9 90 0 7
                                                   91 2 94 13 92 93 95 1 0 63
                                                   10 65 2 0 14 10 7 16 3 0 13
                                                   10 7 13 54 2 0 10 14 7 60 1
                                                   0 86 10 89 1 0 82 10 83 1 0
                                                   71 10 72 1 0 82 10 85 1 0 75
                                                   10 76)))))
           '|lookupComplete|)) 
