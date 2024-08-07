
(SDEFUN |RESULT;cleanUpDomainForm| ((|d| (|SExpression|)) (% (|OutputForm|)))
        (SPROG ((#1=#:G14 NIL) (|u| NIL) (#2=#:G13 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |d| (QREFELT % 15)))
                  (SPADCALL |d| (QREFELT % 16)))
                 (#3='T
                  (COND
                   ((EQL (SPADCALL |d| (QREFELT % 18)) 1)
                    (SPADCALL (SPADCALL |d| (QREFELT % 19)) (QREFELT % 16)))
                   ((NULL
                     (SPADCALL (SPADCALL |d| (QREFELT % 19)) (QREFELT % 20)))
                    (QREFELT % 10))
                   (#3#
                    (SPADCALL
                     (SPADCALL (SPADCALL |d| (QREFELT % 19)) (QREFELT % 16))
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |u| NIL)
                           (LETT #1#
                                 (SPADCALL (SPADCALL |d| (QREFELT % 21))
                                           (QREFELT % 23)))
                           G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (|RESULT;cleanUpDomainForm| |u| %)
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 24))))))))) 

(SDEFUN |RESULT;display|
        ((|v| (|Any|)) (|d| (|SExpression|)) (% (|OutputForm|)))
        (COND
         ((NULL (SPADCALL |d| (QREFELT % 15)))
          (|error| "Domain form is non-list"))
         ('T
          (COND
           ((OR (EQL (SPADCALL |d| (QREFELT % 18)) 1)
                (SPADCALL (SPADCALL |d| (QREFELT % 19))
                          (SPADCALL '|Complex| (QREFELT % 27)) (QREFELT % 28)))
            (COND ((QREFELT % 11) (SPADCALL |v| (QREFELT % 26)))
                  (#1='T (|RESULT;cleanUpDomainForm| |d| %))))
           ((QREFELT % 12) (SPADCALL |v| (QREFELT % 26)))
           (#1# (|RESULT;cleanUpDomainForm| |d| %)))))) 

(SDEFUN |RESULT;makeEntry| ((|k| (|Symbol|)) (|v| (|Any|)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL |k| (QREFELT % 8)) (QREFELT % 9)
               (|RESULT;display| |v| (SPADCALL |v| (QREFELT % 29)) %))
         (QREFELT % 30))) 

(SDEFUN |RESULT;coerce;%Of;4| ((|r| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G24 NIL) (|key| NIL) (#2=#:G23 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |key| NIL)
                       (LETT #1# (NREVERSE (SPADCALL |r| (QREFELT % 32)))) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |key| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|RESULT;makeEntry| |key|
                                 (SPADCALL |r| |key| (QREFELT % 33)) %)
                                #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 34))))) 

(SDEFUN |RESULT;showArrayValues;2B;5| ((|b| (|Boolean|)) (% (|Boolean|)))
        (SETELT % 12 |b|)) 

(SDEFUN |RESULT;showScalarValues;2B;6| ((|b| (|Boolean|)) (% (|Boolean|)))
        (SETELT % 11 |b|)) 

(DECLAIM (NOTINLINE |Result;|)) 

(DEFUN |Result| ()
  (SPROG NIL
         (PROG (#1=#:G85)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Result|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Result|
                             (LIST (CONS NIL (CONS 1 (|Result;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Result|)))))))))) 

(DEFUN |Result;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G81 NIL) (#2=#:G80 NIL) (|pv$| NIL)
    (#3=#:G82 NIL) (#4=#:G83 NIL))
   (PROGN
    (LETT |dv$| '(|Result|))
    (LETT % (GETREFV 59))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry| (|Any|)))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry| (|Any|)))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|Symbol|))
                                                   (|:| |entry| (|Any|)))
                                         '(|BasicType|))
                                        (|HasCategory| (|Symbol|)
                                                       '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| (|Any|)
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry| (|Any|)))
                                          '(|CoercibleTo| (|OutputForm|))))
                                        (|HasCategory| (|Any|) '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Any|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Any|)
                                                        '(|Evalable| (|Any|)))
                                         #1#)
                                        (LETT #2#
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|Symbol|))
                                                         (|:| |entry| (|Any|)))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry| (|Any|)))
                                          '(|Evalable|
                                            (|Record| (|:| |key| (|Symbol|))
                                                      (|:| |entry| (|Any|)))))
                                         #2#)
                                        (OR
                                         (|HasCategory| (|Any|) '(|BasicType|))
                                         #1#
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry| (|Any|)))
                                          '(|BasicType|))
                                         #2#)
                                        (OR #1# #2#)
                                        (OR
                                         (|HasCategory| (|Any|)
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #1#
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|Symbol|))
                                                    (|:| |entry| (|Any|)))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #2#)
                                        (|HasCategory| (|Any|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|Result| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (LETT #3# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 16384))
    (AND #3#
         (|HasCategory| (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|Any|)))
                        '(|OrderedSet|))
         (|augmentPredVector| % 32768))
    (AND #3#
         (|HasCategory| (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|Any|)))
                        '(|BasicType|))
         (|augmentPredVector| % 65536))
    (AND
     (LETT #4#
           (AND (|HasCategory| % '(|finiteAggregate|))
                (|HasCategory| (|Any|) '(|BasicType|))))
     (|augmentPredVector| % 131072))
    (AND
     (OR #4#
         (AND #3#
              (|HasCategory|
               (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|Any|)))
               '(|BasicType|)))
         #1# #2#)
     (|augmentPredVector| % 262144))
    (AND #3# (|HasCategory| (|Any|) '(|OrderedSet|))
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (SPADCALL '|: | (QREFELT % 8)))
    (QSETREFV % 10 (SPADCALL '|...| (QREFELT % 8)))
    (QSETREFV % 11 NIL)
    (QSETREFV % 12 NIL)
    %))) 

(MAKEPROP '|Result| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Table| 7 25) (|OutputForm|) (|Symbol|)
              (0 . |coerce|) '|colon| '|elide| '|showScalarValuesFlag|
              '|showArrayValuesFlag| (|Boolean|) (|SExpression|) (5 . |list?|)
              (10 . |coerce|) (|Integer|) (15 . |#|) (20 . |car|)
              (25 . |atom?|) (30 . |cdr|) (|List| %) (35 . |destruct|)
              (40 . |prefix|) (|Any|) (46 . |objectOf|) (51 . |convert|)
              (56 . =) (62 . |dom|) (67 . |hconcat|) (|List| 7) (72 . |keys|)
              (77 . |elt|) (83 . |bracket|) |RESULT;coerce;%Of;4|
              |RESULT;showArrayValues;2B;5| |RESULT;showScalarValues;2B;6|
              (|NonNegativeInteger|) (|Record| (|:| |key| 7) (|:| |entry| 25))
              (|Mapping| 39 39) (|Union| 39 '"failed") (|Mapping| 13 39)
              (|List| 39) (|Union| 25 '"failed") (|List| 25) (|Mapping| 25 25)
              (|Mapping| 25 25 25) (|Mapping| 39 39 39) (|Equation| 25)
              (|List| 49) (|List| 52) (|Equation| 39) (|String|)
              (|Mapping| 13 39 39) (|Mapping| 13 25 25) (|Mapping| 13 25)
              (|Void|) (|InputForm|))
           '#(|showScalarValues| 88 |showArrayValues| 93 |keys| 98 |elt| 103
              |coerce| 109)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 12 8 10 0 0 13 11 8 1 10 0
                                  0 0 0))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |SetCategory&| |Evalable&| |Evalable&| |Aggregate&|
                |EltableAggregate&| NIL |BasicType&| |InnerEvalable&| NIL
                |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|TableAggregate| 7 25) (|KeyedDictionary| 7 25)
                 (|Dictionary| 39) (|DictionaryOperations| 39)
                 (|BagAggregate| 39) (|IndexedAggregate| 7 25)
                 (|Collection| 39) (|HomogeneousAggregate| 25)
                 (|HomogeneousAggregate| 39) (|SetCategory|) (|Evalable| 25)
                 (|Evalable| 39) (|Aggregate|) (|EltableAggregate| 7 25)
                 (|CoercibleTo| 6) (|BasicType|) (|InnerEvalable| 25 25)
                 (|ConvertibleTo| 58) (|InnerEvalable| 39 39)
                 (|shallowlyMutable|) (|Type|) (|Eltable| 7 25)
                 (|finiteAggregate|))
              (|makeByteWordVec2| 37
                                  '(1 7 6 0 8 1 14 13 0 15 1 14 6 0 16 1 14 17
                                    0 18 1 14 0 0 19 1 14 13 0 20 1 14 0 0 21 1
                                    14 22 0 23 2 6 0 0 22 24 1 25 6 0 26 1 14 0
                                    7 27 2 14 13 0 0 28 1 25 14 0 29 1 6 0 22
                                    30 1 0 31 0 32 2 0 25 0 7 33 1 6 0 22 34 1
                                    0 13 13 37 1 0 13 13 36 1 0 31 0 32 2 0 25
                                    0 7 33 1 5 6 0 35)))))
           '|lookupIncomplete|)) 
