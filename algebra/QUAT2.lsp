
(/VERSIONCHECK 2) 

(DEFUN |QUAT2;Zero;$;1| ($)
  (VECTOR (|spadConstant| $ 10) (|spadConstant| $ 10) (|spadConstant| $ 10)
          (|spadConstant| $ 10))) 

(DEFUN |QUAT2;One;$;2| ($)
  (VECTOR (|spadConstant| $ 12) (|spadConstant| $ 10) (|spadConstant| $ 10)
          (|spadConstant| $ 10))) 

(PUT '|QUAT2;real;$R;3| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(DEFUN |QUAT2;real;$R;3| (|x| $) (QVELT |x| 0)) 

(PUT '|QUAT2;imagI;$R;4| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 1))) 

(DEFUN |QUAT2;imagI;$R;4| (|x| $) (QVELT |x| 1)) 

(PUT '|QUAT2;imagJ;$R;5| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 2))) 

(DEFUN |QUAT2;imagJ;$R;5| (|x| $) (QVELT |x| 2)) 

(PUT '|QUAT2;imagK;$R;6| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 3))) 

(DEFUN |QUAT2;imagK;$R;6| (|x| $) (QVELT |x| 3)) 

(PUT '|QUAT2;quatern;4R$;7| '|SPADreplace| 'VECTOR) 

(DEFUN |QUAT2;quatern;4R$;7| (|a| |b| |c| |d| $) (VECTOR |a| |b| |c| |d|)) 

(DEFUN |QUAT2;*;3$;8| (|x| |y| $)
  (VECTOR
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 0) (QREFELT $ 19))
               (SPADCALL (SPADCALL (QREFELT $ 7) (QVELT |x| 1) (QREFELT $ 19))
                         (QVELT |y| 1) (QREFELT $ 19))
               (QREFELT $ 20))
     (SPADCALL (SPADCALL (QREFELT $ 8) (QVELT |x| 2) (QREFELT $ 19))
               (QVELT |y| 2) (QREFELT $ 19))
     (QREFELT $ 20))
    (SPADCALL
     (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 19))
               (QVELT |x| 3) (QREFELT $ 19))
     (QVELT |y| 3) (QREFELT $ 19))
    (QREFELT $ 21))
   (SPADCALL
    (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 1) (QREFELT $ 19))
              (SPADCALL (QVELT |x| 1) (QVELT |y| 0) (QREFELT $ 19))
              (QREFELT $ 20))
    (SPADCALL (QREFELT $ 8)
              (SPADCALL (SPADCALL (QVELT |x| 3) (QVELT |y| 2) (QREFELT $ 19))
                        (SPADCALL (QVELT |x| 2) (QVELT |y| 3) (QREFELT $ 19))
                        (QREFELT $ 21))
              (QREFELT $ 19))
    (QREFELT $ 20))
   (SPADCALL
    (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 2) (QREFELT $ 19))
              (SPADCALL (QVELT |x| 2) (QVELT |y| 0) (QREFELT $ 19))
              (QREFELT $ 20))
    (SPADCALL (QREFELT $ 7)
              (SPADCALL (SPADCALL (QVELT |x| 1) (QVELT |y| 3) (QREFELT $ 19))
                        (SPADCALL (QVELT |x| 3) (QVELT |y| 1) (QREFELT $ 19))
                        (QREFELT $ 21))
              (QREFELT $ 19))
    (QREFELT $ 20))
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 3) (QREFELT $ 19))
               (SPADCALL (QVELT |x| 3) (QVELT |y| 0) (QREFELT $ 19))
               (QREFELT $ 20))
     (SPADCALL (QVELT |x| 1) (QVELT |y| 2) (QREFELT $ 19)) (QREFELT $ 20))
    (SPADCALL (QVELT |x| 2) (QVELT |y| 1) (QREFELT $ 19)) (QREFELT $ 21)))) 

(DEFUN |GeneralQuaternion| (&REST #1=#:G151)
  (PROG ()
    (RETURN
     (PROG (#2=#:G152)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GeneralQuaternion|)
                                           '|domainEqualList|)
                . #3=(|GeneralQuaternion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GeneralQuaternion;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GeneralQuaternion|))))))))))) 

(DEFUN |GeneralQuaternion;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G150 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|GeneralQuaternion|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT DV$3 (|devaluate| |#3|) . #2#)
      (LETT |dv$| (LIST '|GeneralQuaternion| DV$1 DV$2 DV$3) . #2#)
      (LETT $ (GETREFV 49) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|EntireRing|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| |#1| '(|Field|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#1|
                                                         (LIST '|InnerEvalable|
                                                               '(|Symbol|)
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1|
                                                         (LIST '|Eltable|
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|RealNumberSystem|))
                                          (|HasCategory| |#1|
                                                         '(|IntegerNumberSystem|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1| '(|Field|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|GeneralQuaternion|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9
                (|Record| (|:| |r| |#1|) (|:| |i| |#1|) (|:| |j| |#1|)
                          (|:| |k| |#1|)))
      $)))) 

(MAKEPROP '|GeneralQuaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;Zero;$;1|) $))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;One;$;2|) $))
              |QUAT2;real;$R;3| |QUAT2;imagI;$R;4| |QUAT2;imagJ;$R;5|
              |QUAT2;imagK;$R;6| |QUAT2;quatern;4R$;7| (8 . *) (14 . +)
              (20 . -) |QUAT2;*;3$;8| (|Fraction| 30) (|Union| $ '"failed")
              (|InputForm|) (|NonNegativeInteger|) (|List| 28) (|Equation| 6)
              (|List| 6) (|Integer|) (|Symbol|) (|List| 31)
              (|Union| 23 '"failed") (|Boolean|)
              (|Record| (|:| |mat| 38) (|:| |vec| (|Vector| 30))) (|Matrix| $)
              (|Vector| $) (|Matrix| 30) (|List| 26) (|Union| 30 '#1="failed")
              (|Matrix| 6) (|Record| (|:| |mat| 41) (|:| |vec| (|Vector| 6)))
              (|Mapping| 6 6) (|Union| 6 '#1#) (|PositiveInteger|)
              (|SingleInteger|) (|String|) (|OutputForm|))
           '#(~= 26 |zero?| 32 |subtractIfCan| 37 |smaller?| 43 |sample| 49
              |retractIfCan| 53 |retract| 68 |reducedSystem| 83 |recip| 105
              |real| 110 |rationalIfCan| 115 |rational?| 120 |rational| 125
              |quatern| 130 |one?| 138 |norm| 143 |min| 148 |max| 154 |map| 160
              |latex| 166 |inv| 171 |imagK| 176 |imagJ| 181 |imagI| 186 |hash|
              191 |eval| 196 |elt| 236 |differentiate| 242 |convert| 292
              |conjugate| 297 |coerce| 302 |charthRoot| 322 |characteristic|
              327 |abs| 331 ^ 336 |Zero| 354 |One| 358 D 362 >= 412 > 418 = 424
              <= 430 < 436 - 442 + 453 * 459)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 4 0 0 0 4 0 0 1 2 6 4 10 11 15 0 0 5 4 0 0
                                  0 0 5 4 4 0 0 0 0 0 0 7 0 0 0 7 0 0 13 0 0 0
                                  0 3 5 7 8 9 12 13 14))
            (CONS
             '#(|QuaternionCategory&| |DivisionRing&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| NIL |Module&| NIL NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL |Ring&| NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL)
             (CONS
              '#((|QuaternionCategory| 6) (|DivisionRing|) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6)
                 (|DifferentialExtension| 6) (|Algebra| 23)
                 (|LinearlyExplicitRingOver| 6) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|Module| 23) (|PartialDifferentialRing| 31)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 30) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 23 23) (|Rng|)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 23) (|RightModule| 23)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|Evalable| 6) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 48) (|ConvertibleTo| 25)
                 (|noZeroDivisors|) (|PartialOrder|) (|RetractableTo| 23)
                 (|RetractableTo| 30) (|InnerEvalable| 31 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$))
              (|makeByteWordVec2| 48
                                  '(0 6 0 10 0 6 0 12 2 6 0 0 0 19 2 6 0 0 0 20
                                    2 6 0 0 0 21 2 0 34 0 0 1 1 0 34 0 1 2 0 24
                                    0 0 1 2 7 34 0 0 1 0 0 0 1 1 8 33 0 1 1 9
                                    40 0 1 1 0 44 0 1 1 8 23 0 1 1 9 30 0 1 1 0
                                    6 0 1 2 15 35 36 37 1 1 15 38 36 1 1 0 41
                                    36 1 2 0 42 36 37 1 1 0 24 0 1 1 0 6 0 14 1
                                    17 33 0 1 1 17 34 0 1 1 17 23 0 1 4 0 0 6 6
                                    6 6 18 1 0 34 0 1 1 0 6 0 1 2 7 0 0 0 1 2 7
                                    0 0 0 1 2 0 0 43 0 1 1 0 47 0 1 1 4 0 0 1 1
                                    0 6 0 17 1 0 6 0 16 1 0 6 0 15 1 0 46 0 1 2
                                    13 0 0 27 1 2 13 0 0 28 1 3 13 0 0 29 29 1
                                    3 13 0 0 6 6 1 3 12 0 0 31 6 1 3 12 0 0 32
                                    29 1 2 14 0 0 6 1 2 11 0 0 26 1 1 11 0 0 1
                                    3 10 0 0 31 26 1 3 10 0 0 32 39 1 2 10 0 0
                                    31 1 2 10 0 0 32 1 3 0 0 0 43 26 1 2 0 0 0
                                    43 1 1 3 25 0 1 1 0 0 0 1 1 18 0 23 1 1 0 0
                                    6 1 1 0 0 30 1 1 0 48 0 1 1 1 24 0 1 0 0 26
                                    1 1 16 6 0 1 2 4 0 0 30 1 2 0 0 0 26 1 2 0
                                    0 0 45 1 0 0 0 11 0 0 0 13 2 11 0 0 26 1 1
                                    11 0 0 1 3 10 0 0 32 39 1 2 10 0 0 32 1 3
                                    10 0 0 31 26 1 2 10 0 0 31 1 2 0 0 0 43 1 3
                                    0 0 0 43 26 1 2 7 34 0 0 1 2 7 34 0 0 1 2 0
                                    34 0 0 1 2 7 34 0 0 1 2 7 34 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 1 2 4 0 0 23 1 2 4
                                    0 23 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 30 0
                                    1 2 0 0 0 0 22 2 0 0 26 0 1 2 0 0 45 0
                                    1)))))
           '|lookupComplete|)) 
