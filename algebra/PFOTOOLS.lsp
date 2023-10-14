
(/VERSIONCHECK 2) 

(DEFUN |PFOTOOLS;mix;LI;1| (|l| $)
  (PROG (#1=#:G136 |p| #2=#:G135 #3=#:G134 #4=#:G133)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (PROGN
         (LETT #4# NIL . #5=(|PFOTOOLS;mix;LI;1|))
         (SEQ (LETT |p| NIL . #5#) (LETT #3# |l| . #5#) G190
              (COND
               ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                (GO G191)))
              (SEQ (EXIT (LETT #4# (CONS (QCAR |p|) #4#) . #5#)))
              (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
        (QREFELT $ 10))
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #5#)
         (SEQ (LETT |p| NIL . #5#) (LETT #1# |l| . #5#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                (GO G191)))
              (SEQ (EXIT (LETT #2# (CONS (QCDR |p|) #2#) . #5#)))
              (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 11))
       (QREFELT $ 12)))))) 

(DEFUN |PFOTOOLS;badNum;UPUPI;2| (|p| $)
  (PROG (#1=#:G141 |c| #2=#:G140)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|PFOTOOLS;badNum;UPUPI;2|))
        (SEQ (LETT |c| NIL . #3#)
             (LETT #1# (SPADCALL |p| (QREFELT $ 17)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (SPADCALL (SPADCALL |c| (QREFELT $ 19)) (QREFELT $ 20))
                      #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 15)))))) 

(DEFUN |PFOTOOLS;polyred;2UPUP;3| (|r| $)
  (PROG (#1=#:G147 |c| #2=#:G146)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #3=(|PFOTOOLS;polyred;2UPUP;3|))
         (SEQ (LETT |c| NIL . #3#)
              (LETT #1# (SPADCALL |r| (QREFELT $ 17)) . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #2#
                      (CONS
                       (SPADCALL (SPADCALL |c| (QREFELT $ 19)) (QREFELT $ 23))
                       #2#)
                      . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 10))
       |r| (QREFELT $ 24)))))) 

(DEFUN |PFOTOOLS;badNum;UPR;4| (|p| $)
  (PROG (#1=#:G154 |c| #2=#:G153 |cd|)
    (RETURN
     (SEQ
      (LETT |cd| (SPADCALL |p| (QREFELT $ 27)) . #3=(|PFOTOOLS;badNum;UPR;4|))
      (EXIT
       (CONS (QCDR |cd|)
             (SPADCALL
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |c| NIL . #3#)
                    (LETT #1# (SPADCALL (QCAR |cd|) (QREFELT $ 29)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 31)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QREFELT $ 11)))))))) 

(DEFUN |PFOTOOLS;getGoodPrime;IPi;5| (|n| $)
  (PROG (|p| #1=#:G155)
    (RETURN
     (SEQ (LETT |p| 3 . #2=(|PFOTOOLS;getGoodPrime;IPi;5|))
          (SEQ G190 (COND ((NULL (ZEROP (REM |n| |p|))) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (PROG1 (LETT #1# (SPADCALL |p| (QREFELT $ 33)) . #2#)
                         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                       . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |p|))))) 

(DEFUN |PFOTOOLS;doubleDisc;UPUPI;6| (|r| $)
  (PROG (#1=#:G160 |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL (SPADCALL |r| (QREFELT $ 36)) (QREFELT $ 19))
            . #2=(|PFOTOOLS;doubleDisc;UPUPI;6|))
      (EXIT
       (SPADCALL
        (SPADCALL
         (PROG2
             (LETT #1#
                   (SPADCALL |d|
                             (SPADCALL |d| (SPADCALL |d| (QREFELT $ 37))
                                       (QREFELT $ 38))
                             (QREFELT $ 40))
                   . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
         (QREFELT $ 41))
        (QREFELT $ 31))))))) 

(DECLAIM (NOTINLINE |PointsOfFiniteOrderTools;|)) 

(DEFUN |PointsOfFiniteOrderTools| (&REST #1=#:G164)
  (PROG ()
    (RETURN
     (PROG (#2=#:G165)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PointsOfFiniteOrderTools|)
                                           '|domainEqualList|)
                . #3=(|PointsOfFiniteOrderTools|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PointsOfFiniteOrderTools;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PointsOfFiniteOrderTools|))))))))))) 

(DEFUN |PointsOfFiniteOrderTools;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PointsOfFiniteOrderTools|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PointsOfFiniteOrderTools| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 43) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PointsOfFiniteOrderTools|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PointsOfFiniteOrderTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| $)
              (|Integer|) (0 . |lcm|) (5 . |gcd|) (10 . |lcm|)
              (|Record| (|:| |den| 9) (|:| |gcdnum| 9)) (|List| 13)
              |PFOTOOLS;mix;LI;1| (|List| 18) (16 . |coefficients|)
              (|Fraction| 6) (21 . |retract|) |PFOTOOLS;badNum;UPR;4|
              |PFOTOOLS;badNum;UPUPI;2|
              (|UnivariatePolynomialCommonDenominator| 9 30 6)
              (26 . |commonDenominator|) (31 . *) |PFOTOOLS;polyred;2UPUP;3|
              (|Record| (|:| |num| 6) (|:| |den| 9)) (37 . |splitDenominator|)
              (|List| 30) (42 . |coefficients|) (|Fraction| 9) (47 . |retract|)
              (|IntegerPrimesPackage| 9) (52 . |nextPrime|) (|PositiveInteger|)
              |PFOTOOLS;getGoodPrime;IPi;5| (57 . |discriminant|)
              (62 . |differentiate|) (67 . |gcd|) (|Union| $ '"failed")
              (73 . |exquo|) (79 . |discriminant|)
              |PFOTOOLS;doubleDisc;UPUPI;6|)
           '#(|polyred| 84 |mix| 89 |getGoodPrime| 94 |doubleDisc| 99 |badNum|
              104)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(1 9 0 8 10 1 9 0 8 11 2 9 0
                                                   0 0 12 1 7 16 0 17 1 18 6 0
                                                   19 1 22 9 6 23 2 7 0 9 0 24
                                                   1 22 26 6 27 1 6 28 0 29 1
                                                   30 9 0 31 1 32 9 9 33 1 7 18
                                                   0 36 1 6 0 0 37 2 6 0 0 0 38
                                                   2 6 39 0 0 40 1 6 30 0 41 1
                                                   0 7 7 25 1 0 9 14 15 1 0 34
                                                   9 35 1 0 9 7 42 1 0 9 7 21 1
                                                   0 13 6 20)))))
           '|lookupComplete|)) 
