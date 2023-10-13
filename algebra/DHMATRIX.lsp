
(/VERSIONCHECK 2) 

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

(DEFUN |DenavitHartenbergMatrix| (#1=#:G147)
  (PROG ()
    (RETURN
     (PROG (#2=#:G148)
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
  (PROG (|pv$| #1=#:G145 #2=#:G146 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|DenavitHartenbergMatrix|))
      (LETT |dv$| (LIST '|DenavitHartenbergMatrix| DV$1) . #3#)
      (LETT $ (GETREFV 50) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #2#))
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
                      . #3#))
      (|haddProp| |$ConstructorCache| '|DenavitHartenbergMatrix| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 1024))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 2048))
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
              |DHMATRIX;scale;3R$;6| |DHMATRIX;translate;3R$;7| (|Boolean|)
              (|NonNegativeInteger|) (|Equation| 6) (|List| 35)
              (|Mapping| 33 6) (|OutputForm|) (|List| 12) (|Union| $ '"failed")
              (|String|) (|SingleInteger|) (|Void|) (|List| (|List| 34))
              (|List| $) (|Union| 6 '"one") (|List| 15) (|Mapping| 6 6 6)
              (|Mapping| 6 6))
           '#(~= 72 |zero| 78 |vertConcat| 84 |transpose| 90 |translate| 100
              |symmetric?| 107 |swapRows!| 112 |swapColumns!| 119 |subMatrix|
              126 |squareTop| 135 |square?| 140 |size?| 145 |setsubMatrix!| 151
              |setelt| 159 |setRow!| 175 |setColumn!| 182 |scale| 189
              |scalarMatrix| 196 |sample| 202 |rowEchelon| 206 |row| 211
              |rotatez| 217 |rotatey| 222 |rotatex| 227 |rank| 232 |qsetelt!|
              237 |qelt| 245 |positivePower| 252 |parts| 258 |nullity| 263
              |nullSpace| 268 |nrows| 273 |new| 278 |ncols| 285 |more?| 290
              |minordet| 296 |minRowIndex| 301 |minColIndex| 306 |members| 311
              |member?| 316 |maxRowIndex| 322 |maxColIndex| 327 |matrix| 332
              |map!| 337 |map| 343 |listOfLists| 364 |less?| 369 |latex| 375
              |kronecker_prod1| 380 |kroneckerSum| 391 |kroneckerProduct| 402
              |inverse| 413 |identity| 418 |horizConcat| 422 |hash| 428 |fill!|
              433 |exquo| 439 |every?| 445 |eval| 451 |eq?| 477 |empty?| 483
              |empty| 488 |elt| 492 |diagonalMatrix| 514 |diagonal?| 524
              |determinant| 529 |count| 534 |copy| 546 |columnSpace| 551
              |column| 556 |coerce| 562 |any?| 572 |antisymmetric?| 578 ^ 583
              |Pfaffian| 595 = 600 / 606 - 612 + 623 * 629 |#| 671)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 2 1 0 0 0 2 1 4))
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
                   (|makeByteWordVec2| 49
                                       '(0 6 0 7 0 6 0 8 1 0 0 9 10 2 12 0 0 6
                                         13 2 0 12 0 12 14 2 12 6 0 15 16 1 18
                                         0 17 19 0 6 0 21 2 6 0 0 0 22 1 6 0 15
                                         23 2 6 0 0 0 24 1 6 0 0 25 1 6 0 0 26
                                         1 6 0 0 27 2 1 33 0 0 1 2 0 0 34 34 1
                                         2 0 0 0 0 1 1 0 0 0 1 1 0 0 12 1 3 0 0
                                         6 6 6 32 1 0 33 0 1 3 0 0 0 15 15 1 3
                                         0 0 0 15 15 1 5 0 0 0 15 15 15 15 1 1
                                         0 0 0 1 1 0 33 0 1 2 0 33 0 34 1 4 0 0
                                         0 15 15 0 1 4 0 0 0 47 47 0 1 4 0 6 0
                                         15 15 6 1 3 0 0 0 15 12 1 3 0 0 0 15
                                         12 1 3 0 0 6 6 6 31 2 0 0 34 6 1 0 0 0
                                         1 1 7 0 0 1 2 0 12 0 15 1 1 0 0 6 30 1
                                         0 0 6 29 1 0 0 6 28 1 8 34 0 1 4 0 6 0
                                         15 15 6 1 3 0 6 0 15 15 1 2 0 0 0 15 1
                                         1 0 17 0 1 1 8 34 0 1 1 8 39 0 1 1 0
                                         34 0 1 3 0 0 34 34 6 1 1 0 34 0 1 2 0
                                         33 0 34 1 1 9 6 0 1 1 0 15 0 1 1 0 15
                                         0 1 1 11 17 0 1 2 12 33 6 0 1 1 0 15 0
                                         1 1 0 15 0 1 1 0 0 9 10 2 0 0 49 0 1 4
                                         0 0 48 0 0 6 1 3 0 0 48 0 0 1 2 0 0 49
                                         0 1 1 0 9 0 1 2 0 33 0 34 1 1 1 41 0 1
                                         7 0 43 0 15 44 45 34 34 46 1 1 0 0 45
                                         1 2 0 0 0 0 1 1 0 0 45 1 2 0 0 0 0 1 1
                                         10 40 0 1 0 0 0 11 2 0 0 0 0 1 1 1 42
                                         0 1 2 0 0 0 6 1 2 8 40 0 6 1 2 11 33
                                         37 0 1 3 2 0 0 17 17 1 2 2 0 0 35 1 3
                                         2 0 0 6 6 1 2 2 0 0 36 1 2 0 33 0 0 1
                                         1 0 33 0 1 0 0 0 1 3 0 0 0 47 47 1 4 0
                                         6 0 15 15 6 1 3 0 6 0 15 15 1 1 0 0 45
                                         1 1 0 0 17 1 1 0 33 0 1 1 9 6 0 1 2 12
                                         34 6 0 1 2 11 34 37 0 1 1 0 0 0 1 1 7
                                         39 0 1 2 0 12 0 15 1 1 3 38 0 1 1 0 0
                                         12 1 2 11 33 37 0 1 1 5 33 0 1 2 10 0
                                         0 15 1 2 6 0 0 34 1 1 9 6 0 1 2 1 33 0
                                         0 1 2 10 0 0 6 1 1 5 0 0 1 2 5 0 0 0 1
                                         2 0 0 0 0 1 2 5 0 15 0 1 2 0 18 0 18
                                         20 2 0 12 12 0 1 2 0 0 0 6 1 2 0 12 0
                                         12 14 2 0 0 6 0 1 2 0 0 0 0 1 1 11 34
                                         0 1)))))
           '|lookupComplete|)) 
