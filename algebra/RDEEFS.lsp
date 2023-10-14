
(/VERSIONCHECK 2) 

(DEFUN |RDEEFS;basecase| (|nfp| |g1| |g2| |k| $)
  (PROG (|l| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |nfp| |k| (QREFELT $ 10))
                      (SPADCALL |g1| |k| (QREFELT $ 10))
                      (SPADCALL |g2| |k| (QREFELT $ 10)) (QREFELT $ 14))
            . #1=(|RDEEFS;basecase|))
      (EXIT
       (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |l| (QCDR |ans|) . #1#)
                   (EXIT
                    (CONS 0
                          (LIST (SPADCALL (|SPADfirst| |l|) |k| (QREFELT $ 17))
                                (SPADCALL (SPADCALL |l| (QREFELT $ 19)) |k|
                                          (QREFELT $ 17))))))))))))) 

(DEFUN |RDEEFS;rischDEsys;I3FSMMU;2|
       (|n| |f| |g1| |g2| |x| |limint| |extint| $)
  (PROG (|k| |vl| |y2| |y1| #1=#:G153 |u2| |u1| |nfp|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |g1| (QREFELT $ 21))
        (COND
         ((SPADCALL |g2| (QREFELT $ 21))
          (EXIT
           (CONS 0 (LIST (|spadConstant| $ 22) (|spadConstant| $ 22))))))))
      (EXIT
       (COND
        ((SPADCALL
          (LETT |nfp|
                (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 24)) (QREFELT $ 26))
                . #2=(|RDEEFS;rischDEsys;I3FSMMU;2|))
          (QREFELT $ 21))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u1| (SPADCALL |g1| NIL |limint|) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |u1| 1)
                    (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #1#)))
                   (#4='T
                    (SEQ (LETT |u2| (SPADCALL |g1| NIL |limint|) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |u2| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #3#) . #2#)
                             (GO #1#))))))))))
            (EXIT (CONS 0 (LIST (QCAR (QCDR |u1|)) (QCAR (QCDR |u2|)))))))
          #1# (EXIT #1#)))
        (#4#
         (SEQ
          (COND
           ((SPADCALL (LETT |y1| (SPADCALL |g2| |nfp| (QREFELT $ 27)) . #2#)
                      |x| (QREFELT $ 28))
            (COND
             ((SPADCALL
               (LETT |y2|
                     (SPADCALL (SPADCALL |g1| |nfp| (QREFELT $ 27))
                               (QREFELT $ 29))
                     . #2#)
               |x| (QREFELT $ 28))
              (EXIT (CONS 0 (LIST |y1| |y2|)))))))
          (LETT |vl|
                (SPADCALL
                 (SPADCALL (SPADCALL |nfp| (QREFELT $ 31))
                           (SPADCALL (SPADCALL |g1| (QREFELT $ 31))
                                     (SPADCALL |g2| (QREFELT $ 31))
                                     (QREFELT $ 34))
                           (QREFELT $ 34))
                 |x| (QREFELT $ 35))
                . #2#)
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (LETT |k| (SPADCALL |vl| (QREFELT $ 36)) . #2#)
                        (QREFELT $ 38))
              0)
             (|RDEEFS;basecase| |nfp| |g1| |g2| |k| $))
            (#4#
             (|error|
              "rischDEsys: can only handle rational functions for now")))))))))))) 

(DEFUN |ElementaryRischDESystem| (&REST #1=#:G176)
  (PROG ()
    (RETURN
     (PROG (#2=#:G177)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryRischDESystem|)
                                           '|domainEqualList|)
                . #3=(|ElementaryRischDESystem|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryRischDESystem;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryRischDESystem|))))))))))) 

(DEFUN |ElementaryRischDESystem;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDESystem|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryRischDESystem| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 48) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryRischDESystem|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ElementaryRischDESystem| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| (|SparseUnivariatePolynomial| $)) (|Kernel| $)
              (0 . |univariate|) (|Union| 18 '"failed")
              (|Fraction| (|SparseUnivariatePolynomial| 7))
              (|TranscendentalRischDESystem| 7
                                             (|SparseUnivariatePolynomial| 7))
              (6 . |baseRDEsys|) (|Kernel| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 15) 15
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 15)
                                                     7)
              (13 . |multivariate|) (|List| 12) (19 . |second|) (|Boolean|)
              (24 . |zero?|) (29 . |Zero|) (|Symbol|) (33 . |differentiate|)
              (|Integer|) (39 . *) (45 . /) (51 . |freeOf?|) (57 . -)
              (|List| 9) (62 . |kernels|) (|List| 15) (|IntegrationTools| 6 7)
              (67 . |union|) (73 . |varselect|) (79 . |kmax|)
              (|Union| 23 '"failed") (84 . |symbolIfCan|)
              (|Union| (|List| 7) '"failed")
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 40)))
              (|Union| 41 '"failed") (|Mapping| 42 7 (|List| 7))
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 44 '"failed") (|Mapping| 45 7 7)
              |RDEEFS;rischDEsys;I3FSMMU;2|)
           '#(|rischDEsys| 89) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(2 7 8 0 9 10 3 13 11 12 12
                                                   12 14 2 16 7 12 15 17 1 18
                                                   12 0 19 1 7 20 0 21 0 7 0 22
                                                   2 7 0 0 23 24 2 7 0 25 0 26
                                                   2 7 0 0 0 27 2 7 20 0 23 28
                                                   1 7 0 0 29 1 7 30 0 31 2 33
                                                   32 32 32 34 2 33 32 32 23 35
                                                   1 33 15 32 36 1 15 37 0 38 7
                                                   0 39 25 7 7 7 23 43 46
                                                   47)))))
           '|lookupComplete|)) 
