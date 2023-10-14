
(/VERSIONCHECK 2) 

(DEFUN |PFRPAC;partialFraction;FSA;1| (|rf| |v| $)
  (PROG (|df|)
    (RETURN
     (SEQ
      (LETT |df| (SPADCALL (SPADCALL |rf| (QREFELT $ 9)) (QREFELT $ 12))
            |PFRPAC;partialFraction;FSA;1|)
      (EXIT
       (SPADCALL (SPADCALL |rf| (QREFELT $ 13)) |df| |v| (QREFELT $ 16))))))) 

(DEFUN |PFRPAC;makeSup| (|p| |v| $)
  (PROG (|up|)
    (RETURN
     (SEQ (LETT |up| (SPADCALL |p| |v| (QREFELT $ 19)) |PFRPAC;makeSup|)
          (EXIT (SPADCALL (ELT $ 20) |up| (QREFELT $ 25))))))) 

(DEFUN |PFRPAC;partialFraction;PFSA;3| (|p| |facq| |v| $)
  (PROG (|pfup| |nflist| #1=#:G111 #2=#:G110 #3=#:G112 #4=#:G117 |ff| |fcont|
         |ffact| #5=#:G116 |u| #6=#:G115 |fup| |up|)
    (RETURN
     (SEQ
      (LETT |up|
            (|UnivariatePolynomial| |v|
                                    (|Fraction| (|Polynomial| (QREFELT $ 6))))
            . #7=(|PFRPAC;partialFraction;PFSA;3|))
      (LETT |fup| (|Factored| |up|) . #7#)
      (LETT |ffact|
            (PROGN
             (LETT #6# NIL . #7#)
             (SEQ (LETT |u| NIL . #7#)
                  (LETT #5# (SPADCALL |facq| (QREFELT $ 28)) . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6#
                          (CONS
                           (CONS (|PFRPAC;makeSup| (QCAR |u|) |v| $)
                                 (QCDR |u|))
                           #6#)
                          . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |fcont| (|PFRPAC;makeSup| (SPADCALL |facq| (QREFELT $ 29)) |v| $)
            . #7#)
      (LETT |nflist|
            (SPADCALL |fcont|
                      (PROGN
                       (LETT #1# NIL . #7#)
                       (SEQ (LETT |ff| NIL . #7#) (LETT #4# |ffact| . #7#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |ff| (CAR #4#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #3#
                                     (SPADCALL (QCAR |ff|) (QCDR |ff|)
                                               (|compiledLookupCheck|
                                                '|primeFactor|
                                                (LIST '$ (|devaluate| |up|)
                                                      (LIST '|Integer|))
                                                |fup|))
                                     . #7#)
                               (COND
                                (#1#
                                 (LETT #2#
                                       (SPADCALL #2# #3#
                                                 (|compiledLookupCheck| '*
                                                                        (LIST
                                                                         '$ '$
                                                                         '$)
                                                                        |fup|))
                                       . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #3# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                            (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#)
                             ('T
                              (SPADCALL
                               (|compiledLookupCheck| '|One| (LIST '$)
                                                      |fup|)))))
                      (|compiledLookupCheck| '* (LIST '$ (|devaluate| |up|) '$)
                                             |fup|))
            . #7#)
      (LETT |pfup|
            (SPADCALL (|PFRPAC;makeSup| |p| |v| $) |nflist|
                      (|compiledLookupCheck| '|partialFraction|
                                             (LIST '$ (|devaluate| |up|)
                                                   (LIST '|Factored|
                                                         (|devaluate| |up|)))
                                             (|PartialFraction| |up|)))
            . #7#)
      (EXIT
       (SPADCALL |pfup|
                 (|compiledLookupCheck| '|coerce|
                                        (LIST (LIST '|Any|)
                                              (LIST '|PartialFraction|
                                                    (|devaluate| |up|)))
                                        (|AnyFunctions1|
                                         (|PartialFraction| |up|))))))))) 

(DECLAIM (NOTINLINE |PartialFractionPackage;|)) 

(DEFUN |PartialFractionPackage| (#1=#:G118)
  (PROG ()
    (RETURN
     (PROG (#2=#:G119)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PartialFractionPackage|)
                                           '|domainEqualList|)
                . #3=(|PartialFractionPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|PartialFractionPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PartialFractionPackage|))))))))))) 

(DEFUN |PartialFractionPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialFractionPackage|))
      (LETT |dv$| (LIST '|PartialFractionPackage| DV$1) . #1#)
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PartialFractionPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PartialFractionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (|Fraction| 7) (0 . |denom|) (|Factored| 7)
              (|MultivariateFactorize| 15 (|IndexedExponents| 15) 6 7)
              (5 . |factor|) (10 . |numer|) (|Any|) (|Symbol|)
              |PFRPAC;partialFraction;PFSA;3| |PFRPAC;partialFraction;FSA;1|
              (|SparseUnivariatePolynomial| $) (15 . |univariate|)
              (21 . |coerce|) (|SparseUnivariatePolynomial| 8) (|Mapping| 8 7)
              (|SparseUnivariatePolynomial| 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 23 8 21) (26 . |map|)
              (|Record| (|:| |factor| 7) (|:| |exponent| (|Integer|)))
              (|List| 26) (32 . |factors|) (37 . |unit|))
           '#(|partialFraction| 42) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(1 8 7 0 9 1 11 10 7 12 1 8 7
                                                   0 13 2 7 18 0 15 19 1 8 0 7
                                                   20 2 24 21 22 23 25 1 10 27
                                                   0 28 1 10 7 0 29 3 0 14 7 10
                                                   15 16 2 0 14 8 15 17)))))
           '|lookupComplete|)) 
