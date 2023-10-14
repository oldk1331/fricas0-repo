
(/VERSIONCHECK 2) 

(DEFUN |PTPACK;xCoord;PR;1| (|p| $) (SPADCALL |p| 1 (QREFELT $ 10))) 

(DEFUN |PTPACK;yCoord;PR;2| (|p| $) (SPADCALL |p| 2 (QREFELT $ 10))) 

(DEFUN |PTPACK;zCoord;PR;3| (|p| $) (SPADCALL |p| 3 (QREFELT $ 10))) 

(DEFUN |PTPACK;rCoord;PR;4| (|p| $) (SPADCALL |p| 1 (QREFELT $ 10))) 

(DEFUN |PTPACK;thetaCoord;PR;5| (|p| $) (SPADCALL |p| 2 (QREFELT $ 10))) 

(DEFUN |PTPACK;phiCoord;PR;6| (|p| $) (SPADCALL |p| 3 (QREFELT $ 10))) 

(DEFUN |PTPACK;color;PR;7| (|p| $)
  (COND
   ((SPADCALL (SPADCALL |p| (QREFELT $ 18)) 3 (QREFELT $ 20))
    (SPADCALL |p| 4 (QREFELT $ 10)))
   ('T (SPADCALL |p| 3 (QREFELT $ 10))))) 

(DEFUN |PTPACK;hue;PR;8| (|p| $) (SPADCALL |p| 3 (QREFELT $ 10))) 

(DEFUN |PTPACK;shade;PR;9| (|p| $) (SPADCALL |p| 4 (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |PointPackage;|)) 

(DEFUN |PointPackage| (#1=#:G114)
  (PROG ()
    (RETURN
     (PROG (#2=#:G115)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PointPackage|)
                                           '|domainEqualList|)
                . #3=(|PointPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|PointPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PointPackage|))))))))))) 

(DEFUN |PointPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PointPackage|))
      (LETT |dv$| (LIST '|PointPackage| DV$1) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PointPackage| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PointPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Integer|)
              (|Point| 6) (4 . |elt|) |PTPACK;xCoord;PR;1| |PTPACK;yCoord;PR;2|
              |PTPACK;zCoord;PR;3| |PTPACK;rCoord;PR;4|
              |PTPACK;thetaCoord;PR;5| |PTPACK;phiCoord;PR;6|
              (|NonNegativeInteger|) (10 . |#|) (|Boolean|) (15 . >)
              |PTPACK;color;PR;7| |PTPACK;hue;PR;8| |PTPACK;shade;PR;9|)
           '#(|zCoord| 21 |yCoord| 26 |xCoord| 31 |thetaCoord| 36 |shade| 41
              |rCoord| 46 |phiCoord| 51 |hue| 56 |color| 61)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(0 6 0 7 2 9 6 0 8 10 1 9 17
                                                   0 18 2 17 19 0 0 20 1 0 6 9
                                                   13 1 0 6 9 12 1 0 6 9 11 1 0
                                                   6 9 15 1 0 6 9 23 1 0 6 9 14
                                                   1 0 6 9 16 1 0 6 9 22 1 0 6
                                                   9 21)))))
           '|lookupComplete|)) 
