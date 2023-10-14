
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
                 (COND
                  ((|eql_DF| |a| |b|)
                   (|error| (SPADCALL (QREFELT $ 7) (QREFELT $ 75))))
                  ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 76)))
                  ('T (SPADCALL |b| |a| (QREFELT $ 76)))))))) 

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
                                          (QREFELT $ 77))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |DRAWCFUN;makePt2|
        ((|x| |DoubleFloat|) (|y| . #1=(|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |x| |y|) |DRAWCFUN;makePt2|)
                         (QREFELT $ 80)))) 

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
          (LETT |oldAdaptive| (SPADCALL (QREFELT $ 81))
                . #1=(|DRAWCFUN;draw;MSLTdv;6|))
          (SPADCALL (SPADCALL |l| |oldAdaptive| (QREFELT $ 82)) (QREFELT $ 83))
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
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
                         . #1#)
                   (EXIT
                    (LETT |ff|
                          (LIST
                           (CONS #'|DRAWCFUN;draw;MSLTdv;6!2|
                                 (VECTOR |cc| $ |ff|)))
                          . #1#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |ff| (QREFELT $ 91))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 92))
                . #1#)
          (SPADCALL |oldAdaptive| (QREFELT $ 83))
          (EXIT (|DRAWCFUN;drawPlot| |pl| |l| $))))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;6!2| ((|x| NIL) ($$ NIL))
        (PROG (|ff| $ |cc|)
          (LETT |ff| (QREFELT $$ 2) . #1=(|DRAWCFUN;draw;MSLTdv;6|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |ff| (QREFELT $ 91)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

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
        (SPADCALL |f| |seg| NIL (QREFELT $ 94))) 

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
          (LETT |oldAdaptive| (SPADCALL (QREFELT $ 81))
                . #2=(|DRAWCFUN;draw;PpcSLTdv;8|))
          (SPADCALL (SPADCALL |l| |oldAdaptive| (QREFELT $ 82)) (QREFELT $ 83))
          (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 97)) . #2#)
          (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 97)) . #2#)
          (LETT |fcn|
                (LIST (CONS #'|DRAWCFUN;draw;PpcSLTdv;8!0| (VECTOR |g| $ |f|)))
                . #2#)
          (SEQ (LETT |c| (SPADCALL |l| '|coordinates| (QREFELT $ 36)) . #2#)
               (EXIT
                (COND
                 ((NULL (QEQCAR |c| 1))
                  (SEQ
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
                         . #2#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;draw;PpcSLTdv;8!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #2#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |fcn| (QREFELT $ 91))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 92))
                . #2#)
          (SPADCALL |oldAdaptive| (QREFELT $ 83))
          (EXIT (|DRAWCFUN;drawPlot| |pl| |l| $))))) 

(SDEFUN |DRAWCFUN;draw;PpcSLTdv;8!1| ((|x| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;draw;PpcSLTdv;8|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 91)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

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
        (SPADCALL |ppc| |seg| NIL (QREFELT $ 98))) 

(SDEFUN |DRAWCFUN;makePt4|
        ((|x| |DoubleFloat|) (|y| |DoubleFloat|) (|z| |DoubleFloat|)
         (|c| . #1=(|DoubleFloat|)) ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |x| |y| |z| |c|) |DRAWCFUN;makePt4|)
                         (QREFELT $ 80)))) 

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
        (SPROG ((#1=#:G184 NIL) (|p| NIL) (#2=#:G183 NIL) (|lp| NIL))
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
                                         (SPADCALL |p| 1 (QREFELT $ 100))
                                         (SPADCALL |p| 2 (QREFELT $ 100))
                                         (SPADCALL |p| 3 (QREFELT $ 100))
                                         |func|)
                                        (QREFELT $ 101))))
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
         ((#1=#:G219 NIL) (|b| NIL)
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
          (LETT |sp| (SPADCALL |l| (QREFELT $ 103))
                . #5=(|DRAWCFUN;makeObject;PscSLTs;14|))
          (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 105)) . #5#)
          (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 105)) . #5#)
          (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 105)) . #5#)
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
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
                         . #5#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;PscSLTs;14!2|
                                 (VECTOR |cc| $ |fcn|)))
                          . #5#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |fcn| (QREFELT $ 91))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 109))
                . #5#)
          (LETT |s| |sp| . #5#)
          (EXIT
           (COND
            ((SPADCALL |l| '|tubeRadius| (QREFELT $ 110))
             (SEQ (LETT |pts| (SPADCALL |l| 8 (QREFELT $ 111)) . #5#)
                  (LETT |rad|
                        (SPADCALL
                         (SPADCALL |l| (SPADCALL 25 -2 10 (QREFELT $ 112))
                                   (QREFELT $ 113))
                         (QREFELT $ 54))
                        . #5#)
                  (LETT |tub| (SPADCALL |pl| |rad| |pts| (QREFELT $ 116))
                        . #5#)
                  (LETT |loops| (SPADCALL |tub| (QREFELT $ 117)) . #5#)
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
                         (SPADCALL (QCDR |c3|) (QREFELT $ 120)) $)))))))
                  (SPADCALL |s| |loops| 'NIL 'NIL (QREFELT $ 121)) (EXIT |s|)))
            (#6#
             (SEQ (LETT |br| (SPADCALL |pl| (QREFELT $ 122)) . #5#)
                  (SEQ (LETT |b| NIL . #5#) (LETT #1# |br| . #5#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (SPADCALL |s| |b| (QREFELT $ 124))))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))))))) 

(SDEFUN |DRAWCFUN;makeObject;PscSLTs;14!2| ((|x| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;PscSLTs;14|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 91)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

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
             (SPADCALL |x| (SPADCALL (QCDR |c1|) (QREFELT $ 107))) $))))) 

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
         ((#1=#:G237 NIL) (|b| NIL)
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
          (LETT |sp| (SPADCALL |l| (QREFELT $ 103))
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
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
                         . #4#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;MSLTs;15!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #4#)))))))
          (LETT |pl|
                (SPADCALL (SPADCALL |fcn| (QREFELT $ 91))
                          (|DRAWCFUN;normalize| |seg| $) (QREFELT $ 109))
                . #4#)
          (LETT |s| |sp| . #4#)
          (EXIT
           (COND
            ((SPADCALL |l| '|tubeRadius| (QREFELT $ 110))
             (SEQ (LETT |pts| (SPADCALL |l| 8 (QREFELT $ 111)) . #4#)
                  (LETT |rad|
                        (SPADCALL
                         (SPADCALL |l| (SPADCALL 25 -2 10 (QREFELT $ 112))
                                   (QREFELT $ 113))
                         (QREFELT $ 54))
                        . #4#)
                  (LETT |tub| (SPADCALL |pl| |rad| |pts| (QREFELT $ 116))
                        . #4#)
                  (LETT |loops| (SPADCALL |tub| (QREFELT $ 117)) . #4#)
                  (SPADCALL |s| |loops| 'NIL 'NIL (QREFELT $ 121)) (EXIT |s|)))
            ('T
             (SEQ (LETT |br| (SPADCALL |pl| (QREFELT $ 122)) . #4#)
                  (SEQ (LETT |b| NIL . #4#) (LETT #1# |br| . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (SPADCALL |s| |b| (QREFELT $ 124))))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))))))) 

(SDEFUN |DRAWCFUN;makeObject;MSLTs;15!1| ((|x| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;MSLTs;15|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 91)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

(SDEFUN |DRAWCFUN;makeObject;MSLTs;15!0| ((|x| NIL) ($$ NIL))
        (PROG (|psc| |c1| $)
          (LETT |psc| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;MSLTs;15|))
          (LETT |c1| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |psc|)
                      (SPADCALL |x| (SPADCALL (QCDR |c1|) (QREFELT $ 107)))
                      (QREFELT $ 126)))))) 

(SDEFUN |DRAWCFUN;makeObject;PscSTs;16|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 125))) 

(SDEFUN |DRAWCFUN;makeObject;MSTs;17|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 127))) 

(SDEFUN |DRAWCFUN;draw;PscSLTdv;18|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL |psc| |seg| |l| (QREFELT $ 125))
                      |DRAWCFUN;draw;PscSLTdv;18|)
                (EXIT (SPADCALL |sp| |l| (QREFELT $ 131)))))) 

(SDEFUN |DRAWCFUN;draw;PscSTdv;19|
        ((|psc| |ParametricSpaceCurve|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|seg| |Segment| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 132))) 

(SDEFUN |DRAWCFUN;draw;MSLTdv;20|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) (|l| |List| (|DrawOption|))
         ($ |ThreeDimensionalViewport|))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL |psc| |seg| |l| (QREFELT $ 127))
                      |DRAWCFUN;draw;MSLTdv;20|)
                (EXIT (SPADCALL |sp| |l| (QREFELT $ 131)))))) 

(SDEFUN |DRAWCFUN;draw;MSTdv;21|
        ((|psc| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|seg| |Segment| (|Float|)) ($ |ThreeDimensionalViewport|))
        (SPADCALL |psc| |seg| NIL (QREFELT $ 134))) 

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
                                          (QREFELT $ 77))
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
                                   (SPADCALL |pt| (|spadConstant| $ 137)
                                             (QREFELT $ 100))
                                   (SPADCALL |pt| 2 (QREFELT $ 100))
                                   (SPADCALL |pt| 3 (QREFELT $ 100)) |colFunc|)
                                  (QREFELT $ 101))
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
          (LETT |sp| (SPADCALL |l| (QREFELT $ 103))
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
                    (LETT |col2| (LIST (SPADCALL (QCDR |c2|) (QREFELT $ 142)))
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
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
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
                       (SPADCALL (SPADCALL |fcn| (QREFELT $ 146))
                                 (CONS (|function| |DRAWCFUN;zCoord|) $)
                                 (QREFELT $ 139))))
                     (#3#
                      (LIST
                       (SPADCALL (SPADCALL |fcn| (QREFELT $ 146))
                                 (SPADCALL (QCDR |c|) (QREFELT $ 120))
                                 (QREFELT $ 139)))))
                    . #2#)))))
          (LETT |mesh|
                (SPADCALL |sp| (SPADCALL |fcn| (QREFELT $ 146))
                          (|DRAWCFUN;normalize| |xSeg| $)
                          (|DRAWCFUN;normalize| |ySeg| $) |l| (QREFELT $ 148))
                . #2#)
          (EXIT |mesh|)))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25!2| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| (SPADCALL |fcn| (QREFELT $ 146)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25!1| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |col2|)
          (LETT |f| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |col2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4| |x| |y| (|DRAWCFUN;myTrap2| |f| |x| |y| $)
             (SPADCALL |x| |y| (SPADCALL |col2| (QREFELT $ 144))) $))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;25!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|f| $ |col2|)
          (LETT |f| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;25|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |col2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|DRAWCFUN;makePt4| (|DRAWCFUN;myTrap2| |f| |x| |y| $) |x| |y|
             (SPADCALL |x| |y| (SPADCALL |col2| (QREFELT $ 144))) $))))) 

(SDEFUN |DRAWCFUN;makeObject;M2STs;26|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |f| |xSeg| |ySeg| NIL (QREFELT $ 149))) 

(SDEFUN |DRAWCFUN;draw;M2SLTdv;27|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeDimensionalViewport|))
        (SPROG ((|sp| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |sp| (SPADCALL |f| |xSeg| |ySeg| |l| (QREFELT $ 149))
                      |DRAWCFUN;draw;M2SLTdv;27|)
                (EXIT (SPADCALL |sp| |l| (QREFELT $ 131)))))) 

(SDEFUN |DRAWCFUN;draw;M2STdv;28|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         (|xSeg| |Segment| (|Float|)) (|ySeg| |Segment| (|Float|))
         ($ |ThreeDimensionalViewport|))
        (SPADCALL |f| |xSeg| |ySeg| NIL (QREFELT $ 151))) 

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
          (LETT |sp| (SPADCALL |l| (QREFELT $ 103))
                . #2=(|DRAWCFUN;makeObject;Ps2SLTs;29|))
          (LETT |f|
                (LIST (SPADCALL |s| (|spadConstant| $ 153) (QREFELT $ 155)))
                . #2#)
          (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 155))) . #2#)
          (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 155))) . #2#)
          (LETT |col2| (LIST (CONS (|function| |DRAWCFUN;xCoord|) $)) . #2#)
          (LETT |pointsColored?| 'NIL . #2#)
          (SEQ
           (LETT |c2| (SPADCALL |l| '|colorFunction2| (QREFELT $ 36)) . #2#)
           (EXIT
            (COND
             ((NULL (QEQCAR |c2| 1))
              (SEQ (LETT |pointsColored?| 'T . #2#)
                   (EXIT
                    (LETT |col2| (LIST (SPADCALL (QCDR |c2|) (QREFELT $ 142)))
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
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
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
                 (LETT |col3| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 120)))
                       . #2#)))))
             (EXIT
              (LETT |fcn|
                    (LIST
                     (SPADCALL (SPADCALL |fcn| (QREFELT $ 146))
                               (SPADCALL |col3| (QREFELT $ 157))
                               (QREFELT $ 139)))
                    . #2#)))))
          (LETT |mesh|
                (SPADCALL |sp| (SPADCALL |fcn| (QREFELT $ 146))
                          (|DRAWCFUN;normalize| |uSeg| $)
                          (|DRAWCFUN;normalize| |vSeg| $) |l| (QREFELT $ 148))
                . #2#)
          (EXIT |mesh|)))) 

(SDEFUN |DRAWCFUN;makeObject;Ps2SLTs;29!1| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;Ps2SLTs;29|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| (SPADCALL |fcn| (QREFELT $ 146)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

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
             (|DRAWCFUN;myTrap2| (SPADCALL |f| (QREFELT $ 144)) |x| |y| $)
             (|DRAWCFUN;myTrap2| (SPADCALL |g| (QREFELT $ 144)) |x| |y| $)
             (|DRAWCFUN;myTrap2| (SPADCALL |h| (QREFELT $ 144)) |x| |y| $)
             (|DRAWCFUN;myTrap2| (SPADCALL |col2| (QREFELT $ 144)) |x| |y| $)
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
          (LETT |sp| (SPADCALL |l| (QREFELT $ 103))
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
                    (LETT |col2| (LIST (SPADCALL (QCDR |c2|) (QREFELT $ 142)))
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
                   (LETT |cc| (LIST (SPADCALL (QCDR |c|) (QREFELT $ 86)))
                         . #2#)
                   (EXIT
                    (LETT |fcn|
                          (LIST
                           (CONS #'|DRAWCFUN;makeObject;M2SLTs;30!1|
                                 (VECTOR |cc| $ |fcn|)))
                          . #2#)))))))
          (LETT |mesh|
                (SPADCALL |sp| (SPADCALL |fcn| (QREFELT $ 146))
                          (|DRAWCFUN;normalize| |uSeg| $)
                          (|DRAWCFUN;normalize| |vSeg| $) |l| (QREFELT $ 148))
                . #2#)
          (EXIT |mesh|)))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;30!1| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|fcn| $ |cc|)
          (LETT |fcn| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;30|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |cc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| (SPADCALL |fcn| (QREFELT $ 146)))
                      (SPADCALL |cc| (QREFELT $ 88))))))) 

(SDEFUN |DRAWCFUN;makeObject;M2SLTs;30!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|s| |col2| $)
          (LETT |s| (QREFELT $$ 2) . #1=(|DRAWCFUN;makeObject;M2SLTs;30|))
          (LETT |col2| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |y| |s|)
                      (SPADCALL |x| |y| (SPADCALL |col2| (QREFELT $ 144)))
                      (QREFELT $ 126)))))) 

(SDEFUN |DRAWCFUN;makeObject;Ps2STs;31|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 158))) 

(SDEFUN |DRAWCFUN;draw;Ps2SLTdv;32|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeDimensionalViewport|))
        (SPROG ((|mesh| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |mesh| (SPADCALL |s| |uSeg| |vSeg| |l| (QREFELT $ 158))
                      |DRAWCFUN;draw;Ps2SLTdv;32|)
                (EXIT (SPADCALL |mesh| |l| (QREFELT $ 131)))))) 

(SDEFUN |DRAWCFUN;draw;Ps2STdv;33|
        ((|s| |ParametricSurface|
          (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 161))) 

(SDEFUN |DRAWCFUN;makeObject;M2STs;34|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeSpace| (|DoubleFloat|)))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 159))) 

(SDEFUN |DRAWCFUN;draw;M2SLTdv;35|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         (|l| |List| (|DrawOption|)) ($ |ThreeDimensionalViewport|))
        (SPROG ((|mesh| (|ThreeSpace| (|DoubleFloat|))))
               (SEQ
                (LETT |mesh| (SPADCALL |s| |uSeg| |vSeg| |l| (QREFELT $ 159))
                      |DRAWCFUN;draw;M2SLTdv;35|)
                (EXIT (SPADCALL |mesh| |l| (QREFELT $ 131)))))) 

(SDEFUN |DRAWCFUN;draw;M2STdv;36|
        ((|s| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
          (|DoubleFloat|))
         (|uSeg| |Segment| (|Float|)) (|vSeg| |Segment| (|Float|))
         ($ |ThreeDimensionalViewport|))
        (SPADCALL |s| |uSeg| |vSeg| NIL (QREFELT $ 164))) 

(DECLAIM (NOTINLINE |TopLevelDrawFunctionsForCompiledFunctions;|)) 

(DEFUN |TopLevelDrawFunctionsForCompiledFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G395)
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
          (LETT $ (GETREFV 166) . #1#)
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
              (50 . |map|) (|List| 123) (|Plot|) (56 . |listBranches|)
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
              (|ViewportPackage|) (186 . |drawCurves|) (|OutputForm|)
              (|String|) (195 . |coerce|) (200 . |segment|) (206 . >)
              (|List| 9) (|Point| 9) (212 . |point|) (217 . |adaptive?|)
              (221 . |adaptive|) (227 . |setAdaptive|) (|Mapping| 79 79)
              (|AnyFunctions1| 84) (232 . |retract|) (|List| 84)
              (237 . |first|) (|Mapping| 79 9) (|List| 89) (242 . |first|)
              (247 . |pointPlot|) (|Mapping| 9 9) |DRAWCFUN;draw;MSLTdv;6|
              |DRAWCFUN;draw;MSTdv;7| (|ParametricPlaneCurve| 93)
              (253 . |coordinate|) |DRAWCFUN;draw;PpcSLTdv;8|
              |DRAWCFUN;draw;PpcSTdv;9| (259 . |elt|) (265 . |setelt|)
              (|ThreeSpace| 9) (272 . |space|) (|ParametricSpaceCurve| 93)
              (277 . |coordinate|) (|AnyFunctions1| 93) (283 . |retract|)
              (|Plot3D|) (288 . |pointPlot|) (294 . |option?|)
              (300 . |tubePoints|) (306 . |float|) (313 . |tubeRadius|)
              (|TubePlot| 108) (|NumericTubePlot| 108) (319 . |tube|)
              (326 . |listLoops|) (|Mapping| 9 9 9 9) (|AnyFunctions1| 118)
              (331 . |retract|) (336 . |mesh|) (344 . |listBranches|)
              (|List| 79) (349 . |curve|) |DRAWCFUN;makeObject;PscSLTs;14|
              (355 . |concat|) |DRAWCFUN;makeObject;MSLTs;15|
              |DRAWCFUN;makeObject;PscSTs;16| |DRAWCFUN;makeObject;MSTs;17|
              (|ThreeDimensionalViewport|) (361 . |makeViewport3D|)
              |DRAWCFUN;draw;PscSLTdv;18| |DRAWCFUN;draw;PscSTdv;19|
              |DRAWCFUN;draw;MSLTdv;20| |DRAWCFUN;draw;MSTdv;21| (367 . |One|)
              (371 . |One|) (|Mapping| 79 9 9) |DRAWCFUN;recolor;MMM;23|
              (|Mapping| 9 9 9) (|AnyFunctions1| 140) (375 . |retract|)
              (|List| 140) (380 . |first|) (|List| 138) (385 . |first|)
              (|MeshCreationRoutinesForThreeDimensions|) (390 . |meshPar2Var|)
              |DRAWCFUN;makeObject;M2SLTs;25| |DRAWCFUN;makeObject;M2STs;26|
              |DRAWCFUN;draw;M2SLTdv;27| |DRAWCFUN;draw;M2STdv;28|
              (399 . |One|) (|ParametricSurface| 140) (403 . |coordinate|)
              (|List| 118) (409 . |first|) |DRAWCFUN;makeObject;Ps2SLTs;29|
              |DRAWCFUN;makeObject;M2SLTs;30| |DRAWCFUN;makeObject;Ps2STs;31|
              |DRAWCFUN;draw;Ps2SLTdv;32| |DRAWCFUN;draw;Ps2STdv;33|
              |DRAWCFUN;makeObject;M2STs;34| |DRAWCFUN;draw;M2SLTdv;35|
              |DRAWCFUN;draw;M2STdv;36|)
           '#(|recolor| 414 |makeObject| 420 |draw| 491) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 165
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
                                                   68 39 72 1 74 73 0 75 2 10 0
                                                   9 9 76 2 9 19 0 0 77 1 79 0
                                                   78 80 0 28 19 81 2 40 19 39
                                                   19 82 1 28 19 19 83 1 85 84
                                                   48 86 1 87 84 0 88 1 90 89 0
                                                   91 2 28 0 89 10 92 2 96 93 0
                                                   51 97 2 79 9 0 17 100 3 79 9
                                                   0 17 9 101 1 40 102 39 103 2
                                                   104 93 0 51 105 1 106 93 48
                                                   107 2 108 0 89 10 109 2 35
                                                   19 33 34 110 2 40 68 39 68
                                                   111 3 12 0 17 17 68 112 2 40
                                                   12 39 12 113 3 115 114 108 9
                                                   17 116 1 114 27 0 117 1 119
                                                   118 48 120 4 102 0 0 27 19
                                                   19 121 1 108 27 0 122 2 102
                                                   0 0 123 124 2 79 0 0 9 126 2
                                                   130 0 102 39 131 0 9 0 136 0
                                                   68 0 137 1 141 140 48 142 1
                                                   143 140 0 144 1 145 138 0
                                                   146 5 147 102 102 138 10 10
                                                   39 148 0 51 0 153 2 154 140
                                                   0 51 155 1 156 118 0 157 2 0
                                                   138 138 118 139 3 0 102 104
                                                   22 39 125 2 0 102 104 22 128
                                                   2 0 102 89 22 129 3 0 102 89
                                                   22 39 127 4 0 102 140 22 22
                                                   39 149 3 0 102 140 22 22 150
                                                   4 0 102 138 22 22 39 159 3 0
                                                   102 138 22 22 163 4 0 102
                                                   154 22 22 39 158 3 0 102 154
                                                   22 22 160 3 0 70 93 22 39 94
                                                   3 0 70 96 22 39 98 2 0 70 93
                                                   22 95 2 0 70 96 22 99 2 0
                                                   130 104 22 133 3 0 130 104
                                                   22 39 132 3 0 130 89 22 39
                                                   134 2 0 130 89 22 135 4 0
                                                   130 140 22 22 39 151 3 0 130
                                                   140 22 22 152 3 0 130 138 22
                                                   22 165 4 0 130 138 22 22 39
                                                   164 4 0 130 154 22 22 39 161
                                                   3 0 130 154 22 22 162)))))
           '|lookupComplete|)) 

(MAKEPROP '|TopLevelDrawFunctionsForCompiledFunctions| 'NILADIC T) 
