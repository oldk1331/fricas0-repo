
(SDEFUN |VIEW2D;checkViewport| ((|viewport| $) ($ |Boolean|))
        (SPROG ((|i| NIL))
               (SEQ (|sockSendInt| |$ViewportServer| (QVELT |viewport| 0))
                    (LETT |i| (|sockGetInt| |$ViewportServer|)
                          |VIEW2D;checkViewport|)
                    (EXIT
                     (COND
                      ((< |i| 0)
                       (SEQ (QSETVELT |viewport| 0 0)
                            (EXIT
                             (|error|
                              "This viewport has already been closed!"))))
                      ('T 'T)))))) 

(SDEFUN |VIEW2D;doOptions| ((|v| |Rep|) ($ |Void|))
        (QSETVELT |v| 3 (SPADCALL (QVELT |v| 7) "FriCAS2D" (QREFELT $ 21)))) 

(PUT '|VIEW2D;options;$L;3| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 7))) 

(SDEFUN |VIEW2D;options;$L;3| ((|viewport| $) ($ |List| (|DrawOption|)))
        (QVELT |viewport| 7)) 

(SDEFUN |VIEW2D;options;$L$;4|
        ((|viewport| $) (|opts| |List| (|DrawOption|)) ($ $))
        (SEQ (QSETVELT |viewport| 7 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW2D;putGraph;$GiPiV;5|
        ((|viewport| $) (|aGraph| |GraphImage|) (|which| |PositiveInteger|)
         ($ |Void|))
        (SEQ
         (COND
          ((OR (SPADCALL |which| 9 (QREFELT $ 25)) (< |which| 1))
           (|error|
            "Trying to put a graph with a negative index or too big an index")))
         (EXIT
          (SPADCALL (QVELT |viewport| 1) |which| (CONS 0 |aGraph|)
                    (QREFELT $ 29))))) 

(SDEFUN |VIEW2D;getGraph;$PiGi;6|
        ((|viewport| $) (|which| |PositiveInteger|) ($ |GraphImage|))
        (SPROG ((#1=#:G164 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |which| 9 (QREFELT $ 25)) (< |which| 1))
                  (|error|
                   "Trying to get a graph with a negative index or too big an index")))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (QVELT |viewport| 1) |which| (QREFELT $ 33)) 1)
                   (|error| "Graph is undefined!"))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (QVELT |viewport| 1) |which|
                                       (QREFELT $ 33))
                             |VIEW2D;getGraph;$PiGi;6|)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (|GraphImage|) #1#)))))))) 

(PUT '|VIEW2D;graphStates;$V;7| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 2))) 

(SDEFUN |VIEW2D;graphStates;$V;7|
        ((|viewport| $)
         ($ |Vector|
          (|Record| (|:| |scaleX| (|DoubleFloat|))
                    (|:| |scaleY| (|DoubleFloat|))
                    (|:| |deltaX| (|DoubleFloat|))
                    (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                    (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                    (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                    (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                    (|:| |showing| (|Integer|)))))
        (QVELT |viewport| 2)) 

(PUT '|VIEW2D;graphs;$V;8| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 1))) 

(SDEFUN |VIEW2D;graphs;$V;8|
        ((|viewport| $) ($ |Vector| (|Union| (|GraphImage|) "undefined")))
        (QVELT |viewport| 1)) 

(PUT '|VIEW2D;key;$I;9| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW2D;key;$I;9| ((|viewport| $) ($ |Integer|)) (QVELT |viewport| 0)) 

(SDEFUN |VIEW2D;dimensions;$2Nni2PiV;10|
        ((|viewport| $) (|ViewX| |NonNegativeInteger|)
         (|ViewY| |NonNegativeInteger|) (|ViewWidth| |PositiveInteger|)
         (|ViewHeight| |PositiveInteger|) ($ |Void|))
        (SEQ (QSETVELT |viewport| 4 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 5 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW2D;move;$2NniV;11|
        ((|viewport| $) (|xLoc| |NonNegativeInteger|)
         (|yLoc| |NonNegativeInteger|) ($ |Void|))
        (SPROG ((#1=#:G185 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 4 (CONS |xLoc| |yLoc|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                                   (QREFELT $ 42))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 102)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xLoc|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |yLoc|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW2D;move;$2NniV;11|)
                          (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;update;$GiPiV;12|
        ((|viewport| $) (|graph| |GraphImage|) (|slot| |PositiveInteger|)
         ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0 (QREFELT $ 42))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 106)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| $)
                   (SEQ
                    (|sockSendInt| |$ViewportServer|
                                   (SPADCALL |graph| (QREFELT $ 44)))
                    (|sockSendInt| |$ViewportServer| |slot|)
                    (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT $ 45)))))) 

(SDEFUN |VIEW2D;resize;$2PiV;13|
        ((|viewport| $) (|xSize| |PositiveInteger|) (|ySize| |PositiveInteger|)
         ($ |Void|))
        (SPROG ((#1=#:G196 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 5 (CONS |xSize| |ySize|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                                   (QREFELT $ 42))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 103)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xSize|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |ySize|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW2D;resize;$2PiV;13|)
                          (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;translate;$Pi2FV;14|
        ((|viewport| $) (|graphIndex| |PositiveInteger|)
         (|xTranslateF| |Float|) (|yTranslateF| |Float|) ($ |Void|))
        (SPROG
         ((#1=#:G201 NIL) (|yTranslate| #2=(|DoubleFloat|)) (|xTranslate| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xTranslate| (SPADCALL |xTranslateF| (QREFELT $ 12))
                  . #3=(|VIEW2D;translate;$Pi2FV;14|))
            (LETT |yTranslate| (SPADCALL |yTranslateF| (QREFELT $ 12)) . #3#)
            (COND
             ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
              (|error| "Referring to a graph with too big an index")))
            (QSETVELT
             (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48)) 2
             |xTranslate|)
            (QSETVELT
             (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48)) 3
             |yTranslate|)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0 (QREFELT $ 42))
               (PROGN
                (LETT #1#
                      (SEQ (|sockSendInt| |$ViewportServer| 3)
                           (|sockSendInt| |$ViewportServer| 0)
                           (EXIT
                            (COND
                             ((|VIEW2D;checkViewport| |viewport| $)
                              (SEQ
                               (|sockSendInt| |$ViewportServer| |graphIndex|)
                               (|sockSendFloat| |$ViewportServer| |xTranslate|)
                               (|sockSendFloat| |$ViewportServer| |yTranslate|)
                               (EXIT (|sockGetInt| |$ViewportServer|)))))))
                      . #3#)
                (GO #1#)))))))
          #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;scale;$Pi2FV;15|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|xScaleF| |Float|)
         (|yScaleF| |Float|) ($ |Void|))
        (SPROG ((#1=#:G206 NIL) (|yScale| #2=(|DoubleFloat|)) (|xScale| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |xScale| (SPADCALL |xScaleF| (QREFELT $ 12))
                        . #3=(|VIEW2D;scale;$Pi2FV;15|))
                  (LETT |yScale| (SPADCALL |yScaleF| (QREFELT $ 12)) . #3#)
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   0 |xScale|)
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   1 |yScale|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 1)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendFloat| |$ViewportServer|
                                                      |xScale|)
                                     (|sockSendFloat| |$ViewportServer|
                                                      |yScale|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #3#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;viewport2D;$;16| (($ $))
        (VECTOR 0 (MAKEARR1 9 (CONS 1 "undefined"))
                (MAKEARR1 9 (MOVEVEC (MAKE-VEC 12) (QREFELT $ 17))) "FriCAS2D"
                (CONS (SPADCALL (SPADCALL (QREFELT $ 53)) 1 (QREFELT $ 54))
                      (SPADCALL (SPADCALL (QREFELT $ 53)) 2 (QREFELT $ 54)))
                (CONS (SPADCALL (SPADCALL (QREFELT $ 56)) 1 (QREFELT $ 57))
                      (SPADCALL (SPADCALL (QREFELT $ 56)) 2 (QREFELT $ 57)))
                (LIST 0) NIL)) 

(SDEFUN |VIEW2D;makeViewport2D;GiL$;17|
        ((|g| |GraphImage|) (|opts| |List| (|DrawOption|)) ($ $))
        (SPROG ((|viewport| ($)))
               (SEQ
                (LETT |viewport| (SPADCALL (QREFELT $ 58))
                      |VIEW2D;makeViewport2D;GiL$;17|)
                (SPADCALL (QVELT |viewport| 1) 1 (CONS 0 |g|) (QREFELT $ 29))
                (QSETVELT |viewport| 7 |opts|)
                (EXIT (|VIEW2D;makeViewport2D0| |viewport| $))))) 

(SDEFUN |VIEW2D;makeViewport2D;2$;18| ((|viewport| $) ($ $))
        (|VIEW2D;makeViewport2D0| (MOVEVEC (MAKE-VEC 8) |viewport|) $)) 

(SDEFUN |VIEW2D;makeViewport2D0| ((|viewportDollar| $) ($ $))
        (SPROG
         ((|hueShade| (|Integer|))
          (|gs|
           (|Record| (|:| |scaleX| (|DoubleFloat|))
                     (|:| |scaleY| (|DoubleFloat|))
                     (|:| |deltaX| (|DoubleFloat|))
                     (|:| |deltaY| (|DoubleFloat|)) (|:| |points| (|Integer|))
                     (|:| |connect| (|Integer|)) (|:| |spline| (|Integer|))
                     (|:| |axes| (|Integer|)) (|:| |axesColor| (|Palette|))
                     (|:| |units| (|Integer|)) (|:| |unitsColor| (|Palette|))
                     (|:| |showing| (|Integer|))))
          (|g| (|Union| (|GraphImage|) "undefined")) (|i| NIL)
          (|viewport| (|Rep|)))
         (SEQ
          (LETT |viewport| |viewportDollar| . #1=(|VIEW2D;makeViewport2D0|))
          (|VIEW2D;doOptions| |viewport| $)
          (|sayBrightly|
           (LIST
            "   FriCAS2D data being transmitted to the viewport manager..."))
          (|sockSendInt| |$ViewportServer| 3)
          (|sockSendInt| |$ViewportServer| -1)
          (|sockSendString| |$ViewportServer| (QVELT |viewport| 3))
          (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 4)))
          (|sockSendInt| |$ViewportServer| (QCDR (QVELT |viewport| 4)))
          (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 5)))
          (|sockSendInt| |$ViewportServer| (QCDR (QVELT |viewport| 5)))
          (|sockSendInt| |$ViewportServer| (QCAR (QVELT |viewport| 6)))
          (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| 9) (GO G191)))
               (SEQ
                (LETT |g|
                      (SPADCALL (SPADCALL |viewport| (QREFELT $ 38)) |i|
                                (QREFELT $ 33))
                      . #1#)
                (EXIT
                 (COND ((QEQCAR |g| 1) (|sockSendInt| |$ViewportServer| 0))
                       ('T
                        (SEQ
                         (|sockSendInt| |$ViewportServer|
                                        (SPADCALL (QCDR |g|) (QREFELT $ 44)))
                         (LETT |gs|
                               (SPADCALL (SPADCALL |viewport| (QREFELT $ 37))
                                         |i| (QREFELT $ 48))
                               . #1#)
                         (|sockSendFloat| |$ViewportServer| (QVELT |gs| 0))
                         (|sockSendFloat| |$ViewportServer| (QVELT |gs| 1))
                         (|sockSendFloat| |$ViewportServer| (QVELT |gs| 2))
                         (|sockSendFloat| |$ViewportServer| (QVELT |gs| 3))
                         (|sockSendInt| |$ViewportServer| (QVELT |gs| 4))
                         (|sockSendInt| |$ViewportServer| (QVELT |gs| 5))
                         (|sockSendInt| |$ViewportServer| (QVELT |gs| 6))
                         (|sockSendInt| |$ViewportServer| (QVELT |gs| 7))
                         (LETT |hueShade|
                               (+
                                (SPADCALL
                                 (SPADCALL (QVELT |gs| 8) (QREFELT $ 62))
                                 (QREFELT $ 63))
                                (* (SPADCALL (QVELT |gs| 8) (QREFELT $ 64))
                                   (SPADCALL (QREFELT $ 65))))
                               . #1#)
                         (|sockSendInt| |$ViewportServer| |hueShade|)
                         (|sockSendInt| |$ViewportServer| (QVELT |gs| 9))
                         (LETT |hueShade|
                               (+
                                (SPADCALL
                                 (SPADCALL (QVELT |gs| 10) (QREFELT $ 62))
                                 (QREFELT $ 63))
                                (* (SPADCALL (QVELT |gs| 10) (QREFELT $ 64))
                                   (SPADCALL (QREFELT $ 65))))
                               . #1#)
                         (|sockSendInt| |$ViewportServer| |hueShade|)
                         (EXIT
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT |gs| 11))))))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |viewport| 0 (|sockGetInt| |$ViewportServer|))
          (EXIT |viewport|)))) 

(SDEFUN |VIEW2D;graphState;$Pi4Df4IPIPIV;20|
        ((|viewport| $) (|num| |PositiveInteger|) (|sX| |DoubleFloat|)
         (|sY| |DoubleFloat|) (|dX| |DoubleFloat|) (|dY| |DoubleFloat|)
         (|Points| |Integer|) (|Lines| |Integer|) (|Spline| |Integer|)
         (|Axes| |Integer|) (|AxesColor| |Palette|) (|Units| |Integer|)
         (|UnitsColor| |Palette|) (|Showing| |Integer|) ($ |Void|))
        (SPADCALL (QVELT |viewport| 2) |num|
                  (VECTOR |sX| |sY| |dX| |dY| |Points| |Lines| |Spline| |Axes|
                          |AxesColor| |Units| |UnitsColor| |Showing|)
                  (QREFELT $ 66))) 

(SDEFUN |VIEW2D;title;$SV;21| ((|viewport| $) (|Title| |String|) ($ |Void|))
        (SPROG ((#1=#:G243 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 3 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                                   (QREFELT $ 42))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 3)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW2D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|)))))))
                                |VIEW2D;title;$SV;21|)
                          (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;reset;$V;22| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0 (QREFELT $ 42))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 100)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| $)
                   (SEQ (|sockSendInt| |$ViewportServer| 5)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT $ 45)))))) 

(SDEFUN |VIEW2D;axes;$PiSV;23|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G253 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (COND
                   ((EQUAL |onOff| "on")
                    (LETT |status| 1 . #2=(|VIEW2D;axes;$PiSV;23|)))
                   ('T (LETT |status| 0 . #2#)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   7 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 8)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;axes;$PiPV;24|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|color| |Palette|)
         ($ |Void|))
        (SPROG ((#1=#:G258 NIL) (|hueShade| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   8 |color|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 112)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (LETT |hueShade|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |color| (QREFELT $ 62))
                                             (QREFELT $ 63))
                                            (*
                                             (SPADCALL |color| (QREFELT $ 64))
                                             (SPADCALL (QREFELT $ 65))))
                                           . #2=(|VIEW2D;axes;$PiPV;24|))
                                     (|sockSendInt| |$ViewportServer|
                                                    |hueShade|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;units;$PiSV;25|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G263 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (COND
                   ((EQUAL |onOff| "on")
                    (LETT |status| 1 . #2=(|VIEW2D;units;$PiSV;25|)))
                   ('T (LETT |status| 0 . #2#)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   9 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 9)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;units;$PiPV;26|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|color| |Palette|)
         ($ |Void|))
        (SPROG ((#1=#:G268 NIL) (|hueShade| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   10 |color|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 113)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (LETT |hueShade|
                                           (+
                                            (SPADCALL
                                             (SPADCALL |color| (QREFELT $ 62))
                                             (QREFELT $ 63))
                                            (*
                                             (SPADCALL |color| (QREFELT $ 64))
                                             (SPADCALL (QREFELT $ 65))))
                                           . #2=(|VIEW2D;units;$PiPV;26|))
                                     (|sockSendInt| |$ViewportServer|
                                                    |hueShade|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;connect;$PiSV;27|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G273 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (COND
                   ((EQUAL |onOff| "on")
                    (LETT |status| 1 . #2=(|VIEW2D;connect;$PiSV;27|)))
                   ('T (LETT |status| 0 . #2#)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   5 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 3)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;points;$PiSV;28|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G278 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (COND
                   ((EQUAL |onOff| "on")
                    (LETT |status| 1 . #2=(|VIEW2D;points;$PiSV;28|)))
                   ('T (LETT |status| 0 . #2#)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   4 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 2)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;region;$PiSV;29|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G283 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (COND
                   ((EQUAL |onOff| "on")
                    (LETT |status| 1 . #2=(|VIEW2D;region;$PiSV;29|)))
                   ('T (LETT |status| 0 . #2#)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   6 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 4)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;show;$PiSV;30|
        ((|viewport| $) (|graphIndex| |PositiveInteger|) (|onOff| |String|)
         ($ |Void|))
        (SPROG ((#1=#:G288 NIL) (|status| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |graphIndex| 9 (QREFELT $ 25))
                    (|error| "Referring to a graph with too big an index")))
                  (COND
                   ((EQUAL |onOff| "on")
                    (LETT |status| 1 . #2=(|VIEW2D;show;$PiSV;30|)))
                   ('T (LETT |status| 0 . #2#)))
                  (QSETVELT
                   (SPADCALL (QVELT |viewport| 2) |graphIndex| (QREFELT $ 48))
                   11 |status|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 105)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    |graphIndex|)
                                     (|sockSendInt| |$ViewportServer| |status|)
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            . #2#)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;controlPanel;$SV;31|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G294 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on")
                    (PROGN (RPLACA #2=(QVELT |viewport| 6) 1) (QCAR #2#)))
                   ('T (PROGN (RPLACA #3=(QVELT |viewport| 6) 0) (QCAR #3#))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                               (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 3)
                                 (|sockSendInt| |$ViewportServer| 6)
                                 (EXIT
                                  (COND
                                   ((|VIEW2D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QCAR
                                                     (QVELT |viewport| 6)))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|)))))))
                            |VIEW2D;controlPanel;$SV;31|)
                      (GO #1#)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |VIEW2D;close;$V;32| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0 (QREFELT $ 42))
           (SEQ (|sockSendInt| |$ViewportServer| 3)
                (|sockSendInt| |$ViewportServer| 7)
                (EXIT
                 (COND
                  ((|VIEW2D;checkViewport| |viewport| $)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (EXIT (QSETVELT |viewport| 0 0))))))))
          ('T (SPADCALL (QREFELT $ 45)))))) 

(SDEFUN |VIEW2D;coerce;$Of;33| ((|viewport| $) ($ |OutputForm|))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT $ 39)) 0)
          (SPADCALL
           (LIST "Closed or Undefined TwoDimensionalViewport: "
                 (SPADCALL (QVELT |viewport| 3) (QREFELT $ 81)))
           (QREFELT $ 83)))
         ('T
          (SPADCALL
           (LIST "TwoDimensionalViewport: "
                 (SPADCALL (QVELT |viewport| 3) (QREFELT $ 81)))
           (QREFELT $ 83))))) 

(SDEFUN |VIEW2D;write;$3S;34|
        ((|viewport| $) (|Filename| |String|) (|aThingToWrite| |String|)
         ($ |String|))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT $ 86))) 

(SDEFUN |VIEW2D;write;$2S;35|
        ((|viewport| $) (|Filename| |String|) ($ |String|))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT $ 88))
                  (QREFELT $ 86))) 

(SDEFUN |VIEW2D;write;$SLS;36|
        ((|viewport| $) (|Filename| |String|)
         (|thingsToWrite| |List| (|String|)) ($ |String|))
        (SPROG
         ((#1=#:G314 NIL) (|writeTypeInt| (|Integer|)) (#2=#:G316 NIL)
          (|aTypeOfFile| NIL) (|m| (|Integer|)) (|avail| (|List| (|String|)))
          (|stringToSend| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |stringToSend| "" . #3=(|VIEW2D;write;$SLS;36|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |viewport| (QREFELT $ 39)) 0
                             (QREFELT $ 42))
                   (PROGN
                    (LETT #1#
                          (SEQ (|sockSendInt| |$ViewportServer| 3)
                               (|sockSendInt| |$ViewportServer| 110)
                               (EXIT
                                (COND
                                 ((|VIEW2D;checkViewport| |viewport| $)
                                  (SEQ
                                   (|sockSendString| |$ViewportServer|
                                                     |Filename|)
                                   (LETT |m|
                                         (SPADCALL
                                          (LETT |avail|
                                                (SPADCALL (QREFELT $ 90))
                                                . #3#)
                                          (QREFELT $ 91))
                                         . #3#)
                                   (SEQ (LETT |aTypeOfFile| NIL . #3#)
                                        (LETT #2# |thingsToWrite| . #3#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |aTypeOfFile| (CAR #2#)
                                                     . #3#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |writeTypeInt|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |aTypeOfFile|
                                                           (QREFELT $ 92))
                                                 |avail| (QREFELT $ 93))
                                                |m|)
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((< |writeTypeInt| 0)
                                            (|sayBrightly|
                                             (LIST "  > "
                                                   (SPADCALL
                                                    (STRCONC |aTypeOfFile|
                                                             " is not a valid file type for writing a 2D viewport")
                                                    (QREFELT $ 81)))))
                                           ('T
                                            (|sockSendInt| |$ViewportServer|
                                                           (+ |writeTypeInt|
                                                              1))))))
                                        (LETT #2# (CDR #2#) . #3#) (GO G190)
                                        G191 (EXIT NIL))
                                   (|sockSendInt| |$ViewportServer| 0)
                                   (|sockGetInt| |$ViewportServer|)
                                   (EXIT |Filename|))))))
                          . #3#)
                    (GO #1#)))))))
          #1# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |TwoDimensionalViewport;|)) 

(DEFUN |TwoDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G318)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TwoDimensionalViewport|)
                    . #2=(|TwoDimensionalViewport|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TwoDimensionalViewport|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|TwoDimensionalViewport;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|TwoDimensionalViewport|)))))))))) 

(DEFUN |TwoDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TwoDimensionalViewport|)
                . #1=(|TwoDimensionalViewport|))
          (LETT $ (GETREFV 97) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TwoDimensionalViewport| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |key| (|Integer|))
                              (|:| |graphsField|
                                   (|Vector|
                                    (|Union| (|GraphImage|) "undefined")))
                              (|:| |graphStatesField|
                                   (|Vector|
                                    (|Record| (|:| |scaleX| (|DoubleFloat|))
                                              (|:| |scaleY| (|DoubleFloat|))
                                              (|:| |deltaX| (|DoubleFloat|))
                                              (|:| |deltaY| (|DoubleFloat|))
                                              (|:| |points| (|Integer|))
                                              (|:| |connect| (|Integer|))
                                              (|:| |spline| (|Integer|))
                                              (|:| |axes| (|Integer|))
                                              (|:| |axesColor| (|Palette|))
                                              (|:| |units| (|Integer|))
                                              (|:| |unitsColor| (|Palette|))
                                              (|:| |showing| (|Integer|)))))
                              (|:| |title| (|String|))
                              (|:| |moveTo|
                                   (|Record| (|:| X (|NonNegativeInteger|))
                                             (|:| Y (|NonNegativeInteger|))))
                              (|:| |size|
                                   (|Record| (|:| X (|PositiveInteger|))
                                             (|:| Y (|PositiveInteger|))))
                              (|:| |flags|
                                   (|Record| (|:| |showCP| (|Integer|))))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          (QSETREFV $ 17
                    (VECTOR
                     (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 10))
                               (QREFELT $ 12))
                     (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 10))
                               (QREFELT $ 12))
                     0.0 0.0 1 1 0 1 (SPADCALL (QREFELT $ 15)) 0
                     (SPADCALL (QREFELT $ 16)) 1))
          $))) 

(MAKEPROP '|TwoDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|PositiveInteger|)
              (|Float|) (0 . |float|) (|DoubleFloat|) (7 . |convert|)
              (|Palette|) (|ViewDefaultsPackage|) (12 . |axesColorDefault|)
              (16 . |unitsColorDefault|) '|defaultGS| (|String|)
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|) (20 . |title|)
              |VIEW2D;options;$L;3| |VIEW2D;options;$L$;4| (|Boolean|) (26 . >)
              (32 . |One|) (|Union| 31 '"undefined") (|Vector| 27)
              (36 . |setelt|) (|Void|) (|GraphImage|)
              |VIEW2D;putGraph;$GiPiV;5| (43 . |elt|) |VIEW2D;getGraph;$PiGi;6|
              (|Record| (|:| |scaleX| 11) (|:| |scaleY| 11) (|:| |deltaX| 11)
                        (|:| |deltaY| 11) (|:| |points| 7) (|:| |connect| 7)
                        (|:| |spline| 7) (|:| |axes| 7) (|:| |axesColor| 13)
                        (|:| |units| 7) (|:| |unitsColor| 13)
                        (|:| |showing| 7))
              (|Vector| 35) |VIEW2D;graphStates;$V;7| |VIEW2D;graphs;$V;8|
              |VIEW2D;key;$I;9| (|NonNegativeInteger|)
              |VIEW2D;dimensions;$2Nni2PiV;10| (49 . ~=)
              |VIEW2D;move;$2NniV;11| (55 . |key|) (60 . |void|)
              |VIEW2D;update;$GiPiV;12| |VIEW2D;resize;$2PiV;13| (64 . |elt|)
              |VIEW2D;translate;$Pi2FV;14| |VIEW2D;scale;$Pi2FV;15|
              (70 . |Zero|) (|List| 40) (74 . |viewPosDefault|) (78 . |elt|)
              (|List| 8) (84 . |viewSizeDefault|) (88 . |elt|)
              |VIEW2D;viewport2D;$;16| |VIEW2D;makeViewport2D;GiL$;17|
              |VIEW2D;makeViewport2D;2$;18| (|Color|) (94 . |hue|) (99 . |hue|)
              (104 . |shade|) (109 . |numberOfHues|) (113 . |setelt|)
              |VIEW2D;graphState;$Pi4Df4IPIPIV;20| |VIEW2D;title;$SV;21|
              |VIEW2D;reset;$V;22| |VIEW2D;axes;$PiSV;23|
              |VIEW2D;axes;$PiPV;24| |VIEW2D;units;$PiSV;25|
              |VIEW2D;units;$PiPV;26| |VIEW2D;connect;$PiSV;27|
              |VIEW2D;points;$PiSV;28| |VIEW2D;region;$PiSV;29|
              |VIEW2D;show;$PiSV;30| |VIEW2D;controlPanel;$SV;31|
              |VIEW2D;close;$V;32| (|OutputForm|) (120 . |coerce|) (|List| $)
              (125 . |hconcat|) |VIEW2D;coerce;$Of;33| (|List| 18)
              |VIEW2D;write;$SLS;36| |VIEW2D;write;$3S;34|
              (130 . |viewWriteDefault|) |VIEW2D;write;$2S;35|
              (134 . |viewWriteAvailable|) (138 . |minIndex|)
              (143 . |upperCase|) (148 . |position|) (|List| (|Point| 11))
              (|SingleInteger|) (|HashState|))
           '#(~= 154 |write| 160 |viewport2D| 180 |update| 184 |units| 191
              |translate| 205 |title| 213 |show| 219 |scale| 226 |resize| 234
              |reset| 241 |region| 246 |putGraph| 253 |points| 260 |options|
              267 |move| 278 |makeViewport2D| 285 |latex| 296 |key| 301
              |hashUpdate!| 306 |hash| 312 |graphs| 317 |graphStates| 322
              |graphState| 327 |getPickedPoints| 345 |getGraph| 350
              |dimensions| 356 |controlPanel| 365 |connect| 371 |coerce| 378
              |close| 383 |axes| 388 = 402)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 80))
                        (|makeByteWordVec2| 96
                                            '(3 9 0 7 7 8 10 1 9 11 0 12 0 14
                                              13 15 0 14 13 16 2 20 18 19 18 21
                                              2 8 24 0 0 25 0 9 0 26 3 28 27 0
                                              7 27 29 2 28 27 0 7 33 2 7 24 0 0
                                              42 1 31 7 0 44 0 30 0 45 2 36 35
                                              0 7 48 0 9 0 51 0 14 52 53 2 52
                                              40 0 7 54 0 14 55 56 2 55 8 0 7
                                              57 1 13 61 0 62 1 61 7 0 63 1 13
                                              7 0 64 0 61 8 65 3 36 35 0 7 35
                                              66 1 18 80 0 81 1 80 0 82 83 0 14
                                              85 88 0 14 85 90 1 85 7 0 91 1 18
                                              0 0 92 2 85 7 18 0 93 2 0 24 0 0
                                              1 3 0 18 0 18 18 87 3 0 18 0 18
                                              85 86 2 0 18 0 18 89 0 0 0 58 3 0
                                              30 0 31 8 46 3 0 30 0 8 18 72 3 0
                                              30 0 8 13 73 4 0 30 0 8 9 9 49 2
                                              0 30 0 18 68 3 0 30 0 8 18 77 4 0
                                              30 0 8 9 9 50 3 0 30 0 8 8 47 1 0
                                              30 0 69 3 0 30 0 8 18 76 3 0 30 0
                                              31 8 32 3 0 30 0 8 18 75 2 0 0 0
                                              19 23 1 0 19 0 22 3 0 30 0 40 40
                                              43 2 0 0 31 19 59 1 0 0 0 60 1 0
                                              18 0 1 1 0 7 0 39 2 0 96 96 0 1 1
                                              0 95 0 1 1 0 28 0 38 1 0 36 0 37
                                              14 0 30 0 8 11 11 11 11 7 7 7 7
                                              13 7 13 7 67 1 0 94 0 1 2 0 31 0
                                              8 34 5 0 30 0 40 40 8 8 41 2 0 30
                                              0 18 78 3 0 30 0 8 18 74 1 0 80 0
                                              84 1 0 30 0 79 3 0 30 0 8 18 70 3
                                              0 30 0 8 13 71 2 0 24 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TwoDimensionalViewport| 'NILADIC T) 
