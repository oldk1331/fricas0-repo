
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

(DEFUN |AssociationList| (&REST #1=#:G284)
  (PROG ()
    (RETURN
     (PROG (#2=#:G285)
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
  (PROG (#1=#:G281 #2=#:G283 #3=#:G282 |pv$| #4=#:G278 #5=#:G279 #6=#:G280 $
         |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|AssociationList|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT |dv$| (LIST '|AssociationList| DV$1 DV$2) . #7#)
      (LETT $ (GETREFV 72) . #7#)
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
                                          (LETT #6#
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|))
                                                . #7#)
                                          (AND
                                           (|HasCategory| |#2|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                           #6#)
                                          (|HasCategory| |#2| '(|BasicType|))
                                          (LETT #5#
                                                (|HasCategory|
                                                 (|Record| (|:| |key| |#1|)
                                                           (|:| |entry| |#2|))
                                                 '(|SetCategory|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #6#
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #5#)
                                          (OR #6#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|OrderedSet|))
                                              #5#)
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (LETT #4#
                                                (|HasCategory|
                                                 (|Record| (|:| |key| |#1|)
                                                           (|:| |entry| |#2|))
                                                 '(|BasicType|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#2| '(|BasicType|))
                                           #6# #4#
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|OrderedSet|))
                                           #5#)
                                          (OR #6# #5#)
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
                                           #5#)
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
                                            #5#))))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|AssociationList| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (LETT #3# (|HasCategory| $ '(|finiteAggregate|)) . #7#)
           (|augmentPredVector| $ 65536))
      (AND #6# #3# (|augmentPredVector| $ 131072))
      (AND (|HasCategory| |#2| '(|BasicType|)) #3#
           (|augmentPredVector| $ 262144))
      (AND #3# #5# (|augmentPredVector| $ 524288))
      (AND
       (LETT #2#
             (AND (|HasCategory| $ '(|finiteAggregate|))
                  (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                                 '(|BasicType|)))
             . #7#)
       (|augmentPredVector| $ 1048576))
      (AND (OR (AND (|HasCategory| |#2| '(|BasicType|)) #3#) #6# #2# #5#)
           (|augmentPredVector| $ 2097152))
      (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #7#)
           (|augmentPredVector| $ 4194304))
      (AND #1#
           (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                          '(|OrderedSet|))
           (|augmentPredVector| $ 8388608))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Reference|
                 (|List| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|)))))
      (COND
       ((|testBitVector| |pv$| 4)
        (QSETREFV $ 41 (CONS (|dispatchFunction| |ALIST;latex;$S;16|) $))))
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
              (38 . |latex|) (43 . |latex|) (48 . |latex|)
              (|Union| 9 '"failed") |ALIST;assoc;Key$U;17| (53 . |setref|)
              |ALIST;setelt;$Key2Entry;18| (59 . ~=) |ALIST;remove!;Key$U;19|
              (|Equation| 9) (|List| 48) (|Mapping| 9 9 9) (|List| 52)
              (|Equation| 7) (|List| 7) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|InputForm|) (|Mapping| 15 9) (|Mapping| 15 7)
              (|Mapping| 9 9) (|List| $) '"value" '"first" '"rest" '"last"
              (|UniversalSegment| 30) (|Void|) (|Mapping| 15 9 9)
              (|Mapping| 7 7) (|List| 30) (|Mapping| 7 7 7))
           '#(~= 65 |value| 71 |third| 76 |tail| 81 |table| 86 |swap!| 95
              |split!| 109 |sorted?| 115 |sort!| 126 |sort| 137 |smaller?| 148
              |size?| 154 |setvalue!| 160 |setrest!| 166 |setlast!| 172
              |setfirst!| 178 |setelt| 184 |setchildren!| 233 |select!| 239
              |select| 251 |second| 263 |search| 268 |sample| 274 |reverse!|
              278 |reverse| 283 |rest| 288 |removeDuplicates!| 299
              |removeDuplicates| 304 |remove!| 309 |remove| 339 |reduce| 363
              |qsetelt!| 405 |qelt| 419 |possiblyInfinite?| 431 |position| 436
              |parts| 455 |nodes| 470 |node?| 475 |new| 481 |more?| 487
              |minIndex| 493 |min| 503 |merge!| 509 |merge| 522 |members| 535
              |member?| 550 |maxIndex| 568 |max| 578 |map!| 584 |map| 602
              |list| 634 |less?| 639 |leaves| 645 |leaf?| 650 |latex| 655
              |last| 660 |keys| 671 |key?| 676 |inspect| 682 |insert!| 687
              |insert| 707 |indices| 721 |index?| 731 |hashUpdate!| 743 |hash|
              749 |first| 754 |find| 770 |fill!| 782 |extract!| 794
              |explicitlyFinite?| 799 |every?| 804 |eval| 822 |eq?| 900
              |entry?| 906 |entries| 918 |empty?| 928 |empty| 933 |elt| 937
              |distance| 993 |dictionary| 999 |delete!| 1008 |delete| 1020
              |cyclic?| 1032 |cycleTail| 1037 |cycleSplit!| 1042 |cycleLength|
              1047 |cycleEntry| 1052 |count| 1057 |copyInto!| 1093 |copy| 1100
              |convert| 1105 |construct| 1110 |concat!| 1120 |concat| 1132
              |coerce| 1155 |children| 1160 |child?| 1165 |bag| 1171 |assoc|
              1176 |any?| 1182 >= 1200 > 1206 = 1212 <= 1218 < 1224 |#| 1230)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 2 0 0 0
                                  16 5 9 0 0 0 0 0 16 5 8 1 13 2))
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
                                    0 35 1 6 38 0 39 1 7 38 0 40 1 0 38 0 41 2
                                    8 10 0 10 44 2 6 15 0 0 46 2 22 15 0 0 1 1
                                    0 9 0 1 1 0 9 0 1 1 0 0 0 1 1 0 0 10 1 0 0
                                    0 1 3 23 67 0 30 30 1 3 23 67 0 6 6 1 2 23
                                    0 0 30 1 1 2 15 0 1 2 0 15 68 0 1 1 24 0 0
                                    1 2 23 0 68 0 1 1 2 0 0 1 2 0 0 68 0 1 2 2
                                    15 0 0 1 2 0 15 0 21 1 2 23 9 0 9 1 2 23 0
                                    0 0 27 2 23 9 0 9 1 2 23 9 0 9 29 3 23 9 0
                                    62 9 1 3 23 9 0 63 9 1 3 23 0 0 64 0 1 3 23
                                    9 0 65 9 1 3 23 9 0 66 9 1 3 23 9 0 30 9 1
                                    3 0 7 0 6 7 45 2 23 0 0 61 1 2 17 0 58 0 1
                                    2 0 0 58 0 1 2 17 0 58 0 1 2 17 0 58 0 1 1
                                    0 9 0 1 2 0 36 6 0 37 0 0 0 1 1 23 0 0 1 1
                                    0 0 0 1 1 0 0 0 24 2 0 0 0 21 1 1 7 0 0 1 1
                                    21 0 0 1 2 21 0 9 0 1 2 7 0 9 0 1 2 17 0 58
                                    0 1 2 0 0 58 0 1 2 0 36 6 0 47 2 21 0 9 0 1
                                    2 21 0 9 0 1 2 17 0 58 0 1 2 17 0 58 0 1 4
                                    21 9 50 0 9 9 1 4 21 9 50 0 9 9 1 2 17 9 50
                                    0 1 3 17 9 50 0 9 1 2 17 9 50 0 1 3 17 9 50
                                    0 9 1 3 23 9 0 30 9 1 3 23 7 0 6 7 1 2 0 9
                                    0 30 1 2 0 7 0 6 1 1 0 15 0 1 2 7 30 9 0 1
                                    3 7 30 9 0 30 1 2 0 30 58 0 1 1 17 10 0 18
                                    1 17 53 0 1 1 17 10 0 18 1 0 61 0 1 2 7 15
                                    0 0 1 2 0 0 21 9 1 2 0 15 0 21 1 1 10 30 0
                                    32 1 3 6 0 1 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0
                                    68 0 0 1 2 2 0 0 0 1 3 0 0 68 0 0 1 1 17 10
                                    0 1 1 17 53 0 1 1 17 10 0 1 2 21 15 9 0 1 2
                                    21 15 9 0 1 2 19 15 7 0 1 1 10 30 0 34 1 3
                                    6 0 1 2 2 0 0 0 1 2 23 0 60 0 1 2 23 0 69 0
                                    1 2 23 0 60 0 1 2 0 0 60 0 1 3 0 0 50 0 0 1
                                    3 0 0 71 0 0 1 2 0 0 69 0 1 2 0 0 60 0 1 1
                                    0 0 9 1 2 0 15 0 21 1 1 0 10 0 1 1 0 15 0 1
                                    1 14 38 0 41 1 0 9 0 1 2 0 0 0 21 1 1 0 19
                                    0 20 2 0 15 6 0 1 1 0 9 0 1 3 0 0 9 0 30 1
                                    3 0 0 0 0 30 1 2 0 0 9 0 1 3 0 0 0 0 30 1 3
                                    0 0 9 0 30 1 1 0 70 0 1 1 0 19 0 1 2 0 15
                                    30 0 1 2 0 15 6 0 1 2 14 55 55 0 1 1 14 56
                                    0 1 1 3 7 0 1 1 0 9 0 23 2 0 0 0 21 1 2 0
                                    42 58 0 1 2 0 42 58 0 1 2 23 0 0 9 1 2 23 0
                                    0 7 1 1 0 9 0 1 1 0 15 0 1 2 17 15 58 0 1 2
                                    17 15 59 0 1 2 17 15 58 0 1 2 15 0 0 48 1 2
                                    15 0 0 49 1 3 15 0 0 9 9 1 3 15 0 0 10 10 1
                                    3 15 0 0 10 10 1 2 15 0 0 48 1 3 15 0 0 9 9
                                    1 2 15 0 0 49 1 2 5 0 0 51 1 3 5 0 0 7 7 1
                                    2 5 0 0 52 1 3 5 0 0 53 53 1 2 0 15 0 0 1 2
                                    20 15 9 0 1 2 18 15 7 0 1 1 0 10 0 17 1 0
                                    53 0 1 1 0 15 0 16 0 0 0 13 2 0 9 0 62 1 2
                                    0 9 0 63 1 2 0 0 0 64 1 2 0 9 0 65 1 2 0 0
                                    0 66 1 2 0 9 0 30 1 3 0 9 0 30 9 1 2 0 7 0
                                    6 1 3 0 7 0 6 7 1 2 0 30 0 0 1 1 0 0 10 1 0
                                    0 0 12 2 0 0 0 66 1 2 0 0 0 30 1 2 0 0 0 66
                                    1 2 0 0 0 30 1 1 0 15 0 1 1 0 0 0 1 1 23 0
                                    0 1 1 0 21 0 1 1 0 0 0 1 2 21 21 9 0 1 2 21
                                    21 9 0 1 2 19 21 7 0 1 2 17 21 58 0 1 2 17
                                    21 59 0 1 2 17 21 58 0 1 3 23 0 0 0 30 1 1
                                    0 0 0 1 1 1 57 0 1 1 0 0 10 1 1 0 0 10 1 2
                                    0 0 0 0 1 2 0 0 0 9 1 2 0 0 0 0 1 2 0 0 9 0
                                    25 1 0 0 61 1 2 0 0 0 9 1 1 11 54 0 1 1 0
                                    61 0 1 2 7 15 0 0 1 1 0 0 10 1 2 0 42 6 0
                                    43 2 17 15 58 0 1 2 17 15 59 0 1 2 17 15 58
                                    0 1 2 2 15 0 0 1 2 2 15 0 0 1 2 22 15 0 0 1
                                    2 2 15 0 0 1 2 2 15 0 0 1 1 17 21 0 22)))))
           '|lookupComplete|)) 
