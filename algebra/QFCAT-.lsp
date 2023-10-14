
(/VERSIONCHECK 2) 

(DEFUN |QFCAT-;numerator;2A;1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 9))) 

(DEFUN |QFCAT-;denominator;2A;2| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 9))) 

(DEFUN |QFCAT-;init;A;3| ($)
  (SPADCALL (|spadConstant| $ 13) (|spadConstant| $ 14) (QREFELT $ 15))) 

(DEFUN |QFCAT-;nextItem;AU;4| (|n| $)
  (PROG (|m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL (SPADCALL |n| (QREFELT $ 8)) (QREFELT $ 18))
            |QFCAT-;nextItem;AU;4|)
      (EXIT
       (COND
        ((QEQCAR |m| 1)
         (|error| "We seem to have a Fraction of a finite object"))
        ('T
         (CONS 0
               (SPADCALL (QCDR |m|) (|spadConstant| $ 14)
                         (QREFELT $ 15)))))))))) 

(DEFUN |QFCAT-;map;M2A;5| (|fn| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) |fn|)
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |fn|) (QREFELT $ 15))) 

(DEFUN |QFCAT-;reducedSystem;MM;6| (|m| $)
  (PROG (#1=#:G148 |ell| |j| |d| |i| |ans| |ncm| |nrm|)
    (RETURN
     (SEQ (LETT |nrm| (QVSIZE |m|) . #2=(|QFCAT-;reducedSystem;MM;6|))
          (LETT |ncm| (SPADCALL |m| (QREFELT $ 25)) . #2#)
          (LETT |ans|
                (SPADCALL |nrm| |ncm| (|spadConstant| $ 27) (QREFELT $ 29))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |nrm|) (GO G191)))
               (SEQ
                (LETT |d|
                      (SPADCALL (SPADCALL |m| |i| (QREFELT $ 32))
                                (QREFELT $ 34))
                      . #2#)
                (EXIT
                 (SEQ (LETT |j| 1 . #2#) G190
                      (COND ((|greater_SI| |j| |ncm|) (GO G191)))
                      (SEQ (LETT |ell| (QAREF2O |m| |i| |j| 1 1) . #2#)
                           (EXIT
                            (QSETAREF2O |ans| |i| |j|
                                        (SPADCALL
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL |d|
                                                             (SPADCALL |ell|
                                                                       (QREFELT
                                                                        $ 11))
                                                             (QREFELT $ 35))
                                                   . #2#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 0)
                                                          (QREFELT $ 7) #1#))
                                         (SPADCALL |ell| (QREFELT $ 8))
                                         (QREFELT $ 36))
                                        1 1)))
                      (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |QFCAT-;characteristic;Nni;7| ($) (SPADCALL (QREFELT $ 39))) 

(DEFUN |QFCAT-;differentiate;AMA;8| (|x| |deriv| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |x| (QREFELT $ 8))
            . #1=(|QFCAT-;differentiate;AMA;8|))
      (LETT |d| (SPADCALL |x| (QREFELT $ 11)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |n| |deriv|) |d| (QREFELT $ 36))
                  (SPADCALL |n| (SPADCALL |d| |deriv|) (QREFELT $ 36))
                  (QREFELT $ 41))
        (SPADCALL |d| 2 (QREFELT $ 43)) (QREFELT $ 15))))))) 

(DEFUN |QFCAT-;convert;AIf;9| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 46))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 46))
            (QREFELT $ 47))) 

(DEFUN |QFCAT-;convert;AF;10| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 50))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 50))
            (QREFELT $ 51))) 

(DEFUN |QFCAT-;convert;ADf;11| (|x| $)
  (|div_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 54))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 54)))) 

(DEFUN |QFCAT-;<;2AB;12| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (SPADCALL |y| (QREFELT $ 11))
             (QREFELT $ 36))
   (SPADCALL (SPADCALL |y| (QREFELT $ 8)) (SPADCALL |x| (QREFELT $ 11))
             (QREFELT $ 36))
   (QREFELT $ 57))) 

(DEFUN |QFCAT-;smaller?;2AB;13| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (SPADCALL |y| (QREFELT $ 11))
             (QREFELT $ 36))
   (SPADCALL (SPADCALL |y| (QREFELT $ 8)) (SPADCALL |x| (QREFELT $ 11))
             (QREFELT $ 36))
   (QREFELT $ 59))) 

(DEFUN |QFCAT-;fractionPart;2A;14| (|x| $)
  (SPADCALL |x| (SPADCALL (SPADCALL |x| (QREFELT $ 61)) (QREFELT $ 9))
            (QREFELT $ 62))) 

(DEFUN |QFCAT-;coerce;SA;15| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 65)) (QREFELT $ 9))) 

(DEFUN |QFCAT-;retract;AS;16| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 67)) (QREFELT $ 68))) 

(DEFUN |QFCAT-;retractIfCan;AU;17| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 71)) |QFCAT-;retractIfCan;AU;17|)
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |r|) (QREFELT $ 73))))))))) 

(DEFUN |QFCAT-;convert;AP;18| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 76))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 76))
            (QREFELT $ 77))) 

(DEFUN |QFCAT-;patternMatch;AP2Pmr;19| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 81))) 

(DEFUN |QFCAT-;convert;AP;20| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 85))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 85))
            (QREFELT $ 86))) 

(DEFUN |QFCAT-;patternMatch;AP2Pmr;21| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 90))) 

(DEFUN |QFCAT-;coerce;FA;22| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 94)) (QREFELT $ 95))
            (SPADCALL (SPADCALL |x| (QREFELT $ 96)) (QREFELT $ 95))
            (QREFELT $ 97))) 

(DEFUN |QFCAT-;retract;AI;23| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 67)) (QREFELT $ 99))) 

(DEFUN |QFCAT-;retractIfCan;AU;24| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 71)) |QFCAT-;retractIfCan;AU;24|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |u|) (QREFELT $ 102))))))))) 

(DEFUN |QFCAT-;random;A;25| ($)
  (PROG (|d|)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL
               (LETT |d| (SPADCALL (QREFELT $ 104)) |QFCAT-;random;A;25|)
               (QREFELT $ 105)))
             (GO G191)))
           (SEQ (EXIT |d|)) NIL (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (SPADCALL (QREFELT $ 104)) |d| (QREFELT $ 15))))))) 

(DEFUN |QFCAT-;reducedSystem;MVR;26| (|m| |v| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n|
            (SPADCALL
             (SPADCALL (SPADCALL |v| (QREFELT $ 107)) |m| (QREFELT $ 108))
             (QREFELT $ 109))
            |QFCAT-;reducedSystem;MVR;26|)
      (EXIT
       (CONS
        (SPADCALL |n| 1 (SPADCALL |n| (QREFELT $ 110)) (+ 1 1)
                  (SPADCALL |n| (QREFELT $ 111)) (QREFELT $ 112))
        (SPADCALL |n| 1 (QREFELT $ 114)))))))) 

(DEFUN |QuotientFieldCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|QuotientFieldCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|QuotientFieldCategory&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 124) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|IntegerNumberSystem|))
                                          (|HasCategory| |#2|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#2|
                                                         '(|RealConstant|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedIntegralDomain|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|StepThrough|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 13)
        (PROGN
         (QSETREFV $ 16 (CONS (|dispatchFunction| |QFCAT-;init;A;3|) $))
         (QSETREFV $ 20
                   (CONS (|dispatchFunction| |QFCAT-;nextItem;AU;4|) $)))))
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 48 (CONS (|dispatchFunction| |QFCAT-;convert;AIf;9|) $))))
      (COND
       ((|testBitVector| |pv$| 8)
        (PROGN
         (QSETREFV $ 52 (CONS (|dispatchFunction| |QFCAT-;convert;AF;10|) $))
         (QSETREFV $ 55
                   (CONS (|dispatchFunction| |QFCAT-;convert;ADf;11|) $)))))
      (COND
       ((|testBitVector| |pv$| 11)
        (QSETREFV $ 58 (CONS (|dispatchFunction| |QFCAT-;<;2AB;12|) $))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 60
                  (CONS (|dispatchFunction| |QFCAT-;smaller?;2AB;13|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 63
                  (CONS (|dispatchFunction| |QFCAT-;fractionPart;2A;14|) $))))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 66 (CONS (|dispatchFunction| |QFCAT-;coerce;SA;15|) $))
         (QSETREFV $ 69 (CONS (|dispatchFunction| |QFCAT-;retract;AS;16|) $))
         (QSETREFV $ 74
                   (CONS (|dispatchFunction| |QFCAT-;retractIfCan;AU;17|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
        (PROGN
         (QSETREFV $ 78 (CONS (|dispatchFunction| |QFCAT-;convert;AP;18|) $))
         (COND
          ((|HasCategory| |#2| '(|PatternMatchable| (|Integer|)))
           (QSETREFV $ 83
                     (CONS (|dispatchFunction| |QFCAT-;patternMatch;AP2Pmr;19|)
                           $)))))))
      (COND
       ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
        (PROGN
         (QSETREFV $ 87 (CONS (|dispatchFunction| |QFCAT-;convert;AP;20|) $))
         (COND
          ((|HasCategory| |#2| '(|PatternMatchable| (|Float|)))
           (QSETREFV $ 92
                     (CONS (|dispatchFunction| |QFCAT-;patternMatch;AP2Pmr;21|)
                           $)))))))
      (COND
       ((|testBitVector| |pv$| 12)
        (PROGN
         (QSETREFV $ 98 (CONS (|dispatchFunction| |QFCAT-;coerce;FA;22|) $))
         (COND ((|domainEqual| |#2| (|Integer|)))
               ('T
                (PROGN
                 (QSETREFV $ 100
                           (CONS (|dispatchFunction| |QFCAT-;retract;AI;23|)
                                 $))
                 (QSETREFV $ 103
                           (CONS
                            (|dispatchFunction| |QFCAT-;retractIfCan;AU;24|)
                            $))))))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 106 (CONS (|dispatchFunction| |QFCAT-;random;A;25|) $))))
      $)))) 

(MAKEPROP '|QuotientFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |numer|) (5 . |coerce|) |QFCAT-;numerator;2A;1|
              (10 . |denom|) |QFCAT-;denominator;2A;2| (15 . |init|)
              (19 . |One|) (23 . /) (29 . |init|) (|Union| $ '"failed")
              (33 . |nextItem|) (38 . |One|) (42 . |nextItem|) (|Mapping| 7 7)
              |QFCAT-;map;M2A;5| (|NonNegativeInteger|) (|Matrix| 6)
              (47 . |ncols|) (52 . |Zero|) (56 . |Zero|) (|Matrix| 7)
              (60 . |new|) (|Vector| 6) (|Integer|) (67 . |row|)
              (|CommonDenominator| 7 6 30) (73 . |commonDenominator|)
              (78 . |exquo|) (84 . *) (|Matrix| $) |QFCAT-;reducedSystem;MM;6|
              (90 . |characteristic|) |QFCAT-;characteristic;Nni;7| (94 . -)
              (|PositiveInteger|) (100 . ^) |QFCAT-;differentiate;AMA;8|
              (|InputForm|) (106 . |convert|) (111 . /) (117 . |convert|)
              (|Float|) (122 . |convert|) (127 . /) (133 . |convert|)
              (|DoubleFloat|) (138 . |convert|) (143 . |convert|) (|Boolean|)
              (148 . <) (154 . <) (160 . |smaller?|) (166 . |smaller?|)
              (172 . |wholePart|) (177 . -) (183 . |fractionPart|) (|Symbol|)
              (188 . |coerce|) (193 . |coerce|) (198 . |retract|)
              (203 . |retract|) (208 . |retract|) (|Union| 7 '#1="failed")
              (213 . |retractIfCan|) (|Union| 64 '#1#) (218 . |retractIfCan|)
              (223 . |retractIfCan|) (|Pattern| 31) (228 . |convert|) (233 . /)
              (239 . |convert|) (|PatternMatchResult| 31 6)
              (|PatternMatchQuotientFieldCategory| 31 7 6)
              (244 . |patternMatch|) (|PatternMatchResult| 31 $)
              (251 . |patternMatch|) (|Pattern| 49) (258 . |convert|) (263 . /)
              (269 . |convert|) (|PatternMatchResult| 49 6)
              (|PatternMatchQuotientFieldCategory| 49 7 6)
              (274 . |patternMatch|) (|PatternMatchResult| 49 $)
              (281 . |patternMatch|) (|Fraction| 31) (288 . |numer|)
              (293 . |coerce|) (298 . |denom|) (303 . /) (309 . |coerce|)
              (314 . |retract|) (319 . |retract|) (|Union| 31 '#1#)
              (324 . |retractIfCan|) (329 . |retractIfCan|) (334 . |random|)
              (338 . |zero?|) (343 . |random|) (347 . |coerce|)
              (352 . |horizConcat|) (358 . |reducedSystem|)
              (363 . |maxRowIndex|) (368 . |maxColIndex|) (373 . |subMatrix|)
              (|Vector| 7) (382 . |column|)
              (|Record| (|:| |mat| 28) (|:| |vec| 113)) (|Vector| $)
              |QFCAT-;reducedSystem;MVR;26| (|Union| 93 '#1#) (|Matrix| 31)
              (|Record| (|:| |mat| 119) (|:| |vec| (|Vector| 31))) (|List| 64)
              (|List| 23) (|OutputForm|))
           '#(|smaller?| 388 |retractIfCan| 394 |retract| 404 |reducedSystem|
              414 |random| 425 |patternMatch| 429 |numerator| 443 |nextItem|
              448 |map| 453 |init| 459 |fractionPart| 463 |differentiate| 468
              |denominator| 474 |convert| 479 |coerce| 504 |characteristic| 514
              < 518)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 117
                                                 '(1 6 7 0 8 1 6 0 7 9 1 6 7 0
                                                   11 0 7 0 13 0 7 0 14 2 6 0 7
                                                   7 15 0 0 0 16 1 7 17 0 18 0
                                                   6 0 19 1 0 17 0 20 1 24 23 0
                                                   25 0 6 0 26 0 7 0 27 3 28 0
                                                   23 23 7 29 2 24 30 0 31 32 1
                                                   33 7 30 34 2 7 17 0 0 35 2 7
                                                   0 0 0 36 0 7 23 39 2 7 0 0 0
                                                   41 2 7 0 0 42 43 1 7 45 0 46
                                                   2 45 0 0 0 47 1 0 45 0 48 1
                                                   7 49 0 50 2 49 0 0 0 51 1 0
                                                   49 0 52 1 7 53 0 54 1 0 53 0
                                                   55 2 7 56 0 0 57 2 0 56 0 0
                                                   58 2 7 56 0 0 59 2 0 56 0 0
                                                   60 1 6 7 0 61 2 6 0 0 0 62 1
                                                   0 0 0 63 1 7 0 64 65 1 0 0
                                                   64 66 1 6 7 0 67 1 7 64 0 68
                                                   1 0 64 0 69 1 6 70 0 71 1 7
                                                   72 0 73 1 0 72 0 74 1 7 75 0
                                                   76 2 75 0 0 0 77 1 0 75 0 78
                                                   3 80 79 6 75 79 81 3 0 82 0
                                                   75 82 83 1 7 84 0 85 2 84 0
                                                   0 0 86 1 0 84 0 87 3 89 88 6
                                                   84 88 90 3 0 91 0 84 91 92 1
                                                   93 31 0 94 1 6 0 31 95 1 93
                                                   31 0 96 2 6 0 0 0 97 1 0 0
                                                   93 98 1 7 31 0 99 1 0 31 0
                                                   100 1 7 101 0 102 1 0 101 0
                                                   103 0 7 0 104 1 7 56 0 105 0
                                                   0 0 106 1 24 0 30 107 2 24 0
                                                   0 0 108 1 6 28 37 109 1 28
                                                   31 0 110 1 28 31 0 111 5 28
                                                   0 0 31 31 31 31 112 2 28 113
                                                   0 31 114 2 0 56 0 0 60 1 0
                                                   101 0 103 1 0 72 0 74 1 0 31
                                                   0 100 1 0 64 0 69 1 0 28 37
                                                   38 2 0 115 37 116 117 0 0 0
                                                   106 3 0 91 0 84 91 92 3 0 82
                                                   0 75 82 83 1 0 0 0 10 1 0 17
                                                   0 20 2 0 0 21 0 22 0 0 0 16
                                                   1 0 0 0 63 2 0 0 0 21 44 1 0
                                                   0 0 12 1 0 49 0 52 1 0 53 0
                                                   55 1 0 45 0 48 1 0 84 0 87 1
                                                   0 75 0 78 1 0 0 64 66 1 0 0
                                                   93 98 0 0 23 40 2 0 56 0 0
                                                   58)))))
           '|lookupComplete|)) 
