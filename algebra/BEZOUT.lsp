
(SDEFUN |BEZOUT;sylvesterMatrix;2UPM;1| ((|p| UP) (|q| UP) ($ M))
        (SPROG
         ((#1=#:G122 NIL) (|i| NIL) (|q0| (UP))
          (|deg| #2=(|NonNegativeInteger|)) (|coef| (R)) (#3=#:G121 NIL)
          (|p0| (UP)) (|maxC| (|Integer|)) (|maxR| (|Integer|))
          (|minC| (|Integer|)) (|minR| (|Integer|)) (|sylmat| (M))
          (|n| (|NonNegativeInteger|)) (|n2| #2#) (|n1| #2#))
         (SEQ
          (LETT |n1| (SPADCALL |p| (QREFELT $ 12))
                . #4=(|BEZOUT;sylvesterMatrix;2UPM;1|))
          (LETT |n2| (SPADCALL |q| (QREFELT $ 12)) . #4#)
          (LETT |n| (+ |n1| |n2|) . #4#)
          (LETT |sylmat|
                (SPADCALL |n| |n| (|spadConstant| $ 13) (QREFELT $ 15)) . #4#)
          (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 17)) . #4#)
          (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 18)) . #4#)
          (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 19)) . #4#)
          (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 20)) . #4#)
          (LETT |p0| |p| . #4#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |p0| (QREFELT $ 22)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |p0| (QREFELT $ 23)) . #4#)
                    (LETT |deg| (SPADCALL |p0| (QREFELT $ 12)) . #4#)
                    (LETT |p0| (SPADCALL |p0| (QREFELT $ 24)) . #4#)
                    (EXIT
                     (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |n2| 1) . #4#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |sylmat| (+ |minR| |i|)
                                      (+ (- (+ |minC| |n1|) |deg|) |i|) |coef|
                                      (QREFELT $ 27))))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |q0| |q| . #4#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |q0| (QREFELT $ 22)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |q0| (QREFELT $ 23)) . #4#)
                    (LETT |deg| (SPADCALL |q0| (QREFELT $ 12)) . #4#)
                    (LETT |q0| (SPADCALL |q0| (QREFELT $ 24)) . #4#)
                    (EXIT
                     (SEQ (LETT |i| 0 . #4#) (LETT #1# (- |n1| 1) . #4#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |sylmat| (+ (+ |minR| |n2|) |i|)
                                      (+ (- (+ |minC| |n2|) |deg|) |i|) |coef|
                                      (QREFELT $ 27))))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |sylmat|)))) 

(SDEFUN |BEZOUT;bezoutMatrix;2UPM;2| ((|p| UP) (|q| UP) ($ M))
        (SPROG
         ((#1=#:G156 NIL) (|k| NIL) (#2=#:G155 NIL) (|i| NIL) (|p0| (UP))
          (|c| (R)) (#3=#:G154 NIL) (|coef| (R))
          (|deg| #4=(|NonNegativeInteger|)) (|q0| (UP)) (#5=#:G153 NIL)
          (|bound| #6=(|Integer|)) (#7=#:G152 NIL) (|bezmat| (M))
          (#8=#:G151 NIL) (#9=#:G150 NIL) (|maxC| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|minR| (|Integer|))
          (|sylmat| (M)) (|m| #6#) (|m2| #6#) (|m1| #6#)
          (|n| (|NonNegativeInteger|)) (|n2| #4#) (|n1| #4#))
         (SEQ
          (LETT |n1| (SPADCALL |p| (QREFELT $ 12))
                . #10=(|BEZOUT;bezoutMatrix;2UPM;2|))
          (LETT |n2| (SPADCALL |q| (QREFELT $ 12)) . #10#)
          (LETT |n| (+ |n1| |n2|) . #10#)
          (EXIT
           (COND ((< |n1| |n2|) (SPADCALL |q| |p| (QREFELT $ 29)))
                 ('T
                  (SEQ (LETT |m1| (- |n1| 1) . #10#)
                       (LETT |m2| (- |n2| 1) . #10#)
                       (LETT |m| (- |n| 1) . #10#)
                       (LETT |sylmat|
                             (SPADCALL |n| |n1| (|spadConstant| $ 13)
                                       (QREFELT $ 15))
                             . #10#)
                       (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 17)) . #10#)
                       (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 18)) . #10#)
                       (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 19)) . #10#)
                       (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 20)) . #10#)
                       (LETT |p0| |p| . #10#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |p0| (QREFELT $ 30)) 'NIL)
                                     ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (LETT |coef| (SPADCALL |p0| (QREFELT $ 23))
                                   . #10#)
                             (LETT |deg| (SPADCALL |p0| (QREFELT $ 12)) . #10#)
                             (LETT |p0| (SPADCALL |p0| (QREFELT $ 24)) . #10#)
                             (EXIT
                              (SEQ (LETT |i| 0 . #10#)
                                   (LETT #9# (MIN |m2| (- |deg| 1)) . #10#)
                                   G190
                                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |sylmat| (+ |minR| |i|)
                                               (+ (- (+ |minC| |n1|) |deg|)
                                                  |i|)
                                               |coef| (QREFELT $ 27))))
                                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                   G191 (EXIT NIL))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |q0| |q| . #10#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |q0| (QREFELT $ 22)) 'NIL)
                                     ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (LETT |coef| (SPADCALL |q0| (QREFELT $ 23))
                                   . #10#)
                             (LETT |deg| (SPADCALL |q0| (QREFELT $ 12)) . #10#)
                             (LETT |q0| (SPADCALL |q0| (QREFELT $ 24)) . #10#)
                             (EXIT
                              (SEQ (LETT |i| 0 . #10#)
                                   (LETT #8# (- (- (+ |deg| |n1|) |n2|) 1)
                                         . #10#)
                                   G190
                                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |sylmat| (+ (+ |minR| |n2|) |i|)
                                               (+ (- (+ |minC| |n2|) |deg|)
                                                  |i|)
                                               |coef| (QREFELT $ 27))))
                                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                   G191 (EXIT NIL))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |bezmat|
                             (SPADCALL |n1| |n1| (|spadConstant| $ 13)
                                       (QREFELT $ 15))
                             . #10#)
                       (SEQ (LETT |i| 0 . #10#) (LETT #7# |m2| . #10#) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ (LETT |bound| (- |n2| |i|) . #10#)
                                 (LETT |q0| |q| . #10#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |q0| (QREFELT $ 22)) 'NIL)
                                          ('T 'T)))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |deg|
                                             (SPADCALL |q0| (QREFELT $ 12))
                                             . #10#)
                                       (COND
                                        ((< |deg| |bound|)
                                         (SEQ
                                          (LETT |coef|
                                                (SPADCALL |q0| (QREFELT $ 23))
                                                . #10#)
                                          (EXIT
                                           (SEQ (LETT |k| |minC| . #10#)
                                                (LETT #5# |maxC| . #10#) G190
                                                (COND ((> |k| #5#) (GO G191)))
                                                (SEQ
                                                 (LETT |c|
                                                       (SPADCALL
                                                        (SPADCALL |coef|
                                                                  (SPADCALL
                                                                   |sylmat|
                                                                   (-
                                                                    (-
                                                                     (+ |minR|
                                                                        |m2|)
                                                                     |i|)
                                                                    |deg|)
                                                                   |k|
                                                                   (QREFELT $
                                                                            31))
                                                                  (QREFELT $
                                                                           32))
                                                        (SPADCALL |bezmat|
                                                                  (-
                                                                   (+ |minR|
                                                                      |m2|)
                                                                   |i|)
                                                                  |k|
                                                                  (QREFELT $
                                                                           31))
                                                        (QREFELT $ 33))
                                                       . #10#)
                                                 (EXIT
                                                  (SPADCALL |bezmat|
                                                            (- (+ |minR| |m2|)
                                                               |i|)
                                                            |k| |c|
                                                            (QREFELT $ 27))))
                                                (LETT |k| (+ |k| 1) . #10#)
                                                (GO G190) G191 (EXIT NIL))))))
                                       (EXIT
                                        (LETT |q0|
                                              (SPADCALL |q0| (QREFELT $ 24))
                                              . #10#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |p0| |p| . #10#)
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (COND
                                           ((SPADCALL |p0| (QREFELT $ 22))
                                            'NIL)
                                           ('T 'T)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |deg|
                                              (SPADCALL |p0| (QREFELT $ 12))
                                              . #10#)
                                        (COND
                                         ((< |deg| |bound|)
                                          (SEQ
                                           (LETT |coef|
                                                 (SPADCALL |p0| (QREFELT $ 23))
                                                 . #10#)
                                           (EXIT
                                            (SEQ (LETT |k| |minC| . #10#)
                                                 (LETT #3# |maxC| . #10#) G190
                                                 (COND ((> |k| #3#) (GO G191)))
                                                 (SEQ
                                                  (LETT |c|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL |coef|
                                                                    (SPADCALL
                                                                     |sylmat|
                                                                     (-
                                                                      (-
                                                                       (+
                                                                        |minR|
                                                                        |m|)
                                                                       |i|)
                                                                      |deg|)
                                                                     |k|
                                                                     (QREFELT $
                                                                              31))
                                                                    (QREFELT $
                                                                             32))
                                                          (QREFELT $ 34))
                                                         (SPADCALL |bezmat|
                                                                   (-
                                                                    (+ |minR|
                                                                       |m2|)
                                                                    |i|)
                                                                   |k|
                                                                   (QREFELT $
                                                                            31))
                                                         (QREFELT $ 33))
                                                        . #10#)
                                                  (EXIT
                                                   (SPADCALL |bezmat|
                                                             (- (+ |minR| |m2|)
                                                                |i|)
                                                             |k| |c|
                                                             (QREFELT $ 27))))
                                                 (LETT |k| (+ |k| 1) . #10#)
                                                 (GO G190) G191 (EXIT NIL))))))
                                        (EXIT
                                         (LETT |p0|
                                               (SPADCALL |p0| (QREFELT $ 24))
                                               . #10#)))
                                       NIL (GO G190) G191 (EXIT NIL))))
                            (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |i| |n2| . #10#) (LETT #2# |m1| . #10#) G190
                            (COND ((> |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| |minC| . #10#)
                                   (LETT #1# |maxC| . #10#) G190
                                   (COND ((> |k| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |bezmat| (+ |minR| |i|) |k|
                                               (SPADCALL |sylmat|
                                                         (+ |minR| |i|) |k|
                                                         (QREFELT $ 31))
                                               (QREFELT $ 27))))
                                   (LETT |k| (+ |k| 1) . #10#) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |i| (+ |i| 1) . #10#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |bezmat|)))))))) 

(SDEFUN |BEZOUT;bezoutResultant;2UPR;3| ((|f| UP) (|g| UP) ($ R))
        (SPADCALL (SPADCALL |f| |g| (QREFELT $ 29)) (QREFELT $ 35))) 

(SDEFUN |BEZOUT;bezoutDiscriminant;UPR;4| ((|f| UP) ($ R))
        (SPROG ((#1=#:G159 NIL) (|degMod4| (|Integer|)))
               (SEQ
                (LETT |degMod4| (REM (SPADCALL |f| (QREFELT $ 12)) 4)
                      . #2=(|BEZOUT;bezoutDiscriminant;UPR;4|))
                (COND
                 ((OR (EQL |degMod4| 0) (EQL |degMod4| 1))
                  (EXIT
                   (PROG2
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL |f| (SPADCALL |f| (QREFELT $ 37))
                                        (QREFELT $ 36))
                              (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 39))
                             . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                     (|Union| (QREFELT $ 6) #3="failed")
                                     #1#)))))
                (EXIT
                 (SPADCALL
                  (PROG2
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL |f| (SPADCALL |f| (QREFELT $ 37))
                                       (QREFELT $ 36))
                             (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 39))
                            . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #3#) #1#))
                  (QREFELT $ 34)))))) 

(SDEFUN |BEZOUT;bezoutDiscriminant;UPR;5| ((|f| UP) ($ R))
        (SPROG ((|degMod4| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |f| (QREFELT $ 23)) (|spadConstant| $ 25)
                            (QREFELT $ 41))
                  (SEQ
                   (LETT |degMod4| (REM (SPADCALL |f| (QREFELT $ 12)) 4)
                         |BEZOUT;bezoutDiscriminant;UPR;5|)
                   (COND
                    ((OR (EQL |degMod4| 0) (EQL |degMod4| 1))
                     (EXIT
                      (SPADCALL |f| (SPADCALL |f| (QREFELT $ 37))
                                (QREFELT $ 36)))))
                   (EXIT
                    (SPADCALL
                     (SPADCALL |f| (SPADCALL |f| (QREFELT $ 37))
                               (QREFELT $ 36))
                     (QREFELT $ 34)))))
                 ('T
                  (|error|
                   "bezoutDiscriminant: leading coefficient must be 1")))))) 

(DECLAIM (NOTINLINE |BezoutMatrix;|)) 

(DEFUN |BezoutMatrix| (&REST #1=#:G166)
  (SPROG NIL
         (PROG (#2=#:G167)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|BezoutMatrix|)
                                               '|domainEqualList|)
                    . #3=(|BezoutMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |BezoutMatrix;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|BezoutMatrix|)))))))))) 

(DEFUN |BezoutMatrix;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|BezoutMatrix|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|BezoutMatrix| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 42) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|BezoutMatrix|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 36
                 (CONS (|dispatchFunction| |BEZOUT;bezoutResultant;2UPR;3|) $))
       (COND
        ((|HasCategory| |#1| '(|IntegralDomain|))
         (QSETREFV $ 40
                   (CONS (|dispatchFunction| |BEZOUT;bezoutDiscriminant;UPR;4|)
                         $)))
        ('T
         (QSETREFV $ 40
                   (CONS (|dispatchFunction| |BEZOUT;bezoutDiscriminant;UPR;5|)
                         $)))))))
    $))) 

(MAKEPROP '|BezoutMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (0 . |degree|) (5 . |Zero|) (9 . |Zero|)
              (13 . |new|) (|Integer|) (20 . |minRowIndex|)
              (25 . |minColIndex|) (30 . |maxRowIndex|) (35 . |maxColIndex|)
              (|Boolean|) (40 . |zero?|) (45 . |leadingCoefficient|)
              (50 . |reductum|) (55 . |One|) (59 . |One|) (63 . |qsetelt!|)
              |BEZOUT;sylvesterMatrix;2UPM;1| |BEZOUT;bezoutMatrix;2UPM;2|
              (71 . |ground?|) (76 . |qelt|) (83 . *) (89 . +) (95 . -)
              (100 . |determinant|) (105 . |bezoutResultant|)
              (111 . |differentiate|) (|Union| $ '"failed") (116 . |exquo|)
              (122 . |bezoutDiscriminant|) (127 . =))
           '#(|sylvesterMatrix| 133 |bezoutResultant| 139 |bezoutMatrix| 145
              |bezoutDiscriminant| 151)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 41
                                                 '(1 7 11 0 12 0 6 0 13 0 7 0
                                                   14 3 8 0 11 11 6 15 1 8 16 0
                                                   17 1 8 16 0 18 1 8 16 0 19 1
                                                   8 16 0 20 1 7 21 0 22 1 7 6
                                                   0 23 1 7 0 0 24 0 6 0 25 0 7
                                                   0 26 4 8 6 0 16 16 6 27 1 7
                                                   21 0 30 3 8 6 0 16 16 31 2 6
                                                   0 0 0 32 2 6 0 0 0 33 1 6 0
                                                   0 34 1 8 6 0 35 2 0 6 7 7 36
                                                   1 7 0 0 37 2 6 38 0 0 39 1 0
                                                   6 7 40 2 6 21 0 0 41 2 0 8 7
                                                   7 28 2 1 6 7 7 36 2 0 8 7 7
                                                   29 1 1 6 7 40)))))
           '|lookupComplete|)) 
