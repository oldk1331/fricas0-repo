
(/VERSIONCHECK 2) 

(PUT '|OEXPR;retract;E$;1| '|SPADreplace| '(XLAM (|e|) |e|)) 

(DEFUN |OEXPR;retract;E$;1| (|e| $) |e|) 

(PUT '|OEXPR;coerce;$E;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |OEXPR;coerce;$E;2| (|x| $) |x|) 

(DEFUN |OEXPR;retractIfCan;EU;3| (|x| $) (CONS 0 (SPADCALL |x| (QREFELT $ 7)))) 

(DEFUN |OEXPR;<;2$B;4| (|x| |y| $)
  (PROG (|s| |di|)
    (RETURN
     (SEQ (LETT |di| (SPADCALL |y| |x| (QREFELT $ 11)) . #1=(|OEXPR;<;2$B;4|))
          (EXIT
           (COND ((SPADCALL |di| (|spadConstant| $ 12) (QREFELT $ 15)) 'NIL)
                 (#2='T
                  (SEQ (LETT |s| (SPADCALL |di| (QREFELT $ 18)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |s| 0) (EQL (QCDR |s|) 1))
                              (#2# (|error| "can not determine sign")))))))))))) 

(DECLAIM (NOTINLINE |OrderedExpression;|)) 

(DEFUN |OrderedExpression| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G119)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|OrderedExpression|)
                . #2=(|OrderedExpression|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|OrderedExpression|
                         (LIST (CONS NIL (CONS 1 (|OrderedExpression;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|OrderedExpression|))))))))))) 

(DEFUN |OrderedExpression;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|OrderedExpression|) . #1=(|OrderedExpression|))
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OrderedExpression| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|Expression| (|Integer|)))
      $)))) 

(MAKEPROP '|OrderedExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 23) '|Rep| |OEXPR;retract;E$;1|
              |OEXPR;coerce;$E;2| (|Union| $ '"failed")
              |OEXPR;retractIfCan;EU;3| (0 . -) (6 . |Zero|) (10 . |Zero|)
              (|Boolean|) (14 . =) (|Union| 23 '"failed")
              (|ElementaryFunctionSign| 23 5) (20 . |sign|) (25 . |One|)
              (29 . |One|) |OEXPR;<;2$B;4| (|Fraction| 23) (|Integer|)
              (|PositiveInteger|) (|NonNegativeInteger|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 33 |zero?| 39 |subtractIfCan| 44 |smaller?| 50 |sign| 56
              |sample| 61 |retractIfCan| 65 |retract| 70 |recip| 75 |positive?|
              80 |one?| 85 |negative?| 90 |min| 95 |max| 101 |latex| 107
              |hashUpdate!| 112 |hash| 118 |coerce| 123 |characteristic| 143
              |abs| 147 ^ 152 |Zero| 164 |One| 168 >= 172 > 178 = 184 <= 190 <
              196 - 202 + 213 * 219)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(|Algebra&| |OrderedRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |Monoid&| NIL NIL |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| |RetractableFrom&| NIL
                |BasicType&| |PartialOrder&| NIL)
             (CONS
              '#((|Algebra| 22) (|OrderedRing|) (|Module| 22)
                 (|OrderedAbelianGroup|) (|BiModule| 22 22) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 22)
                 (|LeftModule| 22) (|Rng|) (|LeftModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|RetractableFrom| 5) (|unitsKnown|)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 29))
              (|makeByteWordVec2| 29
                                  '(2 0 0 0 0 11 0 0 0 12 0 6 0 13 2 0 14 0 0
                                    15 1 17 16 5 18 0 0 0 19 0 6 0 20 2 0 14 0
                                    0 1 1 0 14 0 1 2 0 9 0 0 1 2 0 14 0 0 1 1 0
                                    23 0 1 0 0 0 1 1 0 9 5 10 1 0 0 5 7 1 0 9 0
                                    1 1 0 14 0 1 1 0 14 0 1 1 0 14 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 26 0 1 2 0 28 28 0 1 1
                                    0 27 0 1 1 0 5 0 8 1 0 0 22 1 1 0 0 23 1 1
                                    0 29 0 1 0 0 25 1 1 0 0 0 1 2 0 0 0 24 1 2
                                    0 0 0 25 1 0 0 0 12 0 0 0 19 2 0 14 0 0 1 2
                                    0 14 0 0 1 2 0 14 0 0 15 2 0 14 0 0 1 2 0
                                    14 0 0 21 2 0 0 0 0 11 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 22 0 1 2 0 0 0 22 1 2 0 0 0 0 1 2 0
                                    0 23 0 1 2 0 0 25 0 1 2 0 0 24 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|OrderedExpression| 'NILADIC T) 
