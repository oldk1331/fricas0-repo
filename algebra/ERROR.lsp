
(/VERSIONCHECK 2) 

(DEFUN |ERROR;doit| (|s| $) (SEQ (|throwPatternMsg| |s| NIL) (EXIT "exit"))) 

(DEFUN |ERROR;error;SE;2| (|s| $)
  (|ERROR;doit| (SPADCALL (LIST (QREFELT $ 6) |s|) (QREFELT $ 10)) $)) 

(DEFUN |ERROR;error;LE;3| (|l| $)
  (PROG (|s| #1=#:G133 |x|)
    (RETURN
     (SEQ (LETT |s| (QREFELT $ 6) . #2=(|ERROR;error;LE;3|))
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |s| (SPADCALL (LIST |s| " " |x|) (QREFELT $ 10))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (|ERROR;doit| |s| $)))))) 

(DEFUN |ERROR;error;2SE;4| (|fn| |s| $)
  (|ERROR;doit|
   (SPADCALL (LIST (QREFELT $ 7) |fn| ": %d %l " |s|) (QREFELT $ 10)) $)) 

(DEFUN |ERROR;error;SLE;5| (|fn| |l| $)
  (PROG (|s| #1=#:G138 |x|)
    (RETURN
     (SEQ
      (LETT |s| (SPADCALL (LIST (QREFELT $ 7) |fn| ": %d %l") (QREFELT $ 10))
            . #2=(|ERROR;error;SLE;5|))
      (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |s| (SPADCALL (LIST |s| " " |x|) (QREFELT $ 10)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (|ERROR;doit| |s| $)))))) 

(DECLAIM (NOTINLINE |ErrorFunctions;|)) 

(DEFUN |ErrorFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G140)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|ErrorFunctions|)
                . #2=(|ErrorFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|ErrorFunctions|
                         (LIST (CONS NIL (CONS 1 (|ErrorFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|ErrorFunctions|))))))))))) 

(DEFUN |ErrorFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ErrorFunctions|) . #1=(|ErrorFunctions|))
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ErrorFunctions| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 "Error signalled from user code: %l ")
      (QSETREFV $ 7 "Error signalled from user code in function %b ")
      $)))) 

(MAKEPROP '|ErrorFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|prefix1| '|prefix2| (|List| $)
              (|String|) (0 . |concat|) (|Exit|) |ERROR;error;SE;2| (|List| 9)
              |ERROR;error;LE;3| |ERROR;error;2SE;4| |ERROR;error;SLE;5|)
           '#(|error| 5) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 9 0 8 10 1 0 11 13 14 1 0
                                                   11 9 12 2 0 11 9 13 16 2 0
                                                   11 9 9 15)))))
           '|lookupComplete|)) 

(MAKEPROP '|ErrorFunctions| 'NILADIC T) 
