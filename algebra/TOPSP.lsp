
(/VERSIONCHECK 2) 

(DEFUN |TOPSP;createThreeSpace;Ts;1| ($) (SPADCALL (QREFELT $ 7))) 

(DEFUN |TopLevelThreeSpace| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G127)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|TopLevelThreeSpace|)
                . #2=(|TopLevelThreeSpace|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|TopLevelThreeSpace|
                         (LIST (CONS NIL (CONS 1 (|TopLevelThreeSpace;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|TopLevelThreeSpace|))))))))))) 

(DEFUN |TopLevelThreeSpace;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TopLevelThreeSpace|) . #1=(|TopLevelThreeSpace|))
      (LETT $ (GETREFV 9) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TopLevelThreeSpace| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TopLevelThreeSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|ThreeSpace| (|DoubleFloat|))
              (0 . |create3Space|) |TOPSP;createThreeSpace;Ts;1|)
           '#(|createThreeSpace| 4) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#() (|makeByteWordVec2| 8 '(0 6 0 7 0 0 6 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|TopLevelThreeSpace| 'NILADIC T) 
