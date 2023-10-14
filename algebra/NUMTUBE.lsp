
(/VERSIONCHECK 2) 

(DEFUN |NUMTUBE;colinearity| (|x| |y| $)
  (|div_DF| (|expt_DF_I| (SPADCALL |x| |y| (QREFELT $ 23)) 2)
            (|mul_DF| (SPADCALL |x| |x| (QREFELT $ 23))
                      (SPADCALL |y| |y| (QREFELT $ 23))))) 

(DEFUN |NUMTUBE;orthog| (|x| |y| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (|NUMTUBE;colinearity| |x| |y| $) (QREFELT $ 13)
                  (QREFELT $ 25))
        (LETT |y| (QREFELT $ 22) . #1=(|NUMTUBE;orthog|))))
      (COND
       ((SPADCALL (|NUMTUBE;colinearity| |x| |y| $) (QREFELT $ 13)
                  (QREFELT $ 25))
        (LETT |y|
              (COND
               ((|less_DF| (|NUMTUBE;colinearity| |x| (QREFELT $ 18) $)
                           (QREFELT $ 13))
                (QREFELT $ 18))
               ('T (QREFELT $ 20)))
              . #1#)))
      (LETT |a|
            (|minus_DF|
             (|div_DF| (SPADCALL |x| |y| (QREFELT $ 23))
                       (SPADCALL |x| |x| (QREFELT $ 23))))
            . #1#)
      (EXIT
       (SETELT $ 22
               (SPADCALL (SPADCALL |a| |x| (QREFELT $ 26)) |y|
                         (QREFELT $ 27)))))))) 

(DEFUN |NUMTUBE;poTriad| (|pl| |po| |pr| $)
  (PROG (|n| |pol| |t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL (SPADCALL |pr| |pl| (QREFELT $ 28)) (QREFELT $ 29))
            . #1=(|NUMTUBE;poTriad|))
      (LETT |pol| (SPADCALL |pl| |po| (QREFELT $ 28)) . #1#)
      (LETT |n| (SPADCALL (|NUMTUBE;orthog| |t| |pol| $) (QREFELT $ 29)) . #1#)
      (EXIT (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 30)))))))) 

(DEFUN |NUMTUBE;curveTriads| (|l| $)
  (PROG (|endtriad| |n| |t| |x| |begtriad| |midtriads| #1=#:G148 |pl| #2=#:G149
         |po| #3=#:G150 |pr| #4=#:G147 |triad| |b| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|NUMTUBE;curveTriads|))
          (EXIT
           (COND
            ((< |k| 2) (|error| "Need at least 2 points to specify a curve"))
            (#6='T
             (SEQ (SETELT $ 22 (QREFELT $ 21))
                  (EXIT
                   (COND
                    ((EQL |k| 2)
                     (SEQ
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL (SPADCALL |l| (QREFELT $ 32))
                                       (|SPADfirst| |l|) (QREFELT $ 28))
                             (QREFELT $ 29))
                            . #5#)
                      (LETT |n|
                            (SPADCALL
                             (SPADCALL |t| (QREFELT $ 18) (QREFELT $ 28))
                             (QREFELT $ 29))
                            . #5#)
                      (LETT |b| (SPADCALL |t| |n| (QREFELT $ 30)) . #5#)
                      (LETT |triad| (VECTOR |t| |n| |b|) . #5#)
                      (EXIT (LIST |triad| |triad|))))
                    (#6#
                     (SEQ
                      (LETT |midtriads|
                            (PROGN
                             (LETT #4# NIL . #5#)
                             (SEQ (LETT |pr| NIL . #5#)
                                  (LETT #3# (CDR (CDR |l|)) . #5#)
                                  (LETT |po| NIL . #5#)
                                  (LETT #2# (CDR |l|) . #5#)
                                  (LETT |pl| NIL . #5#) (LETT #1# |l| . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |pl| (CAR #1#) . #5#) NIL)
                                        (ATOM #2#)
                                        (PROGN (LETT |po| (CAR #2#) . #5#) NIL)
                                        (ATOM #3#)
                                        (PROGN
                                         (LETT |pr| (CAR #3#) . #5#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (|NUMTUBE;poTriad| |pl| |po| |pr| $)
                                           #4#)
                                          . #5#)))
                                  (LETT #1#
                                        (PROG1 (CDR #1#)
                                          (LETT #2#
                                                (PROG1 (CDR #2#)
                                                  (LETT #3# (CDR #3#) . #5#))
                                                . #5#))
                                        . #5#)
                                  (GO G190) G191 (EXIT (NREVERSE #4#))))
                            . #5#)
                      (LETT |x| (|SPADfirst| |midtriads|) . #5#)
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL (SPADCALL |l| (QREFELT $ 32))
                                       (|SPADfirst| |l|) (QREFELT $ 28))
                             (QREFELT $ 29))
                            . #5#)
                      (LETT |n|
                            (SPADCALL (|NUMTUBE;orthog| |t| (QVELT |x| 1) $)
                                      (QREFELT $ 29))
                            . #5#)
                      (LETT |begtriad|
                            (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 30)))
                            . #5#)
                      (LETT |x| (SPADCALL |midtriads| (QREFELT $ 35)) . #5#)
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL (SPADCALL |l| |k| (QREFELT $ 36))
                                       (SPADCALL |l| (- |k| 1) (QREFELT $ 36))
                                       (QREFELT $ 28))
                             (QREFELT $ 29))
                            . #5#)
                      (LETT |n|
                            (SPADCALL (|NUMTUBE;orthog| |t| (QVELT |x| 1) $)
                                      (QREFELT $ 29))
                            . #5#)
                      (LETT |endtriad|
                            (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 30)))
                            . #5#)
                      (EXIT
                       (CONS |begtriad|
                             (SPADCALL |midtriads| |endtriad|
                                       (QREFELT $ 37)))))))))))))))) 

(DEFUN |NUMTUBE;curveLoops| (|pts| |r| |nn| $)
  (PROG (|loops| |b| |n| #1=#:G156 |pt| #2=#:G157 |triad| |cosSin| |triads|)
    (RETURN
     (SEQ
      (LETT |triads| (|NUMTUBE;curveTriads| |pts| $)
            . #3=(|NUMTUBE;curveLoops|))
      (LETT |cosSin| (SPADCALL |nn| (QREFELT $ 39)) . #3#)
      (LETT |loops| NIL . #3#)
      (SEQ (LETT |triad| NIL . #3#) (LETT #2# |triads| . #3#)
           (LETT |pt| NIL . #3#) (LETT #1# |pts| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |pt| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |triad| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |n| (QVELT |triad| 1) . #3#)
                (LETT |b| (QVELT |triad| 2) . #3#)
                (EXIT
                 (LETT |loops|
                       (CONS
                        (SPADCALL |pt| |n| |b| |r| |cosSin| (QREFELT $ 40))
                        |loops|)
                       . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |loops|)))))) 

(DEFUN |NUMTUBE;tube;CurveDfITp;6| (|curve| |r| |n| $)
  (PROG (|loops| #1=#:G161 |bran| |brans|)
    (RETURN
     (SEQ
      (COND ((< |n| 3) (|error| "tube: n should be at least 3"))
            ('T
             (SEQ
              (LETT |brans| (SPADCALL |curve| (QREFELT $ 42))
                    . #2=(|NUMTUBE;tube;CurveDfITp;6|))
              (LETT |loops| NIL . #2#)
              (SEQ (LETT |bran| NIL . #2#) (LETT #1# |brans| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |bran| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |loops|
                           (SPADCALL |loops|
                                     (|NUMTUBE;curveLoops| |bran| |r| |n| $)
                                     (QREFELT $ 43))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |curve| |loops| 'NIL (QREFELT $ 45)))))))))) 

(DECLAIM (NOTINLINE |NumericTubePlot;|)) 

(DEFUN |NumericTubePlot| (#1=#:G162)
  (PROG ()
    (RETURN
     (PROG (#2=#:G163)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|NumericTubePlot|)
                                           '|domainEqualList|)
                . #3=(|NumericTubePlot|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|NumericTubePlot;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|NumericTubePlot|))))))))))) 

(DEFUN |NumericTubePlot;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NumericTubePlot|))
      (LETT |dv$| (LIST '|NumericTubePlot| DV$1) . #1#)
      (LETT $ (GETREFV 47) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NumericTubePlot| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 13
                (SPADCALL (SPADCALL 995 -3 10 (QREFELT $ 10)) (QREFELT $ 12)))
      (QSETREFV $ 18 (SPADCALL 1.0 0.0 0.0 0.0 (QREFELT $ 17)))
      (QSETREFV $ 20 (SPADCALL 0.0 1.0 0.0 0.0 (QREFELT $ 17)))
      (QSETREFV $ 21 (SPADCALL 1.0 1.0 0.0 0.0 (QREFELT $ 17)))
      (QSETREFV $ 22 (QREFELT $ 21))
      $)))) 

(MAKEPROP '|NumericTubePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              (|PositiveInteger|) (|Float|) (0 . |float|) (|DoubleFloat|)
              (7 . |convert|) 'LINMAX (12 . |One|) (|Point| 11)
              (|TubePlotTools|) (16 . |point|) 'XHAT (24 . |Zero|) 'YHAT 'PREV0
              'PREV (28 . |dot|) (|Boolean|) (34 . >) (40 . *) (46 . +)
              (52 . -) (58 . |unitVector|) (63 . |cross|) (|List| 15)
              (69 . |second|)
              (|Record| (|:| |tang| 15) (|:| |norm| 15) (|:| |bin| 15))
              (|List| 33) (74 . |last|) (79 . |elt|) (85 . |concat|)
              (|List| (|List| 11)) (91 . |cosSinInfo|) (96 . |loopPoints|)
              (|List| 31) (105 . |listBranches|) (110 . |concat|)
              (|TubePlot| 6) (116 . |tube|) |NUMTUBE;tube;CurveDfITp;6|)
           '#(|tube| 123) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 46
                                                 '(3 9 0 7 7 8 10 1 9 11 0 12 0
                                                   9 0 14 4 16 15 11 11 11 11
                                                   17 0 9 0 19 2 16 11 15 15 23
                                                   2 11 24 0 0 25 2 16 15 11 15
                                                   26 2 16 15 15 15 27 2 16 15
                                                   15 15 28 1 16 15 15 29 2 16
                                                   15 15 15 30 1 31 15 0 32 1
                                                   34 33 0 35 2 31 15 0 7 36 2
                                                   34 0 0 33 37 1 16 38 7 39 5
                                                   16 31 15 15 15 11 38 40 1 6
                                                   41 0 42 2 41 0 0 0 43 3 44 0
                                                   6 41 24 45 3 0 44 6 11 7
                                                   46)))))
           '|lookupComplete|)) 
