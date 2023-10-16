
(SDEFUN |MPRFF;factor;PRFF;1| ((|p| PRF) ($ |Factored| PRF))
        (SPROG
         ((#1=#:G115 NIL) (#2=#:G114 #3=(|Factored| PRF)) (#4=#:G116 #3#)
          (#5=#:G124 NIL) (|ff| NIL)
          (|ffact|
           (|List|
            (|Record| (|:| |irr| PRF) (|:| |pow| (|NonNegativeInteger|)))))
          (#6=#:G123 NIL) (#7=#:G122 NIL) (|fcont| (PRF)) (#8=#:G121 NIL)
          (|x| NIL) (#9=#:G120 NIL) (|u| NIL) (#10=#:G119 NIL)
          (|flist| (|Factored| (|Polynomial| R)))
          (|denp| (|Fraction| (|Polynomial| R))) (|nump| #11=(|Polynomial| R))
          (|tp| (|Record| (|:| |sup| #11#) (|:| |inf| (|Polynomial| R))))
          (|truelist| (|List| OV)))
         (SEQ
          (LETT |truelist| (SPADCALL |p| (QREFELT $ 11))
                . #12=(|MPRFF;factor;PRFF;1|))
          (LETT |tp| (SPADCALL |p| (QREFELT $ 13)) . #12#)
          (LETT |nump| (QCAR |tp|) . #12#)
          (LETT |denp|
                (SPADCALL (SPADCALL (QCDR |tp|) (QREFELT $ 16)) (QREFELT $ 17))
                . #12#)
          (COND
           ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|)))
            (LETT |flist| (SPADCALL |nump| (QREFELT $ 20)) . #12#))
           ((|HasCategory| (QREFELT $ 8) '(|FiniteFieldCategory|))
            (LETT |flist| (SPADCALL |nump| (QREFELT $ 22)) . #12#))
           ((|HasCategory| (QREFELT $ 8) '(|Field|)) (|error| "not done yet"))
           ((|HasCategory| (QREFELT $ 8) '(|CharacteristicZero|))
            (LETT |flist| (SPADCALL |nump| (QREFELT $ 24)) . #12#))
           (#13='T (|error| "can't happen")))
          (LETT |ffact|
                (PROGN
                 (LETT #10# NIL . #12#)
                 (SEQ (LETT |u| NIL . #12#)
                      (LETT #9# (SPADCALL |flist| (QREFELT $ 27)) . #12#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |u| (CAR #9#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (CONS
                                (SPADCALL (SPADCALL (QCAR |u|) (QREFELT $ 16))
                                          (QREFELT $ 28))
                                (QCDR |u|))
                               #10#)
                              . #12#)))
                      (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #12#)
          (LETT |fcont|
                (SPADCALL
                 (SPADCALL (SPADCALL |flist| (QREFELT $ 29)) (QREFELT $ 16))
                 (QREFELT $ 28))
                . #12#)
          (SEQ (LETT |x| NIL . #12#) (LETT #8# |truelist| . #12#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |x| (CAR #8#) . #12#) NIL))
                 (GO G191)))
               (SEQ (LETT |fcont| (SPADCALL |fcont| |x| (QREFELT $ 30)) . #12#)
                    (EXIT
                     (LETT |ffact|
                           (PROGN
                            (LETT #7# NIL . #12#)
                            (SEQ (LETT |ff| NIL . #12#)
                                 (LETT #6# |ffact| . #12#) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN
                                        (LETT |ff| (CAR #6#) . #12#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #7#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |ff|) |x|
                                                     (QREFELT $ 30))
                                           (QCDR |ff|))
                                          #7#)
                                         . #12#)))
                                 (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                                 (EXIT (NREVERSE #7#))))
                           . #12#)))
               (LETT #8# (CDR #8#) . #12#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |denp| |fcont| (QREFELT $ 31))
                     (PROGN
                      (LETT #1# NIL . #12#)
                      (SEQ (LETT |ff| NIL . #12#) (LETT #5# |ffact| . #12#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |ff| (CAR #5#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (SPADCALL (QCAR |ff|) (QCDR |ff|)
                                              (QREFELT $ 34))
                                    . #12#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 35))
                                      . #12#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #12#)
                                 (LETT #1# 'T . #12#)))))))
                           (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) (#13# (|spadConstant| $ 36))))
                     (QREFELT $ 37)))))) 

(SDEFUN |MPRFF;pushdown;PRFOVPRF;2| ((|g| PRF) (|x| OV) ($ PRF))
        (SPROG ((|ug| (|SparseUnivariatePolynomial| PRF)) (|rf| (PRF)))
               (SEQ
                (COND ((SPADCALL |g| (QREFELT $ 40)) |g|)
                      ('T
                       (SEQ
                        (LETT |rf| (|spadConstant| $ 41)
                              . #1=(|MPRFF;pushdown;PRFOVPRF;2|))
                        (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 43)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |ug| (|spadConstant| $ 47)
                                          (QREFELT $ 48)))
                               (GO G191)))
                             (SEQ
                              (LETT |rf|
                                    (SPADCALL |rf|
                                              (SPADCALL |ug| |x|
                                                        (QREFELT $ 49))
                                              (QREFELT $ 50))
                                    . #1#)
                              (EXIT
                               (LETT |ug| (SPADCALL |ug| (QREFELT $ 51))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |rf|))))))) 

(SDEFUN |MPRFF;pushdterm;SupOVPRF;3|
        ((|t| |SparseUnivariatePolynomial| PRF) (|x| OV) ($ PRF))
        (SPROG
         ((|cf| (|Fraction| (|Polynomial| R))) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |t| (QREFELT $ 53))
                . #1=(|MPRFF;pushdterm;SupOVPRF;3|))
          (LETT |cf|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 58) (SPADCALL |x| (QREFELT $ 57))
                           |n| (QREFELT $ 59))
                 (QREFELT $ 16))
                . #1#)
          (EXIT (SPADCALL |cf| (SPADCALL |t| (QREFELT $ 60)) (QREFELT $ 31)))))) 

(SDEFUN |MPRFF;pushup;PRFOVPRF;4| ((|f| PRF) (|x| OV) ($ PRF))
        (SPROG
         ((|g| (|SparseUnivariatePolynomial| PRF)) (|v| (OV)) (#1=#:G133 NIL))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 40))
            (SPADCALL (SPADCALL |f| (QREFELT $ 61)) |x| (QREFELT $ 62)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2
                       (LETT #1# (SPADCALL |f| (QREFELT $ 64))
                             . #2=(|MPRFF;pushup;PRFOVPRF;4|))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) "failed") #1#))
                   . #2#)
             (LETT |g| (SPADCALL |f| |v| (QREFELT $ 43)) . #2#)
             (EXIT
              (SPADCALL
               (SPADCALL (CONS #'|MPRFF;pushup;PRFOVPRF;4!0| (VECTOR $ |x|))
                         |g| (QREFELT $ 66))
               |v| (QREFELT $ 67))))))))) 

(SDEFUN |MPRFF;pushup;PRFOVPRF;4!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|MPRFF;pushup;PRFOVPRF;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |y| |x| (QREFELT $ 30)))))) 

(SDEFUN |MPRFF;pushuconst;FOVPRF;5|
        ((|r| |Fraction| (|Polynomial| R)) (|x| OV) ($ PRF))
        (SPROG ((|xs| (|Symbol|)))
               (SEQ
                (LETT |xs| (SPADCALL |x| (QREFELT $ 57))
                      |MPRFF;pushuconst;FOVPRF;5|)
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL (SPADCALL |r| (QREFELT $ 68)) |xs|
                              (QREFELT $ 69))
                    0 (QREFELT $ 70))
                   (|error| "bad polynomial form"))
                  ('T
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |r| (QREFELT $ 68)) (QREFELT $ 16))
                     (QREFELT $ 17))
                    (SPADCALL
                     (SPADCALL (SPADCALL |r| (QREFELT $ 71)) |xs|
                               (QREFELT $ 72))
                     |x| (QREFELT $ 74))
                    (QREFELT $ 31)))))))) 

(SDEFUN |MPRFF;pushucoef;SupOVPRF;6|
        ((|c| |SparseUnivariatePolynomial| (|Polynomial| R)) (|x| OV) ($ PRF))
        (COND
         ((SPADCALL |c| (|spadConstant| $ 75) (QREFELT $ 76))
          (|spadConstant| $ 41))
         ('T
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 77)) (QREFELT $ 16))
                      (QREFELT $ 28))
            |x| (SPADCALL |c| (QREFELT $ 78)) (QREFELT $ 79))
           (SPADCALL (SPADCALL |c| (QREFELT $ 80)) |x| (QREFELT $ 74))
           (QREFELT $ 50))))) 

(SDEFUN |MPRFF;totalfract;PRFR;7|
        ((|p| PRF)
         ($ |Record| (|:| |sup| (|Polynomial| R))
          (|:| |inf| (|Polynomial| R))))
        (SPROG ((|g| (|Fraction| (|Polynomial| R))) (#1=#:G151 NIL) (|x| NIL))
               (SEQ
                (COND
                 ((SPADCALL |p| (|spadConstant| $ 41) (QREFELT $ 81))
                  (CONS (|spadConstant| $ 82) (|spadConstant| $ 58)))
                 ('T
                  (SEQ
                   (SEQ (LETT |x| NIL . #2=(|MPRFF;totalfract;PRFR;7|))
                        (LETT #1# (SPADCALL |p| (QREFELT $ 11)) . #2#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |p| (SPADCALL |p| |x| (QREFELT $ 52)) . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (LETT |g| (SPADCALL |p| (QREFELT $ 61)) . #2#)
                   (EXIT
                    (CONS (SPADCALL |g| (QREFELT $ 71))
                          (SPADCALL |g| (QREFELT $ 68)))))))))) 

(DECLAIM (NOTINLINE |MPolyCatRationalFunctionFactorizer;|)) 

(DEFUN |MPolyCatRationalFunctionFactorizer| (&REST #1=#:G152)
  (SPROG NIL
         (PROG (#2=#:G153)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MPolyCatRationalFunctionFactorizer|)
                                               '|domainEqualList|)
                    . #3=(|MPolyCatRationalFunctionFactorizer|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |MPolyCatRationalFunctionFactorizer;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|MPolyCatRationalFunctionFactorizer|)))))))))) 

(DEFUN |MPolyCatRationalFunctionFactorizer;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MPolyCatRationalFunctionFactorizer|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$|
          (LIST '|MPolyCatRationalFunctionFactorizer| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 83) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|MPolyCatRationalFunctionFactorizer|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MPolyCatRationalFunctionFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 7) (0 . |variables|)
              (|Record| (|:| |sup| 14) (|:| |inf| 14))
              |MPRFF;totalfract;PRFR;7| (|Polynomial| 8) (|Fraction| 14)
              (5 . |coerce|) (10 . |inv|) (|Factored| 14)
              (|MRationalFactorize| (|IndexedExponents| 56) 56 (|Integer|) 14)
              (15 . |factor|)
              (|MultFiniteFactorize| 56 (|IndexedExponents| 56) 8 14)
              (20 . |factor|)
              (|MultivariateFactorize| 56 (|IndexedExponents| 56) 8 14)
              (25 . |factor|) (|Record| (|:| |factor| 14) (|:| |exponent| 32))
              (|List| 25) (30 . |factors|) (35 . |coerce|) (40 . |unit|)
              |MPRFF;pushup;PRFOVPRF;4| (45 . *) (|NonNegativeInteger|)
              (|Factored| 9) (51 . |primeFactor|) (57 . *) (63 . |One|)
              (67 . *) |MPRFF;factor;PRFF;1| (|Boolean|) (73 . |ground?|)
              (78 . |Zero|) (|SparseUnivariatePolynomial| $)
              (82 . |univariate|) (88 . |Zero|) (92 . |Zero|)
              (|SparseUnivariatePolynomial| 9) (96 . |Zero|) (100 . ~=)
              |MPRFF;pushdterm;SupOVPRF;3| (106 . +) (112 . |reductum|)
              |MPRFF;pushdown;PRFOVPRF;2| (117 . |degree|) (122 . |One|)
              (126 . |One|) (|Symbol|) (130 . |convert|) (135 . |One|)
              (139 . |monomial|) (146 . |leadingCoefficient|) (151 . |retract|)
              |MPRFF;pushuconst;FOVPRF;5| (|Union| 7 '"failed")
              (156 . |mainVariable|) (|Mapping| 9 9) (161 . |map|)
              (167 . |multivariate|) (173 . |denom|) (178 . |degree|) (184 . >)
              (190 . |numer|) (195 . |univariate|)
              (|SparseUnivariatePolynomial| 14) |MPRFF;pushucoef;SupOVPRF;6|
              (201 . |Zero|) (205 . =) (211 . |leadingCoefficient|)
              (216 . |degree|) (221 . |monomial|) (228 . |reductum|) (233 . =)
              (239 . |Zero|))
           '#(|totalfract| 243 |pushup| 248 |pushuconst| 254 |pushucoef| 260
              |pushdterm| 266 |pushdown| 272 |factor| 278)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 82
                                                 '(1 9 10 0 11 1 15 0 14 16 1
                                                   15 0 0 17 1 19 18 14 20 1 21
                                                   18 14 22 1 23 18 14 24 1 18
                                                   26 0 27 1 9 0 15 28 1 18 14
                                                   0 29 2 9 0 15 0 31 2 33 0 9
                                                   32 34 2 33 0 0 0 35 0 33 0
                                                   36 2 33 0 9 0 37 1 9 39 0 40
                                                   0 9 0 41 2 9 42 0 7 43 0 6 0
                                                   44 0 8 0 45 0 46 0 47 2 46
                                                   39 0 0 48 2 9 0 0 0 50 1 46
                                                   0 0 51 1 46 32 0 53 0 8 0 54
                                                   0 9 0 55 1 7 56 0 57 0 14 0
                                                   58 3 14 0 0 56 32 59 1 46 9
                                                   0 60 1 9 15 0 61 1 9 63 0 64
                                                   2 46 0 65 0 66 2 9 0 42 7 67
                                                   1 15 14 0 68 2 14 32 0 56 69
                                                   2 32 39 0 0 70 1 15 14 0 71
                                                   2 14 42 0 56 72 0 73 0 75 2
                                                   73 39 0 0 76 1 73 14 0 77 1
                                                   73 32 0 78 3 9 0 0 7 32 79 1
                                                   73 0 0 80 2 9 39 0 0 81 0 14
                                                   0 82 1 0 12 9 13 2 0 9 9 7
                                                   30 2 0 9 15 7 62 2 0 9 73 7
                                                   74 2 0 9 46 7 49 2 0 9 9 7
                                                   52 1 0 33 9 38)))))
           '|lookupComplete|)) 
