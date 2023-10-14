
(PUT '|SEG;SEGMENT;2S$;1| '|SPADreplace| '(XLAM (|a| |b|) (VECTOR |a| |b| 1))) 

(SDEFUN |SEG;SEGMENT;2S$;1| ((|a| S) (|b| S) ($ $)) (VECTOR |a| |b| 1)) 

(PUT '|SEG;lo;$S;2| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SEG;lo;$S;2| ((|s| $) ($ S)) (QVELT |s| 0)) 

(PUT '|SEG;low;$S;3| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SEG;low;$S;3| ((|s| $) ($ S)) (QVELT |s| 0)) 

(PUT '|SEG;hi;$S;4| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 1))) 

(SDEFUN |SEG;hi;$S;4| ((|s| $) ($ S)) (QVELT |s| 1)) 

(PUT '|SEG;high;$S;5| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 1))) 

(SDEFUN |SEG;high;$S;5| ((|s| $) ($ S)) (QVELT |s| 1)) 

(PUT '|SEG;incr;$I;6| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 2))) 

(SDEFUN |SEG;incr;$I;6| ((|s| $) ($ |Integer|)) (QVELT |s| 2)) 

(PUT '|SEG;segment;2S$;7| '|SPADreplace| '(XLAM (|a| |b|) (VECTOR |a| |b| 1))) 

(SDEFUN |SEG;segment;2S$;7| ((|a| S) (|b| S) ($ $)) (VECTOR |a| |b| 1)) 

(SDEFUN |SEG;BY;$I$;8| ((|s| $) (|r| |Integer|) ($ $))
        (VECTOR (SPADCALL |s| (QREFELT $ 9)) (SPADCALL |s| (QREFELT $ 11)) |r|)) 

(SDEFUN |SEG;=;2$B;9| ((|s1| $) (|s2| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QVELT |s1| 0) (QVELT |s2| 0) (QREFELT $ 18))
          (COND
           ((SPADCALL (QVELT |s1| 1) (QVELT |s2| 1) (QREFELT $ 18))
            (EQL (QVELT |s1| 2) (QVELT |s2| 2)))
           (#1='T 'NIL)))
         (#1# 'NIL))) 

(SDEFUN |SEG;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPROG ((|seg| (|OutputForm|)))
               (SEQ
                (LETT |seg|
                      (SPADCALL (SPADCALL (QVELT |s| 0) (QREFELT $ 21))
                                (SPADCALL (QVELT |s| 1) (QREFELT $ 21))
                                (QREFELT $ 22))
                      |SEG;coerce;$Of;10|)
                (EXIT
                 (COND ((EQL (QVELT |s| 2) 1) |seg|)
                       ('T
                        (SPADCALL " by " |seg|
                                  (SPADCALL (QVELT |s| 2) (QREFELT $ 23))
                                  (QREFELT $ 24)))))))) 

(PUT '|SEG;convert;S$;11| '|SPADreplace| '(XLAM (|a|) (VECTOR |a| |a| 1))) 

(SDEFUN |SEG;convert;S$;11| ((|a| S) ($ $)) (VECTOR |a| |a| 1)) 

(SDEFUN |SEG;convert;$If;12| ((|s| $) ($ |InputForm|))
        (SPROG ((|seg| (|InputForm|)))
               (SEQ
                (LETT |seg|
                      (SPADCALL 'SEGMENT
                                (LIST
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 10))
                                           (QREFELT $ 28))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 11))
                                           (QREFELT $ 28)))
                                (QREFELT $ 32))
                      |SEG;convert;$If;12|)
                (EXIT
                 (COND ((EQL (SPADCALL |s| (QREFELT $ 14)) 1) |seg|)
                       ('T
                        (SPADCALL 'BY
                                  (LIST |seg|
                                        (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                                  (QREFELT $ 33)))
                                  (QREFELT $ 32)))))))) 

(SDEFUN |SEG;expand;LL;13| ((|ls| |List| $) ($ |List| S))
        (SPROG
         ((|l| (S)) (|lr| (|List| S)) (|inc| (S)) (|h| (S)) (#1=#:G137 NIL)
          (|s| NIL))
         (SEQ (LETT |lr| NIL . #2=(|SEG;expand;LL;13|))
              (SEQ (LETT |s| NIL . #2#) (LETT #1# |ls| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |l| (SPADCALL |s| (QREFELT $ 9)) . #2#)
                        (LETT |h| (SPADCALL |s| (QREFELT $ 11)) . #2#)
                        (LETT |inc|
                              (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                        (QREFELT $ 35))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |inc| (QREFELT $ 36))
                           (|error|
                            "Cannot expand a segment with an increment of zero"))
                          ((SPADCALL |inc| (|spadConstant| $ 37)
                                     (QREFELT $ 38))
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |l| |h| (QREFELT $ 39)))
                                  (GO G191)))
                                (SEQ (LETT |lr| (CONS |l| |lr|) . #2#)
                                     (EXIT
                                      (LETT |l|
                                            (SPADCALL |l| |inc| (QREFELT $ 40))
                                            . #2#)))
                                NIL (GO G190) G191 (EXIT NIL)))
                          ('T
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |l| |h| (QREFELT $ 41)))
                                  (GO G191)))
                                (SEQ (LETT |lr| (CONS |l| |lr|) . #2#)
                                     (EXIT
                                      (LETT |l|
                                            (SPADCALL |l| |inc| (QREFELT $ 40))
                                            . #2#)))
                                NIL (GO G190) G191 (EXIT NIL))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |lr|))))) 

(SDEFUN |SEG;expand;$L;14| ((|s| $) ($ |List| S))
        (SPADCALL (LIST |s|) (QREFELT $ 44))) 

(SDEFUN |SEG;map;M$L;15| ((|f| |Mapping| S S) (|s| $) ($ |List| S))
        (SPROG ((|l| (S)) (|lr| (|List| S)) (|inc| (S)) (|h| (S)))
               (SEQ (LETT |lr| NIL . #1=(|SEG;map;M$L;15|))
                    (LETT |l| (SPADCALL |s| (QREFELT $ 9)) . #1#)
                    (LETT |h| (SPADCALL |s| (QREFELT $ 11)) . #1#)
                    (LETT |inc|
                          (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                    (QREFELT $ 35))
                          . #1#)
                    (COND
                     ((SPADCALL |inc| (|spadConstant| $ 37) (QREFELT $ 38))
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 39)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 40))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 41)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 40))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))))
                    (EXIT (NREVERSE |lr|))))) 

(DECLAIM (NOTINLINE |Segment;|)) 

(DEFUN |Segment| (#1=#:G146)
  (SPROG NIL
         (PROG (#2=#:G147)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Segment|)
                                               '|domainEqualList|)
                    . #3=(|Segment|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Segment;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Segment|)))))))))) 

(DEFUN |Segment;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Segment|))
          (LETT |dv$| (LIST '|Segment| DV$1) . #1#)
          (LETT $ (GETREFV 51) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedRing|))
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|Segment| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |low| |#1|) (|:| |high| |#1|)
                              (|:| |incr| (|Integer|))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 19 (CONS (|dispatchFunction| |SEG;=;2$B;9|) $))
             (QSETREFV $ 25
                       (CONS (|dispatchFunction| |SEG;coerce;$Of;10|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 34
                       (CONS (|dispatchFunction| |SEG;convert;$If;12|) $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 44 (CONS (|dispatchFunction| |SEG;expand;LL;13|) $))
             (QSETREFV $ 45 (CONS (|dispatchFunction| |SEG;expand;$L;14|) $))
             (QSETREFV $ 47 (CONS (|dispatchFunction| |SEG;map;M$L;15|) $)))))
          $))) 

(MAKEPROP '|Segment| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| |SEG;SEGMENT;2S$;1|
              |SEG;lo;$S;2| |SEG;low;$S;3| |SEG;hi;$S;4| |SEG;high;$S;5|
              (|Integer|) |SEG;incr;$I;6| |SEG;segment;2S$;7| |SEG;BY;$I$;8|
              (|Boolean|) (0 . =) (6 . =) (|OutputForm|) (12 . |coerce|)
              (17 . SEGMENT) (23 . |coerce|) (28 . |infix|) (35 . |coerce|)
              |SEG;convert;S$;11| (|InputForm|) (40 . |convert|) (|Symbol|)
              (|List| 27) (|InputFormFunctions1| $$) (45 . |packageCall|)
              (51 . |convert|) (56 . |convert|) (61 . |coerce|) (66 . |zero?|)
              (71 . |Zero|) (75 . >) (81 . <=) (87 . +) (93 . >=) (|List| 6)
              (|List| $) (99 . |expand|) (104 . |expand|) (|Mapping| 6 6)
              (109 . |map|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 115 |segment| 121 |map| 127 |low| 133 |lo| 138 |latex| 143
              |incr| 148 |high| 153 |hi| 158 |hashUpdate!| 163 |hash| 169
              |expand| 174 |convert| 184 |coerce| 194 SEGMENT 199 BY 205 = 211)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(2 0 3 0 1 3 3))
                 (CONS '#(NIL NIL |SetCategory&| NIL NIL |BasicType&| NIL)
                       (CONS
                        '#((|SegmentExpansionCategory| 6 (|List| 6))
                           (|SegmentCategory| 6) (|SetCategory|) (|Type|)
                           (|ConvertibleTo| 27) (|BasicType|)
                           (|CoercibleTo| 20))
                        (|makeByteWordVec2| 50
                                            '(2 6 17 0 0 18 2 0 17 0 0 19 1 6
                                              20 0 21 2 20 0 0 0 22 1 13 20 0
                                              23 3 20 0 0 0 0 24 1 0 20 0 25 1
                                              6 27 0 28 2 31 27 29 30 32 1 27 0
                                              13 33 1 0 27 0 34 1 6 0 13 35 1 6
                                              17 0 36 0 6 0 37 2 6 17 0 0 38 2
                                              6 17 0 0 39 2 6 0 0 0 40 2 6 17 0
                                              0 41 1 0 42 43 44 1 0 42 0 45 2 0
                                              42 46 0 47 2 3 17 0 0 1 2 0 0 6 6
                                              15 2 2 42 46 0 47 1 0 6 0 10 1 0
                                              6 0 9 1 3 49 0 1 1 0 13 0 14 1 0
                                              6 0 12 1 0 6 0 11 2 3 48 48 0 1 1
                                              3 50 0 1 1 2 42 0 45 1 2 42 43 44
                                              1 1 27 0 34 1 0 0 6 26 1 3 20 0
                                              25 2 0 0 6 6 8 2 0 0 0 13 16 2 3
                                              17 0 0 19)))))
           '|lookupComplete|)) 
