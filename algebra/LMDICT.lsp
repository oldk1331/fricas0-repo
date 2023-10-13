
(/VERSIONCHECK 2) 

(DEFUN |LMDICT;coerce;$Of;1| (|s| $)
  (PROG (#1=#:G146 |x| #2=#:G145)
    (RETURN
     (SEQ
      (SPADCALL "dictionary"
                (PROGN
                 (LETT #2# NIL . #3=(|LMDICT;coerce;$Of;1|))
                 (SEQ (LETT |x| NIL . #3#)
                      (LETT #1# (SPADCALL |s| (QREFELT $ 9)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 11)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 13)))))) 

(DEFUN |LMDICT;#;$Nni;2| (|s| $) (LENGTH (SPADCALL |s| (QREFELT $ 9)))) 

(DEFUN |LMDICT;copy;2$;3| (|s| $)
  (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 17))
            (QREFELT $ 18))) 

(DEFUN |LMDICT;empty?;$B;4| (|s| $) (NULL (SPADCALL |s| (QREFELT $ 9)))) 

(DEFUN |LMDICT;bag;L$;5| (|l| $) (SPADCALL |l| (QREFELT $ 18))) 

(DEFUN |LMDICT;dictionary;$;6| ($) (SPADCALL NIL (QREFELT $ 18))) 

(DEFUN |LMDICT;empty;$;7| ($) (SPADCALL NIL (QREFELT $ 24))) 

(DEFUN |LMDICT;dictionary;L$;8| (|ls| $)
  (PROG (#1=#:G157 |x| |lmd|)
    (RETURN
     (SEQ
      (COND ((NULL |ls|) (SPADCALL (QREFELT $ 25)))
            ('T
             (SEQ
              (LETT |lmd| (SPADCALL (QREFELT $ 25))
                    . #2=(|LMDICT;dictionary;L$;8|))
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |ls| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |x| |lmd| (QREFELT $ 26))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |lmd|)))))))) 

(DEFUN |LMDICT;convert;$If;9| (|lmd| $)
  (SPADCALL
   (LIST (SPADCALL '|dictionary| (QREFELT $ 29))
         (SPADCALL (SPADCALL |lmd| (QREFELT $ 9)) (QREFELT $ 30)))
   (QREFELT $ 31))) 

(DEFUN |LMDICT;map;M2$;10| (|f| |s| $)
  (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 34))
            (QREFELT $ 18))) 

(DEFUN |LMDICT;map!;M2$;11| (|f| |s| $)
  (SPADCALL (SPADCALL |f| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 36))
            (QREFELT $ 18))) 

(DEFUN |LMDICT;parts;$L;12| (|s| $) (SPADCALL |s| (QREFELT $ 38))) 

(DEFUN |LMDICT;sub| (|x| |y| |z| $)
  (COND ((SPADCALL |z| |x| (QREFELT $ 39)) |y|) ('T |z|))) 

(DEFUN |LMDICT;insert!;S$Nni$;14| (|x| |s| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #1=(|LMDICT;insert!;S$Nni$;14|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (EXIT (SPADCALL |x| |s| (QREFELT $ 26))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |LMDICT;substitute;2S2$;15| (|x| |y| |s| $)
  (PROG ()
    (RETURN
     (SPADCALL
      (SPADCALL (CONS #'|LMDICT;substitute;2S2$;15!0| (VECTOR $ |y| |x|))
                (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 34))
      (QREFELT $ 18))))) 

(DEFUN |LMDICT;substitute;2S2$;15!0| (|z1| $$)
  (PROG (|x| |y| $)
    (LETT |x| (QREFELT $$ 2) . #1=(|LMDICT;substitute;2S2$;15|))
    (LETT |y| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|LMDICT;sub| |x| |y| |z1| $))))) 

(DEFUN |LMDICT;removeDuplicates!;2$;16| (|s| $)
  (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 42))
            (QREFELT $ 18))) 

(DEFUN |LMDICT;inspect;$S;17| (|s| $)
  (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "empty dictionary"))
        ('T (|SPADfirst| (SPADCALL |s| (QREFELT $ 9)))))) 

(DEFUN |LMDICT;extract!;$S;18| (|s| $)
  (PROG (|x| |p|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |s| (QREFELT $ 21)) (|error| "empty dictionary"))
            ('T
             (SEQ
              (LETT |x|
                    (|SPADfirst|
                     (LETT |p| (SPADCALL |s| (QREFELT $ 9))
                           . #1=(|LMDICT;extract!;$S;18|)))
                    . #1#)
              (SPADCALL |s| (CDR |p|) (QREFELT $ 45)) (EXIT |x|)))))))) 

(DEFUN |LMDICT;duplicates?;$B;19| (|s| $)
  (PROG (|q| |p| #1=#:G182)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL
          (LETT |p| (SPADCALL |s| (QREFELT $ 9))
                . #2=(|LMDICT;duplicates?;$B;19|)))
         'NIL)
        ('T
         (SEQ (LETT |q| (CDR |p|) . #2#)
              (SEQ G190
                   (COND ((NULL (COND ((NULL |q|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (|SPADfirst| |p|) (|SPADfirst| |q|)
                                 (QREFELT $ 39))
                       (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                      ('T
                       (SEQ (LETT |p| |q| . #2#)
                            (EXIT (LETT |q| (CDR |q|) . #2#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT 'NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |LMDICT;remove!;M2$;20| (|p| |lmd| $)
  (PROG (#1=#:G187 |x|)
    (RETURN
     (SEQ
      (SEQ (LETT |x| NIL . #2=(|LMDICT;remove!;M2$;20|))
           (LETT #1# (SPADCALL (SPADCALL |lmd| (QREFELT $ 9)) (QREFELT $ 48))
                 . #2#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND ((SPADCALL |x| |p|) (SPADCALL |x| |lmd| (QREFELT $ 49))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |lmd|))))) 

(DEFUN |LMDICT;select!;M2$;21| (|p| |lmd| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|LMDICT;select!;M2$;21!0| (VECTOR $ |p|)) |lmd|
               (QREFELT $ 51))))) 

(DEFUN |LMDICT;select!;M2$;21!0| (|z1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|LMDICT;select!;M2$;21|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND ((SPADCALL |z1| |p|) (|spadConstant| $ 52))
            ('T (|spadConstant| $ 53))))))) 

(DEFUN |LMDICT;duplicates;$L;22| (|lmd| $)
  (PROG (|ld| |n| #1=#:G201 |x|)
    (RETURN
     (SEQ (LETT |ld| NIL . #2=(|LMDICT;duplicates;$L;22|))
          (SEQ (LETT |x| NIL . #2#)
               (LETT #1#
                     (SPADCALL (SPADCALL |lmd| (QREFELT $ 9)) (QREFELT $ 48))
                     . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |n| (SPADCALL |x| |lmd| (QREFELT $ 55)) . #2#) 1
                    (QREFELT $ 56))
                   (LETT |ld| (CONS (CONS |x| |n|) |ld|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ld|))))) 

(DEFUN |LMDICT;=;2$B;23| (|s| |t| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 9)) (SPADCALL |t| (QREFELT $ 9))
            (QREFELT $ 60))) 

(DEFUN |LMDICT;remove!;S2$;24| (|x| |s| $)
  (PROG (|q| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |s| (QREFELT $ 38)) . #1=(|LMDICT;remove!;S2$;24|))
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |p|) 'NIL)
                    ('T (SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 39)))))
             (GO G191)))
           (SEQ (EXIT (LETT |p| (CDR |p|) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (SPADCALL |s| |p| (QREFELT $ 45))
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
                                            (QREFELT $ 62)))))
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
                                            (QREFELT $ 39)))))
                          (GO G191)))
                        (SEQ (EXIT (LETT |q| (CDR |q|) . #1#))) NIL (GO G190)
                        G191 (EXIT NIL))
                   (SPADCALL |p| '|rest| |q| (QREFELT $ 64)) (EXIT |s|))))))))) 

(DEFUN |LMDICT;insert!;S2$;25| (|x| |s| $)
  (PROG (|q| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |s| (QREFELT $ 38)) . #1=(|LMDICT;insert!;S2$;25|))
      (COND
       ((OR (NULL |p|) (SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 65)))
        (EXIT (SEQ (SPADCALL |s| (CONS |x| |p|) (QREFELT $ 45)) (EXIT |s|)))))
      (LETT |q| (CDR |p|) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |q|) 'NIL)
                    ('T (SPADCALL |x| (|SPADfirst| |q|) (QREFELT $ 62)))))
             (GO G191)))
           (SEQ (LETT |p| |q| . #1#) (EXIT (LETT |q| (CDR |q|) . #1#))) NIL
           (GO G190) G191 (EXIT NIL))
      (SPADCALL |p| '|rest| (CONS |x| |q|) (QREFELT $ 64)) (EXIT |s|))))) 

(DEFUN |LMDICT;remove!;S2$;26| (|x| |s| $)
  (SEQ
   (SPADCALL |s| (SPADCALL |x| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 66))
             (QREFELT $ 45))
   (EXIT |s|))) 

(DEFUN |LMDICT;=;2$B;27| (|s| |t| $)
  (PROG (#1=#:G228 |x| |a|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |a| (SPADCALL |s| (QREFELT $ 19)) . #2=(|LMDICT;=;2$B;27|))
            (SEQ G190
                 (COND
                  ((NULL (COND ((SPADCALL |a| (QREFELT $ 21)) 'NIL) ('T 'T)))
                   (GO G191)))
                 (SEQ (LETT |x| (SPADCALL |a| (QREFELT $ 44)) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |x| |s| (QREFELT $ 55))
                                   (SPADCALL |x| |t| (QREFELT $ 55))
                                   (QREFELT $ 67))
                         (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                        ('T (SPADCALL |x| |a| (QREFELT $ 49))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |LMDICT;insert!;S2$;28| (|x| |s| $)
  (PROG (|p| #1=#:G234)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |p| (SPADCALL |s| (QREFELT $ 38)) . #2=(|LMDICT;insert!;S2$;28|))
        (SEQ G190 (COND ((NULL (COND ((NULL |p|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x| (|SPADfirst| |p|) (QREFELT $ 39))
                 (SEQ
                  (SPADCALL |p| '|rest| (CONS |x| (CDR |p|)) (QREFELT $ 64))
                  (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
                ('T (LETT |p| (CDR |p|) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (SPADCALL |s| (CONS |x| (SPADCALL |s| (QREFELT $ 38))) (QREFELT $ 45))
        (EXIT |s|)))
      #1# (EXIT #1#))))) 

(DEFUN |ListMultiDictionary| (#1=#:G242)
  (PROG ()
    (RETURN
     (PROG (#2=#:G243)
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
              (HREM |$ConstructorCache| '|ListMultiDictionary|))))))))))) 

(DEFUN |ListMultiDictionary;| (|#1|)
  (PROG (#1=#:G241 |pv$| #2=#:G239 #3=#:G240 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|ListMultiDictionary|))
      (LETT |dv$| (LIST '|ListMultiDictionary| DV$1) . #4#)
      (LETT $ (GETREFV 74) . #4#)
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
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #3#))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|ListMultiDictionary| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32))
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 64))
      (AND #3# #1# (|augmentPredVector| $ 128))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Reference| (|List| |#1|)))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 32 (CONS (|dispatchFunction| |LMDICT;convert;$If;9|) $))))
      (COND
       ((|HasCategory| |#1| '(|OrderedSet|))
        (PROGN
         (QSETREFV $ 61 (CONS (|dispatchFunction| |LMDICT;=;2$B;23|) $))
         (QSETREFV $ 49 (CONS (|dispatchFunction| |LMDICT;remove!;S2$;24|) $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |LMDICT;insert!;S2$;25|) $))))
       ('T
        (PROGN
         (QSETREFV $ 49 (CONS (|dispatchFunction| |LMDICT;remove!;S2$;26|) $))
         (QSETREFV $ 61 (CONS (|dispatchFunction| |LMDICT;=;2$B;27|) $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |LMDICT;insert!;S2$;28|) $)))))
      $)))) 

(MAKEPROP '|ListMultiDictionary| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |LMDICT;parts;$L;12| (|OutputForm|) (0 . |coerce|) (|List| $)
              (5 . |prefix|) |LMDICT;coerce;$Of;1| (|NonNegativeInteger|)
              |LMDICT;#;$Nni;2| (11 . |copy|) |LMDICT;dictionary;L$;8|
              |LMDICT;copy;2$;3| (|Boolean|) |LMDICT;empty?;$B;4|
              |LMDICT;bag;L$;5| |LMDICT;dictionary;$;6| (16 . |ref|)
              |LMDICT;empty;$;7| (21 . |insert!|) (|Symbol|) (|InputForm|)
              (27 . |convert|) (32 . |convert|) (37 . |convert|)
              (42 . |convert|) (|Mapping| 6 6) (47 . |map|) |LMDICT;map;M2$;10|
              (53 . |map!|) |LMDICT;map!;M2$;11| (59 . |deref|) (64 . =)
              |LMDICT;insert!;S$Nni$;14| |LMDICT;substitute;2S2$;15|
              (70 . |removeDuplicates!|) |LMDICT;removeDuplicates!;2$;16|
              |LMDICT;inspect;$S;17| (75 . |setref|) |LMDICT;extract!;$S;18|
              |LMDICT;duplicates?;$B;19| (81 . |removeDuplicates|)
              (86 . |remove!|) (|Mapping| 20 6) |LMDICT;remove!;M2$;20|
              (92 . |false|) (96 . |true|) |LMDICT;select!;M2$;21|
              (100 . |count|) (106 . >)
              (|Record| (|:| |entry| 6) (|:| |count| 15)) (|List| 57)
              |LMDICT;duplicates;$L;22| (112 . =) (118 . =) (124 . >) '"rest"
              (130 . |setelt|) (137 . <) (143 . |remove!|) (149 . ~=)
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 69) (|SingleInteger|)
              (|String|) (|Union| 6 '"failed"))
           '#(~= 155 |substitute| 161 |size?| 168 |select!| 174 |select| 180
              |sample| 186 |removeDuplicates!| 190 |removeDuplicates| 195
              |remove!| 200 |remove| 212 |reduce| 224 |parts| 245 |more?| 250
              |members| 256 |member?| 261 |map!| 267 |map| 273 |less?| 279
              |latex| 285 |inspect| 290 |insert!| 295 |hash| 308 |find| 313
              |extract!| 319 |every?| 324 |eval| 330 |eq?| 356 |empty?| 362
              |empty| 367 |duplicates?| 371 |duplicates| 376 |dictionary| 381
              |count| 390 |copy| 402 |convert| 407 |construct| 412 |coerce| 417
              |bag| 422 |any?| 427 = 433 |#| 439)
           'NIL
           (CONS (|makeByteWordVec2| 5 '(0 0 0 0 0 0 2 1 0 0 0 2 1 5 3))
                 (CONS
                  '#(NIL |DictionaryOperations&| |BagAggregate&| |Collection&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL NIL)
                  (CONS
                   '#((|MultiDictionary| 6) (|DictionaryOperations| 6)
                      (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|finiteAggregate|) (|Type|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 10) (|ConvertibleTo| 28))
                   (|makeByteWordVec2| 73
                                       '(1 6 10 0 11 2 10 0 0 12 13 1 8 0 0 17
                                         1 7 0 8 24 2 0 0 6 0 26 1 28 0 27 29 1
                                         8 28 0 30 1 28 0 12 31 1 0 28 0 32 2 8
                                         0 33 0 34 2 8 0 33 0 36 1 7 8 0 38 2 6
                                         20 0 0 39 1 8 0 0 42 2 7 8 0 8 45 1 8
                                         0 0 48 2 0 0 6 0 49 0 20 0 52 0 20 0
                                         53 2 0 15 6 0 55 2 15 20 0 0 56 2 8 20
                                         0 0 60 2 0 20 0 0 61 2 6 20 0 0 62 3 8
                                         0 0 63 0 64 2 6 20 0 0 65 2 8 0 6 0 66
                                         2 15 20 0 0 67 2 1 20 0 0 1 3 0 0 6 6
                                         0 41 2 0 20 0 15 1 2 7 0 50 0 54 2 7 0
                                         50 0 1 0 0 0 1 1 0 0 0 43 1 8 0 0 1 2
                                         7 0 50 0 51 2 7 0 6 0 49 2 8 0 6 0 1 2
                                         7 0 50 0 1 4 8 6 68 0 6 6 1 2 7 6 68 0
                                         1 3 7 6 68 0 6 1 1 7 8 0 9 2 0 20 0 15
                                         1 1 7 8 0 1 2 8 20 6 0 1 2 6 0 33 0 37
                                         2 0 0 33 0 35 2 0 20 0 15 1 1 1 72 0 1
                                         1 0 6 0 44 3 0 0 6 0 15 40 2 0 0 6 0
                                         26 1 1 71 0 1 2 0 73 50 0 1 1 0 6 0 46
                                         2 7 20 50 0 1 3 2 0 0 6 6 1 3 2 0 0 8
                                         8 1 2 2 0 0 69 1 2 2 0 0 70 1 2 0 20 0
                                         0 1 1 0 20 0 21 0 0 0 25 1 0 20 0 47 1
                                         0 58 0 59 1 0 0 8 18 0 0 0 23 2 8 15 6
                                         0 55 2 7 15 50 0 1 1 0 0 0 19 1 3 28 0
                                         32 1 0 0 8 1 1 4 10 0 14 1 0 0 8 22 2
                                         7 20 50 0 1 2 1 20 0 0 61 1 7 15 0
                                         16)))))
           '|lookupComplete|)) 
