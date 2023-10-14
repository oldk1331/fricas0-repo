
(SDEFUN |LMDICT;coerce;$Of;1| ((|s| $) ($ |OutputForm|))
        (SPROG ((#1=#:G125 NIL) (|x| NIL) (#2=#:G124 NIL))
               (SEQ
                (SPADCALL "dictionary"
                          (PROGN
                           (LETT #2# NIL . #3=(|LMDICT;coerce;$Of;1|))
                           (SEQ (LETT |x| NIL . #3#)
                                (LETT #1# (SPADCALL |s| (QREFELT $ 9)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |x| (QREFELT $ 11))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 13))))) 

(SDEFUN |LMDICT;#;$Nni;2| ((|s| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |s| (QREFELT $ 9)))) 

(SDEFUN |LMDICT;copy;2$;3| ((|s| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 17))
                  (QREFELT $ 18))) 

(SDEFUN |LMDICT;empty?;$B;4| ((|s| $) ($ |Boolean|))
        (NULL (SPADCALL |s| (QREFELT $ 9)))) 

(SDEFUN |LMDICT;dictionary;$;5| (($ $)) (SPADCALL NIL (QREFELT $ 18))) 

(SDEFUN |LMDICT;empty;$;6| (($ $)) (SPADCALL NIL (QREFELT $ 23))) 

(SDEFUN |LMDICT;dictionary;L$;7| ((|ls| |List| S) ($ $))
        (SPROG ((#1=#:G135 NIL) (|x| NIL) (|lmd| ($)))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT $ 24)))
                      ('T
                       (SEQ
                        (LETT |lmd| (SPADCALL (QREFELT $ 24))
                              . #2=(|LMDICT;dictionary;L$;7|))
                        (SEQ (LETT |x| NIL . #2#) (LETT #1# |ls| . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |x| |lmd| (QREFELT $ 25))))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |lmd|))))))) 

(SDEFUN |LMDICT;convert;$If;8| ((|lmd| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|dictionary| (QREFELT $ 28))
               (SPADCALL (SPADCALL |lmd| (QREFELT $ 9)) (QREFELT $ 29)))
         (QREFELT $ 30))) 

(SDEFUN |LMDICT;map;M2$;9| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 33))
                  (QREFELT $ 18))) 

(SDEFUN |LMDICT;map!;M2$;10| ((|f| |Mapping| S S) (|s| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 35))
                  (QREFELT $ 18))) 

(SDEFUN |LMDICT;parts;$L;11| ((|s| $) ($ |List| S))
        (SPADCALL |s| (QREFELT $ 37))) 

(SDEFUN |LMDICT;sub| ((|x| S) (|y| S) (|z| S) ($ S))
        (COND ((SPADCALL |z| |x| (QREFELT $ 38)) |y|) ('T |z|))) 

(SDEFUN |LMDICT;insert!;S$Nni$;13|
        ((|x| S) (|s| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #1=(|LMDICT;insert!;S$Nni$;13|)) G190
                     (COND ((|greater_SI| |i| |n|) (GO G191)))
                     (SEQ (EXIT (SPADCALL |x| |s| (QREFELT $ 25))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |LMDICT;substitute;2S2$;14| ((|x| S) (|y| S) (|s| $) ($ $))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|LMDICT;substitute;2S2$;14!0| (VECTOR $ |y| |x|))
                 (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 33))
                (QREFELT $ 18)))) 

(SDEFUN |LMDICT;substitute;2S2$;14!0| ((|z1| NIL) ($$ NIL))
        (PROG (|x| |y| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|LMDICT;substitute;2S2$;14|))
          (LETT |y| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|LMDICT;sub| |x| |y| |z1| $))))) 

(SDEFUN |LMDICT;removeDuplicates!;2$;15| ((|s| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 41))
                  (QREFELT $ 18))) 

(SDEFUN |LMDICT;inspect;$S;16| ((|s| $) ($ S))
        (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "empty dictionary"))
              ('T (|SPADfirst| (SPADCALL |s| (QREFELT $ 9)))))) 

(SDEFUN |LMDICT;extract!;$S;17| ((|s| $) ($ S))
        (SPROG ((|x| (S)) (|p| (|List| S)))
               (SEQ
                (COND
                 ((SPADCALL |s| (QREFELT $ 21)) (|error| "empty dictionary"))
                 ('T
                  (SEQ
                   (LETT |x|
                         (|SPADfirst|
                          (LETT |p| (SPADCALL |s| (QREFELT $ 9))
                                . #1=(|LMDICT;extract!;$S;17|)))
                         . #1#)
                   (SPADCALL |s| (CDR |p|) (QREFELT $ 44)) (EXIT |x|))))))) 

(SDEFUN |LMDICT;duplicates?;$B;18| ((|s| $) ($ |Boolean|))
        (SPROG ((|q| (|List| S)) (|p| (|List| S)) (#1=#:G161 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (LETT |p| (SPADCALL |s| (QREFELT $ 9))
                          . #2=(|LMDICT;duplicates?;$B;18|)))
                   'NIL)
                  ('T
                   (SEQ (LETT |q| (CDR |p|) . #2#)
                        (SEQ G190
                             (COND
                              ((NULL (COND ((NULL |q|) 'NIL) ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (|SPADfirst| |p|) (|SPADfirst| |q|)
                                           (QREFELT $ 38))
                                 (PROGN (LETT #1# 'T . #2#) (GO #3=#:G160)))
                                ('T
                                 (SEQ (LETT |p| |q| . #2#)
                                      (EXIT (LETT |q| (CDR |q|) . #2#)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT 'NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |LMDICT;remove!;M2$;19| ((|p| |Mapping| (|Boolean|) S) (|lmd| $) ($ $))
        (SPROG ((#1=#:G166 NIL) (|x| NIL))
               (SEQ
                (SEQ (LETT |x| NIL . #2=(|LMDICT;remove!;M2$;19|))
                     (LETT #1#
                           (SPADCALL (SPADCALL |lmd| (QREFELT $ 9))
                                     (QREFELT $ 47))
                           . #2#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| |p|)
                         (SPADCALL |x| |lmd| (QREFELT $ 48))))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |lmd|)))) 

(SDEFUN |LMDICT;select!;M2$;20| ((|p| |Mapping| (|Boolean|) S) (|lmd| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|LMDICT;select!;M2$;20!0| (VECTOR $ |p|))
                         |lmd| (QREFELT $ 50)))) 

(SDEFUN |LMDICT;select!;M2$;20!0| ((|z1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|LMDICT;select!;M2$;20|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |z1| |p|) (|spadConstant| $ 51))
                  ('T (|spadConstant| $ 52))))))) 

(SDEFUN |LMDICT;duplicates;$L;21|
        ((|lmd| $)
         ($ |List|
          (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
        (SPROG
         ((|ld|
           (|List|
            (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
          (|n| (|NonNegativeInteger|)) (#1=#:G180 NIL) (|x| NIL))
         (SEQ (LETT |ld| NIL . #2=(|LMDICT;duplicates;$L;21|))
              (SEQ (LETT |x| NIL . #2#)
                   (LETT #1#
                         (SPADCALL (SPADCALL |lmd| (QREFELT $ 9))
                                   (QREFELT $ 47))
                         . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |n| (SPADCALL |x| |lmd| (QREFELT $ 54)) . #2#) 1
                        (QREFELT $ 55))
                       (LETT |ld| (CONS (CONS |x| |n|) |ld|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ld|)))) 

(SDEFUN |LMDICT;=;2$B;22| ((|s| $) (|t| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (SPADCALL |t| (QREFELT $ 9))
                  (QREFELT $ 59))) 

(SDEFUN |LMDICT;remove!;S2$;23| ((|x| S) (|s| $) ($ $))
        (SPROG ((|q| (|List| S)) (|p| (|List| S)))
               (SEQ
                (LETT |p| (SPADCALL |s| (QREFELT $ 37))
                      . #1=(|LMDICT;remove!;S2$;23|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |p|) 'NIL)
                              ('T
                               (SPADCALL |x| (|SPADfirst| |p|)
                                         (QREFELT $ 38)))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |p| (CDR |p|) . #1#))) NIL (GO G190) G191
                     (EXIT NIL))
                (SPADCALL |s| |p| (QREFELT $ 44))
                (EXIT
                 (COND ((NULL |p|) |s|)
                       ('T
                        (SEQ (LETT |q| (CDR |p|) . #1#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((NULL |q|) 'NIL)
                                           ('T
                                            (SPADCALL |x| (|SPADfirst| |q|)
                                                      (QREFELT $ 61)))))
                                    (GO G191)))
                                  (SEQ (LETT |p| |q| . #1#)
                                       (EXIT (LETT |q| (CDR |q|) . #1#)))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND ((NULL |q|) 'NIL)
                                           ('T
                                            (SPADCALL |x| (|SPADfirst| |q|)
                                                      (QREFELT $ 38)))))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |q| (CDR |q|) . #1#))) NIL
                                  (GO G190) G191 (EXIT NIL))
                             (SPADCALL |p| '|rest| |q| (QREFELT $ 63))
                             (EXIT |s|)))))))) 

(SDEFUN |LMDICT;insert!;S2$;24| ((|x| S) (|s| $) ($ $))
        (SPROG ((|q| (|List| S)) (|p| (|List| S)))
               (SEQ
                (LETT |p| (SPADCALL |s| (QREFELT $ 37))
                      . #1=(|LMDICT;insert!;S2$;24|))
                (COND
                 ((OR (NULL |p|)
                      (SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 64)))
                  (EXIT
                   (SEQ (SPADCALL |s| (CONS |x| |p|) (QREFELT $ 44))
                        (EXIT |s|)))))
                (LETT |q| (CDR |p|) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |q|) 'NIL)
                              ('T
                               (SPADCALL |x| (|SPADfirst| |q|)
                                         (QREFELT $ 61)))))
                       (GO G191)))
                     (SEQ (LETT |p| |q| . #1#)
                          (EXIT (LETT |q| (CDR |q|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (SPADCALL |p| '|rest| (CONS |x| |q|) (QREFELT $ 63))
                (EXIT |s|)))) 

(SDEFUN |LMDICT;remove!;S2$;25| ((|x| S) (|s| $) ($ $))
        (SEQ
         (SPADCALL |s|
                   (SPADCALL |x| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 65))
                   (QREFELT $ 44))
         (EXIT |s|))) 

(SDEFUN |LMDICT;=;2$B;26| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG ((#1=#:G208 NIL) (|x| (S)) (|a| ($)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |a| (SPADCALL |s| (QREFELT $ 19))
                        . #2=(|LMDICT;=;2$B;26|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |a| (QREFELT $ 21)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |x| (SPADCALL |a| (QREFELT $ 43)) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |x| |s| (QREFELT $ 54))
                                         (SPADCALL |x| |t| (QREFELT $ 54))
                                         (QREFELT $ 66))
                               (PROGN (LETT #1# 'NIL . #2#) (GO #3=#:G207)))
                              ('T (SPADCALL |x| |a| (QREFELT $ 48))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |LMDICT;insert!;S2$;27| ((|x| S) (|s| $) ($ $))
        (SPROG ((|p| (|List| S)) (#1=#:G215 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |p| (SPADCALL |s| (QREFELT $ 37))
                        . #2=(|LMDICT;insert!;S2$;27|))
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |p|) 'NIL) ('T 'T))) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 38))
                           (SEQ
                            (SPADCALL |p| '|rest| (CONS |x| (CDR |p|))
                                      (QREFELT $ 63))
                            (EXIT
                             (PROGN (LETT #1# |s| . #2#) (GO #3=#:G214)))))
                          ('T (LETT |p| (CDR |p|) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SPADCALL |s| (CONS |x| (SPADCALL |s| (QREFELT $ 37)))
                            (QREFELT $ 44))
                  (EXIT |s|)))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ListMultiDictionary;|)) 

(DEFUN |ListMultiDictionary| (#1=#:G225)
  (SPROG NIL
         (PROG (#2=#:G226)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ListMultiDictionary|)
                                               '|domainEqualList|)
                    . #3=(|ListMultiDictionary|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ListMultiDictionary;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ListMultiDictionary|)))))))))) 

(DEFUN |ListMultiDictionary;| (|#1|)
  (SPROG
   ((#1=#:G224 NIL) (#2=#:G223 NIL) (|pv$| NIL) (#3=#:G220 NIL) (#4=#:G221 NIL)
    (#5=#:G222 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|ListMultiDictionary|))
    (LETT |dv$| (LIST '|ListMultiDictionary| DV$1) . #6#)
    (LETT $ (GETREFV 74) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #6#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #5#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #6#)
                                        (OR #4# #5#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #6#)
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #5#))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|ListMultiDictionary| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
         (|augmentPredVector| $ 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #6#)
     (|augmentPredVector| $ 512))
    (AND (OR #1# #5#) (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Reference| (|List| |#1|)))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 31 (CONS (|dispatchFunction| |LMDICT;convert;$If;8|) $))))
    (COND
     ((|HasCategory| |#1| '(|OrderedSet|))
      (PROGN
       (QSETREFV $ 60 (CONS (|dispatchFunction| |LMDICT;=;2$B;22|) $))
       (QSETREFV $ 48 (CONS (|dispatchFunction| |LMDICT;remove!;S2$;23|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |LMDICT;insert!;S2$;24|) $))))
     ('T
      (PROGN
       (QSETREFV $ 48 (CONS (|dispatchFunction| |LMDICT;remove!;S2$;25|) $))
       (QSETREFV $ 60 (CONS (|dispatchFunction| |LMDICT;=;2$B;26|) $))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |LMDICT;insert!;S2$;27|) $)))))
    $))) 

(MAKEPROP '|ListMultiDictionary| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |LMDICT;parts;$L;11| (|OutputForm|) (0 . |coerce|) (|List| $)
              (5 . |prefix|) |LMDICT;coerce;$Of;1| (|NonNegativeInteger|)
              |LMDICT;#;$Nni;2| (11 . |copy|) |LMDICT;dictionary;L$;7|
              |LMDICT;copy;2$;3| (|Boolean|) |LMDICT;empty?;$B;4|
              |LMDICT;dictionary;$;5| (16 . |ref|) |LMDICT;empty;$;6|
              (21 . |insert!|) (|Symbol|) (|InputForm|) (27 . |convert|)
              (32 . |convert|) (37 . |convert|) (42 . |convert|)
              (|Mapping| 6 6) (47 . |map|) |LMDICT;map;M2$;9| (53 . |map!|)
              |LMDICT;map!;M2$;10| (59 . |deref|) (64 . =)
              |LMDICT;insert!;S$Nni$;13| |LMDICT;substitute;2S2$;14|
              (70 . |removeDuplicates!|) |LMDICT;removeDuplicates!;2$;15|
              |LMDICT;inspect;$S;16| (75 . |setref|) |LMDICT;extract!;$S;17|
              |LMDICT;duplicates?;$B;18| (81 . |removeDuplicates|)
              (86 . |remove!|) (|Mapping| 20 6) |LMDICT;remove!;M2$;19|
              (92 . |false|) (96 . |true|) |LMDICT;select!;M2$;20|
              (100 . |count|) (106 . >)
              (|Record| (|:| |entry| 6) (|:| |count| 15)) (|List| 56)
              |LMDICT;duplicates;$L;21| (112 . =) (118 . =) (124 . >) '"rest"
              (130 . |setelt|) (137 . <) (143 . |remove!|) (149 . ~=)
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 68) (|HashState|)
              (|SingleInteger|) (|String|) (|Union| 6 '"failed"))
           '#(~= 155 |substitute| 161 |size?| 168 |select!| 174 |select| 180
              |sample| 186 |removeDuplicates!| 190 |removeDuplicates| 195
              |remove!| 200 |remove| 212 |reduce| 224 |parts| 245 |more?| 250
              |members| 256 |member?| 261 |map!| 267 |map| 273 |less?| 279
              |latex| 285 |inspect| 290 |insert!| 295 |hashUpdate!| 308 |hash|
              314 |find| 319 |extract!| 325 |every?| 330 |eval| 336 |eq?| 362
              |empty?| 368 |empty| 373 |duplicates?| 377 |duplicates| 382
              |dictionary| 387 |count| 396 |copy| 408 |convert| 413 |construct|
              418 |coerce| 423 |any?| 428 = 434 |#| 440)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 0 0 0 2 1 0 0 0 2 5 7 3))
                 (CONS
                  '#(NIL |DictionaryOperations&| |BagAggregate&| |Collection&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL NIL)
                  (CONS
                   '#((|MultiDictionary| 6) (|DictionaryOperations| 6)
                      (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 10) (|ConvertibleTo| 27))
                   (|makeByteWordVec2| 73
                                       '(1 6 10 0 11 2 10 0 0 12 13 1 8 0 0 17
                                         1 7 0 8 23 2 0 0 6 0 25 1 27 0 26 28 1
                                         8 27 0 29 1 27 0 12 30 1 0 27 0 31 2 8
                                         0 32 0 33 2 8 0 32 0 35 1 7 8 0 37 2 6
                                         20 0 0 38 1 8 0 0 41 2 7 8 0 8 44 1 8
                                         0 0 47 2 0 0 6 0 48 0 20 0 51 0 20 0
                                         52 2 0 15 6 0 54 2 15 20 0 0 55 2 8 20
                                         0 0 59 2 0 20 0 0 60 2 6 20 0 0 61 3 8
                                         0 0 62 0 63 2 6 20 0 0 64 2 8 0 6 0 65
                                         2 15 20 0 0 66 2 11 20 0 0 1 3 0 0 6 6
                                         0 40 2 0 20 0 15 1 2 9 0 49 0 53 2 9 0
                                         49 0 1 0 0 0 1 1 0 0 0 42 1 10 0 0 1 2
                                         10 0 6 0 48 2 9 0 49 0 50 2 10 0 6 0 1
                                         2 9 0 49 0 1 4 10 6 67 0 6 6 1 3 9 6
                                         67 0 6 1 2 9 6 67 0 1 1 9 8 0 9 2 0 20
                                         0 15 1 1 9 8 0 1 2 10 20 6 0 1 2 8 0
                                         32 0 36 2 0 0 32 0 34 2 0 20 0 15 1 1
                                         1 72 0 1 1 0 6 0 43 3 0 0 6 0 15 39 2
                                         0 0 6 0 25 2 1 70 70 0 1 1 1 71 0 1 2
                                         0 73 49 0 1 1 0 6 0 45 2 9 20 49 0 1 3
                                         2 0 0 6 6 1 3 2 0 0 8 8 1 2 2 0 0 68 1
                                         2 2 0 0 69 1 2 0 20 0 0 1 1 0 20 0 21
                                         0 0 0 24 1 0 20 0 46 1 0 57 0 58 1 0 0
                                         8 18 0 0 0 22 2 10 15 6 0 54 2 9 15 49
                                         0 1 1 0 0 0 19 1 3 27 0 31 1 0 0 8 1 1
                                         6 10 0 14 2 9 20 49 0 1 2 11 20 0 0 60
                                         1 9 15 0 16)))))
           '|lookupComplete|)) 
