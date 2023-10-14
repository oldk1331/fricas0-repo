
(/VERSIONCHECK 2) 

(DEFUN |CCLASS;digit;$;1| ($) (SPADCALL "0123456789" (QREFELT $ 9))) 

(DEFUN |CCLASS;hexDigit;$;2| ($)
  (SPADCALL "0123456789abcdefABCDEF" (QREFELT $ 9))) 

(DEFUN |CCLASS;upperCase;$;3| ($)
  (SPADCALL "ABCDEFGHIJKLMNOPQRSTUVWXYZ" (QREFELT $ 9))) 

(DEFUN |CCLASS;lowerCase;$;4| ($)
  (SPADCALL "abcdefghijklmnopqrstuvwxyz" (QREFELT $ 9))) 

(DEFUN |CCLASS;alphabetic;$;5| ($)
  (SPADCALL (|spadConstant| $ 12) (|spadConstant| $ 13) (QREFELT $ 14))) 

(DEFUN |CCLASS;alphanumeric;$;6| ($)
  (SPADCALL (|spadConstant| $ 15) (|spadConstant| $ 10) (QREFELT $ 14))) 

(DEFUN |CCLASS;=;2$B;7| (|a| |b| $) (SPADCALL |a| |b| (QREFELT $ 18))) 

(DEFUN |CCLASS;member?;C$B;8| (|c| |a| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| |c| |CCLASS;member?;C$B;8|)
          (EXIT
           (COND ((< |i| (QREFELT $ 7)) (SPADCALL |a| |i| (QREFELT $ 21)))
                 ('T 'NIL))))))) 

(DEFUN |CCLASS;union;3$;9| (|a| |b| $) (SPADCALL |a| |b| (QREFELT $ 24))) 

(DEFUN |CCLASS;intersect;3$;10| (|a| |b| $) (SPADCALL |a| |b| (QREFELT $ 25))) 

(DEFUN |CCLASS;difference;3$;11| (|a| |b| $)
  (SPADCALL |a| (SPADCALL |b| (QREFELT $ 27)) (QREFELT $ 25))) 

(DEFUN |CCLASS;complement;2$;12| (|a| $) (SPADCALL |a| (QREFELT $ 27))) 

(DEFUN |CCLASS;convert;$S;13| (|cl| $)
  (SPADCALL (SPADCALL |cl| (QREFELT $ 31)) (QREFELT $ 32))) 

(DEFUN |CCLASS;convert;$L;14| (|cl| $)
  (PROG (#1=#:G144 |i| #2=#:G143)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|CCLASS;convert;$L;14|))
       (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 7) 1) . #3#) G190
            (COND ((|greater_SI| |i| #1#) (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL |cl| |i| (QREFELT $ 21))
                (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 34)) #2#) . #3#)))))
            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |CCLASS;charClass;S$;15| (|s| $)
  (PROG (|j| #1=#:G149 |i| |cl|)
    (RETURN
     (SEQ
      (LETT |cl| (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 36))
            . #2=(|CCLASS;charClass;S$;15|))
      (SEQ (LETT |i| (SPADCALL |s| (QREFELT $ 37)) . #2#)
           (LETT #1# (SPADCALL |s| (QREFELT $ 38)) . #2#) G190
           (COND ((> |i| #1#) (GO G191)))
           (SEQ (LETT |j| (SPADCALL |s| |i| (QREFELT $ 39)) . #2#)
                (EXIT
                 (COND
                  ((>= |j| (QREFELT $ 7)) (|error| "character code too large"))
                  ('T (SPADCALL |cl| |j| 'T (QREFELT $ 40))))))
           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |cl|))))) 

(DEFUN |CCLASS;charClass;L$;16| (|l| $)
  (PROG (|j| #1=#:G154 |c| |cl|)
    (RETURN
     (SEQ
      (LETT |cl| (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 36))
            . #2=(|CCLASS;charClass;L$;16|))
      (SEQ (LETT |c| NIL . #2#) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (LETT |j| |c| . #2#)
                (EXIT
                 (COND
                  ((>= |j| (QREFELT $ 7)) (|error| "character code too large"))
                  ('T (SPADCALL |cl| |j| 'T (QREFELT $ 40))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |cl|))))) 

(DEFUN |CCLASS;coerce;$Of;17| (|cl| $)
  (SPADCALL (SPADCALL |cl| (QREFELT $ 33)) (QREFELT $ 43))) 

(DEFUN |CCLASS;#;$Nni;18| (|a| $)
  (PROG (|n| #1=#:G159 |i|)
    (RETURN
     (SEQ (LETT |n| 0 . #2=(|CCLASS;#;$Nni;18|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 7) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |a| |i| (QREFELT $ 21))
                   (LETT |n| (+ |n| 1) . #2#)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |n|))))) 

(DEFUN |CCLASS;empty;$;19| ($) (SPADCALL NIL (QREFELT $ 41))) 

(DEFUN |CCLASS;brace;$;20| ($) (SPADCALL NIL (QREFELT $ 41))) 

(DEFUN |CCLASS;insert!;C2$;21| (|c| |a| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| |c| |CCLASS;insert!;C2$;21|)
          (EXIT
           (COND
            ((< |i| (QREFELT $ 7))
             (SEQ (SPADCALL |a| |i| 'T (QREFELT $ 40)) (EXIT |a|)))
            ('T (|error| "character code too large")))))))) 

(DEFUN |CCLASS;remove!;C2$;22| (|c| |a| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| |c| |CCLASS;remove!;C2$;22|)
           (EXIT
            (COND
             ((< |i| (QREFELT $ 7)) (SPADCALL |a| |i| 'NIL (QREFELT $ 40))))))
      (EXIT |a|))))) 

(DEFUN |CCLASS;inspect;$C;23| (|a| $)
  (PROG (#1=#:G170 #2=#:G171 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #3=(|CCLASS;inspect;$C;23|))
             (LETT #2# (- (QREFELT $ 7) 1) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |a| |i| (QREFELT $ 21))
                 (PROGN
                  (LETT #1# (SPADCALL |i| (QREFELT $ 34)) . #3#)
                  (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (|error| "Cannot take a character from an empty class."))))
      #1# (EXIT #1#))))) 

(DEFUN |CCLASS;extract!;$C;24| (|a| $)
  (PROG (#1=#:G175 #2=#:G176 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #3=(|CCLASS;extract!;$C;24|))
             (LETT #2# (- (QREFELT $ 7) 1) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |a| |i| (QREFELT $ 21))
                 (SEQ (SPADCALL |a| |i| 'NIL (QREFELT $ 40))
                      (EXIT
                       (PROGN
                        (LETT #1# (SPADCALL |i| (QREFELT $ 34)) . #3#)
                        (GO #1#))))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (|error| "Cannot take a character from an empty class."))))
      #1# (EXIT #1#))))) 

(DEFUN |CCLASS;map;M2$;25| (|f| |a| $)
  (PROG (#1=#:G181 |i| |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 36))
            . #2=(|CCLASS;map;M2$;25|))
      (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 7) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |a| |i| (QREFELT $ 21))
               (SPADCALL |b| (SPADCALL (SPADCALL |i| (QREFELT $ 34)) |f|) 'T
                         (QREFELT $ 40))))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |b|))))) 

(DEFUN |CCLASS;map!;M2$;26| (|f| |a| $)
  (PROG (#1=#:G185 |i|)
    (RETURN
     (SEQ (SPADCALL (QREFELT $ 54) 'NIL (QREFELT $ 55))
          (SEQ (LETT |i| 0 . #2=(|CCLASS;map!;M2$;26|))
               (LETT #1# (- (QREFELT $ 7) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |a| |i| (QREFELT $ 21))
                   (SPADCALL (QREFELT $ 54)
                             (SPADCALL (SPADCALL |i| (QREFELT $ 34)) |f|) 'T
                             (QREFELT $ 40))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |a| (QREFELT $ 54) 0 (QREFELT $ 56))))))) 

(DEFUN |CCLASS;parts;$L;27| (|a| $)
  (PROG (#1=#:G189 |i| #2=#:G188)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|CCLASS;parts;$L;27|))
       (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 7) 1) . #3#) G190
            (COND ((|greater_SI| |i| #1#) (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL |a| |i| (QREFELT $ 21))
                (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 34)) #2#) . #3#)))))
            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |CharacterClass;|)) 

(DEFUN |CharacterClass| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G198)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|CharacterClass|)
                . #2=(|CharacterClass|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|CharacterClass|
                         (LIST (CONS NIL (CONS 1 (|CharacterClass;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|CharacterClass|))))))))))) 

(DEFUN |CharacterClass;| ()
  (PROG (|dv$| $ #1=#:G195 |pv$| #2=#:G196)
    (RETURN
     (PROGN
      (LETT |dv$| '(|CharacterClass|) . #3=(|CharacterClass|))
      (LETT $ (GETREFV 69) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Character|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Character|)
                                                         '(|Finite|))
                                          (|HasCategory| (|Character|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (AND
                                                 (|HasCategory| (|Character|)
                                                                '(|Evalable|
                                                                  (|Character|)))
                                                 (|HasCategory| (|Character|)
                                                                '(|SetCategory|)))
                                                . #3#)
                                          (OR
                                           (AND
                                            (|HasCategory| (|Character|)
                                                           '(|Evalable|
                                                             (|Character|)))
                                            (|HasCategory| (|Character|)
                                                           '(|Finite|)))
                                           #1#)
                                          (|HasCategory| (|Character|)
                                                         '(|BasicType|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|CharacterClass| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #3#)
           (|augmentPredVector| $ 128))
      (AND #2# (|HasCategory| (|Character|) '(|BasicType|))
           (|augmentPredVector| $ 256))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|IndexedBits| 0))
      (QSETREFV $ 7 256)
      (QSETREFV $ 54 (SPADCALL (QREFELT $ 7) 'NIL (QREFELT $ 36)))
      $)))) 

(MAKEPROP '|CharacterClass| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'N (|String|)
              |CCLASS;charClass;S$;15|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CCLASS;digit;$;1|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CCLASS;hexDigit;$;2|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CCLASS;upperCase;$;3|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CCLASS;lowerCase;$;4|) $))
              |CCLASS;union;3$;9|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CCLASS;alphabetic;$;5|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CCLASS;alphanumeric;$;6|) $))
              (|Boolean|) (0 . =) |CCLASS;=;2$B;7| (|Integer|) (6 . |elt|)
              (|Character|) |CCLASS;member?;C$B;8| (12 . |Or|) (18 . |And|)
              |CCLASS;intersect;3$;10| (24 . |Not|) |CCLASS;difference;3$;11|
              |CCLASS;complement;2$;12| (|List| 22) |CCLASS;convert;$L;14|
              (29 . |construct|) |CCLASS;convert;$S;13| (34 . |char|)
              (|NonNegativeInteger|) (39 . |new|) (45 . |minIndex|)
              (50 . |maxIndex|) (55 . |elt|) (61 . |setelt|)
              |CCLASS;charClass;L$;16| (|OutputForm|) (68 . |coerce|)
              |CCLASS;coerce;$Of;17| |CCLASS;#;$Nni;18| |CCLASS;empty;$;19|
              |CCLASS;brace;$;20| |CCLASS;insert!;C2$;21|
              |CCLASS;remove!;C2$;22| |CCLASS;inspect;$C;23|
              |CCLASS;extract!;$C;24| (|Mapping| 22 22) |CCLASS;map;M2$;25|
              '|temp| (73 . |fill!|) (79 . |copyInto!|) |CCLASS;map!;M2$;26|
              |CCLASS;parts;$L;27| (|List| 60) (|Equation| 22)
              (|Mapping| 22 22 22) (|InputForm|) (|List| $) (|PositiveInteger|)
              (|Mapping| 17 22) (|Union| 22 '"failed") (|SingleInteger|)
              (|HashState|))
           '#(~= 86 |upperCase| 92 |universe| 96 |union| 100
              |symmetricDifference| 118 |subset?| 124 |size?| 130 |size| 136
              |set| 140 |select!| 149 |select| 155 |sample| 161
              |removeDuplicates| 165 |remove!| 170 |remove| 182 |reduce| 194
              |random| 215 |parts| 219 |more?| 224 |min| 230 |members| 235
              |member?| 240 |max| 246 |map!| 251 |map| 257 |lowerCase| 263
              |lookup| 267 |less?| 272 |latex| 278 |intersect| 283 |inspect|
              289 |insert!| 294 |index| 300 |hexDigit| 305 |hashUpdate!| 309
              |hash| 315 |find| 320 |extract!| 326 |every?| 331 |eval| 337
              |eq?| 363 |enumerate| 369 |empty?| 373 |empty| 378 |digit| 382
              |difference| 386 |dictionary| 398 |count| 407 |copy| 419
              |convert| 424 |construct| 439 |complement| 444 |coerce| 449
              |charClass| 454 |cardinality| 464 |brace| 469 |bag| 478 |any?|
              483 |alphanumeric| 489 |alphabetic| 493 >= 497 > 503 = 509 <= 515
              < 521 |#| 527)
           'NIL
           (CONS
            (|makeByteWordVec2| 5 '(0 0 0 0 0 0 0 2 0 0 5 0 0 0 0 0 0 0 0 5 1))
            (CONS
             '#(|FiniteSetAggregate&| |Dictionary&| |SetAggregate&|
                |DictionaryOperations&| |Collection&| |BagAggregate&|
                |HomogeneousAggregate&| |Finite&| |SetCategory&| |Aggregate&|
                |Evalable&| NIL NIL |PartialOrder&| |BasicType&| NIL NIL NIL
                NIL |InnerEvalable&| NIL)
             (CONS
              '#((|FiniteSetAggregate| 22) (|Dictionary| 22)
                 (|SetAggregate| 22) (|DictionaryOperations| 22)
                 (|Collection| 22) (|BagAggregate| 22)
                 (|HomogeneousAggregate| 22) (|Finite|) (|SetCategory|)
                 (|Aggregate|) (|Evalable| 22) (|ConvertibleTo| 30)
                 (|finiteAggregate|) (|PartialOrder|) (|BasicType|)
                 (|shallowlyMutable|) (|Type|) (|ConvertibleTo| 8)
                 (|CoercibleTo| 42) (|InnerEvalable| 22 22)
                 (|ConvertibleTo| 62))
              (|makeByteWordVec2| 68
                                  '(2 6 17 0 0 18 2 6 17 0 20 21 2 6 0 0 0 24 2
                                    6 0 0 0 25 1 6 0 0 27 1 8 0 30 32 1 22 0 20
                                    34 2 6 0 35 17 36 1 8 20 0 37 1 8 20 0 38 2
                                    8 22 0 20 39 3 6 17 0 20 17 40 1 8 42 0 43
                                    2 6 0 0 17 55 3 6 0 0 0 20 56 2 0 17 0 0 1
                                    0 0 0 12 0 2 0 1 2 0 0 0 22 1 2 0 0 22 0 1
                                    2 0 0 0 0 14 2 0 0 0 0 1 2 0 17 0 0 1 2 0
                                    17 0 35 1 0 2 35 1 0 0 0 1 1 0 0 30 1 2 8 0
                                    65 0 1 2 8 0 65 0 1 0 0 0 1 1 9 0 0 1 2 9 0
                                    22 0 49 2 8 0 65 0 1 2 9 0 22 0 1 2 8 0 65
                                    0 1 4 9 22 61 0 22 22 1 3 8 22 61 0 22 1 2
                                    8 22 61 0 1 0 2 0 1 1 8 30 0 58 2 0 17 0 35
                                    1 1 3 22 0 1 1 8 30 0 1 2 9 17 22 0 23 1 3
                                    22 0 1 2 7 0 52 0 57 2 0 0 52 0 53 0 0 0 13
                                    1 2 64 0 1 2 0 17 0 35 1 1 0 8 0 1 2 0 0 0
                                    0 26 1 0 22 0 50 2 0 0 22 0 48 1 2 0 64 1 0
                                    0 0 11 2 0 68 68 0 1 1 0 67 0 1 2 0 66 65 0
                                    1 1 0 22 0 51 2 8 17 65 0 1 2 4 0 0 59 1 3
                                    4 0 0 22 22 1 2 4 0 0 60 1 3 4 0 0 30 30 1
                                    2 0 17 0 0 1 0 2 63 1 1 0 17 0 1 0 0 0 46 0
                                    0 0 10 2 0 0 0 0 28 2 0 0 0 22 1 1 0 0 30 1
                                    0 0 0 1 2 9 35 22 0 1 2 8 35 65 0 1 1 0 0 0
                                    1 1 1 62 0 1 1 0 30 0 31 1 0 8 0 33 1 0 0
                                    30 1 1 2 0 0 29 1 0 42 0 44 1 0 0 30 41 1 0
                                    0 8 9 1 0 35 0 1 1 0 0 30 1 0 0 0 47 1 0 0
                                    30 1 2 8 17 65 0 1 0 0 0 16 0 0 0 15 2 0 17
                                    0 0 1 2 0 17 0 0 1 2 0 17 0 0 19 2 0 17 0 0
                                    1 2 0 17 0 0 1 1 8 35 0 45)))))
           '|lookupComplete|)) 

(MAKEPROP '|CharacterClass| 'NILADIC T) 
