
(/VERSIONCHECK 2) 

(PUT '|VOID;void;$;1| '|SPADreplace| '|voidValue|) 

(DEFUN |VOID;void;$;1| ($) (|voidValue|)) 

(DEFUN |VOID;coerce;$Of;2| (|v| $)
  (SPADCALL (SPADCALL (QREFELT $ 7)) (QREFELT $ 9))) 

(DECLAIM (NOTINLINE |Void;|)) 

(DEFUN |Void| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G130)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Void|) . #2=(|Void|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Void|
                         (LIST (CONS NIL (CONS 1 (|Void;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Void|))))))))))) 

(DEFUN |Void;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Void|) . #1=(|Void|))
      (LETT $ (GETREFV 11) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Void| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|String|))
      $)))) 

(MAKEPROP '|Void| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| |VOID;void;$;1| (|OutputForm|)
              (0 . |coerce|) |VOID;coerce;$Of;2|)
           '#(|void| 5 |coerce| 9) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(1 6 8 0 9 0 0 0 7 1 0 8 0
                                                   10)))))
           '|lookupComplete|)) 

(MAKEPROP '|Void| 'NILADIC T) 
