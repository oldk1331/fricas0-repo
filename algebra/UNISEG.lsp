
(/VERSIONCHECK 2) 

(DEFUN |UNISEG;segment;S$;1| (|a| $) (CONS 0 (CONS |a| 1))) 

(DEFUN |UNISEG;segment;2S$;2| (|a| |b| $) (CONS 1 (VECTOR |a| |b| 1))) 

(DEFUN |UNISEG;BY;$I$;3| (|s| |i| $)
  (COND
   ((QEQCAR |s| 1)
    (CONS 1
          (VECTOR (SPADCALL |s| (QREFELT $ 10)) (SPADCALL |s| (QREFELT $ 11))
                  |i|)))
   ('T (CONS 0 (CONS (SPADCALL |s| (QREFELT $ 10)) |i|))))) 

(DEFUN |UNISEG;lo;$S;4| (|s| $)
  (COND ((QEQCAR |s| 0) (QCAR (QCDR |s|))) ('T (QVELT (QCDR |s|) 0)))) 

(DEFUN |UNISEG;low;$S;5| (|s| $)
  (COND ((QEQCAR |s| 0) (QCAR (QCDR |s|))) ('T (QVELT (QCDR |s|) 0)))) 

(PUT '|UNISEG;hasHi;$B;6| '|SPADreplace| '(XLAM (|s|) (QEQCAR |s| 1))) 

(DEFUN |UNISEG;hasHi;$B;6| (|s| $) (QEQCAR |s| 1)) 

(DEFUN |UNISEG;hi;$S;7| (|s| $)
  (COND
   ((NULL (SPADCALL |s| (QREFELT $ 16)))
    (|error| "hi: segment has no upper bound"))
   ('T (QVELT (QCDR |s|) 1)))) 

(DEFUN |UNISEG;high;$S;8| (|s| $)
  (COND
   ((NULL (SPADCALL |s| (QREFELT $ 16)))
    (|error| "high: segment has no upper bound"))
   ('T (QVELT (QCDR |s|) 1)))) 

(DEFUN |UNISEG;incr;$I;9| (|s| $)
  (COND ((QEQCAR |s| 0) (QCDR (QCDR |s|))) ('T (QVELT (QCDR |s|) 2)))) 

(DEFUN |UNISEG;SEGMENT;S$;10| (|a| $) (SPADCALL |a| (QREFELT $ 8))) 

(DEFUN |UNISEG;SEGMENT;2S$;11| (|a| |b| $) (SPADCALL |a| |b| (QREFELT $ 9))) 

(DEFUN |UNISEG;coerce;S$;12| (|sg| $)
  (SPADCALL (SPADCALL |sg| (QREFELT $ 22)) (SPADCALL |sg| (QREFELT $ 23))
            (QREFELT $ 9))) 

(DEFUN |UNISEG;convert;S$;13| (|a| $) (CONS 1 (VECTOR |a| |a| 1))) 

(DEFUN |UNISEG;=;2$B;14| (|s1| |s2| $)
  (COND
   ((QEQCAR |s1| 0)
    (COND
     ((QEQCAR |s2| 0)
      (COND
       ((SPADCALL (QCAR (QCDR |s1|)) (QCAR (QCDR |s2|)) (QREFELT $ 26))
        (EQL (QCDR (QCDR |s1|)) (QCDR (QCDR |s2|))))
       (#1='T 'NIL)))
     (#1# 'NIL)))
   ((QEQCAR |s1| 1)
    (COND
     ((QEQCAR |s2| 1)
      (COND
       ((SPADCALL (QCAR (QCDR |s2|)) (QCAR (QCDR |s2|)) (QREFELT $ 26))
        (COND
         ((SPADCALL (QVELT (QCDR |s1|) 1) (QVELT (QCDR |s2|) 1) (QREFELT $ 26))
          (EQL (QCDR (QCDR |s1|)) (QCDR (QCDR |s2|))))
         (#1# 'NIL)))
       (#1# 'NIL)))
     (#1# 'NIL)))
   (#1# 'NIL))) 

(DEFUN |UNISEG;coerce;$Of;15| (|s| $)
  (PROG (|inc| |seg| |e|)
    (RETURN
     (SEQ
      (LETT |seg|
            (SEQ
             (LETT |e| (SPADCALL (SPADCALL |s| (QREFELT $ 10)) (QREFELT $ 29))
                   . #1=(|UNISEG;coerce;$Of;15|))
             (EXIT
              (COND
               ((SPADCALL |s| (QREFELT $ 16))
                (SPADCALL |e|
                          (SPADCALL (SPADCALL |s| (QREFELT $ 11))
                                    (QREFELT $ 29))
                          (QREFELT $ 30)))
               (#2='T (SPADCALL |e| (QREFELT $ 31))))))
            . #1#)
      (LETT |inc| (SPADCALL |s| (QREFELT $ 18)) . #1#)
      (EXIT
       (COND ((EQL |inc| 1) |seg|)
             (#2#
              (SPADCALL " by " |seg| (SPADCALL |inc| (QREFELT $ 32))
                        (QREFELT $ 33))))))))) 

(DEFUN |UNISEG;convert;$If;16| (|s| $)
  (PROG (|seg|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |s| (QREFELT $ 16))
        (LETT |seg|
              (SPADCALL 'SEGMENT
                        (LIST
                         (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                   (QREFELT $ 36))
                         (SPADCALL (SPADCALL |s| (QREFELT $ 11))
                                   (QREFELT $ 36)))
                        (QREFELT $ 40))
              . #1=(|UNISEG;convert;$If;16|)))
       (#2='T
        (LETT |seg|
              (SPADCALL 'SEGMENT
                        (LIST
                         (SPADCALL (SPADCALL |s| (QREFELT $ 14))
                                   (QREFELT $ 36)))
                        (QREFELT $ 40))
              . #1#)))
      (EXIT
       (COND ((EQL (SPADCALL |s| (QREFELT $ 18)) 1) |seg|)
             (#2#
              (SPADCALL 'BY
                        (LIST |seg|
                              (SPADCALL (SPADCALL |s| (QREFELT $ 18))
                                        (QREFELT $ 41)))
                        (QREFELT $ 40))))))))) 

(DEFUN |UNISEG;expand;$S;17| (|s| $) (SPADCALL (LIST |s|) (QREFELT $ 45))) 

(DEFUN |UNISEG;map;M$S;18| (|f| |s| $)
  (SPADCALL |f| (SPADCALL |s| (QREFELT $ 46)) (QREFELT $ 48))) 

(DEFUN |UNISEG;plusInc| (|t| |a| $) (SPADCALL |t| |a| (QREFELT $ 50))) 

(DEFUN |UNISEG;expand;LS;20| (|ls| $)
  (PROG (|st| |s| |lb| |ns|)
    (RETURN
     (SEQ (LETT |st| (SPADCALL (QREFELT $ 51)) . #1=(|UNISEG;expand;LS;20|))
          (EXIT
           (COND ((SPADCALL |ls| (QREFELT $ 53)) |st|)
                 (#2='T
                  (SEQ (LETT |lb| NIL . #1#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |ls| (QREFELT $ 53)) 'NIL)
                                     ('T
                                      (SPADCALL (SPADCALL |ls| (QREFELT $ 54))
                                                (QREFELT $ 16)))))
                              (GO G191)))
                            (SEQ
                             (LETT |s| (SPADCALL |ls| (QREFELT $ 54)) . #1#)
                             (LETT |ls| (SPADCALL |ls| (QREFELT $ 55)) . #1#)
                             (LETT |ns|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |s| (QREFELT $ 10))
                                              (SPADCALL |s| (QREFELT $ 11))
                                              (QREFELT $ 56))
                                    (SPADCALL |s| (QREFELT $ 18))
                                    (QREFELT $ 57))
                                   . #1#)
                             (EXIT
                              (LETT |lb| (SPADCALL |lb| |ns| (QREFELT $ 59))
                                    . #1#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (COND
                        ((SPADCALL |ls| (QREFELT $ 53))
                         (LETT |st| (SPADCALL (QREFELT $ 51)) . #1#))
                        (#2#
                         (SEQ (LETT |s| (SPADCALL |ls| (QREFELT $ 54)) . #1#)
                              (EXIT
                               (LETT |st|
                                     (SPADCALL
                                      (CONS #'|UNISEG;expand;LS;20!0|
                                            (VECTOR $ |s|))
                                      (SPADCALL |s| (QREFELT $ 10))
                                      (QREFELT $ 61))
                                     . #1#)))))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |lb| (QREFELT $ 63))
                                   (QREFELT $ 64))
                         |st| (QREFELT $ 65))))))))))) 

(DEFUN |UNISEG;expand;LS;20!0| (|x| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|UNISEG;expand;LS;20|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x| (SPADCALL (SPADCALL |s| (QREFELT $ 18)) (QREFELT $ 60))
                (QREFELT $ 50)))))) 

(DEFUN |UniversalSegment| (#1=#:G229)
  (PROG ()
    (RETURN
     (PROG (#2=#:G230)
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
          (UNWIND-PROTECT (PROG1 (|UniversalSegment;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|UniversalSegment|))))))))))) 

(DEFUN |UniversalSegment;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UniversalSegment|))
      (LETT |dv$| (LIST '|UniversalSegment| DV$1) . #1#)
      (LETT $ (GETREFV 69) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|OrderedRing|))
                                          (|HasCategory| |#1|
                                                         '(|SetCategory|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|UniversalSegment| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union| (|Record| (|:| |low| |#1|) (|:| |incr| (|Integer|)))
                         (|Record| (|:| |low| |#1|) (|:| |high| |#1|)
                                   (|:| |incr| (|Integer|)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 27 (CONS (|dispatchFunction| |UNISEG;=;2$B;14|) $))
         (QSETREFV $ 34
                   (CONS (|dispatchFunction| |UNISEG;coerce;$Of;15|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 42
                   (CONS (|dispatchFunction| |UNISEG;convert;$If;16|) $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 46 (CONS (|dispatchFunction| |UNISEG;expand;$S;17|) $))
         (QSETREFV $ 49 (CONS (|dispatchFunction| |UNISEG;map;M$S;18|) $))
         (QSETREFV $ 45 (CONS (|dispatchFunction| |UNISEG;expand;LS;20|) $)))))
      $)))) 

(MAKEPROP '|UniversalSegment| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |UNISEG;segment;S$;1| |UNISEG;segment;2S$;2| |UNISEG;lo;$S;4|
              |UNISEG;hi;$S;7| (|Integer|) |UNISEG;BY;$I$;3| |UNISEG;low;$S;5|
              (|Boolean|) |UNISEG;hasHi;$B;6| |UNISEG;high;$S;8|
              |UNISEG;incr;$I;9| |UNISEG;SEGMENT;S$;10| |UNISEG;SEGMENT;2S$;11|
              (|Segment| 6) (0 . |lo|) (5 . |hi|) |UNISEG;coerce;S$;12|
              |UNISEG;convert;S$;13| (10 . =) (16 . =) (|OutputForm|)
              (22 . |coerce|) (27 . SEGMENT) (33 . SEGMENT) (38 . |coerce|)
              (43 . |infix|) (50 . |coerce|) (|InputForm|) (55 . |convert|)
              (|Symbol|) (|List| 35) (|InputFormFunctions1| $$)
              (60 . |packageCall|) (66 . |convert|) (71 . |convert|)
              (|Stream| 6) (|List| $) (76 . |expand|) (81 . |expand|)
              (|Mapping| 6 6) (86 . |map|) (92 . |map|) (98 . +)
              (104 . |empty|) (|List| $$) (108 . |null|) (113 . |first|)
              (118 . |rest|) (123 . SEGMENT) (129 . BY) (|List| 21)
              (135 . |concat!|) (141 . |coerce|) (146 . |generate|) (|List| 6)
              (152 . |expand|) (157 . |construct|) (162 . |concat|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 168 |segment| 174 |map| 185 |low| 191 |lo| 196 |latex| 201
              |incr| 206 |high| 211 |hi| 216 |hashUpdate!| 221 |hash| 227
              |hasHi| 232 |expand| 237 |convert| 247 |coerce| 257 SEGMENT 267
              BY 278 = 284)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(2 0 3 0 1 3 3))
                 (CONS '#(NIL NIL |SetCategory&| NIL NIL |BasicType&| NIL)
                       (CONS
                        '#((|SegmentExpansionCategory| 6 (|Stream| 6))
                           (|SegmentCategory| 6) (|SetCategory|) (|Type|)
                           (|ConvertibleTo| 35) (|BasicType|)
                           (|CoercibleTo| 28))
                        (|makeByteWordVec2| 68
                                            '(1 21 6 0 22 1 21 6 0 23 2 6 15 0
                                              0 26 2 0 15 0 0 27 1 6 28 0 29 2
                                              28 0 0 0 30 1 28 0 0 31 1 12 28 0
                                              32 3 28 0 0 0 0 33 1 0 28 0 34 1
                                              6 35 0 36 2 39 35 37 38 40 1 12
                                              35 0 41 1 0 35 0 42 1 0 43 44 45
                                              1 0 43 0 46 2 43 0 47 0 48 2 0 43
                                              47 0 49 2 6 0 0 0 50 0 43 0 51 1
                                              52 15 0 53 1 52 2 0 54 1 52 0 0
                                              55 2 21 0 6 6 56 2 21 0 0 12 57 2
                                              58 0 0 21 59 1 6 0 12 60 2 43 0
                                              47 6 61 1 21 62 44 63 1 43 0 62
                                              64 2 43 0 0 0 65 2 3 15 0 0 1 1 0
                                              0 6 8 2 0 0 6 6 9 2 2 43 47 0 49
                                              1 0 6 0 14 1 0 6 0 10 1 3 66 0 1
                                              1 0 12 0 18 1 0 6 0 17 1 0 6 0 11
                                              2 3 68 68 0 1 1 3 67 0 1 1 0 15 0
                                              16 1 2 43 0 46 1 2 43 44 45 1 1
                                              35 0 42 1 0 0 6 25 1 3 28 0 34 1
                                              0 0 21 24 1 0 0 6 19 2 0 0 6 6 20
                                              2 0 0 0 12 13 2 3 15 0 0 27)))))
           '|lookupComplete|)) 
