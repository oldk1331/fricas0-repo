
(/VERSIONCHECK 2) 

(PUT '|MSYSCMD;systemCommand;SV;1| '|SPADreplace| '|doSystemCommand|) 

(DEFUN |MSYSCMD;systemCommand;SV;1| (|cmd| $) (|doSystemCommand| |cmd|)) 

(DECLAIM (NOTINLINE |MoreSystemCommands;|)) 

(DEFUN |MoreSystemCommands| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G105)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|MoreSystemCommands|)
                . #2=(|MoreSystemCommands|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|MoreSystemCommands|
                         (LIST (CONS NIL (CONS 1 (|MoreSystemCommands;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|MoreSystemCommands|))))))))))) 

(DEFUN |MoreSystemCommands;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|MoreSystemCommands|) . #1=(|MoreSystemCommands|))
      (LETT $ (GETREFV 9) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MoreSystemCommands| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MoreSystemCommands| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|String|)
              |MSYSCMD;systemCommand;SV;1|)
           '#(|systemCommand| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| 8 '(1 0 6 7 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|MoreSystemCommands| 'NILADIC T) 
