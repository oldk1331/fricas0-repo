
(PUT '|TUBE;getCurve;$Curve;1| '|SPADreplace| '(XLAM (|plot|) (QVELT |plot| 0))) 

(DEFUN |TUBE;getCurve;$Curve;1| (|plot| $) (QVELT |plot| 0)) 

(PUT '|TUBE;listLoops;$L;2| '|SPADreplace| '(XLAM (|plot|) (QVELT |plot| 1))) 

(DEFUN |TUBE;listLoops;$L;2| (|plot| $) (QVELT |plot| 1)) 

(PUT '|TUBE;closed?;$B;3| '|SPADreplace| '(XLAM (|plot|) (QVELT |plot| 2))) 

(DEFUN |TUBE;closed?;$B;3| (|plot| $) (QVELT |plot| 2)) 

(DEFUN |TUBE;open?;$B;4| (|plot| $) (COND ((QVELT |plot| 2) 'NIL) ('T 'T))) 

(PUT '|TUBE;setClosed;$2B;5| '|SPADreplace|
     '(XLAM (|plot| |flag|) (QSETVELT |plot| 2 |flag|))) 

(DEFUN |TUBE;setClosed;$2B;5| (|plot| |flag| $) (QSETVELT |plot| 2 |flag|)) 

(PUT '|TUBE;tube;CurveLB$;6| '|SPADreplace| 'VECTOR) 

(DEFUN |TUBE;tube;CurveLB$;6| (|curve| |ll| |b| $) (VECTOR |curve| |ll| |b|)) 

(DECLAIM (NOTINLINE |TubePlot;|)) 

(DEFUN |TubePlot| (#1=#:G113)
  (PROG ()
    (RETURN
     (PROG (#2=#:G114)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|TubePlot|)
                                           '|domainEqualList|)
                . #3=(|TubePlot|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|TubePlot;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|TubePlot|))))))))))) 

(DEFUN |TubePlot;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TubePlot|))
      (LETT |dv$| (LIST '|TubePlot| DV$1) . #1#)
      (LETT $ (GETREFV 16) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TubePlot| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |parCurve| |#1|)
                          (|:| |loops|
                               (|List| (|List| (|Point| (|DoubleFloat|)))))
                          (|:| |closedTube?| (|Boolean|))))
      $)))) 

(MAKEPROP '|TubePlot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |TUBE;getCurve;$Curve;1|
              (|List| (|List| (|Point| (|DoubleFloat|)))) |TUBE;listLoops;$L;2|
              (|Boolean|) |TUBE;closed?;$B;3| |TUBE;open?;$B;4|
              |TUBE;setClosed;$2B;5| |TUBE;tube;CurveLB$;6|)
           '#(|tube| 0 |setClosed| 7 |open?| 13 |listLoops| 18 |getCurve| 23
              |closed?| 28)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 15
                                                 '(3 0 0 6 9 11 15 2 0 11 0 11
                                                   14 1 0 11 0 13 1 0 9 0 10 1
                                                   0 6 0 8 1 0 11 0 12)))))
           '|lookupComplete|)) 
