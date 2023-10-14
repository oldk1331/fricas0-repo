
(/VERSIONCHECK 2) 

(DEFUN |MRATFAC;numer1| (|c| $)
  (SPADCALL (SPADCALL |c| (QREFELT $ 11)) (QREFELT $ 13))) 

(DEFUN |MRATFAC;numer2| (|pol| $)
  (SPADCALL (ELT $ 14) (CONS (|function| |MRATFAC;numer1|) $) |pol|
            (QREFELT $ 18))) 

(DEFUN |MRATFAC;coerce1| (|d| $)
  (SPADCALL (SPADCALL |d| (QREFELT $ 19)) (QREFELT $ 20))) 

(DEFUN |MRATFAC;coerce2| (|pp| $)
  (SPADCALL (ELT $ 21) (CONS (|function| |MRATFAC;coerce1|) $) |pp|
            (QREFELT $ 25))) 

(DEFUN |MRATFAC;factor;PF;5| (|p| $)
  (PROG (#1=#:G144 #2=#:G143 #3=#:G145 #4=#:G152 |u| |ffact| |ipol| |pol|
         |pden| #5=#:G151 |c| #6=#:G150)
    (RETURN
     (SEQ
      (LETT |pden|
            (SPADCALL
             (PROGN
              (LETT #6# NIL . #7=(|MRATFAC;factor;PF;5|))
              (SEQ (LETT |c| NIL . #7#)
                   (LETT #5# (SPADCALL |p| (QREFELT $ 27)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #6# (CONS (SPADCALL |c| (QREFELT $ 28)) #6#)
                           . #7#)))
                   (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                   (EXIT (NREVERSE #6#))))
             (QREFELT $ 30))
            . #7#)
      (LETT |pol|
            (SPADCALL (SPADCALL |pden| (QREFELT $ 19)) |p| (QREFELT $ 31))
            . #7#)
      (LETT |ipol|
            (SPADCALL (ELT $ 14) (CONS (|function| |MRATFAC;numer1|) $) |pol|
                      (QREFELT $ 18))
            . #7#)
      (LETT |ffact| (SPADCALL |ipol| (QREFELT $ 34)) . #7#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (|spadConstant| $ 35) |pden| (QREFELT $ 38))
                  (SPADCALL (ELT $ 21) (CONS (|function| |MRATFAC;coerce1|) $)
                            (SPADCALL |ffact| (QREFELT $ 39)) (QREFELT $ 25))
                  (QREFELT $ 31))
        (PROGN
         (LETT #1# NIL . #7#)
         (SEQ (LETT |u| NIL . #7#)
              (LETT #4# (SPADCALL |ffact| (QREFELT $ 44)) . #7#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #7#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL
                        (SPADCALL (ELT $ 21)
                                  (CONS (|function| |MRATFAC;coerce1|) $)
                                  (QCAR |u|) (QREFELT $ 25))
                        (QCDR |u|) (QREFELT $ 47))
                       . #7#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 48)) . #7#))
                       ('T
                        (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
              (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) ('T (|spadConstant| $ 49))))
        (QREFELT $ 50))))))) 

(DEFUN |MRationalFactorize| (&REST #1=#:G153)
  (PROG ()
    (RETURN
     (PROG (#2=#:G154)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MRationalFactorize|)
                                           '|domainEqualList|)
                . #3=(|MRationalFactorize|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MRationalFactorize;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MRationalFactorize|))))))))))) 

(DEFUN |MRationalFactorize;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MRationalFactorize|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MRationalFactorize| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 52) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MRationalFactorize|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MRationalFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 8) (0 . |numer|)
              (|SparseMultivariatePolynomial| 8 7) (5 . |coerce|)
              (10 . |coerce|) (|Mapping| 12 7) (|Mapping| 12 10)
              (|PolynomialCategoryLifting| 6 7 10 9 12) (15 . |map|)
              (22 . |coerce|) (27 . |coerce|) (32 . |coerce|) (|Mapping| 9 7)
              (|Mapping| 9 8)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 8 12 9)
              (37 . |map|) (|List| 10) (44 . |coefficients|) (49 . |denom|)
              (|List| $) (54 . |lcm|) (59 . *) (|Factored| 12)
              (|MultivariateFactorize| 7 (|IndexedExponents| 7) 8 12)
              (65 . |factor|) (70 . |One|) (74 . |One|) (78 . |One|) (82 . /)
              (88 . |unit|) (|Fraction| 45) (93 . |One|)
              (|Record| (|:| |factor| 12) (|:| |exponent| 45)) (|List| 42)
              (97 . |factors|) (|Integer|) (|Factored| 9) (102 . |primeFactor|)
              (108 . *) (114 . |One|) (118 . *) |MRATFAC;factor;PF;5|)
           '#(|factor| 124) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 10 8 0 11 1 12 0 8 13 1 12
                                                   0 7 14 3 17 12 15 16 9 18 1
                                                   10 0 8 19 1 9 0 10 20 1 9 0
                                                   7 21 3 24 9 22 23 12 25 1 9
                                                   26 0 27 1 10 8 0 28 1 8 0 29
                                                   30 2 9 0 10 0 31 1 33 32 12
                                                   34 0 8 0 35 0 9 0 36 0 12 0
                                                   37 2 10 0 8 8 38 1 32 12 0
                                                   39 0 40 0 41 1 32 43 0 44 2
                                                   46 0 9 45 47 2 46 0 0 0 48 0
                                                   46 0 49 2 46 0 9 0 50 1 0 46
                                                   9 51)))))
           '|lookupComplete|)) 
