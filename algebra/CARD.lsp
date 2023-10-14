
(PUT '|CARD;Zero;$;1| '|SPADreplace| '(XLAM NIL (CONS -1 0))) 

(SDEFUN |CARD;Zero;$;1| (($ $)) (CONS -1 0)) 

(PUT '|CARD;One;$;2| '|SPADreplace| '(XLAM NIL (CONS -1 1))) 

(SDEFUN |CARD;One;$;2| (($ $)) (CONS -1 1)) 

(PUT '|CARD;coerce;Nni$;3| '|SPADreplace| '(XLAM (|n|) (CONS -1 |n|))) 

(SDEFUN |CARD;coerce;Nni$;3| ((|n| |NonNegativeInteger|) ($ $)) (CONS -1 |n|)) 

(PUT '|CARD;Aleph;Nni$;4| '|SPADreplace| '(XLAM (|n|) (CONS |n| -1))) 

(SDEFUN |CARD;Aleph;Nni$;4| ((|n| |NonNegativeInteger|) ($ $)) (CONS |n| -1)) 

(SDEFUN |CARD;coerce;$Of;5| ((|x| $) ($ |OutputForm|))
        (COND ((EQL (QCAR |x|) -1) (SPADCALL (QCDR |x|) (QREFELT $ 19)))
              ('T
               (SPADCALL (QREFELT $ 16)
                         (LIST (SPADCALL (QCAR |x|) (QREFELT $ 19)))
                         (QREFELT $ 21))))) 

(SDEFUN |CARD;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 23)) 'NIL)
              ((SPADCALL |x| (QREFELT $ 24)) (EQL (QCDR |x|) (QCDR |y|)))
              ('T 'T))) 

(SDEFUN |CARD;<;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((< (QCAR |x|) (QCAR |y|)) 'T)
              ((OR (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 26))
                   (NULL (SPADCALL |x| (QREFELT $ 24))))
               'NIL)
              ('T (< (QCDR |x|) (QCDR |y|))))) 

(SDEFUN |CARD;+;3$;8| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 24))
           (COND
            ((SPADCALL |y| (QREFELT $ 24))
             (EXIT (CONS -1 (+ (QCDR |x|) (QCDR |y|))))))))
         (EXIT (SPADCALL |x| |y| (QREFELT $ 28))))) 

(SDEFUN |CARD;-;2$U;9| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL |x| |y| (QREFELT $ 27)) (CONS 1 "failed"))
              ((SPADCALL |x| (QREFELT $ 24))
               (CONS 0 (CONS -1 (- (QCDR |x|) (QCDR |y|)))))
              ((SPADCALL |x| |y| (QREFELT $ 30)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |CARD;*;3$;10| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 24))
           (COND
            ((SPADCALL |y| (QREFELT $ 24))
             (EXIT (CONS -1 (* (QCDR |x|) (QCDR |y|))))))))
         (COND
          ((OR (SPADCALL |x| (|spadConstant| $ 12) (QREFELT $ 25))
               (SPADCALL |y| (|spadConstant| $ 12) (QREFELT $ 25)))
           (EXIT (|spadConstant| $ 12))))
         (EXIT (SPADCALL |x| |y| (QREFELT $ 28))))) 

(SDEFUN |CARD;*;Nni2$;11| ((|n| |NonNegativeInteger|) (|x| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 24))
          (CONS -1 (SPADCALL |n| (QCDR |x|) (QREFELT $ 34))))
         ((EQL |n| 0) (|spadConstant| $ 12)) ('T |x|))) 

(SDEFUN |CARD;^;3$;12| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G157 NIL))
               (COND
                ((SPADCALL |y| (|spadConstant| $ 12) (QREFELT $ 25))
                 (|spadConstant| $ 11))
                ((SPADCALL |y| (QREFELT $ 24))
                 (COND ((NULL (SPADCALL |x| (QREFELT $ 24))) |x|)
                       ('T
                        (CONS -1
                              (EXPT (QCDR |x|)
                                    (PROG1 (LETT #1# (QCDR |y|) |CARD;^;3$;12|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#)))))))
                ((SPADCALL |x| (|spadConstant| $ 12) (QREFELT $ 25))
                 (|spadConstant| $ 12))
                ((SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 25))
                 (|spadConstant| $ 11))
                ((SPADCALL (QREFELT $ 10) (QREFELT $ 36))
                 (CONS (+ (MAX (- (QCAR |x|) 1) (QCAR |y|)) 1) -1))
                ('T
                 (|error|
                  "Transfinite exponentiation only implemented under GCH"))))) 

(SDEFUN |CARD;finite?;$B;13| ((|x| $) ($ |Boolean|)) (EQL (QCAR |x|) -1)) 

(SDEFUN |CARD;countable?;$B;14| ((|x| $) ($ |Boolean|)) (< (QCAR |x|) 1)) 

(SDEFUN |CARD;retract;$Nni;15| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G166 NIL))
               (COND
                ((SPADCALL |x| (QREFELT $ 24))
                 (PROG1 (LETT #1# (QCDR |x|) |CARD;retract;$Nni;15|)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))
                ('T (|error| "Not finite"))))) 

(SDEFUN |CARD;retractIfCan;$U;16|
        ((|x| $) ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((#1=#:G172 NIL))
               (COND
                ((SPADCALL |x| (QREFELT $ 24))
                 (CONS 0
                       (PROG1 (LETT #1# (QCDR |x|) |CARD;retractIfCan;$U;16|)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |CARD;generalizedContinuumHypothesisAssumed?;B;17| (($ |Boolean|))
        (SPADCALL (QREFELT $ 10) (QREFELT $ 36))) 

(SDEFUN |CARD;generalizedContinuumHypothesisAssumed;2B;18|
        ((|b| |Boolean|) ($ |Boolean|))
        (SPADCALL (QREFELT $ 10) |b| (QREFELT $ 43))) 

(DECLAIM (NOTINLINE |CardinalNumber;|)) 

(DEFUN |CardinalNumber| ()
  (SPROG NIL
         (PROG (#1=#:G181)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CardinalNumber|)
                    . #2=(|CardinalNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CardinalNumber|
                             (LIST (CONS NIL (CONS 1 (|CardinalNumber;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CardinalNumber|)))))))))) 

(DEFUN |CardinalNumber;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CardinalNumber|) . #1=(|CardinalNumber|))
          (LETT $ (GETREFV 49) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CardinalNumber| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |order| (|Integer|))
                              (|:| |ival| (|Integer|))))
          (QSETREFV $ 10 (SPADCALL 'NIL (QREFELT $ 9)))
          (QSETREFV $ 16 "Aleph")
          $))) 

(MAKEPROP '|CardinalNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|Reference| 7)
              (0 . |ref|) '|GCHypothesis|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;One;$;2|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;Zero;$;1|) $))
              (|NonNegativeInteger|) |CARD;coerce;Nni$;3| |CARD;Aleph;Nni$;4|
              '|ALEPHexpr| (|OutputForm|) (|Integer|) (5 . |coerce|) (|List| $)
              (10 . |prefix|) |CARD;coerce;$Of;5| (16 . ~=)
              |CARD;finite?;$B;13| |CARD;=;2$B;6| (22 . >) |CARD;<;2$B;7|
              (28 . |max|) |CARD;+;3$;8| (34 . >) (|Union| $ '"failed")
              |CARD;-;2$U;9| |CARD;*;3$;10| (40 . *) |CARD;*;Nni2$;11|
              (46 . |elt|) |CARD;^;3$;12| |CARD;countable?;$B;14|
              |CARD;retract;$Nni;15| (|Union| 13 '"failed")
              |CARD;retractIfCan;$U;16|
              |CARD;generalizedContinuumHypothesisAssumed?;B;17|
              (51 . |setelt!|)
              |CARD;generalizedContinuumHypothesisAssumed;2B;18|
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 57 |zero?| 63 |smaller?| 68 |sample| 74 |retractIfCan| 78
              |retract| 83 |recip| 88 |opposite?| 93 |one?| 99 |min| 104 |max|
              110 |latex| 116 |hashUpdate!| 121 |hash| 127
              |generalizedContinuumHypothesisAssumed?| 132
              |generalizedContinuumHypothesisAssumed| 136 |finite?| 141
              |countable?| 146 |coerce| 151 ^ 161 |Zero| 179 |One| 183 |Aleph|
              187 >= 192 > 198 = 204 <= 210 < 216 - 222 + 228 * 234)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| |Monoid&| |AbelianMonoid&| NIL |SemiGroup&|
                     |AbelianSemiGroup&| |SetCategory&| NIL |RetractableTo&|
                     |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Monoid|) (|AbelianMonoid|)
                      (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 13)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 17))
                   (|makeByteWordVec2| 48
                                       '(1 8 0 7 9 1 18 17 0 19 2 17 0 0 20 21
                                         2 18 7 0 0 23 2 18 7 0 0 26 2 0 0 0 0
                                         28 2 0 7 0 0 30 2 18 0 13 0 34 1 8 7 0
                                         36 2 8 7 0 7 43 2 0 7 0 0 1 1 0 7 0 1
                                         2 0 7 0 0 1 0 0 0 1 1 0 40 0 41 1 0 13
                                         0 39 1 0 31 0 1 2 0 7 0 0 1 1 0 7 0 1
                                         2 0 0 0 0 1 2 0 0 0 0 28 1 0 46 0 1 2
                                         0 48 48 0 1 1 0 47 0 1 0 0 7 42 1 0 7
                                         7 44 1 0 7 0 24 1 0 7 0 38 1 0 0 13 14
                                         1 0 17 0 22 2 0 0 0 0 37 2 0 0 0 45 1
                                         2 0 0 0 13 1 0 0 0 12 0 0 0 11 1 0 0
                                         13 15 2 0 7 0 0 1 2 0 7 0 0 30 2 0 7 0
                                         0 25 2 0 7 0 0 1 2 0 7 0 0 27 2 0 31 0
                                         0 32 2 0 0 0 0 29 2 0 0 0 0 33 2 0 0
                                         45 0 1 2 0 0 13 0 35)))))
           '|lookupComplete|)) 

(MAKEPROP '|CardinalNumber| 'NILADIC T) 
