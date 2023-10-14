
(DEFUN |PMASS;constant;SE;1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 10))) 

(DEFUN |PMASS;multiple;SE;2| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 12))) 

(DEFUN |PMASS;optional;SE;3| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 14))) 

(DECLAIM (NOTINLINE |PatternMatchAssertions;|)) 

(DEFUN |PatternMatchAssertions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G107)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|PatternMatchAssertions|)
                . #2=(|PatternMatchAssertions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|PatternMatchAssertions|
                         (LIST
                          (CONS NIL (CONS 1 (|PatternMatchAssertions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|PatternMatchAssertions|))))))))))) 

(DEFUN |PatternMatchAssertions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|PatternMatchAssertions|) . #1=(|PatternMatchAssertions|))
      (LETT $ (GETREFV 16) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchAssertions| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternMatchAssertions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Symbol|) (|Expression| (|Integer|))
              (0 . |coerce|) (|FunctionSpaceAssertions| (|Integer|) 7)
              (5 . |constant|) |PMASS;constant;SE;1| (10 . |multiple|)
              |PMASS;multiple;SE;2| (15 . |optional|) |PMASS;optional;SE;3|)
           '#(|optional| 20 |multiple| 25 |constant| 30) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 15
                                                 '(1 7 0 6 8 1 9 7 7 10 1 9 7 7
                                                   12 1 9 7 7 14 1 0 7 6 15 1 0
                                                   7 6 13 1 0 7 6 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|PatternMatchAssertions| 'NILADIC T) 
