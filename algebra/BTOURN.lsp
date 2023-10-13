
(/VERSIONCHECK 2) 

(DEFUN |BTOURN;binaryTournament;L$;1| (|u| $)
  (PROG (#1=#:G130 |x| |tree|)
    (RETURN
     (SEQ
      (COND ((NULL |u|) (SPADCALL (QREFELT $ 8)))
            ('T
             (SEQ
              (LETT |tree| (SPADCALL (|SPADfirst| |u|) (QREFELT $ 9))
                    . #2=(|BTOURN;binaryTournament;L$;1|))
              (SEQ (LETT |x| NIL . #2#) (LETT #1# (CDR |u|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |x| |tree| (QREFELT $ 10))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |tree|)))))))) 

(DEFUN |BTOURN;insert!;S2$;2| (|x| |t| $)
  (SEQ
   (COND ((SPADCALL |t| (QREFELT $ 14)) (SPADCALL |x| (QREFELT $ 9)))
         ((SPADCALL |x| (SPADCALL |t| (QREFELT $ 15)) (QREFELT $ 16))
          (SEQ (SPADCALL |t| (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 18))
               (SPADCALL |t| |x| (QREFELT $ 19))
               (EXIT (SPADCALL |t| (SPADCALL (QREFELT $ 8)) (QREFELT $ 20)))))
         ('T
          (SEQ
           (SPADCALL |t|
                     (SPADCALL |x| (SPADCALL |t| (QREFELT $ 21))
                               (QREFELT $ 10))
                     (QREFELT $ 20))
           (EXIT |t|)))))) 

(DEFUN |BinaryTournament| (#1=#:G140)
  (PROG ()
    (RETURN
     (PROG (#2=#:G141)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|BinaryTournament|)
                                           '|domainEqualList|)
                . #3=(|BinaryTournament|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|BinaryTournament;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|BinaryTournament|))))))))))) 

(DEFUN |BinaryTournament;| (|#1|)
  (PROG (|pv$| #1=#:G138 #2=#:G139 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|BinaryTournament|))
      (LETT |dv$| (LIST '|BinaryTournament| DV$1) . #3#)
      (LETT $ (GETREFV 35) . #3#)
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
      (|haddProp| |$ConstructorCache| '|BinaryTournament| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|BinaryTree| |#1|))
      $)))) 

(MAKEPROP '|BinaryTournament| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|BinaryTree| 6) (|local| |#1|) '|Rep|
              (0 . |empty|) (4 . |binaryTree|) |BTOURN;insert!;S2$;2|
              (|List| 6) |BTOURN;binaryTournament;L$;1| (|Boolean|)
              (9 . |empty?|) (14 . |value|) (19 . >) (25 . |copy|)
              (30 . |setleft!|) (36 . |setvalue!|) (42 . |setright!|)
              (48 . |right|) (|NonNegativeInteger|) (|Equation| 6) (|List| 23)
              (|Mapping| 13 6) '"right" '"left" '"value" (|List| $)
              (|Mapping| 6 6) (|OutputForm|) (|SingleInteger|) (|String|)
              (|Integer|))
           '#(~= 53 |value| 59 |size?| 64 |setvalue!| 70 |setright!| 76
              |setleft!| 82 |setelt| 88 |setchildren!| 109 |sample| 115 |right|
              119 |parts| 124 |nodes| 129 |node?| 134 |node| 140 |more?| 147
              |members| 153 |member?| 158 |map!| 164 |map| 170 |less?| 176
              |left| 182 |leaves| 187 |leaf?| 192 |latex| 197 |insert!| 202
              |hash| 208 |every?| 213 |eval| 219 |eq?| 245 |empty?| 251 |empty|
              256 |elt| 260 |distance| 278 |cyclic?| 284 |count| 289 |copy| 301
              |coerce| 306 |children| 311 |child?| 316 |binaryTournament| 322
              |any?| 327 = 333 |#| 339)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|BinaryTreeCategory&| |BinaryRecursiveAggregate&|
                     |RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|BinaryTreeCategory| 6) (|BinaryRecursiveAggregate| 6)
                      (|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Aggregate|) (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 31))
                   (|makeByteWordVec2| 34
                                       '(0 0 0 8 1 7 0 6 9 1 0 13 0 14 1 0 6 0
                                         15 2 6 13 0 0 16 1 0 0 0 17 2 0 0 0 0
                                         18 2 0 6 0 6 19 2 0 0 0 0 20 1 0 0 0
                                         21 2 1 13 0 0 1 1 0 6 0 15 2 0 13 0 22
                                         1 2 7 6 0 6 19 2 7 0 0 0 20 2 7 0 0 0
                                         18 3 7 0 0 26 0 1 3 7 0 0 27 0 1 3 7 6
                                         0 28 6 1 2 7 0 0 29 1 0 0 0 1 1 0 0 0
                                         21 1 5 11 0 1 1 0 29 0 1 2 1 13 0 0 1
                                         3 0 0 0 6 0 1 2 0 13 0 22 1 1 5 11 0 1
                                         2 6 13 6 0 1 2 7 0 30 0 1 2 0 0 30 0 1
                                         2 0 13 0 22 1 1 0 0 0 1 1 0 11 0 1 1 0
                                         13 0 1 1 1 33 0 1 2 0 0 6 0 10 1 1 32
                                         0 1 2 5 13 25 0 1 3 2 0 0 6 6 1 3 2 0
                                         0 11 11 1 2 2 0 0 23 1 2 2 0 0 24 1 2
                                         0 13 0 0 1 1 0 13 0 14 0 0 0 8 2 0 0 0
                                         26 1 2 0 0 0 27 1 2 0 6 0 28 1 2 0 34
                                         0 0 1 1 0 13 0 1 2 6 22 6 0 1 2 5 22
                                         25 0 1 1 0 0 0 17 1 3 31 0 1 1 0 29 0
                                         1 2 1 13 0 0 1 1 0 0 11 12 2 5 13 25 0
                                         1 2 1 13 0 0 1 1 5 22 0 1)))))
           '|lookupComplete|)) 
