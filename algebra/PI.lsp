
(/VERSIONCHECK 2) 

(SETQ |$CategoryFrame|
        (|put| #1='|PositiveInteger| '|SuperDomain| #2='(|NonNegativeInteger|)
               (|put| #2# #3='|SubDomain|
                      (CONS '(|PositiveInteger| SPADCALL |#1| 0 (QREFELT $ 7))
                            (DELASC #1# (|get| #2# #3# |$CategoryFrame|)))
                      |$CategoryFrame|))) 

(DEFUN |PositiveInteger| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1722)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|PositiveInteger|)
                . #2=(|PositiveInteger|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|PositiveInteger|
                         (LIST (CONS NIL (CONS 1 (|PositiveInteger;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|PositiveInteger|))))))))))) 

(DEFUN |PositiveInteger;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|PositiveInteger|) . #1=(|PositiveInteger|))
      (LETT $ (GETREFV 13) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PositiveInteger| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PositiveInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Boolean|) (0 . >)
              (|PositiveInteger|) (|Union| $ '"failed") (|SingleInteger|)
              (|String|) (|OutputForm|))
           '#(~= 6 |smaller?| 12 |sample| 18 |recip| 22 |one?| 27 |min| 32
              |max| 38 |latex| 44 |hash| 49 |gcd| 54 |coerce| 60 ^ 65 |One| 77
              >= 81 > 87 = 93 <= 99 < 105 + 111 * 117)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| |Monoid&| NIL |SemiGroup&|
                     |AbelianSemiGroup&| |SetCategory&| NIL |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedAbelianSemiGroup|) (|OrderedSet|) (|Monoid|)
                      (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|CommutativeStar|) (|BasicType|)
                      (|PartialOrder|) (|CoercibleTo| 12))
                   (|makeByteWordVec2| 12
                                       '(2 5 6 0 0 7 2 0 6 0 0 1 2 0 6 0 0 1 0
                                         0 0 1 1 0 9 0 1 1 0 6 0 1 2 0 0 0 0 1
                                         2 0 0 0 0 1 1 0 11 0 1 1 0 10 0 1 2 0
                                         0 0 0 1 1 0 12 0 1 2 0 0 0 8 1 2 0 0 0
                                         5 1 0 0 0 1 2 0 6 0 0 1 2 0 6 0 0 1 2
                                         0 6 0 0 1 2 0 6 0 0 1 2 0 6 0 0 1 2 0
                                         0 0 0 1 2 0 0 0 0 1 2 0 0 8 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|PositiveInteger| 'NILADIC T) 
