
(DEFUN |MKFUNC;function;S2S;1| (|s| |name| $)
  (SPADCALL |s| |name| NIL (QREFELT $ 9))) 

(DEFUN |MKFUNC;function;S3S;2| (|s| |name| |x| $)
  (SPADCALL |s| |name| (LIST |x|) (QREFELT $ 9))) 

(DEFUN |MKFUNC;function;S4S;3| (|s| |name| |x| |y| $)
  (SPADCALL |s| |name| (LIST |x| |y|) (QREFELT $ 9))) 

(DEFUN |MKFUNC;function;SSLS;4| (|s| |name| |args| $)
  (SEQ
   (SPADCALL
    (SPADCALL (SPADCALL |s| (QREFELT $ 14)) |args| |name| (QREFELT $ 15))
    (QREFELT $ 17))
   (EXIT |name|))) 

(DECLAIM (NOTINLINE |MakeFunction;|)) 

(DEFUN |MakeFunction| (#1=#:G108)
  (PROG ()
    (RETURN
     (PROG (#2=#:G109)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|MakeFunction|)
                                           '|domainEqualList|)
                . #3=(|MakeFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|MakeFunction;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|MakeFunction|))))))))))) 

(DEFUN |MakeFunction;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MakeFunction|))
      (LETT |dv$| (LIST '|MakeFunction| DV$1) . #1#)
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MakeFunction| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MakeFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (|List| 7)
              |MKFUNC;function;SSLS;4| |MKFUNC;function;S2S;1|
              |MKFUNC;function;S3S;2| |MKFUNC;function;S4S;3| (|InputForm|)
              (0 . |convert|) (5 . |function|) (|Any|) (12 . |interpret|))
           '#(|function| 17) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 6 13 0 14 3 13 0 0 8 7 15
                                                   1 13 16 0 17 3 0 7 6 7 7 11
                                                   2 0 7 6 7 10 3 0 7 6 7 8 9 4
                                                   0 7 6 7 7 7 12)))))
           '|lookupComplete|)) 
