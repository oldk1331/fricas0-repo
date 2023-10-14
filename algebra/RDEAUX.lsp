
(SDEFUN |RDEAUX;multi_SPDE;2SupLIML;1|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |SparseUnivariatePolynomial| F)
         (|lc| |List| (|SparseUnivariatePolynomial| F)) (|d| |Integer|)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |List|
          (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                    (|:| |remainder| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((#1=#:G129 NIL) (|s1| NIL) (#2=#:G130 NIL)
          (|r| #3=(|SparseUnivariatePolynomial| F)) (#4=#:G128 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| (|SparseUnivariatePolynomial| F)))))
          (|lr| (|List| (|SparseUnivariatePolynomial| F)))
          (|lnc| (|List| (|SparseUnivariatePolynomial| F)))
          (|nc| (|SparseUnivariatePolynomial| F))
          (|qr|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| #3#)))
          (|cc2| #5=(|SparseUnivariatePolynomial| F)) (|cc1| #5#)
          (|all_zero| (|Boolean|)) (#6=#:G127 NIL) (|c| NIL)
          (|ee|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (|eeu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (#7=#:G126 NIL) (#8=#:G125 NIL) (#9=#:G124 NIL) (#10=#:G123 NIL))
         (SEQ
          (COND
           ((< |d| 0)
            (PROGN
             (LETT #10# NIL . #11=(|RDEAUX;multi_SPDE;2SupLIML;1|))
             (SEQ (LETT |c| NIL . #11#) (LETT #9# |lc| . #11#) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |c| (CAR #9#) . #11#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #10# (CONS (CONS (|spadConstant| $ 11) |c|) #10#)
                          . #11#)))
                  (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                  (EXIT (NREVERSE #10#)))))
           ((SPADCALL (ELT $ 13) |lc| (QREFELT $ 16))
            (PROGN
             (LETT #8# NIL . #11#)
             (SEQ (LETT |c| NIL . #11#) (LETT #7# |lc| . #11#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |c| (CAR #7#) . #11#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #8#
                          (CONS
                           (CONS (|spadConstant| $ 11) (|spadConstant| $ 11))
                           #8#)
                          . #11#)))
                  (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                  (EXIT (NREVERSE #8#)))))
           (#12='T
            (SEQ
             (LETT |eeu|
                   (SPADCALL |a| |b| (|spadConstant| $ 17) (QREFELT $ 20))
                   . #11#)
             (EXIT
              (COND ((QEQCAR |eeu| 1) (|error| "extendedEuclidean failed"))
                    (#12#
                     (SEQ (LETT |ee| (QCDR |eeu|) . #11#)
                          (LETT |lr| NIL . #11#) (LETT |lnc| NIL . #11#)
                          (SEQ (LETT |c| NIL . #11#) (LETT #6# |lc| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |c| (CAR #6#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL |c| (|spadConstant| $ 11)
                                             (QREFELT $ 21))
                                   "skip")
                                  ('T
                                   (SEQ (LETT |all_zero| 'NIL . #11#)
                                        (LETT |cc1|
                                              (SPADCALL (QCAR |ee|) |c|
                                                        (QREFELT $ 22))
                                              . #11#)
                                        (LETT |cc2|
                                              (SPADCALL (QCDR |ee|) |c|
                                                        (QREFELT $ 22))
                                              . #11#)
                                        (LETT |qr|
                                              (SPADCALL |cc2| |a|
                                                        (QREFELT $ 24))
                                              . #11#)
                                        (LETT |r| (QCDR |qr|) . #11#)
                                        (LETT |nc|
                                              (SPADCALL
                                               (SPADCALL |cc1|
                                                         (SPADCALL |b|
                                                                   (QCAR |qr|)
                                                                   (QREFELT $
                                                                            22))
                                                         (QREFELT $ 25))
                                               (SPADCALL |r| |der|)
                                               (QREFELT $ 26))
                                              . #11#)
                                        (LETT |lnc| (CONS |nc| |lnc|) . #11#)
                                        (EXIT
                                         (LETT |lr| (CONS |r| |lr|)
                                               . #11#)))))))
                               (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |lr| (NREVERSE |lr|) . #11#)
                          (LETT |res1|
                                (SPADCALL |a|
                                          (SPADCALL |b| (SPADCALL |a| |der|)
                                                    (QREFELT $ 25))
                                          (NREVERSE |lnc|)
                                          (- |d| (SPADCALL |a| (QREFELT $ 28)))
                                          |der| (QREFELT $ 33))
                                . #11#)
                          (EXIT
                           (PROGN
                            (LETT #4# NIL . #11#)
                            (SEQ (LETT |r| NIL . #11#) (LETT #2# |lr| . #11#)
                                 (LETT |s1| NIL . #11#)
                                 (LETT #1# |res1| . #11#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |s1| (CAR #1#) . #11#) NIL)
                                       (ATOM #2#)
                                       (PROGN (LETT |r| (CAR #2#) . #11#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |a| (QCAR |s1|)
                                                      (QREFELT $ 22))
                                            |r| (QREFELT $ 25))
                                           (QCDR |s1|))
                                          #4#)
                                         . #11#)))
                                 (LETT #1#
                                       (PROG1 (CDR #1#)
                                         (LETT #2# (CDR #2#) . #11#))
                                       . #11#)
                                 (GO G190) G191
                                 (EXIT (NREVERSE #4#))))))))))))))) 

(DECLAIM (NOTINLINE |RDEaux;|)) 

(DEFUN |RDEaux| (&REST #1=#:G131)
  (SPROG NIL
         (PROG (#2=#:G132)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RDEaux|)
                                               '|domainEqualList|)
                    . #3=(|RDEaux|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RDEaux;|) #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|RDEaux|)))))))))) 

(DEFUN |RDEaux;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RDEaux|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RDEaux| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RDEaux| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RDEaux| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|SparseUnivariatePolynomial| 7)
              (8 . |Zero|) (|Boolean|) (12 . |zero?|) (|Mapping| 12 10)
              (|List| 10) (17 . |every?|) (23 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 18 '"failed")
              (27 . |extendedEuclidean|) (34 . =) (40 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (46 . |divide|)
              (52 . +) (58 . -) (|NonNegativeInteger|) (64 . |degree|)
              (|Record| (|:| |ans| 10) (|:| |remainder| 10)) (|List| 29)
              (|Integer|) (|Mapping| 10 10) |RDEAUX;multi_SPDE;2SupLIML;1|)
           '#(|multi_SPDE| 69) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(0 6 0 8 0 7 0 9 0 10 0 11 1
                                                   10 12 0 13 2 15 12 14 0 16 0
                                                   10 0 17 3 10 19 0 0 0 20 2
                                                   10 12 0 0 21 2 10 0 0 0 22 2
                                                   10 23 0 0 24 2 10 0 0 0 25 2
                                                   10 0 0 0 26 1 10 27 0 28 5 0
                                                   30 10 10 15 31 32 33)))))
           '|lookupComplete|)) 
