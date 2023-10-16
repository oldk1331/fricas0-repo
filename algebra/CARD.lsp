
(PUT '|CARD;Zero;$;1| '|SPADreplace| '(XLAM NIL (CONS -1 0))) 

(SDEFUN |CARD;Zero;$;1| (($ $)) (CONS -1 0)) 

(PUT '|CARD;One;$;2| '|SPADreplace| '(XLAM NIL (CONS -1 1))) 

(SDEFUN |CARD;One;$;2| (($ $)) (CONS -1 1)) 

(PUT '|CARD;coerce;Nni$;3| '|SPADreplace| '(XLAM (|n|) (CONS -1 |n|))) 

(SDEFUN |CARD;coerce;Nni$;3| ((|n| |NonNegativeInteger|) ($ $)) (CONS -1 |n|)) 

(PUT '|CARD;Aleph;Nni$;4| '|SPADreplace| '(XLAM (|n|) (CONS |n| -1))) 

(SDEFUN |CARD;Aleph;Nni$;4| ((|n| |NonNegativeInteger|) ($ $)) (CONS |n| -1)) 

(SDEFUN |CARD;coerce;$Of;5| ((|x| $) ($ |OutputForm|))
        (COND ((EQL (QCAR |x|) -1) (SPADCALL (QCDR |x|) (QREFELT $ 21)))
              ('T
               (SPADCALL (QREFELT $ 19)
                         (LIST (SPADCALL (QCAR |x|) (QREFELT $ 21)))
                         (QREFELT $ 23))))) 

(SDEFUN |CARD;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 25)) NIL)
              ((SPADCALL |x| (QREFELT $ 26)) (EQL (QCDR |x|) (QCDR |y|)))
              ('T 'T))) 

(SDEFUN |CARD;<;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((< (QCAR |x|) (QCAR |y|)) 'T)
              ((OR (> (QCAR |x|) (QCAR |y|))
                   (NULL (SPADCALL |x| (QREFELT $ 26))))
               NIL)
              ('T (< (QCDR |x|) (QCDR |y|))))) 

(SDEFUN |CARD;+;3$;8| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 26))
           (COND
            ((SPADCALL |y| (QREFELT $ 26))
             (EXIT (CONS -1 (+ (QCDR |x|) (QCDR |y|))))))))
         (EXIT (SPADCALL |x| |y| (QREFELT $ 29))))) 

(SDEFUN |CARD;-;2$U;9| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL |x| |y| (QREFELT $ 28)) (CONS 1 "failed"))
              ((SPADCALL |x| (QREFELT $ 26))
               (CONS 0 (CONS -1 (- (QCDR |x|) (QCDR |y|)))))
              ((SPADCALL |x| |y| (QREFELT $ 31)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |CARD;*;3$;10| ((|x| $) (|y| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 26))
           (COND
            ((SPADCALL |y| (QREFELT $ 26))
             (EXIT (CONS -1 (* (QCDR |x|) (QCDR |y|))))))))
         (COND
          ((OR (SPADCALL |x| (|spadConstant| $ 12) (QREFELT $ 27))
               (SPADCALL |y| (|spadConstant| $ 12) (QREFELT $ 27)))
           (EXIT (|spadConstant| $ 12))))
         (EXIT (SPADCALL |x| |y| (QREFELT $ 29))))) 

(SDEFUN |CARD;*;Nni2$;11| ((|n| |NonNegativeInteger|) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 26)) (CONS -1 (* |n| (QCDR |x|))))
              ((EQL |n| 0) (|spadConstant| $ 12)) ('T |x|))) 

(SDEFUN |CARD;^;3$;12| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G157 NIL))
               (COND
                ((SPADCALL |y| (|spadConstant| $ 12) (QREFELT $ 27))
                 (|spadConstant| $ 11))
                ((SPADCALL |y| (QREFELT $ 26))
                 (COND ((NULL (SPADCALL |x| (QREFELT $ 26))) |x|)
                       ('T
                        (CONS -1
                              (EXPT (QCDR |x|)
                                    (PROG1 (LETT #1# (QCDR |y|))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#)))))))
                ((SPADCALL |x| (|spadConstant| $ 12) (QREFELT $ 27))
                 (|spadConstant| $ 12))
                ((SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 27))
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
                ((SPADCALL |x| (QREFELT $ 26))
                 (PROG1 (LETT #1# (QCDR |x|))
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))
                ('T (|error| "Not finite"))))) 

(SDEFUN |CARD;retractIfCan;$U;16|
        ((|x| $) ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((#1=#:G172 NIL))
               (COND
                ((SPADCALL |x| (QREFELT $ 26))
                 (CONS 0
                       (PROG1 (LETT #1# (QCDR |x|))
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
             ((LETT #1# (HGET |$ConstructorCache| '|CardinalNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CardinalNumber|
                             (LIST (CONS NIL (CONS 1 (|CardinalNumber;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CardinalNumber|)))))))))) 

(DEFUN |CardinalNumber;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CardinalNumber|))
          (LETT $ (GETREFV 49))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CardinalNumber| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |order| (|Integer|))
                              (|:| |ival| (|Integer|))))
          (QSETREFV $ 10 (SPADCALL NIL (QREFELT $ 9)))
          (QSETREFV $ 19 (SPADCALL '|Aleph| (QREFELT $ 18)))
          $))) 

(MAKEPROP '|CardinalNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|Reference| 7)
              (0 . |ref|) '|GCHypothesis|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;One;$;2|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;Zero;$;1|) $))
              (|NonNegativeInteger|) |CARD;coerce;Nni$;3| |CARD;Aleph;Nni$;4|
              (|OutputForm|) (|Symbol|) (5 . |coerce|) '|ALEPHexpr| (|Integer|)
              (10 . |coerce|) (|List| $) (15 . |prefix|) |CARD;coerce;$Of;5|
              (21 . ~=) |CARD;finite?;$B;13| |CARD;=;2$B;6| |CARD;<;2$B;7|
              (27 . |max|) |CARD;+;3$;8| (33 . >) (|Union| $ '"failed")
              |CARD;-;2$U;9| |CARD;*;3$;10| |CARD;*;Nni2$;11| (39 . |elt|)
              |CARD;^;3$;12| |CARD;countable?;$B;14| |CARD;retract;$Nni;15|
              (|Union| 13 '"failed") |CARD;retractIfCan;$U;16|
              |CARD;generalizedContinuumHypothesisAssumed?;B;17|
              (44 . |setelt!|)
              |CARD;generalizedContinuumHypothesisAssumed;2B;18|
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 50 |zero?| 56 |smaller?| 61 |sample| 67 |rightRecip| 71
              |rightPower| 76 |retractIfCan| 88 |retract| 93 |recip| 98
              |opposite?| 103 |one?| 109 |min| 114 |max| 120 |leftRecip| 126
              |leftPower| 131 |latex| 143 |hashUpdate!| 148 |hash| 154
              |generalizedContinuumHypothesisAssumed?| 159
              |generalizedContinuumHypothesisAssumed| 163 |finite?| 168
              |countable?| 173 |coerce| 178 ^ 188 |Zero| 206 |One| 210 |Aleph|
              214 >= 219 > 225 = 231 <= 237 < 243 - 249 + 255 * 261)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| |MagmaWithUnit&| NIL |AbelianMonoid&|
                     NIL |Magma&| |AbelianSemiGroup&| NIL |SetCategory&| NIL
                     |RetractableTo&| |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|Monoid|) (|OrderedSet|) (|MagmaWithUnit|) (|SemiGroup|)
                      (|AbelianMonoid|) (|Comparable|) (|Magma|)
                      (|AbelianSemiGroup|) (|CommutativeStar|) (|SetCategory|)
                      (|TwoSidedRecip|) (|RetractableTo| 13) (|BasicType|)
                      (|PartialOrder|) (|CoercibleTo| 16))
                   (|makeByteWordVec2| 48
                                       '(1 8 0 7 9 1 17 16 0 18 1 20 16 0 21 2
                                         16 0 0 22 23 2 20 7 0 0 25 2 0 0 0 0
                                         29 2 0 7 0 0 31 1 8 7 0 36 2 8 7 0 7
                                         43 2 0 7 0 0 1 1 0 7 0 1 2 0 7 0 0 1 0
                                         0 0 1 1 0 32 0 1 2 0 0 0 45 1 2 0 0 0
                                         13 1 1 0 40 0 41 1 0 13 0 39 1 0 32 0
                                         1 2 0 7 0 0 1 1 0 7 0 1 2 0 0 0 0 1 2
                                         0 0 0 0 29 1 0 32 0 1 2 0 0 0 45 1 2 0
                                         0 0 13 1 1 0 46 0 1 2 0 48 48 0 1 1 0
                                         47 0 1 0 0 7 42 1 0 7 7 44 1 0 7 0 26
                                         1 0 7 0 38 1 0 0 13 14 1 0 16 0 24 2 0
                                         0 0 0 37 2 0 0 0 45 1 2 0 0 0 13 1 0 0
                                         0 12 0 0 0 11 1 0 0 13 15 2 0 7 0 0 1
                                         2 0 7 0 0 31 2 0 7 0 0 27 2 0 7 0 0 1
                                         2 0 7 0 0 28 2 0 32 0 0 33 2 0 0 0 0
                                         30 2 0 0 0 0 34 2 0 0 45 0 1 2 0 0 13
                                         0 35)))))
           '|lookupComplete|)) 

(MAKEPROP '|CardinalNumber| 'NILADIC T) 
