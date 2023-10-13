
(/VERSIONCHECK 2) 

(PUT '|PENDTREE;coerce;$T;1| '|SPADreplace| '(XLAM (|t|) |t|)) 

(DEFUN |PENDTREE;coerce;$T;1| (|t| $) |t|) 

(DEFUN |PENDTREE;ptree;S$;2| (|n| $) (SPADCALL |n| NIL (QREFELT $ 11))) 

(DEFUN |PENDTREE;ptree;3$;3| (|l| |r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 13))
            (SPADCALL |l| (SPADCALL |r| (QREFELT $ 14)) (QREFELT $ 16))
            (QREFELT $ 11))) 

(DEFUN |PENDTREE;leaf?;$B;4| (|t| $)
  (SPADCALL (SPADCALL |t| (QREFELT $ 14)) (QREFELT $ 19))) 

(DEFUN |PENDTREE;=;2$B;5| (|t1| |t2| $) (SPADCALL |t1| |t2| (QREFELT $ 21))) 

(DEFUN |PENDTREE;left;2$;6| (|b| $)
  (COND ((SPADCALL |b| (QREFELT $ 20)) (|error| "ptree:no left"))
        ('T (SPADCALL (SPADCALL |b| (QREFELT $ 14)) (QREFELT $ 22))))) 

(DEFUN |PENDTREE;right;2$;7| (|b| $)
  (COND ((SPADCALL |b| (QREFELT $ 20)) (|error| "ptree:no right"))
        ('T
         (SPADCALL (SPADCALL |b| (QREFELT $ 13))
                   (SPADCALL (SPADCALL |b| (QREFELT $ 14)) (QREFELT $ 24))
                   (QREFELT $ 11))))) 

(DEFUN |PENDTREE;value;$S;8| (|b| $)
  (COND ((SPADCALL |b| (QREFELT $ 20)) (SPADCALL |b| (QREFELT $ 13)))
        ('T (|error| "the pendant tree has no value")))) 

(DEFUN |PENDTREE;coerce;$Of;9| (|b| $)
  (COND
   ((SPADCALL |b| (QREFELT $ 20))
    (SPADCALL (SPADCALL |b| (QREFELT $ 13)) (QREFELT $ 28)))
   ('T
    (SPADCALL
     (SPADCALL
      (LIST (SPADCALL (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 29))
            (SPADCALL (SPADCALL |b| (QREFELT $ 25)) (QREFELT $ 29)))
      (QREFELT $ 30))
     (QREFELT $ 31))))) 

(DEFUN |PendantTree| (#1=#:G146)
  (PROG ()
    (RETURN
     (PROG (#2=#:G147)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PendantTree|)
                                           '|domainEqualList|)
                . #3=(|PendantTree|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|PendantTree;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|PendantTree|))))))))))) 

(DEFUN |PendantTree;| (|#1|)
  (PROG (|pv$| #1=#:G144 #2=#:G145 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|PendantTree|))
      (LETT |dv$| (LIST '|PendantTree| DV$1) . #3#)
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
      (|haddProp| |$ConstructorCache| '|PendantTree| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Tree| |#1|))
      $)))) 

(MAKEPROP '|PendantTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Tree| 6)
              |PENDTREE;coerce;$T;1| (|List| $) (0 . |tree|)
              |PENDTREE;ptree;S$;2| (6 . |value|) (11 . |children|) (|List| $$)
              (16 . |cons|) |PENDTREE;ptree;3$;3| (|Boolean|) (22 . |empty?|)
              |PENDTREE;leaf?;$B;4| |PENDTREE;=;2$B;5| (27 . |first|)
              |PENDTREE;left;2$;6| (32 . |rest|) |PENDTREE;right;2$;7|
              |PENDTREE;value;$S;8| (|OutputForm|) (37 . |coerce|)
              |PENDTREE;coerce;$Of;9| (42 . |blankSeparate|) (47 . |paren|)
              (|NonNegativeInteger|) (|List| 6) (|Equation| 6) (|List| 34)
              (|Mapping| 18 6) '"right" '"left" '"value" (|Mapping| 6 6)
              (|SingleInteger|) (|String|) (|Integer|))
           '#(~= 52 |value| 58 |size?| 63 |setvalue!| 69 |setright!| 75
              |setleft!| 81 |setelt| 87 |setchildren!| 108 |sample| 114 |right|
              118 |ptree| 123 |parts| 134 |nodes| 139 |node?| 144 |more?| 150
              |members| 156 |member?| 161 |map!| 167 |map| 173 |less?| 179
              |left| 185 |leaves| 190 |leaf?| 195 |latex| 200 |hash| 205
              |every?| 210 |eval| 216 |eq?| 242 |empty?| 248 |empty| 253 |elt|
              257 |distance| 275 |cyclic?| 281 |count| 286 |copy| 298 |coerce|
              303 |children| 313 |child?| 318 |any?| 324 = 330 |#| 336)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 2 1 0 2 1 4))
                 (CONS
                  '#(|BinaryRecursiveAggregate&| |RecursiveAggregate&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|BinaryRecursiveAggregate| 6) (|RecursiveAggregate| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|InnerEvalable| 6 6)
                      (|BasicType|) (|CoercibleTo| 27))
                   (|makeByteWordVec2| 43
                                       '(2 7 0 6 10 11 1 7 6 0 13 1 7 10 0 14 2
                                         15 0 2 0 16 1 15 18 0 19 1 15 2 0 22 1
                                         15 0 0 24 1 6 27 0 28 1 27 0 10 30 1
                                         27 0 0 31 2 1 18 0 0 1 1 0 6 0 26 2 0
                                         18 0 32 1 2 7 6 0 6 1 2 7 0 0 0 1 2 7
                                         0 0 0 1 3 7 0 0 37 0 1 3 7 0 0 38 0 1
                                         3 7 6 0 39 6 1 2 7 0 0 10 1 0 0 0 1 1
                                         0 0 0 25 1 0 0 6 12 2 0 0 0 0 17 1 5
                                         33 0 1 1 0 10 0 1 2 1 18 0 0 1 2 0 18
                                         0 32 1 1 5 33 0 1 2 6 18 6 0 1 2 7 0
                                         40 0 1 2 0 0 40 0 1 2 0 18 0 32 1 1 0
                                         0 0 23 1 0 33 0 1 1 0 18 0 20 1 1 42 0
                                         1 1 1 41 0 1 2 5 18 36 0 1 3 2 0 0 6 6
                                         1 3 2 0 0 33 33 1 2 2 0 0 34 1 2 2 0 0
                                         35 1 2 0 18 0 0 1 1 0 18 0 1 0 0 0 1 2
                                         0 0 0 37 1 2 0 0 0 38 1 2 0 6 0 39 1 2
                                         0 43 0 0 1 1 0 18 0 1 2 6 32 6 0 1 2 5
                                         32 36 0 1 1 0 0 0 1 1 3 27 0 29 1 0 8
                                         0 9 1 0 10 0 1 2 1 18 0 0 1 2 5 18 36
                                         0 1 2 1 18 0 0 21 1 5 32 0 1)))))
           '|lookupComplete|)) 
