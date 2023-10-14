
(/VERSIONCHECK 2) 

(DEFUN |RMATRIX;Zero;$;1| ($) (QREFELT $ 12)) 

(DEFUN |RMATRIX;coerce;$Of;2| (|x| $) (SPADCALL |x| (QREFELT $ 15))) 

(DEFUN |RMATRIX;matrix;L$;3| (|l| $)
  (PROG (#1=#:G143 |j| #2=#:G144 |r| #3=#:G141 |i| #4=#:G142 |ll| |ans|
         #5=#:G134 #6=#:G140)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 18))
        (|error| "matrix: wrong number of rows"))
       ('T
        (SEQ
         (SEQ
          (EXIT
           (SEQ (LETT |ll| NIL . #7=(|RMATRIX;matrix;L$;3|))
                (LETT #6# |l| . #7#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |ll|) (QREFELT $ 7) (QREFELT $ 18))
                    (PROGN
                     (LETT #5# (|error| "matrix: wrong number of columns")
                           . #7#)
                     (GO #5#))))))
                (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
          #5# (EXIT #5#))
         (LETT |ans|
               (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (|spadConstant| $ 9)
                         (QREFELT $ 11))
               . #7#)
         (SEQ (LETT |ll| NIL . #7#) (LETT #4# |l| . #7#) (LETT |i| 1 . #7#)
              (LETT #3# (SPADCALL |ans| (QREFELT $ 20)) . #7#) G190
              (COND
               ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                    (PROGN (LETT |ll| (CAR #4#) . #7#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |r| NIL . #7#) (LETT #2# |ll| . #7#)
                     (LETT |j| 1 . #7#)
                     (LETT #1# (SPADCALL |ans| (QREFELT $ 21)) . #7#) G190
                     (COND
                      ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                           (PROGN (LETT |r| (CAR #2#) . #7#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                     (LETT |j|
                           (PROG1 (|inc_SI| |j|) (LETT #2# (CDR #2#) . #7#))
                           . #7#)
                     (GO G190) G191 (EXIT NIL))))
              (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #7#))
                    . #7#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |RMATRIX;row;$IDp;4| (|x| |i| $)
  (SPADCALL (SPADCALL |x| |i| (QREFELT $ 25)) (QREFELT $ 27))) 

(DEFUN |RMATRIX;column;$IDp;5| (|x| |j| $)
  (SPADCALL (SPADCALL |x| |j| (QREFELT $ 29)) (QREFELT $ 31))) 

(DEFUN |RMATRIX;coerce;$M;6| (|x| $) (SPADCALL |x| (QREFELT $ 33))) 

(DEFUN |RMATRIX;rectangularMatrix;M$;7| (|x| $)
  (COND
   ((OR (SPADCALL (QVSIZE |x|) (QREFELT $ 6) (QREFELT $ 18))
        (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 7) (QREFELT $ 18)))
    (|error| "rectangularMatrix: matrix of bad dimensions"))
   ('T (SPADCALL |x| (QREFELT $ 33))))) 

(DEFUN |RMATRIX;rowEchelon;2$;8| (|x| $) (SPADCALL |x| (QREFELT $ 37))) 

(DEFUN |RMATRIX;columnSpace;$L;9| (|x| $)
  (PROG (#1=#:G156 |c| #2=#:G155)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|RMATRIX;columnSpace;$L;9|))
       (SEQ (LETT |c| NIL . #3#) (LETT #1# (SPADCALL |x| (QREFELT $ 40)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 31)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |RMATRIX;rank;$Nni;10| (|x| $) (SPADCALL |x| (QREFELT $ 43))) 

(DEFUN |RMATRIX;nullity;$Nni;11| (|x| $) (SPADCALL |x| (QREFELT $ 45))) 

(DEFUN |RMATRIX;nullSpace;$L;12| (|x| $)
  (PROG (#1=#:G162 |c| #2=#:G161)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|RMATRIX;nullSpace;$L;12|))
       (SEQ (LETT |c| NIL . #3#) (LETT #1# (SPADCALL |x| (QREFELT $ 47)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 31)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |RMATRIX;dimension;Cn;13| ($)
  (SPADCALL (* (QREFELT $ 6) (QREFELT $ 7)) (QREFELT $ 50))) 

(DEFUN |RMATRIX;convert;$If;14| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|rectangularMatrix| (QREFELT $ 54))
         (SPADCALL (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 55)))
   (QREFELT $ 57))) 

(DEFUN |RectangularMatrix| (&REST #1=#:G176)
  (PROG ()
    (RETURN
     (PROG (#2=#:G177)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RectangularMatrix|)
                                           '|domainEqualList|)
                . #3=(|RectangularMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |RectangularMatrix;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RectangularMatrix|))))))))))) 

(DEFUN |RectangularMatrix;| (|#1| |#2| |#3|)
  (PROG (#1=#:G175 |pv$| #2=#:G171 #3=#:G172 #4=#:G174 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|RectangularMatrix|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT DV$3 (|devaluate| |#3|) . #5#)
      (LETT |dv$| (LIST '|RectangularMatrix| DV$1 DV$2 DV$3) . #5#)
      (LETT $ (GETREFV 70) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#3|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#3| '(|Finite|))
                                          (LETT #4#
                                                (|HasCategory| |#3| '(|Field|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#3|
                                                          '(|CommutativeRing|))
                                           #4#)
                                          (AND
                                           (|HasCategory| |#3|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#3|)))
                                           (|HasCategory| |#3|
                                                          '(|SetCategory|)))
                                          (OR
                                           (AND
                                            (|HasCategory| |#3|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                            (|HasCategory| |#3|
                                                           '(|CommutativeRing|)))
                                           (AND
                                            (|HasCategory| |#3|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                            #4#)
                                           (AND
                                            (|HasCategory| |#3|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                            (|HasCategory| |#3| '(|Finite|)))
                                           (AND
                                            (|HasCategory| |#3|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#3|)))
                                            (|HasCategory| |#3|
                                                           '(|SetCategory|))))
                                          (|HasCategory| |#3| '(|BasicType|))
                                          (|HasCategory| |#3|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#3|
                                                         '(|IntegralDomain|))
                                          (LETT #3#
                                                (|HasCategory| |#3|
                                                               '(|AbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#3|
                                                          '(|AbelianGroup|))
                                           #3#)
                                          (LETT #2#
                                                (|HasCategory| |#3|
                                                               '(|ConvertibleTo|
                                                                 (|InputForm|)))
                                                . #5#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#3|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#3|)))
                                               (|HasCategory| |#3|
                                                              '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#3|
                                                              '(|Finite|)))
                                              (AND #3#
                                                   (|HasCategory| |#3|
                                                                  '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|CommutativeRing|))
                                               (|HasCategory| |#3|
                                                              '(|Finite|)))
                                              (AND #4#
                                                   (|HasCategory| |#3|
                                                                  '(|Finite|))))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|RectangularMatrix|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 8192))
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 16384))
      (AND (|HasCategory| |#3| '(|BasicType|)) #1#
           (|augmentPredVector| $ 32768))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (SPADCALL |#1| |#2| (|spadConstant| $ 9) (QREFELT $ 11)))
      (COND
       ((|testBitVector| |pv$| 8)
        (PROGN
         (QSETREFV $ 38
                   (CONS (|dispatchFunction| |RMATRIX;rowEchelon;2$;8|) $))
         (QSETREFV $ 42
                   (CONS (|dispatchFunction| |RMATRIX;columnSpace;$L;9|) $)))))
      (COND
       ((|testBitVector| |pv$| 9)
        (PROGN
         (QSETREFV $ 44 (CONS (|dispatchFunction| |RMATRIX;rank;$Nni;10|) $))
         (QSETREFV $ 46
                   (CONS (|dispatchFunction| |RMATRIX;nullity;$Nni;11|) $))
         (QSETREFV $ 48
                   (CONS (|dispatchFunction| |RMATRIX;nullSpace;$L;12|) $)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 51
                  (CONS (|dispatchFunction| |RMATRIX;dimension;Cn;13|) $))))
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 58
                  (CONS (|dispatchFunction| |RMATRIX;convert;$If;14|) $))))
      $)))) 

(MAKEPROP '|RectangularMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Matrix| 8) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |Zero|) (|NonNegativeInteger|) (4 . |new|)
              'ZERO
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |RMATRIX;Zero;$;1|) $))
              (|OutputForm|) (11 . |coerce|) |RMATRIX;coerce;$Of;2| (|Boolean|)
              (16 . ~=) (|Integer|) (22 . |maxRowIndex|) (27 . |maxColIndex|)
              (|List| 61) |RMATRIX;matrix;L$;3| (|Vector| 8) (32 . |row|)
              (|DirectProduct| 7 8) (38 . |directProduct|) |RMATRIX;row;$IDp;4|
              (43 . |column|) (|DirectProduct| 6 8) (49 . |directProduct|)
              |RMATRIX;column;$IDp;5| (54 . |copy|) |RMATRIX;coerce;$M;6|
              (59 . |ncols|) |RMATRIX;rectangularMatrix;M$;7|
              (64 . |rowEchelon|) (69 . |rowEchelon|) (|List| 24)
              (74 . |columnSpace|) (|List| 30) (79 . |columnSpace|)
              (84 . |rank|) (89 . |rank|) (94 . |nullity|) (99 . |nullity|)
              (104 . |nullSpace|) (109 . |nullSpace|) (|CardinalNumber|)
              (114 . |coerce|) (119 . |dimension|) (|Symbol|) (|InputForm|)
              (123 . |convert|) (128 . |convert|) (|List| $) (133 . |convert|)
              (138 . |convert|) (|List| 60) (|Equation| 8) (|List| 8)
              (|Mapping| 17 8) (|Mapping| 8 8) (|Union| $ '"failed")
              (|PositiveInteger|) (|Mapping| 8 8 8) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 143 |zero?| 149 |symmetric?| 154 |subtractIfCan| 159 |square?|
              165 |size?| 170 |size| 176 |sample| 180 |rowEchelon| 184 |row|
              189 |rectangularMatrix| 195 |rank| 200 |random| 205 |qelt| 209
              |parts| 216 |nullity| 221 |nullSpace| 226 |nrows| 231 |ncols| 236
              |more?| 241 |minRowIndex| 247 |minColIndex| 252 |members| 257
              |member?| 262 |maxRowIndex| 268 |maxColIndex| 273 |matrix| 278
              |map!| 283 |map| 289 |lookup| 302 |listOfLists| 307 |less?| 312
              |latex| 318 |index| 323 |hashUpdate!| 328 |hash| 334 |exquo| 339
              |every?| 345 |eval| 351 |eq?| 377 |enumerate| 383 |empty?| 387
              |empty| 392 |elt| 396 |dimension| 411 |diagonal?| 415 |count| 420
              |copy| 432 |convert| 437 |columnSpace| 442 |column| 447 |coerce|
              453 |any?| 463 |antisymmetric?| 469 |Zero| 474 = 478 / 484 - 490
              + 501 * 507 |#| 537)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 3 4 0 0 0 1 1 11 0 0 2 0 0 6 0 0 0 0 0 6
                                  13))
            (CONS
             '#(|RectangularMatrixCategory&| |VectorSpace&| |Module&| NIL NIL
                NIL |AbelianGroup&| NIL |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| |Finite&|
                |Aggregate&| |SetCategory&| |Evalable&| NIL NIL NIL
                |BasicType&| NIL |InnerEvalable&| NIL)
             (CONS
              '#((|RectangularMatrixCategory| 6 7 8 (|DirectProduct| 7 8)
                                              (|DirectProduct| 6 8))
                 (|VectorSpace| 8) (|Module| 8) (|BiModule| 8 8)
                 (|LeftModule| 8) (|RightModule| 8) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 8) (|AbelianSemiGroup|) (|Finite|)
                 (|Aggregate|) (|SetCategory|) (|Evalable| 8)
                 (|CoercibleTo| (|Matrix| 8)) (|finiteAggregate|) (|Type|)
                 (|BasicType|) (|CoercibleTo| 14) (|InnerEvalable| 8 8)
                 (|ConvertibleTo| 53))
              (|makeByteWordVec2| 69
                                  '(0 8 0 9 3 5 0 10 10 8 11 1 5 14 0 15 2 10
                                    17 0 0 18 1 5 19 0 20 1 5 19 0 21 2 5 24 0
                                    19 25 1 26 0 24 27 2 5 24 0 19 29 1 30 0 24
                                    31 1 5 0 0 33 1 5 10 0 35 1 5 0 0 37 1 0 0
                                    0 38 1 5 39 0 40 1 0 41 0 42 1 5 10 0 43 1
                                    0 10 0 44 1 5 10 0 45 1 0 10 0 46 1 5 39 0
                                    47 1 0 41 0 48 1 49 0 10 50 0 0 49 51 1 53
                                    0 52 54 1 5 53 0 55 1 53 0 56 57 1 0 53 0
                                    58 2 0 17 0 0 1 1 10 17 0 1 1 0 17 0 1 2 1
                                    64 0 0 1 1 0 17 0 1 2 0 17 0 10 1 0 2 10 1
                                    0 0 0 1 1 8 0 0 38 2 0 26 0 19 28 1 0 0 5
                                    36 1 9 10 0 44 0 2 0 1 3 0 8 0 19 19 1 1 15
                                    61 0 1 1 9 10 0 46 1 9 41 0 48 1 0 10 0 1 1
                                    0 10 0 1 2 0 17 0 10 1 1 0 19 0 1 1 0 19 0
                                    1 1 15 61 0 1 2 16 17 8 0 1 1 0 19 0 1 1 0
                                    19 0 1 1 0 0 22 23 2 14 0 63 0 1 3 0 0 66 0
                                    0 1 2 0 0 63 0 1 1 2 65 0 1 1 0 22 0 1 2 0
                                    17 0 10 1 1 0 67 0 1 1 2 0 65 1 2 0 69 69 0
                                    1 1 0 68 0 1 2 9 64 0 8 1 2 15 17 62 0 1 2
                                    5 0 0 59 1 2 5 0 0 60 1 3 5 0 0 61 61 1 3 5
                                    0 0 8 8 1 2 0 17 0 0 1 0 2 56 1 1 0 17 0 1
                                    0 0 0 1 4 0 8 0 19 19 8 1 3 0 8 0 19 19 1 0
                                    3 49 51 1 0 17 0 1 2 16 10 8 0 1 2 15 10 62
                                    0 1 1 0 0 0 1 1 12 53 0 58 1 8 41 0 42 2 0
                                    30 0 19 32 1 0 5 0 34 1 0 14 0 16 2 15 17
                                    62 0 1 1 0 17 0 1 0 10 0 13 2 0 17 0 0 1 2
                                    3 0 0 8 1 1 1 0 0 1 2 1 0 0 0 1 2 0 0 0 0 1
                                    2 1 0 19 0 1 2 10 0 10 0 1 2 0 0 8 0 1 2 0
                                    0 0 8 1 2 0 0 65 0 1 1 15 10 0 1)))))
           '|lookupComplete|)) 
