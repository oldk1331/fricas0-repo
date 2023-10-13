
(/VERSIONCHECK 2) 

(DEFUN |ACPLOT;NFtoSF| (|x| $) (|add_DF| 0.0 (SPADCALL |x| (QREFELT $ 22)))) 

(DEFUN |ACPLOT;makePt| (|xx| |yy| $)
  (PROG (|l|)
    (RETURN
     (SPADCALL (LETT |l| (LIST |xx| |yy|) |ACPLOT;makePt|) (QREFELT $ 25))))) 

(DEFUN |ACPLOT;swapCoords| (|pt| $)
  (|ACPLOT;makePt| (SPADCALL |pt| (QREFELT $ 27))
   (SPADCALL |pt| (QREFELT $ 28)) $)) 

(DEFUN |ACPLOT;samePlottedPt?| (|p0| |p1| $)
  (PROG (|y1| |x1| |y0| |x0|)
    (RETURN
     (SEQ
      (LETT |x0| (SPADCALL |p0| (QREFELT $ 28)) . #1=(|ACPLOT;samePlottedPt?|))
      (LETT |y0| (SPADCALL |p0| (QREFELT $ 27)) . #1#)
      (LETT |x1| (SPADCALL |p1| (QREFELT $ 28)) . #1#)
      (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #1#)
      (EXIT
       (COND
        ((|less_DF| (FLOAT-SIGN 1.0 (|sub_DF| |x1| |x0|)) (QREFELT $ 15))
         (|less_DF| (FLOAT-SIGN 1.0 (|sub_DF| |y1| |y0|)) (QREFELT $ 15)))
        ('T 'NIL))))))) 

(DEFUN |ACPLOT;findPtOnList| (|pt| |pointList| $)
  (PROG (#1=#:G185 #2=#:G187 #3=#:G188 |point|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |point| NIL . #4=(|ACPLOT;findPtOnList|))
               (LETT #3# |pointList| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |point| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|ACPLOT;samePlottedPt?| |pt| |point| $)
                   (PROGN
                    (LETT #1#
                          (PROGN (LETT #2# (CONS 0 |point|) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(PUT '|ACPLOT;makeCorners| '|SPADreplace| 'VECTOR) 

(DEFUN |ACPLOT;makeCorners| (|xMinSF| |xMaxSF| |yMinSF| |yMaxSF| $)
  (VECTOR |xMinSF| |xMaxSF| |yMinSF| |yMaxSF|)) 

(PUT '|ACPLOT;getXMin| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 0))) 

(DEFUN |ACPLOT;getXMin| (|corners| $) (QVELT |corners| 0)) 

(PUT '|ACPLOT;getXMax| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 1))) 

(DEFUN |ACPLOT;getXMax| (|corners| $) (QVELT |corners| 1)) 

(PUT '|ACPLOT;getYMin| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 2))) 

(DEFUN |ACPLOT;getYMin| (|corners| $) (QVELT |corners| 2)) 

(PUT '|ACPLOT;getYMax| '|SPADreplace| '(XLAM (|corners|) (QVELT |corners| 3))) 

(DEFUN |ACPLOT;getYMax| (|corners| $) (QVELT |corners| 3)) 

(DEFUN |ACPLOT;SFPolyToUPoly| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 31)) (|spadConstant| $ 33))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p| (QREFELT $ 34)) (SPADCALL |p| (QREFELT $ 36))
                    (QREFELT $ 37))
          (|ACPLOT;SFPolyToUPoly| (SPADCALL |p| (QREFELT $ 38)) $)
          (QREFELT $ 39))))) 

(DEFUN |ACPLOT;RNPolyToUPoly| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 41)) (|spadConstant| $ 43))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p| (QREFELT $ 45)) (SPADCALL |p| (QREFELT $ 46))
                    (QREFELT $ 47))
          (|ACPLOT;RNPolyToUPoly| (SPADCALL |p| (QREFELT $ 48)) $)
          (QREFELT $ 49))))) 

(DEFUN |ACPLOT;coerceCoefsToSFs| (|p| $)
  (SPADCALL (ELT $ 50) |p| (QREFELT $ 54))) 

(DEFUN |ACPLOT;coerceCoefsToRNs| (|p| $)
  (SPADCALL (ELT $ 55) |p| (QREFELT $ 58))) 

(DEFUN |ACPLOT;RNtoSF| (|r| $) (SPADCALL |r| (QREFELT $ 59))) 

(DEFUN |ACPLOT;RNtoNF| (|r| $) (SPADCALL |r| (QREFELT $ 60))) 

(DEFUN |ACPLOT;SFtoNF| (|x| $) (SPADCALL |x| (QREFELT $ 61))) 

(DEFUN |ACPLOT;listPtsOnHorizBdry| (|pRN| |y| |y0| |xMinNF| |xMaxNF| $)
  (PROG (|pointList| #1=#:G213 |root| |roots| |f| |ySF|)
    (RETURN
     (SEQ (LETT |pointList| NIL . #2=(|ACPLOT;listPtsOnHorizBdry|))
          (LETT |ySF| (|ACPLOT;RNtoSF| |y0| $) . #2#)
          (LETT |f| (SPADCALL |pRN| |y| |y0| (QREFELT $ 63)) . #2#)
          (LETT |roots| (SPADCALL |f| (QREFELT $ 12) (QREFELT $ 66)) . #2#)
          (SEQ (LETT |root| NIL . #2#) (LETT #1# |roots| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |root| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |xMinNF| |root| (QREFELT $ 67))
                   (COND
                    ((SPADCALL |root| |xMaxNF| (QREFELT $ 67))
                     (LETT |pointList|
                           (CONS
                            (|ACPLOT;makePt| (|ACPLOT;NFtoSF| |root| $) |ySF|
                             $)
                            |pointList|)
                           . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |pointList|))))) 

(DEFUN |ACPLOT;listPtsOnVertBdry| (|pRN| |x| |x0| |yMinNF| |yMaxNF| $)
  (PROG (|pointList| #1=#:G217 |root| |roots| |f| |xSF|)
    (RETURN
     (SEQ (LETT |pointList| NIL . #2=(|ACPLOT;listPtsOnVertBdry|))
          (LETT |xSF| (|ACPLOT;RNtoSF| |x0| $) . #2#)
          (LETT |f| (SPADCALL |pRN| |x| |x0| (QREFELT $ 63)) . #2#)
          (LETT |roots| (SPADCALL |f| (QREFELT $ 12) (QREFELT $ 66)) . #2#)
          (SEQ (LETT |root| NIL . #2#) (LETT #1# |roots| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |root| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |yMinNF| |root| (QREFELT $ 68))
                   (COND
                    ((SPADCALL |root| |yMaxNF| (QREFELT $ 68))
                     (LETT |pointList|
                           (CONS
                            (|ACPLOT;makePt| |xSF| (|ACPLOT;NFtoSF| |root| $)
                             $)
                            |pointList|)
                           . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |pointList|))))) 

(DEFUN |ACPLOT;listPtsInRect| (|points| |xMin| |xMax| |yMin| |yMax| $)
  (PROG (|pointList| |yy| |xx| #1=#:G222 |point|)
    (RETURN
     (SEQ (LETT |pointList| NIL . #2=(|ACPLOT;listPtsInRect|))
          (SEQ (LETT |point| NIL . #2#) (LETT #1# |points| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |point| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |xx| (|SPADfirst| |point|) . #2#)
                    (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |xMin| |xx| (QREFELT $ 68))
                       (COND
                        ((SPADCALL |xx| |xMax| (QREFELT $ 68))
                         (COND
                          ((SPADCALL |yMin| |yy| (QREFELT $ 68))
                           (COND
                            ((SPADCALL |yy| |yMax| (QREFELT $ 68))
                             (LETT |pointList|
                                   (CONS
                                    (|ACPLOT;makePt| (|ACPLOT;NFtoSF| |xx| $)
                                     (|ACPLOT;NFtoSF| |yy| $) $)
                                    |pointList|)
                                   . #2#)))))))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |pointList|))))) 

(DEFUN |ACPLOT;ptsSuchThat?| (|points| |pred| $)
  (PROG (#1=#:G226 #2=#:G227 |point|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |point| NIL . #3=(|ACPLOT;ptsSuchThat?|))
             (LETT #2# |points| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |point| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |point| |pred|)
                 (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |ACPLOT;inRect?| (|point| |xMinNF| |xMaxNF| |yMinNF| |yMaxNF| $)
  (PROG (|yy| |xx|)
    (RETURN
     (SEQ (LETT |xx| (|SPADfirst| |point|) . #1=(|ACPLOT;inRect?|))
          (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |xMinNF| |xx| (QREFELT $ 68))
             (COND
              ((SPADCALL |xx| |xMaxNF| (QREFELT $ 68))
               (COND
                ((SPADCALL |yMinNF| |yy| (QREFELT $ 68))
                 (SPADCALL |yy| |yMaxNF| (QREFELT $ 68)))
                (#2='T 'NIL)))
              (#2# 'NIL)))
            (#2# 'NIL))))))) 

(DEFUN |ACPLOT;onHorzSeg?| (|point| |xMinNF| |xMaxNF| |yNF| $)
  (PROG (|yy| |xx|)
    (RETURN
     (SEQ (LETT |xx| (|SPADfirst| |point|) . #1=(|ACPLOT;onHorzSeg?|))
          (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |yy| |yNF| (QREFELT $ 70))
             (COND
              ((SPADCALL |xMinNF| |xx| (QREFELT $ 68))
               (SPADCALL |xx| |xMaxNF| (QREFELT $ 68)))
              (#2='T 'NIL)))
            (#2# 'NIL))))))) 

(DEFUN |ACPLOT;onVertSeg?| (|point| |yMinNF| |yMaxNF| |xNF| $)
  (PROG (|yy| |xx|)
    (RETURN
     (SEQ (LETT |xx| (|SPADfirst| |point|) . #1=(|ACPLOT;onVertSeg?|))
          (LETT |yy| (SPADCALL |point| (QREFELT $ 69)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |xx| |xNF| (QREFELT $ 70))
             (COND
              ((SPADCALL |yMinNF| |yy| (QREFELT $ 68))
               (SPADCALL |yy| |yMaxNF| (QREFELT $ 68)))
              (#2='T 'NIL)))
            (#2# 'NIL))))))) 

(DEFUN |ACPLOT;newX|
       (|vtanPts| |singPts| |yMinNF| |yMaxNF| |xNF| |xRN| |horizInc| $)
  (PROG (|goo| |foo| |xLftNF| |xRtNF| |xNewNF|)
    (RETURN
     (SEQ
      (LETT |xNewNF|
            (SPADCALL |xNF| (|ACPLOT;RNtoNF| |horizInc| $) (QREFELT $ 71))
            . #1=(|ACPLOT;newX|))
      (LETT |xRtNF| (SPADCALL |xNF| |xNewNF| (QREFELT $ 72)) . #1#)
      (LETT |xLftNF| (SPADCALL |xNF| |xNewNF| (QREFELT $ 73)) . #1#)
      (LETT |foo|
            (CONS #'|ACPLOT;newX!0|
                  (VECTOR $ |yMaxNF| |yMinNF| |xRtNF| |xLftNF|))
            . #1#)
      (EXIT
       (COND
        ((|ACPLOT;ptsSuchThat?| |singPts| |foo| $)
         (|ACPLOT;newX| |vtanPts| |singPts| |yMinNF| |yMaxNF| |xNF| |xRN|
          (SPADCALL |horizInc| (SPADCALL 2 (QREFELT $ 55)) (QREFELT $ 74)) $))
        (#2='T
         (SEQ
          (LETT |goo|
                (CONS #'|ACPLOT;newX!1| (VECTOR $ |xNewNF| |yMaxNF| |yMinNF|))
                . #1#)
          (EXIT
           (COND
            ((|ACPLOT;ptsSuchThat?| |vtanPts| |goo| $)
             (|ACPLOT;newX| |vtanPts| |singPts| |yMinNF| |yMaxNF| |xNF| |xRN|
              (SPADCALL |horizInc| (SPADCALL 2 (QREFELT $ 55)) (QREFELT $ 74))
              $))
            (#2# (SPADCALL |xRN| |horizInc| (QREFELT $ 75))))))))))))) 

(DEFUN |ACPLOT;newX!1| (|x| $$)
  (PROG (|yMinNF| |yMaxNF| |xNewNF| $)
    (LETT |yMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;newX|))
    (LETT |yMaxNF| (QREFELT $$ 2) . #1#)
    (LETT |xNewNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ACPLOT;onVertSeg?| |x| |yMinNF| |yMaxNF| |xNewNF| $))))) 

(DEFUN |ACPLOT;newX!0| (|x| $$)
  (PROG (|xLftNF| |xRtNF| |yMinNF| |yMaxNF| $)
    (LETT |xLftNF| (QREFELT $$ 4) . #1=(|ACPLOT;newX|))
    (LETT |xRtNF| (QREFELT $$ 3) . #1#)
    (LETT |yMinNF| (QREFELT $$ 2) . #1#)
    (LETT |yMaxNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|ACPLOT;inRect?| |x| |xLftNF| |xRtNF| |yMinNF| |yMaxNF| $))))) 

(DEFUN |ACPLOT;newY|
       (|htanPts| |singPts| |xMinNF| |xMaxNF| |yNF| |yRN| |vertInc| $)
  (PROG (|goo| |foo| |yBotNF| |yTopNF| |yNewNF|)
    (RETURN
     (SEQ
      (LETT |yNewNF|
            (SPADCALL |yNF| (|ACPLOT;RNtoNF| |vertInc| $) (QREFELT $ 71))
            . #1=(|ACPLOT;newY|))
      (LETT |yTopNF| (SPADCALL |yNF| |yNewNF| (QREFELT $ 72)) . #1#)
      (LETT |yBotNF| (SPADCALL |yNF| |yNewNF| (QREFELT $ 73)) . #1#)
      (LETT |foo|
            (CONS #'|ACPLOT;newY!0|
                  (VECTOR $ |yTopNF| |yBotNF| |xMaxNF| |xMinNF|))
            . #1#)
      (EXIT
       (COND
        ((|ACPLOT;ptsSuchThat?| |singPts| |foo| $)
         (|ACPLOT;newY| |htanPts| |singPts| |xMinNF| |xMaxNF| |yNF| |yRN|
          (SPADCALL |vertInc| (SPADCALL 2 (QREFELT $ 55)) (QREFELT $ 74)) $))
        (#2='T
         (SEQ
          (LETT |goo|
                (CONS #'|ACPLOT;newY!1| (VECTOR $ |yNewNF| |xMaxNF| |xMinNF|))
                . #1#)
          (EXIT
           (COND
            ((|ACPLOT;ptsSuchThat?| |htanPts| |goo| $)
             (|ACPLOT;newY| |htanPts| |singPts| |xMinNF| |xMaxNF| |yNF| |yRN|
              (SPADCALL |vertInc| (SPADCALL 2 (QREFELT $ 55)) (QREFELT $ 74))
              $))
            (#2# (SPADCALL |yRN| |vertInc| (QREFELT $ 75))))))))))))) 

(DEFUN |ACPLOT;newY!1| (|x| $$)
  (PROG (|xMinNF| |xMaxNF| |yNewNF| $)
    (LETT |xMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;newY|))
    (LETT |xMaxNF| (QREFELT $$ 2) . #1#)
    (LETT |yNewNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ACPLOT;onHorzSeg?| |x| |xMinNF| |xMaxNF| |yNewNF| $))))) 

(DEFUN |ACPLOT;newY!0| (|x| $$)
  (PROG (|xMinNF| |xMaxNF| |yBotNF| |yTopNF| $)
    (LETT |xMinNF| (QREFELT $$ 4) . #1=(|ACPLOT;newY|))
    (LETT |xMaxNF| (QREFELT $$ 3) . #1#)
    (LETT |yBotNF| (QREFELT $$ 2) . #1#)
    (LETT |yTopNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|ACPLOT;inRect?| |x| |xMinNF| |xMaxNF| |yBotNF| |yTopNF| $))))) 

(DEFUN |ACPLOT;makeSketch;P2S2S$;27| (|p| |x| |y| |xRange| |yRange| $)
  (PROG (|varList| |yMax| |yMin| |xMax| |xMin|)
    (RETURN
     (SEQ
      (LETT |xMin| (SPADCALL |xRange| (QREFELT $ 77))
            . #1=(|ACPLOT;makeSketch;P2S2S$;27|))
      (LETT |xMax| (SPADCALL |xRange| (QREFELT $ 78)) . #1#)
      (LETT |yMin| (SPADCALL |yRange| (QREFELT $ 77)) . #1#)
      (LETT |yMax| (SPADCALL |yRange| (QREFELT $ 78)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |xMax| |xMin| (QREFELT $ 79))
         (|error| "makeSketch: bad range for first variable"))
        ((SPADCALL |yMax| |yMin| (QREFELT $ 79))
         (|error| "makeSketch: bad range for second variable"))
        (#2='T
         (SEQ (LETT |varList| (SPADCALL |p| (QREFELT $ 81)) . #1#)
              (EXIT
               (COND
                ((SPADCALL (LENGTH |varList|) 2 (QREFELT $ 82))
                 (|error| "makeSketch: polynomial in more than 2 variables"))
                ((EQL (LENGTH |varList|) 0)
                 (|error| "makeSketch: constant polynomial"))
                ((EQL (LENGTH |varList|) 1)
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |x| |varList| (QREFELT $ 83)))
                    (COND
                     ((NULL (SPADCALL |y| |varList| (QREFELT $ 83)))
                      (EXIT (|error| "makeSketch: bad variables"))))))
                  (EXIT
                   (|ACPLOT;makeOneVarSketch| |p| |x| |y| |xMin| |xMax| |yMin|
                    |yMax| (|SPADfirst| |varList|) $))))
                (#2#
                 (SEQ
                  (COND
                   ((SPADCALL |x| |varList| (QREFELT $ 83))
                    (COND
                     ((NULL (SPADCALL |y| |varList| (QREFELT $ 83)))
                      (EXIT (|error| #3="makeSketch: bad variables")))))
                   (#2# (EXIT (|error| #3#))))
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |p| (QREFELT $ 84)) 1)
                     (|ACPLOT;makeLineSketch| |p| |x| |y| |xMin| |xMax| |yMin|
                      |yMax| $))
                    ((EQL (SPADCALL |p| |y| (QREFELT $ 85)) 1)
                     (|ACPLOT;makeRatFcnSketch| |p| |x| |y| |xMin| |xMax|
                      |yMin| |yMax| |y| $))
                    ((EQL (SPADCALL |p| |x| (QREFELT $ 85)) 1)
                     (|ACPLOT;makeRatFcnSketch| |p| |x| |y| |xMin| |xMax|
                      |yMin| |yMax| |x| $))
                    (#2#
                     (|ACPLOT;makeGeneralSketch| |p| |x| |y| |xMin| |xMax|
                      |yMin| |yMax| $)))))))))))))))) 

(DEFUN |ACPLOT;makeOneVarSketch|
       (|p| |x| |y| |xMin| |xMax| |yMin| |yMax| |var| $)
  (PROG (|bran| |branch| |lf| |pt2| |rt| |pt1| #1=#:G277 |rootSF| |xMaxSF|
         |xMinSF| |bt| |tp| #2=#:G276 |yMaxSF| |yMinSF| |sketchRoots| #3=#:G275
         |root| |roots| |vtans| |htans| |maxVal| |minVal|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL |var| |x|)
        (SEQ
         (LETT |minVal| (|ACPLOT;RNtoNF| |xMin| $)
               . #4=(|ACPLOT;makeOneVarSketch|))
         (EXIT (LETT |maxVal| (|ACPLOT;RNtoNF| |xMax| $) . #4#))))
       (#5='T
        (SEQ (LETT |minVal| (|ACPLOT;RNtoNF| |yMin| $) . #4#)
             (EXIT (LETT |maxVal| (|ACPLOT;RNtoNF| |yMax| $) . #4#)))))
      (LETT |lf| NIL . #4#) (LETT |rt| NIL . #4#) (LETT |bt| NIL . #4#)
      (LETT |tp| NIL . #4#) (LETT |htans| NIL . #4#) (LETT |vtans| NIL . #4#)
      (LETT |bran| NIL . #4#)
      (LETT |roots| (SPADCALL |p| (QREFELT $ 12) (QREFELT $ 87)) . #4#)
      (LETT |sketchRoots| NIL . #4#)
      (SEQ (LETT |root| NIL . #4#) (LETT #3# |roots| . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |root| (CAR #3#) . #4#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |minVal| |root| (QREFELT $ 68))
               (COND
                ((SPADCALL |root| |maxVal| (QREFELT $ 68))
                 (LETT |sketchRoots|
                       (CONS (|ACPLOT;NFtoSF| |root| $) |sketchRoots|)
                       . #4#)))))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((NULL |sketchRoots|)
         (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                 (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans| |bran|))
        (#5#
         (SEQ
          (COND
           ((EQUAL |var| |x|)
            (SEQ (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #4#)
                 (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #4#)
                 (EXIT
                  (SEQ (LETT |rootSF| NIL . #4#) (LETT #2# |sketchRoots| . #4#)
                       G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |rootSF| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |tp|
                              (CONS
                               (LETT |pt1|
                                     (|ACPLOT;makePt| |rootSF| |yMaxSF| $)
                                     . #4#)
                               |tp|)
                              . #4#)
                        (LETT |bt|
                              (CONS
                               (LETT |pt2|
                                     (|ACPLOT;makePt| |rootSF| |yMinSF| $)
                                     . #4#)
                               |bt|)
                              . #4#)
                        (LETT |branch| (LIST |pt1| |pt2|) . #4#)
                        (EXIT (LETT |bran| (CONS |branch| |bran|) . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL)))))
           (#5#
            (SEQ (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #4#)
                 (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #4#)
                 (EXIT
                  (SEQ (LETT |rootSF| NIL . #4#) (LETT #1# |sketchRoots| . #4#)
                       G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |rootSF| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |rt|
                              (CONS
                               (LETT |pt1|
                                     (|ACPLOT;makePt| |xMaxSF| |rootSF| $)
                                     . #4#)
                               |rt|)
                              . #4#)
                        (LETT |lf|
                              (CONS
                               (LETT |pt2|
                                     (|ACPLOT;makePt| |xMinSF| |rootSF| $)
                                     . #4#)
                               |lf|)
                              . #4#)
                        (LETT |branch| (LIST |pt1| |pt2|) . #4#)
                        (EXIT (LETT |bran| (CONS |branch| |bran|) . #4#)))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                       (EXIT NIL))))))
          (EXIT
           (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                   (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans| |bran|)))))))))) 

(DEFUN |ACPLOT;makeLineSketch| (|p| |x| |y| |xMin| |xMax| |yMin| |yMax| $)
  (PROG (|bran| |branch| |rt| |pt| |lf| |tp| |bt| |yRight| |yLeft| |xTop|
         |xBottom| |vtans| |htans| |c| |b| |a| |yMaxSF| |yMinSF| |xMaxSF|
         |xMinSF|)
    (RETURN
     (SEQ
      (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #1=(|ACPLOT;makeLineSketch|))
      (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #1#)
      (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #1#)
      (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #1#)
      (LETT |a|
            (FLOAT
             (SPADCALL (SPADCALL |p| |x| 1 (QREFELT $ 88)) (QREFELT $ 89))
             MOST-POSITIVE-DOUBLE-FLOAT)
            . #1#)
      (LETT |b|
            (FLOAT
             (SPADCALL (SPADCALL |p| |y| 1 (QREFELT $ 88)) (QREFELT $ 89))
             MOST-POSITIVE-DOUBLE-FLOAT)
            . #1#)
      (LETT |c|
            (FLOAT
             (SPADCALL
              (SPADCALL (SPADCALL |p| |x| 0 (QREFELT $ 88)) |y| 0
                        (QREFELT $ 88))
              (QREFELT $ 89))
             MOST-POSITIVE-DOUBLE-FLOAT)
            . #1#)
      (LETT |lf| NIL . #1#) (LETT |rt| NIL . #1#) (LETT |bt| NIL . #1#)
      (LETT |tp| NIL . #1#) (LETT |htans| NIL . #1#) (LETT |vtans| NIL . #1#)
      (LETT |branch| NIL . #1#) (LETT |bran| NIL . #1#)
      (LETT |xBottom|
            (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |b| |yMinSF|)) |c|) |a|)
            . #1#)
      (LETT |xTop|
            (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |b| |yMaxSF|)) |c|) |a|)
            . #1#)
      (LETT |yLeft|
            (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |a| |xMinSF|)) |c|) |b|)
            . #1#)
      (LETT |yRight|
            (|div_DF| (|sub_DF| (|minus_DF| (|mul_DF| |a| |xMaxSF|)) |c|) |b|)
            . #1#)
      (COND
       ((|less_DF| |xMinSF| |xBottom|)
        (COND
         ((|less_DF| |xBottom| |xMaxSF|)
          (SEQ
           (LETT |bt|
                 (CONS (LETT |pt| (|ACPLOT;makePt| |xBottom| |yMinSF| $) . #1#)
                       |bt|)
                 . #1#)
           (EXIT (LETT |branch| (CONS |pt| |branch|) . #1#)))))))
      (COND
       ((|less_DF| |xMinSF| |xTop|)
        (COND
         ((|less_DF| |xTop| |xMaxSF|)
          (SEQ
           (LETT |tp|
                 (CONS (LETT |pt| (|ACPLOT;makePt| |xTop| |yMaxSF| $) . #1#)
                       |tp|)
                 . #1#)
           (EXIT (LETT |branch| (CONS |pt| |branch|) . #1#)))))))
      (COND
       ((SPADCALL |yMinSF| |yLeft| (QREFELT $ 90))
        (COND
         ((SPADCALL |yLeft| |yMaxSF| (QREFELT $ 90))
          (SEQ
           (LETT |lf|
                 (CONS (LETT |pt| (|ACPLOT;makePt| |xMinSF| |yLeft| $) . #1#)
                       |lf|)
                 . #1#)
           (EXIT (LETT |branch| (CONS |pt| |branch|) . #1#)))))))
      (COND
       ((SPADCALL |yMinSF| |yRight| (QREFELT $ 90))
        (COND
         ((SPADCALL |yRight| |yMaxSF| (QREFELT $ 90))
          (SEQ
           (LETT |rt|
                 (CONS (LETT |pt| (|ACPLOT;makePt| |xMaxSF| |yRight| $) . #1#)
                       |rt|)
                 . #1#)
           (EXIT (LETT |branch| (CONS |pt| |branch|) . #1#)))))))
      (LETT |bran| (CONS |branch| |bran|) . #1#)
      (EXIT
       (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
               (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans| |bran|)))))) 

(DEFUN |ACPLOT;singValBetween?| (|xCurrent| |xNext| |xSingList| $)
  (PROG (#1=#:G285 #2=#:G287 #3=#:G288 |xVal|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |xVal| NIL . #4=(|ACPLOT;singValBetween?|))
               (LETT #3# |xSingList| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |xVal| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|less_DF| |xCurrent| |xVal|)
                   (COND
                    ((|less_DF| |xVal| |xNext|)
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                      (GO #1#))))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |ACPLOT;segmentInfo|
       (|f| |lo| |hi| |botList| |topList| |singList| |minSF| |maxSF| $)
  (PROG (#1=#:G305 |val| |nextFrom| |nxt| |top| |bot| |currentFrom| |current|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ G190 NIL
            (SEQ
             (COND
              ((NULL |topList|)
               (COND
                ((NULL |botList|)
                 (PROGN
                  (LETT #1#
                        (VECTOR (SPADCALL |lo| |hi| (QREFELT $ 92)) |hi| NIL
                                NIL)
                        . #2=(|ACPLOT;segmentInfo|))
                  (GO #1#)))
                ('T
                 (SEQ (LETT |current| (|SPADfirst| |botList|) . #2#)
                      (LETT |botList| (CDR |botList|) . #2#)
                      (EXIT (LETT |currentFrom| (QREFELT $ 19) . #2#))))))
              ((NULL |botList|)
               (SEQ (LETT |current| (|SPADfirst| |topList|) . #2#)
                    (LETT |topList| (CDR |topList|) . #2#)
                    (EXIT (LETT |currentFrom| (QREFELT $ 20) . #2#))))
              ('T
               (SEQ (LETT |bot| (|SPADfirst| |botList|) . #2#)
                    (LETT |top| (|SPADfirst| |topList|) . #2#)
                    (EXIT
                     (COND
                      ((|less_DF| |bot| |top|)
                       (SEQ (LETT |current| |bot| . #2#)
                            (LETT |botList| (CDR |botList|) . #2#)
                            (EXIT (LETT |currentFrom| (QREFELT $ 19) . #2#))))
                      ('T
                       (SEQ (LETT |current| |top| . #2#)
                            (LETT |topList| (CDR |topList|) . #2#)
                            (EXIT
                             (LETT |currentFrom| (QREFELT $ 20) . #2#)))))))))
             (COND
              ((NULL |topList|)
               (COND
                ((NULL |botList|)
                 (PROGN
                  (LETT #1#
                        (VECTOR (SPADCALL |lo| |hi| (QREFELT $ 92)) |hi| NIL
                                NIL)
                        . #2#)
                  (GO #1#)))
                ('T
                 (SEQ (LETT |nxt| (|SPADfirst| |botList|) . #2#)
                      (LETT |botList| (CDR |botList|) . #2#)
                      (EXIT (LETT |nextFrom| (QREFELT $ 19) . #2#))))))
              ((NULL |botList|)
               (SEQ (LETT |nxt| (|SPADfirst| |topList|) . #2#)
                    (LETT |topList| (CDR |topList|) . #2#)
                    (EXIT (LETT |nextFrom| (QREFELT $ 20) . #2#))))
              ('T
               (SEQ (LETT |bot| (|SPADfirst| |botList|) . #2#)
                    (LETT |top| (|SPADfirst| |topList|) . #2#)
                    (EXIT
                     (COND
                      ((|less_DF| |bot| |top|)
                       (SEQ (LETT |nxt| |bot| . #2#)
                            (LETT |botList| (CDR |botList|) . #2#)
                            (EXIT (LETT |nextFrom| (QREFELT $ 19) . #2#))))
                      ('T
                       (SEQ (LETT |nxt| |top| . #2#)
                            (LETT |topList| (CDR |topList|) . #2#)
                            (EXIT
                             (LETT |nextFrom| (QREFELT $ 20) . #2#)))))))))
             (EXIT
              (COND
               ((EQUAL |currentFrom| |nextFrom|)
                (COND
                 ((|ACPLOT;singValBetween?| |current| |nxt| |singList| $)
                  (PROGN
                   (LETT #1#
                         (VECTOR (SPADCALL |lo| |current| (QREFELT $ 92)) |nxt|
                                 |botList| |topList|)
                         . #2#)
                   (GO #1#)))
                 ('T
                  (SEQ
                   (LETT |val|
                         (SPADCALL
                          (|div_DF| (|sub_DF| |nxt| |current|)
                                    (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                          |f|)
                         . #2#)
                   (EXIT
                    (COND
                     ((OR (SPADCALL |val| |minSF| (QREFELT $ 90))
                          (SPADCALL |val| |maxSF| (QREFELT $ 93)))
                      (PROGN
                       (LETT #1#
                             (VECTOR (SPADCALL |lo| |current| (QREFELT $ 92))
                                     |nxt| |botList| |topList|)
                             . #2#)
                       (GO #1#)))))))))
               ((|ACPLOT;singValBetween?| |current| |nxt| |singList| $)
                (PROGN
                 (LETT #1#
                       (VECTOR (SPADCALL |lo| |current| (QREFELT $ 92)) |nxt|
                               |botList| |topList|)
                       . #2#)
                 (GO #1#))))))
            NIL (GO G190) G191 (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |ACPLOT;makeRatFcnSketch|
       (|p| |x| |y| |xMin| |xMax| |yMin| |yMax| |depVar| $)
  (PROG (|bran| |curve| |RFPlot| #1=#:G362 |segment| #2=#:G347 |topList|
         |botList| |lo| |segList| |segInfo| |maxSF| |minSF| |hi| |top| |bot|
         #3=#:G354 |tp| #4=#:G361 |val| |bt| #5=#:G360 |rt| |lf| #6=#:G359
         #7=#:G358 |rightVal| |leftVal| |denUPolyRN| |outList| #8=#:G357 |root|
         |roots| #9=#:G356 |singList| #10=#:G355 |vtans| |htans| |vtanPts|
         |htanPts| |depVarMaxSF| |depVarMinSF| |depVarMax| |depVarMin|
         |indVarMaxSF| |indVarMinSF| |indVarMaxNF| |indVarMinNF| |indVarMax|
         |indVarMin| |f| |denUPolySF| |numUPolySF| |den| |num| |yMaxNF|
         |yMinNF| |xMaxNF| |xMinNF| |yMaxSF| |yMinSF| |xMaxSF| |xMinSF| |pRN|
         |dpdy| |dpdx| |factoredP|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |factoredP| (SPADCALL |p| (QREFELT $ 95))
              . #11=(|ACPLOT;makeRatFcnSketch|))
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |factoredP| (QREFELT $ 96)) 1 (QREFELT $ 82))
           (|error| "reducible polynomial"))
          (#12='T
           (SEQ (LETT |dpdx| (SPADCALL |p| |x| (QREFELT $ 97)) . #11#)
                (LETT |dpdy| (SPADCALL |p| |y| (QREFELT $ 97)) . #11#)
                (LETT |pRN| (|ACPLOT;coerceCoefsToRNs| |p| $) . #11#)
                (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #11#)
                (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #11#)
                (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #11#)
                (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #11#)
                (LETT |xMinNF| (|ACPLOT;RNtoNF| |xMin| $) . #11#)
                (LETT |xMaxNF| (|ACPLOT;RNtoNF| |xMax| $) . #11#)
                (LETT |yMinNF| (|ACPLOT;RNtoNF| |yMin| $) . #11#)
                (LETT |yMaxNF| (|ACPLOT;RNtoNF| |yMax| $) . #11#)
                (LETT |num|
                      (SPADCALL (SPADCALL |p| |depVar| 0 (QREFELT $ 88))
                                (QREFELT $ 98))
                      . #11#)
                (LETT |den| (SPADCALL |p| |depVar| 1 (QREFELT $ 88)) . #11#)
                (LETT |numUPolySF|
                      (|ACPLOT;SFPolyToUPoly|
                       (|ACPLOT;coerceCoefsToSFs| |num| $) $)
                      . #11#)
                (LETT |denUPolySF|
                      (|ACPLOT;SFPolyToUPoly|
                       (|ACPLOT;coerceCoefsToSFs| |den| $) $)
                      . #11#)
                (LETT |f|
                      (CONS #'|ACPLOT;makeRatFcnSketch!0|
                            (VECTOR |denUPolySF| $ |numUPolySF|))
                      . #11#)
                (COND
                 ((EQUAL |depVar| |x|)
                  (SEQ (LETT |indVarMin| |yMin| . #11#)
                       (LETT |indVarMax| |yMax| . #11#)
                       (LETT |indVarMinNF| |yMinNF| . #11#)
                       (LETT |indVarMaxNF| |yMaxNF| . #11#)
                       (LETT |indVarMinSF| |yMinSF| . #11#)
                       (LETT |indVarMaxSF| |yMaxSF| . #11#)
                       (LETT |depVarMin| |xMin| . #11#)
                       (LETT |depVarMax| |xMax| . #11#)
                       (LETT |depVarMinSF| |xMinSF| . #11#)
                       (EXIT (LETT |depVarMaxSF| |xMaxSF| . #11#))))
                 (#12#
                  (SEQ (LETT |indVarMin| |xMin| . #11#)
                       (LETT |indVarMax| |xMax| . #11#)
                       (LETT |indVarMinNF| |xMinNF| . #11#)
                       (LETT |indVarMaxNF| |xMaxNF| . #11#)
                       (LETT |indVarMinSF| |xMinSF| . #11#)
                       (LETT |indVarMaxSF| |xMaxSF| . #11#)
                       (LETT |depVarMin| |yMin| . #11#)
                       (LETT |depVarMax| |yMax| . #11#)
                       (LETT |depVarMinSF| |yMinSF| . #11#)
                       (EXIT (LETT |depVarMaxSF| |yMaxSF| . #11#)))))
                (LETT |htanPts|
                      (SPADCALL (LIST |p| |dpdx|) (LIST |x| |y|) (QREFELT $ 12)
                                (QREFELT $ 103))
                      . #11#)
                (LETT |vtanPts|
                      (SPADCALL (LIST |p| |dpdy|) (LIST |x| |y|) (QREFELT $ 12)
                                (QREFELT $ 103))
                      . #11#)
                (LETT |htans|
                      (|ACPLOT;listPtsInRect| |htanPts| |xMinNF| |xMaxNF|
                       |yMinNF| |yMaxNF| $)
                      . #11#)
                (LETT |vtans|
                      (|ACPLOT;listPtsInRect| |vtanPts| |xMinNF| |xMaxNF|
                       |yMinNF| |yMaxNF| $)
                      . #11#)
                (LETT |lf| NIL . #11#) (LETT |rt| NIL . #11#)
                (LETT |bt| NIL . #11#) (LETT |tp| NIL . #11#)
                (LETT |singList|
                      (SEQ
                       (LETT |roots|
                             (SPADCALL |den| (QREFELT $ 12) (QREFELT $ 87))
                             . #11#)
                       (LETT |outList| NIL . #11#)
                       (SEQ (LETT |root| NIL . #11#) (LETT #10# |roots| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #10#)
                                  (PROGN (LETT |root| (CAR #10#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |indVarMinNF| |root| (QREFELT $ 67))
                                (COND
                                 ((SPADCALL |root| |indVarMaxNF|
                                            (QREFELT $ 67))
                                  (LETT |outList|
                                        (CONS (|ACPLOT;NFtoSF| |root| $)
                                              |outList|)
                                        . #11#)))))))
                            (LETT #10# (CDR #10#) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL (ELT $ 104) |outList| (QREFELT $ 106))))
                      . #11#)
                (LETT |topList|
                      (SEQ
                       (LETT |roots|
                             (SPADCALL
                              (SPADCALL |pRN| |depVar| |depVarMax|
                                        (QREFELT $ 63))
                              (QREFELT $ 12) (QREFELT $ 66))
                             . #11#)
                       (LETT |outList| NIL . #11#)
                       (SEQ (LETT |root| NIL . #11#) (LETT #9# |roots| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |root| (CAR #9#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |indVarMinNF| |root| (QREFELT $ 67))
                                (COND
                                 ((SPADCALL |root| |indVarMaxNF|
                                            (QREFELT $ 67))
                                  (LETT |outList|
                                        (CONS (|ACPLOT;NFtoSF| |root| $)
                                              |outList|)
                                        . #11#)))))))
                            (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL (ELT $ 104) |outList| (QREFELT $ 106))))
                      . #11#)
                (LETT |botList|
                      (SEQ
                       (LETT |roots|
                             (SPADCALL
                              (SPADCALL |pRN| |depVar| |depVarMin|
                                        (QREFELT $ 63))
                              (QREFELT $ 12) (QREFELT $ 66))
                             . #11#)
                       (LETT |outList| NIL . #11#)
                       (SEQ (LETT |root| NIL . #11#) (LETT #8# |roots| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |root| (CAR #8#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |indVarMinNF| |root| (QREFELT $ 67))
                                (COND
                                 ((SPADCALL |root| |indVarMaxNF|
                                            (QREFELT $ 67))
                                  (LETT |outList|
                                        (CONS (|ACPLOT;NFtoSF| |root| $)
                                              |outList|)
                                        . #11#)))))))
                            (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL (ELT $ 104) |outList| (QREFELT $ 106))))
                      . #11#)
                (LETT |denUPolyRN|
                      (|ACPLOT;RNPolyToUPoly|
                       (|ACPLOT;coerceCoefsToRNs| |den| $) $)
                      . #11#)
                (COND
                 ((SPADCALL (SPADCALL |denUPolyRN| |indVarMin| (QREFELT $ 107))
                            (|spadConstant| $ 108) (QREFELT $ 109))
                  (LETT |leftVal|
                        (|sub_DF| |depVarMinSF|
                                  (|add_DF| (FLOAT-SIGN 1.0 |depVarMinSF|)
                                            1.0))
                        . #11#))
                 (#12# (LETT |leftVal| (SPADCALL |indVarMinSF| |f|) . #11#)))
                (COND
                 ((SPADCALL (SPADCALL |denUPolyRN| |indVarMax| (QREFELT $ 107))
                            (|spadConstant| $ 108) (QREFELT $ 109))
                  (LETT |rightVal|
                        (|sub_DF| |depVarMinSF|
                                  (|add_DF| (FLOAT-SIGN 1.0 |depVarMinSF|)
                                            1.0))
                        . #11#))
                 (#12# (LETT |rightVal| (SPADCALL |indVarMaxSF| |f|) . #11#)))
                (COND
                 ((EQUAL |depVar| |x|)
                  (SEQ
                   (COND
                    ((|less_DF| |xMinSF| |leftVal|)
                     (COND
                      ((|less_DF| |leftVal| |xMaxSF|)
                       (LETT |bt|
                             (CONS (|ACPLOT;makePt| |leftVal| |yMinSF| $) |bt|)
                             . #11#)))))
                   (COND
                    ((|less_DF| |xMinSF| |rightVal|)
                     (COND
                      ((|less_DF| |rightVal| |xMaxSF|)
                       (LETT |tp|
                             (CONS (|ACPLOT;makePt| |rightVal| |yMaxSF| $)
                                   |tp|)
                             . #11#)))))
                   (SEQ (LETT |val| NIL . #11#) (LETT #7# |botList| . #11#)
                        G190
                        (COND
                         ((OR (ATOM #7#)
                              (PROGN (LETT |val| (CAR #7#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |lf|
                                (CONS (|ACPLOT;makePt| |xMinSF| |val| $) |lf|)
                                . #11#)))
                        (LETT #7# (CDR #7#) . #11#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SEQ (LETT |val| NIL . #11#) (LETT #6# |topList| . #11#)
                         G190
                         (COND
                          ((OR (ATOM #6#)
                               (PROGN (LETT |val| (CAR #6#) . #11#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |rt|
                                 (CONS (|ACPLOT;makePt| |xMaxSF| |val| $) |rt|)
                                 . #11#)))
                         (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                         (EXIT NIL)))))
                 (#12#
                  (SEQ
                   (COND
                    ((|less_DF| |yMinSF| |leftVal|)
                     (COND
                      ((|less_DF| |leftVal| |yMaxSF|)
                       (LETT |lf|
                             (CONS (|ACPLOT;makePt| |xMinSF| |leftVal| $) |lf|)
                             . #11#)))))
                   (COND
                    ((|less_DF| |yMinSF| |rightVal|)
                     (COND
                      ((|less_DF| |rightVal| |yMaxSF|)
                       (LETT |rt|
                             (CONS (|ACPLOT;makePt| |xMaxSF| |rightVal| $)
                                   |rt|)
                             . #11#)))))
                   (SEQ (LETT |val| NIL . #11#) (LETT #5# |botList| . #11#)
                        G190
                        (COND
                         ((OR (ATOM #5#)
                              (PROGN (LETT |val| (CAR #5#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |bt|
                                (CONS (|ACPLOT;makePt| |val| |yMinSF| $) |bt|)
                                . #11#)))
                        (LETT #5# (CDR #5#) . #11#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SEQ (LETT |val| NIL . #11#) (LETT #4# |topList| . #11#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |val| (CAR #4#) . #11#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |tp|
                                 (CONS (|ACPLOT;makePt| |val| |yMaxSF| $) |tp|)
                                 . #11#)))
                         (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                         (EXIT NIL))))))
                (LETT |bran| NIL . #11#)
                (COND
                 ((|less_DF| |depVarMinSF| |leftVal|)
                  (COND
                   ((|less_DF| |leftVal| |depVarMaxSF|)
                    (LETT |lo| |indVarMinSF| . #11#))
                   ((NULL |topList|)
                    (COND
                     ((NULL |botList|)
                      (PROGN
                       (LETT #3#
                             (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                                     (VECTOR |lf| |rt| |bt| |tp|) |htans|
                                     |vtans| |bran|)
                             . #11#)
                       (GO #3#)))
                     (#12#
                      (SEQ (LETT |lo| (|SPADfirst| |botList|) . #11#)
                           (EXIT (LETT |botList| (CDR |botList|) . #11#))))))
                   ((NULL |botList|)
                    (SEQ (LETT |lo| (|SPADfirst| |topList|) . #11#)
                         (EXIT (LETT |topList| (CDR |topList|) . #11#))))
                   (#12#
                    (SEQ (LETT |bot| (|SPADfirst| |botList|) . #11#)
                         (LETT |top| (|SPADfirst| |topList|) . #11#)
                         (EXIT
                          (COND
                           ((|less_DF| |bot| |top|)
                            (SEQ (LETT |lo| |bot| . #11#)
                                 (EXIT
                                  (LETT |botList| (CDR |botList|) . #11#))))
                           (#12#
                            (SEQ (LETT |lo| |top| . #11#)
                                 (EXIT
                                  (LETT |topList| (CDR |topList|)
                                        . #11#))))))))))
                 ((NULL |topList|)
                  (COND
                   ((NULL |botList|)
                    (PROGN
                     (LETT #3#
                           (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                                   (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans|
                                   |bran|)
                           . #11#)
                     (GO #3#)))
                   (#12#
                    (SEQ (LETT |lo| (|SPADfirst| |botList|) . #11#)
                         (EXIT (LETT |botList| (CDR |botList|) . #11#))))))
                 ((NULL |botList|)
                  (SEQ (LETT |lo| (|SPADfirst| |topList|) . #11#)
                       (EXIT (LETT |topList| (CDR |topList|) . #11#))))
                 (#12#
                  (SEQ (LETT |bot| (|SPADfirst| |botList|) . #11#)
                       (LETT |top| (|SPADfirst| |topList|) . #11#)
                       (EXIT
                        (COND
                         ((|less_DF| |bot| |top|)
                          (SEQ (LETT |lo| |bot| . #11#)
                               (EXIT (LETT |botList| (CDR |botList|) . #11#))))
                         (#12#
                          (SEQ (LETT |lo| |top| . #11#)
                               (EXIT
                                (LETT |topList| (CDR |topList|) . #11#)))))))))
                (LETT |hi| 0.0 . #11#)
                (COND
                 ((|less_DF| |depVarMinSF| |rightVal|)
                  (COND
                   ((|less_DF| |rightVal| |depVarMaxSF|)
                    (LETT |hi| |indVarMaxSF| . #11#))
                   ((NULL |topList|)
                    (COND
                     ((NULL |botList|)
                      (|error| #13="makeRatFcnSketch: plot domain"))
                     (#12#
                      (SEQ
                       (LETT |hi| (SPADCALL |botList| (QREFELT $ 110)) . #11#)
                       (EXIT
                        (LETT |botList|
                              (SPADCALL |hi| |botList| (QREFELT $ 111))
                              . #11#))))))
                   ((NULL |botList|)
                    (SEQ
                     (LETT |hi| (SPADCALL |topList| (QREFELT $ 110)) . #11#)
                     (EXIT
                      (LETT |topList| (SPADCALL |hi| |topList| (QREFELT $ 111))
                            . #11#))))
                   (#12#
                    (SEQ
                     (LETT |bot| (SPADCALL |botList| (QREFELT $ 110)) . #11#)
                     (LETT |top| (SPADCALL |topList| (QREFELT $ 110)) . #11#)
                     (EXIT
                      (COND
                       ((SPADCALL |bot| |top| (QREFELT $ 112))
                        (SEQ (LETT |hi| |bot| . #11#)
                             (EXIT
                              (LETT |botList|
                                    (SPADCALL |hi| |botList| (QREFELT $ 111))
                                    . #11#))))
                       (#12#
                        (SEQ (LETT |hi| |top| . #11#)
                             (EXIT
                              (LETT |topList|
                                    (SPADCALL |hi| |topList| (QREFELT $ 111))
                                    . #11#))))))))))
                 ((NULL |topList|)
                  (COND ((NULL |botList|) (|error| #13#))
                        (#12#
                         (SEQ
                          (LETT |hi| (SPADCALL |botList| (QREFELT $ 110))
                                . #11#)
                          (EXIT
                           (LETT |botList|
                                 (SPADCALL |hi| |botList| (QREFELT $ 111))
                                 . #11#))))))
                 ((NULL |botList|)
                  (SEQ (LETT |hi| (SPADCALL |topList| (QREFELT $ 110)) . #11#)
                       (EXIT
                        (LETT |topList|
                              (SPADCALL |hi| |topList| (QREFELT $ 111))
                              . #11#))))
                 (#12#
                  (SEQ (LETT |bot| (SPADCALL |botList| (QREFELT $ 110)) . #11#)
                       (LETT |top| (SPADCALL |topList| (QREFELT $ 110)) . #11#)
                       (EXIT
                        (COND
                         ((SPADCALL |bot| |top| (QREFELT $ 112))
                          (SEQ (LETT |hi| |bot| . #11#)
                               (EXIT
                                (LETT |botList|
                                      (SPADCALL |hi| |botList| (QREFELT $ 111))
                                      . #11#))))
                         (#12#
                          (SEQ (LETT |hi| |top| . #11#)
                               (EXIT
                                (LETT |topList|
                                      (SPADCALL |hi| |topList| (QREFELT $ 111))
                                      . #11#)))))))))
                (COND
                 ((EQUAL |depVar| |x|)
                  (SEQ (LETT |minSF| |xMinSF| . #11#)
                       (EXIT (LETT |maxSF| |xMaxSF| . #11#))))
                 (#12#
                  (SEQ (LETT |minSF| |yMinSF| . #11#)
                       (EXIT (LETT |maxSF| |yMaxSF| . #11#)))))
                (LETT |segList| NIL . #11#)
                (SEQ
                 (EXIT
                  (SEQ G190 NIL
                       (SEQ
                        (LETT |segInfo|
                              (|ACPLOT;segmentInfo| |f| |lo| |hi| |botList|
                               |topList| |singList| |minSF| |maxSF| $)
                              . #11#)
                        (LETT |segList| (CONS (QVELT |segInfo| 0) |segList|)
                              . #11#)
                        (LETT |lo| (QVELT |segInfo| 1) . #11#)
                        (LETT |botList| (QVELT |segInfo| 2) . #11#)
                        (LETT |topList| (QVELT |segInfo| 3) . #11#)
                        (EXIT
                         (COND
                          ((|eql_DF| |lo| |hi|)
                           (PROGN (LETT #2# |$NoValue| . #11#) (GO #2#))))))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #2# (EXIT #2#))
                (SEQ (LETT |segment| NIL . #11#) (LETT #1# |segList| . #11#)
                     G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |segment| (CAR #1#) . #11#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |RFPlot| (SPADCALL |f| |segment| (QREFELT $ 115))
                            . #11#)
                      (LETT |curve|
                            (|SPADfirst| (SPADCALL |RFPlot| (QREFELT $ 117)))
                            . #11#)
                      (EXIT
                       (COND
                        ((EQUAL |depVar| |y|)
                         (LETT |bran| (CONS |curve| |bran|) . #11#))
                        ('T
                         (LETT |bran|
                               (CONS
                                (SPADCALL
                                 (CONS (|function| |ACPLOT;swapCoords|) $)
                                 |curve| (QREFELT $ 120))
                                |bran|)
                               . #11#)))))
                     (LETT #1# (CDR #1#) . #11#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax|
                         (VECTOR |lf| |rt| |bt| |tp|) |htans| |vtans|
                         |bran|))))))))
      #3# (EXIT #3#))))) 

(DEFUN |ACPLOT;makeRatFcnSketch!0| (|s| $$)
  (PROG (|numUPolySF| $ |denUPolySF|)
    (LETT |numUPolySF| (QREFELT $$ 2) . #1=(|ACPLOT;makeRatFcnSketch|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |denUPolySF| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |numUPolySF| |s| (QREFELT $ 99))
                (SPADCALL |denUPolySF| |s| (QREFELT $ 99)) (QREFELT $ 100)))))) 

(DEFUN |ACPLOT;makeGeneralSketch| (|pol| |x| |y| |xMin| |xMax| |yMin| |yMax| $)
  (PROG (|bran| |bdPts| |tp| |bt| |rt| |lf| |pRN| |bound| |err| |delta|
         |dpdySF| |dpdxSF| |pSF| |corners| |yMaxSF| |yMinSF| |xMaxSF| |xMinSF|
         |crits| |vtans| |htans| |yMaxNF| |foo| |yMinNF| |xMaxNF| |xMinNF|
         |vInc| |hInc| |critPts| |vtanPts| |htanPts| |singPts| |dpdy| |dpdx|
         |p| |factoredPol|)
    (RETURN
     (SEQ
      (LETT |factoredPol| (SPADCALL |pol| (QREFELT $ 95))
            . #1=(|ACPLOT;makeGeneralSketch|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |factoredPol| (QREFELT $ 96)) 1 (QREFELT $ 82))
         (|error| "reducible polynomial"))
        (#2='T
         (SEQ (LETT |p| (SPADCALL |factoredPol| 1 (QREFELT $ 121)) . #1#)
              (LETT |dpdx| (SPADCALL |p| |x| (QREFELT $ 97)) . #1#)
              (LETT |dpdy| (SPADCALL |p| |y| (QREFELT $ 97)) . #1#)
              (LETT |xMinNF| (|ACPLOT;RNtoNF| |xMin| $) . #1#)
              (LETT |xMaxNF| (|ACPLOT;RNtoNF| |xMax| $) . #1#)
              (LETT |yMinNF| (|ACPLOT;RNtoNF| |yMin| $) . #1#)
              (LETT |yMaxNF| (|ACPLOT;RNtoNF| |yMax| $) . #1#)
              (LETT |singPts|
                    (SPADCALL (LIST |p| |dpdx| |dpdy|) (LIST |x| |y|)
                              (QREFELT $ 12) (QREFELT $ 103))
                    . #1#)
              (LETT |foo|
                    (CONS #'|ACPLOT;makeGeneralSketch!0|
                          (VECTOR $ |yMaxNF| |yMinNF| |xMaxNF| |xMinNF|))
                    . #1#)
              (EXIT
               (COND
                ((|ACPLOT;ptsSuchThat?| |singPts| |foo| $)
                 (|error| "singular pts in region of sketch"))
                (#2#
                 (SEQ
                  (LETT |htanPts|
                        (SPADCALL (LIST |p| |dpdx|) (LIST |x| |y|)
                                  (QREFELT $ 12) (QREFELT $ 103))
                        . #1#)
                  (LETT |vtanPts|
                        (SPADCALL (LIST |p| |dpdy|) (LIST |x| |y|)
                                  (QREFELT $ 12) (QREFELT $ 103))
                        . #1#)
                  (LETT |critPts| (APPEND |htanPts| |vtanPts|) . #1#)
                  (LETT |hInc|
                        (SPADCALL (SPADCALL 1 20 (QREFELT $ 122))
                                  (SPADCALL |xMax| |xMin| (QREFELT $ 123))
                                  (QREFELT $ 124))
                        . #1#)
                  (LETT |vInc|
                        (SPADCALL (SPADCALL 1 20 (QREFELT $ 122))
                                  (SPADCALL |yMax| |yMin| (QREFELT $ 123))
                                  (QREFELT $ 124))
                        . #1#)
                  (LETT |foo|
                        (CONS #'|ACPLOT;makeGeneralSketch!1|
                              (VECTOR $ |xMinNF| |yMaxNF| |yMinNF|))
                        . #1#)
                  (COND
                   ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                    (SEQ
                     (LETT |xMin|
                           (|ACPLOT;newX| |critPts| |singPts| |yMinNF| |yMaxNF|
                            |xMinNF| |xMin| (SPADCALL |hInc| (QREFELT $ 125))
                            $)
                           . #1#)
                     (EXIT (LETT |xMinNF| (|ACPLOT;RNtoNF| |xMin| $) . #1#)))))
                  (LETT |foo|
                        (CONS #'|ACPLOT;makeGeneralSketch!2|
                              (VECTOR $ |xMaxNF| |yMaxNF| |yMinNF|))
                        . #1#)
                  (COND
                   ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                    (SEQ
                     (LETT |xMax|
                           (|ACPLOT;newX| |critPts| |singPts| |yMinNF| |yMaxNF|
                            |xMaxNF| |xMax| |hInc| $)
                           . #1#)
                     (EXIT (LETT |xMaxNF| (|ACPLOT;RNtoNF| |xMax| $) . #1#)))))
                  (LETT |foo|
                        (CONS #'|ACPLOT;makeGeneralSketch!3|
                              (VECTOR $ |yMinNF| |xMaxNF| |xMinNF|))
                        . #1#)
                  (COND
                   ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                    (SEQ
                     (LETT |yMin|
                           (|ACPLOT;newY| |critPts| |singPts| |xMinNF| |xMaxNF|
                            |yMinNF| |yMin| (SPADCALL |vInc| (QREFELT $ 125))
                            $)
                           . #1#)
                     (EXIT (LETT |yMinNF| (|ACPLOT;RNtoNF| |yMin| $) . #1#)))))
                  (LETT |foo|
                        (CONS #'|ACPLOT;makeGeneralSketch!4|
                              (VECTOR $ |yMaxNF| |xMaxNF| |xMinNF|))
                        . #1#)
                  (COND
                   ((|ACPLOT;ptsSuchThat?| |critPts| |foo| $)
                    (SEQ
                     (LETT |yMax|
                           (|ACPLOT;newY| |critPts| |singPts| |xMinNF| |xMaxNF|
                            |yMaxNF| |yMax| |vInc| $)
                           . #1#)
                     (EXIT (LETT |yMaxNF| (|ACPLOT;RNtoNF| |yMax| $) . #1#)))))
                  (LETT |htans|
                        (|ACPLOT;listPtsInRect| |htanPts| |xMinNF| |xMaxNF|
                         |yMinNF| |yMaxNF| $)
                        . #1#)
                  (LETT |vtans|
                        (|ACPLOT;listPtsInRect| |vtanPts| |xMinNF| |xMaxNF|
                         |yMinNF| |yMaxNF| $)
                        . #1#)
                  (LETT |crits| (APPEND |htans| |vtans|) . #1#)
                  (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #1#)
                  (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #1#)
                  (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #1#)
                  (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #1#)
                  (LETT |corners|
                        (|ACPLOT;makeCorners| |xMinSF| |xMaxSF| |yMinSF|
                         |yMaxSF| $)
                        . #1#)
                  (LETT |pSF| (|ACPLOT;coerceCoefsToSFs| |p| $) . #1#)
                  (LETT |dpdxSF| (|ACPLOT;coerceCoefsToSFs| |dpdx| $) . #1#)
                  (LETT |dpdySF| (|ACPLOT;coerceCoefsToSFs| |dpdy| $) . #1#)
                  (LETT |delta|
                        (|min_DF| (|div_DF_I| (|sub_DF| |xMaxSF| |xMinSF|) 25)
                                  (|div_DF_I| (|sub_DF| |yMaxSF| |yMinSF|) 25))
                        . #1#)
                  (LETT |err|
                        (|min_DF| (|div_DF_I| |delta| 100)
                                  (|div_DF_I| (QREFELT $ 15) 100))
                        . #1#)
                  (LETT |bound| 10 . #1#)
                  (LETT |pRN| (|ACPLOT;coerceCoefsToRNs| |p| $) . #1#)
                  (LETT |lf|
                        (|ACPLOT;listPtsOnVertBdry| |pRN| |x| |xMin| |yMinNF|
                         |yMaxNF| $)
                        . #1#)
                  (LETT |rt|
                        (|ACPLOT;listPtsOnVertBdry| |pRN| |x| |xMax| |yMinNF|
                         |yMaxNF| $)
                        . #1#)
                  (LETT |bt|
                        (|ACPLOT;listPtsOnHorizBdry| |pRN| |y| |yMin| |xMinNF|
                         |xMaxNF| $)
                        . #1#)
                  (LETT |tp|
                        (|ACPLOT;listPtsOnHorizBdry| |pRN| |y| |yMax| |xMinNF|
                         |xMaxNF| $)
                        . #1#)
                  (LETT |bdPts| (VECTOR |lf| |rt| |bt| |tp|) . #1#)
                  (LETT |bran|
                        (|ACPLOT;traceBranches| |pSF| |dpdxSF| |dpdySF| |x| |y|
                         |corners| |delta| |err| |bound| |crits| |bdPts| $)
                        . #1#)
                  (EXIT
                   (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax| |bdPts|
                           |htans| |vtans| |bran|)))))))))))))) 

(DEFUN |ACPLOT;makeGeneralSketch!4| (|s| $$)
  (PROG (|xMinNF| |xMaxNF| |yMaxNF| $)
    (LETT |xMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
    (LETT |xMaxNF| (QREFELT $$ 2) . #1#)
    (LETT |yMaxNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ACPLOT;onHorzSeg?| |s| |xMinNF| |xMaxNF| |yMaxNF| $))))) 

(DEFUN |ACPLOT;makeGeneralSketch!3| (|s| $$)
  (PROG (|xMinNF| |xMaxNF| |yMinNF| $)
    (LETT |xMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
    (LETT |xMaxNF| (QREFELT $$ 2) . #1#)
    (LETT |yMinNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ACPLOT;onHorzSeg?| |s| |xMinNF| |xMaxNF| |yMinNF| $))))) 

(DEFUN |ACPLOT;makeGeneralSketch!2| (|s| $$)
  (PROG (|yMinNF| |yMaxNF| |xMaxNF| $)
    (LETT |yMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
    (LETT |yMaxNF| (QREFELT $$ 2) . #1#)
    (LETT |xMaxNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ACPLOT;onVertSeg?| |s| |yMinNF| |yMaxNF| |xMaxNF| $))))) 

(DEFUN |ACPLOT;makeGeneralSketch!1| (|s| $$)
  (PROG (|yMinNF| |yMaxNF| |xMinNF| $)
    (LETT |yMinNF| (QREFELT $$ 3) . #1=(|ACPLOT;makeGeneralSketch|))
    (LETT |yMaxNF| (QREFELT $$ 2) . #1#)
    (LETT |xMinNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ACPLOT;onVertSeg?| |s| |yMinNF| |yMaxNF| |xMinNF| $))))) 

(DEFUN |ACPLOT;makeGeneralSketch!0| (|s| $$)
  (PROG (|xMinNF| |xMaxNF| |yMinNF| |yMaxNF| $)
    (LETT |xMinNF| (QREFELT $$ 4) . #1=(|ACPLOT;makeGeneralSketch|))
    (LETT |xMaxNF| (QREFELT $$ 3) . #1#)
    (LETT |yMinNF| (QREFELT $$ 2) . #1#)
    (LETT |yMaxNF| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|ACPLOT;inRect?| |s| |xMinNF| |xMaxNF| |yMinNF| |yMaxNF| $))))) 

(DEFUN |ACPLOT;refine;$Df$;34| (|plot| |stepFraction| $)
  (PROG (|vtans| |htans| |bran| |bdPts| |crits| |bound| |err| |delta| |dpdySF|
         |dpdxSF| |pSF| |corners| |yMaxSF| |yMinSF| |xMaxSF| |xMinSF| |yMax|
         |yMin| |xMax| |xMin| |dpdy| |dpdx| |y| |x| |p|)
    (RETURN
     (SEQ (LETT |p| (QVELT |plot| 0) . #1=(|ACPLOT;refine;$Df$;34|))
          (LETT |x| (QVELT |plot| 1) . #1#) (LETT |y| (QVELT |plot| 2) . #1#)
          (LETT |dpdx| (SPADCALL |p| |x| (QREFELT $ 97)) . #1#)
          (LETT |dpdy| (SPADCALL |p| |y| (QREFELT $ 97)) . #1#)
          (LETT |pSF| (|ACPLOT;coerceCoefsToSFs| |p| $) . #1#)
          (LETT |dpdxSF| (|ACPLOT;coerceCoefsToSFs| |dpdx| $) . #1#)
          (LETT |dpdySF| (|ACPLOT;coerceCoefsToSFs| |dpdy| $) . #1#)
          (LETT |xMin| (QVELT |plot| 3) . #1#)
          (LETT |xMax| (QVELT |plot| 4) . #1#)
          (LETT |yMin| (QVELT |plot| 5) . #1#)
          (LETT |yMax| (QVELT |plot| 6) . #1#)
          (LETT |xMinSF| (|ACPLOT;RNtoSF| |xMin| $) . #1#)
          (LETT |xMaxSF| (|ACPLOT;RNtoSF| |xMax| $) . #1#)
          (LETT |yMinSF| (|ACPLOT;RNtoSF| |yMin| $) . #1#)
          (LETT |yMaxSF| (|ACPLOT;RNtoSF| |yMax| $) . #1#)
          (LETT |corners|
                (|ACPLOT;makeCorners| |xMinSF| |xMaxSF| |yMinSF| |yMaxSF| $)
                . #1#)
          (LETT |pSF| (|ACPLOT;coerceCoefsToSFs| |p| $) . #1#)
          (LETT |dpdxSF| (|ACPLOT;coerceCoefsToSFs| |dpdx| $) . #1#)
          (LETT |dpdySF| (|ACPLOT;coerceCoefsToSFs| |dpdy| $) . #1#)
          (LETT |delta|
                (|mul_DF| |stepFraction|
                          (|min_DF|
                           (|div_DF_I| (|sub_DF| |xMaxSF| |xMinSF|) 25)
                           (|div_DF_I| (|sub_DF| |yMaxSF| |yMinSF|) 25)))
                . #1#)
          (LETT |err|
                (|min_DF| (|div_DF_I| |delta| 100)
                          (|div_DF_I| (QREFELT $ 15) 100))
                . #1#)
          (LETT |bound| 10 . #1#)
          (LETT |crits| (APPEND (QVELT |plot| 8) (QVELT |plot| 9)) . #1#)
          (LETT |bdPts| (QVELT |plot| 7) . #1#)
          (LETT |bran|
                (|ACPLOT;traceBranches| |pSF| |dpdxSF| |dpdySF| |x| |y|
                 |corners| |delta| |err| |bound| |crits| |bdPts| $)
                . #1#)
          (LETT |htans| (QVELT |plot| 8) . #1#)
          (LETT |vtans| (QVELT |plot| 9) . #1#)
          (EXIT
           (VECTOR |p| |x| |y| |xMin| |xMax| |yMin| |yMax| |bdPts| |htans|
                   |vtans| |bran|)))))) 

(DEFUN |ACPLOT;traceBranches|
       (|pSF| |dpdxSF| |dpdySF| |x| |y| |corners| |delta| |err| |bound| |crits|
        |bdPts| $)
  (PROG (|bran| |segInfo| |pt| |bdry| |p0| |bt| |tp| |rt| |lf|)
    (RETURN
     (SEQ (LETT |lf| (QVELT |bdPts| 0) . #1=(|ACPLOT;traceBranches|))
          (LETT |rt| (QVELT |bdPts| 1) . #1#)
          (LETT |tp| (QVELT |bdPts| 3) . #1#)
          (LETT |bt| (QVELT |bdPts| 2) . #1#)
          (LETT |bdry| (APPEND (APPEND |lf| |rt|) (APPEND |bt| |tp|)) . #1#)
          (LETT |bran| NIL . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |bdry|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |pt| (|SPADfirst| |bdry|) . #1#)
                    (LETT |p0|
                          (|ACPLOT;dummyFirstPt| |pt| |dpdxSF| |dpdySF| |x| |y|
                           |lf| |rt| |bt| |tp| $)
                          . #1#)
                    (LETT |segInfo|
                          (|ACPLOT;listPtsOnSegment| |pSF| |dpdxSF| |dpdySF|
                           |x| |y| |p0| |pt| |corners| |delta| |err| |bound|
                           |crits| |bdry| $)
                          . #1#)
                    (LETT |bran| (CONS (|SPADfirst| |segInfo|) |bran|) . #1#)
                    (LETT |crits| (SPADCALL |segInfo| (QREFELT $ 128)) . #1#)
                    (EXIT
                     (LETT |bdry| (SPADCALL |segInfo| (QREFELT $ 129)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190
               (COND ((NULL (COND ((NULL |crits|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |pt| (|SPADfirst| |crits|) . #1#)
                    (LETT |segInfo|
                          (|ACPLOT;listPtsOnLoop| |pSF| |dpdxSF| |dpdySF| |x|
                           |y| |pt| |corners| |delta| |err| |bound| |crits|
                           |bdry| $)
                          . #1#)
                    (LETT |bran| (CONS (|SPADfirst| |segInfo|) |bran|) . #1#)
                    (EXIT
                     (LETT |crits| (SPADCALL |segInfo| (QREFELT $ 128))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |bran|))))) 

(DEFUN |ACPLOT;dummyFirstPt|
       (|p1| |dpdxSF| |dpdySF| |x| |y| |lf| |rt| |bt| |tp| $)
  (PROG (|py| |px| |one| |zero| |y1| |x1|)
    (RETURN
     (SEQ
      (LETT |x1| (SPADCALL |p1| (QREFELT $ 28)) . #1=(|ACPLOT;dummyFirstPt|))
      (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #1#) (LETT |zero| 0.0 . #1#)
      (LETT |one| 1.0 . #1#)
      (LETT |px|
            (SPADCALL
             (SPADCALL |dpdxSF| (LIST |x| |y|) (LIST |x1| |y1|)
                       (QREFELT $ 130))
             (QREFELT $ 131))
            . #1#)
      (LETT |py|
            (SPADCALL
             (SPADCALL |dpdySF| (LIST |x| |y|) (LIST |x1| |y1|)
                       (QREFELT $ 130))
             (QREFELT $ 131))
            . #1#)
      (EXIT
       (COND
        ((|less_DF| (|mul_DF| |px| |py|) |zero|)
         (COND
          ((OR (SPADCALL |p1| |lf| (QREFELT $ 132))
               (SPADCALL |p1| |bt| (QREFELT $ 132)))
           (|ACPLOT;makePt| (|sub_DF| |x1| |one|) (|sub_DF| |y1| |one|) $))
          (#2='T
           (|ACPLOT;makePt| (|add_DF| |x1| |one|) (|add_DF| |y1| |one|) $))))
        ((OR (SPADCALL |p1| |lf| (QREFELT $ 132))
             (SPADCALL |p1| |tp| (QREFELT $ 132)))
         (|ACPLOT;makePt| (|sub_DF| |x1| |one|) (|add_DF| |y1| |one|) $))
        (#2#
         (|ACPLOT;makePt| (|add_DF| |x1| |one|) (|sub_DF| |y1| |one|) $)))))))) 

(DEFUN |ACPLOT;listPtsOnSegment|
       (|pSF| |dpdxSF| |dpdySF| |x| |y| |p0| |p1| |corners| |delta| |err|
        |bound| |crits| |bdry| $)
  (PROG (|pointList| #1=#:G419 |p2| |ptInfo| |pt1| |pt0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |bdry| (SPADCALL |p1| |bdry| (QREFELT $ 133))
              . #2=(|ACPLOT;listPtsOnSegment|))
        (LETT |pointList| (LIST |p1|) . #2#)
        (LETT |ptInfo|
              (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x| |y| |p0| |p1|
               |corners| |delta| |err| |bound| |crits| |bdry| $)
              . #2#)
        (LETT |p2| (QCAR |ptInfo|) . #2#)
        (EXIT
         (COND
          ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
           (SEQ (LETT |bdry| (SPADCALL |p2| |bdry| (QREFELT $ 133)) . #2#)
                (LETT |pointList| (CONS |p2| |pointList|) . #2#)
                (EXIT (LIST |pointList| |crits| |bdry|))))
          ('T
           (SEQ
            (COND
             ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
              (LETT |crits| (SPADCALL |p2| |crits| (QREFELT $ 133)) . #2#)))
            (LETT |pointList| (CONS |p2| |pointList|) . #2#)
            (SEQ G190 NIL
                 (SEQ (LETT |pt0| (SPADCALL |pointList| (QREFELT $ 134)) . #2#)
                      (LETT |pt1| (|SPADfirst| |pointList|) . #2#)
                      (LETT |ptInfo|
                            (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x|
                             |y| |pt0| |pt1| |corners| |delta| |err| |bound|
                             |crits| |bdry| $)
                            . #2#)
                      (LETT |p2| (QCAR |ptInfo|) . #2#)
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
                         (SEQ
                          (LETT |bdry| (SPADCALL |p2| |bdry| (QREFELT $ 133))
                                . #2#)
                          (LETT |pointList| (CONS |p2| |pointList|) . #2#)
                          (EXIT
                           (PROGN
                            (LETT #1# (LIST |pointList| |crits| |bdry|) . #2#)
                            (GO #1#)))))
                        ('T
                         (SEQ
                          (COND
                           ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
                            (LETT |crits|
                                  (SPADCALL |p2| |crits| (QREFELT $ 133))
                                  . #2#)))
                          (EXIT
                           (LETT |pointList| (CONS |p2| |pointList|)
                                 . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (LIST |pointList| |crits| |bdry|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ACPLOT;listPtsOnLoop|
       (|pSF| |dpdxSF| |dpdySF| |x| |y| |p1| |corners| |delta| |err| |bound|
        |crits| |bdry| $)
  (PROG (|pointList| #1=#:G432 |p2| |ptInfo| |pt1| |pt0| |p0| |py| |px| |y1|
         |x1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x1| (SPADCALL |p1| (QREFELT $ 28))
              . #2=(|ACPLOT;listPtsOnLoop|))
        (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #2#)
        (LETT |px|
              (SPADCALL
               (SPADCALL |dpdxSF| (LIST |x| |y|) (LIST |x1| |y1|)
                         (QREFELT $ 130))
               (QREFELT $ 131))
              . #2#)
        (LETT |py|
              (SPADCALL
               (SPADCALL |dpdySF| (LIST |x| |y|) (LIST |x1| |y1|)
                         (QREFELT $ 130))
               (QREFELT $ 131))
              . #2#)
        (LETT |p0| (|ACPLOT;makePt| (|sub_DF| |x1| 1.0) (|sub_DF| |y1| 1.0) $)
              . #2#)
        (LETT |pointList| (LIST |p1|) . #2#)
        (LETT |ptInfo|
              (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x| |y| |p0| |p1|
               |corners| |delta| |err| |bound| |crits| |bdry| $)
              . #2#)
        (LETT |p2| (QCAR |ptInfo|) . #2#)
        (EXIT
         (COND
          ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
           (|error| "boundary reached while on loop"))
          (#3='T
           (SEQ
            (COND
             ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
              (COND
               ((SPADCALL |p1| |p2| (QREFELT $ 135))
                (|error| "first and second points on loop are identical"))
               (#3#
                (LETT |crits| (SPADCALL |p2| |crits| (QREFELT $ 133))
                      . #2#)))))
            (LETT |pointList| (CONS |p2| |pointList|) . #2#)
            (SEQ G190 NIL
                 (SEQ (LETT |pt0| (SPADCALL |pointList| (QREFELT $ 134)) . #2#)
                      (LETT |pt1| (|SPADfirst| |pointList|) . #2#)
                      (LETT |ptInfo|
                            (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x|
                             |y| |pt0| |pt1| |corners| |delta| |err| |bound|
                             |crits| |bdry| $)
                            . #2#)
                      (LETT |p2| (QCAR |ptInfo|) . #2#)
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |ptInfo|) (QREFELT $ 17))
                         (|error| "boundary reached while on loop"))
                        ('T
                         (SEQ
                          (COND
                           ((EQUAL (QCDR |ptInfo|) (QREFELT $ 18))
                            (SEQ
                             (LETT |crits|
                                   (SPADCALL |p2| |crits| (QREFELT $ 133))
                                   . #2#)
                             (EXIT
                              (COND
                               ((SPADCALL |p1| |p2| (QREFELT $ 135))
                                (SEQ
                                 (LETT |pointList| (CONS |p2| |pointList|)
                                       . #2#)
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (LIST |pointList| |crits| |bdry|)
                                         . #2#)
                                   (GO #1#))))))))))
                          (EXIT
                           (LETT |pointList| (CONS |p2| |pointList|)
                                 . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (LIST |pointList| |crits| |bdry|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ACPLOT;computeNextPt|
       (|pSF| |dpdxSF| |dpdySF| |x| |y| |p0| |p1| |corners| |delta| |err|
        |bound| |crits| |bdry| $)
  (PROG (|critPt| |bdryPt| |pt| |x2| #1=#:G487 |x2New| |f| |y2| |y2New|
         |y2Approx| |x2Approx| |lookingFor| |incVar| #2=#:G459 |critPt2|
         |critPt1| |pt2| |pt1| |x2Temp| |y2Temp| |yHi| |yLo| |yPointList| |xHi|
         |xLo| |xPointList| |yy| |xx| #3=#:G488 |y2Approxx| |x2Approxx|
         |deltaY| |incVar0| |deltaX| |py| |px| |y1| |x1| |y0| |x0| |yMaxSF|
         |yMinSF| |xMaxSF| |xMinSF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xMinSF| (|ACPLOT;getXMin| |corners| $)
              . #4=(|ACPLOT;computeNextPt|))
        (LETT |xMaxSF| (|ACPLOT;getXMax| |corners| $) . #4#)
        (LETT |yMinSF| (|ACPLOT;getYMin| |corners| $) . #4#)
        (LETT |yMaxSF| (|ACPLOT;getYMax| |corners| $) . #4#)
        (LETT |x0| (SPADCALL |p0| (QREFELT $ 28)) . #4#)
        (LETT |y0| (SPADCALL |p0| (QREFELT $ 27)) . #4#)
        (LETT |x1| (SPADCALL |p1| (QREFELT $ 28)) . #4#)
        (LETT |y1| (SPADCALL |p1| (QREFELT $ 27)) . #4#)
        (LETT |px|
              (SPADCALL
               (SPADCALL |dpdxSF| (LIST |x| |y|) (LIST |x1| |y1|)
                         (QREFELT $ 130))
               (QREFELT $ 131))
              . #4#)
        (LETT |py|
              (SPADCALL
               (SPADCALL |dpdySF| (LIST |x| |y|) (LIST |x1| |y1|)
                         (QREFELT $ 130))
               (QREFELT $ 131))
              . #4#)
        (COND
         ((SPADCALL (FLOAT-SIGN 1.0 |py|) (FLOAT-SIGN 1.0 |px|)
                    (QREFELT $ 112))
          (SEQ (LETT |incVar0| (LETT |incVar| |x| . #4#) . #4#)
               (LETT |deltaX|
                     (COND ((SPADCALL |x1| |x0| (QREFELT $ 112)) |delta|)
                           (#5='T (|minus_DF| |delta|)))
                     . #4#)
               (LETT |x2Approx| (|add_DF| |x1| |deltaX|) . #4#)
               (EXIT
                (LETT |y2Approx|
                      (|add_DF| |y1|
                                (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                          |deltaX|))
                      . #4#))))
         (#5#
          (SEQ (LETT |incVar0| (LETT |incVar| |y| . #4#) . #4#)
               (LETT |deltaY|
                     (COND ((SPADCALL |y1| |y0| (QREFELT $ 112)) |delta|)
                           (#5# (|minus_DF| |delta|)))
                     . #4#)
               (LETT |x2Approx|
                     (|add_DF| |x1|
                               (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                         |deltaY|))
                     . #4#)
               (EXIT (LETT |y2Approx| (|add_DF| |y1| |deltaY|) . #4#)))))
        (LETT |lookingFor| (QREFELT $ 16) . #4#)
        (COND
         ((SPADCALL |x2Approx| |xMaxSF| (QREFELT $ 93))
          (SEQ (LETT |incVar| |x| . #4#)
               (LETT |lookingFor| (QREFELT $ 17) . #4#)
               (LETT |x2Approx| |xMaxSF| . #4#)
               (EXIT
                (LETT |y2Approx|
                      (|add_DF| |y1|
                                (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                          (|sub_DF| |x2Approx| |x1|)))
                      . #4#))))
         ((SPADCALL |x2Approx| |xMinSF| (QREFELT $ 90))
          (SEQ (LETT |incVar| |x| . #4#)
               (LETT |lookingFor| (QREFELT $ 17) . #4#)
               (LETT |x2Approx| |xMinSF| . #4#)
               (EXIT
                (LETT |y2Approx|
                      (|add_DF| |y1|
                                (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                          (|sub_DF| |x2Approx| |x1|)))
                      . #4#)))))
        (COND
         ((SPADCALL |y2Approx| |yMaxSF| (QREFELT $ 93))
          (SEQ (LETT |incVar| |y| . #4#)
               (LETT |lookingFor| (QREFELT $ 17) . #4#)
               (LETT |y2Approx| |yMaxSF| . #4#)
               (EXIT
                (LETT |x2Approx|
                      (|add_DF| |x1|
                                (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                          (|sub_DF| |y2Approx| |y1|)))
                      . #4#))))
         ((SPADCALL |y2Approx| |yMinSF| (QREFELT $ 90))
          (SEQ (LETT |incVar| |y| . #4#)
               (LETT |lookingFor| (QREFELT $ 17) . #4#)
               (LETT |y2Approx| |yMinSF| . #4#)
               (EXIT
                (LETT |x2Approx|
                      (|add_DF| |x1|
                                (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                          (|sub_DF| |y2Approx| |y1|)))
                      . #4#)))))
        (COND
         ((|less_DF| |x1| |x2Approx|)
          (SEQ (LETT |xLo| |x1| . #4#) (EXIT (LETT |xHi| |x2Approx| . #4#))))
         (#5#
          (SEQ (LETT |xLo| |x2Approx| . #4#) (EXIT (LETT |xHi| |x1| . #4#)))))
        (COND
         ((|less_DF| |y1| |y2Approx|)
          (SEQ (LETT |yLo| |y1| . #4#) (EXIT (LETT |yHi| |y2Approx| . #4#))))
         (#5#
          (SEQ (LETT |yLo| |y2Approx| . #4#) (EXIT (LETT |yHi| |y1| . #4#)))))
        (LETT |x2Approxx| |x2Approx| . #4#) (LETT |y2Approxx| |y2Approx| . #4#)
        (LETT |xPointList| NIL . #4#) (LETT |yPointList| NIL . #4#)
        (SEQ (LETT |pt| NIL . #4#) (LETT #3# |crits| . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |pt| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ (LETT |xx| (SPADCALL |pt| (QREFELT $ 28)) . #4#)
                  (LETT |yy| (SPADCALL |pt| (QREFELT $ 27)) . #4#)
                  (COND
                   ((|eql_DF| |xx| |x2Approx|)
                    (COND
                     ((NULL (|eql_DF| |xx| |x1|))
                      (COND
                       ((|less_DF|
                         (|min_DF| (FLOAT-SIGN 1.0 (|sub_DF| |yy| |yLo|))
                                   (FLOAT-SIGN 1.0 (|sub_DF| |yy| |yHi|)))
                         |delta|)
                        (LETT |xPointList| (CONS |pt| |xPointList|)
                              . #4#)))))))
                  (COND
                   ((|less_DF| |xLo| |xx|)
                    (COND
                     ((|less_DF| |xx| |xHi|)
                      (COND
                       ((|less_DF|
                         (|min_DF| (FLOAT-SIGN 1.0 (|sub_DF| |yy| |yLo|))
                                   (FLOAT-SIGN 1.0 (|sub_DF| |yy| |yHi|)))
                         |delta|)
                        (SEQ (LETT |xPointList| (CONS |pt| NIL) . #4#)
                             (LETT |x2Approx| |xx| . #4#)
                             (EXIT
                              (COND
                               ((|less_DF| |xx| |x1|) (LETT |xLo| |xx| . #4#))
                               ('T (LETT |xHi| |xx| . #4#)))))))))))
                  (COND
                   ((|eql_DF| |yy| |y2Approx|)
                    (COND
                     ((NULL (|eql_DF| |yy| |y1|))
                      (LETT |yPointList| (CONS |pt| |yPointList|) . #4#)))))
                  (EXIT
                   (COND
                    ((|less_DF| |yLo| |yy|)
                     (COND
                      ((|less_DF| |yy| |yHi|)
                       (COND
                        ((|less_DF|
                          (|min_DF| (FLOAT-SIGN 1.0 (|sub_DF| |xx| |xLo|))
                                    (FLOAT-SIGN 1.0 (|sub_DF| |xx| |xHi|)))
                          |delta|)
                         (SEQ (LETT |yPointList| (CONS |pt| NIL) . #4#)
                              (LETT |y2Approx| |yy| . #4#)
                              (EXIT
                               (COND
                                ((|less_DF| |yy| |y1|) (LETT |yLo| |yy| . #4#))
                                ('T (LETT |yHi| |yy| . #4#)))))))))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (COND
         ((NULL (NULL |xPointList|))
          (COND
           ((NULL (NULL |yPointList|))
            (COND
             ((SPADCALL |xPointList| |yPointList| (QREFELT $ 136))
              (SEQ (LETT |incVar| |incVar0| . #4#)
                   (COND
                    ((EQUAL |incVar| |x|)
                     (LETT |y2Approx|
                           (|add_DF| |y1|
                                     (|mul_DF|
                                      (|minus_DF| (|div_DF| |px| |py|))
                                      (|sub_DF| |x2Approx| |x1|)))
                           . #4#))
                    (#5#
                     (LETT |x2Approx|
                           (|add_DF| |x1|
                                     (|mul_DF|
                                      (|minus_DF| (|div_DF| |py| |px|))
                                      (|sub_DF| |y2Approx| |y1|)))
                           . #4#)))
                   (EXIT (LETT |lookingFor| (QREFELT $ 18) . #4#))))
             ((EQUAL |incVar0| |x|)
              (SEQ
               (LETT |x2Temp|
                     (|add_DF| |x1|
                               (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                         (|sub_DF| |y2Approx| |y1|)))
                     . #4#)
               (LETT |f|
                     (|ACPLOT;SFPolyToUPoly|
                      (SPADCALL |pSF| |y| |y2Approx| (QREFELT $ 137)) $)
                     . #4#)
               (LETT |x2New|
                     (|ACPLOT;newtonApprox| |f| |x2Temp| |err| |bound| $)
                     . #4#)
               (EXIT
                (COND
                 ((QEQCAR |x2New| 1)
                  (SEQ
                   (LETT |y2Approx|
                         (|add_DF| |y1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                             (|sub_DF| |x2Approx| |x1|)))
                         . #4#)
                   (LETT |incVar| |x| . #4#)
                   (EXIT (LETT |lookingFor| (QREFELT $ 18) . #4#))))
                 (#5#
                  (SEQ
                   (LETT |y2Temp|
                         (|add_DF| |y1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                             (|sub_DF| |x2Approx| |x1|)))
                         . #4#)
                   (LETT |f|
                         (|ACPLOT;SFPolyToUPoly|
                          (SPADCALL |pSF| |x| |x2Approx| (QREFELT $ 137)) $)
                         . #4#)
                   (LETT |y2New|
                         (|ACPLOT;newtonApprox| |f| |y2Temp| |err| |bound| $)
                         . #4#)
                   (EXIT
                    (COND
                     ((QEQCAR |y2New| 1)
                      (PROGN
                       (LETT #1#
                             (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF|
                              |x| |y| |p0| |p1| |corners|
                              (FLOAT-SIGN 1.0
                                          (|div_DF_I|
                                           (|sub_DF| |x2Approx| |x1|) 2))
                              |err| |bound| |crits| |bdry| $)
                             . #4#)
                       (GO #1#)))
                     (#5#
                      (SEQ
                       (LETT |pt1|
                             (|ACPLOT;makePt| |x2Approx| (QCDR |y2New|) $)
                             . #4#)
                       (LETT |pt2|
                             (|ACPLOT;makePt| (QCDR |x2New|) |y2Approx| $)
                             . #4#)
                       (LETT |critPt1| (|ACPLOT;findPtOnList| |pt1| |crits| $)
                             . #4#)
                       (LETT |critPt2| (|ACPLOT;findPtOnList| |pt2| |crits| $)
                             . #4#)
                       (COND
                        ((QEQCAR |critPt1| 1)
                         (COND
                          ((QEQCAR |critPt2| 1)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (FLOAT-SIGN 1.0 (|sub_DF| |x2Approx| |x1|))
                               (FLOAT-SIGN 1.0 (|sub_DF| |x2Temp| |x1|))
                               (QREFELT $ 112))
                              (PROGN
                               (LETT #1# (CONS |pt1| (QREFELT $ 16)) . #4#)
                               (GO #1#)))
                             (#5#
                              (PROGN
                               (LETT #1# (CONS |pt2| (QREFELT $ 16)) . #4#)
                               (GO #1#)))))))))
                       (EXIT
                        (COND
                         ((QEQCAR |critPt1| 1)
                          (PROGN
                           (LETT #1#
                                 (CONS
                                  (PROG2 (LETT #2# |critPt2| . #4#)
                                      (QCDR #2#)
                                    (|check_union| (QEQCAR #2# 0)
                                                   (|Point| (|DoubleFloat|))
                                                   #2#))
                                  (QREFELT $ 18))
                                 . #4#)
                           (GO #1#)))
                         ((QEQCAR |critPt2| 1)
                          (PROGN
                           (LETT #1# (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                 . #4#)
                           (GO #1#)))
                         (#5#
                          (COND
                           ((SPADCALL
                             (FLOAT-SIGN 1.0 (|sub_DF| |x2Approx| |x1|))
                             (FLOAT-SIGN 1.0 (|sub_DF| |x2Temp| |x1|))
                             (QREFELT $ 112))
                            (PROGN
                             (LETT #1# (CONS (QCDR |critPt2|) (QREFELT $ 18))
                                   . #4#)
                             (GO #1#)))
                           (#5#
                            (PROGN
                             (LETT #1# (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                   . #4#)
                             (GO #1#)))))))))))))))))
             (#5#
              (SEQ
               (LETT |y2Temp|
                     (|add_DF| |y1|
                               (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                         (|sub_DF| |x2Approx| |x1|)))
                     . #4#)
               (LETT |f|
                     (|ACPLOT;SFPolyToUPoly|
                      (SPADCALL |pSF| |x| |x2Approx| (QREFELT $ 137)) $)
                     . #4#)
               (LETT |y2New|
                     (|ACPLOT;newtonApprox| |f| |y2Temp| |err| |bound| $)
                     . #4#)
               (EXIT
                (COND
                 ((QEQCAR |y2New| 1)
                  (SEQ
                   (LETT |x2Approx|
                         (|add_DF| |x1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                             (|sub_DF| |y2Approx| |y1|)))
                         . #4#)
                   (LETT |incVar| |y| . #4#)
                   (EXIT (LETT |lookingFor| (QREFELT $ 18) . #4#))))
                 (#5#
                  (SEQ
                   (LETT |x2Temp|
                         (|add_DF| |x1|
                                   (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                             (|sub_DF| |y2Approx| |y1|)))
                         . #4#)
                   (LETT |f|
                         (|ACPLOT;SFPolyToUPoly|
                          (SPADCALL |pSF| |y| |y2Approx| (QREFELT $ 137)) $)
                         . #4#)
                   (LETT |x2New|
                         (|ACPLOT;newtonApprox| |f| |x2Temp| |err| |bound| $)
                         . #4#)
                   (EXIT
                    (COND
                     ((QEQCAR |x2New| 1)
                      (PROGN
                       (LETT #1#
                             (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF|
                              |x| |y| |p0| |p1| |corners|
                              (FLOAT-SIGN 1.0
                                          (|div_DF_I|
                                           (|sub_DF| |y2Approx| |y1|) 2))
                              |err| |bound| |crits| |bdry| $)
                             . #4#)
                       (GO #1#)))
                     (#5#
                      (SEQ
                       (LETT |pt1|
                             (|ACPLOT;makePt| |x2Approx| (QCDR |y2New|) $)
                             . #4#)
                       (LETT |pt2|
                             (|ACPLOT;makePt| (QCDR |x2New|) |y2Approx| $)
                             . #4#)
                       (LETT |critPt1| (|ACPLOT;findPtOnList| |pt1| |crits| $)
                             . #4#)
                       (LETT |critPt2| (|ACPLOT;findPtOnList| |pt2| |crits| $)
                             . #4#)
                       (COND
                        ((QEQCAR |critPt1| 1)
                         (COND
                          ((QEQCAR |critPt2| 1)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (FLOAT-SIGN 1.0 (|sub_DF| |y2Approx| |y1|))
                               (FLOAT-SIGN 1.0 (|sub_DF| |y2Temp| |y1|))
                               (QREFELT $ 112))
                              (PROGN
                               (LETT #1# (CONS |pt2| (QREFELT $ 16)) . #4#)
                               (GO #1#)))
                             (#5#
                              (PROGN
                               (LETT #1# (CONS |pt1| (QREFELT $ 16)) . #4#)
                               (GO #1#)))))))))
                       (EXIT
                        (COND
                         ((QEQCAR |critPt1| 1)
                          (PROGN
                           (LETT #1#
                                 (CONS
                                  (PROG2 (LETT #2# |critPt2| . #4#)
                                      (QCDR #2#)
                                    (|check_union| (QEQCAR #2# 0)
                                                   (|Point| (|DoubleFloat|))
                                                   #2#))
                                  (QREFELT $ 18))
                                 . #4#)
                           (GO #1#)))
                         ((QEQCAR |critPt2| 1)
                          (PROGN
                           (LETT #1# (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                 . #4#)
                           (GO #1#)))
                         (#5#
                          (COND
                           ((SPADCALL
                             (FLOAT-SIGN 1.0 (|sub_DF| |y2Approx| |y1|))
                             (FLOAT-SIGN 1.0 (|sub_DF| |y2Temp| |y1|))
                             (QREFELT $ 112))
                            (PROGN
                             (LETT #1# (CONS (QCDR |critPt1|) (QREFELT $ 18))
                                   . #4#)
                             (GO #1#)))
                           (#5#
                            (PROGN
                             (LETT #1# (CONS (QCDR |critPt2|) (QREFELT $ 18))
                                   . #4#)
                             (GO #1#))))))))))))))))))))))
        (COND
         ((NULL (NULL |xPointList|))
          (COND
           ((NULL |yPointList|)
            (SEQ
             (LETT |y2Approx|
                   (|add_DF| |y1|
                             (|mul_DF| (|minus_DF| (|div_DF| |px| |py|))
                                       (|sub_DF| |x2Approx| |x1|)))
                   . #4#)
             (EXIT
              (COND
               ((EQUAL |incVar0| |x|)
                (SEQ (LETT |incVar| |x| . #4#)
                     (EXIT (LETT |lookingFor| (QREFELT $ 18) . #4#))))
               (#5#
                (SEQ
                 (LETT |f|
                       (|ACPLOT;SFPolyToUPoly|
                        (SPADCALL |pSF| |x| |x2Approx| (QREFELT $ 137)) $)
                       . #4#)
                 (LETT |y2New|
                       (|ACPLOT;newtonApprox| |f| |y2Approx| |err| |bound| $)
                       . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |y2New| 1)
                    (SEQ (LETT |x2Approx| |x2Approxx| . #4#)
                         (EXIT (LETT |y2Approx| |y2Approxx| . #4#))))
                   (#5#
                    (SEQ
                     (LETT |pt| (|ACPLOT;makePt| |x2Approx| (QCDR |y2New|) $)
                           . #4#)
                     (LETT |critPt| (|ACPLOT;findPtOnList| |pt| |crits| $)
                           . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |critPt| 1)
                        (PROGN
                         (LETT #1# (CONS |pt| (QREFELT $ 16)) . #4#)
                         (GO #1#)))
                       (#5#
                        (PROGN
                         (LETT #1# (CONS (QCDR |critPt|) (QREFELT $ 18)) . #4#)
                         (GO #1#))))))))))))))))))
        (COND
         ((NULL |xPointList|)
          (COND
           ((NULL (NULL |yPointList|))
            (SEQ
             (LETT |x2Approx|
                   (|add_DF| |x1|
                             (|mul_DF| (|minus_DF| (|div_DF| |py| |px|))
                                       (|sub_DF| |y2Approx| |y1|)))
                   . #4#)
             (EXIT
              (COND
               ((EQUAL |incVar0| |y|)
                (SEQ (LETT |incVar| |y| . #4#)
                     (EXIT (LETT |lookingFor| (QREFELT $ 18) . #4#))))
               (#5#
                (SEQ
                 (LETT |f|
                       (|ACPLOT;SFPolyToUPoly|
                        (SPADCALL |pSF| |y| |y2Approx| (QREFELT $ 137)) $)
                       . #4#)
                 (LETT |x2New|
                       (|ACPLOT;newtonApprox| |f| |x2Approx| |err| |bound| $)
                       . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |x2New| 1)
                    (SEQ (LETT |x2Approx| |x2Approxx| . #4#)
                         (EXIT (LETT |y2Approx| |y2Approxx| . #4#))))
                   (#5#
                    (SEQ
                     (LETT |pt| (|ACPLOT;makePt| (QCDR |x2New|) |y2Approx| $)
                           . #4#)
                     (LETT |critPt| (|ACPLOT;findPtOnList| |pt| |crits| $)
                           . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |critPt| 1)
                        (PROGN
                         (LETT #1# (CONS |pt| (QREFELT $ 16)) . #4#)
                         (GO #1#)))
                       (#5#
                        (PROGN
                         (LETT #1# (CONS (QCDR |critPt|) (QREFELT $ 18)) . #4#)
                         (GO #1#))))))))))))))))))
        (COND
         ((EQUAL |incVar| |x|)
          (SEQ (LETT |x2| |x2Approx| . #4#)
               (LETT |f|
                     (|ACPLOT;SFPolyToUPoly|
                      (SPADCALL |pSF| |x| |x2| (QREFELT $ 137)) $)
                     . #4#)
               (LETT |y2New|
                     (|ACPLOT;newtonApprox| |f| |y2Approx| |err| |bound| $)
                     . #4#)
               (EXIT
                (COND
                 ((QEQCAR |y2New| 1)
                  (PROGN
                   (LETT #1#
                         (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x|
                          |y| |p0| |p1| |corners|
                          (FLOAT-SIGN 1.0 (|div_DF_I| (|sub_DF| |x2| |x1|) 2))
                          |err| |bound| |crits| |bdry| $)
                         . #4#)
                   (GO #1#)))
                 (#5# (LETT |y2| (QCDR |y2New|) . #4#))))))
         (#5#
          (SEQ (LETT |y2| |y2Approx| . #4#)
               (LETT |f|
                     (|ACPLOT;SFPolyToUPoly|
                      (SPADCALL |pSF| |y| |y2| (QREFELT $ 137)) $)
                     . #4#)
               (LETT |x2New|
                     (|ACPLOT;newtonApprox| |f| |x2Approx| |err| |bound| $)
                     . #4#)
               (EXIT
                (COND
                 ((QEQCAR |x2New| 1)
                  (PROGN
                   (LETT #1#
                         (|ACPLOT;computeNextPt| |pSF| |dpdxSF| |dpdySF| |x|
                          |y| |p0| |p1| |corners|
                          (FLOAT-SIGN 1.0 (|div_DF_I| (|sub_DF| |y2| |y1|) 2))
                          |err| |bound| |crits| |bdry| $)
                         . #4#)
                   (GO #1#)))
                 (#5# (LETT |x2| (QCDR |x2New|) . #4#)))))))
        (LETT |pt| (|ACPLOT;makePt| |x2| |y2| $) . #4#)
        (EXIT
         (COND ((EQUAL |lookingFor| (QREFELT $ 16)) (CONS |pt| |lookingFor|))
               ((EQUAL |lookingFor| (QREFELT $ 17))
                (SEQ
                 (LETT |bdryPt| (|ACPLOT;findPtOnList| |pt| |bdry| $) . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |bdryPt| 1)
                    (|error| "couldn't find boundary point"))
                   (#5# (CONS (QCDR |bdryPt|) (QREFELT $ 17)))))))
               (#5#
                (SEQ
                 (LETT |critPt| (|ACPLOT;findPtOnList| |pt| |crits| $) . #4#)
                 (EXIT
                  (COND ((QEQCAR |critPt| 1) (CONS |pt| (QREFELT $ 16)))
                        (#5# (CONS (QCDR |critPt|) (QREFELT $ 18)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ACPLOT;newtonApprox| (|f| |a0| |err| |bound| $)
  (PROG (|i| |newApprox| |oldApprox| #1=#:G495 |Df|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |Df| (SPADCALL |f| (QREFELT $ 138)) . #2=(|ACPLOT;newtonApprox|))
        (LETT |oldApprox| |a0| . #2#)
        (LETT |newApprox|
              (|sub_DF| |a0|
                        (|div_DF| (SPADCALL |f| |a0| (QREFELT $ 99))
                                  (SPADCALL |Df| |a0| (QREFELT $ 99))))
              . #2#)
        (LETT |i| 1 . #2#)
        (SEQ G190
             (COND
              ((NULL
                (SPADCALL (FLOAT-SIGN 1.0 (|sub_DF| |newApprox| |oldApprox|))
                          |err| (QREFELT $ 112)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((EQL |i| |bound|)
                 (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                ('T
                 (SEQ (LETT |oldApprox| |newApprox| . #2#)
                      (LETT |newApprox|
                            (|sub_DF| |oldApprox|
                                      (|div_DF|
                                       (SPADCALL |f| |oldApprox|
                                                 (QREFELT $ 99))
                                       (SPADCALL |Df| |oldApprox|
                                                 (QREFELT $ 99))))
                            . #2#)
                      (EXIT (LETT |i| (+ |i| 1) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |newApprox|))))
      #1# (EXIT #1#))))) 

(PUT '|ACPLOT;listBranches;$L;41| '|SPADreplace|
     '(XLAM (|acplot|) (QVELT |acplot| 10))) 

(DEFUN |ACPLOT;listBranches;$L;41| (|acplot| $) (QVELT |acplot| 10)) 

(DEFUN |ACPLOT;coerce;$Of;42| (|acplot| $)
  (PROG (|ff| |f| |ll| #1=#:G504 |p| #2=#:G503 #3=#:G502 |branch| |l| |les|
         |com| |zip| |yHi| |yLo| |xHi| |xLo| |yy| |xx| |pp|)
    (RETURN
     (SEQ
      (LETT |pp| (SPADCALL (QVELT |acplot| 0) (QREFELT $ 141))
            . #4=(|ACPLOT;coerce;$Of;42|))
      (LETT |xx| (SPADCALL (QVELT |acplot| 1) (QREFELT $ 142)) . #4#)
      (LETT |yy| (SPADCALL (QVELT |acplot| 2) (QREFELT $ 142)) . #4#)
      (LETT |xLo| (SPADCALL (QVELT |acplot| 3) (QREFELT $ 143)) . #4#)
      (LETT |xHi| (SPADCALL (QVELT |acplot| 4) (QREFELT $ 143)) . #4#)
      (LETT |yLo| (SPADCALL (QVELT |acplot| 5) (QREFELT $ 143)) . #4#)
      (LETT |yHi| (SPADCALL (QVELT |acplot| 6) (QREFELT $ 143)) . #4#)
      (LETT |zip| (SPADCALL " = 0" (QREFELT $ 145)) . #4#)
      (LETT |com| (SPADCALL ",   " (QREFELT $ 145)) . #4#)
      (LETT |les| (SPADCALL " <= " (QREFELT $ 145)) . #4#)
      (LETT |l|
            (LIST |pp| |zip| |com| |xLo| |les| |xx| |les| |xHi| |com| |yLo|
                  |les| |yy| |les| |yHi|)
            . #4#)
      (LETT |f| NIL . #4#)
      (SEQ (LETT |branch| NIL . #4#) (LETT #3# (QVELT |acplot| 10) . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |branch| (CAR #3#) . #4#) NIL))
             (GO G191)))
           (SEQ
            (LETT |ll|
                  (PROGN
                   (LETT #2# NIL . #4#)
                   (SEQ (LETT |p| NIL . #4#) (LETT #1# |branch| . #4#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |p| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 146)) #2#)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #4#)
            (EXIT (LETT |f| (CONS (SPADCALL |ll| (QREFELT $ 148)) |f|) . #4#)))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |ff|
            (SPADCALL (SPADCALL |l| (QREFELT $ 149))
                      (SPADCALL |f| (QREFELT $ 148)) (QREFELT $ 150))
            . #4#)
      (EXIT
       (SPADCALL (SPADCALL "ACPLOT" (QREFELT $ 145)) |ff| (QREFELT $ 150))))))) 

(DEFUN |PlaneAlgebraicCurvePlot| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G506)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|PlaneAlgebraicCurvePlot|)
                . #2=(|PlaneAlgebraicCurvePlot|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|PlaneAlgebraicCurvePlot|
                         (LIST
                          (CONS NIL (CONS 1 (|PlaneAlgebraicCurvePlot;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|PlaneAlgebraicCurvePlot|))))))))))) 

(DEFUN |PlaneAlgebraicCurvePlot;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|PlaneAlgebraicCurvePlot|)
            . #1=(|PlaneAlgebraicCurvePlot|))
      (LETT $ (GETREFV 152) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PlaneAlgebraicCurvePlot| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |poly| (|Polynomial| (|Integer|)))
                          (|:| |xVar| (|Symbol|)) (|:| |yVar| (|Symbol|))
                          (|:| |minXVal| (|Fraction| (|Integer|)))
                          (|:| |maxXVal| (|Fraction| (|Integer|)))
                          (|:| |minYVal| (|Fraction| (|Integer|)))
                          (|:| |maxYVal| (|Fraction| (|Integer|)))
                          (|:| |bdryPts|
                               (|Record|
                                (|:| |left| (|List| (|Point| (|DoubleFloat|))))
                                (|:| |right|
                                     (|List| (|Point| (|DoubleFloat|))))
                                (|:| |bottom|
                                     (|List| (|Point| (|DoubleFloat|))))
                                (|:| |top|
                                     (|List| (|Point| (|DoubleFloat|))))))
                          (|:| |hTanPts| (|List| (|Point| (|DoubleFloat|))))
                          (|:| |vTanPts| (|List| (|Point| (|DoubleFloat|))))
                          (|:| |branches|
                               (|List| (|List| (|Point| (|DoubleFloat|)))))))
      (QSETREFV $ 12 (SPADCALL 1 -6 10 (QREFELT $ 11)))
      (QSETREFV $ 15 (SPADCALL 1 -3 10 (QREFELT $ 14)))
      (QSETREFV $ 16 "nothing in particular")
      (QSETREFV $ 17 "boundary point")
      (QSETREFV $ 18 "critical point")
      (QSETREFV $ 19 "bottom")
      (QSETREFV $ 20 "top")
      $)))) 

(MAKEPROP '|PlaneAlgebraicCurvePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Float|) (0 . |One|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) 'EPSILON (|DoubleFloat|)
              (11 . |float|) 'PLOTERR 'NADA 'BDRY 'CRIT 'BOTTOM 'TOP
              (18 . |Zero|) (22 . |convert|) (|List| 13) (|Point| 13)
              (27 . |point|) (|PointPackage| 13) (32 . |yCoord|)
              (37 . |xCoord|) (|Boolean|) (|Polynomial| 13) (42 . |zero?|)
              (|SparseUnivariatePolynomial| 13) (47 . |Zero|)
              (51 . |leadingCoefficient|) (|NonNegativeInteger|)
              (56 . |totalDegree|) (61 . |monomial|) (67 . |reductum|) (72 . +)
              (|Polynomial| 44) (78 . |zero?|)
              (|SparseUnivariatePolynomial| 44) (83 . |Zero|) (|Fraction| 9)
              (87 . |leadingCoefficient|) (92 . |totalDegree|)
              (97 . |monomial|) (103 . |reductum|) (108 . +) (114 . |coerce|)
              (|Mapping| 13 9) (|Polynomial| 9) (|PolynomialFunctions2| 9 13)
              (119 . |map|) (125 . |coerce|) (|Mapping| 44 9)
              (|PolynomialFunctions2| 9 44) (130 . |map|) (136 . |coerce|)
              (141 . |coerce|) (146 . |convert|) (|Symbol|) (151 . |eval|)
              (|List| 7) (|RealSolvePackage|) (158 . |solve|) (164 . <)
              (170 . <=) (176 . |second|) (181 . =) (187 . +) (193 . |max|)
              (199 . |min|) (205 . /) (211 . +) (|Segment| 44) (217 . |lo|)
              (222 . |hi|) (227 . <=) (|List| 62) (233 . |variables|) (238 . >)
              (244 . |member?|) (250 . |totalDegree|) (255 . |degree|)
              |ACPLOT;makeSketch;P2S2S$;27| (261 . |solve|)
              (267 . |coefficient|) (274 . |ground|) (279 . <=) (|Segment| 13)
              (285 . |segment|) (291 . >=) (|Factored| 52) (297 . |coerce|)
              (302 . |numberOfFactors|) (307 . |differentiate|) (313 . -)
              (318 . |elt|) (324 . /) (|List| 64) (|List| 52)
              (330 . |realSolve|) (337 . <) (|Mapping| 29 13 13) (343 . |sort|)
              (349 . |elt|) (355 . |Zero|) (359 . =) (365 . |last|)
              (370 . |remove|) (376 . >) (|Mapping| 13 13) (|Plot|)
              (382 . |plot|) (|List| 119) (388 . |listBranches|)
              (|Mapping| 24 24) (|List| 24) (393 . |map|) (399 . |nthFactor|)
              (405 . /) (411 . -) (417 . *) (423 . -) (428 . |min|)
              |ACPLOT;refine;$Df$;34| (432 . |second|) (437 . |third|)
              (442 . |eval|) (449 . |ground|) (454 . |member?|)
              (460 . |remove|) (466 . |second|) (471 . =) (477 . =)
              (483 . |eval|) (490 . |differentiate|)
              |ACPLOT;listBranches;$L;41| (|OutputForm|) (495 . |coerce|)
              (500 . |coerce|) (505 . |coerce|) (|String|) (510 . |message|)
              (515 . |coerce|) (|List| $) (520 . |vconcat|) (525 . |hconcat|)
              (530 . |vconcat|) |ACPLOT;coerce;$Of;42|)
           '#(|yRange| 536 |xRange| 541 |refine| 546 |makeSketch| 552
              |listBranches| 561 |coerce| 566)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS
                        '#((|PlottablePlaneCurveCategory|) (|CoercibleTo| 140))
                        (|makeByteWordVec2| 151
                                            '(0 7 0 8 3 7 0 9 9 10 11 3 13 0 9
                                              9 10 14 0 7 0 21 1 7 13 0 22 1 24
                                              0 23 25 1 26 13 24 27 1 26 13 24
                                              28 1 30 29 0 31 0 32 0 33 1 30 13
                                              0 34 1 30 35 0 36 2 32 0 13 35 37
                                              1 30 0 0 38 2 32 0 0 0 39 1 40 29
                                              0 41 0 42 0 43 1 40 44 0 45 1 40
                                              35 0 46 2 42 0 44 35 47 1 40 0 0
                                              48 2 42 0 0 0 49 1 13 0 9 50 2 53
                                              30 51 52 54 1 44 0 9 55 2 57 40
                                              56 52 58 1 13 0 44 59 1 7 0 44 60
                                              1 7 0 13 61 3 40 0 0 62 44 63 2
                                              65 64 40 7 66 2 7 29 0 0 67 2 7
                                              29 0 0 68 1 64 7 0 69 2 7 29 0 0
                                              70 2 7 0 0 0 71 2 7 0 0 0 72 2 7
                                              0 0 0 73 2 44 0 0 0 74 2 44 0 0 0
                                              75 1 76 44 0 77 1 76 44 0 78 2 44
                                              29 0 0 79 1 52 80 0 81 2 35 29 0
                                              0 82 2 80 29 62 0 83 1 52 35 0 84
                                              2 52 35 0 62 85 2 65 64 52 7 87 3
                                              52 0 0 62 35 88 1 52 9 0 89 2 13
                                              29 0 0 90 2 91 0 13 13 92 2 13 29
                                              0 0 93 1 94 0 52 95 1 94 35 0 96
                                              2 52 0 0 62 97 1 52 0 0 98 2 32
                                              13 0 13 99 2 13 0 0 0 100 3 65
                                              101 102 80 7 103 2 62 29 0 0 104
                                              2 23 0 105 0 106 2 42 44 0 44 107
                                              0 44 0 108 2 44 29 0 0 109 1 23
                                              13 0 110 2 23 0 13 0 111 2 13 29
                                              0 0 112 2 114 0 113 91 115 1 114
                                              116 0 117 2 119 0 118 0 120 2 94
                                              52 0 9 121 2 44 0 9 9 122 2 44 0
                                              0 0 123 2 44 0 0 0 124 1 44 0 0
                                              125 0 7 0 126 1 116 119 0 128 1
                                              116 119 0 129 3 30 0 0 80 23 130
                                              1 30 13 0 131 2 119 29 24 0 132 2
                                              119 0 24 0 133 1 119 24 0 134 2
                                              24 29 0 0 135 2 119 29 0 0 136 3
                                              30 0 0 62 13 137 1 32 0 0 138 1
                                              52 140 0 141 1 62 140 0 142 1 44
                                              140 0 143 1 140 0 144 145 1 24
                                              140 0 146 1 140 0 147 148 1 140 0
                                              147 149 2 140 0 0 0 150 1 0 91 0
                                              1 1 0 91 0 1 2 0 0 0 13 127 5 0 0
                                              52 62 62 76 76 86 1 0 116 0 139 1
                                              0 140 0 151)))))
           '|lookupComplete|)) 

(MAKEPROP '|PlaneAlgebraicCurvePlot| 'NILADIC T) 
