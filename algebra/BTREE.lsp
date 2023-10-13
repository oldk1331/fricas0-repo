
(/VERSIONCHECK 2) 

(DEFUN |BTREE;=;2$B;1| (|t1| |t2| $) (SPADCALL |t1| |t2| (QREFELT $ 9))) 

(PUT '|BTREE;empty;$;2| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |BTREE;empty;$;2| ($) NIL) 

(DEFUN |BTREE;node;$S2$;3| (|l| |v| |r| $)
  (CONS (SPADCALL |v| |l| (QREFELT $ 14)) |r|)) 

(DEFUN |BTREE;binaryTree;$S2$;4| (|l| |v| |r| $)
  (SPADCALL |l| |v| |r| (QREFELT $ 15))) 

(DEFUN |BTREE;binaryTree;S$;5| (|v| $)
  (SPADCALL (SPADCALL (QREFELT $ 11)) |v| (SPADCALL (QREFELT $ 11))
            (QREFELT $ 15))) 

(PUT '|BTREE;empty?;$B;6| '|SPADreplace| 'NULL) 

(DEFUN |BTREE;empty?;$B;6| (|t| $) (NULL |t|)) 

(DEFUN |BTREE;leaf?;$B;7| (|t| $)
  (COND ((SPADCALL |t| (QREFELT $ 18)) 'T)
        ((SPADCALL (SPADCALL |t| (QREFELT $ 19)) (QREFELT $ 18))
         (SPADCALL (SPADCALL |t| (QREFELT $ 20)) (QREFELT $ 18)))
        ('T 'NIL))) 

(DEFUN |BTREE;right;2$;8| (|t| $)
  (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no right"))
        ('T (CDR |t|)))) 

(DEFUN |BTREE;left;2$;9| (|t| $)
  (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no left"))
        ('T (SPADCALL (|SPADfirst| |t|) (QREFELT $ 22))))) 

(DEFUN |BTREE;value;$S;10| (|t| $)
  (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no value"))
        ('T (SPADCALL (|SPADfirst| |t|) (QREFELT $ 23))))) 

(DEFUN |BTREE;setvalue!;$2S;11| (|t| |nd| $)
  (SEQ
   (COND ((SPADCALL |t| (QREFELT $ 18)) (|error| "binaryTree:no value to set"))
         ('T
          (SEQ (SPADCALL (|SPADfirst| |t|) |nd| (QREFELT $ 25)) (EXIT |nd|)))))) 

(DEFUN |BTREE;setleft!;3$;12| (|t1| |t2| $)
  (SEQ
   (COND ((SPADCALL |t1| (QREFELT $ 18)) (|error| "binaryTree:no left to set"))
         ('T
          (SEQ (SPADCALL (|SPADfirst| |t1|) |t2| (QREFELT $ 27))
               (EXIT |t1|)))))) 

(DEFUN |BTREE;setright!;3$;13| (|t1| |t2| $)
  (COND ((SPADCALL |t1| (QREFELT $ 18)) (|error| "binaryTree:no right to set"))
        ('T (SPADCALL |t1| |t2| (QREFELT $ 29))))) 

(DEFUN |BinaryTree| (#1=#:G160)
  (PROG ()
    (RETURN
     (PROG (#2=#:G161)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|BinaryTree|)
                                           '|domainEqualList|)
                . #3=(|BinaryTree|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|BinaryTree;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|BinaryTree|))))))))))) 

(DEFUN |BinaryTree;| (|#1|)
  (PROG (|pv$| #1=#:G158 #2=#:G159 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|BinaryTree|))
      (LETT |dv$| (LIST '|BinaryTree| DV$1) . #3#)
      (LETT $ (GETREFV 44) . #3#)
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
      (|haddProp| |$ConstructorCache| '|BinaryTree| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|List| (|Tree| |#1|)))
      $)))) 

(MAKEPROP '|BinaryTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|) (0 . =)
              |BTREE;=;2$B;1| |BTREE;empty;$;2| (|List| $) (|Tree| 6)
              (6 . |tree|) |BTREE;node;$S2$;3| |BTREE;binaryTree;$S2$;4|
              |BTREE;binaryTree;S$;5| |BTREE;empty?;$B;6| |BTREE;left;2$;9|
              |BTREE;right;2$;8| |BTREE;leaf?;$B;7| (12 . |children|)
              (17 . |value|) |BTREE;value;$S;10| (22 . |setvalue!|)
              |BTREE;setvalue!;$2S;11| (28 . |setchildren!|)
              |BTREE;setleft!;3$;12| (34 . |setrest!|) |BTREE;setright!;3$;13|
              (|NonNegativeInteger|) (|List| 6) (|Equation| 6) (|List| 33)
              (|Mapping| 8 6) '"right" '"left" '"value" (|Mapping| 6 6)
              (|OutputForm|) (|SingleInteger|) (|String|) (|Integer|))
           '#(~= 40 |value| 46 |size?| 51 |setvalue!| 57 |setright!| 63
              |setleft!| 69 |setelt| 75 |setchildren!| 96 |sample| 102 |right|
              106 |parts| 111 |nodes| 116 |node?| 121 |node| 127 |more?| 134
              |members| 140 |member?| 145 |map!| 151 |map| 157 |less?| 163
              |left| 169 |leaves| 174 |leaf?| 179 |latex| 184 |hash| 189
              |every?| 194 |eval| 200 |eq?| 226 |empty?| 232 |empty| 237 |elt|
              241 |distance| 259 |cyclic?| 265 |count| 270 |copy| 282 |coerce|
              287 |children| 292 |child?| 297 |binaryTree| 303 |any?| 315 = 321
              |#| 327)
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
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 40))
                   (|makeByteWordVec2| 43
                                       '(2 7 8 0 0 9 2 13 0 6 12 14 1 13 12 0
                                         22 1 13 6 0 23 2 13 6 0 6 25 2 13 0 0
                                         12 27 2 7 0 0 0 29 2 1 8 0 0 1 1 0 6 0
                                         24 2 0 8 0 31 1 2 7 6 0 6 26 2 7 0 0 0
                                         30 2 7 0 0 0 28 3 7 0 0 36 0 1 3 7 0 0
                                         37 0 1 3 7 6 0 38 6 1 2 7 0 0 12 1 0 0
                                         0 1 1 0 0 0 20 1 5 32 0 1 1 0 12 0 1 2
                                         1 8 0 0 1 3 0 0 0 6 0 15 2 0 8 0 31 1
                                         1 5 32 0 1 2 6 8 6 0 1 2 7 0 39 0 1 2
                                         0 0 39 0 1 2 0 8 0 31 1 1 0 0 0 19 1 0
                                         32 0 1 1 0 8 0 21 1 1 42 0 1 1 1 41 0
                                         1 2 5 8 35 0 1 3 2 0 0 6 6 1 3 2 0 0
                                         32 32 1 2 2 0 0 33 1 2 2 0 0 34 1 2 0
                                         8 0 0 1 1 0 8 0 18 0 0 0 11 2 0 0 0 36
                                         1 2 0 0 0 37 1 2 0 6 0 38 1 2 0 43 0 0
                                         1 1 0 8 0 1 2 6 31 6 0 1 2 5 31 35 0 1
                                         1 0 0 0 1 1 3 40 0 1 1 0 12 0 1 2 1 8
                                         0 0 1 3 0 0 0 6 0 16 1 0 0 6 17 2 5 8
                                         35 0 1 2 1 8 0 0 10 1 5 31 0 1)))))
           '|lookupComplete|)) 
