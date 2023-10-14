
(/VERSIONCHECK 2) 

(DEFUN |RESULT;cleanUpDomainForm| (|d| $)
  (PROG (#1=#:G138 |u| #2=#:G137)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |d| (QREFELT $ 15))) (SPADCALL |d| (QREFELT $ 16)))
       (#3='T
        (COND
         ((EQL (SPADCALL |d| (QREFELT $ 18)) 1)
          (SPADCALL (SPADCALL |d| (QREFELT $ 19)) (QREFELT $ 16)))
         ((NULL (SPADCALL (SPADCALL |d| (QREFELT $ 19)) (QREFELT $ 20)))
          (QREFELT $ 10))
         (#3#
          (SPADCALL (SPADCALL (SPADCALL |d| (QREFELT $ 19)) (QREFELT $ 16))
                    (PROGN
                     (LETT #2# NIL . #4=(|RESULT;cleanUpDomainForm|))
                     (SEQ (LETT |u| NIL . #4#)
                          (LETT #1#
                                (SPADCALL (SPADCALL |d| (QREFELT $ 21))
                                          (QREFELT $ 23))
                                . #4#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |u| (CAR #1#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (|RESULT;cleanUpDomainForm| |u| $) #2#)
                                  . #4#)))
                          (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 24)))))))))) 

(DEFUN |RESULT;display| (|v| |d| $)
  (COND
   ((NULL (SPADCALL |d| (QREFELT $ 15))) (|error| "Domain form is non-list"))
   ('T
    (COND
     ((OR (EQL (SPADCALL |d| (QREFELT $ 18)) 1)
          (SPADCALL (SPADCALL |d| (QREFELT $ 19))
                    (SPADCALL '|Complex| (QREFELT $ 27)) (QREFELT $ 28)))
      (COND ((QREFELT $ 11) (SPADCALL |v| (QREFELT $ 26)))
            (#1='T (|RESULT;cleanUpDomainForm| |d| $))))
     ((QREFELT $ 12) (SPADCALL |v| (QREFELT $ 26)))
     (#1# (|RESULT;cleanUpDomainForm| |d| $)))))) 

(DEFUN |RESULT;makeEntry| (|k| |v| $)
  (SPADCALL
   (LIST (SPADCALL |k| (QREFELT $ 8)) (QREFELT $ 9)
         (|RESULT;display| |v| (SPADCALL |v| (QREFELT $ 29)) $))
   (QREFELT $ 30))) 

(DEFUN |RESULT;coerce;$Of;4| (|r| $)
  (PROG (#1=#:G147 |key| #2=#:G146)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|RESULT;coerce;$Of;4|))
        (SEQ (LETT |key| NIL . #3#)
             (LETT #1# (NREVERSE (SPADCALL |r| (QREFELT $ 32))) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |key| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (|RESULT;makeEntry| |key|
                       (SPADCALL |r| |key| (QREFELT $ 33)) $)
                      #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 34)))))) 

(DEFUN |RESULT;showArrayValues;2B;5| (|b| $) (SETELT $ 12 |b|)) 

(DEFUN |RESULT;showScalarValues;2B;6| (|b| $) (SETELT $ 11 |b|)) 

(DEFUN |Result| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G196)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Result|) . #2=(|Result|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Result|
                         (LIST (CONS NIL (CONS 1 (|Result;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Result|))))))))))) 

(DEFUN |Result;| ()
  (PROG (|dv$| $ #1=#:G193 #2=#:G192 |pv$| #3=#:G194)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Result|) . #4=(|Result|))
      (LETT $ (GETREFV 59) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| (|Symbol|))
                                                     (|:| |entry| (|Any|)))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|Record|
                                                  (|:| |key| (|Symbol|))
                                                  (|:| |entry| (|Any|)))
                                                 '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|Symbol|))
                                                      (|:| |entry| (|Any|)))
                                            '(|Evalable|
                                              (|Record| (|:| |key| (|Symbol|))
                                                        (|:| |entry|
                                                             (|Any|)))))
                                           #1#)
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
                                            (|Record| (|:| |key| (|Symbol|))
                                                      (|:| |entry| (|Any|)))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #1#)))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|Result| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #3# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #3# #1# (|augmentPredVector| $ 1024))
      (AND #3# #2# (|augmentPredVector| $ 2048))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL '|: | (QREFELT $ 8)))
      (QSETREFV $ 10 (SPADCALL '|...| (QREFELT $ 8)))
      (QSETREFV $ 11 'NIL)
      (QSETREFV $ 12 'NIL)
      $)))) 

(MAKEPROP '|Result| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Table| 7 25) (|OutputForm|) (|Symbol|)
              (0 . |coerce|) '|colon| '|elide| '|showScalarValuesFlag|
              '|showArrayValuesFlag| (|Boolean|) (|SExpression|) (5 . |list?|)
              (10 . |coerce|) (|Integer|) (15 . |#|) (20 . |car|)
              (25 . |atom?|) (30 . |cdr|) (|List| $) (35 . |destruct|)
              (40 . |prefix|) (|Any|) (46 . |objectOf|) (51 . |convert|)
              (56 . =) (62 . |dom|) (67 . |hconcat|) (|List| 7) (72 . |keys|)
              (77 . |elt|) (83 . |bracket|) |RESULT;coerce;$Of;4|
              |RESULT;showArrayValues;2B;5| |RESULT;showScalarValues;2B;6|
              (|Equation| 25) (|List| 38) (|List| 25)
              (|Record| (|:| |key| 7) (|:| |entry| 25)) (|List| 41)
              (|Equation| 41) (|List| 43) (|NonNegativeInteger|)
              (|Mapping| 41 41 41) (|String|) (|SingleInteger|) (|HashState|)
              (|InputForm|) (|Mapping| 13 25) (|Mapping| 13 41)
              (|Mapping| 25 25) (|Void|) (|Mapping| 41 41) (|Mapping| 25 25 25)
              (|Union| 25 '"failed") (|Union| 41 '"failed"))
           '#(|showScalarValues| 88 |showArrayValues| 93 |keys| 98 |elt| 103
              |coerce| 109)
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
              '#((|TableAggregate| 7 25) (|KeyedDictionary| 7 25)
                 (|Dictionary| 41) (|DictionaryOperations| 41)
                 (|BagAggregate| 41) (|IndexedAggregate| 7 25)
                 (|Collection| 41) (|HomogeneousAggregate| 25)
                 (|HomogeneousAggregate| 41) (|EltableAggregate| 7 25)
                 (|Aggregate|) (|Evalable| 41) (|Evalable| 25) (|SetCategory|)
                 (|finiteAggregate|) (|Eltable| 7 25) (|Type|)
                 (|shallowlyMutable|) (|InnerEvalable| 41 41)
                 (|ConvertibleTo| 50) (|InnerEvalable| 25 25) (|BasicType|)
                 (|CoercibleTo| 6))
              (|makeByteWordVec2| 37
                                  '(1 7 6 0 8 1 14 13 0 15 1 14 6 0 16 1 14 17
                                    0 18 1 14 0 0 19 1 14 13 0 20 1 14 0 0 21 1
                                    14 22 0 23 2 6 0 0 22 24 1 25 6 0 26 1 14 0
                                    7 27 2 14 13 0 0 28 1 25 14 0 29 1 6 0 22
                                    30 1 0 31 0 32 2 0 25 0 7 33 1 6 0 22 34 1
                                    0 13 13 37 1 0 13 13 36 1 0 31 0 32 2 0 25
                                    0 7 33 1 5 6 0 35)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|Result| 'NILADIC T) 
