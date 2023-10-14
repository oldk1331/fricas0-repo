
(/VERSIONCHECK 2) 

(DEFUN |ASTACK;#;$Nni;1| (|s| $) (SPADCALL |s| (QREFELT $ 9))) 

(DEFUN |ASTACK;=;2$B;2| (|s| |t| $) (SPADCALL |s| |t| (QREFELT $ 12))) 

(DEFUN |ASTACK;copy;2$;3| (|s| $) (SPADCALL |s| (QREFELT $ 14))) 

(DEFUN |ASTACK;coerce;$Of;4| (|d| $)
  (PROG (#1=#:G137 |i| #2=#:G136)
    (RETURN
     (SEQ
      (COND ((SPADCALL |d| (QREFELT $ 16)) (SPADCALL NIL (QREFELT $ 19)))
            ('T
             (SPADCALL
              (PROGN
               (LETT #2# NIL . #3=(|ASTACK;coerce;$Of;4|))
               (SEQ (LETT |i| 0 . #3#)
                    (LETT #1# (- (SPADCALL |d| (QREFELT $ 10)) 1) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL (SPADCALL |d| |i| (QREFELT $ 21))
                                       (QREFELT $ 22))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QREFELT $ 24)))))))) 

(DEFUN |ASTACK;depth;$Nni;5| (|s| $) (SPADCALL |s| (QREFELT $ 10))) 

(DEFUN |ASTACK;empty?;$B;6| (|s| $) (SPADCALL |s| (QREFELT $ 27))) 

(DEFUN |ASTACK;extract!;$S;7| (|s| $) (SPADCALL |s| (QREFELT $ 28))) 

(DEFUN |ASTACK;insert!;S2$;8| (|e| |s| $)
  (SEQ (SPADCALL |e| |s| (QREFELT $ 30)) (EXIT |s|))) 

(DEFUN |ASTACK;push!;S$S;9| (|e| |s| $)
  (SEQ (SPADCALL |e| |s| (QREFELT $ 32)) (EXIT |e|))) 

(DEFUN |ASTACK;pop!;$S;10| (|s| $)
  (PROG (|r| |m|)
    (RETURN
     (SEQ (COND ((SPADCALL |s| (QREFELT $ 16)) (|error| "empty stack")))
          (LETT |m| (SPADCALL |s| (QREFELT $ 33)) . #1=(|ASTACK;pop!;$S;10|))
          (LETT |r| (SPADCALL |s| |m| (QREFELT $ 21)) . #1#)
          (SPADCALL |s| |m| (QREFELT $ 34)) (EXIT |r|))))) 

(DEFUN |ASTACK;top;$S;11| (|s| $)
  (COND ((SPADCALL |s| (QREFELT $ 16)) (|error| "empty stack"))
        ('T (SPADCALL |s| (SPADCALL |s| (QREFELT $ 33)) (QREFELT $ 21))))) 

(DEFUN |ASTACK;arrayStack;L$;12| (|l| $) (SPADCALL |l| (QREFELT $ 36))) 

(DEFUN |ASTACK;empty;$;13| ($) (SPADCALL 0 0 (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |ArrayStack;|)) 

(DEFUN |ArrayStack| (#1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|ArrayStack|)
                                           '|domainEqualList|)
                . #3=(|ArrayStack|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|ArrayStack;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|ArrayStack|))))))))))) 

(DEFUN |ArrayStack;| (|#1|)
  (PROG (|pv$| #1=#:G154 #2=#:G155 #3=#:G156 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|ArrayStack|))
      (LETT |dv$| (LIST '|ArrayStack| DV$1) . #4#)
      (LETT $ (GETREFV 47) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #3#)
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|BasicType|))
                                                . #4#)
                                          (OR #2# #3#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #3#))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|ArrayStack| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 256))
      (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
           (|augmentPredVector| $ 512))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|IndexedFlexibleArray| |#1| 0))
      $)))) 

(MAKEPROP '|ArrayStack| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |#|) |ASTACK;#;$Nni;1| (|Boolean|)
              (5 . =) |ASTACK;=;2$B;2| (11 . |copy|) |ASTACK;copy;2$;3|
              |ASTACK;empty?;$B;6| (|OutputForm|) (|List| 6) (16 . |coerce|)
              (|Integer|) (21 . |elt|) (27 . |coerce|) (|List| 17)
              (32 . |coerce|) |ASTACK;coerce;$Of;4| |ASTACK;depth;$Nni;5|
              (37 . |empty?|) |ASTACK;pop!;$S;10| |ASTACK;extract!;$S;7|
              |ASTACK;push!;S$S;9| |ASTACK;insert!;S2$;8| (42 . |concat|)
              (48 . |maxIndex|) (53 . |delete!|) |ASTACK;top;$S;11|
              (59 . |construct|) |ASTACK;arrayStack;L$;12| (64 . |new|)
              |ASTACK;empty;$;13| (|Equation| 6) (|List| 40) (|Mapping| 11 6)
              (|Mapping| 6 6) (|SingleInteger|) (|String|) (|HashState|))
           '#(~= 70 |top| 76 |size?| 81 |sample| 87 |push!| 91 |pop!| 97
              |parts| 102 |more?| 107 |members| 113 |member?| 118 |map!| 124
              |map| 130 |less?| 136 |latex| 142 |inspect| 147 |insert!| 152
              |hashUpdate!| 158 |hash| 164 |extract!| 169 |every?| 174 |eval|
              180 |eq?| 206 |empty?| 212 |empty| 217 |depth| 221 |count| 226
              |copy| 238 |coerce| 243 |bag| 248 |arrayStack| 253 |any?| 258 =
              264 |#| 270)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(NIL |BagAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|StackAggregate| 6) (|BagAggregate| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 17))
                   (|makeByteWordVec2| 46
                                       '(1 7 8 0 9 2 7 11 0 0 12 1 7 0 0 14 1
                                         18 17 0 19 2 7 6 0 20 21 1 6 17 0 22 1
                                         23 17 0 24 1 7 11 0 27 2 7 0 6 0 32 1
                                         7 20 0 33 2 7 0 0 20 34 1 7 0 18 36 2
                                         7 0 8 6 38 2 10 11 0 0 1 1 0 6 0 35 2
                                         0 11 0 8 1 0 0 0 1 2 0 6 6 0 30 1 0 6
                                         0 28 1 8 18 0 1 2 0 11 0 8 1 1 8 18 0
                                         1 2 9 11 6 0 1 2 7 0 43 0 1 2 0 0 43 0
                                         1 2 0 11 0 8 1 1 1 45 0 1 1 0 6 0 1 2
                                         0 0 6 0 31 2 1 46 46 0 1 1 1 44 0 1 1
                                         0 6 0 29 2 8 11 42 0 1 3 2 0 0 18 18 1
                                         2 2 0 0 40 1 3 2 0 0 6 6 1 2 2 0 0 41
                                         1 2 0 11 0 0 1 1 0 11 0 16 0 0 0 39 1
                                         0 8 0 26 2 9 8 6 0 1 2 8 8 42 0 1 1 0
                                         0 0 15 1 5 17 0 25 1 0 0 18 1 1 0 0 18
                                         37 2 8 11 42 0 1 2 10 11 0 0 13 1 8 8
                                         0 10)))))
           '|lookupComplete|)) 
