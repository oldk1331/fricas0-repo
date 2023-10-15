
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
                  (SPADCALL " by " |seg| (SPADCALL |inc| (QREFELT $ 39))
                            (QREFELT $ 40)))))))) 

(SDEFUN |UNISEG;convert;$If;16| ((|s| $) ($ |InputForm|))
        (SPROG ((|seg| (|InputForm|)))
               (SEQ
                (COND ((QEQCAR |s| 1) (SPADCALL (QCDR |s|) (QREFELT $ 43)))
                      (#1='T
                       (SEQ
                        (LETT |seg|
                              (SPADCALL 'SEGMENT
                                        (LIST
                                         (SPADCALL
                                          (SPADCALL |s| (QREFELT $ 17))
                                          (QREFELT $ 44)))
                                        (QREFELT $ 48))
                              |UNISEG;convert;$If;16|)
                        (EXIT
                         (COND ((EQL (SPADCALL |s| (QREFELT $ 24)) 1) |seg|)
                               (#1#
                                (SPADCALL 'BY
                                          (LIST |seg|
                                                (SPADCALL
                                                 (SPADCALL |s| (QREFELT $ 24))
                                                 (QREFELT $ 49)))
                                          (QREFELT $ 48))))))))))) 

(SDEFUN |UNISEG;+;S2$;17| ((|i| S) (|s| $) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL |i| (QCDR |s|) (QREFELT $ 51))))
         ('T
          (CONS 0
                (CONS
                 (SPADCALL |i| (SPADCALL |s| (QREFELT $ 14)) (QREFELT $ 52))
                 (SPADCALL |s| (QREFELT $ 24))))))) 

(SDEFUN |UNISEG;+;$S$;18| ((|s| $) (|i| S) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL (QCDR |s|) |i| (QREFELT $ 54))))
         ('T
          (CONS 0
                (CONS
                 (SPADCALL (SPADCALL |s| (QREFELT $ 14)) |i| (QREFELT $ 52))
                 (SPADCALL |s| (QREFELT $ 24))))))) 

(SDEFUN |UNISEG;-;$S$;19| ((|s| $) (|i| S) ($ $))
        (COND
         ((QEQCAR |s| 1) (CONS 1 (SPADCALL (QCDR |s|) |i| (QREFELT $ 56))))
         ('T
          (CONS 0
                (CONS
                 (SPADCALL (SPADCALL |s| (QREFELT $ 14)) |i| (QREFELT $ 57))
                 (SPADCALL |s| (QREFELT $ 24))))))) 

(SDEFUN |UNISEG;expand;$S;20| ((|s| $) ($ |Stream| S))
        (SPADCALL (LIST |s|) (QREFELT $ 61))) 

(SDEFUN |UNISEG;map;M$S;21| ((|f| |Mapping| S S) (|s| $) ($ |Stream| S))
        (SPADCALL |f| (SPADCALL |s| (QREFELT $ 62)) (QREFELT $ 64))) 

(SDEFUN |UNISEG;expand;LS;22| ((|ls| |List| $) ($ |Stream| S))
        (SPROG
         ((|st| (|Stream| S)) (|s| ($)) (|lb| (|List| (|Segment| S)))
          (|ns| (|Segment| S)))
         (SEQ
          (LETT |st| (SPADCALL (QREFELT $ 66)) . #1=(|UNISEG;expand;LS;22|))
          (EXIT
           (COND ((SPADCALL |ls| (QREFELT $ 68)) |st|)
                 (#2='T
                  (SEQ (LETT |lb| NIL . #1#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |ls| (QREFELT $ 68)) NIL)
                                     ('T
                                      (SPADCALL (SPADCALL |ls| (QREFELT $ 69))
                                                (QREFELT $ 19)))))
                              (GO G191)))
                            (SEQ
                             (LETT |s| (SPADCALL |ls| (QREFELT $ 69)) . #1#)
                             (LETT |ls| (SPADCALL |ls| (QREFELT $ 70)) . #1#)
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
                              (LETT |lb| (SPADCALL |lb| |ns| (QREFELT $ 72))
                                    . #1#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (COND
                        ((SPADCALL |ls| (QREFELT $ 68))
                         (LETT |st| (SPADCALL (QREFELT $ 66)) . #1#))
                        (#2#
                         (SEQ (LETT |s| (SPADCALL |ls| (QREFELT $ 69)) . #1#)
                              (EXIT
                               (LETT |st|
                                     (SPADCALL
                                      (CONS #'|UNISEG;expand;LS;22!0|
                                            (VECTOR $ |s|))
                                      (SPADCALL |s| (QREFELT $ 14))
                                      (QREFELT $ 74))
                                     . #1#)))))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |lb| (QREFELT $ 76))
                                   (QREFELT $ 77))
                         |st| (QREFELT $ 78)))))))))) 

(SDEFUN |UNISEG;expand;LS;22!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UNISEG;expand;LS;22|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 24)) (QREFELT $ 73))
                      (QREFELT $ 52)))))) 

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
          (LETT $ (GETREFV 82) . #1#)
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
             (QSETREFV $ 41
                       (CONS (|dispatchFunction| |UNISEG;coerce;$Of;15|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 50
                       (CONS (|dispatchFunction| |UNISEG;convert;$If;16|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 53 (CONS (|dispatchFunction| |UNISEG;+;S2$;17|) $))
             (QSETREFV $ 55 (CONS (|dispatchFunction| |UNISEG;+;$S$;18|) $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 58 (CONS (|dispatchFunction| |UNISEG;-;$S$;19|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 62
                       (CONS (|dispatchFunction| |UNISEG;expand;$S;20|) $))
             (QSETREFV $ 65 (CONS (|dispatchFunction| |UNISEG;map;M$S;21|) $))
             (QSETREFV $ 61
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
              (60 . |coerce|) (65 . SEGMENT) (71 . SEGMENT) (76 . |coerce|)
              (81 . |infix|) (88 . |coerce|) (|InputForm|) (93 . |convert|)
              (98 . |convert|) (|Symbol|) (|List| 42)
              (|InputFormFunctions1| $$) (103 . |packageCall|)
              (109 . |convert|) (114 . |convert|) (119 . +) (125 . +) (131 . +)
              (137 . +) (143 . +) (149 . -) (155 . -) (161 . -) (|Stream| 6)
              (|List| $) (167 . |expand|) (172 . |expand|) (|Mapping| 6 6)
              (177 . |map|) (183 . |map|) (189 . |empty|) (|List| $$)
              (193 . |null|) (198 . |first|) (203 . |rest|) (|List| 9)
              (208 . |concat!|) (214 . |coerce|) (219 . |stream|) (|List| 6)
              (225 . |expand|) (230 . |construct|) (235 . |concat|)
              (|SingleInteger|) (|String|) (|HashState|))
           '#(~= 241 |segment| 247 |map| 258 |low| 264 |lo| 269 |latex| 274
              |incr| 279 |high| 284 |hi| 289 |hashUpdate!| 294 |hash| 300
              |hasHi| 305 |expand| 310 |convert| 320 |coerce| 330 SEGMENT 340
              BY 351 = 357 - 363 + 369)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(2 0 3 0 1 3 3))
                 (CONS '#(NIL NIL |SetCategory&| NIL NIL |BasicType&| NIL)
                       (CONS
                        '#((|SegmentExpansionCategory| 6 (|Stream| 6))
                           (|SegmentCategory| 6) (|SetCategory|) (|Type|)
                           (|ConvertibleTo| 42) (|BasicType|)
                           (|CoercibleTo| 35))
                        (|makeByteWordVec2| 81
                                            '(2 9 0 6 6 10 2 9 0 0 12 13 1 9 6
                                              0 16 1 9 6 0 20 1 9 12 0 23 1 9 6
                                              0 27 1 9 6 0 28 1 9 0 6 30 2 6 18
                                              0 0 32 2 9 18 0 0 33 2 0 18 0 0
                                              34 1 6 35 0 36 2 35 0 0 0 37 1 35
                                              0 0 38 1 12 35 0 39 3 35 0 0 0 0
                                              40 1 0 35 0 41 1 9 42 0 43 1 6 42
                                              0 44 2 47 42 45 46 48 1 12 42 0
                                              49 1 0 42 0 50 2 9 0 6 0 51 2 6 0
                                              0 0 52 2 0 0 6 0 53 2 9 0 0 6 54
                                              2 0 0 0 6 55 2 9 0 0 6 56 2 6 0 0
                                              0 57 2 0 0 0 6 58 1 0 59 60 61 1
                                              0 59 0 62 2 59 0 63 0 64 2 0 59
                                              63 0 65 0 59 0 66 1 67 18 0 68 1
                                              67 2 0 69 1 67 0 0 70 2 71 0 0 9
                                              72 1 6 0 12 73 2 59 0 63 6 74 1 9
                                              75 60 76 1 59 0 75 77 2 59 0 0 0
                                              78 2 3 18 0 0 1 1 0 0 6 8 2 0 0 6
                                              6 11 2 2 59 63 0 65 1 0 6 0 17 1
                                              0 6 0 14 1 3 80 0 1 1 0 12 0 24 1
                                              0 6 0 22 1 0 6 0 21 2 3 81 81 0 1
                                              1 3 79 0 1 1 0 18 0 19 1 2 59 0
                                              62 1 2 59 60 61 1 1 42 0 50 1 0 0
                                              6 31 1 3 35 0 41 1 0 0 9 29 1 0 0
                                              6 25 2 0 0 6 6 26 2 0 0 0 12 15 2
                                              3 18 0 0 34 2 5 0 0 6 58 2 4 0 0
                                              6 55 2 4 0 6 0 53)))))
           '|lookupComplete|)) 
