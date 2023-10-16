
(SDEFUN |CYCLOTOM;cyclotomic;ISup;1|
        ((|n| |Integer|) ($ |SparseUnivariatePolynomial| (|Integer|)))
        (SPROG
         ((|l| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G111 NIL)
          (#2=#:G110 NIL) (#3=#:G108 NIL) (#4=#:G116 NIL) (|u| NIL)
          (|g|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |g| (SPADCALL (SPADCALL |n| (QREFELT $ 9)) (QREFELT $ 13))
                . #5=(|CYCLOTOM;cyclotomic;ISup;1|))
          (LETT |l|
                (SPADCALL (SPADCALL 1 1 (QREFELT $ 17))
                          (SPADCALL 1 0 (QREFELT $ 17)) (QREFELT $ 18))
                . #5#)
          (SEQ (LETT |u| NIL . #5#) (LETT #4# |g| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |l|
                      (QCAR
                       (SPADCALL
                        (SPADCALL |l|
                                  (PROG1 (LETT #3# (QVELT |u| 1) . #5#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT $ 19))
                        |l| (QREFELT $ 21)))
                      . #5#)
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |u| 2) 1 (QREFELT $ 23))
                   (LETT |l|
                         (SPADCALL |l|
                                   (PROG1
                                       (LETT #1#
                                             (EXPT (QVELT |u| 1)
                                                   (PROG1
                                                       (LETT #2#
                                                             (- (QVELT |u| 2)
                                                                1)
                                                             . #5#)
                                                     (|check_subtype2|
                                                      (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#)))
                                             . #5#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 19))
                         . #5#)))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |l|)))) 

(SDEFUN |CYCLOTOM;cyclotomicDecomposition;IL;2|
        ((|n| |Integer|) ($ |List| (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|l| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (|m| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (#1=#:G122 NIL) (#2=#:G135 NIL) (|z| NIL) (#3=#:G134 NIL)
          (#4=#:G133 NIL) (|rr| NIL) (#5=#:G120 NIL) (#6=#:G132 NIL)
          (#7=#:G131 NIL) (#8=#:G130 NIL) (|u| NIL)
          (|g|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |g| (SPADCALL (SPADCALL |n| (QREFELT $ 9)) (QREFELT $ 13))
                . #9=(|CYCLOTOM;cyclotomicDecomposition;IL;2|))
          (LETT |l|
                (LIST
                 (SPADCALL (SPADCALL 1 1 (QREFELT $ 17))
                           (SPADCALL 1 0 (QREFELT $ 17)) (QREFELT $ 18)))
                . #9#)
          (SEQ (LETT |u| NIL . #9#) (LETT #8# |g| . #9#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |u| (CAR #8#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |m|
                      (PROGN
                       (LETT #7# NIL . #9#)
                       (SEQ (LETT |z| NIL . #9#) (LETT #6# |l| . #9#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |z| (CAR #6#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS
                                     (QCAR
                                      (SPADCALL
                                       (SPADCALL |z|
                                                 (PROG1
                                                     (LETT #5# (QVELT |u| 1)
                                                           . #9#)
                                                   (|check_subtype2| (>= #5# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #5#))
                                                 (QREFELT $ 19))
                                       |z| (QREFELT $ 21)))
                                     #7#)
                                    . #9#)))
                            (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      . #9#)
                (SEQ (LETT |rr| 1 . #9#) (LETT #4# (- (QVELT |u| 2) 1) . #9#)
                     G190 (COND ((|greater_SI| |rr| #4#) (GO G191)))
                     (SEQ (LETT |l| (SPADCALL |l| |m| (QREFELT $ 26)) . #9#)
                          (EXIT
                           (LETT |m|
                                 (PROGN
                                  (LETT #3# NIL . #9#)
                                  (SEQ (LETT |z| NIL . #9#)
                                       (LETT #2# |m| . #9#) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |z| (CAR #2#) . #9#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #3#
                                               (CONS
                                                (SPADCALL |z|
                                                          (PROG1
                                                              (LETT #1#
                                                                    (QVELT |u|
                                                                           1)
                                                                    . #9#)
                                                            (|check_subtype2|
                                                             (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                                          (QREFELT $ 19))
                                                #3#)
                                               . #9#)))
                                       (LETT #2# (CDR #2#) . #9#) (GO G190)
                                       G191 (EXIT (NREVERSE #3#))))
                                 . #9#)))
                     (LETT |rr| (|inc_SI| |rr|) . #9#) (GO G190) G191
                     (EXIT NIL))
                (EXIT (LETT |l| (SPADCALL |l| |m| (QREFELT $ 26)) . #9#)))
               (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |l|)))) 

(SDEFUN |CYCLOTOM;cyclotomicFactorization;IF;3|
        ((|n| |Integer|)
         ($ |Factored| (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|fr| (|Factored| (|SparseUnivariatePolynomial| (|Integer|))))
          (#1=#:G139 NIL) (|f| NIL))
         (SEQ
          (LETT |fr| (|spadConstant| $ 29)
                . #2=(|CYCLOTOM;cyclotomicFactorization;IF;3|))
          (SEQ (LETT |f| NIL . #2#)
               (LETT #1# (SPADCALL |n| (QREFELT $ 27)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |fr|
                       (SPADCALL |fr| (SPADCALL |f| 1 (QREFELT $ 30))
                                 (QREFELT $ 31))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |fr|)))) 

(DECLAIM (NOTINLINE |CyclotomicPolynomialPackage;|)) 

(DEFUN |CyclotomicPolynomialPackage| ()
  (SPROG NIL
         (PROG (#1=#:G141)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|CyclotomicPolynomialPackage|)
                    . #2=(|CyclotomicPolynomialPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CyclotomicPolynomialPackage|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|CyclotomicPolynomialPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|CyclotomicPolynomialPackage|)))))))))) 

(DEFUN |CyclotomicPolynomialPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CyclotomicPolynomialPackage|)
                . #1=(|CyclotomicPolynomialPackage|))
          (LETT $ (GETREFV 33) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CyclotomicPolynomialPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CyclotomicPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Factored| 7) (|Integer|)
              (|IntegerFactorizationPackage| 7) (0 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 10) (|:| |factor| 7) (|:| |exponent| 16))
              (|List| 11) (5 . |factorList|) (|SparseUnivariatePolynomial| 7)
              (10 . |One|) (|NonNegativeInteger|) (14 . |monomial|) (20 . -)
              (26 . |multiplyExponents|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (32 . |monicDivide|) (|Boolean|) (38 . >)
              |CYCLOTOM;cyclotomic;ISup;1| (|List| 14) (44 . |append|)
              |CYCLOTOM;cyclotomicDecomposition;IL;2| (|Factored| 14)
              (50 . |One|) (54 . |primeFactor|) (60 . *)
              |CYCLOTOM;cyclotomicFactorization;IF;3|)
           '#(|cyclotomicFactorization| 66 |cyclotomicDecomposition| 71
              |cyclotomic| 76)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 32
                                                 '(1 8 6 7 9 1 6 12 0 13 0 14 0
                                                   15 2 14 0 7 16 17 2 14 0 0 0
                                                   18 2 14 0 0 16 19 2 14 20 0
                                                   0 21 2 16 22 0 0 23 2 25 0 0
                                                   0 26 0 28 0 29 2 28 0 14 16
                                                   30 2 28 0 0 0 31 1 0 28 7 32
                                                   1 0 25 7 27 1 0 14 7 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|CyclotomicPolynomialPackage| 'NILADIC T) 
