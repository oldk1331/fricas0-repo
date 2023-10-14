
(/VERSIONCHECK 2) 

(PUT '|OMLO;op;P$;1| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |OMLO;op;P$;1| (|a| $) |a|) 

(PUT '|OMLO;po;$P;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |OMLO;po;$P;2| (|x| $) |x|) 

(DEFUN |OMLO;*;3$;3| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 11))) 

(DEFUN |OMLO;coerce;$Of;4| (|x| $)
  (SPADCALL (SPADCALL '|op| (QREFELT $ 15))
            (LIST (SPADCALL |x| (QREFELT $ 16))) (QREFELT $ 18))) 

(DEFUN |OppositeMonogenicLinearOperator| (&REST #1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|OppositeMonogenicLinearOperator|)
                                           '|domainEqualList|)
                . #3=(|OppositeMonogenicLinearOperator|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |OppositeMonogenicLinearOperator;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|OppositeMonogenicLinearOperator|))))))))))) 

(DEFUN |OppositeMonogenicLinearOperator;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OppositeMonogenicLinearOperator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|OppositeMonogenicLinearOperator| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 28) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|OppositeMonogenicLinearOperator|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 5 |#1|)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 |#1|)
      $)))) 

(MAKEPROP '|OppositeMonogenicLinearOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#1|) (|local| |#2|)
              '|Rep| |OMLO;op;P$;1| |OMLO;po;$P;2| (0 . *) |OMLO;*;3$;3|
              (|OutputForm|) (|Symbol|) (6 . |coerce|) (11 . |coerce|)
              (|List| $) (16 . |prefix|) |OMLO;coerce;$Of;4|
              (|NonNegativeInteger|) (|Integer|) (|Union| $ '"failed")
              (|Boolean|) (|PositiveInteger|) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 22 |zero?| 28 |subtractIfCan| 33 |sample| 39 |reductum| 43
              |recip| 48 |po| 53 |op| 58 |one?| 63 |monomial| 68
              |minimumDegree| 74 |leadingCoefficient| 79 |latex| 84
              |hashUpdate!| 89 |hash| 95 |differentiate| 100 |degree| 111
              |coerce| 116 |coefficient| 131 |characteristic| 137 ^ 141 |Zero|
              153 |One| 157 D 161 = 172 - 178 + 189 * 195)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 1 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |Algebra&| |Module&| |DifferentialRing&| |Ring&| NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL
                |BasicType&| NIL)
             (CONS
              '#((|MonogenicLinearOperator| 7) (|Algebra| 7) (|Module| 7)
                 (|DifferentialRing|) (|Ring|) (|BiModule| 7 7) (|Rng|)
                 (|LeftModule| 7) (|RightModule| 7) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 13))
              (|makeByteWordVec2| 27
                                  '(2 5 0 0 0 11 1 14 13 0 15 1 5 13 0 16 2 13
                                    0 0 17 18 2 0 23 0 0 1 1 0 23 0 1 2 0 22 0
                                    0 1 0 0 0 1 1 0 0 0 1 1 0 22 0 1 1 0 5 0 10
                                    1 0 0 5 9 1 0 23 0 1 2 0 0 7 20 1 1 0 20 0
                                    1 1 0 7 0 1 1 0 25 0 1 2 0 27 27 0 1 1 0 26
                                    0 1 2 2 0 0 20 1 1 2 0 0 1 1 0 20 0 1 1 1 0
                                    7 1 1 0 0 21 1 1 0 13 0 19 2 0 7 0 20 1 0 0
                                    20 1 2 0 0 0 20 1 2 0 0 0 24 1 0 0 0 1 0 0
                                    0 1 2 2 0 0 20 1 1 2 0 0 1 2 0 23 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 7 0 1 2
                                    0 0 0 7 1 2 0 0 21 0 1 2 0 0 0 0 12 2 0 0
                                    20 0 1 2 0 0 24 0 1)))))
           '|lookupComplete|)) 
