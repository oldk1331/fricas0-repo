
(PUT '|SEG;SEGMENT;2S$;1| '|SPADreplace| '(XLAM (|a| |b|) (VECTOR |a| |b| 1))) 

(SDEFUN |SEG;SEGMENT;2S$;1| ((|a| S) (|b| S) ($ $)) (VECTOR |a| |b| 1)) 

(PUT '|SEG;low;$S;2| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SEG;low;$S;2| ((|s| $) ($ S)) (QVELT |s| 0)) 

(PUT '|SEG;high;$S;3| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 1))) 

(SDEFUN |SEG;high;$S;3| ((|s| $) ($ S)) (QVELT |s| 1)) 

(PUT '|SEG;incr;$I;4| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 2))) 

(SDEFUN |SEG;incr;$I;4| ((|s| $) ($ |Integer|)) (QVELT |s| 2)) 

(PUT '|SEG;segment;2S$;5| '|SPADreplace| '(XLAM (|a| |b|) (VECTOR |a| |b| 1))) 

(SDEFUN |SEG;segment;2S$;5| ((|a| S) (|b| S) ($ $)) (VECTOR |a| |b| 1)) 

(SDEFUN |SEG;BY;$I$;6| ((|s| $) (|r| |Integer|) ($ $))
        (VECTOR (SPADCALL |s| (QREFELT $ 9)) (SPADCALL |s| (QREFELT $ 10)) |r|)) 

(SDEFUN |SEG;=;2$B;7| ((|s1| $) (|s2| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QVELT |s1| 0) (QVELT |s2| 0) (QREFELT $ 16))
          (COND
           ((SPADCALL (QVELT |s1| 1) (QVELT |s2| 1) (QREFELT $ 16))
            (EQL (QVELT |s1| 2) (QVELT |s2| 2)))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |SEG;coerce;$Of;8| ((|s| $) ($ |OutputForm|))
        (SPROG ((|seg| (|OutputForm|)))
               (SEQ
                (LETT |seg|
                      (SPADCALL (SPADCALL (QVELT |s| 0) (QREFELT $ 19))
                                (SPADCALL (QVELT |s| 1) (QREFELT $ 19))
                                (QREFELT $ 20))
                      |SEG;coerce;$Of;8|)
                (EXIT
                 (COND ((EQL (QVELT |s| 2) 1) |seg|)
                       ('T
                        (SPADCALL (SPADCALL " by " (QREFELT $ 22)) |seg|
                                  (SPADCALL (QVELT |s| 2) (QREFELT $ 23))
                                  (QREFELT $ 24)))))))) 

(PUT '|SEG;convert;S$;9| '|SPADreplace| '(XLAM (|a|) (VECTOR |a| |a| 1))) 

(SDEFUN |SEG;convert;S$;9| ((|a| S) ($ $)) (VECTOR |a| |a| 1)) 

(SDEFUN |SEG;convert;$If;10| ((|s| $) ($ |InputForm|))
        (SPROG ((|seg| (|InputForm|)))
               (SEQ
                (LETT |seg|
                      (SPADCALL 'SEGMENT
                                (LIST
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 9))
                                           (QREFELT $ 28))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 10))
                                           (QREFELT $ 28)))
                                (QREFELT $ 32))
                      |SEG;convert;$If;10|)
                (EXIT
                 (COND ((EQL (SPADCALL |s| (QREFELT $ 12)) 1) |seg|)
                       ('T
                        (SPADCALL 'BY
                                  (LIST |seg|
                                        (SPADCALL (SPADCALL |s| (QREFELT $ 12))
                                                  (QREFELT $ 33)))
                                  (QREFELT $ 32)))))))) 

(SDEFUN |SEG;+;S2$;11| ((|i| S) (|s| $) ($ $))
        (VECTOR (SPADCALL |i| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 35))
                (SPADCALL |i| (SPADCALL |s| (QREFELT $ 10)) (QREFELT $ 35))
                (SPADCALL |s| (QREFELT $ 12)))) 

(SDEFUN |SEG;+;$S$;12| ((|s| $) (|i| S) ($ $))
        (VECTOR (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |i| (QREFELT $ 35))
                (SPADCALL (SPADCALL |s| (QREFELT $ 10)) |i| (QREFELT $ 35))
                (SPADCALL |s| (QREFELT $ 12)))) 

(SDEFUN |SEG;-;$S$;13| ((|s| $) (|i| S) ($ $))
        (VECTOR (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |i| (QREFELT $ 38))
                (SPADCALL (SPADCALL |s| (QREFELT $ 10)) |i| (QREFELT $ 38))
                (SPADCALL |s| (QREFELT $ 12)))) 

(SDEFUN |SEG;expand;LL;14| ((|ls| |List| $) ($ |List| S))
        (SPROG
         ((|l| (S)) (|lr| (|List| S)) (|inc| (S)) (|h| (S)) (#1=#:G139 NIL)
          (|s| NIL))
         (SEQ (LETT |lr| NIL . #2=(|SEG;expand;LL;14|))
              (SEQ (LETT |s| NIL . #2#) (LETT #1# |ls| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |l| (SPADCALL |s| (QREFELT $ 9)) . #2#)
                        (LETT |h| (SPADCALL |s| (QREFELT $ 10)) . #2#)
                        (LETT |inc|
                              (SPADCALL (SPADCALL |s| (QREFELT $ 12))
                                        (QREFELT $ 40))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |inc| (QREFELT $ 41))
                           (|error|
                            "Cannot expand a segment with an increment of zero"))
                          ((SPADCALL |inc| (|spadConstant| $ 42)
                                     (QREFELT $ 43))
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |l| |h| (QREFELT $ 44)))
                                  (GO G191)))
                                (SEQ (LETT |lr| (CONS |l| |lr|) . #2#)
                                     (EXIT
                                      (LETT |l|
                                            (SPADCALL |l| |inc| (QREFELT $ 35))
                                            . #2#)))
                                NIL (GO G190) G191 (EXIT NIL)))
                          ('T
                           (SEQ G190
                                (COND
                                 ((NULL (SPADCALL |l| |h| (QREFELT $ 45)))
                                  (GO G191)))
                                (SEQ (LETT |lr| (CONS |l| |lr|) . #2#)
                                     (EXIT
                                      (LETT |l|
                                            (SPADCALL |l| |inc| (QREFELT $ 35))
                                            . #2#)))
                                NIL (GO G190) G191 (EXIT NIL))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |lr|))))) 

(SDEFUN |SEG;expand;$L;15| ((|s| $) ($ |List| S))
        (SPADCALL (LIST |s|) (QREFELT $ 48))) 

(SDEFUN |SEG;map;M$L;16| ((|f| |Mapping| S S) (|s| $) ($ |List| S))
        (SPROG ((|l| (S)) (|lr| (|List| S)) (|inc| (S)) (|h| (S)))
               (SEQ (LETT |lr| NIL . #1=(|SEG;map;M$L;16|))
                    (LETT |l| (SPADCALL |s| (QREFELT $ 9)) . #1#)
                    (LETT |h| (SPADCALL |s| (QREFELT $ 10)) . #1#)
                    (LETT |inc|
                          (SPADCALL (SPADCALL |s| (QREFELT $ 12))
                                    (QREFELT $ 40))
                          . #1#)
                    (COND
                     ((SPADCALL |inc| (|spadConstant| $ 42) (QREFELT $ 43))
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 44)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 35))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL)))
                     ('T
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |l| |h| (QREFELT $ 45)))
                             (GO G191)))
                           (SEQ
                            (LETT |lr| (CONS (SPADCALL |l| |f|) |lr|) . #1#)
                            (EXIT
                             (LETT |l| (SPADCALL |l| |inc| (QREFELT $ 35))
                                   . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))))
                    (EXIT (NREVERSE |lr|))))) 

(DECLAIM (NOTINLINE |Segment;|)) 

(DEFUN |Segment| (#1=#:G148)
  (SPROG NIL
         (PROG (#2=#:G149)
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
          (LETT $ (GETREFV 54) . #1#)
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
                                                             '(|SetCategory|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))))
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
             (QSETREFV $ 17 (CONS (|dispatchFunction| |SEG;=;2$B;7|) $))
             (QSETREFV $ 25
                       (CONS (|dispatchFunction| |SEG;coerce;$Of;8|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 34
                       (CONS (|dispatchFunction| |SEG;convert;$If;10|) $)))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 36 (CONS (|dispatchFunction| |SEG;+;S2$;11|) $))
             (QSETREFV $ 37 (CONS (|dispatchFunction| |SEG;+;$S$;12|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 39 (CONS (|dispatchFunction| |SEG;-;$S$;13|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 48 (CONS (|dispatchFunction| |SEG;expand;LL;14|) $))
             (QSETREFV $ 49 (CONS (|dispatchFunction| |SEG;expand;$L;15|) $))
             (QSETREFV $ 51 (CONS (|dispatchFunction| |SEG;map;M$L;16|) $)))))
          $))) 

(MAKEPROP '|Segment| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| |SEG;SEGMENT;2S$;1|
              |SEG;low;$S;2| |SEG;high;$S;3| (|Integer|) |SEG;incr;$I;4|
              |SEG;segment;2S$;5| |SEG;BY;$I$;6| (|Boolean|) (0 . =) (6 . =)
              (|OutputForm|) (12 . |coerce|) (17 . SEGMENT) (|String|)
              (23 . |message|) (28 . |coerce|) (33 . |infix|) (40 . |coerce|)
              |SEG;convert;S$;9| (|InputForm|) (45 . |convert|) (|Symbol|)
              (|List| 27) (|InputFormFunctions1| $$) (50 . |packageCall|)
              (56 . |convert|) (61 . |convert|) (66 . +) (72 . +) (78 . +)
              (84 . -) (90 . -) (96 . |coerce|) (101 . |zero?|) (106 . |Zero|)
              (110 . >) (116 . <=) (122 . >=) (|List| 6) (|List| $)
              (128 . |expand|) (133 . |expand|) (|Mapping| 6 6) (138 . |map|)
              (|SingleInteger|) (|HashState|))
           '#(~= 144 |segment| 150 |map| 156 |low| 162 |latex| 167 |incr| 172
              |high| 177 |hashUpdate!| 182 |hash| 188 |expand| 193 |convert|
              203 |coerce| 213 SEGMENT 218 BY 224 = 230 - 236 + 242)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(2 0 3 0 1 3 3))
                 (CONS '#(NIL NIL |SetCategory&| NIL NIL |BasicType&| NIL)
                       (CONS
                        '#((|SegmentExpansionCategory| 6 (|List| 6))
                           (|SegmentCategory| 6) (|SetCategory|) (|Type|)
                           (|ConvertibleTo| 27) (|BasicType|)
                           (|CoercibleTo| 18))
                        (|makeByteWordVec2| 53
                                            '(2 6 15 0 0 16 2 0 15 0 0 17 1 6
                                              18 0 19 2 18 0 0 0 20 1 18 0 21
                                              22 1 11 18 0 23 3 18 0 0 0 0 24 1
                                              0 18 0 25 1 6 27 0 28 2 31 27 29
                                              30 32 1 27 0 11 33 1 0 27 0 34 2
                                              6 0 0 0 35 2 0 0 6 0 36 2 0 0 0 6
                                              37 2 6 0 0 0 38 2 0 0 0 6 39 1 6
                                              0 11 40 1 6 15 0 41 0 6 0 42 2 6
                                              15 0 0 43 2 6 15 0 0 44 2 6 15 0
                                              0 45 1 0 46 47 48 1 0 46 0 49 2 0
                                              46 50 0 51 2 3 15 0 0 1 2 0 0 6 6
                                              13 2 2 46 50 0 51 1 0 6 0 9 1 3
                                              21 0 1 1 0 11 0 12 1 0 6 0 10 2 3
                                              53 53 0 1 1 3 52 0 1 1 2 46 0 49
                                              1 2 46 47 48 1 1 27 0 34 1 0 0 6
                                              26 1 3 18 0 25 2 0 0 6 6 8 2 0 0
                                              0 11 14 2 3 15 0 0 17 2 5 0 0 6
                                              39 2 4 0 0 6 37 2 4 0 6 0 36)))))
           '|lookupComplete|)) 
