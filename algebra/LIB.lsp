
(/VERSIONCHECK 2) 

(DEFUN |LIB;library;Fn$;1| (|f| $) (SPADCALL |f| (QREFELT $ 8))) 

(DEFUN |LIB;elt;$SA;2| (|f| |v| $)
  (SPADCALL |f| (SPADCALL |v| (QREFELT $ 12)) (QREFELT $ 14))) 

(DEFUN |LIB;setelt;$S2A;3| (|f| |v| |val| $)
  (SPADCALL |f| (SPADCALL |v| (QREFELT $ 12)) |val| (QREFELT $ 16))) 

(DEFUN |Library| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G174)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Library|) . #2=(|Library|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Library|
                         (LIST (CONS NIL (CONS 1 (|Library;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Library|))))))))))) 

(DEFUN |Library;| ()
  (PROG (|dv$| $ #1=#:G171 #2=#:G170 |pv$| #3=#:G172)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Library|) . #4=(|Library|))
      (LETT $ (GETREFV 41) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| (|String|))
                                                     (|:| |entry| (|Any|)))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|Record|
                                                  (|:| |key| (|String|))
                                                  (|:| |entry| (|Any|)))
                                                 '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| (|Any|)))
                                            '(|Evalable|
                                              (|Record| (|:| |key| (|String|))
                                                        (|:| |entry|
                                                             (|Any|)))))
                                           #1#)
                                          (|HasCategory| (|String|)
                                                         '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| (|Any|)
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| (|Any|)))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (LETT #2#
                                                (|HasCategory| (|Any|)
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| (|Any|)
                                                          '(|Evalable|
                                                            (|Any|)))
                                           #2#)
                                          (OR #2# #1#)
                                          (OR
                                           (|HasCategory| (|Any|)
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #2#
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| (|Any|)))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #1#)))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|Library| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #3# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #3# #1# (|augmentPredVector| $ 1024))
      (AND #3# #2# (|augmentPredVector| $ 2048))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|KeyedAccessFile| (|Any|)))
      $)))) 

(MAKEPROP '|Library| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|KeyedAccessFile| 13) '|Rep| (|FileName|)
              (0 . |open|) |LIB;library;Fn$;1| (|String|) (|Symbol|)
              (5 . |string|) (|Any|) (10 . |elt|) |LIB;elt;$SA;2|
              (16 . |setelt|) |LIB;setelt;$S2A;3| (|List| 19) (|Equation| 13)
              (|List| 13) (|Record| (|:| |key| 10) (|:| |entry| 13))
              (|List| 21) (|Equation| 21) (|List| 23) (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 21 21 21) (|OutputForm|)
              (|HashState|) (|SingleInteger|) (|InputForm|) (|Mapping| 25 13)
              (|Mapping| 25 21) (|Mapping| 13 13) (|Void|) (|Mapping| 21 21)
              (|Mapping| 13 13 13) (|List| 10) (|Union| 13 '"failed")
              (|Union| 21 '"failed"))
           '#(~= 23 |table| 29 |swap!| 38 |size?| 45 |setelt| 51 |select!| 65
              |select| 71 |search| 77 |sample| 83 |removeDuplicates| 87
              |remove!| 92 |remove| 110 |reduce| 122 |qsetelt!| 143 |qelt| 150
              |parts| 156 |pack!| 166 |more?| 171 |minIndex| 177 |members| 182
              |member?| 192 |maxIndex| 204 |map!| 209 |map| 221 |library| 240
              |less?| 245 |latex| 251 |keys| 256 |key?| 261 |inspect| 267
              |insert!| 272 |indices| 278 |index?| 283 |hashUpdate!| 289 |hash|
              295 |first| 300 |find| 305 |fill!| 311 |extract!| 317 |every?|
              322 |eval| 334 |eq?| 386 |entry?| 392 |entries| 398 |empty?| 403
              |empty| 408 |elt| 412 |dictionary| 431 |count| 440 |copy| 464
              |convert| 469 |construct| 474 |coerce| 479 |close!| 484 |bag| 489
              |any?| 494 = 506 |#| 512)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 0 0 0 0 3 7 8 0 0 0 3 1 7 8 9))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |EltableAggregate&| |Aggregate&| |Evalable&| |Evalable&|
                |SetCategory&| NIL NIL NIL |InnerEvalable&| NIL
                |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 10 13) (|KeyedDictionary| 10 13)
                 (|Dictionary| 21) (|DictionaryOperations| 21)
                 (|BagAggregate| 21) (|IndexedAggregate| 10 13)
                 (|Collection| 21) (|HomogeneousAggregate| 13)
                 (|HomogeneousAggregate| 21) (|EltableAggregate| 10 13)
                 (|Aggregate|) (|Evalable| 21) (|Evalable| 13) (|SetCategory|)
                 (|Eltable| 10 13) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| 21 21) (|ConvertibleTo| 31)
                 (|InnerEvalable| 13 13) (|BasicType|) (|CoercibleTo| 28))
              (|makeByteWordVec2| 40
                                  '(1 6 0 7 8 1 11 10 0 12 2 0 13 0 10 14 3 0
                                    13 0 10 13 16 2 8 25 0 0 1 1 0 0 22 1 0 0 0
                                    1 3 13 35 0 10 10 1 2 0 25 0 26 1 3 0 13 0
                                    11 13 17 3 0 13 0 10 13 16 2 10 0 33 0 1 2
                                    10 0 33 0 1 2 0 39 10 0 1 0 0 0 1 1 11 0 0
                                    1 2 10 0 21 0 1 2 10 0 33 0 1 2 0 39 10 0 1
                                    2 11 0 21 0 1 2 10 0 33 0 1 4 11 21 27 0 21
                                    21 1 2 10 21 27 0 1 3 10 21 27 0 21 1 3 13
                                    13 0 10 13 1 2 0 13 0 10 1 1 10 20 0 1 1 10
                                    22 0 1 1 0 0 0 1 2 0 25 0 26 1 1 4 10 0 1 1
                                    10 20 0 1 1 10 22 0 1 2 12 25 13 0 1 2 11
                                    25 21 0 1 1 4 10 0 1 2 13 0 34 0 1 2 13 0
                                    36 0 1 3 0 0 37 0 0 1 2 0 0 34 0 1 2 0 0 36
                                    0 1 1 0 0 7 9 2 0 25 0 26 1 1 8 10 0 1 1 0
                                    38 0 1 2 0 25 10 0 1 1 0 21 0 1 2 0 0 21 0
                                    1 1 0 38 0 1 2 0 25 10 0 1 2 8 29 29 0 1 1
                                    8 30 0 1 1 4 13 0 1 2 0 40 33 0 1 2 13 0 0
                                    13 1 1 0 21 0 1 2 10 25 32 0 1 2 10 25 33 0
                                    1 2 7 0 0 18 1 3 7 0 0 13 13 1 2 7 0 0 19 1
                                    3 7 0 0 20 20 1 3 3 0 0 21 21 1 3 3 0 0 22
                                    22 1 2 3 0 0 23 1 2 3 0 0 24 1 2 0 25 0 0 1
                                    2 12 25 13 0 1 1 0 20 0 1 1 0 25 0 1 0 0 0
                                    1 2 0 13 0 11 15 2 0 13 0 10 14 3 0 13 0 10
                                    13 1 0 0 0 1 1 0 0 22 1 2 12 26 13 0 1 2 11
                                    26 21 0 1 2 10 26 32 0 1 2 10 26 33 0 1 1 0
                                    0 0 1 1 1 31 0 1 1 0 0 22 1 1 5 28 0 1 1 0
                                    0 0 1 1 0 0 22 1 2 10 25 32 0 1 2 10 25 33
                                    0 1 2 8 25 0 0 1 1 10 26 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Library| 'NILADIC T) 
