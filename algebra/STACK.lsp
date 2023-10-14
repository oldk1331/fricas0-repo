
(/VERSIONCHECK 2) 

(DEFUN |STACK;=;2$B;1| (|s| |t| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (SPADCALL |t| (QREFELT $ 9))
            (QREFELT $ 11))) 

(DEFUN |STACK;parts;$L;2| (|s| $) (SPADCALL |s| (QREFELT $ 9))) 

(DEFUN |STACK;map;M2$;3| (|f| |s| $)
  (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 15))
            (QREFELT $ 16))) 

(DEFUN |STACK;map!;M2$;4| (|f| |s| $)
  (SEQ
   (SPADCALL |s| (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 18))
             (QREFELT $ 19))
   (EXIT |s|))) 

(DEFUN |STACK;coerce;$Of;5| (|d| $)
  (PROG (#1=#:G137 |e| #2=#:G136)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|STACK;coerce;$Of;5|))
        (SEQ (LETT |e| NIL . #3#) (LETT #1# (SPADCALL |d| (QREFELT $ 9)) . #3#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 22)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 24)))))) 

(DEFUN |STACK;copy;2$;6| (|s| $)
  (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 26))
            (QREFELT $ 16))) 

(DEFUN |STACK;depth;$Nni;7| (|s| $) (LENGTH (SPADCALL |s| (QREFELT $ 9)))) 

(DEFUN |STACK;#;$Nni;8| (|s| $) (SPADCALL |s| (QREFELT $ 29))) 

(DEFUN |STACK;pop!;$S;9| (|s| $)
  (PROG (|e|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |s| (QREFELT $ 31)) (|error| "empty stack"))
            ('T
             (SEQ
              (LETT |e| (|SPADfirst| (SPADCALL |s| (QREFELT $ 9)))
                    |STACK;pop!;$S;9|)
              (SPADCALL |s| (CDR (SPADCALL |s| (QREFELT $ 9))) (QREFELT $ 19))
              (EXIT |e|)))))))) 

(DEFUN |STACK;extract!;$S;10| (|s| $) (SPADCALL |s| (QREFELT $ 32))) 

(DEFUN |STACK;top;$S;11| (|s| $)
  (COND ((SPADCALL |s| (QREFELT $ 31)) (|error| "empty stack"))
        ('T (|SPADfirst| (SPADCALL |s| (QREFELT $ 9)))))) 

(DEFUN |STACK;inspect;$S;12| (|s| $) (SPADCALL |s| (QREFELT $ 34))) 

(DEFUN |STACK;push!;S$S;13| (|e| |s| $)
  (SEQ (SPADCALL |s| (CONS |e| (SPADCALL |s| (QREFELT $ 9))) (QREFELT $ 19))
       (EXIT |e|))) 

(DEFUN |STACK;insert!;S2$;14| (|e| |s| $)
  (SEQ (SPADCALL |e| |s| (QREFELT $ 36)) (EXIT |s|))) 

(DEFUN |STACK;empty;$;15| ($) (SPADCALL NIL (QREFELT $ 16))) 

(DEFUN |STACK;empty?;$B;16| (|s| $) (NULL (SPADCALL |s| (QREFELT $ 9)))) 

(DEFUN |STACK;stack;L$;17| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 26)) (QREFELT $ 16))) 

(DEFUN |Stack| (#1=#:G158)
  (PROG ()
    (RETURN
     (PROG (#2=#:G159)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Stack|)
                                           '|domainEqualList|)
                . #3=(|Stack|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Stack;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Stack|))))))))))) 

(DEFUN |Stack;| (|#1|)
  (PROG (|pv$| #1=#:G156 #2=#:G157 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|Stack|))
      (LETT |dv$| (LIST '|Stack| DV$1) . #3#)
      (LETT $ (GETREFV 46) . #3#)
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
      (|haddProp| |$ConstructorCache| '|Stack| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 16))
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 32))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Reference| (|List| |#1|)))
      $)))) 

(MAKEPROP '|Stack| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (0 . |deref|) (|Boolean|) (5 . =) |STACK;=;2$B;1|
              |STACK;parts;$L;2| (|Mapping| 6 6) (11 . |map|) (17 . |ref|)
              |STACK;map;M2$;3| (22 . |map!|) (28 . |setref|)
              |STACK;map!;M2$;4| (|OutputForm|) (34 . |coerce|) (|List| $)
              (39 . |bracket|) |STACK;coerce;$Of;5| (44 . |copy|)
              |STACK;copy;2$;6| (|NonNegativeInteger|) |STACK;depth;$Nni;7|
              |STACK;#;$Nni;8| |STACK;empty?;$B;16| |STACK;pop!;$S;9|
              |STACK;extract!;$S;10| |STACK;top;$S;11| |STACK;inspect;$S;12|
              |STACK;push!;S$S;13| |STACK;insert!;S2$;14| |STACK;empty;$;15|
              |STACK;stack;L$;17| (|Equation| 6) (|List| 40) (|Mapping| 10 6)
              (|SingleInteger|) (|String|) (|HashState|))
           '#(~= 49 |top| 55 |stack| 60 |size?| 65 |sample| 71 |push!| 75
              |pop!| 81 |parts| 86 |more?| 91 |members| 97 |member?| 102 |map!|
              108 |map| 114 |less?| 120 |latex| 126 |inspect| 131 |insert!| 136
              |hashUpdate!| 142 |hash| 148 |extract!| 153 |every?| 158 |eval|
              164 |eq?| 190 |empty?| 196 |empty| 201 |depth| 205 |count| 210
              |copy| 222 |coerce| 227 |bag| 232 |any?| 237 = 243 |#| 249)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(NIL |BagAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|StackAggregate| 6) (|BagAggregate| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 21))
                   (|makeByteWordVec2| 45
                                       '(1 7 8 0 9 2 8 10 0 0 11 2 8 0 14 0 15
                                         1 7 0 8 16 2 8 0 14 0 18 2 7 8 0 8 19
                                         1 6 21 0 22 1 21 0 23 24 1 8 0 0 26 2
                                         1 10 0 0 1 1 0 6 0 34 1 0 0 8 39 2 0
                                         10 0 28 1 0 0 0 1 2 0 6 6 0 36 1 0 6 0
                                         32 1 6 8 0 13 2 0 10 0 28 1 1 6 8 0 1
                                         2 7 10 6 0 1 2 5 0 14 0 20 2 0 0 14 0
                                         17 2 0 10 0 28 1 1 1 44 0 1 1 0 6 0 35
                                         2 0 0 6 0 37 2 1 45 45 0 1 1 1 43 0 1
                                         1 0 6 0 33 2 6 10 42 0 1 3 2 0 0 8 8 1
                                         2 2 0 0 40 1 3 2 0 0 6 6 1 2 2 0 0 41
                                         1 2 0 10 0 0 1 1 0 10 0 31 0 0 0 38 1
                                         0 28 0 29 2 7 28 6 0 1 2 6 28 42 0 1 1
                                         0 0 0 27 1 3 21 0 25 1 0 0 8 1 2 6 10
                                         42 0 1 2 1 10 0 0 12 1 6 28 0 30)))))
           '|lookupComplete|)) 
