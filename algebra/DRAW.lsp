
(/VERSIONCHECK 2) 

(DEFUN |DRAW;draw;ExSbLTdv;1| (|f| |bind| |l| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1=(|DRAW;draw;ExSbLTdv;1|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS2D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (EXIT
       (SPADCALL (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 22)) (QREFELT $ 25))
                 (SPADCALL |bind| (QREFELT $ 27)) |l| (QREFELT $ 31))))))) 

(DEFUN |DRAW;draw;ExSbTdv;2| (|f| |bind| $)
  (SPADCALL |f| |bind| NIL (QREFELT $ 32))) 

(DEFUN |DRAW;draw;PpcSbLTdv;3| (|ppc| |bind| |l| $)
  (PROG (|curve| |s| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 36))
            . #1=(|DRAW;draw;PpcSbLTdv;3|))
      (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 36)) . #1#)
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS2D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (LETT |curve|
            (SPADCALL
             (SPADCALL |f| (SPADCALL |bind| (QREFELT $ 22)) (QREFELT $ 25))
             (SPADCALL |g| (SPADCALL |bind| (QREFELT $ 22)) (QREFELT $ 25))
             (QREFELT $ 38))
            . #1#)
      (EXIT
       (SPADCALL |curve| (SPADCALL |bind| (QREFELT $ 27)) |l|
                 (QREFELT $ 39))))))) 

(DEFUN |DRAW;draw;PpcSbTdv;4| (|ppc| |bind| $)
  (SPADCALL |ppc| |bind| NIL (QREFELT $ 40))) 

(DEFUN |DRAW;makeObject;PscSbLTs;5| (|psc| |tBind| |l| $)
  (PROG (|curve| |s| |h| |g| |f| |tSeg| |t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL |tBind| (QREFELT $ 22))
            . #1=(|DRAW;makeObject;PscSbLTs;5|))
      (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 27)) . #1#)
      (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 43)) . #1#)
      (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 43)) . #1#)
      (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 43)) . #1#)
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (COND
       ((NULL (SPADCALL |l| '|style| (QREFELT $ 11)))
        (LETT |l|
              (CONS
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
                (QREFELT $ 44))
               |l|)
              . #1#)))
      (LETT |curve|
            (SPADCALL (SPADCALL |f| |t| (QREFELT $ 25))
                      (SPADCALL |g| |t| (QREFELT $ 25))
                      (SPADCALL |h| |t| (QREFELT $ 25)) (QREFELT $ 46))
            . #1#)
      (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 48))))))) 

(DEFUN |DRAW;makeObject;PscSbTs;6| (|psc| |tBind| $)
  (SPADCALL |psc| |tBind| NIL (QREFELT $ 49))) 

(DEFUN |DRAW;draw;PscSbLTdv;7| (|psc| |tBind| |l| $)
  (PROG (|curve| |s| |h| |g| |f| |tSeg| |t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL |tBind| (QREFELT $ 22))
            . #1=(|DRAW;draw;PscSbLTdv;7|))
      (LETT |tSeg| (SPADCALL |tBind| (QREFELT $ 27)) . #1#)
      (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 43)) . #1#)
      (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 43)) . #1#)
      (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 43)) . #1#)
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (COND
       ((NULL (SPADCALL |l| '|style| (QREFELT $ 11)))
        (LETT |l|
              (CONS
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
                (QREFELT $ 44))
               |l|)
              . #1#)))
      (LETT |curve|
            (SPADCALL (SPADCALL |f| |t| (QREFELT $ 25))
                      (SPADCALL |g| |t| (QREFELT $ 25))
                      (SPADCALL |h| |t| (QREFELT $ 25)) (QREFELT $ 46))
            . #1#)
      (EXIT (SPADCALL |curve| |tSeg| |l| (QREFELT $ 52))))))) 

(DEFUN |DRAW;draw;PscSbTdv;8| (|psc| |tBind| $)
  (SPADCALL |psc| |tBind| NIL (QREFELT $ 53))) 

(DEFUN |DRAW;makeObject;Ex2SbLTs;9| (|f| |xBind| |yBind| |l| $)
  (PROG (|ySeg| |y| |xSeg| |x| |s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1=(|DRAW;makeObject;Ex2SbLTs;9|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (COND
       ((NULL (SPADCALL |l| '|style| (QREFELT $ 11)))
        (LETT |l|
              (CONS
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
                (QREFELT $ 44))
               |l|)
              . #1#)))
      (LETT |x| (SPADCALL |xBind| (QREFELT $ 22)) . #1#)
      (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 27)) . #1#)
      (LETT |y| (SPADCALL |yBind| (QREFELT $ 22)) . #1#)
      (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 27)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 56)) |xSeg| |ySeg| |l|
                 (QREFELT $ 57))))))) 

(DEFUN |DRAW;makeObject;Ex2SbTs;10| (|f| |xBind| |yBind| $)
  (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 58))) 

(DEFUN |DRAW;draw;Ex2SbLTdv;11| (|f| |xBind| |yBind| |l| $)
  (PROG (|ySeg| |y| |xSeg| |x| |s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1=(|DRAW;draw;Ex2SbLTdv;11|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (COND
       ((NULL (SPADCALL |l| '|style| (QREFELT $ 11)))
        (LETT |l|
              (CONS
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
                (QREFELT $ 44))
               |l|)
              . #1#)))
      (LETT |x| (SPADCALL |xBind| (QREFELT $ 22)) . #1#)
      (LETT |xSeg| (SPADCALL |xBind| (QREFELT $ 27)) . #1#)
      (LETT |y| (SPADCALL |yBind| (QREFELT $ 22)) . #1#)
      (LETT |ySeg| (SPADCALL |yBind| (QREFELT $ 27)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |f| |x| |y| (QREFELT $ 56)) |xSeg| |ySeg| |l|
                 (QREFELT $ 60))))))) 

(DEFUN |DRAW;draw;Ex2SbTdv;12| (|f| |xBind| |yBind| $)
  (SPADCALL |f| |xBind| |yBind| NIL (QREFELT $ 61))) 

(DEFUN |DRAW;makeObject;Ps2SbLTs;13| (|s| |uBind| |vBind| |l| $)
  (PROG (|surf| |vSeg| |v| |uSeg| |u| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |s| 1 (QREFELT $ 64))
            . #1=(|DRAW;makeObject;Ps2SbLTs;13|))
      (LETT |g| (SPADCALL |s| 2 (QREFELT $ 64)) . #1#)
      (LETT |h| (SPADCALL |s| 3 (QREFELT $ 64)) . #1#)
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (COND
       ((NULL (SPADCALL |l| '|style| (QREFELT $ 11)))
        (LETT |l|
              (CONS
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
                (QREFELT $ 44))
               |l|)
              . #1#)))
      (LETT |u| (SPADCALL |uBind| (QREFELT $ 22)) . #1#)
      (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 27)) . #1#)
      (LETT |v| (SPADCALL |vBind| (QREFELT $ 22)) . #1#)
      (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 27)) . #1#)
      (LETT |surf|
            (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 56))
                      (SPADCALL |g| |u| |v| (QREFELT $ 56))
                      (SPADCALL |h| |u| |v| (QREFELT $ 56)) (QREFELT $ 66))
            . #1#)
      (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 67))))))) 

(DEFUN |DRAW;makeObject;Ps2SbTs;14| (|s| |uBind| |vBind| $)
  (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 68))) 

(DEFUN |DRAW;draw;Ps2SbLTdv;15| (|s| |uBind| |vBind| |l| $)
  (PROG (|surf| |vSeg| |v| |uSeg| |u| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |s| 1 (QREFELT $ 64))
            . #1=(|DRAW;draw;Ps2SbLTdv;15|))
      (LETT |g| (SPADCALL |s| 2 (QREFELT $ 64)) . #1#)
      (LETT |h| (SPADCALL |s| 3 (QREFELT $ 64)) . #1#)
      (COND
       ((NULL (SPADCALL |l| '|title| (QREFELT $ 11)))
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |s| (QREFELT $ 18)) 50 (QREFELT $ 19))
            (LETT |l| (CONS (SPADCALL "FriCAS3D" (QREFELT $ 20)) |l|) . #1#))
           ('T (LETT |l| (CONS (SPADCALL |s| (QREFELT $ 20)) |l|) . #1#)))))))
      (COND
       ((NULL (SPADCALL |l| '|style| (QREFELT $ 11)))
        (LETT |l|
              (CONS
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 13)) (QREFELT $ 15))
                (QREFELT $ 44))
               |l|)
              . #1#)))
      (LETT |u| (SPADCALL |uBind| (QREFELT $ 22)) . #1#)
      (LETT |uSeg| (SPADCALL |uBind| (QREFELT $ 27)) . #1#)
      (LETT |v| (SPADCALL |vBind| (QREFELT $ 22)) . #1#)
      (LETT |vSeg| (SPADCALL |vBind| (QREFELT $ 27)) . #1#)
      (LETT |surf|
            (SPADCALL (SPADCALL |f| |u| |v| (QREFELT $ 56))
                      (SPADCALL |g| |u| |v| (QREFELT $ 56))
                      (SPADCALL |h| |u| |v| (QREFELT $ 56)) (QREFELT $ 66))
            . #1#)
      (EXIT (SPADCALL |surf| |uSeg| |vSeg| |l| (QREFELT $ 70))))))) 

(DEFUN |DRAW;draw;Ps2SbTdv;16| (|s| |uBind| |vBind| $)
  (SPADCALL |s| |uBind| |vBind| NIL (QREFELT $ 71))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctions;|)) 

(DEFUN |TopLevelDrawFunctions| (#1=#:G199)
  (PROG ()
    (RETURN
     (PROG (#2=#:G200)
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
              (HREM |$ConstructorCache| '|TopLevelDrawFunctions|))))))))))) 

(DEFUN |TopLevelDrawFunctions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TopLevelDrawFunctions|))
      (LETT |dv$| (LIST '|TopLevelDrawFunctions| DV$1) . #1#)
      (LETT $ (GETREFV 73) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TopLevelDrawFunctions| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TopLevelDrawFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|List| $)
              (|Symbol|) (|DrawOption|) (0 . |option?|) (|InputForm|)
              (6 . |convert|) (|String|) (11 . |unparse|) (|Integer|)
              (|DisplayPackage|) (16 . |sayLength|) (21 . >) (27 . |title|)
              (|SegmentBinding| (|Float|)) (32 . |variable|)
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|))
              (|MakeFloatCompiledFunction| 6) (37 . |makeFloatFunction|)
              (|Segment| (|Float|)) (43 . |segment|) (|TwoDimensionalViewport|)
              (|List| 10) (|TopLevelDrawFunctionsForCompiledFunctions|)
              (48 . |draw|) |DRAW;draw;ExSbLTdv;1| |DRAW;draw;ExSbTdv;2|
              (|NonNegativeInteger|) (|ParametricPlaneCurve| 6)
              (55 . |coordinate|) (|ParametricPlaneCurve| 23) (61 . |curve|)
              (67 . |draw|) |DRAW;draw;PpcSbLTdv;3| |DRAW;draw;PpcSbTdv;4|
              (|ParametricSpaceCurve| 6) (74 . |coordinate|) (80 . |style|)
              (|ParametricSpaceCurve| 23) (85 . |curve|)
              (|ThreeSpace| (|DoubleFloat|)) (92 . |makeObject|)
              |DRAW;makeObject;PscSbLTs;5| |DRAW;makeObject;PscSbTs;6|
              (|ThreeDimensionalViewport|) (99 . |draw|)
              |DRAW;draw;PscSbLTdv;7| |DRAW;draw;PscSbTdv;8|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (106 . |makeFloatFunction|) (113 . |makeObject|)
              |DRAW;makeObject;Ex2SbLTs;9| |DRAW;makeObject;Ex2SbTs;10|
              (121 . |draw|) |DRAW;draw;Ex2SbLTdv;11| |DRAW;draw;Ex2SbTdv;12|
              (|ParametricSurface| 6) (129 . |coordinate|)
              (|ParametricSurface| 55) (135 . |surface|) (142 . |makeObject|)
              |DRAW;makeObject;Ps2SbLTs;13| |DRAW;makeObject;Ps2SbTs;14|
              (150 . |draw|) |DRAW;draw;Ps2SbLTdv;15| |DRAW;draw;Ps2SbTdv;16|)
           '#(|makeObject| 158 |draw| 201) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
                                                 '(2 10 7 8 9 11 1 6 12 0 13 1
                                                   12 14 0 15 1 17 16 14 18 2
                                                   16 7 0 0 19 1 10 0 14 20 1
                                                   21 9 0 22 2 24 23 6 9 25 1
                                                   21 26 0 27 3 30 28 23 26 29
                                                   31 2 35 6 0 34 36 2 37 0 23
                                                   23 38 3 30 28 37 26 29 39 2
                                                   42 6 0 34 43 1 10 0 14 44 3
                                                   45 0 23 23 23 46 3 30 47 45
                                                   26 29 48 3 30 51 45 26 29 52
                                                   3 24 55 6 9 9 56 4 30 47 55
                                                   26 26 29 57 4 30 51 55 26 26
                                                   29 60 2 63 6 0 34 64 3 65 0
                                                   55 55 55 66 4 30 47 65 26 26
                                                   29 67 4 30 51 65 26 26 29 70
                                                   2 0 47 42 21 50 3 0 47 42 21
                                                   29 49 3 0 47 6 21 21 59 4 0
                                                   47 6 21 21 29 58 3 0 47 63
                                                   21 21 69 4 0 47 63 21 21 29
                                                   68 2 0 28 6 21 33 3 0 28 6
                                                   21 29 32 2 0 28 35 21 41 3 0
                                                   28 35 21 29 40 2 0 51 42 21
                                                   54 3 0 51 42 21 29 53 3 0 51
                                                   6 21 21 62 4 0 51 6 21 21 29
                                                   61 3 0 51 63 21 21 72 4 0 51
                                                   63 21 21 29 71)))))
           '|lookupComplete|)) 
