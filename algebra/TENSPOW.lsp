
(/VERSIONCHECK 2) 

(DEFUN |TENSPOW;coerce;$Of;1| (|x| $)
  (PROG (|le| |ko| #1=#:G145 |b| #2=#:G144 #3=#:G143 |rec|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 11))
        (SPADCALL (|spadConstant| $ 12) (QREFELT $ 14)))
       ('T
        (SEQ (LETT |le| NIL . #4=(|TENSPOW;coerce;$Of;1|))
             (SEQ (LETT |rec| NIL . #4#)
                  (LETT #3# (REVERSE (SPADCALL |x| (QREFELT $ 17))) . #4#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |ko|
                         (SPADCALL (ELT $ 18)
                                   (PROGN
                                    (LETT #2# NIL . #4#)
                                    (SEQ (LETT |b| NIL . #4#)
                                         (LETT #1#
                                               (SPADCALL (QCAR |rec|)
                                                         (QREFELT $ 21))
                                               . #4#)
                                         G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |b| (CAR #1#) . #4#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |b| (QREFELT $ 22))
                                                  #2#)
                                                 . #4#)))
                                         (LETT #1# (CDR #1#) . #4#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 25))
                         . #4#)
                   (EXIT
                    (COND
                     ((SPADCALL (QCDR |rec|) (|spadConstant| $ 26)
                                (QREFELT $ 27))
                      (LETT |le| (CONS |ko| |le|) . #4#))
                     ('T
                      (LETT |le|
                            (CONS
                             (SPADCALL (SPADCALL (QCDR |rec|) (QREFELT $ 14))
                                       |ko| (QREFELT $ 28))
                             |le|)
                            . #4#)))))
                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (ELT $ 29) |le| (QREFELT $ 25)))))))))) 

(DEFUN |TENSPOW;partialTensor| (|bb| |xx| $)
  (PROG (|res| #1=#:G156 |tt| #2=#:G155 |s1| #3=#:G154 |xr| |x1|)
    (RETURN
     (SEQ (LETT |x1| (|SPADfirst| |xx|) . #4=(|TENSPOW;partialTensor|))
          (LETT |xr| (CDR |xx|) . #4#)
          (COND
           ((NULL |xr|)
            (SEQ (LETT |s1| NIL . #4#)
                 (LETT #3# (SPADCALL |x1| (QREFELT $ 33)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |s1| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res|
                         (CONS (CONS (CONS (QCAR |s1|) |bb|) (QCDR |s1|))
                               |res|)
                         . #4#)))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
           ('T
            (SEQ (LETT |s1| NIL . #4#)
                 (LETT #2# (SPADCALL |x1| (QREFELT $ 33)) . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |tt| NIL . #4#)
                        (LETT #1#
                              (|TENSPOW;partialTensor| (CONS (QCAR |s1|) |bb|)
                               |xr| $)
                              . #4#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |tt| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (CONS
                                 (CONS (QCAR |tt|)
                                       (SPADCALL (QCDR |s1|) (QCDR |tt|)
                                                 (QREFELT $ 34)))
                                 |res|)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
          (EXIT (REVERSE |res|)))))) 

(DEFUN |TENSPOW;tensor;L$;3| (|bb| $)
  (SPADCALL (|spadConstant| $ 26) (SPADCALL |bb| (QREFELT $ 35))
            (QREFELT $ 36))) 

(DEFUN |TENSPOW;tensor;L$;4| (|xx| $)
  (PROG (|res| #1=#:G166 |tt|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |xx| (QREFELT $ 6) (QREFELT $ 40)))
        (|error| "wrong size"))
       ('T
        (COND ((SPADCALL (ELT $ 41) |xx| (QREFELT $ 43)) (|spadConstant| $ 44))
              ('T
               (SEQ (LETT |res| NIL . #2=(|TENSPOW;tensor;L$;4|))
                    (SEQ (LETT |tt| NIL . #2#)
                         (LETT #1# (|TENSPOW;partialTensor| NIL |xx| $) . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |tt| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (CONS
                                  (CONS
                                   (SPADCALL (REVERSE (QCAR |tt|))
                                             (QREFELT $ 35))
                                   (QCDR |tt|))
                                  |res|)
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (REVERSE |res|) (QREFELT $ 45)))))))))))) 

(DEFUN |TENSPOW;*;3$;5| (|x1| |x2| $)
  (PROG (|res| #1=#:G180 |t| |t1t2| #2=#:G178 |b1| #3=#:G179 |b2| #4=#:G177
         |t2k| |t1k| |t2c| |t1c| #5=#:G176 |t2| #6=#:G175 |t1|)
    (RETURN
     (SEQ (LETT |res| NIL . #7=(|TENSPOW;*;3$;5|))
          (SEQ (LETT |t1| NIL . #7#)
               (LETT #6# (SPADCALL |x1| (QREFELT $ 17)) . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t2| NIL . #7#)
                      (LETT #5# (SPADCALL |x2| (QREFELT $ 17)) . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |t2| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ (LETT |t1c| (QCDR |t1|) . #7#)
                           (LETT |t2c| (QCDR |t2|) . #7#)
                           (LETT |t1k| (QCAR |t1|) . #7#)
                           (LETT |t2k| (QCAR |t2|) . #7#)
                           (LETT |t1t2|
                                 (SPADCALL
                                  (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                            (QREFELT $ 34))
                                  (SPADCALL
                                   (PROGN
                                    (LETT #4# NIL . #7#)
                                    (SEQ (LETT |b2| NIL . #7#)
                                         (LETT #3#
                                               (SPADCALL (QCAR |t2|)
                                                         (QREFELT $ 21))
                                               . #7#)
                                         (LETT |b1| NIL . #7#)
                                         (LETT #2#
                                               (SPADCALL (QCAR |t1|)
                                                         (QREFELT $ 21))
                                               . #7#)
                                         G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |b1| (CAR #2#) . #7#)
                                                NIL)
                                               (ATOM #3#)
                                               (PROGN
                                                (LETT |b2| (CAR #3#) . #7#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| $ 26) |b1|
                                                    (QREFELT $ 47))
                                                   (SPADCALL
                                                    (|spadConstant| $ 26) |b2|
                                                    (QREFELT $ 47))
                                                   (QREFELT $ 48))
                                                  #4#)
                                                 . #7#)))
                                         (LETT #2#
                                               (PROG1 (CDR #2#)
                                                 (LETT #3# (CDR #3#) . #7#))
                                               . #7#)
                                         (GO G190) G191 (EXIT (NREVERSE #4#))))
                                   (QREFELT $ 46))
                                  (QREFELT $ 49))
                                 . #7#)
                           (EXIT
                            (SEQ (LETT |t| NIL . #7#)
                                 (LETT #1# (SPADCALL |t1t2| (QREFELT $ 17))
                                       . #7#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT (LETT |res| (CONS |t| |res|) . #7#)))
                                 (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 50))))))) 

(DEFUN |TensorPower| (&REST #1=#:G192)
  (PROG ()
    (RETURN
     (PROG (#2=#:G193)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TensorPower|)
                                           '|domainEqualList|)
                . #3=(|TensorPower|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TensorPower;|) #1#)
                (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|TensorPower|))))))))))) 

(DEFUN |TensorPower;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| #1=#:G189 #2=#:G190 $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|TensorPower|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT DV$3 (|devaluate| |#3|) . #3#)
      (LETT DV$4 (|devaluate| |#4|) . #3#)
      (LETT |dv$| (LIST '|TensorPower| DV$1 DV$2 DV$3 DV$4) . #3#)
      (LETT $ (GETREFV 64) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#4|
                                                         (LIST '|Algebra|
                                                               (|devaluate|
                                                                |#2|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#4|
                                                          (LIST '|Algebra|
                                                                (|devaluate|
                                                                 |#2|))))
                                          (|HasCategory| |#2| '(|SemiRing|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                . #3#)
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#2|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#2|
                                                          '(|CancellationAbelianMonoid|))
                                           (|HasCategory| |#4|
                                                          (LIST '|Algebra|
                                                                (|devaluate|
                                                                 |#2|))))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#2|
                                                          '(|CancellationAbelianMonoid|))
                                           (|HasCategory| |#4|
                                                          (LIST '|Algebra|
                                                                (|devaluate|
                                                                 |#2|))))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#4|
                                                          (LIST '|Algebra|
                                                                (|devaluate|
                                                                 |#2|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (LETT #1#
                                                (|HasCategory| |#2|
                                                               '(|Comparable|))
                                                . #3#)
                                          (OR #1# #2#
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|)))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|TensorPower| (LIST DV$1 DV$2 DV$3 DV$4)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 51 (CONS (|dispatchFunction| |TENSPOW;*;3$;5|) $))))
      $)))) 

(MAKEPROP '|TensorPower| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 20) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|Boolean|)
              (0 . |zero?|) (5 . |Zero|) (|OutputForm|) (9 . |coerce|)
              (|Record| (|:| |k| 20) (|:| |c| 7)) (|List| 15)
              (14 . |listOfTerms|) (19 . |tensor|) (|List| 8) (|Vector| 8)
              (25 . |parts|) (30 . |coerce|) (|Mapping| 13 13 13) (|List| 13)
              (35 . |reduce|) (41 . |One|) (45 . =) (51 . *) (57 . +)
              |TENSPOW;coerce;$Of;1| (|Record| (|:| |k| 8) (|:| |c| 7))
              (|List| 31) (63 . |listOfTerms|) (68 . *) (74 . |vector|)
              (79 . |monomial|) |TENSPOW;tensor;L$;3| (|NonNegativeInteger|)
              (|List| 9) (85 . |size?|) (91 . |zero?|) (|Mapping| 10 9)
              (96 . |any?|) (102 . |Zero|) (106 . |constructOrdered|)
              |TENSPOW;tensor;L$;4| (111 . |monomial|) (117 . *) (123 . *)
              (129 . |construct|) (134 . *) (|Union| $ '"failed") (|Integer|)
              (|PositiveInteger|) (|Mapping| 7 20) (|Union| 20 '"failed")
              (|Mapping| 7 7) (|List| 20) (|List| 7) (|List| $) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 140 |zero?| 146 |tensor| 151 |support| 167 |sup| 172
              |subtractIfCan| 178 |smaller?| 184 |sample| 190 |retractIfCan|
              194 |retract| 199 |reductum| 204 |recip| 209 |one?| 214
              |numberOfMonomials| 219 |monomials| 224 |monomial?| 229
              |monomial| 234 |monom| 240 |min| 246 |max| 252 |map| 258
              |listOfTerms| 264 |linearExtend| 269 |leadingTerm| 275
              |leadingSupport| 280 |leadingMonomial| 285 |leadingCoefficient|
              290 |latex| 295 |hashUpdate!| 300 |hash| 306 |constructOrdered|
              311 |construct| 316 |coerce| 321 |coefficients| 341 |coefficient|
              346 |characteristic| 352 ^ 356 |Zero| 368 |One| 372 >= 376 > 382
              = 388 <= 394 < 400 - 406 + 417 * 423)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 1 0 0 0 1 4 0 0 0 1 1 4 2 6 1 6 8 1 1 6
                                  7 0 1 12 0 0 0 1 3 5))
            (CONS
             '#(|TensorPowerCategory&| |FreeModuleCategory&| NIL |Algebra&| NIL
                |Module&| NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |Monoid&| |OrderedSet&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&| NIL
                |SetCategory&| |BasicType&| NIL NIL |RetractableTo&|
                |PartialOrder&|)
             (CONS
              '#((|TensorPowerCategory| 6 7 9)
                 (|FreeModuleCategory| 7 (|Vector| 8))
                 (|TensorProductCategory| 7 9 9) (|Algebra| 7)
                 (|IndexedDirectProductCategory| 7 (|Vector| 8)) (|Module| 7)
                 (|BiModule| 7 7) (|Ring|) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|Rng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRng|) (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|AbelianSemiGroup|) (|SemiGroup|) (|Comparable|)
                 (|SetCategory|) (|BasicType|) (|CoercibleTo| 13)
                 (|unitsKnown|) (|RetractableTo| (|Vector| 8))
                 (|PartialOrder|))
              (|makeByteWordVec2| 63
                                  '(1 0 10 0 11 0 7 0 12 1 7 13 0 14 1 0 16 0
                                    17 2 13 0 0 0 18 1 20 19 0 21 1 8 13 0 22 2
                                    24 13 23 0 25 0 7 0 26 2 7 10 0 0 27 2 13 0
                                    0 0 28 2 13 0 0 0 29 1 9 32 0 33 2 7 0 0 0
                                    34 1 20 0 19 35 2 0 0 7 20 36 2 39 10 0 38
                                    40 1 9 10 0 41 2 39 10 42 0 43 0 0 0 44 1 0
                                    0 16 45 2 9 0 7 8 47 2 9 0 0 0 48 2 0 0 7 0
                                    49 1 0 0 16 50 2 0 0 0 0 51 2 0 10 0 0 1 1
                                    9 10 0 11 1 0 0 19 37 1 0 0 39 46 2 0 0 9 9
                                    1 1 0 58 0 1 2 4 0 0 0 1 2 8 52 0 0 1 2 11
                                    10 0 0 1 0 9 0 1 1 3 56 0 1 1 3 20 0 1 1 0
                                    0 0 1 1 1 52 0 1 1 1 10 0 1 1 0 38 0 1 1 0
                                    60 0 1 1 0 10 0 1 2 0 0 7 20 36 2 0 0 20 7
                                    1 2 5 0 0 0 1 2 5 0 0 0 1 2 0 0 57 0 1 1 0
                                    16 0 17 2 10 7 55 0 1 1 0 15 0 1 1 0 20 0 1
                                    1 0 20 0 1 1 0 7 0 1 1 0 62 0 1 2 0 61 61 0
                                    1 1 0 63 0 1 1 0 0 16 45 1 0 0 16 50 1 1 0
                                    7 1 1 1 0 53 1 1 3 0 20 1 1 0 13 0 30 1 0
                                    59 0 1 2 0 7 0 20 1 0 1 38 1 2 1 0 0 54 1 2
                                    1 0 0 38 1 0 9 0 44 0 1 0 1 2 5 10 0 0 1 2
                                    5 10 0 0 1 2 0 10 0 0 1 2 5 10 0 0 1 2 5 10
                                    0 0 1 2 2 0 0 0 1 1 2 0 0 1 2 0 0 0 0 1 2 2
                                    0 53 0 1 2 9 0 38 0 1 2 1 0 0 0 51 2 0 0 20
                                    7 1 2 0 0 7 20 1 2 0 0 7 0 49 2 0 0 0 7 1 2
                                    0 0 54 0 1)))))
           '|lookupComplete|)) 
