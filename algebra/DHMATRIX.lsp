
(DEFUN |DHMATRIX;identity;$;1| ($)
  (SPADCALL
   (LIST
    (LIST (|spadConstant| $ 7) (|spadConstant| $ 8) (|spadConstant| $ 8)
          (|spadConstant| $ 8))
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 7) (|spadConstant| $ 8)
          (|spadConstant| $ 8))
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 7)
          (|spadConstant| $ 8))
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 8)
          (|spadConstant| $ 7)))
   (QREFELT $ 10))) 

(DEFUN |DHMATRIX;*;$2P;2| (|d| |p| $)
  (PROG (|v|)
    (RETURN
     (SEQ (LETT |v| |p| . #1=(|DHMATRIX;*;$2P;2|))
          (LETT |v| (SPADCALL |v| (|spadConstant| $ 7) (QREFELT $ 13)) . #1#)
          (LETT |v| (SPADCALL |d| |v| (QREFELT $ 14)) . #1#)
          (EXIT
           (SPADCALL
            (LIST (SPADCALL |v| 1 (QREFELT $ 16))
                  (SPADCALL |v| 2 (QREFELT $ 16))
                  (SPADCALL |v| 3 (QREFELT $ 16)))
            (QREFELT $ 19))))))) 

(DEFUN |DHMATRIX;rotatex;R$;3| (|degree| $)
  (PROG (|sinAngle| |cosAngle| |angle|)
    (RETURN
     (SEQ
      (LETT |angle|
            (SPADCALL
             (SPADCALL |degree| (SPADCALL (QREFELT $ 21)) (QREFELT $ 22))
             (SPADCALL 180 (QREFELT $ 23)) (QREFELT $ 24))
            . #1=(|DHMATRIX;rotatex;R$;3|))
      (LETT |cosAngle| (SPADCALL |angle| (QREFELT $ 25)) . #1#)
      (LETT |sinAngle| (SPADCALL |angle| (QREFELT $ 26)) . #1#)
      (EXIT
       (SPADCALL
        (LIST
         (LIST (|spadConstant| $ 7) (|spadConstant| $ 8) (|spadConstant| $ 8)
               (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) |cosAngle|
               (SPADCALL |sinAngle| (QREFELT $ 27)) (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) |sinAngle| |cosAngle| (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 8)
               (|spadConstant| $ 7)))
        (QREFELT $ 10))))))) 

(DEFUN |DHMATRIX;rotatey;R$;4| (|degree| $)
  (PROG (|sinAngle| |cosAngle| |angle|)
    (RETURN
     (SEQ
      (LETT |angle|
            (SPADCALL
             (SPADCALL |degree| (SPADCALL (QREFELT $ 21)) (QREFELT $ 22))
             (SPADCALL 180 (QREFELT $ 23)) (QREFELT $ 24))
            . #1=(|DHMATRIX;rotatey;R$;4|))
      (LETT |cosAngle| (SPADCALL |angle| (QREFELT $ 25)) . #1#)
      (LETT |sinAngle| (SPADCALL |angle| (QREFELT $ 26)) . #1#)
      (EXIT
       (SPADCALL
        (LIST
         (LIST |cosAngle| (|spadConstant| $ 8) |sinAngle| (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) (|spadConstant| $ 7) (|spadConstant| $ 8)
               (|spadConstant| $ 8))
         (LIST (SPADCALL |sinAngle| (QREFELT $ 27)) (|spadConstant| $ 8)
               |cosAngle| (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 8)
               (|spadConstant| $ 7)))
        (QREFELT $ 10))))))) 

(DEFUN |DHMATRIX;rotatez;R$;5| (|degree| $)
  (PROG (|sinAngle| |cosAngle| |angle|)
    (RETURN
     (SEQ
      (LETT |angle|
            (SPADCALL
             (SPADCALL |degree| (SPADCALL (QREFELT $ 21)) (QREFELT $ 22))
             (SPADCALL 180 (QREFELT $ 23)) (QREFELT $ 24))
            . #1=(|DHMATRIX;rotatez;R$;5|))
      (LETT |cosAngle| (SPADCALL |angle| (QREFELT $ 25)) . #1#)
      (LETT |sinAngle| (SPADCALL |angle| (QREFELT $ 26)) . #1#)
      (EXIT
       (SPADCALL
        (LIST
         (LIST |cosAngle| (SPADCALL |sinAngle| (QREFELT $ 27))
               (|spadConstant| $ 8) (|spadConstant| $ 8))
         (LIST |sinAngle| |cosAngle| (|spadConstant| $ 8) (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 7)
               (|spadConstant| $ 8))
         (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 8)
               (|spadConstant| $ 7)))
        (QREFELT $ 10))))))) 

(DEFUN |DHMATRIX;scale;3R$;6| (|scalex| |scaley| |scalez| $)
  (SPADCALL
   (LIST
    (LIST |scalex| (|spadConstant| $ 8) (|spadConstant| $ 8)
          (|spadConstant| $ 8))
    (LIST (|spadConstant| $ 8) |scaley| (|spadConstant| $ 8)
          (|spadConstant| $ 8))
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) |scalez|
          (|spadConstant| $ 8))
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 8)
          (|spadConstant| $ 7)))
   (QREFELT $ 10))) 

(DEFUN |DHMATRIX;translate;3R$;7| (|x| |y| |z| $)
  (SPADCALL
   (LIST
    (LIST (|spadConstant| $ 7) (|spadConstant| $ 8) (|spadConstant| $ 8) |x|)
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 7) (|spadConstant| $ 8) |y|)
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 7) |z|)
    (LIST (|spadConstant| $ 8) (|spadConstant| $ 8) (|spadConstant| $ 8)
          (|spadConstant| $ 7)))
   (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |DenavitHartenbergMatrix;|)) 

(DEFUN |DenavitHartenbergMatrix| (#1=#:G127)
  (PROG ()
    (RETURN
     (PROG (#2=#:G128)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|DenavitHartenbergMatrix|)
                                           '|domainEqualList|)
                . #3=(|DenavitHartenbergMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|DenavitHartenbergMatrix;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|DenavitHartenbergMatrix|))))))))))) 

(DEFUN |DenavitHartenbergMatrix;| (|#1|)
  (PROG (|pv$| #1=#:G124 #2=#:G125 #3=#:G126 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|DenavitHartenbergMatrix|))
      (LETT |dv$| (LIST '|DenavitHartenbergMatrix| DV$1) . #4#)
      (LETT $ (GETREFV 52) . #4#)
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
                                               #3#))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1| '(|Monoid|))
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|DenavitHartenbergMatrix| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 8192))
      (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
           (|augmentPredVector| $ 16384))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DenavitHartenbergMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Matrix| 6) (|local| |#1|) (0 . |One|)
              (4 . |Zero|) (|List| 17) (8 . |matrix|) |DHMATRIX;identity;$;1|
              (|Vector| 6) (13 . |concat|) (19 . *) (|Integer|) (25 . |elt|)
              (|List| 6) (|Point| 6) (31 . |point|) |DHMATRIX;*;$2P;2|
              (36 . |pi|) (40 . *) (46 . |coerce|) (51 . /) (57 . |cos|)
              (62 . |sin|) (67 . -) |DHMATRIX;rotatex;R$;3|
              |DHMATRIX;rotatey;R$;4| |DHMATRIX;rotatez;R$;5|
              |DHMATRIX;scale;3R$;6| |DHMATRIX;translate;3R$;7|
              (|NonNegativeInteger|) (|Boolean|) (|List| 36) (|Equation| 6)
              (|Mapping| 34 6) (|OutputForm|) (|List| 12) (|Union| $ '"failed")
              (|HashState|) (|SingleInteger|) (|String|) (|Void|)
              (|List| (|List| 33)) (|List| $) (|Union| 6 '"one") (|List| 15)
              (|Mapping| 6 15 15) (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(~= 72 |zero?| 78 |zero| 83 |vertConcat| 89 |transpose| 95
              |translate| 105 |symmetric?| 112 |swapRows!| 117 |swapColumns!|
              124 |subMatrix| 131 |squareTop| 140 |square?| 145 |size?| 150
              |setsubMatrix!| 156 |setelt| 164 |setRow!| 180 |setColumn!| 187
              |scale| 194 |scalarMatrix| 201 |sample| 207 |rowEchelon| 211
              |row| 216 |rotatez| 222 |rotatey| 227 |rotatex| 232 |rank| 237
              |qsetelt!| 242 |qelt| 250 |positivePower| 257 |parts| 263
              |nullity| 268 |nullSpace| 273 |nrows| 278 |new| 283 |ncols| 290
              |more?| 295 |minordet| 301 |minRowIndex| 306 |minColIndex| 311
              |members| 316 |member?| 321 |maxRowIndex| 327 |maxColIndex| 332
              |matrix| 337 |map!| 349 |map| 355 |listOfLists| 376 |less?| 381
              |latex| 387 |kronecker_prod1| 392 |kroneckerSum| 403
              |kroneckerProduct| 414 |inverse| 425 |identity| 430 |horizConcat|
              434 |hashUpdate!| 440 |hash| 446 |fill!| 451 |exquo| 457 |every?|
              463 |eval| 469 |eq?| 495 |empty?| 501 |empty| 506 |elt| 510
              |diagonalMatrix| 532 |diagonal?| 542 |determinant| 547 |count|
              552 |copy| 564 |columnSpace| 569 |column| 574 |coerce| 580 |any?|
              590 |antisymmetric?| 596 ^ 601 |Pfaffian| 613 = 618 / 624 - 630 +
              641 * 647 |#| 689)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 (|Vector| 6) (|Vector| 6))
                      (|TwoDimensionalArrayCategory| 6 (|Vector| 6)
                                                     (|Vector| 6))
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 38))
                   (|makeByteWordVec2| 51
                                       '(0 6 0 7 0 6 0 8 1 0 0 9 10 2 12 0 0 6
                                         13 2 0 12 0 12 14 2 12 6 0 15 16 1 18
                                         0 17 19 0 6 0 21 2 6 0 0 0 22 1 6 0 15
                                         23 2 6 0 0 0 24 1 6 0 0 25 1 6 0 0 26
                                         1 6 0 0 27 2 15 34 0 0 1 1 0 34 0 1 2
                                         0 0 33 33 1 2 0 0 0 0 1 1 0 0 0 1 1 0
                                         0 12 1 3 0 0 6 6 6 32 1 0 34 0 1 3 0 0
                                         0 15 15 1 3 0 0 0 15 15 1 5 0 0 0 15
                                         15 15 15 1 1 0 0 0 1 1 0 34 0 1 2 0 34
                                         0 33 1 4 0 0 0 15 15 0 1 4 0 0 0 48 48
                                         0 1 4 0 6 0 15 15 6 1 3 0 0 0 15 12 1
                                         3 0 0 0 15 12 1 3 0 0 6 6 6 31 2 0 0
                                         33 6 1 0 0 0 1 1 9 0 0 1 2 0 12 0 15 1
                                         1 0 0 6 30 1 0 0 6 29 1 0 0 6 28 1 10
                                         33 0 1 4 0 6 0 15 15 6 1 3 0 6 0 15 15
                                         1 2 0 0 0 15 1 1 0 17 0 1 1 10 33 0 1
                                         1 10 39 0 1 1 0 33 0 1 3 0 0 33 33 6 1
                                         1 0 33 0 1 2 0 34 0 33 1 1 11 6 0 1 1
                                         0 15 0 1 1 0 15 0 1 1 13 17 0 1 2 14
                                         34 6 0 1 1 0 15 0 1 1 0 15 0 1 1 0 0 9
                                         10 3 0 0 33 33 49 1 2 0 0 51 0 1 4 0 0
                                         50 0 0 6 1 3 0 0 50 0 0 1 2 0 0 51 0 1
                                         1 0 9 0 1 2 0 34 0 33 1 1 1 43 0 1 7 0
                                         44 0 15 45 46 33 33 47 1 2 0 0 0 0 1 1
                                         0 0 46 1 1 0 0 46 1 2 0 0 0 0 1 1 12
                                         40 0 1 0 0 0 11 2 0 0 0 0 1 2 1 41 41
                                         0 1 1 1 42 0 1 2 0 0 0 6 1 2 10 40 0 6
                                         1 2 13 34 37 0 1 3 2 0 0 6 6 1 3 2 0 0
                                         17 17 1 2 2 0 0 35 1 2 2 0 0 36 1 2 0
                                         34 0 0 1 1 0 34 0 1 0 0 0 1 3 0 0 0 48
                                         48 1 4 0 6 0 15 15 6 1 3 0 6 0 15 15 1
                                         1 0 0 46 1 1 0 0 17 1 1 0 34 0 1 1 11
                                         6 0 1 2 14 33 6 0 1 2 13 33 37 0 1 1 0
                                         0 0 1 1 9 39 0 1 2 0 12 0 15 1 1 5 38
                                         0 1 1 0 0 12 1 2 13 34 37 0 1 1 7 34 0
                                         1 2 12 0 0 15 1 2 8 0 0 33 1 1 11 6 0
                                         1 2 15 34 0 0 1 2 12 0 0 6 1 1 7 0 0 1
                                         2 7 0 0 0 1 2 0 0 0 0 1 2 7 0 15 0 1 2
                                         0 18 0 18 20 2 0 12 0 12 14 2 0 12 12
                                         0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0
                                         1 1 13 33 0 1)))))
           '|lookupComplete|)) 
