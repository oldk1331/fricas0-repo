
(DEFUN |TESTUNIT;interpretFunction1| (|f| |info| |arg| $)
  (PROG (|info_f| |ff| |if1|)
    (RETURN
     (SEQ
      (LETT |if1| (SPADCALL |arg| (QREFELT $ 8))
            . #1=(|TESTUNIT;interpretFunction1|))
      (LETT |ff| (SPADCALL |f| (QREFELT $ 10)) . #1#)
      (LETT |info_f| |info| . #1#)
      (EXIT
       (SPADCALL (SPADCALL (LIST |ff| |info_f| |if1|) (QREFELT $ 12))
                 (QREFELT $ 14))))))) 

(DEFUN |TESTUNIT;interpretFunction2| (|f| |info| |arg1| |arg2| $)
  (PROG (|info_f| |ff| |if2| |if1|)
    (RETURN
     (SEQ
      (LETT |if1| (SPADCALL |arg1| (QREFELT $ 8))
            . #1=(|TESTUNIT;interpretFunction2|))
      (LETT |if2| (SPADCALL |arg2| (QREFELT $ 8)) . #1#)
      (LETT |ff| (SPADCALL |f| (QREFELT $ 10)) . #1#)
      (LETT |info_f| |info| . #1#)
      (EXIT
       (SPADCALL (SPADCALL (LIST |ff| |info_f| |if1| |if2|) (QREFELT $ 12))
                 (QREFELT $ 14))))))) 

(DEFUN |TESTUNIT;testEquals;2SV;3| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "EQUL: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;testEquals;2SV;3|)
      (SPADCALL |inp| (QREFELT $ 18))
      (|TESTUNIT;interpretFunction2| '|testEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 19))))))) 

(DEFUN |TESTUNIT;xftestEquals;2SV;4| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "EQUL: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;xftestEquals;2SV;4|)
      (SPADCALL |inp| (QREFELT $ 21))
      (|TESTUNIT;interpretFunction2| '|xftestEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 22))))))) 

(DEFUN |TESTUNIT;testRealEquals;2SV;5| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "EQLR: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;testRealEquals;2SV;5|)
      (SPADCALL |inp| (QREFELT $ 18))
      (|TESTUNIT;interpretFunction2| '|testRealEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 19))))))) 

(DEFUN |TESTUNIT;xftestRealEquals;2SV;6| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "EQLR: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;xftestRealEquals;2SV;6|)
      (SPADCALL |inp| (QREFELT $ 21))
      (|TESTUNIT;interpretFunction2| '|xftestRealEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 22))))))) 

(DEFUN |TESTUNIT;testComplexEquals;2SV;7| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "EQLC: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;testComplexEquals;2SV;7|)
      (SPADCALL |inp| (QREFELT $ 18))
      (|TESTUNIT;interpretFunction2| '|testComplexEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 19))))))) 

(DEFUN |TESTUNIT;xftestComplexEquals;2SV;8| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "EQLC: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;xftestComplexEquals;2SV;8|)
      (SPADCALL |inp| (QREFELT $ 21))
      (|TESTUNIT;interpretFunction2| '|xftestComplexEqualsAux| |inp| |s1| |s2|
       $)
      (EXIT (SPADCALL (QREFELT $ 22))))))) 

(DEFUN |TESTUNIT;testNotEquals;2SV;9| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "DIFF: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;testNotEquals;2SV;9|)
      (SPADCALL |inp| (QREFELT $ 18))
      (|TESTUNIT;interpretFunction2| '|testNotEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 19))))))) 

(DEFUN |TESTUNIT;xftestNotEquals;2SV;10| (|s1| |s2| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "DIFF: ("
                      (SPADCALL |s1|
                                (SPADCALL ", "
                                          (SPADCALL |s2| ")" (QREFELT $ 15))
                                          (QREFELT $ 15))
                                (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;xftestNotEquals;2SV;10|)
      (SPADCALL |inp| (QREFELT $ 21))
      (|TESTUNIT;interpretFunction2| '|xftestNotEqualsAux| |inp| |s1| |s2| $)
      (EXIT (SPADCALL (QREFELT $ 22))))))) 

(DEFUN |TESTUNIT;testTrue;SV;11| (|s| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "TRUE: (" (SPADCALL |s| ")" (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;testTrue;SV;11|)
      (SPADCALL |inp| (QREFELT $ 18))
      (|TESTUNIT;interpretFunction1| '|testTrueAux| |inp| |s| $)
      (EXIT (SPADCALL (QREFELT $ 19))))))) 

(DEFUN |TESTUNIT;xftestTrue;SV;12| (|s| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "TRUE: (" (SPADCALL |s| ")" (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;xftestTrue;SV;12|)
      (SPADCALL |inp| (QREFELT $ 21))
      (|TESTUNIT;interpretFunction1| '|xftestTrueAux| |inp| |s| $)
      (EXIT (SPADCALL (QREFELT $ 22))))))) 

(DEFUN |TESTUNIT;testLibraryError;SV;13| (|s| $)
  (PROG (|inp|)
    (RETURN
     (SEQ (SPADCALL (QREFELT $ 32))
          (LETT |inp|
                (SPADCALL "ERROR: (" (SPADCALL |s| ")" (QREFELT $ 15))
                          (QREFELT $ 15))
                |TESTUNIT;testLibraryError;SV;13|)
          (EXIT
           (|TESTUNIT;interpretFunction1| '|testLibraryErrorAux| |inp| |s|
            $)))))) 

(DEFUN |TESTUNIT;xftestLibraryError;SV;14| (|s| $)
  (PROG (|inp|)
    (RETURN
     (SEQ
      (LETT |inp|
            (SPADCALL "ERROR: (" (SPADCALL |s| ")" (QREFELT $ 15))
                      (QREFELT $ 15))
            |TESTUNIT;xftestLibraryError;SV;14|)
      (SPADCALL |inp| NIL (QREFELT $ 35))
      (|TESTUNIT;interpretFunction1| '|xftestLibraryErrorAux| |inp| |s| $)
      (SPADCALL (QREFELT $ 36)) (EXIT (SPADCALL (QREFELT $ 32))))))) 

(DECLAIM (NOTINLINE |Unittest;|)) 

(DEFUN |Unittest| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G132)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Unittest|) . #2=(|Unittest|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Unittest|
                         (LIST (CONS NIL (CONS 1 (|Unittest;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Unittest|))))))))))) 

(DEFUN |Unittest;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Unittest|) . #1=(|Unittest|))
      (LETT $ (GETREFV 38) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Unittest| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Unittest| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|InputForm|) (0 . |parse|)
              (|Symbol|) (5 . |convert|) (|List| $) (10 . |convert|) (|Any|)
              (15 . |interpret|) (20 . |elt|) (|Void|) (|UnittestCount|)
              (26 . |incFatal|) (31 . |decFatal|) |TESTUNIT;testEquals;2SV;3|
              (35 . |incXfFatal|) (40 . |decXfFatal|)
              |TESTUNIT;xftestEquals;2SV;4| |TESTUNIT;testRealEquals;2SV;5|
              |TESTUNIT;xftestRealEquals;2SV;6|
              |TESTUNIT;testComplexEquals;2SV;7|
              |TESTUNIT;xftestComplexEquals;2SV;8|
              |TESTUNIT;testNotEquals;2SV;9| |TESTUNIT;xftestNotEquals;2SV;10|
              |TESTUNIT;testTrue;SV;11| |TESTUNIT;xftestTrue;SV;12|
              (44 . |chkLibraryError|) |TESTUNIT;testLibraryError;SV;13|
              (|List| (|OutputForm|)) (48 . |incXfPass|) (54 . |decXfPass|)
              |TESTUNIT;xftestLibraryError;SV;14|)
           '#(|xftestTrue| 58 |xftestRealEquals| 63 |xftestNotEquals| 69
              |xftestLibraryError| 75 |xftestEquals| 80 |xftestComplexEquals|
              86 |testTrue| 92 |testRealEquals| 97 |testNotEquals| 103
              |testLibraryError| 109 |testEquals| 114 |testComplexEquals| 120)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(1 7 0 6 8 1 9 7 0 10 1 7 0
                                                   11 12 1 7 13 0 14 2 6 0 0 0
                                                   15 1 17 16 6 18 0 17 16 19 1
                                                   17 16 6 21 0 17 16 22 0 17
                                                   16 32 2 17 16 6 34 35 0 17
                                                   16 36 1 0 16 6 31 2 0 16 6 6
                                                   25 2 0 16 6 6 29 1 0 16 6 37
                                                   2 0 16 6 6 23 2 0 16 6 6 27
                                                   1 0 16 6 30 2 0 16 6 6 24 2
                                                   0 16 6 6 28 1 0 16 6 33 2 0
                                                   16 6 6 20 2 0 16 6 6 26)))))
           '|lookupComplete|)) 

(MAKEPROP '|Unittest| 'NILADIC T) 
