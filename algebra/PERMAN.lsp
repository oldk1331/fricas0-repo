
(/VERSIONCHECK 2) 

(DEFUN |PERMAN;permanent3| (|x| $)
  (PROG (|a| |j| |vv| |b| #1=#:G118 |i| |k| |sgn| |w|)
    (RETURN
     (SEQ (LETT |sgn| (|spadConstant| $ 8) . #2=(|PERMAN;permanent3|))
          (LETT |a| (|spadConstant| $ 9) . #2#)
          (LETT |vv| (SPADCALL (QREFELT $ 6) (QREFELT $ 13)) . #2#)
          (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 9)) . #2#)
          (LETT |j| 1 . #2#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |j| (+ (QREFELT $ 6) 1) (QREFELT $ 16)))
                 (GO G191)))
               (SEQ (LETT |sgn| (SPADCALL |sgn| (QREFELT $ 17)) . #2#)
                    (LETT |b| |sgn| . #2#)
                    (COND
                     ((EQL
                       (SPADCALL (SPADCALL |vv| 1 (QREFELT $ 21)) |j|
                                 (QREFELT $ 22))
                       1)
                      (LETT |k| (SPADCALL (|spadConstant| $ 8) (QREFELT $ 17))
                            . #2#))
                     ('T (LETT |k| (|spadConstant| $ 8) . #2#)))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# (QREFELT $ 6) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (SPADCALL |w| |i|
                                    (SPADCALL (SPADCALL |w| |i| (QREFELT $ 24))
                                              (SPADCALL |k|
                                                        (SPADCALL |x| |i| |j|
                                                                  (QREFELT $
                                                                           25))
                                                        (QREFELT $ 26))
                                              (QREFELT $ 27))
                                    (QREFELT $ 28))
                          (EXIT
                           (LETT |b|
                                 (SPADCALL |b|
                                           (SPADCALL |w| |i| (QREFELT $ 24))
                                           (QREFELT $ 26))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a| (SPADCALL |a| |b| (QREFELT $ 27)) . #2#)
                    (LETT |vv| (SPADCALL |vv| (QREFELT $ 6) (QREFELT $ 29))
                          . #2#)
                    (EXIT
                     (LETT |j|
                           (SPADCALL (SPADCALL |vv| 2 (QREFELT $ 21)) 1
                                     (QREFELT $ 22))
                           . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((ODDP (QREFELT $ 6))
            (LETT |a| (SPADCALL |a| (QREFELT $ 17)) . #2#)))
          (EXIT |a|))))) 

(DEFUN |PERMAN;permanent;SmR;2| (|x| $)
  (PROG (|a| |j| |vv| #1=#:G130 |b| #2=#:G139 |i| |k| |sgn| #3=#:G138 #4=#:G125
         #5=#:G137 |rowi| #6=#:G136 |w| #7=#:G135 |half| |two|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((EQL (QREFELT $ 6) 1) (SPADCALL |x| 1 1 (QREFELT $ 25)))
             (#8='T
              (SEQ
               (LETT |two| (SPADCALL 2 (QREFELT $ 30))
                     . #9=(|PERMAN;permanent;SmR;2|))
               (LETT |half| (SPADCALL |two| (QREFELT $ 32)) . #9#)
               (COND
                ((QEQCAR |half| 1)
                 (COND
                  ((< (QREFELT $ 6) 7)
                   (PROGN
                    (LETT #7# (|PERMAN;permanent3| |x| $) . #9#)
                    (GO #7#)))
                  (#8#
                   (PROGN
                    (LETT #7# (|PERMAN;permanent2| |x| $) . #9#)
                    (GO #7#))))))
               (LETT |sgn| (|spadConstant| $ 8) . #9#)
               (LETT |a| (|spadConstant| $ 9) . #9#)
               (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 9)) . #9#)
               (LETT |rowi| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 9))
                     . #9#)
               (SEQ (LETT |i| 1 . #9#) (LETT #6# (QREFELT $ 6) . #9#) G190
                    (COND ((|greater_SI| |i| #6#) (GO G191)))
                    (SEQ
                     (LETT |rowi|
                           (SPADCALL (SPADCALL |x| |i| (QREFELT $ 34))
                                     (QREFELT $ 35))
                           . #9#)
                     (LETT |b| (|spadConstant| $ 9) . #9#)
                     (SEQ (LETT |j| 1 . #9#) (LETT #5# (QREFELT $ 6) . #9#)
                          G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |b|
                                  (SPADCALL |b|
                                            (SPADCALL |rowi| |j|
                                                      (QREFELT $ 24))
                                            (QREFELT $ 27))
                                  . #9#)))
                          (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (SPADCALL |w| |i|
                                (SPADCALL
                                 (SPADCALL |rowi| (QREFELT $ 6) (QREFELT $ 24))
                                 (SPADCALL (QCDR |half|) |b| (QREFELT $ 26))
                                 (QREFELT $ 36))
                                (QREFELT $ 28))))
                    (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
               (LETT |vv|
                     (SPADCALL
                      (PROG1 (LETT #4# (- (QREFELT $ 6) 1) . #9#)
                        (|check_subtype| (> #4# 0) '(|PositiveInteger|) #4#))
                      (QREFELT $ 13))
                     . #9#)
               (QREFELT $ 6) (LETT |b| (|spadConstant| $ 8) . #9#)
               (SEQ (LETT |i| 1 . #9#) (LETT #3# (QREFELT $ 6) . #9#) G190
                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |b|
                            (SPADCALL |b| (SPADCALL |w| |i| (QREFELT $ 24))
                                      (QREFELT $ 26))
                            . #9#)))
                    (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
               (LETT |a| (SPADCALL |a| |b| (QREFELT $ 27)) . #9#)
               (LETT |j| 1 . #9#)
               (SEQ G190
                    (COND
                     ((NULL (SPADCALL |j| (QREFELT $ 6) (QREFELT $ 16)))
                      (GO G191)))
                    (SEQ (LETT |sgn| (SPADCALL |sgn| (QREFELT $ 17)) . #9#)
                         (LETT |b| |sgn| . #9#)
                         (COND
                          ((EQL
                            (SPADCALL (SPADCALL |vv| 1 (QREFELT $ 21)) |j|
                                      (QREFELT $ 22))
                            1)
                           (LETT |k| -1 . #9#))
                          ('T (LETT |k| 1 . #9#)))
                         (SEQ (LETT |i| 1 . #9#) (LETT #2# (QREFELT $ 6) . #9#)
                              G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (SPADCALL |w| |i|
                                         (SPADCALL
                                          (SPADCALL |w| |i| (QREFELT $ 24))
                                          (SPADCALL |k|
                                                    (SPADCALL |x| |i| |j|
                                                              (QREFELT $ 25))
                                                    (QREFELT $ 38))
                                          (QREFELT $ 27))
                                         (QREFELT $ 28))
                               (EXIT
                                (LETT |b|
                                      (SPADCALL |b|
                                                (SPADCALL |w| |i|
                                                          (QREFELT $ 24))
                                                (QREFELT $ 26))
                                      . #9#)))
                              (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |a| (SPADCALL |a| |b| (QREFELT $ 27)) . #9#)
                         (LETT |vv|
                               (SPADCALL |vv|
                                         (PROG1
                                             (LETT #1# (- (QREFELT $ 6) 1)
                                                   . #9#)
                                           (|check_subtype| (> #1# 0)
                                                            '(|PositiveInteger|)
                                                            #1#))
                                         (QREFELT $ 29))
                               . #9#)
                         (EXIT
                          (LETT |j|
                                (SPADCALL (SPADCALL |vv| 2 (QREFELT $ 21)) 1
                                          (QREFELT $ 22))
                                . #9#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (COND
                ((NULL (ODDP (QREFELT $ 6)))
                 (LETT |a| (SPADCALL |a| (QREFELT $ 17)) . #9#)))
               (EXIT (SPADCALL |two| |a| (QREFELT $ 26)))))))
      #7# (EXIT #7#))))) 

(DEFUN |PERMAN;permanent2| (|x| $)
  (PROG (#1=#:G156 |b| #2=#:G154 |a| |j| |vv| #3=#:G149 #4=#:G164 |i| |c| |k|
         |sgn| #5=#:G163 #6=#:G144 #7=#:G162 |rowi| #8=#:G161 |w| |two|
         #9=#:G160)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |c| (|spadConstant| $ 9) . #10=(|PERMAN;permanent2|))
            (LETT |sgn| (|spadConstant| $ 8) . #10#)
            (COND
             ((|HasCategory| (QREFELT $ 7) '(|IntegralDomain|))
              (COND
               ((SPADCALL (SPADCALL |sgn| |sgn| (QREFELT $ 27)) |c|
                          (QREFELT $ 40))
                (PROGN
                 (LETT #9# (|PERMAN;permanent3| |x| $) . #10#)
                 (GO #9#)))))
             (#11='T
              (PROGN (LETT #9# (|PERMAN;permanent3| |x| $) . #10#) (GO #9#))))
            (EXIT
             (COND ((EQL (QREFELT $ 6) 1) (SPADCALL |x| 1 1 (QREFELT $ 25)))
                   (#11#
                    (SEQ (LETT |two| (SPADCALL 2 (QREFELT $ 30)) . #10#)
                         (LETT |a| (|spadConstant| $ 9) . #10#)
                         (LETT |w|
                               (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 9))
                               . #10#)
                         (LETT |rowi|
                               (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 9))
                               . #10#)
                         (SEQ (LETT |i| 1 . #10#)
                              (LETT #8# (QREFELT $ 6) . #10#) G190
                              (COND ((|greater_SI| |i| #8#) (GO G191)))
                              (SEQ
                               (LETT |rowi|
                                     (SPADCALL
                                      (SPADCALL |x| |i| (QREFELT $ 34))
                                      (QREFELT $ 35))
                                     . #10#)
                               (LETT |b| (|spadConstant| $ 9) . #10#)
                               (SEQ (LETT |j| 1 . #10#)
                                    (LETT #7# (QREFELT $ 6) . #10#) G190
                                    (COND ((|greater_SI| |j| #7#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |b|
                                            (SPADCALL |b|
                                                      (SPADCALL |rowi| |j|
                                                                (QREFELT $ 24))
                                                      (QREFELT $ 27))
                                            . #10#)))
                                    (LETT |j| (|inc_SI| |j|) . #10#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT
                                (SPADCALL |w| |i|
                                          (SPADCALL
                                           (SPADCALL |two|
                                                     (SPADCALL |rowi|
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 24))
                                                     (QREFELT $ 26))
                                           |b| (QREFELT $ 36))
                                          (QREFELT $ 28))))
                              (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |vv|
                               (SPADCALL
                                (PROG1 (LETT #6# (- (QREFELT $ 6) 1) . #10#)
                                  (|check_subtype| (> #6# 0)
                                                   '(|PositiveInteger|) #6#))
                                (QREFELT $ 13))
                               . #10#)
                         (QREFELT $ 6) (LETT |b| (|spadConstant| $ 8) . #10#)
                         (SEQ (LETT |i| 1 . #10#)
                              (LETT #5# (QREFELT $ 6) . #10#) G190
                              (COND ((|greater_SI| |i| #5#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |b|
                                      (SPADCALL |b|
                                                (SPADCALL |w| |i|
                                                          (QREFELT $ 24))
                                                (QREFELT $ 26))
                                      . #10#)))
                              (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |a| (SPADCALL |a| |b| (QREFELT $ 27)) . #10#)
                         (LETT |j| 1 . #10#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |j| (QREFELT $ 6) (QREFELT $ 16)))
                                (GO G191)))
                              (SEQ
                               (LETT |sgn| (SPADCALL |sgn| (QREFELT $ 17))
                                     . #10#)
                               (LETT |b| |sgn| . #10#)
                               (COND
                                ((EQL
                                  (SPADCALL (SPADCALL |vv| 1 (QREFELT $ 21))
                                            |j| (QREFELT $ 22))
                                  1)
                                 (LETT |k| -1 . #10#))
                                ('T (LETT |k| 1 . #10#)))
                               (LETT |c| (SPADCALL |k| |two| (QREFELT $ 38))
                                     . #10#)
                               (SEQ (LETT |i| 1 . #10#)
                                    (LETT #4# (QREFELT $ 6) . #10#) G190
                                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                                    (SEQ
                                     (SPADCALL |w| |i|
                                               (SPADCALL
                                                (SPADCALL |w| |i|
                                                          (QREFELT $ 24))
                                                (SPADCALL |c|
                                                          (SPADCALL |x| |i| |j|
                                                                    (QREFELT $
                                                                             25))
                                                          (QREFELT $ 26))
                                                (QREFELT $ 27))
                                               (QREFELT $ 28))
                                     (EXIT
                                      (LETT |b|
                                            (SPADCALL |b|
                                                      (SPADCALL |w| |i|
                                                                (QREFELT $ 24))
                                                      (QREFELT $ 26))
                                            . #10#)))
                                    (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                    G191 (EXIT NIL))
                               (LETT |a| (SPADCALL |a| |b| (QREFELT $ 27))
                                     . #10#)
                               (LETT |vv|
                                     (SPADCALL |vv|
                                               (PROG1
                                                   (LETT #3#
                                                         (- (QREFELT $ 6) 1)
                                                         . #10#)
                                                 (|check_subtype| (> #3# 0)
                                                                  '(|PositiveInteger|)
                                                                  #3#))
                                               (QREFELT $ 29))
                                     . #10#)
                               (EXIT
                                (LETT |j|
                                      (SPADCALL
                                       (SPADCALL |vv| 2 (QREFELT $ 21)) 1
                                       (QREFELT $ 22))
                                      . #10#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (COND
                          ((NULL (ODDP (QREFELT $ 6)))
                           (LETT |a| (SPADCALL |a| (QREFELT $ 17)) . #10#)))
                         (LETT |b|
                               (SPADCALL |two|
                                         (PROG1
                                             (LETT #2# (- (QREFELT $ 6) 1)
                                                   . #10#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 42))
                               . #10#)
                         (EXIT
                          (PROG2
                              (LETT #1# (SPADCALL |a| |b| (QREFELT $ 43))
                                    . #10#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                           #1#)))))))))
      #9# (EXIT #9#))))) 

(DECLAIM (NOTINLINE |Permanent;|)) 

(DEFUN |Permanent| (&REST #1=#:G165)
  (PROG ()
    (RETURN
     (PROG (#2=#:G166)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|Permanent|)
                                           '|domainEqualList|)
                . #3=(|Permanent|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |Permanent;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Permanent|))))))))))) 

(DEFUN |Permanent;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Permanent|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|Permanent| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 44) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Permanent| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Permanent| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |Zero|) (|Vector| 20) (|PositiveInteger|) (|GrayCode|)
              (8 . |firstSubsetGray|) (|Boolean|) (|Integer|) (13 . ~=)
              (19 . -) (|SquareMatrix| 6 7) (24 . |One|) (|Vector| 15)
              (28 . |elt|) (34 . |elt|) (|Vector| 7) (40 . |elt|) (46 . |elt|)
              (53 . *) (59 . +) (65 . |setelt|) (72 . |nextSubsetGray|)
              (78 . |coerce|) (|Union| $ '"failed") (83 . |recip|)
              (|DirectProduct| 6 7) (88 . |row|) (94 . |coerce|) (99 . -)
              (105 . |One|) (109 . *) |PERMAN;permanent;SmR;2| (115 . =)
              (|NonNegativeInteger|) (121 . ^) (127 . |exquo|))
           '#(|permanent| 133) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(0 7 0 8 0 7 0 9 1 12 10 11
                                                   13 2 15 14 0 0 16 1 7 0 0 17
                                                   0 18 0 19 2 10 20 0 15 21 2
                                                   20 15 0 15 22 2 23 7 0 15 24
                                                   3 18 7 0 15 15 25 2 7 0 0 0
                                                   26 2 7 0 0 0 27 3 23 7 0 15
                                                   7 28 2 12 10 10 11 29 1 7 0
                                                   15 30 1 7 31 0 32 2 18 33 0
                                                   15 34 1 33 23 0 35 2 7 0 0 0
                                                   36 0 33 0 37 2 7 0 15 0 38 2
                                                   7 14 0 0 40 2 7 0 0 41 42 2
                                                   7 31 0 0 43 1 0 7 18 39)))))
           '|lookupComplete|)) 
