
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
     (SEQ (LETT |nrm| (ANROWS |m|) . #2=(|QFCAT-;reducedSystem;MM;6|))
          (LETT |ncm| (ANCOLS |m|) . #2#)
          (LETT |ans| (MAKE_MATRIX1 |nrm| |ncm| (|spadConstant| $ 24)) . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |nrm|) (GO G191)))
               (SEQ
                (LETT |d|
                      (SPADCALL (SPADCALL |m| |i| (QREFELT $ 28))
                                (QREFELT $ 30))
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
                                                             (QREFELT $ 31))
                                                   . #2#)
                                             (QCDR #1#)
                                           (|check_union| (QEQCAR #1# 0)
                                                          (QREFELT $ 7) #1#))
                                         (SPADCALL |ell| (QREFELT $ 8))
                                         (QREFELT $ 32))
                                        1 1)))
                      (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |QFCAT-;characteristic;Nni;7| ($) (SPADCALL (QREFELT $ 37))) 

(DEFUN |QFCAT-;differentiate;AMA;8| (|x| |deriv| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |x| (QREFELT $ 8))
            . #1=(|QFCAT-;differentiate;AMA;8|))
      (LETT |d| (SPADCALL |x| (QREFELT $ 11)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |n| |deriv|) |d| (QREFELT $ 32))
                  (SPADCALL |n| (SPADCALL |d| |deriv|) (QREFELT $ 32))
                  (QREFELT $ 39))
        (SPADCALL |d| 2 (QREFELT $ 41)) (QREFELT $ 15))))))) 

(DEFUN |QFCAT-;convert;AIf;9| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 44))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 44))
            (QREFELT $ 45))) 

(DEFUN |QFCAT-;convert;AF;10| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 48))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 48))
            (QREFELT $ 49))) 

(DEFUN |QFCAT-;convert;ADf;11| (|x| $)
  (|div_DF| (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 52))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 52)))) 

(DEFUN |QFCAT-;<;2AB;12| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (SPADCALL |y| (QREFELT $ 11))
             (QREFELT $ 32))
   (SPADCALL (SPADCALL |y| (QREFELT $ 8)) (SPADCALL |x| (QREFELT $ 11))
             (QREFELT $ 32))
   (QREFELT $ 55))) 

(DEFUN |QFCAT-;smaller?;2AB;13| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (SPADCALL |y| (QREFELT $ 11))
             (QREFELT $ 32))
   (SPADCALL (SPADCALL |y| (QREFELT $ 8)) (SPADCALL |x| (QREFELT $ 11))
             (QREFELT $ 32))
   (QREFELT $ 57))) 

(DEFUN |QFCAT-;fractionPart;2A;14| (|x| $)
  (SPADCALL |x| (SPADCALL (SPADCALL |x| (QREFELT $ 59)) (QREFELT $ 9))
            (QREFELT $ 60))) 

(DEFUN |QFCAT-;coerce;SA;15| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 63)) (QREFELT $ 9))) 

(DEFUN |QFCAT-;retract;AS;16| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 65)) (QREFELT $ 66))) 

(DEFUN |QFCAT-;retractIfCan;AU;17| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 69)) |QFCAT-;retractIfCan;AU;17|)
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |r|) (QREFELT $ 71))))))))) 

(DEFUN |QFCAT-;convert;AP;18| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 74))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 74))
            (QREFELT $ 75))) 

(DEFUN |QFCAT-;patternMatch;AP2Pmr;19| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 79))) 

(DEFUN |QFCAT-;convert;AP;20| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 83))
            (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 83))
            (QREFELT $ 84))) 

(DEFUN |QFCAT-;patternMatch;AP2Pmr;21| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 88))) 

(DEFUN |QFCAT-;coerce;FA;22| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 93))
            (SPADCALL (SPADCALL |x| (QREFELT $ 94)) (QREFELT $ 93))
            (QREFELT $ 95))) 

(DEFUN |QFCAT-;retract;AI;23| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 65)) (QREFELT $ 97))) 

(DEFUN |QFCAT-;retractIfCan;AU;24| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 69)) |QFCAT-;retractIfCan;AU;24|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |u|) (QREFELT $ 100))))))))) 

(DEFUN |QFCAT-;random;A;25| ($)
  (PROG (|d|)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL
               (LETT |d| (SPADCALL (QREFELT $ 102)) |QFCAT-;random;A;25|)
               (QREFELT $ 103)))
             (GO G191)))
           (SEQ (EXIT |d|)) NIL (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (SPADCALL (QREFELT $ 102)) |d| (QREFELT $ 15))))))) 

(DEFUN |QFCAT-;reducedSystem;MVR;26| (|m| |v| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n|
            (SPADCALL
             (SPADCALL (SPADCALL |v| (QREFELT $ 105)) |m| (QREFELT $ 106))
             (QREFELT $ 107))
            |QFCAT-;reducedSystem;MVR;26|)
      (EXIT
       (CONS
        (SPADCALL |n| 1 (SPADCALL |n| (QREFELT $ 108)) (+ 1 1)
                  (SPADCALL |n| (QREFELT $ 109)) (QREFELT $ 110))
        (SPADCALL |n| 1 (QREFELT $ 112)))))))) 

(DECLAIM (NOTINLINE |QuotientFieldCategory&;|)) 

(DEFUN |QuotientFieldCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|QuotientFieldCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|QuotientFieldCategory&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 122) . #1#)
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
        (QSETREFV $ 46 (CONS (|dispatchFunction| |QFCAT-;convert;AIf;9|) $))))
      (COND
       ((|testBitVector| |pv$| 8)
        (PROGN
         (QSETREFV $ 50 (CONS (|dispatchFunction| |QFCAT-;convert;AF;10|) $))
         (QSETREFV $ 53
                   (CONS (|dispatchFunction| |QFCAT-;convert;ADf;11|) $)))))
      (COND
       ((|testBitVector| |pv$| 11)
        (QSETREFV $ 56 (CONS (|dispatchFunction| |QFCAT-;<;2AB;12|) $))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 58
                  (CONS (|dispatchFunction| |QFCAT-;smaller?;2AB;13|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 61
                  (CONS (|dispatchFunction| |QFCAT-;fractionPart;2A;14|) $))))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 64 (CONS (|dispatchFunction| |QFCAT-;coerce;SA;15|) $))
         (QSETREFV $ 67 (CONS (|dispatchFunction| |QFCAT-;retract;AS;16|) $))
         (QSETREFV $ 72
                   (CONS (|dispatchFunction| |QFCAT-;retractIfCan;AU;17|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
        (PROGN
         (QSETREFV $ 76 (CONS (|dispatchFunction| |QFCAT-;convert;AP;18|) $))
         (COND
          ((|HasCategory| |#2| '(|PatternMatchable| (|Integer|)))
           (QSETREFV $ 81
                     (CONS (|dispatchFunction| |QFCAT-;patternMatch;AP2Pmr;19|)
                           $)))))))
      (COND
       ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
        (PROGN
         (QSETREFV $ 85 (CONS (|dispatchFunction| |QFCAT-;convert;AP;20|) $))
         (COND
          ((|HasCategory| |#2| '(|PatternMatchable| (|Float|)))
           (QSETREFV $ 90
                     (CONS (|dispatchFunction| |QFCAT-;patternMatch;AP2Pmr;21|)
                           $)))))))
      (COND
       ((|testBitVector| |pv$| 12)
        (PROGN
         (QSETREFV $ 96 (CONS (|dispatchFunction| |QFCAT-;coerce;FA;22|) $))
         (COND ((|domainEqual| |#2| (|Integer|)))
               ('T
                (PROGN
                 (QSETREFV $ 98
                           (CONS (|dispatchFunction| |QFCAT-;retract;AI;23|)
                                 $))
                 (QSETREFV $ 101
                           (CONS
                            (|dispatchFunction| |QFCAT-;retractIfCan;AU;24|)
                            $))))))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 104 (CONS (|dispatchFunction| |QFCAT-;random;A;25|) $))))
      $)))) 

(MAKEPROP '|QuotientFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |numer|) (5 . |coerce|) |QFCAT-;numerator;2A;1|
              (10 . |denom|) |QFCAT-;denominator;2A;2| (15 . |init|)
              (19 . |One|) (23 . /) (29 . |init|) (|Union| $ '"failed")
              (33 . |nextItem|) (38 . |One|) (42 . |nextItem|) (|Mapping| 7 7)
              |QFCAT-;map;M2A;5| (47 . |Zero|) (51 . |Zero|) (|Vector| 6)
              (|Integer|) (|Matrix| 6) (55 . |row|)
              (|CommonDenominator| 7 6 25) (61 . |commonDenominator|)
              (66 . |exquo|) (72 . *) (|Matrix| 7) (|Matrix| $)
              |QFCAT-;reducedSystem;MM;6| (|NonNegativeInteger|)
              (78 . |characteristic|) |QFCAT-;characteristic;Nni;7| (82 . -)
              (|PositiveInteger|) (88 . ^) |QFCAT-;differentiate;AMA;8|
              (|InputForm|) (94 . |convert|) (99 . /) (105 . |convert|)
              (|Float|) (110 . |convert|) (115 . /) (121 . |convert|)
              (|DoubleFloat|) (126 . |convert|) (131 . |convert|) (|Boolean|)
              (136 . <) (142 . <) (148 . |smaller?|) (154 . |smaller?|)
              (160 . |wholePart|) (165 . -) (171 . |fractionPart|) (|Symbol|)
              (176 . |coerce|) (181 . |coerce|) (186 . |retract|)
              (191 . |retract|) (196 . |retract|) (|Union| 7 '#1="failed")
              (201 . |retractIfCan|) (|Union| 62 '#1#) (206 . |retractIfCan|)
              (211 . |retractIfCan|) (|Pattern| 26) (216 . |convert|) (221 . /)
              (227 . |convert|) (|PatternMatchResult| 26 6)
              (|PatternMatchQuotientFieldCategory| 26 7 6)
              (232 . |patternMatch|) (|PatternMatchResult| 26 $)
              (239 . |patternMatch|) (|Pattern| 47) (246 . |convert|) (251 . /)
              (257 . |convert|) (|PatternMatchResult| 47 6)
              (|PatternMatchQuotientFieldCategory| 47 7 6)
              (262 . |patternMatch|) (|PatternMatchResult| 47 $)
              (269 . |patternMatch|) (|Fraction| 26) (276 . |numer|)
              (281 . |coerce|) (286 . |denom|) (291 . /) (297 . |coerce|)
              (302 . |retract|) (307 . |retract|) (|Union| 26 '#1#)
              (312 . |retractIfCan|) (317 . |retractIfCan|) (322 . |random|)
              (326 . |zero?|) (331 . |random|) (335 . |coerce|)
              (340 . |horizConcat|) (346 . |reducedSystem|)
              (351 . |maxRowIndex|) (356 . |maxColIndex|) (361 . |subMatrix|)
              (|Vector| 7) (370 . |column|)
              (|Record| (|:| |mat| 33) (|:| |vec| 111)) (|Vector| $)
              |QFCAT-;reducedSystem;MVR;26| (|Union| 91 '#1#) (|Matrix| 26)
              (|Record| (|:| |mat| 117) (|:| |vec| (|Vector| 26))) (|List| 62)
              (|List| 36) (|OutputForm|))
           '#(|smaller?| 376 |retractIfCan| 382 |retract| 392 |reducedSystem|
              402 |random| 413 |patternMatch| 417 |numerator| 431 |nextItem|
              436 |map| 441 |init| 447 |fractionPart| 451 |differentiate| 456
              |denominator| 462 |convert| 467 |coerce| 492 |characteristic| 502
              < 506)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 115
                                                 '(1 6 7 0 8 1 6 0 7 9 1 6 7 0
                                                   11 0 7 0 13 0 7 0 14 2 6 0 7
                                                   7 15 0 0 0 16 1 7 17 0 18 0
                                                   6 0 19 1 0 17 0 20 0 6 0 23
                                                   0 7 0 24 2 27 25 0 26 28 1
                                                   29 7 25 30 2 7 17 0 0 31 2 7
                                                   0 0 0 32 0 7 36 37 2 7 0 0 0
                                                   39 2 7 0 0 40 41 1 7 43 0 44
                                                   2 43 0 0 0 45 1 0 43 0 46 1
                                                   7 47 0 48 2 47 0 0 0 49 1 0
                                                   47 0 50 1 7 51 0 52 1 0 51 0
                                                   53 2 7 54 0 0 55 2 0 54 0 0
                                                   56 2 7 54 0 0 57 2 0 54 0 0
                                                   58 1 6 7 0 59 2 6 0 0 0 60 1
                                                   0 0 0 61 1 7 0 62 63 1 0 0
                                                   62 64 1 6 7 0 65 1 7 62 0 66
                                                   1 0 62 0 67 1 6 68 0 69 1 7
                                                   70 0 71 1 0 70 0 72 1 7 73 0
                                                   74 2 73 0 0 0 75 1 0 73 0 76
                                                   3 78 77 6 73 77 79 3 0 80 0
                                                   73 80 81 1 7 82 0 83 2 82 0
                                                   0 0 84 1 0 82 0 85 3 87 86 6
                                                   82 86 88 3 0 89 0 82 89 90 1
                                                   91 26 0 92 1 6 0 26 93 1 91
                                                   26 0 94 2 6 0 0 0 95 1 0 0
                                                   91 96 1 7 26 0 97 1 0 26 0
                                                   98 1 7 99 0 100 1 0 99 0 101
                                                   0 7 0 102 1 7 54 0 103 0 0 0
                                                   104 1 27 0 25 105 2 27 0 0 0
                                                   106 1 6 33 34 107 1 33 26 0
                                                   108 1 33 26 0 109 5 33 0 0
                                                   26 26 26 26 110 2 33 111 0
                                                   26 112 2 0 54 0 0 58 1 0 99
                                                   0 101 1 0 70 0 72 1 0 26 0
                                                   98 1 0 62 0 67 1 0 33 34 35
                                                   2 0 113 34 114 115 0 0 0 104
                                                   3 0 89 0 82 89 90 3 0 80 0
                                                   73 80 81 1 0 0 0 10 1 0 17 0
                                                   20 2 0 0 21 0 22 0 0 0 16 1
                                                   0 0 0 61 2 0 0 0 21 42 1 0 0
                                                   0 12 1 0 47 0 50 1 0 51 0 53
                                                   1 0 43 0 46 1 0 82 0 85 1 0
                                                   73 0 76 1 0 0 62 64 1 0 0 91
                                                   96 0 0 36 38 2 0 54 0 0
                                                   56)))))
           '|lookupComplete|)) 
