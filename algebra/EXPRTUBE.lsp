
(DEFUN |EXPRTUBE;getVariable| (|x| |y| |z| $)
  (PROG (|t2| |t1| #1=#:G112 |varList3| |varList2| |varList1|)
    (RETURN
     (SEQ
      (LETT |varList1| (SPADCALL |x| (QREFELT $ 8))
            . #2=(|EXPRTUBE;getVariable|))
      (LETT |varList2| (SPADCALL |y| (QREFELT $ 8)) . #2#)
      (LETT |varList3| (SPADCALL |z| (QREFELT $ 8)) . #2#)
      (COND
       ((SPADCALL (LENGTH |varList1|) 1 (QREFELT $ 12))
        (COND
         ((SPADCALL (LENGTH |varList2|) 1 (QREFELT $ 12))
          (COND
           ((NULL (SPADCALL (LENGTH |varList3|) 1 (QREFELT $ 12)))
            (EXIT (|error| #3="tubePlot: only one variable may be used")))))
         (#4='T (EXIT (|error| #3#)))))
       (#4# (EXIT (|error| #3#))))
      (EXIT
       (COND
        ((NULL |varList1|)
         (COND
          ((NULL |varList2|)
           (COND
            ((NULL |varList3|)
             (|error| "tubePlot: a variable must appear in functions"))
            (#4# (|SPADfirst| |varList3|))))
          (#4#
           (SEQ (LETT |t2| (|SPADfirst| |varList2|) . #2#)
                (EXIT
                 (COND ((NULL |varList3|) |t2|)
                       (#4#
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (EQUAL (|SPADfirst| |varList3|) |t2|))
                            (PROGN
                             (LETT #1#
                                   (|error|
                                    "tubePlot: only one variable may be used")
                                   . #2#)
                             (GO #1#)))))
                         #1# (EXIT #1#)))))))))
        (#4#
         (SEQ (LETT |t1| (|SPADfirst| |varList1|) . #2#)
              (EXIT
               (COND
                ((NULL |varList2|)
                 (COND
                  ((OR (NULL |varList3|)
                       (NULL (NULL (EQUAL (|SPADfirst| |varList3|) |t1|))))
                   |t1|)
                  ('T (|error| "tubePlot: only one variable may be used"))))
                (#4#
                 (SEQ (LETT |t2| (|SPADfirst| |varList2|) . #2#)
                      (EXIT
                       (COND
                        ((NULL |varList3|)
                         (COND ((EQUAL |t1| |t2|) |t1|)
                               (#4#
                                (|error|
                                 "tubePlot: only one variable may be used"))))
                        (#4#
                         (SEQ
                          (COND
                           ((EQUAL (|SPADfirst| |varList3|) |t1|)
                            (COND
                             ((NULL (EQUAL |t2| |t1|))
                              (EXIT
                               (|error|
                                #5="tubePlot: only one variable may be used")))))
                           (#4# (EXIT (|error| #5#))))
                          (EXIT |t1|))))))))))))))))) 

(DEFUN |EXPRTUBE;tubePlot;3EMSMISTp;2|
       (|x| |y| |z| |colorFcn| |tRange| |radFcn| |n| |string| $)
  (PROG (|loopList| |lps| |bNorm| |bNormList| |pNorm| |pNormList| |curvePts|
         |ctr| |tvals| |tval| |cosSin| |parPlot| |BzFunc| |ByFunc| |BxFunc|
         |Bz| |By| |Bx| |NzFunc| |NyFunc| |NxFunc| |Nz| |Ny| |Nx| K |Tzp| |Typ|
         |Txp| |Tz| |Ty| |Tx| |sp| |zp| |yp| |xp| |zFunc| |yFunc| |xFunc| |t|
         |flag|)
    (RETURN
     (SEQ
      (COND ((< |n| 3) (|error| "tubePlot: n should be at least 3"))
            (#1='T
             (SEQ
              (LETT |flag|
                    (COND ((EQUAL |string| "closed") 'T)
                          ((EQUAL |string| "open") 'NIL)
                          (#1#
                           (|error|
                            "tubePlot: last argument should be open or closed")))
                    . #2=(|EXPRTUBE;tubePlot;3EMSMISTp;2|))
              (LETT |t| (|EXPRTUBE;getVariable| |x| |y| |z| $) . #2#)
              (LETT |xFunc| (SPADCALL |x| |t| (QREFELT $ 16)) . #2#)
              (LETT |yFunc| (SPADCALL |y| |t| (QREFELT $ 16)) . #2#)
              (LETT |zFunc| (SPADCALL |z| |t| (QREFELT $ 16)) . #2#)
              (LETT |xp| (SPADCALL |x| |t| (QREFELT $ 17)) . #2#)
              (LETT |yp| (SPADCALL |y| |t| (QREFELT $ 17)) . #2#)
              (LETT |zp| (SPADCALL |z| |t| (QREFELT $ 17)) . #2#)
              (LETT |sp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |xp| 2 (QREFELT $ 19))
                                (SPADCALL |yp| 2 (QREFELT $ 19))
                                (QREFELT $ 20))
                      (SPADCALL |zp| 2 (QREFELT $ 19)) (QREFELT $ 20))
                     (QREFELT $ 21))
                    . #2#)
              (LETT |Tx| (SPADCALL |xp| |sp| (QREFELT $ 22)) . #2#)
              (LETT |Ty| (SPADCALL |yp| |sp| (QREFELT $ 22)) . #2#)
              (LETT |Tz| (SPADCALL |zp| |sp| (QREFELT $ 22)) . #2#)
              (LETT |Txp| (SPADCALL |Tx| |t| (QREFELT $ 17)) . #2#)
              (LETT |Typ| (SPADCALL |Ty| |t| (QREFELT $ 17)) . #2#)
              (LETT |Tzp| (SPADCALL |Tz| |t| (QREFELT $ 17)) . #2#)
              (LETT K
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |Txp| 2 (QREFELT $ 19))
                                (SPADCALL |Typ| 2 (QREFELT $ 19))
                                (QREFELT $ 20))
                      (SPADCALL |Tzp| 2 (QREFELT $ 19)) (QREFELT $ 20))
                     (QREFELT $ 21))
                    . #2#)
              (LETT |Nx| (SPADCALL |Txp| K (QREFELT $ 22)) . #2#)
              (LETT |Ny| (SPADCALL |Typ| K (QREFELT $ 22)) . #2#)
              (LETT |Nz| (SPADCALL |Tzp| K (QREFELT $ 22)) . #2#)
              (LETT |NxFunc| (SPADCALL |Nx| |t| (QREFELT $ 16)) . #2#)
              (LETT |NyFunc| (SPADCALL |Ny| |t| (QREFELT $ 16)) . #2#)
              (LETT |NzFunc| (SPADCALL |Nz| |t| (QREFELT $ 16)) . #2#)
              (LETT |Bx|
                    (SPADCALL (SPADCALL |Ty| |Nz| (QREFELT $ 23))
                              (SPADCALL |Tz| |Ny| (QREFELT $ 23))
                              (QREFELT $ 24))
                    . #2#)
              (LETT |By|
                    (SPADCALL (SPADCALL |Tz| |Nx| (QREFELT $ 23))
                              (SPADCALL |Tx| |Nz| (QREFELT $ 23))
                              (QREFELT $ 24))
                    . #2#)
              (LETT |Bz|
                    (SPADCALL (SPADCALL |Tx| |Ny| (QREFELT $ 23))
                              (SPADCALL |Ty| |Nx| (QREFELT $ 23))
                              (QREFELT $ 24))
                    . #2#)
              (LETT |BxFunc| (SPADCALL |Bx| |t| (QREFELT $ 16)) . #2#)
              (LETT |ByFunc| (SPADCALL |By| |t| (QREFELT $ 16)) . #2#)
              (LETT |BzFunc| (SPADCALL |Bz| |t| (QREFELT $ 16)) . #2#)
              (LETT |parPlot|
                    (SPADCALL |xFunc| |yFunc| |zFunc| |colorFcn| |tRange|
                              (QREFELT $ 27))
                    . #2#)
              (LETT |tvals| (|SPADfirst| (SPADCALL |parPlot| (QREFELT $ 29)))
                    . #2#)
              (LETT |curvePts|
                    (|SPADfirst| (SPADCALL |parPlot| (QREFELT $ 31))) . #2#)
              (LETT |cosSin| (SPADCALL |n| (QREFELT $ 34)) . #2#)
              (LETT |loopList| NIL . #2#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |tvals|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ (LETT |tval| (|SPADfirst| |tvals|) . #2#)
                        (LETT |tvals| (CDR |tvals|) . #2#)
                        (LETT |ctr| (|SPADfirst| |curvePts|) . #2#)
                        (LETT |curvePts| (CDR |curvePts|) . #2#)
                        (LETT |pNormList|
                              (LIST (SPADCALL |tval| |NxFunc|)
                                    (SPADCALL |tval| |NyFunc|)
                                    (SPADCALL |tval| |NzFunc|)
                                    (SPADCALL |tval| |colorFcn|))
                              . #2#)
                        (LETT |pNorm| (SPADCALL |pNormList| (QREFELT $ 37))
                              . #2#)
                        (LETT |bNormList|
                              (LIST (SPADCALL |tval| |BxFunc|)
                                    (SPADCALL |tval| |ByFunc|)
                                    (SPADCALL |tval| |BzFunc|)
                                    (SPADCALL |tval| |colorFcn|))
                              . #2#)
                        (LETT |bNorm| (SPADCALL |bNormList| (QREFELT $ 37))
                              . #2#)
                        (LETT |lps|
                              (SPADCALL |ctr| |pNorm| |bNorm|
                                        (SPADCALL |tval| |radFcn|) |cosSin|
                                        (QREFELT $ 40))
                              . #2#)
                        (EXIT (LETT |loopList| (CONS |lps| |loopList|) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |parPlot| (NREVERSE |loopList|) |flag|
                         (QREFELT $ 42)))))))))) 

(DEFUN |EXPRTUBE;tubePlot;3EMSMITp;3|
       (|x| |y| |z| |colorFcn| |tRange| |radFcn| |n| $)
  (SPADCALL |x| |y| |z| |colorFcn| |tRange| |radFcn| |n| "open" (QREFELT $ 44))) 

(PUT '|EXPRTUBE;project| '|SPADreplace| '(XLAM (|x| |y|) |x|)) 

(DEFUN |EXPRTUBE;project| (|x| |y| $) |x|) 

(DEFUN |EXPRTUBE;constantToUnaryFunction;DfM;5| (|x| $)
  (PROG ()
    (RETURN
     (CONS #'|EXPRTUBE;constantToUnaryFunction;DfM;5!0| (VECTOR $ |x|))))) 

(DEFUN |EXPRTUBE;constantToUnaryFunction;DfM;5!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|EXPRTUBE;constantToUnaryFunction;DfM;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|EXPRTUBE;project| |x| |s| $))))) 

(DEFUN |EXPRTUBE;tubePlot;3EMSDfISTp;6|
       (|x| |y| |z| |colorFcn| |tRange| |rad| |n| |s| $)
  (SPADCALL |x| |y| |z| |colorFcn| |tRange| (SPADCALL |rad| (QREFELT $ 46)) |n|
            |s| (QREFELT $ 44))) 

(DEFUN |EXPRTUBE;tubePlot;3EMSDfITp;7|
       (|x| |y| |z| |colorFcn| |tRange| |rad| |n| $)
  (SPADCALL |x| |y| |z| |colorFcn| |tRange| |rad| |n| "open" (QREFELT $ 47))) 

(DECLAIM (NOTINLINE |ExpressionTubePlot;|)) 

(DEFUN |ExpressionTubePlot| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G144)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|ExpressionTubePlot|)
                . #2=(|ExpressionTubePlot|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|ExpressionTubePlot|
                         (LIST (CONS NIL (CONS 1 (|ExpressionTubePlot;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|ExpressionTubePlot|))))))))))) 

(DEFUN |ExpressionTubePlot;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ExpressionTubePlot|) . #1=(|ExpressionTubePlot|))
      (LETT $ (GETREFV 49) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ExpressionTubePlot| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ExpressionTubePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 14) (|Expression| 32)
              (0 . |variables|) (5 . |One|) (|Boolean|) (|NonNegativeInteger|)
              (9 . <=) (|Mapping| 39 39) (|Symbol|)
              (|MakeFloatCompiledFunction| 7) (15 . |makeFloatFunction|)
              (21 . |differentiate|) (|PositiveInteger|) (27 . ^) (33 . +)
              (39 . |sqrt|) (44 . /) (50 . *) (56 . -) (|Segment| 39)
              (|Plot3D|) (62 . |plot|) (|List| 35) (71 . |tValues|) (|List| 38)
              (76 . |listBranches|) (|Integer|) (|TubePlotTools|)
              (81 . |cosSinInfo|) (|List| 39) (|Point| 39) (86 . |point|)
              (|List| 36) (|DoubleFloat|) (91 . |loopPoints|) (|TubePlot| 26)
              (100 . |tube|) (|String|) |EXPRTUBE;tubePlot;3EMSMISTp;2|
              |EXPRTUBE;tubePlot;3EMSMITp;3|
              |EXPRTUBE;constantToUnaryFunction;DfM;5|
              |EXPRTUBE;tubePlot;3EMSDfISTp;6| |EXPRTUBE;tubePlot;3EMSDfITp;7|)
           '#(|tubePlot| 107 |constantToUnaryFunction| 153) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 7 6 0 8 0 7 0 9 2 11 10 0
                                                   0 12 2 15 13 7 14 16 2 7 0 0
                                                   14 17 2 7 0 0 18 19 2 7 0 0
                                                   0 20 1 7 0 0 21 2 7 0 0 0 22
                                                   2 7 0 0 0 23 2 7 0 0 0 24 5
                                                   26 0 13 13 13 13 25 27 1 26
                                                   28 0 29 1 26 30 0 31 1 33 28
                                                   32 34 1 36 0 35 37 5 33 38
                                                   36 36 36 39 28 40 3 41 0 26
                                                   30 10 42 7 0 41 7 7 7 13 25
                                                   13 32 45 8 0 41 7 7 7 13 25
                                                   13 32 43 44 8 0 41 7 7 7 13
                                                   25 39 32 43 47 7 0 41 7 7 7
                                                   13 25 39 32 48 1 0 13 39
                                                   46)))))
           '|lookupComplete|)) 

(MAKEPROP '|ExpressionTubePlot| 'NILADIC T) 
