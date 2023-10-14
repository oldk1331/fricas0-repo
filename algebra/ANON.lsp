
(/VERSIONCHECK 2) 

(PUT '|ANON;coerce;$Of;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |ANON;coerce;$Of;1| (|x| $) |x|) 

(DEFUN |AnonymousFunction| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G127)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|AnonymousFunction|)
                . #2=(|AnonymousFunction|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|AnonymousFunction|
                         (LIST (CONS NIL (CONS 1 (|AnonymousFunction;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|AnonymousFunction|))))))))))) 

(DEFUN |AnonymousFunction;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|AnonymousFunction|) . #1=(|AnonymousFunction|))
      (LETT $ (GETREFV 12) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AnonymousFunction| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|AnonymousFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |ANON;coerce;$Of;1|
              (|String|) (|SingleInteger|) (|HashState|) (|Boolean|))
           '#(~= 0 |latex| 6 |hashUpdate!| 11 |hash| 17 |coerce| 22 = 27) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 11
                                            '(2 0 11 0 0 1 1 0 8 0 1 2 0 10 10
                                              0 1 1 0 9 0 1 1 0 6 0 7 2 0 11 0
                                              0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|AnonymousFunction| 'NILADIC T) 
