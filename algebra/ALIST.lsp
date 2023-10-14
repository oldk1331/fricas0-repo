
(/VERSIONCHECK 2) 

(DEFUN |ALIST;dictionary;$;1| ($) (SPADCALL NIL (QREFELT $ 11))) 

(DEFUN |ALIST;empty;$;2| ($) (SPADCALL (QREFELT $ 12))) 

(DEFUN |ALIST;empty?;$B;3| (|t| $) (NULL (SPADCALL |t| (QREFELT $ 14)))) 

(DEFUN |ALIST;entries;$L;4| (|t| $) (SPADCALL |t| (QREFELT $ 14))) 

(DEFUN |ALIST;parts;$L;5| (|t| $) (SPADCALL |t| (QREFELT $ 14))) 

(DEFUN |ALIST;keys;$L;6| (|t| $)
  (PROG (#1=#:G152 |k| #2=#:G151)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ALIST;keys;$L;6|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# (SPADCALL |t| (QREFELT $ 14)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCAR |k|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ALIST;#;$Nni;7| (|t| $) (LENGTH (SPADCALL |t| (QREFELT $ 14)))) 

(DEFUN |ALIST;first;$R;8| (|t| $) (|SPADfirst| (SPADCALL |t| (QREFELT $ 14)))) 

(DEFUN |ALIST;rest;2$;9| (|t| $)
  (SPADCALL (CDR (SPADCALL |t| (QREFELT $ 14))) (QREFELT $ 11))) 

(DEFUN |ALIST;concat;R2$;10| (|p| |t| $)
  (SPADCALL (CONS |p| (SPADCALL |t| (QREFELT $ 14))) (QREFELT $ 11))) 

(DEFUN |ALIST;setrest!;3$;11| (|a| |b| $)
  (SPADCALL
   (SPADCALL (SPADCALL |a| (QREFELT $ 14)) (SPADCALL |b| (QREFELT $ 14))
             (QREFELT $ 26))
   (QREFELT $ 11))) 

(DEFUN |ALIST;setfirst!;$2R;12| (|a| |p| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 14)) |p| (QREFELT $ 28))) 

(DEFUN |ALIST;minIndex;$I;13| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 14)) (QREFELT $ 31))) 

(DEFUN |ALIST;maxIndex;$I;14| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 14)) (QREFELT $ 33))) 

(DEFUN |ALIST;search;Key$U;15| (|k| |t| $)
  (PROG (#1=#:G177 #2=#:G182 #3=#:G183 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |r| NIL . #4=(|ALIST;search;Key$U;15|))
               (LETT #3# (SPADCALL |t| (QREFELT $ 14)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |k| (QCAR |r|) (QREFELT $ 35))
                   (PROGN
                    (LETT #1#
                          (PROGN (LETT #2# (CONS 0 (QCDR |r|)) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |ALIST;latex;$S;16| (|a| $)
  (PROG (|s| |l| |r|)
    (RETURN
     (SEQ (LETT |l| (SPADCALL |a| (QREFELT $ 17)) . #1=(|ALIST;latex;$S;16|))
          (LETT |s| "\\left[" . #1#)
          (SEQ G190 (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |r| (|SPADfirst| |l|) . #1#)
                    (LETT |l| (CDR |l|) . #1#)
                    (LETT |s|
                          (STRCONC |s|
                                   (STRCONC
                                    (SPADCALL (QCAR |r|) (QREFELT $ 39))
                                    (STRCONC " = "
                                             (SPADCALL (QCDR |r|)
                                                       (QREFELT $ 40)))))
                          . #1#)
                    (EXIT
                     (COND
                      ((NULL (NULL |l|))
                       (LETT |s| (STRCONC |s| ", ") . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (STRCONC |s| " \\right]")))))) 

(DEFUN |ALIST;assoc;Key$U;17| (|k| |t| $)
  (PROG (#1=#:G196 #2=#:G201 #3=#:G202 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |r| NIL . #4=(|ALIST;assoc;Key$U;17|))
               (LETT #3# (SPADCALL |t| (QREFELT $ 14)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |k| (QCAR |r|) (QREFELT $ 35))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# (CONS 0 |r|) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |ALIST;setelt;$Key2Entry;18| (|t| |k| |e| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |k| |t| (QREFELT $ 43)) |ALIST;setelt;$Key2Entry;18|)
      (EXIT
       (COND ((QEQCAR |r| 0) (PROGN (RPLACD #1=(QCDR |r|) |e|) (QCDR #1#)))
             ('T
              (SEQ
               (SPADCALL |t|
                         (CONS (CONS |k| |e|) (SPADCALL |t| (QREFELT $ 14)))
                         (QREFELT $ 44))
               (EXIT |e|))))))))) 

(DEFUN |ALIST;remove!;Key$U;19| (|k| |t| $)
  (PROG (|curr| |prev| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l| (SPADCALL |t| (QREFELT $ 14))
               . #1=(|ALIST;remove!;Key$U;19|)))
        (CONS 1 "failed"))
       ((SPADCALL |k| (QCAR (|SPADfirst| |l|)) (QREFELT $ 35))
        (SEQ (SPADCALL |t| (CDR |l|) (QREFELT $ 44))
             (EXIT (CONS 0 (QCDR (|SPADfirst| |l|))))))
       (#2='T
        (SEQ (LETT |prev| |l| . #1#) (LETT |curr| (CDR |l|) . #1#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL |curr|) 'NIL)
                           ('T
                            (SPADCALL (QCAR (|SPADfirst| |curr|)) |k|
                                      (QREFELT $ 46)))))
                    (GO G191)))
                  (SEQ (LETT |prev| |curr| . #1#)
                       (EXIT (LETT |curr| (CDR |curr|) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND ((NULL |curr|) (CONS 1 "failed"))
                    (#2#
                     (SEQ (SPADCALL |prev| (CDR |curr|) (QREFELT $ 26))
                          (EXIT (CONS 0 (QCDR (|SPADfirst| |curr|))))))))))))))) 

(DEFUN |AssociationList| (&REST #1=#:G277)
  (PROG ()
    (RETURN
     (PROG (#2=#:G278)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AssociationList|)
                                           '|domainEqualList|)
                . #3=(|AssociationList|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AssociationList;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|AssociationList|))))))))))) 

(DEFUN |AssociationList;| (|#1| |#2|)
  (PROG (#1=#:G275 #2=#:G276 |pv$| #3=#:G273 #4=#:G274 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|AssociationList|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT |dv$| (LIST '|AssociationList| DV$1 DV$2) . #5#)
      (LETT $ (GETREFV 72) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| |#1|)
                                                     (|:| |entry| |#2|))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (|HasCategory|
                                           (|Record| (|:| |key| |#1|)
                                                     (|:| |entry| |#2|))
                                           '(|OrderedSet|))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (LETT #4#
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|))
                                                . #5#)
                                          (AND
                                           (|HasCategory| |#2|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                           #4#)
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|Record| (|:| |key| |#1|)
                                                           (|:| |entry| |#2|))
                                                 '(|SetCategory|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #4#
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #3#)
                                          (OR #4#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|OrderedSet|))
                                              #3#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (OR #4# #3#)
                                          (AND
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            (LIST '|Evalable|
                                                  (LIST '|Record|
                                                        (LIST '|:| '|key|
                                                              (|devaluate|
                                                               |#1|))
                                                        (LIST '|:| '|entry|
                                                              (|devaluate|
                                                               |#2|)))))
                                           #3#)
                                          (OR
                                           (AND
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             (LIST '|Evalable|
                                                   (LIST '|Record|
                                                         (LIST '|:| '|key|
                                                               (|devaluate|
                                                                |#1|))
                                                         (LIST '|:| '|entry|
                                                               (|devaluate|
                                                                |#2|)))))
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             (LIST '|Evalable|
                                                   (LIST '|Record|
                                                         (LIST '|:| '|key|
                                                               (|devaluate|
                                                                |#1|))
                                                         (LIST '|:| '|entry|
                                                               (|devaluate|
                                                                |#2|)))))
                                            #3#))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|AssociationList| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 8192))
      (AND #4# #2# (|augmentPredVector| $ 16384))
      (AND #2# #3# (|augmentPredVector| $ 32768))
      (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #5#)
           (|augmentPredVector| $ 65536))
      (AND #1#
           (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                          '(|OrderedSet|))
           (|augmentPredVector| $ 131072))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Reference|
                 (|List| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|)))))
      $)))) 

(MAKEPROP '|AssociationList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Record| (|:| |key| 6) (|:| |entry| 7)) (|List| 9) (0 . |ref|)
              |ALIST;dictionary;$;1| |ALIST;empty;$;2| (5 . |deref|)
              (|Boolean|) |ALIST;empty?;$B;3| |ALIST;entries;$L;4|
              |ALIST;parts;$L;5| (|List| 6) |ALIST;keys;$L;6|
              (|NonNegativeInteger|) |ALIST;#;$Nni;7| |ALIST;first;$R;8|
              |ALIST;rest;2$;9| |ALIST;concat;R2$;10| (10 . |setrest!|)
              |ALIST;setrest!;3$;11| (16 . |setfirst!|)
              |ALIST;setfirst!;$2R;12| (|Integer|) (22 . |minIndex|)
              |ALIST;minIndex;$I;13| (27 . |maxIndex|) |ALIST;maxIndex;$I;14|
              (32 . =) (|Union| 7 '"failed") |ALIST;search;Key$U;15| (|String|)
              (38 . |latex|) (43 . |latex|) |ALIST;latex;$S;16|
              (|Union| 9 '"failed") |ALIST;assoc;Key$U;17| (48 . |setref|)
              |ALIST;setelt;$Key2Entry;18| (54 . ~=) |ALIST;remove!;Key$U;19|
              (|Equation| 9) (|List| 48) (|Mapping| 9 9 9) (|List| 52)
              (|Equation| 7) (|List| 7) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|InputForm|) (|Mapping| 15 9) (|Mapping| 15 7)
              (|Mapping| 9 9) (|List| $) '"value" '"first" '"rest" '"last"
              (|UniversalSegment| 30) (|Void|) (|Mapping| 15 9 9)
              (|Mapping| 7 7) (|List| 30) (|Mapping| 7 7 7))
           '#(~= 60 |value| 66 |third| 71 |tail| 76 |table| 81 |swap!| 90
              |split!| 104 |sorted?| 110 |sort!| 121 |sort| 132 |smaller?| 143
              |size?| 149 |setvalue!| 155 |setrest!| 161 |setlast!| 167
              |setfirst!| 173 |setelt| 179 |setchildren!| 228 |select!| 234
              |select| 246 |second| 258 |search| 263 |sample| 269 |reverse!|
              273 |reverse| 278 |rest| 283 |removeDuplicates!| 294
              |removeDuplicates| 299 |remove!| 304 |remove| 334 |reduce| 358
              |qsetelt!| 400 |qelt| 414 |possiblyInfinite?| 426 |position| 431
              |parts| 450 |nodes| 465 |node?| 470 |new| 476 |more?| 482
              |minIndex| 488 |min| 498 |merge!| 504 |merge| 517 |members| 530
              |member?| 545 |maxIndex| 563 |max| 573 |map!| 579 |map| 597
              |list| 629 |less?| 634 |leaves| 640 |leaf?| 645 |latex| 650
              |last| 655 |keys| 666 |key?| 671 |inspect| 677 |insert!| 682
              |insert| 702 |indices| 716 |index?| 726 |hashUpdate!| 738 |hash|
              744 |first| 749 |find| 765 |fill!| 777 |extract!| 789
              |explicitlyFinite?| 794 |every?| 799 |eval| 817 |eq?| 895
              |entry?| 901 |entries| 913 |empty?| 923 |empty| 928 |elt| 932
              |distance| 988 |dictionary| 994 |delete!| 1003 |delete| 1015
              |cyclic?| 1027 |cycleTail| 1032 |cycleSplit!| 1037 |cycleLength|
              1042 |cycleEntry| 1047 |count| 1052 |copyInto!| 1088 |copy| 1095
              |convert| 1100 |construct| 1105 |concat!| 1115 |concat| 1127
              |coerce| 1150 |children| 1155 |child?| 1160 |bag| 1166 |assoc|
              1171 |any?| 1177 >= 1195 > 1201 = 1207 <= 1213 < 1219 |#| 1225)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 2 0 0 0
                                  13 5 9 0 0 0 0 0 13 5 8 1 9 2))
            (CONS
             '#(NIL |TableAggregate&| |KeyedDictionary&| |ListAggregate&|
                |Dictionary&| |ExtensibleLinearAggregate&|
                |FiniteLinearAggregate&| |StreamAggregate&|
                |DictionaryOperations&| |LinearAggregate&|
                |UnaryRecursiveAggregate&| |BagAggregate&| |IndexedAggregate&|
                |RecursiveAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                NIL |EltableAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |Evalable&| |SetCategory&| NIL NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |BasicType&|
                |PartialOrder&|)
             (CONS
              '#((|AssociationListAggregate| 6 7) (|TableAggregate| 6 7)
                 (|KeyedDictionary| 6 7)
                 (|ListAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ExtensibleLinearAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|FiniteLinearAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|StreamAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|LinearAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|UnaryRecursiveAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 30
                                     (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|RecursiveAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|OrderedSet|) (|HomogeneousAggregate| 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Comparable|)
                 (|EltableAggregate| 30
                                     (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|EltableAggregate| 6 7) (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 30 (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|InnerEvalable| 7 7) (|CoercibleTo| 54) (|ConvertibleTo| 57)
                 (|BasicType|) (|PartialOrder|))
              (|makeByteWordVec2| 71
                                  '(1 8 0 10 11 1 8 10 0 14 2 10 0 0 0 26 2 10
                                    9 0 9 28 1 10 30 0 31 1 10 30 0 33 2 6 15 0
                                    0 35 1 6 38 0 39 1 7 38 0 40 2 8 10 0 10 44
                                    2 6 15 0 0 46 2 11 15 0 0 1 1 0 9 0 1 1 0 9
                                    0 1 1 0 0 0 1 1 0 0 10 1 0 0 0 1 3 17 67 0
                                    30 30 1 3 17 67 0 6 6 1 2 17 0 0 30 1 1 2
                                    15 0 1 2 0 15 68 0 1 1 18 0 0 1 2 17 0 68 0
                                    1 1 2 0 0 1 2 0 0 68 0 1 2 2 15 0 0 1 2 0
                                    15 0 21 1 2 17 9 0 9 1 2 17 0 0 0 27 2 17 9
                                    0 9 1 2 17 9 0 9 29 3 17 9 0 62 9 1 3 17 9
                                    0 63 9 1 3 17 0 0 64 0 1 3 17 9 0 65 9 1 3
                                    17 9 0 66 9 1 3 17 9 0 30 9 1 3 0 7 0 6 7
                                    45 2 17 0 0 61 1 2 14 0 58 0 1 2 0 0 58 0 1
                                    2 14 0 58 0 1 2 14 0 58 0 1 1 0 9 0 1 2 0
                                    36 6 0 37 0 0 0 1 1 17 0 0 1 1 0 0 0 1 1 0
                                    0 0 24 2 0 0 0 21 1 1 7 0 0 1 1 16 0 0 1 2
                                    7 0 9 0 1 2 14 0 58 0 1 2 14 0 9 0 1 2 0 0
                                    58 0 1 2 0 36 6 0 47 2 16 0 9 0 1 2 16 0 9
                                    0 1 2 14 0 58 0 1 2 14 0 58 0 1 4 16 9 50 0
                                    9 9 1 4 16 9 50 0 9 9 1 2 14 9 50 0 1 3 14
                                    9 50 0 9 1 2 14 9 50 0 1 3 14 9 50 0 9 1 3
                                    17 9 0 30 9 1 3 17 7 0 6 7 1 2 0 9 0 30 1 2
                                    0 7 0 6 1 1 0 15 0 1 2 7 30 9 0 1 3 7 30 9
                                    0 30 1 2 0 30 58 0 1 1 14 10 0 18 1 14 53 0
                                    1 1 14 10 0 18 1 0 61 0 1 2 7 15 0 0 1 2 0
                                    0 21 9 1 2 0 15 0 21 1 1 6 30 0 32 1 3 6 0
                                    1 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 68 0 0 1 2
                                    2 0 0 0 1 3 0 0 68 0 0 1 1 14 10 0 1 1 14
                                    53 0 1 1 14 10 0 1 2 16 15 9 0 1 2 16 15 9
                                    0 1 2 15 15 7 0 1 1 6 30 0 34 1 3 6 0 1 2 2
                                    0 0 0 1 2 17 0 60 0 1 2 17 0 69 0 1 2 17 0
                                    60 0 1 2 0 0 60 0 1 3 0 0 50 0 0 1 3 0 0 71
                                    0 0 1 2 0 0 69 0 1 2 0 0 60 0 1 1 0 0 9 1 2
                                    0 15 0 21 1 1 0 10 0 1 1 0 15 0 1 1 11 38 0
                                    41 1 0 9 0 1 2 0 0 0 21 1 1 0 19 0 20 2 0
                                    15 6 0 1 1 0 9 0 1 3 0 0 9 0 30 1 3 0 0 0 0
                                    30 1 2 0 0 9 0 1 3 0 0 0 0 30 1 3 0 0 9 0
                                    30 1 1 0 70 0 1 1 0 19 0 1 2 0 15 30 0 1 2
                                    0 15 6 0 1 2 11 55 55 0 1 1 11 56 0 1 1 3 7
                                    0 1 1 0 9 0 23 2 0 0 0 21 1 2 0 42 58 0 1 2
                                    0 42 58 0 1 2 17 0 0 9 1 2 17 0 0 7 1 1 0 9
                                    0 1 1 0 15 0 1 2 14 15 58 0 1 2 14 15 59 0
                                    1 2 14 15 58 0 1 2 12 0 0 48 1 2 12 0 0 49
                                    1 3 12 0 0 9 9 1 3 12 0 0 10 10 1 3 12 0 0
                                    10 10 1 2 12 0 0 48 1 3 12 0 0 9 9 1 2 12 0
                                    0 49 1 2 5 0 0 51 1 3 5 0 0 7 7 1 2 5 0 0
                                    52 1 3 5 0 0 53 53 1 2 0 15 0 0 1 2 16 15 9
                                    0 1 2 15 15 7 0 1 1 0 10 0 17 1 0 53 0 1 1
                                    0 15 0 16 0 0 0 13 2 0 9 0 62 1 2 0 9 0 63
                                    1 2 0 0 0 64 1 2 0 9 0 65 1 2 0 0 0 66 1 2
                                    0 9 0 30 1 3 0 9 0 30 9 1 2 0 7 0 6 1 3 0 7
                                    0 6 7 1 2 0 30 0 0 1 1 0 0 10 1 0 0 0 12 2
                                    0 0 0 66 1 2 0 0 0 30 1 2 0 0 0 66 1 2 0 0
                                    0 30 1 1 0 15 0 1 1 0 0 0 1 1 17 0 0 1 1 0
                                    21 0 1 1 0 0 0 1 2 16 21 9 0 1 2 16 21 9 0
                                    1 2 15 21 7 0 1 2 14 21 58 0 1 2 14 21 59 0
                                    1 2 14 21 58 0 1 3 17 0 0 0 30 1 1 0 0 0 1
                                    1 1 57 0 1 1 0 0 10 1 1 0 0 10 1 2 0 0 0 0
                                    1 2 0 0 0 9 1 2 0 0 0 0 1 2 0 0 9 0 25 1 0
                                    0 61 1 2 0 0 0 9 1 1 10 54 0 1 1 0 61 0 1 2
                                    7 15 0 0 1 1 0 0 10 1 2 0 42 6 0 43 2 14 15
                                    58 0 1 2 14 15 59 0 1 2 14 15 58 0 1 2 2 15
                                    0 0 1 2 2 15 0 0 1 2 11 15 0 0 1 2 2 15 0 0
                                    1 2 2 15 0 0 1 1 14 21 0 22)))))
           '|lookupComplete|)) 
