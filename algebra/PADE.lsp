
(DEFUN |PADE;constInner| (|up| $) (CONS 0 (CONS (LIST |up|) NIL))) 

(DEFUN |PADE;truncPoly| (|p| |n| $)
  (SEQ
   (SEQ G190 (COND ((NULL (< |n| (SPADCALL |p| (QREFELT $ 10)))) (GO G191)))
        (SEQ (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 11)) |PADE;truncPoly|)))
        NIL (GO G190) G191 (EXIT NIL))
   (EXIT |p|))) 

(DEFUN |PADE;truncSeries| (|s| |n| $)
  (PROG (|p| |i|)
    (RETURN
     (SEQ (LETT |p| (|spadConstant| $ 12) . #1=(|PADE;truncSeries|))
          (SEQ (LETT |i| 0 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (SPADCALL |p|
                                 (SPADCALL (SPADCALL |s| |i| (QREFELT $ 13))
                                           |i| (QREFELT $ 14))
                                 (QREFELT $ 15))
                       . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |p|))))) 

(DEFUN |PADE;divOutDegree| (|s| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #1=(|PADE;divOutDegree|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (EXIT (LETT |s| (SPADCALL |s| (QREFELT $ 16)) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |PADE;pade;2Nni2PSU;5| (|l| |m| |gps| |dps| $)
  (PROG (|approx| #1=#:G134 |d| #2=#:G135 |p| |dlist| |plist| |ad|)
    (RETURN
     (SEQ
      (LETT |ad| (|PADE;padeNormalize| |l| |m| |gps| |dps| $)
            . #3=(|PADE;pade;2Nni2PSU;5|))
      (EXIT
       (COND ((QEQCAR |ad| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |plist| (QCAR (QCDR |ad|)) . #3#)
                   (LETT |dlist| (QCDR (QCDR |ad|)) . #3#)
                   (LETT |approx|
                         (SPADCALL (|SPADfirst| |plist|) (QREFELT $ 18)) . #3#)
                   (SEQ (LETT |p| NIL . #3#) (LETT #2# (CDR |plist|) . #3#)
                        (LETT |d| NIL . #3#) (LETT #1# |dlist| . #3#) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #3#) NIL)
                              (ATOM #2#)
                              (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |approx|
                                (SPADCALL (SPADCALL |p| (QREFELT $ 18))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 19) |d|
                                                      (QREFELT $ 14))
                                            (QREFELT $ 18))
                                           |approx| (QREFELT $ 21))
                                          (QREFELT $ 22))
                                . #3#)))
                        (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                              . #3#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 |approx|)))))))))) 

(DEFUN |PADE;padecf;2Nni2PSU;6| (|l| |m| |gps| |dps| $)
  (PROG (|blist| #1=#:G147 |d| #2=#:G146 |alist| |ad|)
    (RETURN
     (SEQ
      (LETT |ad| (|PADE;padeNormalize| |l| |m| |gps| |dps| $)
            . #3=(|PADE;padecf;2Nni2PSU;6|))
      (EXIT
       (COND ((QEQCAR |ad| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |alist| (REVERSE (QCAR (QCDR |ad|))) . #3#)
                   (LETT |blist|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |d| NIL . #3#)
                               (LETT #1# (REVERSE (QCDR (QCDR |ad|))) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |d| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL (|spadConstant| $ 19) |d|
                                                  (QREFELT $ 14))
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (EXIT
                    (CONS 0
                          (SPADCALL (|SPADfirst| |alist|)
                                    (SPADCALL |blist| (QREFELT $ 27))
                                    (SPADCALL (CDR |alist|) (QREFELT $ 27))
                                    (QREFELT $ 29)))))))))))) 

(DEFUN |PADE;padeNormalize| (|l| |m| |gps| |dps| $)
  (PROG (|ldeg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |dps| (QREFELT $ 33)) (CONS 1 "failed"))
            ((SPADCALL |gps| (QREFELT $ 33))
             (|PADE;constInner| (|spadConstant| $ 12) $))
            ('T
             (SEQ
              (LETT |ldeg|
                    (MIN (SPADCALL |dps| (QREFELT $ 34))
                         (SPADCALL |gps| (QREFELT $ 34)))
                    . #1=(|PADE;padeNormalize|))
              (COND
               ((SPADCALL |ldeg| 0 (QREFELT $ 37))
                (SEQ (LETT |dps| (|PADE;divOutDegree| |dps| |ldeg| $) . #1#)
                     (EXIT
                      (LETT |gps| (|PADE;divOutDegree| |gps| |ldeg| $)
                            . #1#)))))
              (EXIT (|PADE;padeInner| |l| |m| |gps| |dps| $))))))))) 

(DEFUN |PADE;padeInner| (|l| |m| |gps| |dps| $)
  (PROG (|#G44| #1=#:G168 |#G43| |d| |g| |degbd| #2=#:G167 |h| #3=#:G163
         |alist| #4=#:G174 |alpha| |plist| |s| |p| #5=#:G161 |pk| |k| #6=#:G160
         |d0| |j| |#G40| |#G39| |#G38| #7=#:G157 |#G37| |#G36| |#G35| |#G34|
         |#G33|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |gps| 0 (QREFELT $ 13)) (QREFELT $ 38))
          (COND
           ((SPADCALL (SPADCALL |dps| 0 (QREFELT $ 13)) (QREFELT $ 38))
            (EXIT (|error| "Pade' problem not normalized."))))))
        (LETT |plist| NIL . #8=(|PADE;padeInner|)) (LETT |alist| NIL . #8#)
        (COND
         ((SPADCALL (SPADCALL |dps| 0 (QREFELT $ 13)) (QREFELT $ 38))
          (SEQ
           (PROGN
            (LETT |#G33| |dps| . #8#)
            (LETT |#G34| |gps| . #8#)
            (LETT |gps| |#G33| . #8#)
            (LETT |dps| |#G34| . #8#))
           (PROGN
            (LETT |#G35| |m| . #8#)
            (LETT |#G36| |l| . #8#)
            (LETT |l| |#G35| . #8#)
            (LETT |m| |#G36| . #8#))
           (LETT |plist| (CONS (|spadConstant| $ 12) |plist|) . #8#)
           (EXIT (LETT |alist| (CONS 0 |alist|) . #8#)))))
        (COND
         ((< |l| |m|)
          (SEQ (LETT |alpha| (SPADCALL |gps| (QREFELT $ 34)) . #8#)
               (COND
                ((SPADCALL |alpha| |l| (QREFELT $ 37))
                 (PROGN (LETT #4# (CONS 1 "failed") . #8#) (GO #4#))))
               (LETT |gps| (|PADE;divOutDegree| |gps| |alpha| $) . #8#)
               (PROGN
                (LETT |#G37| |m| . #8#)
                (LETT |#G38|
                      (PROG1 (LETT #7# (- |l| |alpha|) . #8#)
                        (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                         #7#))
                      . #8#)
                (LETT |l| |#G37| . #8#)
                (LETT |m| |#G38| . #8#))
               (PROGN
                (LETT |#G39| |dps| . #8#)
                (LETT |#G40| |gps| . #8#)
                (LETT |gps| |#G39| . #8#)
                (LETT |dps| |#G40| . #8#))
               (LETT |plist| (CONS (|spadConstant| $ 12) |plist|) . #8#)
               (EXIT (LETT |alist| (CONS |alpha| |alist|) . #8#)))))
        (LETT |degbd| (+ (+ |l| |m|) 1) . #8#)
        (LETT |g| (|PADE;truncSeries| |gps| |degbd| $) . #8#)
        (LETT |d| (|PADE;truncSeries| |dps| |degbd| $) . #8#)
        (EXIT
         (SEQ (LETT |j| 0 . #8#) G190 NIL
              (SEQ (LETT |d0| (SPADCALL |d| 0 (QREFELT $ 39)) . #8#)
                   (LETT |d|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 40) |d0| (QREFELT $ 41))
                          |d| (QREFELT $ 42))
                         . #8#)
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 40) |d0| (QREFELT $ 41))
                          |g| (QREFELT $ 42))
                         . #8#)
                   (LETT |p| (|spadConstant| $ 12) . #8#) (LETT |s| |g| . #8#)
                   (COND
                    ((< (+ (- |l| |m|) 1) 0) (|error| "Internal pade error")))
                   (LETT |degbd|
                         (PROG1 (LETT #6# (+ (- |l| |m|) 1) . #8#)
                           (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                            #6#))
                         . #8#)
                   (SEQ (LETT |k| 1 . #8#) G190
                        (COND ((|greater_SI| |k| |degbd|) (GO G191)))
                        (SEQ (LETT |pk| (SPADCALL |s| 0 (QREFELT $ 39)) . #8#)
                             (LETT |p|
                                   (SPADCALL |p|
                                             (SPADCALL |pk|
                                                       (PROG1
                                                           (LETT #5# (- |k| 1)
                                                                 . #8#)
                                                         (|check_subtype|
                                                          (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                                       (QREFELT $ 14))
                                             (QREFELT $ 15))
                                   . #8#)
                             (LETT |s|
                                   (SPADCALL |s|
                                             (SPADCALL |pk| |d| (QREFELT $ 43))
                                             (QREFELT $ 44))
                                   . #8#)
                             (EXIT
                              (LETT |s|
                                    (PROG2
                                        (LETT #3#
                                              (SPADCALL |s|
                                                        (SPADCALL
                                                         (|spadConstant| $ 19)
                                                         1 (QREFELT $ 14))
                                                        (QREFELT $ 47))
                                              . #8#)
                                        (QCDR #3#)
                                      (|check_union| (QEQCAR #3# 0)
                                                     (QREFELT $ 8) #3#))
                                    . #8#)))
                        (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |plist| (CONS |p| |plist|) . #8#)
                   (EXIT
                    (COND
                     ((SPADCALL |s| (|spadConstant| $ 12) (QREFELT $ 48))
                      (PROGN
                       (LETT #4# (CONS 0 (CONS |plist| |alist|)) . #8#)
                       (GO #4#)))
                     ('T
                      (SEQ
                       (LETT |alpha| (+ (SPADCALL |s| (QREFELT $ 49)) |degbd|)
                             . #8#)
                       (EXIT
                        (COND
                         ((SPADCALL |alpha| (+ |l| |m|) (QREFELT $ 37))
                          (PROGN
                           (LETT #4# (CONS 0 (CONS |plist| |alist|)) . #8#)
                           (GO #4#)))
                         ((SPADCALL |alpha| |l| (QREFELT $ 37))
                          (PROGN (LETT #4# (CONS 1 "failed") . #8#) (GO #4#)))
                         ('T
                          (SEQ (LETT |alist| (CONS |alpha| |alist|) . #8#)
                               (LETT |h|
                                     (PROG2
                                         (LETT #3#
                                               (SPADCALL |s|
                                                         (SPADCALL
                                                          (|spadConstant| $ 19)
                                                          (SPADCALL |s|
                                                                    (QREFELT $
                                                                             49))
                                                          (QREFELT $ 14))
                                                         (QREFELT $ 47))
                                               . #8#)
                                         (QCDR #3#)
                                       (|check_union| (QEQCAR #3# 0)
                                                      (QREFELT $ 8) #3#))
                                     . #8#)
                               (LETT |degbd|
                                     (PROG1
                                         (LETT #2# (- (+ |l| |m|) |alpha|)
                                               . #8#)
                                       (|check_subtype| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        #2#))
                                     . #8#)
                               (LETT |g| (|PADE;truncPoly| |d| |degbd| $)
                                     . #8#)
                               (LETT |d| (|PADE;truncPoly| |h| |degbd| $)
                                     . #8#)
                               (EXIT
                                (PROGN
                                 (LETT |#G43| |m| . #8#)
                                 (LETT |#G44|
                                       (PROG1 (LETT #1# (- |l| |alpha|) . #8#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       . #8#)
                                 (LETT |l| |#G43| . #8#)
                                 (LETT |m| |#G44| . #8#))))))))))))
              (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191 (EXIT NIL)))))
      #4# (EXIT #4#))))) 

(DECLAIM (NOTINLINE |PadeApproximants;|)) 

(DEFUN |PadeApproximants| (&REST #1=#:G175)
  (PROG ()
    (RETURN
     (PROG (#2=#:G176)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PadeApproximants|)
                                           '|domainEqualList|)
                . #3=(|PadeApproximants|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PadeApproximants;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PadeApproximants|))))))))))) 

(DEFUN |PadeApproximants;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PadeApproximants|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|PadeApproximants| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 50) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PadeApproximants| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PadeApproximants| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|NonNegativeInteger|) (0 . |degree|)
              (5 . |reductum|) (10 . |Zero|) (14 . |coefficient|)
              (20 . |monomial|) (26 . +) (32 . |quoByVar|) (|Fraction| 8)
              (37 . |coerce|) (42 . |One|) (46 . |One|) (50 . /) (56 . +)
              (|Union| 17 '"failed") |PADE;pade;2Nni2PSU;5| (|List| 8)
              (|Stream| 8) (62 . |coerce|) (|ContinuedFraction| 8)
              (67 . |continuedFraction|) (|Union| 28 '"failed")
              |PADE;padecf;2Nni2PSU;6| (|Boolean|) (74 . |zero?|)
              (79 . |order|) (84 . |Zero|) (88 . |Zero|) (92 . >)
              (98 . |zero?|) (103 . |coefficient|) (109 . |One|) (113 . /)
              (119 . *) (125 . *) (131 . -) (137 . |monomial|)
              (|Union| $ '"failed") (143 . |exquo|) (149 . =)
              (155 . |minimumDegree|))
           '#(|padecf| 160 |pade| 168) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 49
                                                 '(1 8 9 0 10 1 8 0 0 11 0 8 0
                                                   12 2 7 6 0 9 13 2 8 0 6 9 14
                                                   2 8 0 0 0 15 1 7 0 0 16 1 17
                                                   0 8 18 0 6 0 19 0 7 0 20 2
                                                   17 0 0 0 21 2 17 0 0 0 22 1
                                                   26 0 25 27 3 28 0 8 26 26 29
                                                   1 7 32 0 33 1 7 9 0 34 0 6 0
                                                   35 0 7 0 36 2 9 32 0 0 37 1
                                                   6 32 0 38 2 8 6 0 9 39 0 8 0
                                                   40 2 8 0 0 6 41 2 8 0 0 0 42
                                                   2 8 0 6 0 43 2 8 0 0 0 44 2
                                                   7 0 6 9 45 2 8 46 0 0 47 2 8
                                                   32 0 0 48 1 8 9 0 49 4 0 30
                                                   9 9 7 7 31 4 0 23 9 9 7 7
                                                   24)))))
           '|lookupComplete|)) 
