
(PUT '|CYCGRP;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |CYCGRP;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|CYCGRP;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |CYCGRP;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |CYCGRP;coerce;$Of;3| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G113 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 10))
                   (PROGN
                    (LETT #1# (SPADCALL 1 (QREFELT $ 13)))
                    (GO #2=#:G112)))
                  ((EQL (|CYCGRP;rep| |x| $) 1)
                   (PROGN
                    (LETT #1# (SPADCALL (QREFELT $ 7) (QREFELT $ 15)))
                    (GO #2#)))
                  ('T
                   (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 15))
                             (SPADCALL (|CYCGRP;rep| |x| $) (QREFELT $ 13))
                             (QREFELT $ 16)))))
                #2# (EXIT #1#)))) 

(SDEFUN |CYCGRP;hashUpdate!;Hs$Hs;4|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (|CYCGRP;rep| |s| $))) 

(SDEFUN |CYCGRP;convert;$Se;5| ((|x| $) ($ |SExpression|))
        (SPADCALL (|CYCGRP;rep| |x| $) (QREFELT $ 21))) 

(SDEFUN |CYCGRP;One;$;6| (($ $)) (|CYCGRP;per| 0 $)) 

(SDEFUN |CYCGRP;one?;$B;7| ((|x| $) ($ |Boolean|)) (ZEROP (|CYCGRP;rep| |x| $))) 

(SDEFUN |CYCGRP;order;$I;8| ((|x| $) ($ |Integer|))
        (QUOTIENT2 (QREFELT $ 6)
                   (GCD (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 6)))) 

(SDEFUN |CYCGRP;*;3$;9| ((|x| $) (|y| $) ($ $))
        (|CYCGRP;per|
         (SPADCALL (|CYCGRP;rep| |x| $) (|CYCGRP;rep| |y| $) (QREFELT $ 6)
                   (QREFELT $ 26))
         $)) 

(SDEFUN |CYCGRP;inv;2$;10| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 10)) (|spadConstant| $ 23))
              ('T (|CYCGRP;per| (- (QREFELT $ 6) (|CYCGRP;rep| |x| $)) $)))) 

(SDEFUN |CYCGRP;=;2$B;11| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL (|CYCGRP;rep| |x| $) (|CYCGRP;rep| |y| $))) 

(SDEFUN |CYCGRP;smaller?;2$B;12| ((|x| $) (|y| $) ($ |Boolean|))
        (< (|CYCGRP;rep| |x| $) (|CYCGRP;rep| |y| $))) 

(SDEFUN |CYCGRP;size;Nni;13| (($ |NonNegativeInteger|)) (QREFELT $ 6)) 

(SDEFUN |CYCGRP;index;Pi$;14| ((|i| |PositiveInteger|) ($ $))
        (SPROG ((#1=#:G127 NIL) (|imodn| ($)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| (QREFELT $ 6) (QREFELT $ 34))
                   (|error| "out of range"))
                  (#2='T
                   (SEQ
                    (LETT |imodn|
                          (SPADCALL |i| 1 (QREFELT $ 6) (QREFELT $ 35)))
                    (EXIT
                     (COND
                      ((ZEROP |imodn|)
                       (PROGN (LETT #1# (|spadConstant| $ 23)) (GO #3=#:G126)))
                      (#2# (|CYCGRP;per| |imodn| $))))))))
                #3# (EXIT #1#)))) 

(SDEFUN |CYCGRP;lookup;$Pi;15| ((|x| $) ($ |PositiveInteger|))
        (+ (REM (|CYCGRP;rep| |x| $) (QREFELT $ 6)) 1)) 

(SDEFUN |CYCGRP;random;$;16| (($ $)) (|CYCGRP;per| (RANDOM (QREFELT $ 6)) $)) 

(SDEFUN |CYCGRP;enumerate;L;17| (($ |List| $))
        (SPROG ((#1=#:G133 NIL) (|k| NIL) (#2=#:G132 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                      (COND ((|greater_SI| |k| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (|CYCGRP;per| |k| $) #2#))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |CYCGRP;generator;$;18| (($ $)) (|CYCGRP;per| 1 $)) 

(SDEFUN |CYCGRP;exponent;$I;19| ((|x| $) ($ |Integer|)) (|CYCGRP;rep| |x| $)) 

(SDEFUN |CYCGRP;generators;L;20| (($ |List| $))
        (LIST (SPADCALL (QREFELT $ 41)))) 

(DECLAIM (NOTINLINE |CyclicGroup;|)) 

(DEFUN |CyclicGroup| (&REST #1=#:G140)
  (SPROG NIL
         (PROG (#2=#:G141)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CyclicGroup|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CyclicGroup;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|CyclicGroup|)))))))))) 

(DEFUN |CyclicGroup;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|CyclicGroup| DV$1 DV$2))
          (LETT $ (GETREFV 47))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CyclicGroup| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|Integer|))
          $))) 

(MAKEPROP '|CyclicGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Boolean|) |CYCGRP;one?;$B;7| (|OutputForm|) (|Integer|)
              (0 . |coerce|) (|Symbol|) (5 . |coerce|) (10 . ^)
              |CYCGRP;coerce;$Of;3| (|HashState|) |CYCGRP;hashUpdate!;Hs$Hs;4|
              (|SExpression|) (16 . |convert|) |CYCGRP;convert;$Se;5|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CYCGRP;One;$;6|) $))
              |CYCGRP;exponent;$I;19| |CYCGRP;order;$I;8| (21 . |addmod|)
              |CYCGRP;*;3$;9| |CYCGRP;inv;2$;10| |CYCGRP;=;2$B;11|
              |CYCGRP;smaller?;2$B;12| (|NonNegativeInteger|)
              |CYCGRP;size;Nni;13| (|PositiveInteger|) (28 . >) (34 . |submod|)
              |CYCGRP;index;Pi$;14| |CYCGRP;lookup;$Pi;15| |CYCGRP;random;$;16|
              (|List| $) |CYCGRP;enumerate;L;17| |CYCGRP;generator;$;18|
              |CYCGRP;generators;L;20| (|InputForm|) (|Union| $ '"failed")
              (|String|) (|SingleInteger|))
           '#(~= 41 |smaller?| 47 |size| 53 |sample| 57 |rightRecip| 61
              |rightPower| 66 |recip| 78 |random| 83 |order| 87 |one?| 92
              |lookup| 97 |leftRecip| 102 |leftPower| 107 |latex| 119 |inv| 124
              |index| 129 |hashUpdate!| 134 |hash| 140 |generators| 145
              |generator| 149 |exponent| 153 |enumerate| 158 |convert| 162
              |conjugate| 172 |commutator| 178 |coerce| 184 ^ 189 |One| 207 =
              211 / 217 * 223)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|FiniteGroup&| |Group&| NIL NIL |Finite&| |MagmaWithUnit&|
                     NIL |Magma&| NIL |SetCategory&| NIL NIL NIL NIL NIL
                     |BasicType&| NIL)
                  (CONS
                   '#((|FiniteGroup|) (|Group|) (|Monoid|) (|SemiGroup|)
                      (|Finite|) (|MagmaWithUnit|) (|Comparable|) (|Magma|)
                      (|CommutativeStar|) (|SetCategory|) (|ConvertibleTo| 20)
                      (|TwoSidedRecip|) (|FinitelyGenerated|)
                      (|ConvertibleTo| 43) (|unitsKnown|) (|BasicType|)
                      (|CoercibleTo| 11))
                   (|makeByteWordVec2| 46
                                       '(1 12 11 0 13 1 14 11 0 15 2 11 0 0 0
                                         16 1 20 0 12 21 3 8 0 0 0 0 26 2 33 9
                                         0 0 34 3 12 0 0 0 0 35 2 0 9 0 0 1 2 0
                                         9 0 0 30 0 0 31 32 0 0 0 1 1 0 44 0 1
                                         2 0 0 0 31 1 2 0 0 0 33 1 1 0 44 0 1 0
                                         0 0 38 1 0 12 0 25 1 0 9 0 10 1 0 33 0
                                         37 1 0 44 0 1 2 0 0 0 31 1 2 0 0 0 33
                                         1 1 0 45 0 1 1 0 0 0 28 1 0 0 33 36 2
                                         0 18 18 0 19 1 0 46 0 1 0 0 39 42 0 0
                                         0 41 1 0 12 0 24 0 0 39 40 1 0 20 0 22
                                         1 0 43 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                         11 0 17 2 0 0 0 12 1 2 0 0 0 31 1 2 0
                                         0 0 33 1 0 0 0 23 2 0 9 0 0 29 2 0 0 0
                                         0 1 2 0 0 0 0 27)))))
           '|lookupComplete|)) 
