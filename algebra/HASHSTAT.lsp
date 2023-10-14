
(/VERSIONCHECK 2) 

(PUT '|HASHSTAT;new;$;1| '|SPADreplace| '(XLAM NIL HASHSTATEBASIS)) 

(DEFUN |HASHSTAT;new;$;1| ($) HASHSTATEBASIS) 

(PUT '|HASHSTAT;value;$Si;2| '|SPADreplace| 'HASHSTATEMAKEFIXNUM) 

(DEFUN |HASHSTAT;value;$Si;2| (|hs| $) (HASHSTATEMAKEFIXNUM |hs|)) 

(PUT '|HASHSTAT;update!;$Si$;3| '|SPADreplace| 'HASHSTATEUPDATE) 

(DEFUN |HASHSTAT;update!;$Si$;3| (|hs| |i| $) (HASHSTATEUPDATE |hs| |i|)) 

(PUT '|HASHSTAT;modulo| '|SPADreplace| 'HASHSTATEMOD) 

(DEFUN |HASHSTAT;modulo| (|hs| |i| $) (HASHSTATEMOD |hs| |i|)) 

(DEFUN |HashState| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G986)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|HashState|) . #2=(|HashState|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|HashState|
                         (LIST (CONS NIL (CONS 1 (|HashState;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|HashState|))))))))))) 

(DEFUN |HashState;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|HashState|) . #1=(|HashState|))
      (LETT $ (GETREFV 10) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|HashState| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|HashState| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL |HASHSTAT;new;$;1| (|SingleInteger|)
              |HASHSTAT;value;$Si;2| |HASHSTAT;update!;$Si$;3|)
           '#(|value| 0 |update!| 5 |new| 11) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 9
                                                 '(1 0 7 0 8 2 0 0 0 7 9 0 0 0
                                                   6)))))
           '|lookupComplete|)) 

(MAKEPROP '|HashState| 'NILADIC T) 