
(/VERSIONCHECK 2) 

(DEFUN |InnerTable| (&REST #1=#:G174)
  (PROG ()
    (RETURN
     (PROG (#2=#:G175)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerTable|)
                                           '|domainEqualList|)
                . #3=(|InnerTable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InnerTable;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|InnerTable|))))))))))) 

(DEFUN |InnerTable;| (|#1| |#2| |#3|)
  (PROG (#1=#:G173 |pv$| #2=#:G171 #3=#:G172 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|InnerTable|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT DV$3 (|devaluate| |#3|) . #4#)
      (LETT |dv$| (LIST '|InnerTable| DV$1 DV$2 DV$3) . #4#)
      (LETT $ (GETREFV 33) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| |#1|)
                                                     (|:| |entry| |#2|))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|Record| (|:| |key| |#1|)
                                                           (|:| |entry| |#2|))
                                                 '(|SetCategory|))
                                                . #4#)
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
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| |#2|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                           #2#)
                                          (OR #2# #3#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #2#
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #3#)))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|InnerTable| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 5 |#3|)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #1# #3# (|augmentPredVector| $ 1024))
      (AND #2# #1# (|augmentPredVector| $ 2048))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|InnerTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#3|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Record| (|:| |key| 6) (|:| |entry| 7))
              (|List| 9) (|Equation| 9) (|List| 11) (|Mapping| 9 9 9)
              (|NonNegativeInteger|) (|Boolean|) (|Equation| 7) (|List| 16)
              (|List| 7) (|OutputForm|) (|String|) (|SingleInteger|)
              (|HashState|) (|InputForm|) (|Mapping| 15 7) (|Mapping| 15 9)
              (|Mapping| 7 7) (|Void|) (|Mapping| 9 9) (|Mapping| 7 7 7)
              (|List| 6) (|Union| 7 '"failed") (|Union| 9 '"failed"))
           '#(~= 0 |table| 6 |swap!| 15 |size?| 22 |setelt| 28 |select!| 35
              |select| 41 |search| 47 |sample| 53 |removeDuplicates| 57
              |remove!| 62 |remove| 80 |reduce| 92 |qsetelt!| 113 |qelt| 120
              |parts| 126 |more?| 136 |minIndex| 142 |members| 147 |member?|
              157 |maxIndex| 169 |map!| 174 |map| 186 |less?| 205 |latex| 211
              |keys| 216 |key?| 221 |inspect| 227 |insert!| 232 |indices| 238
              |index?| 243 |hashUpdate!| 249 |hash| 255 |first| 260 |find| 265
              |fill!| 271 |extract!| 277 |every?| 282 |eval| 294 |eq?| 346
              |entry?| 352 |entries| 358 |empty?| 363 |empty| 368 |elt| 372
              |dictionary| 385 |count| 394 |copy| 418 |convert| 423 |construct|
              428 |coerce| 433 |bag| 438 |any?| 443 = 455 |#| 461)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 0 0 0 0 3 7 8 0 0 0 0 3 1 7 8
                                  9))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |EltableAggregate&| |Aggregate&| |Evalable&| |Evalable&|
                |SetCategory&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 6 7) (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|EltableAggregate| 6 7) (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 23) (|InnerEvalable| 7 7) (|BasicType|)
                 (|CoercibleTo| 19))
              (|makeByteWordVec2| 32
                                  '(2 8 15 0 0 1 1 0 0 10 1 0 0 0 1 3 13 27 0 6
                                    6 1 2 0 15 0 14 1 3 0 7 0 6 7 1 2 10 0 25 0
                                    1 2 10 0 25 0 1 2 0 31 6 0 1 0 0 0 1 1 11 0
                                    0 1 2 10 0 25 0 1 2 10 0 9 0 1 2 0 31 6 0 1
                                    2 11 0 9 0 1 2 10 0 25 0 1 4 11 9 13 0 9 9
                                    1 2 10 9 13 0 1 3 10 9 13 0 9 1 3 13 7 0 6
                                    7 1 2 0 7 0 6 1 1 10 18 0 1 1 10 10 0 1 2 0
                                    15 0 14 1 1 4 6 0 1 1 10 18 0 1 1 10 10 0 1
                                    2 11 15 9 0 1 2 12 15 7 0 1 1 4 6 0 1 2 13
                                    0 26 0 1 2 13 0 28 0 1 3 0 0 29 0 0 1 2 0 0
                                    26 0 1 2 0 0 28 0 1 2 0 15 0 14 1 1 8 20 0
                                    1 1 0 30 0 1 2 0 15 6 0 1 1 0 9 0 1 2 0 0 9
                                    0 1 1 0 30 0 1 2 0 15 6 0 1 2 8 22 22 0 1 1
                                    8 21 0 1 1 4 7 0 1 2 0 32 25 0 1 2 13 0 0 7
                                    1 1 0 9 0 1 2 10 15 24 0 1 2 10 15 25 0 1 3
                                    3 0 0 10 10 1 2 3 0 0 11 1 3 3 0 0 9 9 1 2
                                    3 0 0 12 1 2 7 0 0 16 1 2 7 0 0 17 1 3 7 0
                                    0 18 18 1 3 7 0 0 7 7 1 2 0 15 0 0 1 2 12
                                    15 7 0 1 1 0 18 0 1 1 0 15 0 1 0 0 0 1 2 0
                                    7 0 6 1 3 0 7 0 6 7 1 0 0 0 1 1 0 0 10 1 2
                                    11 14 9 0 1 2 12 14 7 0 1 2 10 14 24 0 1 2
                                    10 14 25 0 1 1 0 0 0 1 1 1 23 0 1 1 0 0 10
                                    1 1 5 19 0 1 1 0 0 10 1 2 10 15 24 0 1 2 10
                                    15 25 0 1 2 8 15 0 0 1 1 10 14 0 1)))))
           '|lookupComplete|)) 
