
(/VERSIONCHECK 2) 

(DEFUN |UDVO;setVariableOrder;LV;1| (|l| $)
  (SPADCALL (REVERSE |l|) (QREFELT $ 9))) 

(DEFUN |UDVO;setVariableOrder;2LV;2| (|l1| |l2| $)
  (SPADCALL (REVERSE |l2|) (REVERSE |l1|) (QREFELT $ 11))) 

(DEFUN |UDVO;resetVariableOrder;V;3| ($) (SPADCALL NIL NIL (QREFELT $ 12))) 

(DEFUN |UDVO;getVariableOrder;R;4| ($)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL (QREFELT $ 15)) |UDVO;getVariableOrder;R;4|)
          (EXIT (CONS (REVERSE (QCDR |r|)) (REVERSE (QCAR |r|)))))))) 

(DECLAIM (NOTINLINE |UserDefinedVariableOrdering;|)) 

(DEFUN |UserDefinedVariableOrdering| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G112)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|UserDefinedVariableOrdering|)
                . #2=(|UserDefinedVariableOrdering|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|UserDefinedVariableOrdering|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|UserDefinedVariableOrdering;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|UserDefinedVariableOrdering|))))))))))) 

(DEFUN |UserDefinedVariableOrdering;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|UserDefinedVariableOrdering|)
            . #1=(|UserDefinedVariableOrdering|))
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UserDefinedVariableOrdering| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UserDefinedVariableOrdering| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|List| (|Symbol|))
              (|UserDefinedPartialOrdering| (|Symbol|)) (0 . |setOrder|)
              |UDVO;setVariableOrder;LV;1| (5 . |setOrder|)
              |UDVO;setVariableOrder;2LV;2| |UDVO;resetVariableOrder;V;3|
              (|Record| (|:| |low| 7) (|:| |high| 7)) (11 . |getOrder|)
              (|Record| (|:| |high| 7) (|:| |low| 7))
              |UDVO;getVariableOrder;R;4|)
           '#(|setVariableOrder| 15 |resetVariableOrder| 26 |getVariableOrder|
              30)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 8 6 7 9 2 8 6 7 7 11 0 8
                                                   14 15 2 0 6 7 7 12 1 0 6 7
                                                   10 0 0 6 13 0 0 16 17)))))
           '|lookupComplete|)) 

(MAKEPROP '|UserDefinedVariableOrdering| 'NILADIC T) 
