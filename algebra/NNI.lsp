
(/VERSIONCHECK 2) 

(SETQ |$CategoryFrame|
        (|put| #1='|NonNegativeInteger| '|SuperDomain| #2='(|Integer|)
               (|put| #2# #3='|SubDomain|
                      (CONS '(|NonNegativeInteger| >= |#1| 0)
                            (DELASC #1# (|get| #2# #3# |$CategoryFrame|)))
                      |$CategoryFrame|))) 

(PUT '|NNI;sup;3$;1| '|SPADreplace| 'MAX) 

(DEFUN |NNI;sup;3$;1| (|x| |y| $) (MAX |x| |y|)) 

(PUT '|NNI;shift;$I$;2| '|SPADreplace| 'ASH) 

(DEFUN |NNI;shift;$I$;2| (|x| |n| $) (ASH |x| |n|)) 

(PUT '|NNI;qcoerce;I$;3| '|SPADreplace| '(XLAM (|n|) |n|)) 

(DEFUN |NNI;qcoerce;I$;3| (|n| $) |n|) 

(DEFUN |NNI;subtractIfCan;2$U;4| (|x| |y| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (- |x| |y|) |NNI;subtractIfCan;2$U;4|)
          (EXIT (COND ((< |c| 0) (CONS 1 "failed")) ('T (CONS 0 |c|)))))))) 

(DEFUN |NonNegativeInteger| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1567)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|NonNegativeInteger|)
                . #2=(|NonNegativeInteger|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|NonNegativeInteger|
                         (LIST (CONS NIL (CONS 1 (|NonNegativeInteger;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|NonNegativeInteger|))))))))))) 

(DEFUN |NonNegativeInteger;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|NonNegativeInteger|) . #1=(|NonNegativeInteger|))
      (LETT $ (GETREFV 18) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NonNegativeInteger| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NonNegativeInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) |NNI;sup;3$;1| |NNI;shift;$I$;2|
              |NNI;qcoerce;I$;3| (|Union| $ '"failed")
              |NNI;subtractIfCan;2$U;4|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|PositiveInteger|) (|NonNegativeInteger|) (|Boolean|)
              (|SingleInteger|) (|String|) (|OutputForm|))
           '#(~= 0 |zero?| 6 |sup| 11 |subtractIfCan| 17 |smaller?| 23 |shift|
              29 |sample| 35 |rem| 39 |recip| 45 |random| 50 |quo| 55 |qcoerce|
              61 |one?| 66 |min| 71 |max| 77 |latex| 83 |hash| 88 |gcd| 93
              |exquo| 99 |divide| 105 |coerce| 111 ^ 116 |Zero| 128 |One| 132
              >= 136 > 142 = 148 <= 154 < 160 + 166 * 172)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL NIL NIL |OrderedSet&| |Monoid&| NIL
                     |AbelianMonoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                     |SetCategory&| NIL |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedAbelianMonoidSup|)
                      (|OrderedCancellationAbelianMonoid|)
                      (|OrderedAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                      (|SemiRing|) (|CancellationAbelianMonoid|) (|OrderedSet|)
                      (|Monoid|) (|SemiRng|) (|AbelianMonoid|) (|Comparable|)
                      (|SemiGroup|) (|AbelianSemiGroup|) (|SetCategory|)
                      (|CommutativeStar|) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 17))
                   (|makeByteWordVec2| 17
                                       '(2 0 14 0 0 1 1 0 14 0 1 2 0 0 0 0 6 2
                                         0 9 0 0 10 2 0 14 0 0 1 2 0 0 0 5 7 0
                                         0 0 1 2 0 0 0 0 1 1 0 9 0 1 1 0 0 0 1
                                         2 0 0 0 0 1 1 0 0 5 8 1 0 14 0 1 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 16 0 1 1 0 15 0
                                         1 2 0 0 0 0 1 2 0 9 0 0 1 2 0 11 0 0 1
                                         1 0 17 0 1 2 0 0 0 12 1 2 0 0 0 13 1 0
                                         0 0 1 0 0 0 1 2 0 14 0 0 1 2 0 14 0 0
                                         1 2 0 14 0 0 1 2 0 14 0 0 1 2 0 14 0 0
                                         1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 13 0 1
                                         2 0 0 12 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|NonNegativeInteger| 'NILADIC T) 
