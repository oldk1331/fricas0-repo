
(/VERSIONCHECK 2) 

(DEFUN |MPRFF;factor;PRFF;1| (|p| $)
  (PROG (#1=#:G136 #2=#:G135 #3=#:G137 #4=#:G145 |ff| |ffact| #5=#:G144
         #6=#:G143 |fcont| #7=#:G142 |x| #8=#:G141 |u| #9=#:G140 |flist| |denp|
         |nump| |tp| |truelist|)
    (RETURN
     (SEQ
      (LETT |truelist| (SPADCALL |p| (QREFELT $ 11))
            . #10=(|MPRFF;factor;PRFF;1|))
      (LETT |tp| (SPADCALL |p| (QREFELT $ 13)) . #10#)
      (LETT |nump| (QCAR |tp|) . #10#)
      (LETT |denp|
            (SPADCALL (SPADCALL (QCDR |tp|) (QREFELT $ 16)) (QREFELT $ 17))
            . #10#)
      (COND
       ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|)))
        (LETT |flist| (SPADCALL |nump| (QREFELT $ 20)) . #10#))
       ((|HasCategory| (QREFELT $ 8) '(|FiniteFieldCategory|))
        (LETT |flist| (SPADCALL |nump| (QREFELT $ 22)) . #10#))
       ((|HasCategory| (QREFELT $ 8) '(|Field|)) (|error| "not done yet"))
       ((|HasCategory| (QREFELT $ 8) '(|CharacteristicZero|))
        (LETT |flist| (SPADCALL |nump| (QREFELT $ 24)) . #10#))
       (#11='T (|error| "can't happen")))
      (LETT |ffact|
            (PROGN
             (LETT #9# NIL . #10#)
             (SEQ (LETT |u| NIL . #10#)
                  (LETT #8# (SPADCALL |flist| (QREFELT $ 27)) . #10#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |u| (CAR #8#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #9#
                          (CONS
                           (CONS
                            (SPADCALL (SPADCALL (QCAR |u|) (QREFELT $ 16))
                                      (QREFELT $ 28))
                            (QCDR |u|))
                           #9#)
                          . #10#)))
                  (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #9#))))
            . #10#)
      (LETT |fcont|
            (SPADCALL
             (SPADCALL (SPADCALL |flist| (QREFELT $ 29)) (QREFELT $ 16))
             (QREFELT $ 28))
            . #10#)
      (SEQ (LETT |x| NIL . #10#) (LETT #7# |truelist| . #10#) G190
           (COND
            ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #10#) NIL))
             (GO G191)))
           (SEQ (LETT |fcont| (SPADCALL |fcont| |x| (QREFELT $ 30)) . #10#)
                (EXIT
                 (LETT |ffact|
                       (PROGN
                        (LETT #6# NIL . #10#)
                        (SEQ (LETT |ff| NIL . #10#) (LETT #5# |ffact| . #10#)
                             G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |ff| (CAR #5#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #6#
                                     (CONS
                                      (CONS
                                       (SPADCALL (QCAR |ff|) |x|
                                                 (QREFELT $ 30))
                                       (QCDR |ff|))
                                      #6#)
                                     . #10#)))
                             (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                             (EXIT (NREVERSE #6#))))
                       . #10#)))
           (LETT #7# (CDR #7#) . #10#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (SPADCALL |denp| |fcont| (QREFELT $ 31))
                 (PROGN
                  (LETT #1# NIL . #10#)
                  (SEQ (LETT |ff| NIL . #10#) (LETT #4# |ffact| . #10#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |ff| (CAR #4#) . #10#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (SPADCALL (QCAR |ff|) (QCDR |ff|)
                                          (QREFELT $ 34))
                                . #10#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 35))
                                  . #10#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #10#)
                             (LETT #1# 'T . #10#)))))))
                       (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#11# (|spadConstant| $ 36))))
                 (QREFELT $ 37))))))) 

(DEFUN |MPRFF;pushdown;PRFOVPRF;2| (|g| |x| $)
  (PROG (|ug| |rf|)
    (RETURN
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
                      (SPADCALL |ug| (|spadConstant| $ 47) (QREFELT $ 48)))
                     (GO G191)))
                   (SEQ
                    (LETT |rf|
                          (SPADCALL |rf| (SPADCALL |ug| |x| (QREFELT $ 49))
                                    (QREFELT $ 50))
                          . #1#)
                    (EXIT (LETT |ug| (SPADCALL |ug| (QREFELT $ 51)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |rf|)))))))) 

(DEFUN |MPRFF;pushdterm;SupOVPRF;3| (|t| |x| $)
  (PROG (|cf| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |t| (QREFELT $ 54))
            . #1=(|MPRFF;pushdterm;SupOVPRF;3|))
      (LETT |cf|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 59) (SPADCALL |x| (QREFELT $ 58)) |n|
                       (QREFELT $ 60))
             (QREFELT $ 16))
            . #1#)
      (EXIT (SPADCALL |cf| (SPADCALL |t| (QREFELT $ 61)) (QREFELT $ 31))))))) 

(DEFUN |MPRFF;pushup;PRFOVPRF;4| (|f| |x| $)
  (PROG (|g| |v| #1=#:G154)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 40))
        (SPADCALL (SPADCALL |f| (QREFELT $ 62)) |x| (QREFELT $ 63)))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #1# (SPADCALL |f| (QREFELT $ 65))
                         . #2=(|MPRFF;pushup;PRFOVPRF;4|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
               . #2#)
         (LETT |g| (SPADCALL |f| |v| (QREFELT $ 43)) . #2#)
         (EXIT
          (SPADCALL
           (SPADCALL (CONS #'|MPRFF;pushup;PRFOVPRF;4!0| (VECTOR $ |x|)) |g|
                     (QREFELT $ 67))
           |v| (QREFELT $ 68)))))))))) 

(DEFUN |MPRFF;pushup;PRFOVPRF;4!0| (|y| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|MPRFF;pushup;PRFOVPRF;4|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |x| (QREFELT $ 30)))))) 

(DEFUN |MPRFF;pushuconst;FOVPRF;5| (|r| |x| $)
  (PROG (|xs|)
    (RETURN
     (SEQ (LETT |xs| (SPADCALL |x| (QREFELT $ 58)) |MPRFF;pushuconst;FOVPRF;5|)
          (EXIT
           (COND
            ((SPADCALL
              (SPADCALL (SPADCALL |r| (QREFELT $ 69)) |xs| (QREFELT $ 70)) 0
              (QREFELT $ 71))
             (|error| "bad polynomial form"))
            ('T
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 69)) (QREFELT $ 16))
                        (QREFELT $ 17))
              (SPADCALL
               (SPADCALL (SPADCALL |r| (QREFELT $ 72)) |xs| (QREFELT $ 73)) |x|
               (QREFELT $ 75))
              (QREFELT $ 31))))))))) 

(DEFUN |MPRFF;pushucoef;SupOVPRF;6| (|c| |x| $)
  (COND
   ((SPADCALL |c| (|spadConstant| $ 76) (QREFELT $ 77)) (|spadConstant| $ 41))
   ('T
    (SPADCALL
     (SPADCALL
      (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 78)) (QREFELT $ 16))
                (QREFELT $ 28))
      |x| (SPADCALL |c| (QREFELT $ 79)) (QREFELT $ 80))
     (SPADCALL (SPADCALL |c| (QREFELT $ 81)) |x| (QREFELT $ 75))
     (QREFELT $ 50))))) 

(DEFUN |MPRFF;totalfract;PRFR;7| (|p| $)
  (PROG (|g| #1=#:G172 |x|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (|spadConstant| $ 41) (QREFELT $ 82))
        (CONS (|spadConstant| $ 83) (|spadConstant| $ 59)))
       ('T
        (SEQ
         (SEQ (LETT |x| NIL . #2=(|MPRFF;totalfract;PRFR;7|))
              (LETT #1# (SPADCALL |p| (QREFELT $ 11)) . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ (EXIT (LETT |p| (SPADCALL |p| |x| (QREFELT $ 52)) . #2#)))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (LETT |g| (SPADCALL |p| (QREFELT $ 62)) . #2#)
         (EXIT
          (CONS (SPADCALL |g| (QREFELT $ 72))
                (SPADCALL |g| (QREFELT $ 69))))))))))) 

(DEFUN |MPolyCatRationalFunctionFactorizer| (&REST #1=#:G173)
  (PROG ()
    (RETURN
     (PROG (#2=#:G174)
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
                    '|MPolyCatRationalFunctionFactorizer|))))))))))) 

(DEFUN |MPolyCatRationalFunctionFactorizer;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|MPolyCatRationalFunctionFactorizer|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|MPolyCatRationalFunctionFactorizer| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 84) . #1#)
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
      $)))) 

(MAKEPROP '|MPolyCatRationalFunctionFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 7) (0 . |variables|)
              (|Record| (|:| |sup| 14) (|:| |inf| 14))
              |MPRFF;totalfract;PRFR;7| (|Polynomial| 8) (|Fraction| 14)
              (5 . |coerce|) (10 . |inv|) (|Factored| 14)
              (|MRationalFactorize| (|IndexedExponents| 57) 57 32 14)
              (15 . |factor|)
              (|MultFiniteFactorize| 57 (|IndexedExponents| 57) 8 14)
              (20 . |factor|)
              (|MultivariateFactorize| 57 (|IndexedExponents| 57) 8 14)
              (25 . |factor|) (|Record| (|:| |factor| 14) (|:| |exponent| 32))
              (|List| 25) (30 . |factors|) (35 . |coerce|) (40 . |unit|)
              |MPRFF;pushup;PRFOVPRF;4| (45 . *) (|Integer|) (|Factored| 9)
              (51 . |primeFactor|) (57 . *) (63 . |One|) (67 . *)
              |MPRFF;factor;PRFF;1| (|Boolean|) (73 . |ground?|) (78 . |Zero|)
              (|SparseUnivariatePolynomial| $) (82 . |univariate|)
              (88 . |Zero|) (92 . |Zero|) (|SparseUnivariatePolynomial| 9)
              (96 . |Zero|) (100 . ~=) |MPRFF;pushdterm;SupOVPRF;3| (106 . +)
              (112 . |reductum|) |MPRFF;pushdown;PRFOVPRF;2|
              (|NonNegativeInteger|) (117 . |degree|) (122 . |One|)
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
                             (|makeByteWordVec2| 83
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
                                                   0 0 51 1 46 53 0 54 0 8 0 55
                                                   0 9 0 56 1 7 57 0 58 0 14 0
                                                   59 3 14 0 0 57 53 60 1 46 9
                                                   0 61 1 9 15 0 62 1 9 64 0 65
                                                   2 46 0 66 0 67 2 9 0 42 7 68
                                                   1 15 14 0 69 2 14 53 0 57 70
                                                   2 53 39 0 0 71 1 15 14 0 72
                                                   2 14 42 0 57 73 0 74 0 76 2
                                                   74 39 0 0 77 1 74 14 0 78 1
                                                   74 53 0 79 3 9 0 0 7 53 80 1
                                                   74 0 0 81 2 9 39 0 0 82 0 14
                                                   0 83 1 0 12 9 13 2 0 9 9 7
                                                   30 2 0 9 15 7 63 2 0 9 74 7
                                                   75 2 0 9 46 7 49 2 0 9 9 7
                                                   52 1 0 33 9 38)))))
           '|lookupComplete|)) 
