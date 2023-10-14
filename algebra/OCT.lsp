
(/VERSIONCHECK 2) 

(DEFUN |OCT;Zero;$;1| ($) (CONS (|spadConstant| $ 11) (|spadConstant| $ 11))) 

(DEFUN |OCT;One;$;2| ($) (CONS (|spadConstant| $ 14) (|spadConstant| $ 11))) 

(DEFUN |OCT;real;$R;3| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 15))) 

(DEFUN |OCT;imagi;$R;4| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 17))) 

(DEFUN |OCT;imagj;$R;5| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 19))) 

(DEFUN |OCT;imagk;$R;6| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 21))) 

(DEFUN |OCT;imagE;$R;7| (|x| $) (SPADCALL (QCDR |x|) (QREFELT $ 15))) 

(DEFUN |OCT;imagI;$R;8| (|x| $) (SPADCALL (QCDR |x|) (QREFELT $ 17))) 

(DEFUN |OCT;imagJ;$R;9| (|x| $) (SPADCALL (QCDR |x|) (QREFELT $ 19))) 

(DEFUN |OCT;imagK;$R;10| (|x| $) (SPADCALL (QCDR |x|) (QREFELT $ 21))) 

(DEFUN |OCT;octon;8R$;11| (|a| |b| |c| |d| |f| |g| |h| |i| $)
  (CONS (SPADCALL |a| |b| |c| |d| (QREFELT $ 27))
        (SPADCALL |f| |g| |h| |i| (QREFELT $ 27)))) 

(PUT '|OCT;octon;2Q$;12| '|SPADreplace| 'CONS) 

(DEFUN |OCT;octon;2Q$;12| (|p| |q| $) (CONS |p| |q|)) 

(DEFUN |OCT;coerce;Q$;13| (|q| $) (CONS |q| (|spadConstant| $ 11))) 

(DEFUN |OCT;retract;$Q;14| (|x| $)
  (SEQ
   (COND
    ((SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 32))
     (COND
      ((SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 32))
       (COND
        ((SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 32))
         (COND
          ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 32)))
           (EXIT (|error| #1="Cannot retract octonion to quaternion.")))))
        (#2='T (EXIT (|error| #1#)))))
      (#2# (EXIT (|error| #1#)))))
    (#2# (EXIT (|error| #1#))))
   (EXIT
    (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (SPADCALL |x| (QREFELT $ 18))
              (SPADCALL |x| (QREFELT $ 20)) (SPADCALL |x| (QREFELT $ 22))
              (QREFELT $ 27))))) 

(DEFUN |OCT;retractIfCan;$U;15| (|x| $)
  (SEQ
   (COND
    ((SPADCALL (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 32))
     (COND
      ((SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 32))
       (COND
        ((SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 32))
         (COND
          ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 32)))
           (EXIT (CONS 1 #1="failed")))))
        (#2='T (EXIT (CONS 1 #1#)))))
      (#2# (EXIT (CONS 1 #1#)))))
    (#2# (EXIT (CONS 1 #1#))))
   (EXIT
    (CONS 0
          (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (SPADCALL |x| (QREFELT $ 18))
                    (SPADCALL |x| (QREFELT $ 20)) (SPADCALL |x| (QREFELT $ 22))
                    (QREFELT $ 27)))))) 

(DEFUN |OCT;*;3$;16| (|x| |y| $)
  (CONS
   (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 36))
             (SPADCALL (SPADCALL (QCDR |y|) (QREFELT $ 37)) (QCDR |x|)
                       (QREFELT $ 36))
             (QREFELT $ 38))
   (SPADCALL (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT $ 36))
             (SPADCALL (QCDR |x|) (SPADCALL (QCAR |y|) (QREFELT $ 37))
                       (QREFELT $ 36))
             (QREFELT $ 39)))) 

(DECLAIM (NOTINLINE |Octonion;|)) 

(DEFUN |Octonion| (#1=#:G168)
  (PROG ()
    (RETURN
     (PROG (#2=#:G169)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Octonion|)
                                           '|domainEqualList|)
                . #3=(|Octonion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Octonion;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Octonion|))))))))))) 

(DEFUN |Octonion;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Octonion|))
      (LETT |dv$| (LIST '|Octonion| DV$1) . #1#)
      (LETT $ (GETREFV 61) . #1#)
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
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| |#1| '(|Finite|))
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| (|Quaternion| |#1|)
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           (|HasCategory| (|Quaternion| |#1|)
                                                          '(|RetractableTo|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RealNumberSystem|))
                                          (|HasCategory| |#1|
                                                         '(|IntegerNumberSystem|))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|Octonion| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |e| (|Quaternion| |#1|))
                          (|:| E (|Quaternion| |#1|))))
      $)))) 

(MAKEPROP '|Octonion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |OCT;Zero;$;1|) $))
              (0 . |Zero|) (|Quaternion| 6) (4 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |OCT;One;$;2|) $))
              (8 . |One|) (12 . |One|) (16 . |real|) |OCT;real;$R;3|
              (21 . |imagI|) |OCT;imagi;$R;4| (26 . |imagJ|) |OCT;imagj;$R;5|
              (31 . |imagK|) |OCT;imagk;$R;6| |OCT;imagE;$R;7| |OCT;imagI;$R;8|
              |OCT;imagJ;$R;9| |OCT;imagK;$R;10| (36 . |quatern|)
              |OCT;octon;8R$;11| |OCT;octon;2Q$;12| |OCT;coerce;Q$;13|
              (|Boolean|) (44 . |zero?|) |OCT;retract;$Q;14|
              (|Union| 10 '"failed") |OCT;retractIfCan;$U;15| (49 . *)
              (55 . |conjugate|) (60 . -) (66 . +) |OCT;*;3$;16|
              (|Union| 42 '#1="failed") (|Fraction| 43) (|Integer|)
              (|Union| 43 '#1#) (|Union| $ '"failed") (|InputForm|)
              (|Equation| 6) (|List| 47) (|List| 6) (|NonNegativeInteger|)
              (|PositiveInteger|) (|List| $) (|List| 54) (|Symbol|)
              (|Mapping| 6 6) (|Union| 6 '#1#) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 72 |zero?| 78 |subtractIfCan| 83 |smaller?| 89 |size| 95
              |sample| 99 |retractIfCan| 103 |retract| 123 |recip| 143 |real|
              148 |rationalIfCan| 153 |rational?| 158 |rational| 163 |random|
              168 |one?| 172 |octon| 177 |norm| 195 |min| 200 |max| 206 |map|
              212 |lookup| 218 |latex| 223 |inv| 228 |index| 233 |imagk| 238
              |imagj| 243 |imagi| 248 |imagK| 253 |imagJ| 258 |imagI| 263
              |imagE| 268 |hashUpdate!| 273 |hash| 279 |eval| 284 |enumerate|
              324 |elt| 328 |convert| 334 |conjugate| 339 |coerce| 344
              |charthRoot| 369 |characteristic| 374 |abs| 378 ^ 383 |Zero| 395
              |One| 399 >= 403 > 409 = 415 <= 421 < 427 - 433 + 444 * 450)
           'NIL
           (CONS
            (|makeByteWordVec2| 10
                                '(0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 4 5
                                  0 0 0 7 0 0 0 0 0 3 4 6 7 8 9 10))
            (CONS
             '#(|OctonionCategory&| |Algebra&| |Module&| NIL NIL |Ring&| NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |OrderedSet&| |FullyEvalableOver&| |SemiGroup&|
                |AbelianSemiGroup&| NIL |Finite&| |FullyRetractableTo&|
                |FullyRetractableTo&| |SetCategory&| |Evalable&|
                |RetractableTo&| |RetractableTo&| NIL |BasicType&| NIL NIL
                |PartialOrder&| |InnerEvalable&| |InnerEvalable&| NIL
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|OctonionCategory| 6) (|Algebra| 6) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Ring|)
                 (|BiModule| 6 6) (|Rng|) (|RightModule| 6) (|LeftModule| 6)
                 (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|OrderedSet|) (|FullyEvalableOver| 6)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|) (|Finite|)
                 (|FullyRetractableTo| (|Quaternion| 6))
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| 6)
                 (|RetractableTo| (|Quaternion| 6)) (|RetractableTo| 6)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 60)
                 (|ConvertibleTo| 46) (|PartialOrder|) (|InnerEvalable| 54 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|RetractableTo| 42)
                 (|RetractableTo| 43))
              (|makeByteWordVec2| 60
                                  '(0 6 0 9 0 10 0 11 0 6 0 13 0 10 0 14 1 10 6
                                    0 15 1 10 6 0 17 1 10 6 0 19 1 10 6 0 21 4
                                    10 0 6 6 6 6 27 1 6 31 0 32 2 10 0 0 0 36 1
                                    10 0 0 37 2 10 0 0 0 38 2 10 0 0 0 39 2 0
                                    31 0 0 1 1 0 31 0 1 2 0 45 0 0 1 2 4 31 0 0
                                    1 0 5 50 1 0 0 0 1 1 9 41 0 1 1 10 44 0 1 1
                                    0 34 0 35 1 0 56 0 1 1 9 42 0 1 1 10 43 0 1
                                    1 0 10 0 33 1 0 6 0 1 1 0 45 0 1 1 0 6 0 16
                                    1 12 41 0 1 1 12 31 0 1 1 12 42 0 1 0 5 0 1
                                    1 0 31 0 1 2 0 0 10 10 29 8 0 0 6 6 6 6 6 6
                                    6 6 28 1 0 6 0 1 2 4 0 0 0 1 2 4 0 0 0 1 2
                                    0 0 55 0 1 1 5 51 0 1 1 0 57 0 1 1 13 0 0 1
                                    1 5 0 51 1 1 0 6 0 22 1 0 6 0 20 1 0 6 0 18
                                    1 0 6 0 26 1 0 6 0 25 1 0 6 0 24 1 0 6 0 23
                                    2 0 59 59 0 1 1 0 58 0 1 2 7 0 0 47 1 2 7 0
                                    0 48 1 3 7 0 0 6 6 1 3 7 0 0 49 49 1 3 6 0
                                    0 53 49 1 3 6 0 0 54 6 1 0 5 52 1 2 8 0 0 6
                                    1 1 3 46 0 1 1 0 0 0 1 1 9 0 42 1 1 0 0 10
                                    30 1 0 0 6 1 1 0 0 43 1 1 0 60 0 1 1 1 45 0
                                    1 0 0 50 1 1 11 6 0 1 2 0 0 0 50 1 2 0 0 0
                                    51 1 0 0 0 8 0 0 0 12 2 4 31 0 0 1 2 4 31 0
                                    0 1 2 0 31 0 0 1 2 4 31 0 0 1 2 4 31 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 6
                                    1 2 0 0 6 0 1 2 0 0 43 0 1 2 0 0 0 0 40 2 0
                                    0 50 0 1 2 0 0 51 0 1)))))
           '|lookupComplete|)) 
