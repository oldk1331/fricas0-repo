
(SDEFUN |DRAWCFUN;drawToScaleRanges|
        ((|xVals| |Segment| (|DoubleFloat|))
         (|yVals| |Segment| (|DoubleFloat|)) ($ |List| (|Segment| (|Float|))))
        (SPROG
         ((|pad| (|Float|)) (|yDiff| #1=(|Float|)) (|xDiff| #1#)
          (|yLo| #2=(|Float|)) (|yHi| #2#) (|xLo| #2#) (|xHi| #2#))
         (SEQ
          (LETT |xHi|
                (SPADCALL (SPADCALL |xVals| (QREFELT $ 11)) (QREFELT $ 13))
                . #3=(|DRAWCFUN;drawToScaleRanges|))
          (LETT |xLo|
                (SPADCALL (SPADCALL |xVals| (QREFELT $ 14)) (QREFELT $ 13))
                . #3#)
          (LETT |yHi|
                (SPADCALL (SPADCALL |yVals| (QREFELT $ 11)) (QREFELT $ 13))
                . #3#)
          (LETT |yLo|
                (SPADCALL (SPADCALL |yVals| (QREFELT $ 14)) (QREFELT $ 13))
                . #3#)
          (LETT |xDiff| (SPADCALL |xHi| |xLo| (QREFELT $ 15)) . #3#)
          (LETT |yDiff| (SPADCALL |yHi| |yLo| (QREFELT $ 15)) . #3#)
          (LETT |pad|
                (SPADCALL
                 (SPADCALL (SPADCALL |yDiff| |xDiff| (QREFELT $ 15))
                           (QREFELT $ 16))
                 2 (QREFELT $ 18))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |yDiff| |xDiff| (QREFELT $ 20))
             (LIST
              (SPADCALL (SPADCALL |xLo| |pad| (QREFELT $ 15))
                        (SPADCALL |xHi| |pad| (QREFELT $ 21)) (QREFELT $ 23))
              (SPADCALL (ELT $ 13) |yVals| (QREFELT $ 26))))
            ('T
             (LIST (SPADCALL (ELT $ 13) |xVals| (QREFELT $ 26))
                   (SPADCALL (SPADCALL |yLo| |pad| (QREFELT $ 15))
                             (SPADCALL |yHi| |pad| (QREFELT $ 21))
                             (QREFELT $ 23))))))))) 

(SDEFUN |DRAWCFUN;drawPlot|
        ((|plot| |Plot|) (|l| |List| (|DrawOption|))
         ($ |TwoDimensionalViewport|))
        (SPROG
         ((|crCol| (|Palette|)) (|ptCol| (|Palette|))
          (|ll| (|List| #1=(|Segment| (|Float|)))) (|yRangeFloat| #1#)
          (|xRangeFloat| #1#) (|scaledRanges| (|List| (|Segment| (|Float|))))
          (|yRange| (|Segment| (|DoubleFloat|)))
          (|xRange| (|Segment| (|DoubleFloat|)))
          (|branches| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|clipInfo|
           (|Record| (|:| |brans| (|List| (|List| (|Point| (|DoubleFloat|)))))
                     (|:| |xValues| (|Segment| (|DoubleFloat|)))
                     (|:| |yValues| (|Segment| (|DoubleFloat|)))))
          (|yHi| #2=(|DoubleFloat|)) (|yLo| #2#)
          (|yRangeF| #3=(|Segment| (|Float|))) (|xHi| #2#) (|xLo| #2#)
          (|xRangeF| #3#) (|segList| (|List| (|Segment| (|Float|))))
          (|cl| (|Union| (|Any|) "failed")))
         (SEQ
          (LETT |branches| (SPADCALL |plot| (QREFELT $ 29))
                . #4=(|DRAWCFUN;drawPlot|))
          (LETT |xRange| (SPADCALL |plot| (QREFELT $ 30)) . #4#)
          (LETT |yRange| (SPADCALL |plot| (QREFELT $ 31)) . #4#)
          (SEQ (LETT |cl| (SPADCALL |l| '|clipSegment| (QREFELT $ 36)) . #4#)
               (EXIT
                (COND
                 ((QEQCAR |cl| 1)
                  (COND
                   ((SPADCALL |l| (SPADCALL (QREFELT $ 38)) (QREFELT $ 41))
                    (SEQ
                     (LETT |clipInfo|
                           (COND
                            ((SPADCALL |plot| (QREFELT $ 42))
                             (SPADCALL |plot| (QREFELT $ 45)))
                            (#5='T (SPADCALL |plot| (QREFELT $ 46))))
                           . #4#)
                     (LETT |branches| (QVELT |clipInfo| 0) . #4#)
                     (LETT |xRange| (QVELT |clipInfo| 1) . #4#)
                     (EXIT (LETT |yRange| (QVELT |clipInfo| 2) . #4#))))
                   (#5# "No explicit user-specified clipping")))
                 (#5#
                  (SEQ
                   (LETT |segList| (SPADCALL (QCDR |cl|) (QREFELT $ 50)) . #4#)
                   (EXIT
                    (COND
                     ((NULL |segList|)
                      (|error|
                       "draw: you may specify at least 1 segment for 2D clipping"))
                     ((SPADCALL |segList| 2 (QREFELT $ 52))
                      (|error|
                       "draw: you may specify at most 2 segments for 2D clipping"))
                     (#5#
                      (SEQ (LETT |xLo| 0.0 . #4#) (LETT |xHi| 0.0 . #4#)
                           (LETT |yLo| 0.0 . #4#) (LETT |yHi| 0.0 . #4#)
                           (COND
                            ((NULL (CDR |segList|))
                             (SEQ
                              (LETT |xLo| (SPADCALL |xRange| (QREFELT $ 14))
                                    . #4#)
                              (LETT |xHi| (SPADCALL |xRange| (QREFELT $ 11))
                                    . #4#)
                              (LETT |yRangeF| (|SPADfirst| |segList|) . #4#)
                              (LETT |yLo|
                                    (SPADCALL
                                     (SPADCALL |yRangeF| (QREFELT $ 53))
                                     (QREFELT $ 54))
                                    . #4#)
                              (EXIT
                               (LETT |yHi|
                                     (SPADCALL
                                      (SPADCALL |yRangeF| (QREFELT $ 55))
                                      (QREFELT $ 54))
                                     . #4#))))
                            (#5#
                             (SEQ
                              (LETT |xRangeF| (|SPADfirst| |segList|) . #4#)
                              (LETT |xLo|
                                    (SPADCALL
                                     (SPADCALL |xRangeF| (QREFELT $ 53))
                                     (QREFELT $ 54))
                                    . #4#)
                              (LETT |xHi|
                                    (SPADCALL
                                     (SPADCALL |xRangeF| (QREFELT $ 55))
                                     (QREFELT $ 54))
                                    . #4#)
                              (LETT |yRangeF|
                                    (SPADCALL |segList| (QREFELT $ 56)) . #4#)
                              (LETT |yLo|
                                    (SPADCALL
                                     (SPADCALL |yRangeF| (QREFELT $ 53))
                                     (QREFELT $ 54))
                                    . #4#)
                              (EXIT
                               (LETT |yHi|
                                     (SPADCALL
                                      (SPADCALL |yRangeF| (QREFELT $ 55))
                                      (QREFELT $ 54))
                                     . #4#)))))
                           (LETT |clipInfo|
                                 (SPADCALL |branches| |xLo| |xHi| |yLo| |yHi|
                                           (QREFELT $ 57))
                                 . #4#)
                           (LETT |branches| (QVELT |clipInfo| 0) . #4#)
                           (LETT |xRange| (QVELT |clipInfo| 1) . #4#)
                           (EXIT
                            (LETT |yRange| (QVELT |clipInfo| 2)
                                  . #4#)))))))))))
          (COND
           ((SPADCALL |l| (SPADCALL (QREFELT $ 58)) (QREFELT $ 59))
            (SEQ
             (LETT |scaledRanges|
                   (|DRAWCFUN;drawToScaleRanges| |xRange| |yRange| $) . #4#)
             (EXIT
              (LETT |l| (CONS (SPADCALL |scaledRanges| (QREFELT $ 60)) |l|)
                    . #4#))))
           (#5#
            (SEQ
             (LETT |xRangeFloat| (SPADCALL (ELT $ 61) |xRange| (QREFELT $ 26))
                   . #4#)
             (LETT |yRangeFloat| (SPADCALL (ELT $ 61) |yRange| (QREFELT $ 26))
                   . #4#)
             (EXIT
              (LETT |l|
                    (CONS
                     (SPADCALL
                      (LETT |ll| (LIST |xRangeFloat| |yRangeFloat|) . #4#)
                      (QREFELT $ 60))
                     |l|)
                    . #4#)))))
          (LETT |ptCol| (SPADCALL |l| (SPADCALL (QREFELT $ 64)) (QREFELT $ 65))
                . #4#)
          (LETT |crCol| (SPADCALL |l| (SPADCALL (QREFELT $ 66)) (QREFELT $ 67))
                . #4#)
          (EXIT
           (SPADCALL |branches| |ptCol| |crCol| (SPADCALL (QREFELT $ 69)) |l|
                     (QREFELT $ 72)))))) 

(SDEFUN |DRAWCFUN;normalize|
        ((|seg| |Segment| (|Float|)) ($ |Segment| (|DoubleFloat|)))
        (SPROG ((|b| #1=(|DoubleFloat|)) (|a| #1#))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |seg| (QREFELT $ 53)) (QREFELT $ 54))
                      . #2=(|DRAWCFUN;normalize|))
                (LETT |b|
                      (SPADCALL (SPADCALL |seg| (QREFELT $ 55)) (QREFELT $ 54))
                      . #2#)
                (EXIT
                 (COND ((|eql_DF| |a| |b|) (|error| (QREFELT $ 7)))
                       ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 73)))
                       ('T (SPADCALL |b| |a| (QREFELT $ 73)))))))) 

(SDEFUN |DRAWCFUN;myTrap1|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|f| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
                      . #1=(|DRAWCFUN;myTrap1|))
                (EXIT
                 (COND ((QEQCAR |s| 1) 0.0)
                       (#2='T
                        (SEQ (LETT |r| (QCDR |s|) . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                          (QREFELT $ 74))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |DRAWCFUN;makePt2|
        ((|x| |DoubleFloat|) (|y| . #1=(|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |x| |y|) |DRAWCFUN;makePt2|)
                         (QREFELT $ 77)))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;6|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |TwoDimensionalViewport|))
        (SPROG
         ((|pl| (|Plot|))
          (|ff| (|List| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|c| (|Union| (|Any|) "failed")) (|oldAdaptive| (|Boolean|)))
         (SEQ
          (LETT |oldAdaptive| (SPADCALL (QREFELT $ 78))
                . #1=(|DRAWCFUN;draw;MSLTdv;6|))
          (SPADCALL (SPADCALL |l| |oldAdaptive| (QREFELT $ 79)) (QREFELT $ 80))
          (LETT |ff| (LIST (CONS #'|DRAWCFUN;draw;MSLTdv;6!0| (VECTOR $ |f|)))
                . #1#)
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |c| 1)
                  (LETT |ff|
                        (LIST
                         (CONS #'|DRAWCFUN;draw;MSLTdv;6!1| (VECTOR $ |f|)))
                        . #1#))
                 ('T
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #1#)
                   (EXIT
                    (LETT |ff|
                          (LIST
                           (CONS #'|DRAWCFUN;draw;MSLTdv;6!2|
                                 (VECTOR |cc| $ |ff|)))
                          . #1#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |ff| (QREFELT $ 88))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 89))
                . #1#)
          (SPADCALL |oldAdaptive| (QREFELT $ 80))
          (EXIT (|DRAWCFUN;drawPlot| |pl| |l| $))))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;6!2| ((|x| NIL) ($$ NIL))
        (PROG (|ff| $ |cc|)
          (LETT |ff| (QREFELT $$ 2) . #1=(|DRAWCFUN;draw;MSLTdv;6|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |ff| (QREFELT $ 88)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;6!1| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|DRAWCFUN;draw;MSLTdv;6|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|DRAWCFUN;makePt2| |x| (|DRAWCFUN;myTrap1| |f| |x| $) $))))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;6!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|DRAWCFUN;draw;MSLTdv;6|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|DRAWCFUN;makePt2| (|DRAWCFUN;myTrap1| |f| |x| $) |x| $))))) 

(SDEFUN |DRAWCFUN;draw;MSTdv;7|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) ($ |TwoDimensionalViewport|))
        (SPADCALL |f| |seg| NIL (QREFELT $ 91))) 

(SDEFUN |DRAWCFUN;draw;PpcSLTdv;8|
        ((|ppc| |ParametricPlaneCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |TwoDimensionalViewport|))
        (SPROG
         ((|pl| (|Plot|))
          (|fcn|
           (|List| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|c| (|Union| (|Any|) "failed"))
          (|g| #1=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|f| #1#)
          (|oldAdaptive| (|Boolean|)))
         (SEQ
          (LETT |oldAdaptive| (SPADCALL (QREFELT $ 78))
                . #2=(|DRAWCFUN;draw;PpcSLTdv;8|))
          (SPADCALL (SPADCALL |l| |oldAdaptive| (QREFELT $ 79)) (QREFELT $ 80))
          (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 94)) . #2#)
          (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 94)) . #2#)
          (LETT |fcn|
                (LIST (CONS #'|DRAWCFUN;draw;PpcSLTdv;8!0| (VECTOR |g| $ |f|)))
                . #2#)
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #2#)
               (EXIT
                (COND
                 ((NULL (QEQCAR |c| 1))
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #2#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;draw;PpcSLTdv;8!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #2#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |fcn| (QREFELT $ 88))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 89))
                . #2#)
          (SPADCALL |oldAdaptive| (QREFELT $ 80))
          (EXIT (|DRAWCFUN;drawPlot| |pl| |l| $))))) 

(SDEFUN |DRAWCFUN;draw;PpcSLTdv;8!1| ((|x| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;draw;PpcSLTdv;8|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 88)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;draw;PpcSLTdv;8!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g|)
          (LETT |f| (QREFELT $$ 2) . #1=(|DRAWCFUN;draw;PpcSLTdv;8|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |g| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt2| (|DRAWCFUN;myTrap1| |f| |x| $)
             (|DRAWCFUN;myTrap1| |g| |x| $) $))))) 

(SDEFUN |DRAWCFUN;draw;PpcSTdv;9|
        ((|ppc| |ParametricPlaneCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) ($ |TwoDimensionalViewport|))
        (SPADCALL |ppc| |seg| NIL (QREFELT $ 95))) 

(SDEFUN |DRAWCFUN;makePt4|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) (|z| |DoubleFloat|)
         (|c| . #1=(|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |x| |y| |z| |c|) |DRAWCFUN;makePt4|)
                         (QREFELT $ 77)))) 

(PUT '|DRAWCFUN;id| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DRAWCFUN;id| ((|x| |DoubleFloat|) ($ |DoubleFloat|)) |x|) 

(PUT '|DRAWCFUN;zCoord| '|SPADreplace| '(XLAM (|x| |y| |z|) |z|)) 

(SDEFUN |DRAWCFUN;zCoord|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) (|z| |DoubleFloat|)
         ($ |DoubleFloat|))
        |z|) 

(SDEFUN |DRAWCFUN;colorPoints|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|func| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
          (|DoubleFloat|))
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG ((#1=#:G185 NIL) (|p| NIL) (#2=#:G184 NIL) (|lp| NIL))
               (SEQ
                (SEQ (LETT |lp| NIL . #3=(|DRAWCFUN;colorPoints|))
                     (LETT #2# |llp| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |lp| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |p| 4
                                        (SPADCALL
                                         (SPADCALL |p| 1 (QREFELT $ 97))
                                         (SPADCALL |p| 2 (QREFELT $ 97))
                                         (SPADCALL |p| 3 (QREFELT $ 97))
                                         |func|)
                                        (QREFELT $ 98))))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |llp|)))) 

(SDEFUN |DRAWCFUN;makeObject;PscSLTs;14|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((#1=#:G220 NIL) (|b| NIL)
          (|br| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|c3| #2=(|Union| (|Any|) "failed"))
          (|loops| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|tub| (|TubePlot| (|Plot3D|))) (|rad| (|DoubleFloat|))
          (|pts| (|PositiveInteger|)) (|s| #3=(|ThreeSpace| (|DoubleFloat|)))
          (|pl| (|Plot3D|))
          (|fcn|
           (|List| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|c| #2#) (|pointsColored?| (|Boolean|)) (|c1| #2#)
          (|h| #4=(|Mapping| (|DoubleFloat|) (|DoubleFloat|))) (|g| #4#)
          (|f| #4#) (|sp| #3#))
         (SEQ
          (LETT |sp| (SPADCALL |l| (QREFELT $ 100))
                . #5=(|DRAWCFUN;makeObject;PscSLTs;14|))
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 102)) . #5#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 102)) . #5#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 102)) . #5#)
          (LETT |fcn|
                (LIST
                 (CONS #'|DRAWCFUN;makeObject;PscSLTs;14!0|
                       (VECTOR |h| |g| $ |f|)))
                . #5#)
          (LETT |pointsColored?| 'NIL . #5#)
          (SEQ
           (LETT |c1| (SPADCALL |l| '|colorFunction1| (QREFELT $ 36)) . #5#)
           (EXIT
            (COND
             ((NULL (QEQCAR |c1| 1))
              (SEQ (LETT |pointsColored?| 'T . #5#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;PscSLTs;14!1|
                                 (VECTOR |c1| |h| |g| $ |f|)))
                          . #5#)))))))
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #5#)
               (EXIT
                (COND
                 ((NULL (QEQCAR |c| 1))
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #5#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;PscSLTs;14!2|
                                 (VECTOR |cc| $ |fcn|)))
                          . #5#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |fcn| (QREFELT $ 88))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 106))
                . #5#)
          (LETT |s| |sp| . #5#)
          (EXIT
           (COND
            ((SPADCALL |l| '|tubeRadius| (QREFELT $ 107))
             (SEQ (LETT |pts| (SPADCALL |l| 8 (QREFELT $ 108)) . #5#)
                  (LETT |rad|
                        (SPADCALL
                         (SPADCALL |l| (SPADCALL 25 -2 10 (QREFELT $ 109))
                                   (QREFELT $ 110))
                         (QREFELT $ 54))
                        . #5#)
                  (LETT |tub| (SPADCALL |pl| |rad| |pts| (QREFELT $ 113))
                        . #5#)
                  (LETT |loops| (SPADCALL |tub| (QREFELT $ 114)) . #5#)
                  (COND
                   ((NULL |pointsColored?|)
                    (SEQ
                     (LETT |c3| (SPADCALL |l| '|colorFunction3| (QREFELT $ 36))
                           . #5#)
                     (EXIT
                      (COND
                       ((QEQCAR |c3| 1)
                        (|DRAWCFUN;colorPoints| |loops|
                         (CONS (|function| |DRAWCFUN;zCoord|) $) $))
                       (#6='T
                        (|DRAWCFUN;colorPoints| |loops|
                         (SPADCALL (QCDR |c3|) (QREFELT $ 117)) $)))))))
                  (SPADCALL |s| |loops| 'NIL 'NIL (QREFELT $ 118)) (EXIT |s|)))
            (#6#
             (SEQ (LETT |br| (SPADCALL |pl| (QREFELT $ 119)) . #5#)
                  (SEQ (LETT |b| NIL . #5#) (LETT #1# |br| . #5#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (SPADCALL |s| |b| (QREFELT $ 121))))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))))))) 

(SDEFUN |DRAWCFUN;makeObject;PscSLTs;14!2| ((|x| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;PscSLTs;14|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 88)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;makeObject;PscSLTs;14!1| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h| |c1|)
          (LETT |f| (QREFELT $$ 4) . #1=(|DRAWCFUN;makeObject;PscSLTs;14|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |g| (QREFELT $$ 2) . #1#)
          (LETT |h| (QREFELT $$ 1) . #1#)
          (LETT |c1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4| (|DRAWCFUN;myTrap1| |f| |x| $)
             (|DRAWCFUN;myTrap1| |g| |x| $) (|DRAWCFUN;myTrap1| |h| |x| $)
             (SPADCALL |x| (SPADCALL (QCDR |c1|) (QREFELT $ 104))) $))))) 

(SDEFUN |DRAWCFUN;makeObject;PscSLTs;14!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h|)
          (LETT |f| (QREFELT $$ 3) . #1=(|DRAWCFUN;makeObject;PscSLTs;14|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |g| (QREFELT $$ 1) . #1#)
          (LETT |h| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4| (|DRAWCFUN;myTrap1| |f| |x| $)
             (|DRAWCFUN;myTrap1| |g| |x| $) (|DRAWCFUN;myTrap1| |h| |x| $)
             (|DRAWCFUN;myTrap1| (CONS (|function| |DRAWCFUN;id|) $) |x| $)
             $))))) 

(SDEFUN |DRAWCFUN;makeObject;MSLTs;15|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((#1=#:G238 NIL) (|b| NIL)
          (|br| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|loops| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|tub| (|TubePlot| (|Plot3D|))) (|rad| (|DoubleFloat|))
          (|pts| (|PositiveInteger|)) (|s| #2=(|ThreeSpace| (|DoubleFloat|)))
          (|pl| (|Plot3D|))
          (|fcn|
           (|List| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|c| #3=(|Union| (|Any|) "failed")) (|pointsColored?| (|Boolean|))
          (|c1| #3#) (|sp| #2#))
         (SEQ
          (LETT |sp| (SPADCALL |l| (QREFELT $ 100))
                . #4=(|DRAWCFUN;makeObject;MSLTs;15|))
          (LETT |fcn| (LIST |psc|) . #4#) (LETT |pointsColored?| 'NIL . #4#)
          (SEQ
           (LETT |c1| (SPADCALL |l| '|colorFunction1| (QREFELT $ 36)) . #4#)
           (EXIT
            (COND
             ((NULL (QEQCAR |c1| 1))
              (SEQ (LETT |pointsColored?| 'T . #4#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;MSLTs;15!0|
                                 (VECTOR $ |c1| |psc|)))
                          . #4#)))))))
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #4#)
               (EXIT
                (COND
                 ((NULL (QEQCAR |c| 1))
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #4#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;MSLTs;15!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #4#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |fcn| (QREFELT $ 88))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 106))
                . #4#)
          (LETT |s| |sp| . #4#)
          (EXIT
           (COND
            ((SPADCALL |l| '|tubeRadius| (QREFELT $ 107))
             (SEQ (LETT |pts| (SPADCALL |l| 8 (QREFELT $ 108)) . #4#)
                  (LETT |rad|
                        (SPADCALL
                         (SPADCALL |l| (SPADCALL 25 -2 10 (QREFELT $ 109))
                                   (QREFELT $ 110))
                         (QREFELT $ 54))
                        . #4#)
                  (LETT |tub| (SPADCALL |pl| |rad| |pts| (QREFELT $ 113))
                        . #4#)
                  (LETT |loops| (SPADCALL |tub| (QREFELT $ 114)) . #4#)
                  (SPADCALL |s| |loops| 'NIL 'NIL (QREFELT $ 118)) (EXIT |s|)))
            ('T
             (SEQ (LETT |br| (SPADCALL |pl| (QREFELT $ 119)) . #4#)
                  (SEQ (LETT |b| NIL . #4#) (LETT #1# |br| . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (SPADCALL |s| |b| (QREFELT $ 121))))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))))))) 

(SDEFUN |DRAWCFUN;makeObject;MSLTs;15!1| ((|x| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;MSLTs;15|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 88)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;makeObject;MSLTs;15!0| ((|x| NIL) ($$ NIL))
        (PROG (|psc| |c1| $)
          (LETT |psc| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;MSLTs;15|))
          (LETT |c1| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |psc|)
                      (SPADCALL |x| (SPADCALL (QCDR |c1|) (QREFELT $ 104)))
                      (QREFELT $ 123)))))) 

(SDEFUN |DRAWCFUN;makeObject;PscSTs;16|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 122))) 

(SDEFUN |DRAWCFUN;makeObject;MSTs;17|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 124))) 

(SDEFUN |DRAWCFUN;draw;PscSLTdv;18|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL |psc| |seg| |l| (QREFELT $ 122))
                      |DRAWCFUN;draw;PscSLTdv;18|)
                (EXIT (SPADCALL |sp| |l| (QREFELT $ 128)))))) 

(SDEFUN |DRAWCFUN;draw;PscSTdv;19|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 129))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;20|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL |psc| |seg| |l| (QREFELT $ 124))
                      |DRAWCFUN;draw;MSLTdv;20|)
                (EXIT (SPADCALL |sp| |l| (QREFELT $ 128)))))) 

(SDEFUN |DRAWCFUN;draw;MSTdv;21|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 131))) 

(SDEFUN |DRAWCFUN;myTrap2|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|u| |DoubleFloat|) (|v| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |u| |v| |ff|))
                      . #1=(|DRAWCFUN;myTrap2|))
                (EXIT
                 (COND ((QEQCAR |s| 1) 0.0)
                       (#2='T
                        (SEQ (LETT |r| (QCDR |s|) . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                          (QREFELT $ 74))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |DRAWCFUN;recolor;MMM;23|
        ((|ptFunc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|colFunc| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
          (|DoubleFloat|))
         ($ |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|)))
        (SPROG NIL
               (SEQ
                (CONS #'|DRAWCFUN;recolor;MMM;23!0|
                      (VECTOR |colFunc| $ |ptFunc|))))) 

(SDEFUN |DRAWCFUN;recolor;MMM;23!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|ptFunc| $ |colFunc|)
          (LETT |ptFunc| (QREFELT $$ 2) . #1=(|DRAWCFUN;recolor;MMM;23|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |colFunc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|pt| NIL))
                   (SEQ (LETT |pt| (SPADCALL |f1| |f2| |ptFunc|) NIL)
                        (SPADCALL |pt| 4
                                  (SPADCALL
                                   (SPADCALL |pt| (|spadConstant| $ 134)
                                             (QREFELT $ 97))
                                   (SPADCALL |pt| 2 (QREFELT $ 97))
                                   (SPADCALL |pt| 3 (QREFELT $ 97)) |colFunc|)
                                  (QREFELT $ 98))
                        (EXIT |pt|))))))) 

(PUT '|DRAWCFUN;xCoord| '|SPADreplace| '(XLAM (|x| |y|) |x|)) 

(SDEFUN |DRAWCFUN;xCoord|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) ($ |DoubleFloat|)) |x|) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|mesh| (|ThreeSpace| (|DoubleFloat|)))
          (|fcn|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
                       (|DoubleFloat|))))
          (|c| #1=(|Union| (|Any|) "failed"))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|col2|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|pointsColored?| (|Boolean|)) (|c2| #1#)
          (|sp| (|ThreeSpace| (|DoubleFloat|))))
         (SEQ
          (LETT |sp| (SPADCALL |l| (QREFELT $ 100))
                . #2=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT |col2| (LIST (CONS (|function| |DRAWCFUN;xCoord|) $)) . #2#)
          (LETT |pointsColored?| 'NIL . #2#)
          (SEQ
           (LETT |c2| (SPADCALL |l| '|colorFunction2| (QREFELT $ 36)) . #2#)
           (EXIT
            (COND
             ((NULL (QEQCAR |c2| 1))
              (SEQ (LETT |pointsColored?| 'T . #2#)
                   (EXIT
                    (LETT |col2| (LIST (SPADCALL (QCDR |c2|) (QREFELT $ 139)))
                          . #2#)))))))
          (LETT |fcn|
                (LIST
                 (CONS #'|DRAWCFUN;makeObject;M2SLTs;25!0|
                       (VECTOR |col2| $ |f|)))
                . #2#)
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #2#)
               (EXIT
                (COND
                 ((QEQCAR |c| 1)
                  (LETT |fcn|
                        (LIST
                         (CONS #'|DRAWCFUN;makeObject;M2SLTs;25!1|
                               (VECTOR |col2| $ |f|)))
                        . #2#))
                 (#3='T
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #2#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;M2SLTs;25!2|
                                 (VECTOR |cc| $ |fcn|)))
                          . #2#)))))))
          (COND
           ((NULL |pointsColored?|)
            (SEQ
             (LETT |c| (SPADCALL |l| '|colorFunction3| (QREFELT $ 36)) . #2#)
             (EXIT
              (LETT |fcn|
                    (COND
                     ((QEQCAR |c| 1)
                      (LIST
                       (SPADCALL (SPADCALL |fcn| (QREFELT $ 143))
                                 (CONS (|function| |DRAWCFUN;zCoord|) $)
                                 (QREFELT $ 136))))
                     (#3#
                      (LIST
                       (SPADCALL (SPADCALL |fcn| (QREFELT $ 143))
                                 (SPADCALL (QCDR |c|) (QREFELT $ 117))
                                 (QREFELT $ 136)))))
                    . #2#)))))
          (LETT |mesh|
                (SPADCALL |sp| (SPADCALL |fcn| (QREFELT $ 143))
                          (|DRAWCFUN;normalize| |xSeg| $)
                          (|DRAWCFUN;normalize| |ySeg| $) |l| (QREFELT $ 145))
                . #2#)
          (EXIT |mesh|)))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25!2| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| (SPADCALL |fcn| (QREFELT $ 143)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25!1| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |col2|)
          (LETT |f| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |col2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4| |x| |y| (|DRAWCFUN;myTrap2| |f| |x| |y| $)
             (SPADCALL |x| |y| (SPADCALL |col2| (QREFELT $ 141))) $))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |col2|)
          (LETT |f| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |col2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4| (|DRAWCFUN;myTrap2| |f| |x| |y| $) |x| |y|
             (SPADCALL |x| |y| (SPADCALL |col2| (QREFELT $ 141))) $))))) 

(SDEFUN |DRAWCFUN;makeObject;M2STs;26|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |f| |xSeg| |ySeg| NIL (QREFELT $ 146))) 

(SDEFUN |DRAWCFUN;draw;M2SLTdv;27|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeDimensionalViewport|))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL |f| |xSeg| |ySeg| |l| (QREFELT $ 146))
                      |DRAWCFUN;draw;M2SLTdv;27|)
                (EXIT (SPADCALL |sp| |l| (QREFELT $ 128)))))) 

(SDEFUN |DRAWCFUN;draw;M2STdv;28|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         ($ |ThreeDimensionalViewport|))
        (SPADCALL |f| |xSeg| |ySeg| NIL (QREFELT $ 148))) 

(SDEFUN |DRAWCFUN;makeObject;Ps2SLTs;29|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|mesh| (|ThreeSpace| (|DoubleFloat|)))
          (|fcn|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
                       (|DoubleFloat|))))
          (|col3|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
                       (|DoubleFloat|))))
          (|c| #1=(|Union| (|Any|) "failed"))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|col2|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|pointsColored?| (|Boolean|)) (|c2| #1#)
          (|h|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|g|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|f|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|sp| (|ThreeSpace| (|DoubleFloat|))))
         (SEQ
          (LETT |sp| (SPADCALL |l| (QREFELT $ 100))
                . #2=(|DRAWCFUN;makeObject;Ps2SLTs;29|))
          (LETT |f|
                (LIST (SPADCALL |s| (|spadConstant| $ 150) (QREFELT $ 152)))
                . #2#)
          (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 152))) . #2#)
          (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 152))) . #2#)
          (LETT |col2| (LIST (CONS (|function| |DRAWCFUN;xCoord|) $)) . #2#)
          (LETT |pointsColored?| 'NIL . #2#)
          (SEQ
           (LETT |c2| (SPADCALL |l| '|colorFunction2| (QREFELT $ 36)) . #2#)
           (EXIT
            (COND
             ((NULL (QEQCAR |c2| 1))
              (SEQ (LETT |pointsColored?| 'T . #2#)
                   (EXIT
                    (LETT |col2| (LIST (SPADCALL (QCDR |c2|) (QREFELT $ 139)))
                          . #2#)))))))
          (LETT |fcn|
                (LIST
                 (CONS #'|DRAWCFUN;makeObject;Ps2SLTs;29!0|
                       (VECTOR |col2| |h| |g| $ |f|)))
                . #2#)
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #2#)
               (EXIT
                (COND
                 ((NULL (QEQCAR |c| 1))
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #2#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;Ps2SLTs;29!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #2#)))))))
          (COND
           ((NULL |pointsColored?|)
            (SEQ
             (LETT |col3| (LIST (CONS (|function| |DRAWCFUN;zCoord|) $)) . #2#)
             (SEQ
              (LETT |c| (SPADCALL |l| '|colorFunction3| (QREFELT $ 36)) . #2#)
              (EXIT
               (COND
                ((NULL (QEQCAR |c| 1))
                 (LETT |col3| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 117)))
                       . #2#)))))
             (EXIT
              (LETT |fcn|
                    (LIST
                     (SPADCALL (SPADCALL |fcn| (QREFELT $ 143))
                               (SPADCALL |col3| (QREFELT $ 154))
                               (QREFELT $ 136)))
                    . #2#)))))
          (LETT |mesh|
                (SPADCALL |sp| (SPADCALL |fcn| (QREFELT $ 143))
                          (|DRAWCFUN;normalize| |uSeg| $)
                          (|DRAWCFUN;normalize| |vSeg| $) |l| (QREFELT $ 145))
                . #2#)
          (EXIT |mesh|)))) 

(SDEFUN |DRAWCFUN;makeObject;Ps2SLTs;29!1| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;Ps2SLTs;29|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| (SPADCALL |fcn| (QREFELT $ 143)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;makeObject;Ps2SLTs;29!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |g| |h| |col2|)
          (LETT |f| (QREFELT $$ 4) . #1=(|DRAWCFUN;makeObject;Ps2SLTs;29|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |g| (QREFELT $$ 2) . #1#)
          (LETT |h| (QREFELT $$ 1) . #1#)
          (LETT |col2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4|
             (|DRAWCFUN;myTrap2| (SPADCALL |f| (QREFELT $ 141)) |x| |y| $)
             (|DRAWCFUN;myTrap2| (SPADCALL |g| (QREFELT $ 141)) |x| |y| $)
             (|DRAWCFUN;myTrap2| (SPADCALL |h| (QREFELT $ 141)) |x| |y| $)
             (|DRAWCFUN;myTrap2| (SPADCALL |col2| (QREFELT $ 141)) |x| |y| $)
             $))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;30|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPROG
         ((|mesh| (|ThreeSpace| (|DoubleFloat|)))
          (|fcn|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
                       (|DoubleFloat|))))
          (|cc|
           (|List|
            (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))))
          (|c| #1=(|Union| (|Any|) "failed"))
          (|col2|
           (|List|
            (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))))
          (|pointsColored?| (|Boolean|)) (|c2| #1#)
          (|sp| (|ThreeSpace| (|DoubleFloat|))))
         (SEQ
          (LETT |sp| (SPADCALL |l| (QREFELT $ 100))
                . #2=(|DRAWCFUN;makeObject;M2SLTs;30|))
          (LETT |col2| (LIST (CONS (|function| |DRAWCFUN;xCoord|) $)) . #2#)
          (LETT |pointsColored?| 'NIL . #2#)
          (SEQ
           (LETT |c2| (SPADCALL |l| '|colorFunction2| (QREFELT $ 36)) . #2#)
           (EXIT
            (COND
             ((NULL (QEQCAR |c2| 1))
              (SEQ (LETT |pointsColored?| 'T . #2#)
                   (EXIT
                    (LETT |col2| (LIST (SPADCALL (QCDR |c2|) (QREFELT $ 139)))
                          . #2#)))))))
          (LETT |fcn|
                (COND
                 (|pointsColored?|
                  (LIST
                   (CONS #'|DRAWCFUN;makeObject;M2SLTs;30!0|
                         (VECTOR $ |col2| |s|))))
                 ('T (LIST |s|)))
                . #2#)
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #2#)
               (EXIT
                (COND
                 ((NULL (QEQCAR |c| 1))
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 83)))
                         . #2#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;M2SLTs;30!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #2#)))))))
          (LETT |mesh|
                (SPADCALL |sp| (SPADCALL |fcn| (QREFELT $ 143))
                          (|DRAWCFUN;normalize| |uSeg| $)
                          (|DRAWCFUN;normalize| |vSeg| $) |l| (QREFELT $ 145))
                . #2#)
          (EXIT |mesh|)))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;30!1| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;30|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| (SPADCALL |fcn| (QREFELT $ 143)))
                      (SPADCALL |cc| (QREFELT $ 85))))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;30!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|s| |col2| $)
          (LETT |s| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;30|))
          (LETT |col2| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| |s|)
                      (SPADCALL |x| |y| (SPADCALL |col2| (QREFELT $ 141)))
                      (QREFELT $ 123)))))) 

(SDEFUN |DRAWCFUN;makeObject;Ps2STs;31|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 155))) 

(SDEFUN |DRAWCFUN;draw;Ps2SLTdv;32|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeDimensionalViewport|))
        (SPROG ((|mesh| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |mesh| (SPADCALL |s| |uSeg| |vSeg| |l| (QREFELT $ 155))
                      |DRAWCFUN;draw;Ps2SLTdv;32|)
                (EXIT (SPADCALL |mesh| |l| (QREFELT $ 128)))))) 

(SDEFUN |DRAWCFUN;draw;Ps2STdv;33|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 158))) 

(SDEFUN |DRAWCFUN;makeObject;M2STs;34|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 156))) 

(SDEFUN |DRAWCFUN;draw;M2SLTdv;35|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeDimensionalViewport|))
        (SPROG ((|mesh| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |mesh| (SPADCALL |s| |uSeg| |vSeg| |l| (QREFELT $ 156))
                      |DRAWCFUN;draw;M2SLTdv;35|)
                (EXIT (SPADCALL |mesh| |l| (QREFELT $ 128)))))) 

(SDEFUN |DRAWCFUN;draw;M2STdv;36|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 161))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctionsForCompiledFunctions;|)) 

(DEFUN |TopLevelDrawFunctionsForCompiledFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G396)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|TopLevelDrawFunctionsForCompiledFunctions|)
                    . #2=(|TopLevelDrawFunctionsForCompiledFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|TopLevelDrawFunctionsForCompiledFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|TopLevelDrawFunctionsForCompiledFunctions;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|TopLevelDrawFunctionsForCompiledFunctions|)))))))))) 

(DEFUN |TopLevelDrawFunctionsForCompiledFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TopLevelDrawFunctionsForCompiledFunctions|)
                . #1=(|TopLevelDrawFunctionsForCompiledFunctions|))
          (LETT $ (GETREFV 163) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|TopLevelDrawFunctionsForCompiledFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    "draw: when specifying function, left hand side must be a variable")
          (QSETREFV $ 7 "draw: range is in interval with only one point")
          (QSETREFV $ 8
                    "draw: independent variable appears on lhs of function definition")
          $))) 

(MAKEPROP '|TopLevelDrawFunctionsForCompiledFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'EXTOVARERROR 'SMALLRANGEERROR
              'DEPVARERROR (|DoubleFloat|) (|Segment| 9) (0 . |hi|) (|Float|)
              (5 . |convert|) (10 . |lo|) (15 . -) (21 . |abs|) (|Integer|)
              (26 . /) (|Boolean|) (32 . >) (38 . +) (|Segment| 12)
              (44 . |segment|) (|Mapping| 12 9) (|SegmentFunctions2| 9 12)
              (50 . |map|) (|List| 120) (|Plot|) (56 . |listBranches|)
              (61 . |xRange|) (66 . |yRange|) (|Union| 48 '"failed") (|List| $)
              (|Symbol|) (|DrawOption|) (71 . |option|) (|GraphicsDefaults|)
              (77 . |clipPointsDefault|) (|List| 35) (|DrawOptionFunctions0|)
              (81 . |clipBoolean|) (87 . |parametric?|)
              (|Record| (|:| |brans| 27) (|:| |xValues| 10) (|:| |yValues| 10))
              (|TwoDimensionalPlotClipping|) (92 . |clipParametric|)
              (97 . |clip|) (|List| 22) (|Any|) (|AnyFunctions1| 47)
              (102 . |retract|) (|NonNegativeInteger|) (107 . |more?|)
              (113 . |lo|) (118 . |convert|) (123 . |hi|) (128 . |second|)
              (133 . |clipWithRanges|) (142 . |drawToScale|) (146 . |toScale|)
              (152 . |ranges|) (157 . |convert|) (|Palette|)
              (|ViewDefaultsPackage|) (162 . |pointColorDefault|)
              (166 . |pointColorPalette|) (172 . |lineColorDefault|)
              (176 . |curveColorPalette|) (|PositiveInteger|)
              (182 . |pointSizeDefault|) (|TwoDimensionalViewport|)
              (|ViewportPackage|) (186 . |drawCurves|) (195 . |segment|)
              (201 . >) (|List| 9) (|Point| 9) (207 . |point|)
              (212 . |adaptive?|) (216 . |adaptive|) (222 . |setAdaptive|)
              (|Mapping| 76 76) (|AnyFunctions1| 81) (227 . |retract|)
              (|List| 81) (232 . |first|) (|Mapping| 76 9) (|List| 86)
              (237 . |first|) (242 . |pointPlot|) (|Mapping| 9 9)
              |DRAWCFUN;draw;MSLTdv;6| |DRAWCFUN;draw;MSTdv;7|
              (|ParametricPlaneCurve| 90) (248 . |coordinate|)
              |DRAWCFUN;draw;PpcSLTdv;8| |DRAWCFUN;draw;PpcSTdv;9|
              (254 . |elt|) (260 . |setelt!|) (|ThreeSpace| 9) (267 . |space|)
              (|ParametricSpaceCurve| 90) (272 . |coordinate|)
              (|AnyFunctions1| 90) (278 . |retract|) (|Plot3D|)
              (283 . |pointPlot|) (289 . |option?|) (295 . |tubePoints|)
              (301 . |float|) (308 . |tubeRadius|) (|TubePlot| 105)
              (|NumericTubePlot| 105) (314 . |tube|) (321 . |listLoops|)
              (|Mapping| 9 9 9 9) (|AnyFunctions1| 115) (326 . |retract|)
              (331 . |mesh|) (339 . |listBranches|) (|List| 76) (344 . |curve|)
              |DRAWCFUN;makeObject;PscSLTs;14| (350 . |concat|)
              |DRAWCFUN;makeObject;MSLTs;15| |DRAWCFUN;makeObject;PscSTs;16|
              |DRAWCFUN;makeObject;MSTs;17| (|ThreeDimensionalViewport|)
              (356 . |makeViewport3D|) |DRAWCFUN;draw;PscSLTdv;18|
              |DRAWCFUN;draw;PscSTdv;19| |DRAWCFUN;draw;MSLTdv;20|
              |DRAWCFUN;draw;MSTdv;21| (362 . |One|) (366 . |One|)
              (|Mapping| 76 9 9) |DRAWCFUN;recolor;MMM;23| (|Mapping| 9 9 9)
              (|AnyFunctions1| 137) (370 . |retract|) (|List| 137)
              (375 . |first|) (|List| 135) (380 . |first|)
              (|MeshCreationRoutinesForThreeDimensions|) (385 . |meshPar2Var|)
              |DRAWCFUN;makeObject;M2SLTs;25| |DRAWCFUN;makeObject;M2STs;26|
              |DRAWCFUN;draw;M2SLTdv;27| |DRAWCFUN;draw;M2STdv;28|
              (394 . |One|) (|ParametricSurface| 137) (398 . |coordinate|)
              (|List| 115) (404 . |first|) |DRAWCFUN;makeObject;Ps2SLTs;29|
              |DRAWCFUN;makeObject;M2SLTs;30| |DRAWCFUN;makeObject;Ps2STs;31|
              |DRAWCFUN;draw;Ps2SLTdv;32| |DRAWCFUN;draw;Ps2STdv;33|
              |DRAWCFUN;makeObject;M2STs;34| |DRAWCFUN;draw;M2SLTdv;35|
              |DRAWCFUN;draw;M2STdv;36|)
           '#(|recolor| 409 |makeObject| 415 |draw| 486) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 162
                                                 '(1 10 9 0 11 1 12 0 9 13 1 10
                                                   9 0 14 2 12 0 0 0 15 1 12 0
                                                   0 16 2 12 0 0 17 18 2 12 19
                                                   0 0 20 2 12 0 0 0 21 2 22 0
                                                   12 12 23 2 25 22 24 10 26 1
                                                   28 27 0 29 1 28 10 0 30 1 28
                                                   10 0 31 2 35 32 33 34 36 0
                                                   37 19 38 2 40 19 39 19 41 1
                                                   28 19 0 42 1 44 43 28 45 1
                                                   44 43 28 46 1 49 47 48 50 2
                                                   47 19 0 51 52 1 22 12 0 53 1
                                                   12 9 0 54 1 22 12 0 55 1 47
                                                   22 0 56 5 44 43 27 9 9 9 9
                                                   57 0 37 19 58 2 40 19 39 19
                                                   59 1 35 0 47 60 1 9 12 0 61
                                                   0 63 62 64 2 40 62 39 62 65
                                                   0 63 62 66 2 40 62 39 62 67
                                                   0 63 68 69 5 71 70 27 62 62
                                                   68 39 72 2 10 0 9 9 73 2 9
                                                   19 0 0 74 1 76 0 75 77 0 28
                                                   19 78 2 40 19 39 19 79 1 28
                                                   19 19 80 1 82 81 48 83 1 84
                                                   81 0 85 1 87 86 0 88 2 28 0
                                                   86 10 89 2 93 90 0 51 94 2
                                                   76 9 0 17 97 3 76 9 0 17 9
                                                   98 1 40 99 39 100 2 101 90 0
                                                   51 102 1 103 90 48 104 2 105
                                                   0 86 10 106 2 35 19 33 34
                                                   107 2 40 68 39 68 108 3 12 0
                                                   17 17 68 109 2 40 12 39 12
                                                   110 3 112 111 105 9 17 113 1
                                                   111 27 0 114 1 116 115 48
                                                   117 4 99 0 0 27 19 19 118 1
                                                   105 27 0 119 2 99 0 0 120
                                                   121 2 76 0 0 9 123 2 127 0
                                                   99 39 128 0 9 0 133 0 68 0
                                                   134 1 138 137 48 139 1 140
                                                   137 0 141 1 142 135 0 143 5
                                                   144 99 99 135 10 10 39 145 0
                                                   51 0 150 2 151 137 0 51 152
                                                   1 153 115 0 154 2 0 135 135
                                                   115 136 3 0 99 101 22 39 122
                                                   2 0 99 101 22 125 2 0 99 86
                                                   22 126 3 0 99 86 22 39 124 4
                                                   0 99 137 22 22 39 146 3 0 99
                                                   137 22 22 147 4 0 99 135 22
                                                   22 39 156 3 0 99 135 22 22
                                                   160 4 0 99 151 22 22 39 155
                                                   3 0 99 151 22 22 157 3 0 70
                                                   90 22 39 91 3 0 70 93 22 39
                                                   95 2 0 70 90 22 92 2 0 70 93
                                                   22 96 2 0 127 101 22 130 3 0
                                                   127 101 22 39 129 3 0 127 86
                                                   22 39 131 2 0 127 86 22 132
                                                   4 0 127 137 22 22 39 148 3 0
                                                   127 137 22 22 149 3 0 127
                                                   135 22 22 162 4 0 127 135 22
                                                   22 39 161 4 0 127 151 22 22
                                                   39 158 3 0 127 151 22 22
                                                   159)))))
           '|lookupComplete|)) 

(MAKEPROP '|TopLevelDrawFunctionsForCompiledFunctions| 'NILADIC T) 
