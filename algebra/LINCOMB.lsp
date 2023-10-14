
(SDEFUN |LINCOMB;dehomogenize;LR;1|
        ((|ls| |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
         ($ |Record|
          (|:| |particular|
               (|Union|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                "failed"))
          (|:| |basis|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))))
        (SPROG
         ((|res3|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|bv| #1=(|Vector| F)) (|rp| (F)) (|c| (F)) (#2=#:G127 NIL)
          (|be| NIL) (|ppv| #1#) (|ppa| (F)) (|c1inv| (F))
          (|found| (|Boolean|))
          (|be1| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|res2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#3=#:G126 NIL) (|nn| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |ls|) (CONS (CONS 1 "failed") NIL))
                (#4='T
                 (SEQ
                  (LETT |nn| (QVSIZE (QCDR (SPADCALL |ls| 1 (QREFELT $ 13))))
                        . #5=(|LINCOMB;dehomogenize;LR;1|))
                  (LETT |found| 'NIL . #5#) (LETT |res2| NIL . #5#)
                  (SEQ (LETT |be| NIL . #5#) (LETT #3# |ls| . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |be| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |c| (SPADCALL (QCDR |be|) 1 (QREFELT $ 17))
                              . #5#)
                        (COND
                         ((OR
                           (SPADCALL |c| (|spadConstant| $ 18) (QREFELT $ 21))
                           |found|)
                          (EXIT (LETT |res2| (CONS |be| |res2|) . #5#))))
                        (LETT |be1| |be| . #5#) (EXIT (LETT |found| 'T . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    (|found|
                     (SEQ
                      (LETT |c1inv|
                            (SPADCALL (|spadConstant| $ 8)
                                      (SPADCALL (QCDR |be1|) 1 (QREFELT $ 17))
                                      (QREFELT $ 22))
                            . #5#)
                      (LETT |ppa|
                            (SPADCALL |c1inv| (QCAR |be1|) (QREFELT $ 23))
                            . #5#)
                      (LETT |ppv|
                            (SPADCALL
                             (SPADCALL |c1inv| (QCDR |be1|) (QREFELT $ 24))
                             (SPADCALL 2 |nn| (QREFELT $ 26)) (QREFELT $ 27))
                            . #5#)
                      (LETT |res3| NIL . #5#)
                      (SEQ (LETT |be| NIL . #5#) (LETT #2# |res2| . #5#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |be| (CAR #2#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |c| (SPADCALL (QCDR |be|) 1 (QREFELT $ 17))
                                  . #5#)
                            (LETT |bv|
                                  (SPADCALL (QCDR |be|)
                                            (SPADCALL 2 |nn| (QREFELT $ 26))
                                            (QREFELT $ 27))
                                  . #5#)
                            (LETT |rp| (QCAR |be|) . #5#)
                            (COND
                             ((SPADCALL |c| (|spadConstant| $ 18)
                                        (QREFELT $ 28))
                              (SEQ
                               (LETT |rp|
                                     (SPADCALL |rp|
                                               (SPADCALL |c| |ppa|
                                                         (QREFELT $ 23))
                                               (QREFELT $ 29))
                                     . #5#)
                               (EXIT
                                (LETT |bv|
                                      (SPADCALL |bv|
                                                (SPADCALL |c| |ppv|
                                                          (QREFELT $ 24))
                                                (QREFELT $ 30))
                                      . #5#)))))
                            (EXIT
                             (LETT |res3| (CONS (CONS |rp| |bv|) |res3|)
                                   . #5#)))
                           (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS (CONS 0 (CONS |ppa| |ppv|)) |res3|))))
                    (#4# (CONS (CONS 1 "failed") NIL)))))))))) 

(SDEFUN |LINCOMB;lin_comb;VLF;2| ((|v| |Vector| F) (|lf| |List| F) ($ F))
        (SPROG
         ((|res| (F)) (#1=#:G131 NIL) (|i| NIL) (#2=#:G132 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 18) . #3=(|LINCOMB;lin_comb;VLF;2|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 17))
                                           |f| (QREFELT $ 23))
                                 (QREFELT $ 34))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLF;3|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|lf| |List| F) ($ F))
        (SPROG
         ((|res| (F)) (#1=#:G136 NIL) (|i| NIL) (#2=#:G137 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 18) . #3=(|LINCOMB;lin_comb;VLF;3|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 39))
                                            (QREFELT $ 40))
                                  |f| (QREFELT $ 23))
                                 (QREFELT $ 34))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb!;2VLV;4|
        ((|u| |Vector| F) (|v| |Vector| F) (|lw| |List| (|Vector| F))
         ($ |Vector| F))
        (SPROG
         ((#1=#:G145 NIL) (|j| NIL) (|c| (F)) (#2=#:G143 NIL) (|i| NIL)
          (#3=#:G144 NIL) (|w| NIL) (|n| (|NonNegativeInteger|))
          (|res| (|Vector| F)))
         (SEQ (LETT |res| |v| . #4=(|LINCOMB;lin_comb!;2VLV;4|))
              (LETT |n| (QVSIZE |res|) . #4#)
              (SEQ (LETT |w| NIL . #4#) (LETT #3# |lw| . #4#)
                   (LETT |i| 1 . #4#) (LETT #2# (QVSIZE |u|) . #4#) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                         (PROGN (LETT |w| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |u| |i| (QREFELT $ 17)) . #4#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #4#) (LETT #1# |n| . #4#) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |res| |j|
                                          (SPADCALL
                                           (SPADCALL |res| |j| (QREFELT $ 17))
                                           (SPADCALL |c|
                                                     (SPADCALL |w| |j|
                                                               (QREFELT $ 17))
                                                     (QREFELT $ 23))
                                           (QREFELT $ 34))
                                          (QREFELT $ 42))))
                              (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLV;5|
        ((|u| |Vector| F) (|lw| |List| (|Vector| F)) ($ |Vector| F))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |n| (QVSIZE (|SPADfirst| |lw|)) |LINCOMB;lin_comb;VLV;5|)
                (EXIT
                 (SPADCALL |u| (MAKEARR1 |n| (|spadConstant| $ 18)) |lw|
                           (QREFELT $ 44)))))) 

(SDEFUN |LINCOMB;lin_comb;VLF;6|
        ((|v| |Vector| F) (|lf| |List| (|Fraction| UP)) ($ |Fraction| UP))
        (SPROG
         ((|res| (|Fraction| UP)) (#1=#:G151 NIL) (|i| NIL) (#2=#:G152 NIL)
          (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 46) . #3=(|LINCOMB;lin_comb;VLF;6|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 17))
                                            (QREFELT $ 47))
                                  |f| (QREFELT $ 48))
                                 (QREFELT $ 49))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLF;7|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|lg| |List| (|Fraction| UP))
         ($ |Fraction| UP))
        (SPROG
         ((|res| (|Fraction| UP)) (#1=#:G156 NIL) (|i| NIL) (#2=#:G157 NIL)
          (|g| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 46) . #3=(|LINCOMB;lin_comb;VLF;7|))
          (SEQ (LETT |g| NIL . #3#) (LETT #2# |lg| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |v| |i| (QREFELT $ 39))
                                              (QREFELT $ 40))
                                    (QREFELT $ 47))
                                   (QREFELT $ 52))
                                  |g| (QREFELT $ 53))
                                 (QREFELT $ 49))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLLp;8|
        ((|v| |Vector| F) (|lf| |List| (|LaurentPolynomial| F UP))
         ($ |LaurentPolynomial| F UP))
        (SPROG
         ((|res| (|LaurentPolynomial| F UP)) (#1=#:G161 NIL) (|i| NIL)
          (#2=#:G162 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 56) . #3=(|LINCOMB;lin_comb;VLLp;8|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 17))
                                            (QREFELT $ 57))
                                  |f| (QREFELT $ 58))
                                 (QREFELT $ 59))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LINCOMB;lin_comb;VLUP;9| ((|v| |Vector| F) (|lf| |List| UP) ($ UP))
        (SPROG
         ((|res| (UP)) (#1=#:G166 NIL) (|i| NIL) (#2=#:G167 NIL) (|f| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 19) . #3=(|LINCOMB;lin_comb;VLUP;9|))
          (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| 1 . #3#)
               (LETT #1# (QVSIZE |v|) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 17))
                                           |f| (QREFELT $ 62))
                                 (QREFELT $ 63))
                       . #3#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearCombinationUtilities;|)) 

(DEFUN |LinearCombinationUtilities| (&REST #1=#:G168)
  (SPROG NIL
         (PROG (#2=#:G169)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearCombinationUtilities|)
                                               '|domainEqualList|)
                    . #3=(|LinearCombinationUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LinearCombinationUtilities;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearCombinationUtilities|)))))))))) 

(DEFUN |LinearCombinationUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearCombinationUtilities|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LinearCombinationUtilities| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 66) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LinearCombinationUtilities|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LinearCombinationUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Record| (|:| |ratpart| 6) (|:| |coeffs| 16))
              (|Integer|) (|List| 10) (8 . |elt|) (|Fraction| 7) (14 . |One|)
              (|Vector| 6) (18 . |elt|) (24 . |Zero|) (28 . |Zero|) (|Boolean|)
              (32 . =) (38 . /) (44 . *) (50 . *) (|UniversalSegment| 11)
              (56 . SEGMENT) (62 . |elt|) (68 . ~=) (74 . -) (80 . -)
              (|Union| 10 '"failed")
              (|Record| (|:| |particular| 31) (|:| |basis| 12))
              |LINCOMB;dehomogenize;LR;1| (86 . +) (|List| 6)
              |LINCOMB;lin_comb;VLF;2| (|Fraction| 11) (|Vector| 37)
              (92 . |elt|) (98 . |coerce|) |LINCOMB;lin_comb;VLF;3|
              (103 . |setelt!|) (|List| 16) |LINCOMB;lin_comb!;2VLV;4|
              |LINCOMB;lin_comb;VLV;5| (110 . |Zero|) (114 . |coerce|)
              (119 . *) (125 . +) (|List| 14) |LINCOMB;lin_comb;VLF;6|
              (131 . |coerce|) (136 . *) |LINCOMB;lin_comb;VLF;7|
              (|LaurentPolynomial| 6 7) (142 . |Zero|) (146 . |coerce|)
              (151 . *) (157 . +) (|List| 55) |LINCOMB;lin_comb;VLLp;8|
              (163 . *) (169 . +) (|List| 7) |LINCOMB;lin_comb;VLUP;9|)
           '#(|lin_comb!| 175 |lin_comb| 182 |dehomogenize| 224) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(0 6 0 8 0 7 0 9 2 12 10 0 11
                                                   13 0 14 0 15 2 16 6 0 11 17
                                                   0 6 0 18 0 7 0 19 2 6 20 0 0
                                                   21 2 6 0 0 0 22 2 6 0 0 0 23
                                                   2 16 0 6 0 24 2 25 0 11 11
                                                   26 2 16 0 0 25 27 2 6 20 0 0
                                                   28 2 6 0 0 0 29 2 16 0 0 0
                                                   30 2 6 0 0 0 34 2 38 37 0 11
                                                   39 1 6 0 37 40 3 16 6 0 11 6
                                                   42 0 14 0 46 1 7 0 6 47 2 14
                                                   0 7 0 48 2 14 0 0 0 49 1 14
                                                   0 7 52 2 14 0 0 0 53 0 55 0
                                                   56 1 55 0 6 57 2 55 0 0 0 58
                                                   2 55 0 0 0 59 2 7 0 6 0 62 2
                                                   7 0 0 0 63 3 0 16 16 16 43
                                                   44 2 0 6 16 35 36 2 0 6 38
                                                   35 41 2 0 14 16 50 51 2 0 16
                                                   16 43 45 2 0 14 38 50 54 2 0
                                                   7 16 64 65 2 0 55 16 60 61 1
                                                   0 32 12 33)))))
           '|lookupComplete|)) 
