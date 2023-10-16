
(SDEFUN |BTREE;=;2$B;1| ((|t1| $) (|t2| $) ($ |Boolean|))
        (SPADCALL |t1| |t2| (QREFELT $ 9))) 

(PUT '|BTREE;empty;$;2| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |BTREE;empty;$;2| (($ $)) NIL) 

(SDEFUN |BTREE;node;$S2$;3| ((|l| $) (|v| S) (|r| $) ($ $))
        (CONS (SPADCALL |v| |l| (QREFELT $ 14)) |r|)) 

(SDEFUN |BTREE;binaryTree;$S2$;4| ((|l| $) (|v| S) (|r| $) ($ $))
        (SPADCALL |l| |v| |r| (QREFELT $ 15))) 

(SDEFUN |BTREE;binaryTree;S$;5| ((|v| S) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 11)) |v| (SPADCALL (QREFELT $ 11))
                  (QREFELT $ 15))) 

(PUT '|BTREE;empty?;$B;6| '|SPADreplace| 'NULL) 

(SDEFUN |BTREE;empty?;$B;6| ((|t| $) ($ |Boolean|)) (NULL |t|)) 

(SDEFUN |BTREE;right;2$;7| ((|t| $) ($ $))
        (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no right"))
              ('T (CDR |t|)))) 

(SDEFUN |BTREE;left;2$;8| ((|t| $) ($ $))
        (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no left"))
              ('T (SPADCALL (|SPADfirst| |t|) (QREFELT $ 20))))) 

(SDEFUN |BTREE;value;$S;9| ((|t| $) ($ S))
        (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no value"))
              ('T (SPADCALL (|SPADfirst| |t|) (QREFELT $ 22))))) 

(SDEFUN |BTREE;setvalue!;$2S;10| ((|t| $) (|nd| S) ($ S))
        (SEQ
         (COND
          ((SPADCALL |t| (QREFELT $ 18))
           (|error| "binaryTree:no value to set"))
          ('T
           (SEQ (SPADCALL (|SPADfirst| |t|) |nd| (QREFELT $ 24))
                (EXIT |nd|)))))) 

(SDEFUN |BTREE;setleft!;3$;11| ((|t1| $) (|t2| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |t1| (QREFELT $ 18))
           (|error| "binaryTree:no left to set"))
          ('T
           (SEQ (SPADCALL (|SPADfirst| |t1|) |t2| (QREFELT $ 26))
                (EXIT |t1|)))))) 

(SDEFUN |BTREE;setright!;3$;12| ((|t1| $) (|t2| $) ($ $))
        (COND
         ((SPADCALL |t1| (QREFELT $ 18))
          (|error| "binaryTree:no right to set"))
         ('T (SPADCALL |t1| |t2| (QREFELT $ 28))))) 

(DECLAIM (NOTINLINE |BinaryTree;|)) 

(DEFUN |BinaryTree| (#1=#:G135)
  (SPROG NIL
         (PROG (#2=#:G136)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BinaryTree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|BinaryTree;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|BinaryTree|)))))))))) 

(DEFUN |BinaryTree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G132 NIL) (#2=#:G133 NIL) (#3=#:G134 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|BinaryTree| DV$1))
    (LETT $ (GETREFV 44))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))))
    (|haddProp| |$ConstructorCache| '|BinaryTree| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 64))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 128))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 256))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 512))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|List| (|Tree| |#1|)))
    $))) 

(MAKEPROP '|BinaryTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|) (0 . =)
              |BTREE;=;2$B;1| |BTREE;empty;$;2| (|List| $) (|Tree| 6)
              (6 . |tree|) |BTREE;node;$S2$;3| |BTREE;binaryTree;$S2$;4|
              |BTREE;binaryTree;S$;5| |BTREE;empty?;$B;6| |BTREE;right;2$;7|
              (12 . |children|) |BTREE;left;2$;8| (17 . |value|)
              |BTREE;value;$S;9| (22 . |setvalue!|) |BTREE;setvalue!;$2S;10|
              (28 . |setchildren!|) |BTREE;setleft!;3$;11| (34 . |setrest!|)
              |BTREE;setright!;3$;12| (|NonNegativeInteger|) (|List| 6)
              (|Equation| 6) (|List| 32) (|Mapping| 8 6) '"right" '"left"
              '"value" (|Mapping| 6 6) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|Integer|))
           '#(~= 40 |value| 46 |size?| 51 |setvalue!| 57 |setright!| 63
              |setleft!| 69 |setelt!| 75 |setchildren!| 96 |sample| 102 |right|
              106 |parts| 111 |nodes| 116 |node?| 121 |node| 127 |more?| 134
              |members| 140 |member?| 145 |map!| 151 |map| 157 |less?| 163
              |left| 169 |leaves| 174 |leaf?| 179 |latex| 184 |hashUpdate!| 189
              |hash| 195 |every?| 200 |eval| 206 |eq?| 232 |empty?| 238 |empty|
              243 |elt| 247 |distance| 265 |cyclic?| 271 |count| 276 |copy| 288
              |coerce| 293 |children| 298 |child?| 303 |binaryTree| 309 |any?|
              321 = 327 |#| 333)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 0 2 1 0 0 0 2 4 6))
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
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 39))
                   (|makeByteWordVec2| 43
                                       '(2 7 8 0 0 9 2 13 0 6 12 14 1 13 12 0
                                         20 1 13 6 0 22 2 13 6 0 6 24 2 13 0 0
                                         12 26 2 7 0 0 0 28 2 9 8 0 0 1 1 0 6 0
                                         23 2 0 8 0 30 1 2 10 6 0 6 25 2 10 0 0
                                         0 29 2 10 0 0 0 27 3 10 0 0 35 0 1 3
                                         10 0 0 36 0 1 3 10 6 0 37 6 1 2 10 0 0
                                         12 1 0 0 0 1 1 0 0 0 19 1 7 31 0 1 1 0
                                         12 0 1 2 3 8 0 0 1 3 0 0 0 6 0 15 2 0
                                         8 0 30 1 1 7 31 0 1 2 8 8 6 0 1 2 10 0
                                         38 0 1 2 0 0 38 0 1 2 0 8 0 30 1 1 0 0
                                         0 21 1 0 31 0 1 1 0 8 0 1 1 1 42 0 1 2
                                         1 40 40 0 1 1 1 41 0 1 2 7 8 34 0 1 3
                                         2 0 0 6 6 1 3 2 0 0 31 31 1 2 2 0 0 32
                                         1 2 2 0 0 33 1 2 0 8 0 0 1 1 0 8 0 18
                                         0 0 0 11 2 0 0 0 35 1 2 0 0 0 36 1 2 0
                                         6 0 37 1 2 0 43 0 0 1 1 0 8 0 1 2 8 30
                                         6 0 1 2 7 30 34 0 1 1 0 0 0 1 1 5 39 0
                                         1 1 0 12 0 1 2 3 8 0 0 1 3 0 0 0 6 0
                                         16 1 0 0 6 17 2 7 8 34 0 1 2 9 8 0 0
                                         10 1 7 30 0 1)))))
           '|lookupComplete|)) 
