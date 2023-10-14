
(/VERSIONCHECK 2) 

(DEFUN |LA;One;$;1| ($)
  (SPADCALL (|spadConstant| $ 8) (|spadConstant| $ 9) (QREFELT $ 10))) 

(DEFUN |LA;*;3$;2| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |y| (QREFELT $ 12))
             (QREFELT $ 13))
   (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (SPADCALL |y| (QREFELT $ 14))
             (QREFELT $ 15))
   (QREFELT $ 10))) 

(DEFUN |LA;characteristic;Nni;3| ($) (SPADCALL (QREFELT $ 18))) 

(DECLAIM (NOTINLINE |LocalAlgebra;|)) 

(DEFUN |LocalAlgebra| (&REST #1=#:G109)
  (PROG ()
    (RETURN
     (PROG (#2=#:G110)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LocalAlgebra|)
                                           '|domainEqualList|)
                . #3=(|LocalAlgebra|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LocalAlgebra;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|LocalAlgebra|))))))))))) 

(DEFUN |LocalAlgebra;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LocalAlgebra|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LocalAlgebra| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 28) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|OrderedRing|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|LocalAlgebra| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LocalAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Localize| 6 7) (|local| |#1|)
              (|local| |#2|) (0 . |One|) (4 . |One|) (8 . /)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |LA;One;$;1|) $))
              (14 . |numer|) (19 . *) (25 . |denom|) (30 . *) |LA;*;3$;2|
              (|NonNegativeInteger|) (36 . |characteristic|)
              |LA;characteristic;Nni;3| (|Boolean|) (|Integer|)
              (|Union| $ '"failed") (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 40 |zero?| 46 |subtractIfCan| 51 |smaller?| 57 |sign| 63
              |sample| 68 |recip| 72 |positive?| 77 |one?| 82 |numer| 87
              |negative?| 92 |min| 97 |max| 103 |latex| 109 |hashUpdate!| 114
              |hash| 120 |denom| 125 |coerce| 130 |characteristic| 145 |abs|
              149 ^ 154 |Zero| 166 |One| 170 >= 174 > 180 = 186 <= 192 < 198 /
              204 - 216 + 227 * 233)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 1 0 0 1 0 0 0 0 1 0 1 0 0 1 0 0 0 1 0 0 1
                                  0 0 0 0 1))
            (CONS
             '#(|Algebra&| |Module&| |OrderedRing&| |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |OrderedSet&| |SemiGroup&| |AbelianSemiGroup&|
                NIL |SetCategory&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|Algebra| 7) (|Module| 7) (|OrderedRing|) (|Ring|)
                 (|BiModule| 7 7) (|OrderedAbelianGroup|) (|Rng|)
                 (|RightModule| 7) (|LeftModule| 7) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|OrderedSet|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|SetCategory|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 27)
                 (|PartialOrder|))
              (|makeByteWordVec2| 27
                                  '(0 6 0 8 0 7 0 9 2 0 0 6 7 10 1 0 6 0 12 2 6
                                    0 0 0 13 1 0 7 0 14 2 7 0 0 0 15 0 6 17 18
                                    2 0 20 0 0 1 1 0 20 0 1 2 0 22 0 0 1 2 1 20
                                    0 0 1 1 1 21 0 1 0 0 0 1 1 0 22 0 1 1 1 20
                                    0 1 1 0 20 0 1 1 0 6 0 12 1 1 20 0 1 2 1 0
                                    0 0 1 2 1 0 0 0 1 1 0 24 0 1 2 0 26 26 0 1
                                    1 0 25 0 1 1 0 7 0 14 1 0 0 7 1 1 0 0 21 1
                                    1 0 27 0 1 0 0 17 19 1 1 0 0 1 2 0 0 0 17 1
                                    2 0 0 0 23 1 0 0 0 1 0 0 0 11 2 1 20 0 0 1
                                    2 1 20 0 0 1 2 0 20 0 0 1 2 1 20 0 0 1 2 1
                                    20 0 0 1 2 0 0 6 7 10 2 0 0 0 7 1 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 7 1 2 0 0 7
                                    0 1 2 0 0 0 0 16 2 0 0 21 0 1 2 0 0 17 0 1
                                    2 0 0 23 0 1)))))
           '|lookupComplete|)) 
