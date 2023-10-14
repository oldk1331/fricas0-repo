
(SDEFUN |PRINT;print;OfV;1| ((|x| |OutputForm|) ($ |Void|))
        (SPADCALL |x| (QREFELT $ 8))) 

(DECLAIM (NOTINLINE |PrintPackage;|)) 

(DEFUN |PrintPackage| ()
  (SPROG NIL
         (PROG (#1=#:G106)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PrintPackage|)
                    . #2=(|PrintPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PrintPackage|
                             (LIST (CONS NIL (CONS 1 (|PrintPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|PrintPackage|)))))))))) 

(DEFUN |PrintPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PrintPackage|) . #1=(|PrintPackage|))
          (LETT $ (GETREFV 10) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PrintPackage| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PrintPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OutputForm|) (0 . |print|)
              |PRINT;print;OfV;1|)
           '#(|print| 5) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9 '(1 7 6 0 8 1 0 6 7 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|PrintPackage| 'NILADIC T) 
