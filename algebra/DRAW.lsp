
(SDEFUN |DRAW;makeObject;ExSbLGi;1|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |GraphImage|))
        (SPADCALL (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                  (SPADCALL |bind| (QREFELT $ 14)) |l| (QREFELT $ 18))) 

(SDEFUN |DRAW;maybe_add_title|
        ((|f| |Ex|) (|l| |List| (|DrawOption|)) ($ |List| (|DrawOption|)))
        (SPROG ((|s| (|String|)))
               (SEQ
                (COND ((SPADCALL |l| '|title| (QREFELT $ 23)) |l|)
                      (#1='T
                       (SEQ
                        (LETT |s|
                              (SPADCALL (SPADCALL |f| (QREFELT $ 25))
                                        (QREFELT $ 27))
                              |DRAW;maybe_add_title|)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |s| (QREFELT $ 30)) 50
                                     (QREFELT $ 31))
                           (CONS (SPADCALL "FriCAS2D" (QREFELT $ 32)) |l|))
                          (#1# (CONS (SPADCALL |s| (QREFELT $ 32)) |l|)))))))))) 

(SDEFUN |DRAW;maybe_add_title_and_style|
        ((|f| |Ex|) (|l| |List| (|DrawOption|)) ($ |List| (|DrawOption|)))
        (SEQ
         (LETT |l| (|DRAW;maybe_add_title| |f| |l| $)
               |DRAW;maybe_add_title_and_style|)
         (EXIT
          (COND ((SPADCALL |l| '|style| (QREFELT $ 23)) |l|)
                ('T
                 (CONS
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT $ 25)) (QREFELT $ 27))
                   (QREFELT $ 33))
                  |l|)))))) 

(SDEFUN |DRAW;draw;ExSbLTdv;4|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |TwoDimensionalViewport|))
        (SPROG ((|g| (|GraphImage|)))
               (SEQ
                (LETT |l| (|DRAW;maybe_add_title| |f| |l| $)
                      . #1=(|DRAW;draw;ExSbLTdv;4|))
                (LETT |g| (SPADCALL |f| |bind| |l| (QREFELT $ 19)) . #1#)
                (EXIT (SPADCALL |g| |l| (QREFELT $ 35)))))) 

(SDEFUN |DRAW;draw;ExSbTdv;5|
        ((|f| |Ex|) (|bind| |SegmentBinding| (|Float|))
         ($ |TwoDimensionalViewport|))
        (SPADCALL |f| |bind| NIL (QREFELT $ 36))) 

(SDEFUN |DRAW;makeObject;PpcSbLGi;6|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |GraphImage|))
        (SPROG
         ((|curve|
           (|ParametricPlaneCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ
          (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 40))
                . #1=(|DRAW;makeObject;PpcSbLGi;6|))
          (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 40)) . #1#)
          (LETT |curve|
                (SPADCALL
                 (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                 (SPADCALL |g| (SPADCALL |bind| (QREFELT $ 9)) (QREFELT $ 12))
                 (QREFELT $ 42))
                . #1#)
          (EXIT
           (SPADCALL |curve| (SPADCALL |bind| (QREFELT $ 14)) |l|
                     (QREFELT $ 43)))))) 

(SDEFUN |DRAW;draw;PpcSbLTdv;7|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |TwoDimensionalViewport|))
        (SPROG ((|g| (|GraphImage|)) (|f| (|Ex|)))
               (SEQ
                (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 40))
                      . #1=(|DRAW;draw;PpcSbLTdv;7|))
                (LETT |l| (|DRAW;maybe_add_title| |f| |l| $) . #1#)
                (LETT |g| (SPADCALL |ppc| |bind| |l| (QREFELT $ 44)) . #1#)
                (EXIT (SPADCALL |g| |l| (QREFELT $ 35)))))) 

(SDEFUN |DRAW;draw;PpcSbTdv;8|
        ((|ppc| |ParametricPlaneCurve| |Ex|)
         (|bind| |SegmentBinding| (|Float|)) ($ |TwoDimensionalViewport|))
        (SPADCALL |ppc| |bind| NIL (QREFELT $ 45))) 

(SDEFUN |DRAW;makeObject;PscSbLTs;9|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)) (|tSeg| (|Segment| (|Float|)))
          (|t| (|Symbol|)))
         (SEQ
          (LETT |t| (SPADCALL |tBind| (QREFELT $ 9))
                . #1=(|DRAW;makeObject;PscSbLTs;9|))
          (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 14)) . #1#)
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 48)) . #1#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 48)) . #1#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 48)) . #1#)
          (LETT |l| (|DRAW;maybe_add_title_and_style| |f| |l| $) . #1#)
          (LETT |curve|
                (SPADCALL (SPADCALL |f| |t| (QREFELT $ 12))
                          (SPADCALL |g| |t| (QREFELT $ 12))
                          (SPADCALL |h| |t| (QREFELT $ 12)) (QREFELT $ 50))
                . #1#)
          (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 52)))))) 

(SDEFUN |DRAW;makeObject;PscSbTs;10|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |tBind| NIL (QREFELT $ 53))) 

(SDEFUN |DRAW;draw;PscSbLTdv;11|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|curve|
           (|ParametricSpaceCurve|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|))))
          (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)) (|tSeg| (|Segment| (|Float|)))
          (|t| (|Symbol|)))
         (SEQ
          (LETT |t| (SPADCALL |tBind| (QREFELT $ 9))
                . #1=(|DRAW;draw;PscSbLTdv;11|))
          (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 14)) . #1#)
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 48)) . #1#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 48)) . #1#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 48)) . #1#)
          (LETT |l| (|DRAW;maybe_add_title_and_style| |f| |l| $) . #1#)
          (LETT |curve|
                (SPADCALL (SPADCALL |f| |t| (QREFELT $ 12))
                          (SPADCALL |g| |t| (QREFELT $ 12))
                          (SPADCALL |h| |t| (QREFELT $ 12)) (QREFELT $ 50))
                . #1#)
          (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 56)))))) 

(SDEFUN |DRAW;draw;PscSbTdv;12|
        ((|psc| |ParametricSpaceCurve| |Ex|)
         (|tBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |tBind| NIL (QREFELT $ 57))) 

(SDEFUN |DRAW;makeObject;Ex2SbLTs;13|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#))
         (SEQ
          (LETT |l| (|DRAW;maybe_add_title_and_style| |f| |l| $)
                . #3=(|DRAW;makeObject;Ex2SbLTs;13|))
          (LETT |x| (SPADCALL |xBind| (QREFELT $ 9)) . #3#)
          (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 14)) . #3#)
          (LETT |y| (SPADCALL |yBind| (QREFELT $ 9)) . #3#)
          (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 14)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 60)) |xSeg| |ySeg| |l|
                     (QREFELT $ 61)))))) 

(SDEFUN |DRAW;makeObject;Ex2SbTs;14|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 62))) 

(SDEFUN |DRAW;draw;Ex2SbLTdv;15|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|ySeg| #1=(|Segment| (|Float|))) (|y| #2=(|Symbol|)) (|xSeg| #1#)
          (|x| #2#))
         (SEQ
          (LETT |l| (|DRAW;maybe_add_title_and_style| |f| |l| $)
                . #3=(|DRAW;draw;Ex2SbLTdv;15|))
          (LETT |x| (SPADCALL |xBind| (QREFELT $ 9)) . #3#)
          (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 14)) . #3#)
          (LETT |y| (SPADCALL |yBind| (QREFELT $ 9)) . #3#)
          (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 14)) . #3#)
          (EXIT
           (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 60)) |xSeg| |ySeg| |l|
                     (QREFELT $ 64)))))) 

(SDEFUN |DRAW;draw;Ex2SbTdv;16|
        ((|f| |Ex|) (|xBind| |SegmentBinding| (|Float|))
         (|yBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 65))) 

(SDEFUN |DRAW;makeObject;Ps2SbLTs;17|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|surf|
           (|ParametricSurface|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|vSeg| #1=(|Segment| (|Float|))) (|v| #2=(|Symbol|)) (|uSeg| #1#)
          (|u| #2#) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ
          (LETT |f| (SPADCALL |s| 1 (QREFELT $ 68))
                . #3=(|DRAW;makeObject;Ps2SbLTs;17|))
          (LETT |g| (SPADCALL |s| 2 (QREFELT $ 68)) . #3#)
          (LETT |h| (SPADCALL |s| 3 (QREFELT $ 68)) . #3#)
          (LETT |l| (|DRAW;maybe_add_title_and_style| |f| |l| $) . #3#)
          (LETT |u| (SPADCALL |uBind| (QREFELT $ 9)) . #3#)
          (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 14)) . #3#)
          (LETT |v| (SPADCALL |vBind| (QREFELT $ 9)) . #3#)
          (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 14)) . #3#)
          (LETT |surf|
                (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 60))
                          (SPADCALL |g| |u| |v| (QREFELT $ 60))
                          (SPADCALL |h| |u| |v| (QREFELT $ 60)) (QREFELT $ 70))
                . #3#)
          (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 71)))))) 

(SDEFUN |DRAW;makeObject;Ps2SbTs;18|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 72))) 

(SDEFUN |DRAW;draw;Ps2SbLTdv;19|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG
         ((|surf|
           (|ParametricSurface|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|vSeg| #1=(|Segment| (|Float|))) (|v| #2=(|Symbol|)) (|uSeg| #1#)
          (|u| #2#) (|h| (|Ex|)) (|g| (|Ex|)) (|f| (|Ex|)))
         (SEQ
          (LETT |f| (SPADCALL |s| 1 (QREFELT $ 68))
                . #3=(|DRAW;draw;Ps2SbLTdv;19|))
          (LETT |g| (SPADCALL |s| 2 (QREFELT $ 68)) . #3#)
          (LETT |h| (SPADCALL |s| 3 (QREFELT $ 68)) . #3#)
          (LETT |l| (|DRAW;maybe_add_title_and_style| |f| |l| $) . #3#)
          (LETT |u| (SPADCALL |uBind| (QREFELT $ 9)) . #3#)
          (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 14)) . #3#)
          (LETT |v| (SPADCALL |vBind| (QREFELT $ 9)) . #3#)
          (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 14)) . #3#)
          (LETT |surf|
                (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 60))
                          (SPADCALL |g| |u| |v| (QREFELT $ 60))
                          (SPADCALL |h| |u| |v| (QREFELT $ 60)) (QREFELT $ 70))
                . #3#)
          (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 74)))))) 

(SDEFUN |DRAW;draw;Ps2SbTdv;20|
        ((|s| |ParametricSurface| |Ex|) (|uBind| |SegmentBinding| (|Float|))
         (|vBind| |SegmentBinding| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 75))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctions;|)) 

(DEFUN |TopLevelDrawFunctions| (#1=#:G167)
  (SPROG NIL
         (PROG (#2=#:G168)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TopLevelDrawFunctions|)
                                               '|domainEqualList|)
                    . #3=(|TopLevelDrawFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TopLevelDrawFunctions;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TopLevelDrawFunctions|)))))))))) 

(DEFUN |TopLevelDrawFunctions;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TopLevelDrawFunctions|))
          (LETT |dv$| (LIST '|TopLevelDrawFunctions| DV$1) . #1#)
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TopLevelDrawFunctions| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TopLevelDrawFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              (|SegmentBinding| (|Float|)) (0 . |variable|)
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|))
              (|MakeFloatCompiledFunction| 6) (5 . |makeFloatFunction|)
              (|Segment| (|Float|)) (11 . |segment|) (|GraphImage|) (|List| 22)
              (|TopLevelDrawFunctionsForCompiledFunctions|) (16 . |makeObject|)
              |DRAW;makeObject;ExSbLGi;1| (|Boolean|) (|List| $) (|DrawOption|)
              (23 . |option?|) (|InputForm|) (29 . |convert|) (|String|)
              (34 . |unparse|) (|Integer|) (|DisplayPackage|)
              (39 . |sayLength|) (44 . >) (50 . |title|) (55 . |style|)
              (|TwoDimensionalViewport|) (60 . |makeViewport2D|)
              |DRAW;draw;ExSbLTdv;4| |DRAW;draw;ExSbTdv;5|
              (|NonNegativeInteger|) (|ParametricPlaneCurve| 6)
              (66 . |coordinate|) (|ParametricPlaneCurve| 10) (72 . |curve|)
              (78 . |makeObject|) |DRAW;makeObject;PpcSbLGi;6|
              |DRAW;draw;PpcSbLTdv;7| |DRAW;draw;PpcSbTdv;8|
              (|ParametricSpaceCurve| 6) (85 . |coordinate|)
              (|ParametricSpaceCurve| 10) (91 . |curve|)
              (|ThreeSpace| (|DoubleFloat|)) (98 . |makeObject|)
              |DRAW;makeObject;PscSbLTs;9| |DRAW;makeObject;PscSbTs;10|
              (|ThreeDimensionalViewport|) (105 . |draw|)
              |DRAW;draw;PscSbLTdv;11| |DRAW;draw;PscSbTdv;12|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (112 . |makeFloatFunction|) (119 . |makeObject|)
              |DRAW;makeObject;Ex2SbLTs;13| |DRAW;makeObject;Ex2SbTs;14|
              (127 . |draw|) |DRAW;draw;Ex2SbLTdv;15| |DRAW;draw;Ex2SbTdv;16|
              (|ParametricSurface| 6) (135 . |coordinate|)
              (|ParametricSurface| 59) (141 . |surface|) (148 . |makeObject|)
              |DRAW;makeObject;Ps2SbLTs;17| |DRAW;makeObject;Ps2SbTs;18|
              (156 . |draw|) |DRAW;draw;Ps2SbLTdv;19| |DRAW;draw;Ps2SbTdv;20|)
           '#(|makeObject| 164 |draw| 221) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 8 7 0 9 2 11 10 6 7 12 1 8
                                                   13 0 14 3 17 15 10 13 16 18
                                                   2 22 20 21 7 23 1 6 24 0 25
                                                   1 24 26 0 27 1 29 28 26 30 2
                                                   28 20 0 0 31 1 22 0 26 32 1
                                                   22 0 26 33 2 34 0 15 16 35 2
                                                   39 6 0 38 40 2 41 0 10 10 42
                                                   3 17 15 41 13 16 43 2 47 6 0
                                                   38 48 3 49 0 10 10 10 50 3
                                                   17 51 49 13 16 52 3 17 55 49
                                                   13 16 56 3 11 59 6 7 7 60 4
                                                   17 51 59 13 13 16 61 4 17 55
                                                   59 13 13 16 64 2 67 6 0 38
                                                   68 3 69 0 59 59 59 70 4 17
                                                   51 69 13 13 16 71 4 17 55 69
                                                   13 13 16 74 3 0 15 6 8 16 19
                                                   3 0 15 39 8 16 44 3 0 51 47
                                                   8 16 53 2 0 51 47 8 54 4 0
                                                   51 6 8 8 16 62 3 0 51 6 8 8
                                                   63 3 0 51 67 8 8 73 4 0 51
                                                   67 8 8 16 72 2 0 34 6 8 37 3
                                                   0 34 6 8 16 36 3 0 34 39 8
                                                   16 45 2 0 34 39 8 46 3 0 55
                                                   47 8 16 57 2 0 55 47 8 58 4
                                                   0 55 6 8 8 16 65 3 0 55 6 8
                                                   8 66 4 0 55 67 8 8 16 75 3 0
                                                   55 67 8 8 76)))))
           '|lookupComplete|)) 
