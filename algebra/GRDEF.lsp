
(DEFUN |GRDEF;clipPointsDefault;B;1| ($) (QREFELT $ 6)) 

(DEFUN |GRDEF;drawToScale;B;2| ($) (QREFELT $ 7)) 

(DEFUN |GRDEF;clipPointsDefault;2B;3| (|b| $) (SETELT $ 6 |b|)) 

(DEFUN |GRDEF;drawToScale;2B;4| (|b| $) (SETELT $ 7 |b|)) 

(DEFUN |GRDEF;adaptive;B;5| ($) (SPADCALL (QREFELT $ 14))) 

(DEFUN |GRDEF;minPoints;I;6| ($) (SPADCALL (QREFELT $ 17))) 

(DEFUN |GRDEF;maxPoints;I;7| ($) (SPADCALL (QREFELT $ 19))) 

(DEFUN |GRDEF;screenResolution;I;8| ($) (SPADCALL (QREFELT $ 21))) 

(DEFUN |GRDEF;adaptive;2B;9| (|b| $) (SPADCALL |b| (QREFELT $ 23))) 

(DEFUN |GRDEF;minPoints;2I;10| (|n| $) (SPADCALL |n| (QREFELT $ 25))) 

(DEFUN |GRDEF;maxPoints;2I;11| (|n| $) (SPADCALL |n| (QREFELT $ 27))) 

(DEFUN |GRDEF;screenResolution;2I;12| (|n| $) (SPADCALL |n| (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |GraphicsDefaults;|)) 

(DEFUN |GraphicsDefaults| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G116)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|GraphicsDefaults|)
                . #2=(|GraphicsDefaults|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|GraphicsDefaults|
                         (LIST (CONS NIL (CONS 1 (|GraphicsDefaults;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|GraphicsDefaults|))))))))))) 

(DEFUN |GraphicsDefaults;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|GraphicsDefaults|) . #1=(|GraphicsDefaults|))
      (LETT $ (GETREFV 31) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GraphicsDefaults| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 'T)
      (QSETREFV $ 7 'NIL)
      $)))) 

(MAKEPROP '|GraphicsDefaults| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'CLIPPOINTSDEFAULT 'TOSCALE (|Boolean|)
              |GRDEF;clipPointsDefault;B;1| |GRDEF;drawToScale;B;2|
              |GRDEF;clipPointsDefault;2B;3| |GRDEF;drawToScale;2B;4| (|Plot|)
              (0 . |adaptive?|) |GRDEF;adaptive;B;5| (|Integer|)
              (4 . |minPoints|) |GRDEF;minPoints;I;6| (8 . |maxPoints|)
              |GRDEF;maxPoints;I;7| (12 . |screenResolution|)
              |GRDEF;screenResolution;I;8| (16 . |setAdaptive|)
              |GRDEF;adaptive;2B;9| (21 . |setMinPoints|)
              |GRDEF;minPoints;2I;10| (26 . |setMaxPoints|)
              |GRDEF;maxPoints;2I;11| (31 . |setScreenResolution|)
              |GRDEF;screenResolution;2I;12|)
           '#(|screenResolution| 36 |minPoints| 45 |maxPoints| 54 |drawToScale|
              63 |clipPointsDefault| 72 |adaptive| 81)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(0 13 8 14 0 13 16 17 0 13 16
                                                   19 0 13 16 21 1 13 8 8 23 1
                                                   13 16 16 25 1 13 16 16 27 1
                                                   13 16 16 29 0 0 16 22 1 0 16
                                                   16 30 0 0 16 18 1 0 16 16 26
                                                   0 0 16 20 1 0 16 16 28 0 0 8
                                                   10 1 0 8 8 12 0 0 8 9 1 0 8
                                                   8 11 0 0 8 15 1 0 8 8
                                                   24)))))
           '|lookupComplete|)) 

(MAKEPROP '|GraphicsDefaults| 'NILADIC T) 
