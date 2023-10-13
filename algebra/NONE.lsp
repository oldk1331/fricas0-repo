
(/VERSIONCHECK 2) 

(PUT '|NONE;coerce;$Of;1| '|SPADreplace| '(XLAM (|none|) "NONE")) 

(DEFUN |NONE;coerce;$Of;1| (|none| $) "NONE") 

(PUT '|NONE;=;2$B;2| '|SPADreplace| 'EQ) 

(DEFUN |NONE;=;2$B;2| (|x| |y| $) (EQ |x| |y|)) 

(DEFUN |None| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G128)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|None|) . #2=(|None|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|None|
                         (LIST (CONS NIL (CONS 1 (|None;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|None|))))))))))) 

(DEFUN |None;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|None|) . #1=(|None|))
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|None| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|None| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |NONE;coerce;$Of;1|
              (|Boolean|) |NONE;=;2$B;2| (|SingleInteger|) (|String|))
           '#(~= 0 |latex| 6 |hash| 11 |coerce| 16 = 21) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 11
                                            '(2 0 8 0 0 1 1 0 11 0 1 1 0 10 0 1
                                              1 0 6 0 7 2 0 8 0 0 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|None| 'NILADIC T) 
