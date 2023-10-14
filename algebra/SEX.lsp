
(/VERSIONCHECK 2) 

(DEFUN |SExpression| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1757)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|SExpression|)
                . #2=(|SExpression|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|SExpression|
                         (LIST (CONS NIL (CONS 1 (|SExpression;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|SExpression|))))))))))) 

(DEFUN |SExpression;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SExpression|) . #1=(|SExpression|))
      (LETT $ (GETREFV 15) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SExpression| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SExpressionOf| 12 10 7 8 9) (|List| 7)
              (|Integer|) (|DoubleFloat|) (|OutputForm|) (|Symbol|) (|List| $)
              (|String|) (|Boolean|) (|SingleInteger|))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SExpressionCategory| 12 10 7 8 9) (|SetCategory|)
                           (|BasicType|) (|CoercibleTo| 9))
                        (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 

(MAKEPROP '|SExpression| 'NILADIC T) 
