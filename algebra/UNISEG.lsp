
(SDEFUN |UNISEG;segment;S$;1| ((|a| S) ($ $)) (CONS 0 (CONS |a| 1))) 

(SDEFUN |UNISEG;segment;2S$;2| ((|a| S) (|b| S) ($ $))
        (CONS 1 (SPADCALL |a| |b| (QREFELT $ 10)))) 

(SDEFUN |UNISEG;BY;$I$;3| ((|s| $) (|i| |Integer|) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL (QCDR |s|) |i| (QREFELT $ 13))))
         ('T (CONS 0 (CONS (SPADCALL |s| (QREFELT $ 14)) |i|))))) 

(SDEFUN |UNISEG;lo;$S;4| ((|s| $) ($ S))
        (COND ((QEQCAR |s| 0) (QCAR (QCDR |s|)))
              ('T (SPADCALL (QCDR |s|) (QREFELT $ 16))))) 

(SDEFUN |UNISEG;low;$S;5| ((|s| $) ($ S))
        (COND ((QEQCAR |s| 0) (QCAR (QCDR |s|)))
              ('T (SPADCALL (QCDR |s|) (QREFELT $ 16))))) 

(PUT '|UNISEG;hasHi;$B;6| '|SPADreplace| '(XLAM (|s|) (QEQCAR |s| 1))) 

(SDEFUN |UNISEG;hasHi;$B;6| ((|s| $) ($ |Boolean|)) (QEQCAR |s| 1)) 

(SDEFUN |UNISEG;hi;$S;7| ((|s| $) ($ S))
        (COND
         ((NULL (SPADCALL |s| (QREFELT $ 19)))
          (|error| "hi: segment has no upper bound"))
         ('T (SPADCALL (QCDR |s|) (QREFELT $ 20))))) 

(SDEFUN |UNISEG;high;$S;8| ((|s| $) ($ S))
        (COND
         ((NULL (SPADCALL |s| (QREFELT $ 19)))
          (|error| "high: segment has no upper bound"))
         ('T (SPADCALL (QCDR |s|) (QREFELT $ 20))))) 

(SDEFUN |UNISEG;incr;$I;9| ((|s| $) ($ |Integer|))
        (COND ((QEQCAR |s| 0) (QCDR (QCDR |s|)))
              ('T (SPADCALL (QCDR |s|) (QREFELT $ 23))))) 

(SDEFUN |UNISEG;SEGMENT;S$;10| ((|a| S) ($ $)) (SPADCALL |a| (QREFELT $ 8))) 

(SDEFUN |UNISEG;SEGMENT;2S$;11| ((|a| S) (|b| S) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 11))) 

(SDEFUN |UNISEG;coerce;S$;12| ((|sg| |Segment| S) ($ $))
        (SPADCALL (SPADCALL |sg| (QREFELT $ 27)) (SPADCALL |sg| (QREFELT $ 28))
                  (QREFELT $ 11))) 

(SDEFUN |UNISEG;convert;S$;13| ((|a| S) ($ $))
        (CONS 1 (SPADCALL |a| (QREFELT $ 30)))) 

(SDEFUN |UNISEG;=;2$B;14| ((|s1| $) (|s2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |s1| 0)
          (COND
           ((QEQCAR |s2| 0)
            (COND
             ((SPADCALL (QCAR (QCDR |s1|)) (QCAR (QCDR |s2|)) (QREFELT $ 32))
              (EQL (QCDR (QCDR |s1|)) (QCDR (QCDR |s2|))))
             (#1='T NIL)))
           (#1# NIL)))
         ((QEQCAR |s1| 1)
          (COND
           ((QEQCAR |s2| 1) (SPADCALL (QCDR |s1|) (QCDR |s2|) (QREFELT $ 33)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |UNISEG;coerce;$Of;15| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|inc| (|Integer|)) (|seg| (|OutputForm|)) (|e| (|OutputForm|)))
         (SEQ
          (LETT |seg|
                (SEQ
                 (LETT |e|
                       (SPADCALL (SPADCALL |s| (QREFELT $ 14)) (QREFELT $ 36))
                       . #1=(|UNISEG;coerce;$Of;15|))
                 (EXIT
                  (COND
                   ((SPADCALL |s| (QREFELT $ 19))
                    (SPADCALL |e|
                              (SPADCALL (SPADCALL |s| (QREFELT $ 21))
                                        (QREFELT $ 36))
                              (QREFELT $ 37)))
                   (#2='T (SPADCALL |e| (QREFELT $ 38))))))
                . #1#)
          (LETT |inc| (SPADCALL |s| (QREFELT $ 24)) . #1#)
          (EXIT
           (COND ((EQL |inc| 1) |seg|)
                 (#2#
                  (SPADCALL (SPADCALL " by " (QREFELT $ 40)) |seg|
                            (SPADCALL |inc| (QREFELT $ 41))
                            (QREFELT $ 42)))))))) 

(SDEFUN |UNISEG;convert;$If;16| ((|s| $) ($ |InputForm|))
        (SPROG ((|seg| (|InputForm|)))
               (SEQ
                (COND ((QEQCAR |s| 1) (SPADCALL (QCDR |s|) (QREFELT $ 45)))
                      (#1='T
                       (SEQ
                        (LETT |seg|
                              (SPADCALL 'SEGMENT
                                        (LIST
                                         (SPADCALL
                                          (SPADCALL |s| (QREFELT $ 17))
                                          (QREFELT $ 46)))
                                        (QREFELT $ 50))
                              |UNISEG;convert;$If;16|)
                        (EXIT
                         (COND ((EQL (SPADCALL |s| (QREFELT $ 24)) 1) |seg|)
                               (#1#
                                (SPADCALL 'BY
                                          (LIST |seg|
                                                (SPADCALL
                                                 (SPADCALL |s| (QREFELT $ 24))
                                                 (QREFELT $ 51)))
                                          (QREFELT $ 50))))))))))) 

(SDEFUN |UNISEG;+;S2$;17| ((|i| S) (|s| $) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL |i| (QCDR |s|) (QREFELT $ 53))))
         ('T
          (CONS 0
                (CONS
                 (SPADCALL |i| (SPADCALL |s| (QREFELT $ 14)) (QREFELT $ 54))
                 (SPADCALL |s| (QREFELT $ 24))))))) 

(SDEFUN |UNISEG;+;$S$;18| ((|s| $) (|i| S) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL (QCDR |s|) |i| (QREFELT $ 56))))
         ('T
          (CONS 0
                (CONS
                 (SPADCALL (SPADCALL |s| (QREFELT $ 14)) |i| (QREFELT $ 54))
                 (SPADCALL |s| (QREFELT $ 24))))))) 

(SDEFUN |UNISEG;-;$S$;19| ((|s| $) (|i| S) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL (QCDR |s|) |i| (QREFELT $ 58))))
         ('T
          (CONS 0
                (CONS
                 (SPADCALL (SPADCALL |s| (QREFELT $ 14)) |i| (QREFELT $ 59))
                 (SPADCALL |s| (QREFELT $ 24))))))) 

(SDEFUN |UNISEG;expand;$S;20| ((|s| $) ($ |Stream| S))
        (SPADCALL (LIST |s|) (QREFELT $ 63))) 

(SDEFUN |UNISEG;map;M$S;21| ((|f| |Mapping| S S) (|s| $) ($ |Stream| S))
        (SPADCALL |f| (SPADCALL |s| (QREFELT $ 64)) (QREFELT $ 66))) 

(SDEFUN |UNISEG;expand;LS;22| ((|ls| |List| $) ($ |Stream| S))
        (SPROG
         ((|st| (|Stream| S)) (|s| ($)) (|lb| (|List| (|Segment| S)))
          (|ns| (|Segment| S)))
         (SEQ
          (LETT |st| (SPADCALL (QREFELT $ 68)) . #1=(|UNISEG;expand;LS;22|))
          (EXIT
           (COND ((SPADCALL |ls| (QREFELT $ 70)) |st|)
                 (#2='T
                  (SEQ (LETT |lb| NIL . #1#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |ls| (QREFELT $ 70)) NIL)
                                     ('T
                                      (SPADCALL (SPADCALL |ls| (QREFELT $ 71))
                                                (QREFELT $ 19)))))
                              (GO G191)))
                            (SEQ
                             (LETT |s| (SPADCALL |ls| (QREFELT $ 71)) . #1#)
                             (LETT |ls| (SPADCALL |ls| (QREFELT $ 72)) . #1#)
                             (LETT |ns|
                                   (SPADCALL
                                    (QCDR
                                     (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                               (SPADCALL |s| (QREFELT $ 21))
                                               (QREFELT $ 26)))
                                    (SPADCALL |s| (QREFELT $ 24))
                                    (QREFELT $ 13))
                                   . #1#)
                             (EXIT
                              (LETT |lb| (SPADCALL |lb| |ns| (QREFELT $ 74))
                                    . #1#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (COND
                        ((SPADCALL |ls| (QREFELT $ 70))
                         (LETT |st| (SPADCALL (QREFELT $ 68)) . #1#))
                        (#2#
                         (SEQ (LETT |s| (SPADCALL |ls| (QREFELT $ 71)) . #1#)
                              (EXIT
                               (LETT |st|
                                     (SPADCALL
                                      (CONS #'|UNISEG;expand;LS;22!0|
                                            (VECTOR $ |s|))
                                      (SPADCALL |s| (QREFELT $ 14))
                                      (QREFELT $ 76))
                                     . #1#)))))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |lb| (QREFELT $ 78))
                                   (QREFELT $ 79))
                         |st| (QREFELT $ 80)))))))))) 

(SDEFUN |UNISEG;expand;LS;22!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UNISEG;expand;LS;22|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 24)) (QREFELT $ 75))
                      (QREFELT $ 54)))))) 

(DECLAIM (NOTINLINE |UniversalSegment;|)) 

(DEFUN |UniversalSegment| (#1=#:G196)
  (SPROG NIL
         (PROG (#2=#:G197)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UniversalSegment|)
                                               '|domainEqualList|)
                    . #3=(|UniversalSegment|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UniversalSegment;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UniversalSegment|)))))))))) 

(DEFUN |UniversalSegment;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|UniversalSegment|))
          (LETT |dv$| (LIST '|UniversalSegment| DV$1) . #1#)
          (LETT $ (GETREFV 83) . #1#)
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
          (|haddProp| |$ConstructorCache| '|UniversalSegment| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Union|
                     (|Record| (|:| |low| |#1|) (|:| |incr| (|Integer|)))
                     (|Segment| |#1|)))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 34 (CONS (|dispatchFunction| |UNISEG;=;2$B;14|) $))
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |UNISEG;coerce;$Of;15|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |UNISEG;convert;$If;16|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 55 (CONS (|dispatchFunction| |UNISEG;+;S2$;17|) $))
             (QSETREFV $ 57 (CONS (|dispatchFunction| |UNISEG;+;$S$;18|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 60 (CONS (|dispatchFunction| |UNISEG;-;$S$;19|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 64
                       (CONS (|dispatchFunction| |UNISEG;expand;$S;20|) $))
             (QSETREFV $ 67 (CONS (|dispatchFunction| |UNISEG;map;M$S;21|) $))
             (QSETREFV $ 63
                       (CONS (|dispatchFunction| |UNISEG;expand;LS;22|) $)))))
          $))) 

(MAKEPROP '|UniversalSegment| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |UNISEG;segment;S$;1| (|Segment| 6) (0 . |segment|)
              |UNISEG;segment;2S$;2| (|Integer|) (6 . BY) |UNISEG;lo;$S;4|
              |UNISEG;BY;$I$;3| (12 . |low|) |UNISEG;low;$S;5| (|Boolean|)
              |UNISEG;hasHi;$B;6| (17 . |high|) |UNISEG;hi;$S;7|
              |UNISEG;high;$S;8| (22 . |incr|) |UNISEG;incr;$I;9|
              |UNISEG;SEGMENT;S$;10| |UNISEG;SEGMENT;2S$;11| (27 . |lo|)
              (32 . |hi|) |UNISEG;coerce;S$;12| (37 . |convert|)
              |UNISEG;convert;S$;13| (42 . =) (48 . =) (54 . =) (|OutputForm|)
              (60 . |coerce|) (65 . SEGMENT) (71 . SEGMENT) (|String|)
              (76 . |message|) (81 . |coerce|) (86 . |infix|) (93 . |coerce|)
              (|InputForm|) (98 . |convert|) (103 . |convert|) (|Symbol|)
              (|List| 44) (|InputFormFunctions1| $$) (108 . |packageCall|)
              (114 . |convert|) (119 . |convert|) (124 . +) (130 . +) (136 . +)
              (142 . +) (148 . +) (154 . -) (160 . -) (166 . -) (|Stream| 6)
              (|List| $) (172 . |expand|) (177 . |expand|) (|Mapping| 6 6)
              (182 . |map|) (188 . |map|) (194 . |empty|) (|List| $$)
              (198 . |null|) (203 . |first|) (208 . |rest|) (|List| 9)
              (213 . |concat!|) (219 . |coerce|) (224 . |stream|) (|List| 6)
              (230 . |expand|) (235 . |construct|) (240 . |concat|)
              (|SingleInteger|) (|HashState|))
           '#(~= 246 |segment| 252 |map| 263 |low| 269 |lo| 274 |latex| 279
              |incr| 284 |high| 289 |hi| 294 |hashUpdate!| 299 |hash| 305
              |hasHi| 310 |expand| 315 |convert| 325 |coerce| 335 SEGMENT 345
              BY 356 = 362 - 368 + 374)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(2 0 3 0 1 3 3))
                 (CONS '#(NIL NIL |SetCategory&| NIL NIL |BasicType&| NIL)
                       (CONS
                        '#((|SegmentExpansionCategory| 6 (|Stream| 6))
                           (|SegmentCategory| 6) (|SetCategory|) (|Type|)
                           (|ConvertibleTo| 44) (|BasicType|)
                           (|CoercibleTo| 35))
                        (|makeByteWordVec2| 82
                                            '(2 9 0 6 6 10 2 9 0 0 12 13 1 9 6
                                              0 16 1 9 6 0 20 1 9 12 0 23 1 9 6
                                              0 27 1 9 6 0 28 1 9 0 6 30 2 6 18
                                              0 0 32 2 9 18 0 0 33 2 0 18 0 0
                                              34 1 6 35 0 36 2 35 0 0 0 37 1 35
                                              0 0 38 1 35 0 39 40 1 12 35 0 41
                                              3 35 0 0 0 0 42 1 0 35 0 43 1 9
                                              44 0 45 1 6 44 0 46 2 49 44 47 48
                                              50 1 12 44 0 51 1 0 44 0 52 2 9 0
                                              6 0 53 2 6 0 0 0 54 2 0 0 6 0 55
                                              2 9 0 0 6 56 2 0 0 0 6 57 2 9 0 0
                                              6 58 2 6 0 0 0 59 2 0 0 0 6 60 1
                                              0 61 62 63 1 0 61 0 64 2 61 0 65
                                              0 66 2 0 61 65 0 67 0 61 0 68 1
                                              69 18 0 70 1 69 2 0 71 1 69 0 0
                                              72 2 73 0 0 9 74 1 6 0 12 75 2 61
                                              0 65 6 76 1 9 77 62 78 1 61 0 77
                                              79 2 61 0 0 0 80 2 3 18 0 0 1 1 0
                                              0 6 8 2 0 0 6 6 11 2 2 61 65 0 67
                                              1 0 6 0 17 1 0 6 0 14 1 3 39 0 1
                                              1 0 12 0 24 1 0 6 0 22 1 0 6 0 21
                                              2 3 82 82 0 1 1 3 81 0 1 1 0 18 0
                                              19 1 2 61 0 64 1 2 61 62 63 1 1
                                              44 0 52 1 0 0 6 31 1 3 35 0 43 1
                                              0 0 9 29 1 0 0 6 25 2 0 0 6 6 26
                                              2 0 0 0 12 15 2 3 18 0 0 34 2 5 0
                                              0 6 60 2 4 0 0 6 57 2 4 0 6 0
                                              55)))))
           '|lookupComplete|)) 
