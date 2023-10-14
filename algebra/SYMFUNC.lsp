
(SDEFUN |SYMFUNC;symFunc;RPiV;1|
        ((|x| R) (|n| |PositiveInteger|) ($ |Vector| R))
        (|SYMFUNC;signFix|
         (SPADCALL
          (SPADCALL (SPADCALL (|spadConstant| $ 7) 1 (QREFELT $ 10))
                    (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 12))
          |n| (QREFELT $ 13))
         (+ 1 |n|) $)) 

(SDEFUN |SYMFUNC;symFunc;LV;2| ((|l| |List| R) ($ |Vector| R))
        (SPROG
         ((#1=#:G105 NIL) (#2=#:G104 #3=(|SparseUnivariatePolynomial| R))
          (#4=#:G106 #3#) (#5=#:G108 NIL) (|a| NIL))
         (SEQ
          (|SYMFUNC;signFix|
           (PROGN
            (LETT #1# NIL . #6=(|SYMFUNC;symFunc;LV;2|))
            (SEQ (LETT |a| NIL . #6#) (LETT #5# |l| . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 7) 1 (QREFELT $ 10))
                           (SPADCALL |a| (QREFELT $ 11)) (QREFELT $ 12))
                          . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 18)) . #6#))
                     ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 17))))
           (+ 1 (LENGTH |l|)) $)))) 

(SDEFUN |SYMFUNC;signFix|
        ((|p| |SparseUnivariatePolynomial| R) (|n| |NonNegativeInteger|)
         ($ |Vector| R))
        (SPROG
         ((#1=#:G114 NIL) (#2=#:G110 NIL) (|i| NIL) (|m| (|Integer|))
          (|v| (|Vector| R)))
         (SEQ
          (LETT |m|
                (+
                 (SPADCALL
                  (LETT |v| (SPADCALL |p| |n| (QREFELT $ 21))
                        . #3=(|SYMFUNC;signFix|))
                  (QREFELT $ 23))
                 1)
                . #3#)
          (SEQ (LETT |i| 0 . #3#)
               (LETT #1#
                     (PROG1 (LETT #2# (- (QUOTIENT2 (QVSIZE |v|) 2) 1) . #3#)
                       (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                        #2#))
                     . #3#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |v| (+ (SPADCALL 2 |i| (QREFELT $ 24)) |m|)
                             (SPADCALL
                              (QAREF1O |v|
                                       (+ (SPADCALL 2 |i| (QREFELT $ 24)) |m|)
                                       1)
                              (QREFELT $ 25))
                             1)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |v| (QREFELT $ 26)))))) 

(DECLAIM (NOTINLINE |SymmetricFunctions;|)) 

(DEFUN |SymmetricFunctions| (#1=#:G115)
  (SPROG NIL
         (PROG (#2=#:G116)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SymmetricFunctions|)
                                               '|domainEqualList|)
                    . #3=(|SymmetricFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SymmetricFunctions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetricFunctions|)))))))))) 

(DEFUN |SymmetricFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SymmetricFunctions|))
          (LETT |dv$| (LIST '|SymmetricFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 27) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SymmetricFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SymmetricFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (4 . |monomial|) (10 . |coerce|) (15 . -) (21 . ^) (|Vector| 6)
              (|PositiveInteger|) |SYMFUNC;symFunc;RPiV;1| (27 . |One|)
              (31 . *) (|List| 6) |SYMFUNC;symFunc;LV;2| (37 . |vectorise|)
              (|Integer|) (43 . |minIndex|) (48 . *) (54 . -)
              (59 . |reverse!|))
           '#(|symFunc| 64) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(0 6 0 7 2 9 0 6 8 10 1 9 0 6
                                                   11 2 9 0 0 0 12 2 9 0 0 8 13
                                                   0 9 0 17 2 9 0 0 0 18 2 9 14
                                                   0 8 21 1 14 22 0 23 2 8 0 15
                                                   0 24 1 6 0 0 25 1 14 0 0 26
                                                   2 0 14 6 15 16 1 0 14 19
                                                   20)))))
           '|lookupComplete|)) 
