
(/VERSIONCHECK 2) 

(DEFUN |DEQUEUE;bottom!;$S;1| (|d| $)
  (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue"))
        ('T (SPADCALL (SPADCALL |d| (QREFELT $ 11)) (QREFELT $ 12))))) 

(DEFUN |DEQUEUE;dequeue;L$;2| (|d| $)
  (SPADCALL (SPADCALL |d| (QREFELT $ 14)) (QREFELT $ 15))) 

(DEFUN |DEQUEUE;extractBottom!;$S;3| (|d| $)
  (PROG (|r| |q| #1=#:G134 |n| |p|)
    (RETURN
     (SEQ (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue")))
          (LETT |p| (SPADCALL |d| (QREFELT $ 11))
                . #2=(|DEQUEUE;extractBottom!;$S;3|))
          (LETT |n| (SPADCALL |p| (QREFELT $ 18)) . #2#)
          (EXIT
           (COND
            ((EQL |n| 1)
             (SEQ (LETT |r| (|SPADfirst| |p|) . #2#)
                  (SPADCALL |d| NIL (QREFELT $ 19)) (EXIT |r|)))
            ('T
             (SEQ
              (LETT |q|
                    (SPADCALL |p|
                              (PROG1 (LETT #1# (- |n| 2) . #2#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 21))
                    . #2#)
              (LETT |r| (|SPADfirst| (CDR |q|)) . #2#)
              (SPADCALL |q| '|rest| NIL (QREFELT $ 23)) (EXIT |r|))))))))) 

(DEFUN |DEQUEUE;extractTop!;$S;4| (|d| $)
  (PROG (|e|)
    (RETURN
     (SEQ (LETT |e| (SPADCALL |d| (QREFELT $ 25)) |DEQUEUE;extractTop!;$S;4|)
          (SPADCALL |d| (CDR (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 19))
          (EXIT |e|))))) 

(DEFUN |DEQUEUE;height;$Nni;5| (|d| $) (LENGTH (SPADCALL |d| (QREFELT $ 11)))) 

(DEFUN |DEQUEUE;insertTop!;S$S;6| (|e| |d| $)
  (SEQ (SPADCALL |d| (CONS |e| (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 19))
       (EXIT |e|))) 

(DEFUN |DEQUEUE;insertBottom!;S$S;7| (|e| |d| $)
  (SEQ
   (COND
    ((SPADCALL |d| (QREFELT $ 9))
     (SPADCALL |d| (SPADCALL |e| (QREFELT $ 29)) (QREFELT $ 19)))
    ('T
     (SPADCALL (LAST (SPADCALL |d| (QREFELT $ 11))) '|rest|
               (SPADCALL |e| (QREFELT $ 29)) (QREFELT $ 23))))
   (EXIT |e|))) 

(DEFUN |DEQUEUE;top;$S;8| (|d| $)
  (COND ((SPADCALL |d| (QREFELT $ 9)) (|error| "empty dequeue"))
        ('T (|SPADfirst| (SPADCALL |d| (QREFELT $ 11)))))) 

(DEFUN |DEQUEUE;reverse!;2$;9| (|d| $)
  (SEQ (SPADCALL |d| (REVERSE (SPADCALL |d| (QREFELT $ 11))) (QREFELT $ 19))
       (EXIT |d|))) 

(DEFUN |Dequeue| (#1=#:G154)
  (PROG ()
    (RETURN
     (PROG (#2=#:G155)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Dequeue|)
                                           '|domainEqualList|)
                . #3=(|Dequeue|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Dequeue;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Dequeue|))))))))))) 

(DEFUN |Dequeue;| (|#1|)
  (PROG (|pv$| #1=#:G152 #2=#:G153 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|Dequeue|))
      (LETT |dv$| (LIST '|Dequeue| DV$1) . #3#)
      (LETT $ (GETREFV 40) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|Dequeue| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 16))
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 32))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Reference| (|List| |#1|)))
      $)))) 

(MAKEPROP '|Dequeue| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Queue| 6) (|local| |#1|) '|Rep| (|Boolean|)
              (0 . |empty?|) (|List| 6) (5 . |deref|) (10 . |last|)
              |DEQUEUE;bottom!;$S;1| (15 . |copy|) (20 . |ref|)
              |DEQUEUE;dequeue;L$;2| (|Integer|) (25 . |maxIndex|)
              (30 . |setref|) (|NonNegativeInteger|) (36 . |rest|) '"rest"
              (42 . |setelt|) |DEQUEUE;extractBottom!;$S;3| |DEQUEUE;top;$S;8|
              |DEQUEUE;extractTop!;$S;4| |DEQUEUE;height;$Nni;5|
              |DEQUEUE;insertTop!;S$S;6| (49 . |list|)
              |DEQUEUE;insertBottom!;S$S;7| |DEQUEUE;reverse!;2$;9|
              (|Equation| 6) (|List| 32) (|Mapping| 8 6) (|Mapping| 6 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|))
           '#(~= 54 |top!| 60 |top| 65 |size?| 70 |sample| 76 |rotate!| 80
              |reverse!| 85 |push!| 90 |pop!| 96 |parts| 101 |more?| 106
              |members| 112 |member?| 117 |map!| 123 |map| 129 |less?| 135
              |length| 141 |latex| 146 |inspect| 151 |insertTop!| 156
              |insertBottom!| 162 |insert!| 168 |height| 174 |hashUpdate!| 179
              |hash| 185 |front| 190 |extractTop!| 195 |extractBottom!| 200
              |extract!| 205 |every?| 210 |eval| 216 |eq?| 242 |enqueue!| 248
              |empty?| 254 |empty| 259 |dequeue!| 263 |dequeue| 268 |depth| 277
              |count| 282 |copy| 294 |coerce| 299 |bottom!| 304 |bag| 309
              |back| 314 |any?| 319 = 325 |#| 331)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(NIL NIL NIL |BagAggregate&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|DequeueAggregate| 6) (|StackAggregate| 6)
                      (|QueueAggregate| 6) (|BagAggregate| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 36))
                   (|makeByteWordVec2| 39
                                       '(1 0 8 0 9 1 7 10 0 11 1 10 6 0 12 1 10
                                         0 0 14 1 7 0 10 15 1 10 17 0 18 2 7 10
                                         0 10 19 2 10 0 0 20 21 3 10 0 0 22 0
                                         23 1 10 0 6 29 2 1 8 0 0 1 1 0 6 0 1 1
                                         0 6 0 25 2 0 8 0 20 1 0 0 0 1 1 0 0 0
                                         1 1 0 0 0 31 2 0 6 6 0 1 1 0 6 0 1 1 6
                                         10 0 1 2 0 8 0 20 1 1 6 10 0 1 2 7 8 6
                                         0 1 2 5 0 35 0 1 2 0 0 35 0 1 2 0 8 0
                                         20 1 1 0 20 0 1 1 1 39 0 1 1 0 6 0 1 2
                                         0 6 6 0 28 2 0 6 6 0 30 2 0 0 6 0 1 1
                                         0 20 0 27 2 1 37 37 0 1 1 1 38 0 1 1 0
                                         6 0 1 1 0 6 0 26 1 0 6 0 24 1 0 6 0 1
                                         2 6 8 34 0 1 3 2 0 0 6 6 1 3 2 0 0 10
                                         10 1 2 2 0 0 32 1 2 2 0 0 33 1 2 0 8 0
                                         0 1 2 0 6 6 0 1 1 0 8 0 9 0 0 0 1 1 0
                                         6 0 1 1 0 0 10 16 0 0 0 1 1 0 20 0 1 2
                                         7 20 6 0 1 2 6 20 34 0 1 1 0 0 0 1 1 3
                                         36 0 1 1 0 6 0 13 1 0 0 10 1 1 0 6 0 1
                                         2 6 8 34 0 1 2 1 8 0 0 1 1 6 20 0
                                         1)))))
           '|lookupComplete|)) 
