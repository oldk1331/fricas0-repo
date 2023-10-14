
(/VERSIONCHECK 2) 

(DEFUN |PLOTTOOL;drawToScaleRanges| (|xVals| |yVals| $)
  (PROG (|pad| |yDiff| |yLo| |yHi| |xDiff| |xLo| |xHi|)
    (RETURN
     (SEQ
      (LETT |xDiff|
            (|sub_DF|
             (LETT |xHi| (SPADCALL |xVals| (QREFELT $ 8))
                   . #1=(|PLOTTOOL;drawToScaleRanges|))
             (LETT |xLo| (SPADCALL |xVals| (QREFELT $ 9)) . #1#))
            . #1#)
      (LETT |yDiff|
            (|sub_DF| (LETT |yHi| (SPADCALL |yVals| (QREFELT $ 8)) . #1#)
                      (LETT |yLo| (SPADCALL |yVals| (QREFELT $ 9)) . #1#))
            . #1#)
      (LETT |pad| (|div_DF_I| (FLOAT-SIGN 1.0 (|sub_DF| |yDiff| |xDiff|)) 2)
            . #1#)
      (EXIT
       (COND
        ((SPADCALL |yDiff| |xDiff| (QREFELT $ 11))
         (LIST
          (SPADCALL (|sub_DF| |xLo| |pad|) (|add_DF| |xHi| |pad|)
                    (QREFELT $ 12))
          |yVals|))
        ('T
         (LIST |xVals|
               (SPADCALL (|sub_DF| |yLo| |pad|) (|add_DF| |yHi| |pad|)
                         (QREFELT $ 12)))))))))) 

(DEFUN |PLOTTOOL;select| (|l| |f| |g| $)
  (PROG (|m| #1=#:G108 |p|)
    (RETURN
     (SEQ (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|) . #2=(|PLOTTOOL;select|))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (LETT |m| (SPADCALL |m| (SPADCALL |p| |f|) |g|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|))))) 

(DEFUN |PLOTTOOL;xRange0| (|list| $)
  (SPADCALL (|PLOTTOOL;select| |list| (ELT $ 15) (ELT $ 16) $)
            (|PLOTTOOL;select| |list| (ELT $ 15) (ELT $ 17) $) (QREFELT $ 18))) 

(DEFUN |PLOTTOOL;yRange0| (|list| $)
  (SPADCALL (|PLOTTOOL;select| |list| (ELT $ 19) (ELT $ 16) $)
            (|PLOTTOOL;select| |list| (ELT $ 19) (ELT $ 17) $) (QREFELT $ 18))) 

(DEFUN |PLOTTOOL;select2| (|l| |f| |g| $)
  (PROG (|m| #1=#:G126 |p|)
    (RETURN
     (SEQ (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|) . #2=(|PLOTTOOL;select2|))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (LETT |m| (SPADCALL |m| (SPADCALL |p| |f|) |g|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|))))) 

(DEFUN |PLOTTOOL;xRange| (|list| $)
  (SPADCALL
   (|PLOTTOOL;select2| |list| (CONS #'|PLOTTOOL;xRange!0| $) (ELT $ 16) $)
   (|PLOTTOOL;select2| |list| (CONS #'|PLOTTOOL;xRange!1| $) (ELT $ 17) $)
   (QREFELT $ 18))) 

(DEFUN |PLOTTOOL;xRange!1| (|v1| $)
  (SPADCALL (|PLOTTOOL;xRange0| |v1| $) (QREFELT $ 8))) 

(DEFUN |PLOTTOOL;xRange!0| (|u1| $)
  (SPADCALL (|PLOTTOOL;xRange0| |u1| $) (QREFELT $ 9))) 

(DEFUN |PLOTTOOL;yRange| (|list| $)
  (SPADCALL
   (|PLOTTOOL;select2| |list| (CONS #'|PLOTTOOL;yRange!0| $) (ELT $ 16) $)
   (|PLOTTOOL;select2| |list| (CONS #'|PLOTTOOL;yRange!1| $) (ELT $ 17) $)
   (QREFELT $ 18))) 

(DEFUN |PLOTTOOL;yRange!1| (|v1| $)
  (SPADCALL (|PLOTTOOL;yRange0| |v1| $) (QREFELT $ 8))) 

(DEFUN |PLOTTOOL;yRange!0| (|u1| $)
  (SPADCALL (|PLOTTOOL;yRange0| |u1| $) (QREFELT $ 9))) 

(DEFUN |PLOTTOOL;calcRanges;LL;8| (|llp| $)
  (COND
   ((SPADCALL (QREFELT $ 21))
    (|PLOTTOOL;drawToScaleRanges| (|PLOTTOOL;xRange| |llp| $)
     (|PLOTTOOL;yRange| |llp| $) $))
   ('T (LIST (|PLOTTOOL;xRange| |llp| $) (|PLOTTOOL;yRange| |llp| $))))) 

(DECLAIM (NOTINLINE |PlotTools;|)) 

(DEFUN |PlotTools| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G143)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|PlotTools|) . #2=(|PlotTools|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|PlotTools|
                         (LIST (CONS NIL (CONS 1 (|PlotTools;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|PlotTools|))))))))))) 

(DEFUN |PlotTools;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|PlotTools|) . #1=(|PlotTools|))
      (LETT $ (GETREFV 25) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PlotTools| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PlotTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|DoubleFloat|) (|Segment| 6) (0 . |hi|)
              (5 . |lo|) (|Boolean|) (10 . >) (16 . |segment|) (|Point| 6)
              (|PointPackage| 6) (22 . |xCoord|) (27 . |min|) (33 . |max|)
              (39 . SEGMENT) (45 . |yCoord|) (|GraphicsDefaults|)
              (50 . |drawToScale|) (|List| 7) (|List| (|List| 13))
              |PLOTTOOL;calcRanges;LL;8|)
           '#(|calcRanges| 54) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(1 7 6 0 8 1 7 6 0 9 2 6 10 0
                                                   0 11 2 7 0 6 6 12 1 14 6 13
                                                   15 2 6 0 0 0 16 2 6 0 0 0 17
                                                   2 7 0 6 6 18 1 14 6 13 19 0
                                                   20 10 21 1 0 22 23 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|PlotTools| 'NILADIC T) 
