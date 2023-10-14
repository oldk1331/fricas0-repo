
(/VERSIONCHECK 2) 

(DEFUN |SUPFRACF;factor;SupF;1| (|p| $)
  (PROG (#1=#:G121 |u| #2=#:G120 |ffact| |ipol| |pol| |pden| #3=#:G119 |c|
         #4=#:G118)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (|spadConstant| $ 13) (QREFELT $ 15))
        (|spadConstant| $ 17))
       ('T
        (SEQ
         (COND
          ((|HasCategory| (QREFELT $ 8) '(|CharacteristicZero|))
           (COND
            ((|HasCategory| (QREFELT $ 8) '(|EuclideanDomain|))
             (EXIT
              (SEQ
               (LETT |pden|
                     (SPADCALL
                      (PROGN
                       (LETT #4# NIL . #5=(|SUPFRACF;factor;SupF;1|))
                       (SEQ (LETT |c| NIL . #5#)
                            (LETT #3# (SPADCALL |p| (QREFELT $ 19)) . #5#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |c| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |c| (QREFELT $ 21)) #4#)
                                    . #5#)))
                            (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 23))
                     . #5#)
               (LETT |pol|
                     (SPADCALL (SPADCALL |pden| (QREFELT $ 24)) |p|
                               (QREFELT $ 25))
                     . #5#)
               (LETT |ipol| (SPADCALL (ELT $ 26) |pol| (QREFELT $ 30)) . #5#)
               (LETT |ffact| (|spadConstant| $ 32) . #5#)
               (LETT |ffact| (SPADCALL |ipol| (QREFELT $ 34)) . #5#)
               (EXIT
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 36) |pden| (QREFELT $ 38))
                  (SPADCALL (ELT $ 24) (SPADCALL |ffact| (QREFELT $ 39))
                            (QREFELT $ 42))
                  (QREFELT $ 25))
                 (PROGN
                  (LETT #2# NIL . #5#)
                  (SEQ (LETT |u| NIL . #5#)
                       (LETT #1# (SPADCALL |ffact| (QREFELT $ 45)) . #5#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (VECTOR (CONS 3 "prime")
                                        (SPADCALL (ELT $ 24) (QCAR |u|)
                                                  (QREFELT $ 42))
                                        (QCDR |u|))
                                #2#)
                               . #5#)))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 49)))))))))
         (EXIT (SPADCALL |p| (QREFELT $ 50)))))))))) 

(DEFUN |SUPFRACF;squareFree;SupF;2| (|p| $)
  (PROG (#1=#:G139 |u| #2=#:G138 |ffact| |ipol| |pol| |pden| #3=#:G137 |c|
         #4=#:G136)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (|spadConstant| $ 13) (QREFELT $ 15))
        (|spadConstant| $ 17))
       (#5='T
        (SEQ
         (LETT |pden|
               (SPADCALL
                (PROGN
                 (LETT #4# NIL . #6=(|SUPFRACF;squareFree;SupF;2|))
                 (SEQ (LETT |c| NIL . #6#)
                      (LETT #3# (SPADCALL |p| (QREFELT $ 19)) . #6#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |c| (QREFELT $ 21)) #4#)
                              . #6#)))
                      (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT $ 23))
               . #6#)
         (LETT |pol|
               (SPADCALL (SPADCALL |pden| (QREFELT $ 24)) |p| (QREFELT $ 25))
               . #6#)
         (LETT |ipol| (SPADCALL (ELT $ 26) |pol| (QREFELT $ 30)) . #6#)
         (LETT |ffact| (|spadConstant| $ 32) . #6#)
         (COND
          ((|HasCategory| (QREFELT $ 8) '(|CharacteristicZero|))
           (COND
            ((|HasCategory| (QREFELT $ 8) '(|EuclideanDomain|))
             (LETT |ffact| (SPADCALL |ipol| (QREFELT $ 53)) . #6#))
            (#5# (LETT |ffact| (SPADCALL |ipol| (QREFELT $ 55)) . #6#))))
          (#5# (LETT |ffact| (SPADCALL |ipol| (QREFELT $ 55)) . #6#)))
         (EXIT
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 36) |pden| (QREFELT $ 38))
                     (SPADCALL (ELT $ 24) (SPADCALL |ffact| (QREFELT $ 39))
                               (QREFELT $ 42))
                     (QREFELT $ 25))
           (PROGN
            (LETT #2# NIL . #6#)
            (SEQ (LETT |u| NIL . #6#)
                 (LETT #1# (SPADCALL |ffact| (QREFELT $ 45)) . #6#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (VECTOR (CONS 1 "sqfr")
                                  (SPADCALL (ELT $ 24) (QCAR |u|)
                                            (QREFELT $ 42))
                                  (QCDR |u|))
                          #2#)
                         . #6#)))
                 (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))
           (QREFELT $ 49)))))))))) 

(DECLAIM (NOTINLINE |SupFractionFactorizer;|)) 

(DEFUN |SupFractionFactorizer| (&REST #1=#:G140)
  (PROG ()
    (RETURN
     (PROG (#2=#:G141)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SupFractionFactorizer|)
                                           '|domainEqualList|)
                . #3=(|SupFractionFactorizer|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SupFractionFactorizer;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|SupFractionFactorizer|))))))))))) 

(DEFUN |SupFractionFactorizer;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SupFractionFactorizer|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|SupFractionFactorizer| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 56) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SupFractionFactorizer|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SupFractionFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (4 . |Zero|)
              (|SparseUnivariatePolynomial| 20) (8 . |Zero|) (|Boolean|)
              (12 . =) (|Factored| 12) (18 . |Zero|) (|List| 20)
              (22 . |coefficients|) (|Fraction| 9) (27 . |denom|) (|List| $)
              (32 . |lcm|) (37 . |coerce|) (42 . *) (48 . |numer|)
              (|SparseUnivariatePolynomial| 9) (|Mapping| 9 20)
              (|UnivariatePolynomialCategoryFunctions2| 20 12 9 27)
              (53 . |map|) (|Factored| 27) (59 . |Zero|)
              (|MultivariateFactorize| 7 6 8 9) (63 . |factor|) (68 . |One|)
              (72 . |One|) (76 . |One|) (80 . /) (86 . |unit|) (|Mapping| 20 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 27 20 12)
              (91 . |map|)
              (|Record| (|:| |factor| 27) (|:| |exponent| (|Integer|)))
              (|List| 43) (97 . |factors|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 46) (|:| |fctr| 12)
                        (|:| |xpnt| (|Integer|)))
              (|List| 47) (102 . |makeFR|) |SUPFRACF;squareFree;SupF;2|
              |SUPFRACF;factor;SupF;1| (|MultivariateSquareFree| 6 7 8 9)
              (108 . |squareFree|) (|Factored| $) (113 . |squareFree|))
           '#(|squareFree| 118 |factor| 123) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(0 6 0 10 0 8 0 11 0 12 0 13
                                                   2 12 14 0 0 15 0 16 0 17 1
                                                   12 18 0 19 1 20 9 0 21 1 9 0
                                                   22 23 1 20 0 9 24 2 12 0 20
                                                   0 25 1 20 9 0 26 2 29 27 28
                                                   12 30 0 31 0 32 1 33 31 27
                                                   34 0 8 0 35 0 9 0 36 0 12 0
                                                   37 2 20 0 9 9 38 1 31 27 0
                                                   39 2 41 12 40 27 42 1 31 44
                                                   0 45 2 16 0 12 48 49 1 52 31
                                                   27 53 1 27 54 0 55 1 0 16 12
                                                   50 1 0 16 12 51)))))
           '|lookupComplete|)) 
