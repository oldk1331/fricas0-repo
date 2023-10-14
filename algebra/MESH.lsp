
(SDEFUN |MESH;numberCheck| ((|nums| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((#1=#:G112 NIL) (#2=#:G108 NIL) (#3=#:G113 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |i| (SPADCALL |nums| (QREFELT $ 8))
                        . #4=(|MESH;numberCheck|))
                  (LETT #3# (SPADCALL |nums| (QREFELT $ 9)) . #4#) G190
                  (COND ((> |i| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COMPLEXP
                       (SPADCALL |nums|
                                 (PROG1 (LETT #2# |i| . #4#)
                                   (|check_subtype| (> #2# 0)
                                                    '(|PositiveInteger|) #2#))
                                 (QREFELT $ 11)))
                      (PROGN
                       (LETT #1#
                             (|error|
                              "An unexpected complex number was encountered in the calculations.")
                             . #4#)
                       (GO #5=#:G110))))))
                  (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                #5# (EXIT #1#)))) 

(SDEFUN |MESH;makePt|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) (|z| |DoubleFloat|)
         (|c| . #1=(|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |x| |y| |z| |c|) |MESH;makePt|)
                         (QREFELT $ 13)))) 

(SDEFUN |MESH;ptFunc;3MMM;3|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|h| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|c| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
          (|DoubleFloat|))
         ($ |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|)))
        (SPROG NIL
               (SEQ
                (CONS #'|MESH;ptFunc;3MMM;3!0| (VECTOR $ |c| |h| |g| |f|))))) 

(SDEFUN |MESH;ptFunc;3MMM;3!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|f| |g| |h| |c| $)
          (LETT |f| (QREFELT $$ 4) . #1=(|MESH;ptFunc;3MMM;3|))
          (LETT |g| (QREFELT $$ 3) . #1#)
          (LETT |h| (QREFELT $$ 2) . #1#)
          (LETT |c| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|z| NIL) (|y| NIL) (|x| NIL))
                   (SEQ (LETT |x| (SPADCALL |z1| |z2| |f|) NIL)
                        (LETT |y| (SPADCALL |z1| |z2| |g|) NIL)
                        (LETT |z| (SPADCALL |z1| |z2| |h|) NIL)
                        (EXIT
                         (|MESH;makePt| |x| |y| |z| (SPADCALL |x| |y| |z| |c|)
                          $)))))))) 

(SDEFUN |MESH;meshPar2Var;TsM2SLTs;4|
        ((|sp| . #1=(|ThreeSpace| (|DoubleFloat|)))
         (|ptFun| |Mapping| #2=(|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|opts| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|space| #1#) (|aProp| (|SubSpaceComponentProperty|)) (#3=#:G134 NIL)
          (|lProp| (|List| (|SubSpaceComponentProperty|))) (#4=#:G133 NIL)
          (|l| NIL) (#5=#:G132 NIL) (|someV| #6=(|DoubleFloat|))
          (|llp| (|List| (|List| (|Point| (|DoubleFloat|))))) (|someU| #6#)
          (|lp| (|List| (|Point| (|DoubleFloat|)))) (|pt| #2#) (|iu| NIL)
          (|iv| NIL) (|vstep| #7=(|DoubleFloat|)) (|ustep| #7#)
          (|vNum| (|PositiveInteger|)) (|uNum| (|PositiveInteger|)))
         (SEQ (LETT |llp| NIL . #8=(|MESH;meshPar2Var;TsM2SLTs;4|))
              (LETT |uNum|
                    (SPADCALL |opts| (SPADCALL (QREFELT $ 20)) (QREFELT $ 23))
                    . #8#)
              (LETT |vNum|
                    (SPADCALL |opts| (SPADCALL (QREFELT $ 24)) (QREFELT $ 25))
                    . #8#)
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 27))
                               (SPADCALL |uSeg| (QREFELT $ 28)))
                     |uNum|)
                    . #8#)
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 27))
                               (SPADCALL |vSeg| (QREFELT $ 28)))
                     |vNum|)
                    . #8#)
              (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 28)) . #8#)
              (SEQ (LETT |iv| |vNum| . #8#) G190 (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 27)) . #8#)))
                    (LETT |lp| NIL . #8#)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 28)) . #8#)
                    (SEQ (LETT |iu| |uNum| . #8#) G190
                         (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 27))
                                  . #8#)))
                          (LETT |pt| (SPADCALL |someU| |someV| |ptFun|) . #8#)
                          (|MESH;numberCheck| |pt| $)
                          (LETT |lp| (CONS |pt| |lp|) . #8#)
                          (EXIT
                           (LETT |someU| (|add_DF| |someU| |ustep|) . #8#)))
                         (LETT |iu| (+ |iu| -1) . #8#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |llp| (CONS |lp| |llp|) . #8#)
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #8#)))
                   (LETT |iv| (+ |iv| -1) . #8#) (GO G190) G191 (EXIT NIL))
              (LETT |lProp|
                    (PROGN
                     (LETT #5# NIL . #8#)
                     (SEQ (LETT |l| NIL . #8#) (LETT #4# |llp| . #8#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |l| (CAR #4#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL (QREFELT $ 30)) #5#)
                                  . #8#)))
                          (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #8#)
              (SEQ (LETT |aProp| NIL . #8#) (LETT #3# |lProp| . #8#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |aProp| (CAR #3#) . #8#) NIL))
                     (GO G191)))
                   (SEQ (SPADCALL |aProp| 'NIL (QREFELT $ 32))
                        (EXIT (SPADCALL |aProp| 'NIL (QREFELT $ 33))))
                   (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
              (LETT |aProp| (SPADCALL (QREFELT $ 30)) . #8#)
              (SPADCALL |aProp| 'NIL (QREFELT $ 32))
              (SPADCALL |aProp| 'NIL (QREFELT $ 33)) (LETT |space| |sp| . #8#)
              (SPADCALL |space| |llp| |lProp| |aProp| (QREFELT $ 37))
              (EXIT |space|)))) 

(SDEFUN |MESH;meshPar2Var;M2SLTs;5|
        ((|ptFun| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|opts| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL (QREFELT $ 39))
                      |MESH;meshPar2Var;M2SLTs;5|)
                (EXIT
                 (SPADCALL |sp| |ptFun| |uSeg| |vSeg| |opts| (QREFELT $ 38)))))) 

(PUT '|MESH;zCoord| '|SPADreplace| '(XLAM (|x| |y| |z|) |z|)) 

(SDEFUN |MESH;zCoord|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) (|z| |DoubleFloat|)
         ($ |DoubleFloat|))
        |z|) 

(SDEFUN |MESH;meshPar2Var;3MU2SLTs;7|
        ((|xFun| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|yFun| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|zFun| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|colorFun| |Union|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
                     (|DoubleFloat|))
          "undefined")
         (|uSeg| |Segment| (|DoubleFloat|)) (|vSeg| |Segment| (|DoubleFloat|))
         (|opts| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (COND
         ((QEQCAR |colorFun| 0)
          (SPADCALL
           (SPADCALL |xFun| |yFun| |zFun| (QCDR |colorFun|) (QREFELT $ 17))
           |uSeg| |vSeg| |opts| (QREFELT $ 40)))
         ('T
          (SPADCALL
           (SPADCALL |xFun| |yFun| |zFun| (CONS (|function| |MESH;zCoord|) $)
                     (QREFELT $ 17))
           |uSeg| |vSeg| |opts| (QREFELT $ 40))))) 

(SDEFUN |MESH;meshFun2Var;MU2SLTs;8|
        ((|zFun| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|colorFun| |Union|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
                     (|DoubleFloat|))
          "undefined")
         (|xSeg| |Segment| (|DoubleFloat|)) (|ySeg| |Segment| (|DoubleFloat|))
         (|opts| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL (LIST #'|MESH;meshFun2Var;MU2SLTs;8!0|)
                  (LIST #'|MESH;meshFun2Var;MU2SLTs;8!1|) |zFun| |colorFun|
                  |xSeg| |ySeg| |opts| (QREFELT $ 42))) 

(SDEFUN |MESH;meshFun2Var;MU2SLTs;8!1| ((|z1| NIL) (|z2| NIL) ($$ NIL)) |z2|) 

(SDEFUN |MESH;meshFun2Var;MU2SLTs;8!0| ((|z1| NIL) (|z2| NIL) ($$ NIL)) |z1|) 

(DECLAIM (NOTINLINE |MeshCreationRoutinesForThreeDimensions;|)) 

(DEFUN |MeshCreationRoutinesForThreeDimensions| ()
  (SPROG NIL
         (PROG (#1=#:G185)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|MeshCreationRoutinesForThreeDimensions|)
                    . #2=(|MeshCreationRoutinesForThreeDimensions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|MeshCreationRoutinesForThreeDimensions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|MeshCreationRoutinesForThreeDimensions;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|MeshCreationRoutinesForThreeDimensions|)))))))))) 

(DEFUN |MeshCreationRoutinesForThreeDimensions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MeshCreationRoutinesForThreeDimensions|)
                . #1=(|MeshCreationRoutinesForThreeDimensions|))
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|MeshCreationRoutinesForThreeDimensions| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|MeshCreationRoutinesForThreeDimensions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Point| 10) (0 . |minIndex|)
              (5 . |maxIndex|) (|DoubleFloat|) (10 . |elt|) (|List| 10)
              (16 . |point|) (|Mapping| 7 10 10) (|Mapping| 10 10 10)
              (|Mapping| 10 10 10 10) |MESH;ptFunc;3MMM;3| (|PositiveInteger|)
              (|ViewDefaultsPackage|) (21 . |var1StepsDefault|)
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|)
              (25 . |var1Steps|) (31 . |var2StepsDefault|) (35 . |var2Steps|)
              (|Segment| 10) (41 . |lo|) (46 . |hi|)
              (|SubSpaceComponentProperty|) (51 . |new|) (|Boolean|)
              (55 . |close|) (61 . |solid|) (|List| (|List| 7)) (|List| 29)
              (|ThreeSpace| 10) (67 . |mesh|) |MESH;meshPar2Var;TsM2SLTs;4|
              (75 . |create3Space|) |MESH;meshPar2Var;M2SLTs;5|
              (|Union| 16 '"undefined") |MESH;meshPar2Var;3MU2SLTs;7|
              |MESH;meshFun2Var;MU2SLTs;8| (|Expression| 6) (|Mapping| 10 10))
           '#(|ptFunc| 79 |meshPar2Var| 87 |meshPar1Var| 115 |meshFun2Var| 125)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 7 6 0 8 1 7 6 0 9 2 7 10 0
                                                   6 11 1 7 0 12 13 0 19 18 20
                                                   2 22 18 21 18 23 0 19 18 24
                                                   2 22 18 21 18 25 1 26 10 0
                                                   27 1 26 10 0 28 0 29 0 30 2
                                                   29 31 0 31 32 2 29 31 0 31
                                                   33 4 36 0 0 34 35 29 37 0 36
                                                   0 39 4 0 14 15 15 15 16 17 7
                                                   0 36 15 15 15 41 26 26 21 42
                                                   5 0 36 36 14 26 26 21 38 4 0
                                                   36 14 26 26 21 40 6 0 36 44
                                                   44 44 45 26 21 1 5 0 36 15
                                                   41 26 26 21 43)))))
           '|lookupComplete|)) 

(MAKEPROP '|MeshCreationRoutinesForThreeDimensions| 'NILADIC T) 
