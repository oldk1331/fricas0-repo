
(SDEFUN |BSTREE;binarySearchTree;L%;1| ((|u| (|List| S)) (% (%)))
        (SPROG ((#1=#:G10 NIL) (|x| NIL) (|tree| (%)))
               (SEQ
                (COND ((NULL |u|) (SPADCALL (QREFELT % 8)))
                      ('T
                       (SEQ
                        (LETT |tree|
                              (SPADCALL (|SPADfirst| |u|) (QREFELT % 9)))
                        (SEQ (LETT |x| NIL) (LETT #1# (CDR |u|)) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |x| |tree| (QREFELT % 10))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |tree|))))))) 

(SDEFUN |BSTREE;insert!;S2%;2| ((|x| (S)) (|t| (%)) (% (%)))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT % 14)) (SPADCALL |x| (QREFELT % 9)))
               ((SPADCALL |x| (SPADCALL |t| (QREFELT % 15)) (QREFELT % 16))
                (SEQ
                 (SPADCALL |t|
                           (SPADCALL |x| (SPADCALL |t| (QREFELT % 17))
                                     (QREFELT % 10))
                           (QREFELT % 18))
                 (EXIT |t|)))
               ('T
                (SEQ
                 (SPADCALL |t|
                           (SPADCALL |x| (SPADCALL |t| (QREFELT % 19))
                                     (QREFELT % 10))
                           (QREFELT % 20))
                 (EXIT |t|)))))) 

(SDEFUN |BSTREE;split;S%R;3|
        ((|x| (S)) (|t| (%)) (% (|Record| (|:| |less| %) (|:| |greater| %))))
        (SPROG ((|a| (|Record| (|:| |less| %) (|:| |greater| %))))
               (SEQ
                (COND
                 ((SPADCALL |t| (QREFELT % 14))
                  (CONS (SPADCALL (QREFELT % 8)) (SPADCALL (QREFELT % 8))))
                 ((SPADCALL |x| (SPADCALL |t| (QREFELT % 15)) (QREFELT % 21))
                  (SEQ
                   (LETT |a|
                         (SPADCALL |x| (SPADCALL |t| (QREFELT % 17))
                                   (QREFELT % 23)))
                   (EXIT
                    (CONS
                     (SPADCALL (SPADCALL |t| (QREFELT % 19))
                               (SPADCALL |t| (QREFELT % 15)) (QCAR |a|)
                               (QREFELT % 24))
                     (QCDR |a|)))))
                 ('T
                  (SEQ
                   (LETT |a|
                         (SPADCALL |x| (SPADCALL |t| (QREFELT % 19))
                                   (QREFELT % 23)))
                   (EXIT
                    (CONS (QCAR |a|)
                          (SPADCALL (QCDR |a|) (SPADCALL |t| (QREFELT % 15))
                                    (SPADCALL |t| (QREFELT % 17))
                                    (QREFELT % 24)))))))))) 

(SDEFUN |BSTREE;insertRoot!;S2%;4| ((|x| (S)) (|t| (%)) (% (%)))
        (SPROG ((|a| (|Record| (|:| |less| %) (|:| |greater| %))))
               (SEQ (LETT |a| (SPADCALL |x| |t| (QREFELT % 23)))
                    (EXIT
                     (SPADCALL (QCAR |a|) |x| (QCDR |a|) (QREFELT % 24)))))) 

(DECLAIM (NOTINLINE |BinarySearchTree;|)) 

(DEFUN |BinarySearchTree| (#1=#:G31)
  (SPROG NIL
         (PROG (#2=#:G32)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BinarySearchTree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|BinarySearchTree;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BinarySearchTree|)))))))))) 

(DEFUN |BinarySearchTree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G28 NIL) (#2=#:G29 NIL) (#3=#:G30 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|BinarySearchTree| DV$1))
    (LETT % (GETREFV 41))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            #3#)
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
    (|haddProp| |$ConstructorCache| '|BinarySearchTree| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 256))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 512))
    (AND #2# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1024))
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 2048))
    (AND
     (OR (AND #2# (|HasCategory| % '(|finiteAggregate|)))
         (|HasCategory| |#1| '(|Hashable|)) #3#)
     (|augmentPredVector| % 4096))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|BinaryTree| |#1|))
    %))) 

(MAKEPROP '|BinarySearchTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|BinaryTree| 6) (|local| |#1|) '|Rep|
              (0 . |empty|) (4 . |binaryTree|) |BSTREE;insert!;S2%;2|
              (|List| 6) |BSTREE;binarySearchTree;L%;1| (|Boolean|)
              (9 . |empty?|) (14 . |value|) (19 . >=) (25 . |right|)
              (30 . |setright!|) (36 . |left|) (41 . |setleft!|) (47 . >)
              (|Record| (|:| |less| %) (|:| |greater| %)) |BSTREE;split;S%R;3|
              (53 . |node|) |BSTREE;insertRoot!;S2%;4| (|NonNegativeInteger|)
              (|Mapping| 6 6) (|List| %) '"value" (|Integer|) '"left" '"right"
              (|List| 34) (|Equation| 6) (|Mapping| 13 6) (|Mapping| 13 6 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|))
           '#(~= 60 |value| 66 |split| 71 |size?| 77 |setvalue!| 83 |setright!|
              89 |setleft!| 95 |setelt!| 101 |setchildren!| 122 |sample| 128
              |right| 132 |parts| 137 |nodes| 142 |node?| 147 |node| 153
              |more?| 160 |min| 166 |members| 171 |member?| 176 |max| 182
              |map!| 193 |map| 199 |less?| 205 |left| 211 |leaves| 216 |leaf?|
              221 |latex| 226 |insertRoot!| 231 |insert!| 237 |hashUpdate!| 243
              |hash| 249 |every?| 254 |eval| 260 |eq?| 286 |empty?| 292 |empty|
              297 |elt| 301 |distance| 319 |cyclic?| 325 |count| 330 |copy| 342
              |coerce| 347 |children| 352 |child?| 357 |binarySearchTree| 363
              |any?| 368 = 374 |#| 380)
           'NIL
           (CONS (|makeByteWordVec2| 8 '(0 0 0 0 3 1 2 0 6 8 2 0 0 0))
                 (CONS
                  '#(|BinaryTreeCategory&| |BinaryRecursiveAggregate&|
                     |RecursiveAggregate&| |HomogeneousAggregate&| |Hashable&|
                     |SetCategory&| |Evalable&| |Aggregate&| |BasicType&| NIL
                     |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|BinaryTreeCategory| 6) (|BinaryRecursiveAggregate| 6)
                      (|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Hashable|) (|SetCategory|) (|Evalable| 6) (|Aggregate|)
                      (|BasicType|) (|CoercibleTo| 37) (|InnerEvalable| 6 6)
                      (|shallowlyMutable|) (|finiteAggregate|) (|Type|))
                   (|makeByteWordVec2| 40
                                       '(0 0 0 8 1 7 0 6 9 1 0 13 0 14 1 0 6 0
                                         15 2 6 13 0 0 16 1 0 0 0 17 2 0 0 0 0
                                         18 1 0 0 0 19 2 0 0 0 0 20 2 6 13 0 0
                                         21 3 0 0 0 6 0 24 2 13 13 0 0 1 1 0 6
                                         0 15 2 0 22 6 0 23 2 0 13 0 26 1 2 12
                                         6 0 6 1 2 12 0 0 0 18 2 12 0 0 0 20 3
                                         12 6 0 29 6 1 3 12 0 0 31 0 1 3 12 0 0
                                         32 0 1 2 12 0 0 28 1 0 0 0 1 1 0 0 0
                                         17 1 9 11 0 1 1 0 28 0 1 2 5 13 0 0 1
                                         3 0 0 0 6 0 24 2 0 13 0 26 1 1 10 6 0
                                         1 1 9 11 0 1 2 11 13 6 0 1 1 10 6 0 1
                                         2 9 6 36 0 1 2 12 0 27 0 1 2 0 0 27 0
                                         1 2 0 13 0 26 1 1 0 0 0 19 1 0 11 0 1
                                         1 0 13 0 1 1 1 40 0 1 2 0 0 6 0 25 2 0
                                         0 6 0 10 2 3 38 38 0 1 1 3 39 0 1 2 9
                                         13 35 0 1 2 2 0 0 33 1 3 2 0 0 6 6 1 2
                                         2 0 0 34 1 3 2 0 0 11 11 1 2 0 13 0 0
                                         1 1 0 13 0 14 0 0 0 8 2 0 6 0 29 1 2 0
                                         0 0 31 1 2 0 0 0 32 1 2 0 30 0 0 1 1 0
                                         13 0 1 2 11 26 6 0 1 2 9 26 35 0 1 1 0
                                         0 0 1 1 7 37 0 1 1 0 28 0 1 2 5 13 0 0
                                         1 1 0 0 11 12 2 9 13 35 0 1 2 13 13 0
                                         0 1 1 9 26 0 1)))))
           '|lookupComplete|)) 
