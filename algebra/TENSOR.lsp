
(/VERSIONCHECK 2) 

(DEFUN |TENSOR;termgreater?| (|t1| |t2| $)
  (SPADCALL (QCAR |t2|) (QCAR |t1|) (QREFELT $ 13))) 

(DEFUN |TENSOR;tensor;M1M2$;2| (|x1| |x2| $)
  (PROG (|res| #1=#:G118 |s2| #2=#:G117 |s1| |ltx2| |ltx1| #3=#:G116)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |x1| (QREFELT $ 14)) (SPADCALL |x2| (QREFELT $ 16)))
         (PROGN
          (LETT #3# (|spadConstant| $ 15) . #4=(|TENSOR;tensor;M1M2$;2|))
          (GO #3#)))
        ('T
         (SEQ (LETT |ltx1| (SPADCALL |x1| (QREFELT $ 19)) . #4#)
              (LETT |ltx2| (SPADCALL |x2| (QREFELT $ 22)) . #4#)
              (LETT |res| NIL . #4#)
              (SEQ (LETT |s1| NIL . #4#) (LETT #2# (REVERSE |ltx1|) . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |s2| NIL . #4#)
                          (LETT #1# (REVERSE |ltx2|) . #4#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |s2| (CAR #1#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res|
                                  (CONS
                                   (CONS
                                    (SPADCALL (QCAR |s1|) (QCAR |s2|)
                                              (QREFELT $ 23))
                                    (SPADCALL (QCDR |s1|) (QCDR |s2|)
                                              (QREFELT $ 24)))
                                   |res|)
                                  . #4#)))
                          (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 27)))))))
      #3# (EXIT #3#))))) 

(DEFUN |TENSOR;*;3$;3| (|x1| |x2| $)
  (PROG (|res| #1=#:G127 |t| |t2b| |t2a| |t1b| |t1a| |t2k| |t1k| |t2c| |t1c|
         #2=#:G126 |t2| #3=#:G125 |t1|)
    (RETURN
     (SEQ (LETT |res| NIL . #4=(|TENSOR;*;3$;3|))
          (SEQ (LETT |t1| NIL . #4#)
               (LETT #3# (SPADCALL |x1| (QREFELT $ 29)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |t1| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t2| NIL . #4#)
                      (LETT #2# (SPADCALL |x2| (QREFELT $ 29)) . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t2| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ (LETT |t1c| (QCDR |t1|) . #4#)
                           (LETT |t2c| (QCDR |t2|) . #4#)
                           (LETT |t1k| (QCAR |t1|) . #4#)
                           (LETT |t2k| (QCAR |t2|) . #4#)
                           (LETT |t1a|
                                 (SPADCALL (QCDR |t1|)
                                           (SPADCALL |t1k| (QREFELT $ 30))
                                           (QREFELT $ 31))
                                 . #4#)
                           (LETT |t1b|
                                 (SPADCALL (|spadConstant| $ 33)
                                           (SPADCALL |t1k| (QREFELT $ 34))
                                           (QREFELT $ 35))
                                 . #4#)
                           (LETT |t2a|
                                 (SPADCALL (QCDR |t2|)
                                           (SPADCALL |t2k| (QREFELT $ 30))
                                           (QREFELT $ 31))
                                 . #4#)
                           (LETT |t2b|
                                 (SPADCALL (|spadConstant| $ 33)
                                           (SPADCALL |t2k| (QREFELT $ 34))
                                           (QREFELT $ 35))
                                 . #4#)
                           (EXIT
                            (SEQ (LETT |t| NIL . #4#)
                                 (LETT #1#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |t1a| |t2a| (QREFELT $ 36))
                                         (SPADCALL |t1b| |t2b| (QREFELT $ 37))
                                         (QREFELT $ 28))
                                        (QREFELT $ 29))
                                       . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#) . #4#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT (LETT |res| (CONS |t| |res|) . #4#)))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 38))))))) 

(DEFUN |TENSOR;coerce;$Of;4| (|x| $)
  (PROG (|le| |ko| #1=#:G135 |rec|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 40))
        (SPADCALL (|spadConstant| $ 41) (QREFELT $ 43)))
       ('T
        (SEQ (LETT |le| NIL . #2=(|TENSOR;coerce;$Of;4|))
             (SEQ (LETT |rec| NIL . #2#)
                  (LETT #1# (REVERSE (SPADCALL |x| (QREFELT $ 29))) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |ko|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT $ 30))
                                    (QREFELT $ 44))
                          (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT $ 34))
                                    (QREFELT $ 45))
                          (QREFELT $ 46))
                         . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL (QCDR |rec|) (|spadConstant| $ 33)
                                (QREFELT $ 47))
                      (LETT |le| (CONS |ko| |le|) . #2#))
                     ('T
                      (LETT |le|
                            (CONS
                             (SPADCALL (SPADCALL (QCDR |rec|) (QREFELT $ 43))
                                       |ko| (QREFELT $ 48))
                             |le|)
                            . #2#)))))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (ELT $ 49) |le| (QREFELT $ 52)))))))))) 

(DECLAIM (NOTINLINE |TensorProduct;|)) 

(DEFUN |TensorProduct| (&REST #1=#:G145)
  (PROG ()
    (RETURN
     (PROG (#2=#:G146)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TensorProduct|)
                                           '|domainEqualList|)
                . #3=(|TensorProduct|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TensorProduct;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|TensorProduct|))))))))))) 

(DEFUN |TensorProduct;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TensorProduct|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|TensorProduct| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|OrderedAbelianMonoidSup|))
                                           (|HasCategory| (|Product| |#2| |#3|)
                                                          '(|OrderedSet|)))
                                          (OR
                                           (|HasCategory| |#1| '(|Comparable|))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|))))
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|))))
                                          (AND
                                           (|HasCategory| |#4|
                                                          (LIST '|Algebra|
                                                                (|devaluate|
                                                                 |#1|)))
                                           (|HasCategory| |#5|
                                                          (LIST '|Algebra|
                                                                (|devaluate|
                                                                 |#1|))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|))
                                           (AND
                                            (|HasCategory| |#4|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#5|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|))
                                           (AND
                                            (|HasCategory| |#4|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#5|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           (AND
                                            (|HasCategory| |#4|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#5|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianMonoid|))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#4|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#5|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory|
                                             (|Product| |#2| |#3|)
                                             '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#4|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#5|
                                                           (LIST '|Algebra|
                                                                 (|devaluate|
                                                                  |#1|)))))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|TensorProduct|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#4| (LIST '|Algebra| (|devaluate| |#1|)))
        (COND
         ((|HasCategory| |#5| (LIST '|Algebra| (|devaluate| |#1|)))
          (QSETREFV $ 39 (CONS (|dispatchFunction| |TENSOR;*;3$;3|) $))))))
      $)))) 

(MAKEPROP '|TensorProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 12) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Boolean|) (|Product| 7 8) (0 . <) (6 . |zero?|) (11 . |Zero|)
              (15 . |zero?|) (|Record| (|:| |k| 7) (|:| |c| 6)) (|List| 17)
              (20 . |listOfTerms|) (|Record| (|:| |k| 8) (|:| |c| 6))
              (|List| 20) (25 . |listOfTerms|) (30 . |construct|) (36 . *)
              (|Record| (|:| |k| 12) (|:| |c| 6)) (|List| 25)
              (42 . |constructOrdered|) |TENSOR;tensor;M1M2$;2|
              (47 . |listOfTerms|) (52 . |first|) (57 . |monomial|)
              (63 . |One|) (67 . |One|) (71 . |second|) (76 . |monomial|)
              (82 . *) (88 . *) (94 . |construct|) (99 . *) (105 . |zero?|)
              (110 . |Zero|) (|OutputForm|) (114 . |coerce|) (119 . |coerce|)
              (124 . |coerce|) (129 . |tensor|) (135 . =) (141 . *) (147 . +)
              (|Mapping| 42 42 42) (|List| 42) (153 . |reduce|)
              |TENSOR;coerce;$Of;4| (|NonNegativeInteger|) (|Integer|)
              (|Union| $ '"failed") (|PositiveInteger|) (|Mapping| 6 12)
              (|Union| 12 '"failed") (|Mapping| 6 6) (|List| 6) (|List| $)
              (|List| 12) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 159 |zero?| 165 |tensor| 170 |support| 176 |sup| 181
              |subtractIfCan| 187 |smaller?| 193 |sample| 199 |retractIfCan|
              203 |retract| 208 |reductum| 213 |recip| 218 |one?| 223
              |numberOfMonomials| 228 |monomials| 233 |monomial?| 238
              |monomial| 243 |monom| 249 |min| 255 |max| 261 |map| 267
              |listOfTerms| 273 |linearExtend| 278 |leadingTerm| 284
              |leadingSupport| 289 |leadingMonomial| 294 |leadingCoefficient|
              299 |latex| 304 |hashUpdate!| 309 |hash| 315 |constructOrdered|
              320 |construct| 325 |coerce| 330 |coefficients| 350 |coefficient|
              355 |characteristic| 361 ^ 365 |Zero| 377 |One| 381 >= 385 > 391
              = 397 <= 403 < 409 - 415 + 426 * 432)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 0 5 0 0 0 2 5 0 0 0 2 5 5 4 8 4 7 5 4 6 5 5
                                  0 3 5 0 0 0 1 4 5))
            (CONS
             '#(NIL |FreeModuleCategory&| |Algebra&| |Module&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| NIL |Monoid&|
                |AbelianSemiGroup&| NIL |SemiGroup&| |SetCategory&|
                |BasicType&| NIL |RetractableTo&| |PartialOrder&| NIL)
             (CONS
              '#((|TensorProductCategory| 6 9 10)
                 (|FreeModuleCategory| 6 (|Product| 7 8)) (|Algebra| 6)
                 (|Module| 6)
                 (|IndexedDirectProductCategory| 6 (|Product| 7 8))
                 (|BiModule| 6 6) (|OrderedAbelianMonoidSup|) (|Ring|)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|OrderedCancellationAbelianMonoid|) (|Rng|)
                 (|LeftModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|SemiRng|)
                 (|Monoid|) (|AbelianSemiGroup|) (|Comparable|) (|SemiGroup|)
                 (|SetCategory|) (|BasicType|) (|CoercibleTo| 42)
                 (|RetractableTo| (|Product| 7 8)) (|PartialOrder|)
                 (|unitsKnown|))
              (|makeByteWordVec2| 66
                                  '(2 12 11 0 0 13 1 9 11 0 14 0 0 0 15 1 10 11
                                    0 16 1 9 18 0 19 1 10 21 0 22 2 12 0 7 8 23
                                    2 6 0 0 0 24 1 0 0 26 27 1 0 26 0 29 1 12 7
                                    0 30 2 9 0 6 7 31 0 0 0 32 0 6 0 33 1 12 8
                                    0 34 2 10 0 6 8 35 2 9 0 0 0 36 2 10 0 0 0
                                    37 1 0 0 26 38 2 0 0 0 0 39 1 0 11 0 40 0 6
                                    0 41 1 6 42 0 43 1 7 42 0 44 1 8 42 0 45 2
                                    42 0 0 0 46 2 6 11 0 0 47 2 42 0 0 0 48 2
                                    42 0 0 0 49 2 51 42 50 0 52 2 0 11 0 0 1 1
                                    10 11 0 40 2 0 0 9 10 28 1 0 63 0 1 2 2 0 0
                                    0 1 2 11 56 0 0 1 2 3 11 0 0 1 0 10 0 1 1 1
                                    59 0 1 1 1 12 0 1 1 0 0 0 1 1 5 56 0 1 1 5
                                    11 0 1 1 0 54 0 1 1 0 62 0 1 1 0 11 0 1 2 0
                                    0 6 12 1 2 0 0 12 6 1 2 4 0 0 0 1 2 4 0 0 0
                                    1 2 0 0 60 0 1 1 0 26 0 29 2 9 6 58 0 1 1 0
                                    25 0 1 1 0 12 0 1 1 0 12 0 1 1 0 6 0 1 1 0
                                    65 0 1 2 0 64 64 0 1 1 0 66 0 1 1 0 0 26 27
                                    1 0 0 26 38 1 5 0 6 1 1 5 0 55 1 1 1 0 12 1
                                    1 0 42 0 53 1 0 61 0 1 2 0 6 0 12 1 0 5 54
                                    1 2 5 0 0 54 1 2 5 0 0 57 1 0 10 0 15 0 5 0
                                    32 2 4 11 0 0 1 2 4 11 0 0 1 2 0 11 0 0 1 2
                                    4 11 0 0 1 2 4 11 0 0 1 1 8 0 0 1 2 8 0 0 0
                                    1 2 0 0 0 0 1 2 5 0 0 0 39 2 8 0 55 0 1 2
                                    10 0 54 0 1 2 0 0 6 12 1 2 0 0 12 6 1 2 0 0
                                    6 0 1 2 0 0 0 6 1 2 0 0 57 0 1)))))
           '|lookupComplete|)) 
