
(/VERSIONCHECK 2) 

(DEFUN |CYCLOTOM;cyclotomic;ISup;1| (|n| $)
  (PROG (|l| #1=#:G134 #2=#:G133 #3=#:G131 #4=#:G139 |u| |g|)
    (RETURN
     (SEQ
      (LETT |g| (SPADCALL (SPADCALL |n| (QREFELT $ 9)) (QREFELT $ 12))
            . #5=(|CYCLOTOM;cyclotomic;ISup;1|))
      (LETT |l|
            (SPADCALL (SPADCALL 1 1 (QREFELT $ 16))
                      (SPADCALL 1 0 (QREFELT $ 16)) (QREFELT $ 17))
            . #5#)
      (SEQ (LETT |u| NIL . #5#) (LETT #4# |g| . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL)) (GO G191)))
           (SEQ
            (LETT |l|
                  (QCAR
                   (SPADCALL
                    (SPADCALL |l|
                              (PROG1 (LETT #3# (QCAR |u|) . #5#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (QREFELT $ 18))
                    |l| (QREFELT $ 20)))
                  . #5#)
            (EXIT
             (COND
              ((SPADCALL (QCDR |u|) 1 (QREFELT $ 22))
               (LETT |l|
                     (SPADCALL |l|
                               (PROG1
                                   (LETT #1#
                                         (EXPT (QCAR |u|)
                                               (PROG1
                                                   (LETT #2# (- (QCDR |u|) 1)
                                                         . #5#)
                                                 (|check_subtype| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #2#)))
                                         . #5#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 18))
                     . #5#)))))
           (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT |l|))))) 

(DEFUN |CYCLOTOM;cyclotomicDecomposition;IL;2| (|n| $)
  (PROG (|l| |m| #1=#:G145 #2=#:G158 |z| #3=#:G157 #4=#:G156 |rr| #5=#:G143
         #6=#:G155 #7=#:G154 #8=#:G153 |u| |g|)
    (RETURN
     (SEQ
      (LETT |g| (SPADCALL (SPADCALL |n| (QREFELT $ 9)) (QREFELT $ 12))
            . #9=(|CYCLOTOM;cyclotomicDecomposition;IL;2|))
      (LETT |l|
            (LIST
             (SPADCALL (SPADCALL 1 1 (QREFELT $ 16))
                       (SPADCALL 1 0 (QREFELT $ 16)) (QREFELT $ 17)))
            . #9#)
      (SEQ (LETT |u| NIL . #9#) (LETT #8# |g| . #9#) G190
           (COND
            ((OR (ATOM #8#) (PROGN (LETT |u| (CAR #8#) . #9#) NIL)) (GO G191)))
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
                                             (PROG1 (LETT #5# (QCAR |u|) . #9#)
                                               (|check_subtype| (>= #5# 0)
                                                                '(|NonNegativeInteger|)
                                                                #5#))
                                             (QREFELT $ 18))
                                   |z| (QREFELT $ 20)))
                                 #7#)
                                . #9#)))
                        (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
                  . #9#)
            (SEQ (LETT |rr| 1 . #9#) (LETT #4# (- (QCDR |u|) 1) . #9#) G190
                 (COND ((|greater_SI| |rr| #4#) (GO G191)))
                 (SEQ (LETT |l| (APPEND |l| |m|) . #9#)
                      (EXIT
                       (LETT |m|
                             (PROGN
                              (LETT #3# NIL . #9#)
                              (SEQ (LETT |z| NIL . #9#) (LETT #2# |m| . #9#)
                                   G190
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
                                                          (LETT #1# (QCAR |u|)
                                                                . #9#)
                                                        (|check_subtype|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))
                                                      (QREFELT $ 18))
                                            #3#)
                                           . #9#)))
                                   (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             . #9#)))
                 (LETT |rr| (|inc_SI| |rr|) . #9#) (GO G190) G191 (EXIT NIL))
            (EXIT (LETT |l| (APPEND |l| |m|) . #9#)))
           (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT |l|))))) 

(DEFUN |CYCLOTOM;cyclotomicFactorization;IF;3| (|n| $)
  (PROG (|fr| #1=#:G162 |f|)
    (RETURN
     (SEQ
      (LETT |fr| (|spadConstant| $ 27)
            . #2=(|CYCLOTOM;cyclotomicFactorization;IF;3|))
      (SEQ (LETT |f| NIL . #2#) (LETT #1# (SPADCALL |n| (QREFELT $ 25)) . #2#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |fr|
                   (SPADCALL |fr| (SPADCALL |f| 1 (QREFELT $ 28))
                             (QREFELT $ 29))
                   . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |fr|))))) 

(DECLAIM (NOTINLINE |CyclotomicPolynomialPackage;|)) 

(DEFUN |CyclotomicPolynomialPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G164)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|CyclotomicPolynomialPackage|)
                . #2=(|CyclotomicPolynomialPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|CyclotomicPolynomialPackage|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|CyclotomicPolynomialPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|CyclotomicPolynomialPackage|))))))))))) 

(DEFUN |CyclotomicPolynomialPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|CyclotomicPolynomialPackage|)
            . #1=(|CyclotomicPolynomialPackage|))
      (LETT $ (GETREFV 31) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CyclotomicPolynomialPackage| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|CyclotomicPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Factored| 7) (|Integer|)
              (|IntegerFactorizationPackage| 7) (0 . |factor|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 7)) (|List| 10)
              (5 . |factors|) (|SparseUnivariatePolynomial| 7) (10 . |One|)
              (|NonNegativeInteger|) (14 . |monomial|) (20 . -)
              (26 . |multiplyExponents|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (32 . |monicDivide|) (|Boolean|) (38 . >)
              |CYCLOTOM;cyclotomic;ISup;1| (|List| 13)
              |CYCLOTOM;cyclotomicDecomposition;IL;2| (|Factored| 13)
              (44 . |One|) (48 . |primeFactor|) (54 . *)
              |CYCLOTOM;cyclotomicFactorization;IF;3|)
           '#(|cyclotomicFactorization| 60 |cyclotomicDecomposition| 65
              |cyclotomic| 70)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(1 8 6 7 9 1 6 11 0 12 0 13 0
                                                   14 2 13 0 7 15 16 2 13 0 0 0
                                                   17 2 13 0 0 15 18 2 13 19 0
                                                   0 20 2 7 21 0 0 22 0 26 0 27
                                                   2 26 0 13 7 28 2 26 0 0 0 29
                                                   1 0 26 7 30 1 0 24 7 25 1 0
                                                   13 7 23)))))
           '|lookupComplete|)) 

(MAKEPROP '|CyclotomicPolynomialPackage| 'NILADIC T) 
