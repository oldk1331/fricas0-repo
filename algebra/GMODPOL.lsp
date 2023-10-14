
(/VERSIONCHECK 2) 

(DEFUN |GMODPOL;leadingMonomial;$Mm;1| (|p| $) (SPADCALL |p| (QREFELT $ 14))) 

(DEFUN |GMODPOL;leadingExponent;$E;2| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 16))) 

(DEFUN |GMODPOL;leadingIndex;$IS;3| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 18))) 

(DEFUN |GMODPOL;unitVector;IS$;4| (|i| $)
  (SPADCALL (|spadConstant| $ 20)
            (SPADCALL |i| (|spadConstant| $ 22) (QREFELT $ 23)) (QREFELT $ 24))) 

(DEFUN |GMODPOL;build;RISE$;5| (|c| |i| |e| $)
  (SPADCALL |c| (SPADCALL |i| |e| (QREFELT $ 23)) (QREFELT $ 24))) 

(DEFUN |GMODPOL;multMonom;RE2$;6| (|c| |e| |mp| $)
  (COND ((SPADCALL |mp| (QREFELT $ 28)) |mp|)
        ('T
         (SPADCALL
          (SPADCALL
           (SPADCALL |c| (SPADCALL |mp| (QREFELT $ 29)) (QREFELT $ 30))
           (SPADCALL (SPADCALL |mp| (QREFELT $ 19))
                     (SPADCALL |e| (SPADCALL |mp| (QREFELT $ 17))
                               (QREFELT $ 31))
                     (QREFELT $ 23))
           (QREFELT $ 24))
          (SPADCALL |c| |e| (SPADCALL |mp| (QREFELT $ 32)) (QREFELT $ 33))
          (QREFELT $ 34))))) 

(DEFUN |GMODPOL;*;P2$;7| (|p| |mp| $)
  (COND ((SPADCALL |p| (QREFELT $ 35)) (|spadConstant| $ 36))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p| (QREFELT $ 37)) (SPADCALL |p| (QREFELT $ 38))
                    |mp| (QREFELT $ 33))
          (SPADCALL (SPADCALL |p| (QREFELT $ 39)) |mp| (QREFELT $ 40))
          (QREFELT $ 34))))) 

(DEFUN |GeneralModulePolynomial| (&REST #1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GeneralModulePolynomial|)
                                           '|domainEqualList|)
                . #3=(|GeneralModulePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GeneralModulePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GeneralModulePolynomial|))))))))))) 

(DEFUN |GeneralModulePolynomial;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (PROG (|pv$| $ |dv$| DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GeneralModulePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT |dv$|
            (LIST '|GeneralModulePolynomial| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6)
            . #1#)
      (LETT $ (GETREFV 49) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#6|
                                                          '(|AbelianGroup|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#2|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#6|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#6|
                                                          '(|AbelianMonoid|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#6|
                                                          '(|AbelianMonoid|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|GeneralModulePolynomial|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (|FreeModule| |#2| (|ModuleMonomial| |#3| |#4| |#5|)))
      $)))) 

(MAKEPROP '|GeneralModulePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 13) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|local| |#6|) '|Rep| (|ModuleMonomial| 8 9 10)
              (0 . |leadingSupport|) |GMODPOL;leadingMonomial;$Mm;1|
              (5 . |exponent|) |GMODPOL;leadingExponent;$E;2| (10 . |index|)
              |GMODPOL;leadingIndex;$IS;3| (15 . |One|) (19 . |One|)
              (23 . |Zero|) (27 . |construct|) (33 . |monomial|)
              |GMODPOL;unitVector;IS$;4| |GMODPOL;build;RISE$;5| (|Boolean|)
              (39 . |zero?|) (44 . |leadingCoefficient|) (49 . *) (55 . +)
              (61 . |reductum|) |GMODPOL;multMonom;RE2$;6| (66 . +)
              (72 . |zero?|) (77 . |Zero|) (81 . |leadingCoefficient|)
              (86 . |degree|) (91 . |reductum|) |GMODPOL;*;P2$;7|
              (|Union| $ '"failed") (|Integer|) (|NonNegativeInteger|)
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#(~= 96 |zero?| 102 |unitVector| 107 |subtractIfCan| 112 |sample|
              118 |reductum| 122 |multMonom| 127 |monomial| 134
              |leadingMonomial| 140 |leadingIndex| 145 |leadingExponent| 150
              |leadingCoefficient| 155 |latex| 160 |hashUpdate!| 165 |hash| 171
              |coerce| 176 |build| 181 |Zero| 188 = 192 - 198 + 209 * 215)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 0 0 1 1 2 0 0 0 0))
                 (CONS
                  '#(|Module&| |Module&| NIL NIL NIL NIL NIL NIL
                     |AbelianGroup&| NIL |AbelianMonoid&| |AbelianSemiGroup&|
                     |SetCategory&| |BasicType&| NIL)
                  (CONS
                   '#((|Module| 11) (|Module| 7) (|BiModule| 11 11)
                      (|BiModule| 7 7) (|LeftModule| 11) (|RightModule| 7)
                      (|LeftModule| 7) (|RightModule| 11) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 47))
                   (|makeByteWordVec2| 48
                                       '(1 12 13 0 14 1 13 9 0 16 1 13 8 0 18 0
                                         7 0 20 0 9 0 21 0 9 0 22 2 13 0 8 9 23
                                         2 0 0 7 13 24 1 0 27 0 28 1 0 7 0 29 2
                                         7 0 0 0 30 2 9 0 0 0 31 1 0 0 0 32 2 0
                                         0 0 0 34 1 11 27 0 35 0 0 0 36 1 11 7
                                         0 37 1 11 9 0 38 1 11 0 0 39 2 0 27 0
                                         0 1 1 3 27 0 28 1 0 0 8 25 2 1 41 0 0
                                         1 0 3 0 1 1 0 0 0 32 3 0 0 7 9 0 33 2
                                         0 0 7 13 24 1 0 13 0 15 1 0 8 0 19 1 0
                                         9 0 17 1 0 7 0 29 1 0 46 0 1 2 0 45 45
                                         0 1 1 0 48 0 1 1 0 47 0 1 3 0 0 7 8 9
                                         26 0 3 0 36 2 0 27 0 0 1 2 1 0 0 0 1 1
                                         1 0 0 1 2 0 0 0 0 34 2 1 0 42 0 1 2 3
                                         0 43 0 1 2 0 0 7 0 1 2 0 0 0 7 1 2 0 0
                                         11 0 40 2 0 0 0 11 1 2 0 0 44 0 1)))))
           '|lookupComplete|)) 
