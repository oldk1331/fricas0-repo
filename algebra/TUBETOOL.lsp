
(/VERSIONCHECK 2) 

(DEFUN |TUBETOOL;point;4DfP;1| (|x| |y| |z| |c| $)
  (PROG (|l|)
    (RETURN
     (SPADCALL (LETT |l| (LIST |x| |y| |z| |c|) |TUBETOOL;point;4DfP;1|)
               (QREFELT $ 8))))) 

(DEFUN |TUBETOOL;getColor| (|pt| $)
  (COND
   ((SPADCALL (SPADCALL |pt| (QREFELT $ 12)) 3 (QREFELT $ 14))
    (SPADCALL |pt| (QREFELT $ 16)))
   ('T 0.0))) 

(DEFUN |TUBETOOL;getColor2| (|p0| |p1| $)
  (COND
   ((SPADCALL (SPADCALL |p0| (QREFELT $ 12)) 3 (QREFELT $ 14))
    (SPADCALL |p0| (QREFELT $ 16)))
   ((SPADCALL (SPADCALL |p1| (QREFELT $ 12)) 3 (QREFELT $ 14))
    (SPADCALL |p1| (QREFELT $ 16)))
   ('T 0.0))) 

(DEFUN |TUBETOOL;*;Df2P;4| (|a| |p| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (LETT |l|
            (LIST (|mul_DF| |a| (SPADCALL |p| (QREFELT $ 17)))
                  (|mul_DF| |a| (SPADCALL |p| (QREFELT $ 18)))
                  (|mul_DF| |a| (SPADCALL |p| (QREFELT $ 19)))
                  (|TUBETOOL;getColor| |p| $))
            |TUBETOOL;*;Df2P;4|)
      (EXIT (SPADCALL |l| (QREFELT $ 8))))))) 

(DEFUN |TUBETOOL;+;3P;5| (|p0| |p1| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (LETT |l|
            (LIST
             (|add_DF| (SPADCALL |p0| (QREFELT $ 17))
                       (SPADCALL |p1| (QREFELT $ 17)))
             (|add_DF| (SPADCALL |p0| (QREFELT $ 18))
                       (SPADCALL |p1| (QREFELT $ 18)))
             (|add_DF| (SPADCALL |p0| (QREFELT $ 19))
                       (SPADCALL |p1| (QREFELT $ 19)))
             (|TUBETOOL;getColor2| |p0| |p1| $))
            |TUBETOOL;+;3P;5|)
      (EXIT (SPADCALL |l| (QREFELT $ 8))))))) 

(DEFUN |TUBETOOL;-;3P;6| (|p0| |p1| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (LETT |l|
            (LIST
             (|sub_DF| (SPADCALL |p0| (QREFELT $ 17))
                       (SPADCALL |p1| (QREFELT $ 17)))
             (|sub_DF| (SPADCALL |p0| (QREFELT $ 18))
                       (SPADCALL |p1| (QREFELT $ 18)))
             (|sub_DF| (SPADCALL |p0| (QREFELT $ 19))
                       (SPADCALL |p1| (QREFELT $ 19)))
             (|TUBETOOL;getColor2| |p0| |p1| $))
            |TUBETOOL;-;3P;6|)
      (EXIT (SPADCALL |l| (QREFELT $ 8))))))) 

(DEFUN |TUBETOOL;dot;2PDf;7| (|p0| |p1| $)
  (|add_DF|
   (|add_DF|
    (|mul_DF| (SPADCALL |p0| (QREFELT $ 17)) (SPADCALL |p1| (QREFELT $ 17)))
    (|mul_DF| (SPADCALL |p0| (QREFELT $ 18)) (SPADCALL |p1| (QREFELT $ 18))))
   (|mul_DF| (SPADCALL |p0| (QREFELT $ 19)) (SPADCALL |p1| (QREFELT $ 19))))) 

(DEFUN |TUBETOOL;cross;3P;8| (|p0| |p1| $)
  (PROG (|l| |z1| |y1| |x1| |z0| |y0| |x0|)
    (RETURN
     (SEQ
      (LETT |x0| (SPADCALL |p0| (QREFELT $ 17)) . #1=(|TUBETOOL;cross;3P;8|))
      (LETT |y0| (SPADCALL |p0| (QREFELT $ 18)) . #1#)
      (LETT |z0| (SPADCALL |p0| (QREFELT $ 19)) . #1#)
      (LETT |x1| (SPADCALL |p1| (QREFELT $ 17)) . #1#)
      (LETT |y1| (SPADCALL |p1| (QREFELT $ 18)) . #1#)
      (LETT |z1| (SPADCALL |p1| (QREFELT $ 19)) . #1#)
      (LETT |l|
            (LIST (|sub_DF| (|mul_DF| |y0| |z1|) (|mul_DF| |y1| |z0|))
                  (|sub_DF| (|mul_DF| |z0| |x1|) (|mul_DF| |z1| |x0|))
                  (|sub_DF| (|mul_DF| |x0| |y1|) (|mul_DF| |x1| |y0|))
                  (|TUBETOOL;getColor2| |p0| |p1| $))
            . #1#)
      (EXIT (SPADCALL |l| (QREFELT $ 8))))))) 

(DEFUN |TUBETOOL;unitVector;2P;9| (|p| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |p| |p| (QREFELT $ 23)) (QREFELT $ 25))
             (QREFELT $ 26))
   |p| (QREFELT $ 20))) 

(DEFUN |TUBETOOL;cosSinInfo;IL;10| (|n| $)
  (PROG (|ans| |angle| #1=#:G126 |i| |theta|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|TUBETOOL;cosSinInfo;IL;10|))
          (LETT |theta|
                (|div_DF_I|
                 (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                           (QREFELT $ 29))
                 |n|)
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |angle| (SPADCALL |i| |theta| (QREFELT $ 31)) . #2#)
                    (EXIT
                     (LETT |ans|
                           (CONS (LIST (|cos_DF| |angle|) (|sin_DF| |angle|))
                                 |ans|)
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |TUBETOOL;loopPoints;3PDfLL;11| (|ctr| |pNorm| |bNorm| |rad| |cosSin| $)
  (PROG (|pt| |ans| |sin| |cos| |cossin|)
    (RETURN
     (SEQ (LETT |ans| NIL . #1=(|TUBETOOL;loopPoints;3PDfLL;11|))
          (SEQ G190
               (COND ((NULL (COND ((NULL |cosSin|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |cossin| (|SPADfirst| |cosSin|) . #1#)
                    (LETT |cos| (|SPADfirst| |cossin|) . #1#)
                    (LETT |sin| (SPADCALL |cossin| (QREFELT $ 34)) . #1#)
                    (LETT |ans|
                          (CONS
                           (SPADCALL |ctr|
                                     (SPADCALL |rad|
                                               (SPADCALL
                                                (SPADCALL |cos| |pNorm|
                                                          (QREFELT $ 20))
                                                (SPADCALL |sin| |bNorm|
                                                          (QREFELT $ 20))
                                                (QREFELT $ 21))
                                               (QREFELT $ 20))
                                     (QREFELT $ 21))
                           |ans|)
                          . #1#)
                    (EXIT (LETT |cosSin| (CDR |cosSin|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |pt|
                (SPADCALL |ctr| (SPADCALL |rad| |pNorm| (QREFELT $ 20))
                          (QREFELT $ 21))
                . #1#)
          (EXIT (CONS |pt| (SPADCALL |ans| |pt| (QREFELT $ 36)))))))) 

(DECLAIM (NOTINLINE |TubePlotTools;|)) 

(DEFUN |TubePlotTools| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G132)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|TubePlotTools|)
                . #2=(|TubePlotTools|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|TubePlotTools|
                         (LIST (CONS NIL (CONS 1 (|TubePlotTools;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|TubePlotTools|))))))))))) 

(DEFUN |TubePlotTools;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TubePlotTools|) . #1=(|TubePlotTools|))
      (LETT $ (GETREFV 38) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TubePlotTools| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TubePlotTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 9) (|Point| 9) (0 . |point|)
              (|DoubleFloat|) |TUBETOOL;point;4DfP;1| (|Integer|)
              (5 . |maxIndex|) (|Boolean|) (10 . >) (|PointPackage| 9)
              (16 . |color|) (21 . |xCoord|) (26 . |yCoord|) (31 . |zCoord|)
              |TUBETOOL;*;Df2P;4| |TUBETOOL;+;3P;5| |TUBETOOL;-;3P;6|
              |TUBETOOL;dot;2PDf;7| |TUBETOOL;cross;3P;8| (36 . |sqrt|)
              (41 . |inv|) |TUBETOOL;unitVector;2P;9| (|PositiveInteger|)
              (46 . *) (|NonNegativeInteger|) (52 . *) (|List| 6)
              |TUBETOOL;cosSinInfo;IL;10| (58 . |second|) (|List| 7)
              (63 . |concat|) |TUBETOOL;loopPoints;3PDfLL;11|)
           '#(|unitVector| 69 |point| 74 |loopPoints| 82 |dot| 91 |cross| 97
              |cosSinInfo| 103 - 108 + 114 * 120)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(1 7 0 6 8 1 7 11 0 12 2 11
                                                   13 0 0 14 1 15 9 7 16 1 15 9
                                                   7 17 1 15 9 7 18 1 15 9 7 19
                                                   1 9 0 0 25 1 9 0 0 26 2 9 0
                                                   28 0 29 2 9 0 30 0 31 1 6 9
                                                   0 34 2 35 0 0 7 36 1 0 7 7
                                                   27 4 0 7 9 9 9 9 10 5 0 35 7
                                                   7 7 9 32 37 2 0 9 7 7 23 2 0
                                                   7 7 7 24 1 0 32 11 33 2 0 7
                                                   7 7 22 2 0 7 7 7 21 2 0 7 9
                                                   7 20)))))
           '|lookupComplete|)) 

(MAKEPROP '|TubePlotTools| 'NILADIC T) 
