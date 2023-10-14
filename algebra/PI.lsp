
(/VERSIONCHECK 2) 

(SETQ |$CategoryFrame|
        (|put| #1='|PositiveInteger| '|SuperDomain| #2='(|NonNegativeInteger|)
               (|put| #2# #3='|SubDomain|
                      (CONS '(|PositiveInteger| SPADCALL |#1| 0 (QREFELT $ 7))
                            (DELASC #1# (|get| #2# #3# |$CategoryFrame|)))
                      |$CategoryFrame|))) 

(PUT '|PI;qcoerce;I$;1| '|SPADreplace| '(XLAM (|n|) |n|)) 

(DEFUN |PI;qcoerce;I$;1| (|n| $) |n|) 

(DECLAIM (NOTINLINE |PositiveInteger;|)) 

(DEFUN |PositiveInteger| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1759)
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
      (LETT $ (GETREFV 16) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PositiveInteger| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PositiveInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Boolean|) (0 . >)
              (|Integer|) |PI;qcoerce;I$;1| (|PositiveInteger|)
              (|Union| $ '"failed") (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 6 |smaller?| 12 |sample| 18 |recip| 22 |qcoerce| 27 |one?| 32
              |min| 37 |max| 43 |latex| 49 |hashUpdate!| 54 |hash| 60 |gcd| 65
              |coerce| 71 ^ 76 |One| 88 >= 92 > 98 = 104 <= 110 < 116 + 122 *
              128)
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
                      (|PartialOrder|) (|CoercibleTo| 15))
                   (|makeByteWordVec2| 15
                                       '(2 5 6 0 0 7 2 0 6 0 0 1 2 0 6 0 0 1 0
                                         0 0 1 1 0 11 0 1 1 0 0 8 9 1 0 6 0 1 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 12 0 1 2 0
                                         14 14 0 1 1 0 13 0 1 2 0 0 0 0 1 1 0
                                         15 0 1 2 0 0 0 10 1 2 0 0 0 5 1 0 0 0
                                         1 2 0 6 0 0 1 2 0 6 0 0 1 2 0 6 0 0 1
                                         2 0 6 0 0 1 2 0 6 0 0 1 2 0 0 0 0 1 2
                                         0 0 0 0 1 2 0 0 10 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|PositiveInteger| 'NILADIC T) 
