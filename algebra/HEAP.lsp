
(/VERSIONCHECK 2) 

(DEFUN |HEAP;empty;$;1| ($) (SPADCALL (QREFELT $ 8))) 

(DEFUN |HEAP;heap;L$;2| (|l| $)
  (PROG (#1=#:G136 |x| |h| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #2=(|HEAP;heap;L$;2|))
          (LETT |h| (SPADCALL (QREFELT $ 9)) . #2#)
          (EXIT
           (COND ((EQL |n| 0) |h|)
                 ('T
                  (SEQ
                   (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |x| |h| (QREFELT $ 10))))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT |h|))))))))) 

(DEFUN |HEAP;siftUp| (|r| |i| |n| $)
  (PROG (#1=#:G141 |j| |k| |t|)
    (RETURN
     (SEQ (LETT |t| (SPADCALL |r| |i| (QREFELT $ 14)) . #2=(|HEAP;siftUp|))
          (EXIT
           (SEQ
            (EXIT
             (SEQ G190
                  (COND
                   ((NULL
                     (< (LETT |j| (+ (SPADCALL 2 |i| (QREFELT $ 16)) 1) . #2#)
                        |n|))
                    (GO G191)))
                  (SEQ
                   (SEQ (LETT |k| (+ |j| 1) . #2#)
                        (EXIT
                         (COND
                          ((< |k| |n|)
                           (COND
                            ((SPADCALL (SPADCALL |r| |j| (QREFELT $ 14))
                                       (SPADCALL |r| |k| (QREFELT $ 14))
                                       (QREFELT $ 18))
                             (LETT |j| |k| . #2#)))))))
                   (EXIT
                    (COND
                     ((SPADCALL |t| (SPADCALL |r| |j| (QREFELT $ 14))
                                (QREFELT $ 18))
                      (SEQ
                       (SPADCALL |r| |i| (SPADCALL |r| |j| (QREFELT $ 14))
                                 (QREFELT $ 19))
                       (SPADCALL |r| |j| |t| (QREFELT $ 19))
                       (EXIT (LETT |i| |j| . #2#))))
                     ('T (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#))))))
                  NIL (GO G190) G191 (EXIT NIL)))
            #1# (EXIT #1#))))))) 

(DEFUN |HEAP;extract!;$S;4| (|r| $)
  (PROG (|t| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 21)) . #1=(|HEAP;extract!;$S;4|))
          (EXIT
           (COND ((EQL |n| 0) (|error| "empty heap"))
                 (#2='T
                  (SEQ (LETT |t| (SPADCALL |r| 0 (QREFELT $ 14)) . #1#)
                       (SPADCALL |r| 0 (SPADCALL |r| (- |n| 1) (QREFELT $ 14))
                                 (QREFELT $ 19))
                       (SPADCALL |r| (- |n| 1) (QREFELT $ 22))
                       (EXIT
                        (COND ((EQL |n| 1) |t|)
                              (#2#
                               (SEQ (|HEAP;siftUp| |r| 0 (- |n| 1) $)
                                    (EXIT |t|))))))))))))) 

(DEFUN |HEAP;insert!;S2$;5| (|x| |r| $)
  (PROG (|j| #1=#:G150 |i|)
    (RETURN
     (SEQ (LETT |j| (SPADCALL |r| (QREFELT $ 21)) . #2=(|HEAP;insert!;S2$;5|))
          (LETT |r|
                (SPADCALL |r|
                          (SPADCALL |x| (SPADCALL (QREFELT $ 8))
                                    (QREFELT $ 24))
                          (QREFELT $ 25))
                . #2#)
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL (SPADCALL |j| 0 (QREFELT $ 26))) (GO G191)))
                 (SEQ (LETT |i| (QUOTIENT2 (- |j| 1) 2) . #2#)
                      (COND
                       ((SPADCALL (SPADCALL |r| |i| (QREFELT $ 14)) |x|
                                  (QREFELT $ 27))
                        (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#))))
                      (SPADCALL |r| |j| (SPADCALL |r| |i| (QREFELT $ 14))
                                (QREFELT $ 19))
                      (EXIT (LETT |j| |i| . #2#)))
                 NIL (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (SPADCALL |r| |j| |x| (QREFELT $ 19)) (EXIT |r|))))) 

(DEFUN |HEAP;max;$S;6| (|r| $)
  (COND ((EQL (SPADCALL |r| (QREFELT $ 21)) 0) (|error| "empty heap"))
        ('T (SPADCALL |r| 0 (QREFELT $ 14))))) 

(DEFUN |HEAP;inspect;$S;7| (|r| $) (SPADCALL |r| (QREFELT $ 28))) 

(DEFUN |HEAP;makeHeap| (|r| $)
  (PROG (|k| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 21)) . #1=(|HEAP;makeHeap|))
          (SEQ (LETT |k| (- (QUOTIENT2 |n| 2) 1) . #1#) G190
               (COND ((< |k| 0) (GO G191)))
               (SEQ (EXIT (|HEAP;siftUp| |r| |k| |n| $)))
               (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |r|))))) 

(DEFUN |HEAP;bag;L$;9| (|l| $)
  (|HEAP;makeHeap| (SPADCALL |l| (QREFELT $ 30)) $)) 

(DEFUN |HEAP;merge;3$;10| (|a| |b| $)
  (|HEAP;makeHeap| (SPADCALL |a| |b| (QREFELT $ 32)) $)) 

(DEFUN |HEAP;merge!;3$;11| (|a| |b| $)
  (|HEAP;makeHeap| (SPADCALL |a| |b| (QREFELT $ 25)) $)) 

(DEFUN |Heap| (#1=#:G167)
  (PROG ()
    (RETURN
     (PROG (#2=#:G168)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Heap|)
                                           '|domainEqualList|)
                . #3=(|Heap|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Heap;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Heap|))))))))))) 

(DEFUN |Heap;| (|#1|)
  (PROG (|pv$| #1=#:G164 #2=#:G165 #3=#:G166 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|Heap|))
      (LETT |dv$| (LIST '|Heap| DV$1) . #4#)
      (LETT $ (GETREFV 43) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #3#)
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|BasicType|))
                                                . #4#)
                                          (OR #2# #3#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #3#))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|Heap| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 256))
      (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
           (|augmentPredVector| $ 512))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|IndexedFlexibleArray| |#1| 0))
      $)))) 

(MAKEPROP '|Heap| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedFlexibleArray| 6 (NRTEVAL 0))
              (|local| |#1|) '|Rep| (0 . |empty|) |HEAP;empty;$;1|
              |HEAP;insert!;S2$;5| (|List| 6) |HEAP;heap;L$;2| (|Integer|)
              (4 . |elt|) (|PositiveInteger|) (10 . *) (|Boolean|) (16 . <)
              (22 . |setelt|) (|NonNegativeInteger|) (29 . |#|)
              (34 . |delete!|) |HEAP;extract!;$S;4| (40 . |concat|)
              (46 . |concat!|) (52 . >) (58 . >=) |HEAP;max;$S;6|
              |HEAP;inspect;$S;7| (64 . |construct|) |HEAP;bag;L$;9|
              (69 . |concat|) |HEAP;merge;3$;10| |HEAP;merge!;3$;11|
              (|List| 36) (|Equation| 6) (|Mapping| 17 6) (|Mapping| 6 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|))
           '#(~= 75 |size?| 81 |sample| 87 |parts| 91 |more?| 96 |merge!| 102
              |merge| 108 |members| 114 |member?| 119 |max| 125 |map!| 130
              |map| 136 |less?| 142 |latex| 148 |inspect| 153 |insert!| 158
              |heap| 164 |hashUpdate!| 169 |hash| 175 |extract!| 180 |every?|
              185 |eval| 191 |eq?| 217 |empty?| 223 |empty| 228 |count| 232
              |copy| 244 |coerce| 249 |bag| 254 |any?| 259 = 265 |#| 271)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(NIL |BagAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|PriorityQueueAggregate| 6) (|BagAggregate| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 39))
                   (|makeByteWordVec2| 42
                                       '(0 7 0 8 2 7 6 0 13 14 2 13 0 15 0 16 2
                                         6 17 0 0 18 3 7 6 0 13 6 19 1 0 20 0
                                         21 2 7 0 0 13 22 2 7 0 6 0 24 2 7 0 0
                                         0 25 2 13 17 0 0 26 2 6 17 0 0 27 1 7
                                         0 11 30 2 7 0 0 0 32 2 10 17 0 0 1 2 0
                                         17 0 20 1 0 0 0 1 1 8 11 0 1 2 0 17 0
                                         20 1 2 0 0 0 0 34 2 0 0 0 0 33 1 8 11
                                         0 1 2 9 17 6 0 1 1 0 6 0 28 2 7 0 38 0
                                         1 2 0 0 38 0 1 2 0 17 0 20 1 1 1 42 0
                                         1 1 0 6 0 29 2 0 0 6 0 10 1 0 0 11 12
                                         2 1 40 40 0 1 1 1 41 0 1 1 0 6 0 23 2
                                         8 17 37 0 1 3 2 0 0 11 11 1 3 2 0 0 6
                                         6 1 2 2 0 0 35 1 2 2 0 0 36 1 2 0 17 0
                                         0 1 1 0 17 0 1 0 0 0 9 2 9 20 6 0 1 2
                                         8 20 37 0 1 1 0 0 0 1 1 5 39 0 1 1 0 0
                                         11 31 2 8 17 37 0 1 2 10 17 0 0 1 1 8
                                         20 0 21)))))
           '|lookupComplete|)) 
