
(DEFUN |GALFACTU;height;UPF;1| (|p| $) (SPADCALL |p| (QREFELT $ 9))) 

(DEFUN |GALFACTU;length;UPF;2| (|p| $) (SPADCALL |p| 1 (QREFELT $ 14))) 

(DEFUN |GALFACTU;norm;UPPiF;3| (|f| |p| $)
  (PROG (|n| #1=#:G112 |c|)
    (RETURN
     (SEQ (LETT |n| (|spadConstant| $ 16) . #2=(|GALFACTU;norm;UPPiF;3|))
          (SEQ (LETT |c| NIL . #2#)
               (LETT #1# (SPADCALL |f| (QREFELT $ 18)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |n|
                       (SPADCALL |n|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |c| (QREFELT $ 19))
                                            (QREFELT $ 20))
                                  |p| (QREFELT $ 21))
                                 (QREFELT $ 22))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |n| |p| (QREFELT $ 24))))))) 

(DEFUN |GALFACTU;quadraticNorm;UPF;4| (|f| $) (SPADCALL |f| 2 (QREFELT $ 14))) 

(DEFUN |GALFACTU;infinityNorm;UPF;5| (|f| $)
  (PROG (|n| #1=#:G117 |c|)
    (RETURN
     (SEQ (LETT |n| (|spadConstant| $ 16) . #2=(|GALFACTU;infinityNorm;UPF;5|))
          (SEQ (LETT |c| NIL . #2#)
               (LETT #1# (SPADCALL |f| (QREFELT $ 18)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |n|
                       (SPADCALL |n| (SPADCALL |c| (QREFELT $ 19))
                                 (QREFELT $ 26))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |n|))))) 

(DEFUN |GALFACTU;singleFactorBound;UPNniI;6| (|p| |r| $)
  (PROG (|den| |num| |nf| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |p| (QREFELT $ 28))
            . #1=(|GALFACTU;singleFactorBound;UPNniI;6|))
      (LETT |r| (MAX 2 |r|) . #1#)
      (EXIT
       (COND ((< |n| |r|) (|error| "singleFactorBound: Bad arguments."))
             (#2='T
              (SEQ (LETT |nf| (SPADCALL |n| (QREFELT $ 29)) . #1#)
                   (LETT |num|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 30)) |r|
                                   (QREFELT $ 24))
                         . #1#)
                   (COND
                    ((|HasSignature| (QREFELT $ 8)
                                     (LIST '|Gamma|
                                           (LIST (|devaluate| (QREFELT $ 8))
                                                 (|devaluate| (QREFELT $ 8)))))
                     (SEQ
                      (LETT |num|
                            (SPADCALL |num|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nf| (|spadConstant| $ 31)
                                                  (QREFELT $ 22))
                                        (QREFELT $ 32))
                                       (SPADCALL 2 |r| (QREFELT $ 33))
                                       (QREFELT $ 24))
                                      (QREFELT $ 34))
                            . #1#)
                      (EXIT
                       (LETT |den|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |nf|
                                         (SPADCALL
                                          (SPADCALL 2 |r| (QREFELT $ 33))
                                          (QREFELT $ 29))
                                         (QREFELT $ 35))
                               (|spadConstant| $ 31) (QREFELT $ 22))
                              (QREFELT $ 32))
                             . #1#))))
                    (#2#
                     (SEQ
                      (LETT |num|
                            (SPADCALL
                             (SPADCALL |num|
                                       (SPADCALL (SPADCALL 2 (QREFELT $ 29))
                                                 (SPADCALL
                                                  (SPADCALL 5 8 (QREFELT $ 39))
                                                  (SPADCALL |n| 2
                                                            (QREFELT $ 39))
                                                  (QREFELT $ 40))
                                                 (QREFELT $ 41))
                                       (QREFELT $ 34))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 31)
                                        (SPADCALL 4 |nf| (QREFELT $ 42))
                                        (QREFELT $ 35))
                              (QREFELT $ 43))
                             (QREFELT $ 34))
                            . #1#)
                      (EXIT
                       (LETT |den|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT $ 44)) |nf|
                                        (QREFELT $ 34))
                              (SPADCALL 3 8 (QREFELT $ 39)) (QREFELT $ 41))
                             . #1#)))))
                   (EXIT
                    (SPADCALL (SPADCALL |num| |den| (QREFELT $ 35))
                              (QREFELT $ 46))))))))))) 

(DEFUN |GALFACTU;singleFactorBound;UPI;7| (|p| $)
  (SPADCALL |p| 2 (QREFELT $ 47))) 

(DEFUN |GALFACTU;rootBound;UPI;8| (|p| $)
  (PROG (|b4| |b3| |b2| |cl| |b1| |c| #1=#:G126 |i| |lc| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |p| (QREFELT $ 28))
            . #2=(|GALFACTU;rootBound;UPI;8|))
      (EXIT
       (COND ((ZEROP |n|) 0)
             ('T
              (SEQ
               (LETT |lc|
                     (SPADCALL
                      (SPADCALL (SPADCALL |p| (QREFELT $ 49)) (QREFELT $ 19))
                      (QREFELT $ 20))
                     . #2#)
               (LETT |b1| (|spadConstant| $ 16) . #2#)
               (LETT |b2| (|spadConstant| $ 16) . #2#)
               (LETT |b3| (|spadConstant| $ 16) . #2#)
               (LETT |b4| (|spadConstant| $ 16) . #2#)
               (LETT |c| (|spadConstant| $ 16) . #2#)
               (LETT |cl| (|spadConstant| $ 16) . #2#)
               (SEQ (LETT |i| 1 . #2#) G190
                    (COND ((|greater_SI| |i| |n|) (GO G191)))
                    (SEQ
                     (LETT |c|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |p|
                                       (PROG1 (LETT #1# (- |n| |i|) . #2#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       (QREFELT $ 50))
                             (QREFELT $ 19))
                            (QREFELT $ 20))
                           . #2#)
                     (LETT |b1| (SPADCALL |b1| |c| (QREFELT $ 26)) . #2#)
                     (LETT |cl| (SPADCALL |c| |lc| (QREFELT $ 35)) . #2#)
                     (LETT |b2|
                           (SPADCALL |b2| (SPADCALL |cl| |i| (QREFELT $ 24))
                                     (QREFELT $ 26))
                           . #2#)
                     (LETT |b3|
                           (SPADCALL |b3|
                                     (SPADCALL
                                      (SPADCALL |cl|
                                                (SPADCALL |n| |i|
                                                          (QREFELT $ 51))
                                                (QREFELT $ 35))
                                      |i| (QREFELT $ 24))
                                     (QREFELT $ 26))
                           . #2#)
                     (EXIT
                      (LETT |b4|
                            (SPADCALL |b4|
                                      (SPADCALL
                                       (SPADCALL |n| |cl| (QREFELT $ 52)) |i|
                                       (QREFELT $ 24))
                                      (QREFELT $ 26))
                            . #2#)))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (MIN
                 (+ 1
                    (SPADCALL (SPADCALL |b1| |lc| (QREFELT $ 35))
                              (QREFELT $ 53)))
                 (MIN
                  (SPADCALL (SPADCALL 2 |b2| (QREFELT $ 42)) (QREFELT $ 53))
                  (MIN
                   (SPADCALL
                    (SPADCALL |b3|
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 (QREFELT $ 29)) |n|
                                         (QREFELT $ 24))
                               (|spadConstant| $ 31) (QREFELT $ 54))
                              (QREFELT $ 35))
                    (QREFELT $ 53))
                   (SPADCALL |b4| (QREFELT $ 53)))))))))))))) 

(DEFUN |GALFACTU;beauzamyBound;UPI;9| (|f| $)
  (PROG (|d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |f| (QREFELT $ 28)) |GALFACTU;beauzamyBound;UPI;9|)
      (EXIT
       (COND
        ((ZEROP |d|) (SPADCALL (SPADCALL |f| (QREFELT $ 30)) (QREFELT $ 46)))
        ('T
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |f| (QREFELT $ 30))
                     (SPADCALL (SPADCALL 3 (QREFELT $ 29))
                               (SPADCALL (SPADCALL 3 4 (QREFELT $ 39))
                                         (SPADCALL |d| 2 (QREFELT $ 39))
                                         (QREFELT $ 40))
                               (QREFELT $ 41))
                     (QREFELT $ 34))
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 44))
                                (SPADCALL |d| (QREFELT $ 29)) (QREFELT $ 34))
                      (QREFELT $ 56))
                     (QREFELT $ 42))
           (QREFELT $ 35))
          (QREFELT $ 46))))))))) 

(DEFUN |GALFACTU;bombieriNorm;UPPiF;10| (|f| |p| $)
  (PROG (|b| #1=#:G157 |dd| #2=#:G140 |i| #3=#:G161 |d|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |d| (SPADCALL |f| (QREFELT $ 28))
              . #4=(|GALFACTU;bombieriNorm;UPPiF;10|))
        (LETT |b|
              (SPADCALL
               (SPADCALL (SPADCALL |f| 0 (QREFELT $ 50)) (QREFELT $ 19))
               (QREFELT $ 20))
              . #4#)
        (COND ((ZEROP |d|) (PROGN (LETT #3# |b| . #4#) (GO #3#)))
              ('T (LETT |b| (SPADCALL |b| |p| (QREFELT $ 21)) . #4#)))
        (LETT |b|
              (SPADCALL |b|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT $ 49))
                                    (QREFELT $ 19))
                          (QREFELT $ 20))
                         |p| (QREFELT $ 21))
                        (QREFELT $ 22))
              . #4#)
        (LETT |dd| (QUOTIENT2 (- |d| 1) 2) . #4#)
        (SEQ (LETT |i| 1 . #4#) G190 (COND ((|greater_SI| |i| |dd|) (GO G191)))
             (SEQ
              (EXIT
               (LETT |b|
                     (SPADCALL |b|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |f| |i| (QREFELT $ 50))
                                             (QREFELT $ 19))
                                   (QREFELT $ 20))
                                  |p| (QREFELT $ 21))
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |f|
                                              (PROG1
                                                  (LETT #2# (- |d| |i|) . #4#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              (QREFELT $ 50))
                                    (QREFELT $ 19))
                                   (QREFELT $ 20))
                                  |p| (QREFELT $ 21))
                                 (QREFELT $ 22))
                                (SPADCALL |d| |i| (QREFELT $ 51))
                                (QREFELT $ 35))
                               (QREFELT $ 22))
                     . #4#)))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (COND
         ((SPADCALL |d| (QREFELT $ 61))
          (SEQ (LETT |dd| (+ |dd| 1) . #4#)
               (EXIT
                (LETT |b|
                      (SPADCALL |b|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |f|
                                              (PROG1 (LETT #1# |dd| . #4#)
                                                (|check_subtype| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))
                                              (QREFELT $ 50))
                                    (QREFELT $ 19))
                                   (QREFELT $ 20))
                                  |p| (QREFELT $ 21))
                                 (SPADCALL |d| |dd| (QREFELT $ 51))
                                 (QREFELT $ 35))
                                (QREFELT $ 22))
                      . #4#)))))
        (EXIT (SPADCALL |b| |p| (QREFELT $ 24)))))
      #3# (EXIT #3#))))) 

(DEFUN |GALFACTU;bombieriNorm;UPF;11| (|f| $) (SPADCALL |f| 2 (QREFELT $ 62))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizationUtilities;|)) 

(DEFUN |GaloisGroupFactorizationUtilities| (&REST #1=#:G163)
  (PROG ()
    (RETURN
     (PROG (#2=#:G164)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GaloisGroupFactorizationUtilities|)
                                           '|domainEqualList|)
                . #3=(|GaloisGroupFactorizationUtilities|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |GaloisGroupFactorizationUtilities;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GaloisGroupFactorizationUtilities|))))))))))) 

(DEFUN |GaloisGroupFactorizationUtilities;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GaloisGroupFactorizationUtilities|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|GaloisGroupFactorizationUtilities| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 63) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GaloisGroupFactorizationUtilities|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GaloisGroupFactorizationUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) |GALFACTU;infinityNorm;UPF;5|
              |GALFACTU;height;UPF;1| (0 . |One|) (4 . |One|)
              (|PositiveInteger|) |GALFACTU;norm;UPPiF;3|
              |GALFACTU;length;UPF;2| (8 . |Zero|) (|List| 6)
              (12 . |coefficients|) (17 . |coerce|) (22 . |abs|) (27 . ^)
              (33 . +) (|Integer|) (39 . |nthRoot|)
              |GALFACTU;quadraticNorm;UPF;4| (45 . |max|)
              (|NonNegativeInteger|) (51 . |degree|) (56 . |coerce|)
              |GALFACTU;bombieriNorm;UPF;11| (61 . |One|) (65 . |Gamma|)
              (70 . *) (76 . *) (82 . /) (|OutputForm|) (88 . /)
              (|Fraction| 23) (94 . /) (100 . +) (106 . ^) (112 . *)
              (118 . |exp|) (123 . |pi|) (|GaloisGroupUtilities| 8)
              (127 . |safeFloor|) |GALFACTU;singleFactorBound;UPNniI;6|
              |GALFACTU;singleFactorBound;UPI;7| (132 . |leadingCoefficient|)
              (137 . |coefficient|) (143 . |pascalTriangle|) (149 . *)
              (155 . |safeCeiling|) (160 . -) |GALFACTU;rootBound;UPI;8|
              (166 . |sqrt|) |GALFACTU;beauzamyBound;UPI;9| (171 . |Zero|)
              (175 . |Zero|) (|Boolean|) (179 . |even?|)
              |GALFACTU;bombieriNorm;UPPiF;10|)
           '#(|singleFactorBound| 184 |rootBound| 195 |quadraticNorm| 200
              |norm| 205 |length| 211 |infinityNorm| 216 |height| 221
              |bombieriNorm| 226 |beauzamyBound| 237)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(0 6 0 11 0 7 0 12 0 8 0 16 1
                                                   7 17 0 18 1 8 0 6 19 1 8 0 0
                                                   20 2 8 0 0 13 21 2 8 0 0 0
                                                   22 2 8 0 0 23 24 2 8 0 0 0
                                                   26 1 7 27 0 28 1 8 0 23 29 0
                                                   8 0 31 1 8 0 0 32 2 27 0 13
                                                   0 33 2 8 0 0 0 34 2 8 0 0 0
                                                   35 2 36 0 0 0 37 2 38 0 23
                                                   23 39 2 38 0 0 0 40 2 8 0 0
                                                   38 41 2 8 0 13 0 42 1 8 0 0
                                                   43 0 8 0 44 1 45 23 8 46 1 7
                                                   6 0 49 2 7 6 0 27 50 2 45 8
                                                   27 23 51 2 8 0 27 0 52 1 45
                                                   23 8 53 2 8 0 0 0 54 1 8 0 0
                                                   56 0 6 0 58 0 7 0 59 1 23 60
                                                   0 61 2 0 23 7 27 47 1 0 23 7
                                                   48 1 0 23 7 55 1 0 8 7 25 2
                                                   0 8 7 13 14 1 0 8 7 15 1 0 8
                                                   7 9 1 0 8 7 10 1 0 8 7 30 2
                                                   0 8 7 13 62 1 0 23 7 57)))))
           '|lookupComplete|)) 
