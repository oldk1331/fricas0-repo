
(/VERSIONCHECK 2) 

(DEFUN |ITUPLE;generate;MS$;1| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 8))) 

(DEFUN |ITUPLE;filterWhile;M2$;2| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 11))) 

(DEFUN |ITUPLE;filterUntil;M2$;3| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 13))) 

(DEFUN |ITUPLE;select;M2$;4| (|f| |x| $) (SPADCALL |f| |x| (QREFELT $ 15))) 

(PUT '|ITUPLE;construct;$S;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |ITUPLE;construct;$S;5| (|x| $) |x|) 

(DEFUN |InfiniteTuple| (#1=#:G134)
  (PROG ()
    (RETURN
     (PROG (#2=#:G135)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|InfiniteTuple|)
                                           '|domainEqualList|)
                . #3=(|InfiniteTuple|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|InfiniteTuple;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|InfiniteTuple|))))))))))) 

(DEFUN |InfiniteTuple;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InfiniteTuple|))
      (LETT |dv$| (LIST '|InfiniteTuple| DV$1) . #1#)
      (LETT $ (GETREFV 19) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InfiniteTuple| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|InfiniteTuple| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Stream| 6) (|local| |#1|) (|Mapping| 6 6)
              (0 . |generate|) |ITUPLE;generate;MS$;1|
              (|Mapping| (|Boolean|) 6) (6 . |filterWhile|)
              |ITUPLE;filterWhile;M2$;2| (12 . |filterUntil|)
              |ITUPLE;filterUntil;M2$;3| (18 . |select|) |ITUPLE;select;M2$;4|
              |ITUPLE;construct;$S;5| (|OutputForm|))
           '#(|select| 24 |map| 30 |generate| 36 |filterWhile| 42 |filterUntil|
              48 |construct| 54 |coerce| 59)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 18))
                             (|makeByteWordVec2| 18
                                                 '(2 5 0 7 6 8 2 5 0 10 0 11 2
                                                   5 0 10 0 13 2 5 0 10 0 15 2
                                                   0 0 10 0 16 2 0 0 7 0 1 2 0
                                                   0 7 6 9 2 0 0 10 0 12 2 0 0
                                                   10 0 14 1 0 5 0 17 1 0 18 0
                                                   1)))))
           '|lookupComplete|)) 
