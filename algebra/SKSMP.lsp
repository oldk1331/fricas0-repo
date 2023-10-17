
(SDEFUN |SKSMP;D;Var$;1| ((|v| (|Var|)) ($ ($)))
        (SPADCALL (|spadConstant| $ 10) |v| 1 (QREFELT $ 13))) 

(SDEFUN |SKSMP;Delta;S$;2| ((|s| (|Symbol|)) ($ ($)))
        (SPROG ((|vu| (|Union| |Var| "failed")))
               (SEQ (LETT |vu| (SPADCALL |s| (QREFELT $ 17)))
                    (EXIT
                     (COND ((QEQCAR |vu| 1) (|error| "missing variable"))
                           ('T (SPADCALL (QCDR |vu|) (QREFELT $ 14)))))))) 

(SDEFUN |SKSMP;lift_map| ((|f| (|Mapping| R R)) ($ (|Mapping| $ $)))
        (SPROG NIL (CONS #'|SKSMP;lift_map!0| (VECTOR $ |f|)))) 

(SDEFUN |SKSMP;lift_map!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f| |x| (QREFELT $ 28)))))) 

(SDEFUN |SKSMP;lift_morphism| ((|m| (|Automorphism| R)) ($ (|Automorphism| $)))
        (SPROG NIL
               (SPADCALL
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!0| (VECTOR $ |m|)) $)
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!1| (VECTOR $ |m|)) $)
                (QREFELT $ 32)))) 

(SDEFUN |SKSMP;lift_morphism!1| ((|x| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |m| (QREFELT $ 31)) |x| (QREFELT $ 30)))))) 

(SDEFUN |SKSMP;lift_morphism!0| ((|x| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |m| |x| (QREFELT $ 30)))))) 

(SDEFUN |SKSMP;*;3$;5| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPROG
         ((|ru| (|Upol|)) (|yu| (|Upol|)) (|xu| (|Upol|)) (|v| (|Var|))
          (#1=#:G134 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 34))
            (SPADCALL (SPADCALL |x| (QREFELT $ 35)) |y| (QREFELT $ 36)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 38)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) "failed") #1#)))
             (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 40)))
             (LETT |yu| (SPADCALL |y| |v| (QREFELT $ 40)))
             (LETT |ru|
                   (SPADCALL |xu| |yu|
                             (|SKSMP;lift_morphism|
                              (SPADCALL |v| (QREFELT $ 8)) $)
                             (|SKSMP;lift_map| (SPADCALL |v| (QREFELT $ 9)) $)
                             (QREFELT $ 42)))
             (EXIT (SPADCALL |ru| |v| (QREFELT $ 43))))))))) 

(SDEFUN |SKSMP;*;$R$;6| ((|x| ($)) (|r| (R)) ($ ($)))
        (SPADCALL |x| (SPADCALL |r| (QREFELT $ 45)) (QREFELT $ 44))) 

(SDEFUN |SKSMP;exquo;2$U;7| ((|x| ($)) (|y| ($)) ($ (|Union| $ "failed")))
        (SPROG
         ((|res| ($)) (|cc| ($)) (#1=#:G158 NIL)
          (|cu| (|Union| (|SparseMultivariatePolynomial| R |Var|) "failed"))
          (|lx| (|SparseMultivariatePolynomial| R |Var|)) (|lx1| ($))
          (|ly| (|SparseMultivariatePolynomial| R |Var|))
          (|maxd| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |y| (QREFELT $ 34))
             (SPADCALL |x| (SPADCALL |y| (QREFELT $ 35)) (QREFELT $ 47)))
            ((SPADCALL |x| (QREFELT $ 34)) (CONS 1 "failed"))
            ('T
             (SEQ (LETT |maxd| (SPADCALL |x| (QREFELT $ 48)))
                  (LETT |ly| (SPADCALL |y| (QREFELT $ 49)))
                  (LETT |res| (|spadConstant| $ 25))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |x| (|spadConstant| $ 25) (QREFELT $ 51)))
                         (GO G191)))
                       (SEQ (LETT |lx1| (SPADCALL |x| (QREFELT $ 49)))
                            (EXIT
                             (COND
                              ((> (SPADCALL |lx1| (QREFELT $ 48)) |maxd|)
                               (PROGN
                                (LETT #1# (CONS 1 "failed"))
                                (GO #2=#:G157)))
                              ('T
                               (SEQ (LETT |lx| |lx1|)
                                    (LETT |cu|
                                          (SPADCALL |lx| |ly| (QREFELT $ 52)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |cu| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #2#)))
                                      ('T
                                       (SEQ (LETT |cc| (QCDR |cu|))
                                            (LETT |res|
                                                  (SPADCALL |res| |cc|
                                                            (QREFELT $ 53)))
                                            (EXIT
                                             (LETT |x|
                                                   (SPADCALL |x|
                                                             (SPADCALL |cc| |y|
                                                                       (QREFELT
                                                                        $ 44))
                                                             (QREFELT $
                                                                      54)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |res|))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SKSMP;^;$Pi$;8| ((|x| ($)) (|n| (|PositiveInteger|)) ($ ($)))
        (SPROG ((|res| ($)) (#1=#:G163 NIL) (|i| NIL))
               (SEQ (LETT |res| |x|)
                    (SEQ (LETT |i| 2) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |res| |x| (QREFELT $ 44)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SKSMP;^;$Nni$;9| ((|x| ($)) (|n| (|NonNegativeInteger|)) ($ ($)))
        (COND ((EQL |n| 0) (|spadConstant| $ 10))
              ('T (SPADCALL |x| |n| (QREFELT $ 57))))) 

(SDEFUN |SKSMP;coerce;$Of;10| ((|x| ($)) ($ (|OutputForm|)))
        (SPROG ((|xu| (|Upol|)) (|v| (|Var|)) (#1=#:G166 NIL))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 34))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 60)))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 38)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) "failed")
                                           #1#)))
                   (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 40)))
                   (EXIT
                    (SPADCALL |xu|
                              (SPADCALL (SPADCALL 'D (QREFELT $ 61))
                                        (SPADCALL |v| (QREFELT $ 62))
                                        (QREFELT $ 63))
                              (QREFELT $ 64))))))))) 

(DECLAIM (NOTINLINE |SparseMultivariateSkewPolynomial;|)) 

(DEFUN |SparseMultivariateSkewPolynomial| (&REST #1=#:G191)
  (SPROG NIL
         (PROG (#2=#:G192)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseMultivariateSkewPolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseMultivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G187 NIL) (#2=#:G188 NIL) (#3=#:G189 NIL) (#4=#:G190 NIL)
    ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|SparseMultivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 91))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2# #3#)
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         #1#)
                                        (|HasSignature| |#2|
                                                        (LIST '|variable|
                                                              (LIST
                                                               (|devaluate|
                                                                |#2|)
                                                               '(|Symbol|))))))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#)
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      #4#)
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #4#
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #4#
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|)) #4#) #3#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #4#
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 68719476736))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|variable|
                            (LIST
                             (LIST '|Union| (|devaluate| |#2|)
                                   (|devaluate| "failed"))
                             '(|Symbol|))))
      (QSETREFV $ 18 (CONS (|dispatchFunction| |SKSMP;Delta;S$;2|) $))))
    (QSETREFV $ 19 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 20
              (|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| |#1| |#2|)))
    (QSETREFV $ 24
              (SPADCALL (LIST #'|SparseMultivariateSkewPolynomial!0|)
                        (QREFELT $ 23)))
    (QSETREFV $ 26
              (|SparseUnivariateSkewPolynomial| $ (QREFELT $ 24)
                                                (CONS
                                                 #'|SparseMultivariateSkewPolynomial!1|
                                                 $)))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV $ 55 (CONS (|dispatchFunction| |SKSMP;exquo;2$U;7|) $))))
    $))) 

(DEFUN |SparseMultivariateSkewPolynomial!1| (|x| $) (|spadConstant| $ 25)) 

(DEFUN |SparseMultivariateSkewPolynomial!0| (|x| $$) |x|) 

(MAKEPROP '|SparseMultivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (0 . |One|) (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|)
              |SKSMP;D;Var$;1| (|Union| $ '"failed") (|Symbol|)
              (15 . |variable|) (20 . |Delta|) '|Sup| '|Supp| (|Mapping| $$ $$)
              (|Automorphism| $$) (25 . |morphism|) '|id| (30 . |Zero|) '|Upol|
              (|Mapping| 6 6) (34 . |map|) (|Automorphism| 6) (40 . |elt|)
              (46 . |inv|) (51 . |morphism|) (|Boolean|) (57 . |ground?|)
              (62 . |retract|) (67 . *) (|Union| 7 '"failed")
              (73 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (78 . |univariate|) (|UnivariateSkewPolynomialCategoryOps| $$ 26)
              (84 . |times|) (92 . |multivariate|) |SKSMP;*;3$;5|
              (98 . |coerce|) |SKSMP;*;$R$;6| (103 . |exquo|)
              (109 . |totalDegree|) (114 . |leadingMonomial|) (119 . |Zero|)
              (123 . ~=) (129 . |exquo|) (135 . +) (141 . -) (147 . |exquo|)
              (|PositiveInteger|) |SKSMP;^;$Pi$;8| |SKSMP;^;$Nni$;9|
              (|OutputForm|) (153 . |coerce|) (158 . |coerce|) (163 . |coerce|)
              (168 . |sub|) (174 . |outputForm|) |SKSMP;coerce;$Of;10|
              (|Matrix| 70) (|Matrix| $)
              (|Record| (|:| |mat| 66) (|:| |vec| (|Vector| 70))) (|Vector| $)
              (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 70) (|IndexedExponents| 7)
              (|Record| (|:| |k| 73) (|:| |c| 6)) (|List| 74) (|Mapping| 6 73)
              (|Union| 72 '#1="failed") (|Union| 70 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 79) (|:| |vec| (|Vector| 6))) (|List| $)
              (|List| 7) (|List| 12) (|Mapping| 73 73) (|Union| 6 '#1#)
              (|List| 6) (|List| 73) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 180 |zero?| 186 |variables| 191 |unitNormal| 196
              |unitCanonical| 201 |unit?| 206 |totalDegreeSorted| 211
              |totalDegree| 217 |support| 228 |subtractIfCan| 233 |smaller?|
              239 |sample| 245 |rightRecip| 249 |rightPower| 254 |retractIfCan|
              266 |retract| 281 |reductum| 296 |reducedSystem| 301 |recip| 323
              |primitivePart| 328 |primitiveMonomials| 333 |pomopo!| 338
              |opposite?| 346 |one?| 352 |numberOfMonomials| 357 |monomials|
              362 |monomial?| 367 |monomial| 372 |minimumDegree| 392
              |mapExponents| 397 |map| 403 |mainVariable| 409 |listOfTerms| 414
              |linearExtend| 419 |leftRecip| 425 |leftPower| 430 |leadingTerm|
              442 |leadingSupport| 447 |leadingMonomial| 452
              |leadingCoefficient| 457 |latex| 462 |hashUpdate!| 467 |hash| 473
              |ground?| 478 |ground| 483 |fmecg| 488 |exquo| 496 |degree| 508
              |content| 525 |constructOrdered| 530 |construct| 535 |commutator|
              540 |coerce| 546 |coefficients| 571 |coefficient| 576
              |charthRoot| 596 |characteristic| 601 |binomThmExpt| 605
              |associator| 612 |associates?| 619 |antiCommutator| 625
              |annihilate?| 631 ^ 637 |Zero| 649 |One| 653 |Delta| 657 D 662 =
              667 / 673 - 679 + 690 * 696)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 0 1 2 3 4 7 0 7 5 0 0 1 8 6 0 0 0 1 6 6
                                  27 0 0 0 0 0 1 1 7 27 13 5 5 22 0 0 5 25 0 0
                                  0 12 0 0 9 10 0 0 0 6 4 9 10 11))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| NIL NIL |EntireRing&| NIL
                |FreeModuleCategory&| |Rng&| NIL NIL NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |MagmaWithUnit&| |AbelianMonoid&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|Algebra| 72)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|Ring|)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7)) (|Rng|)
                 (|SemiRing|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|Module| 72) (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 72 72)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 70) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 72) (|RightModule| 72)
                 (|NonAssociativeRng|) (|RightModule| 70) (|AbelianGroup|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|FullyRetractableTo| 6) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|RetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 72) (|RetractableTo| 70) (|CoercibleFrom| 6)
                 (|BasicType|) (|CoercibleTo| 59) (|unitsKnown|)
                 (|noZeroDivisors|) (|CoercibleFrom| 72) (|CoercibleFrom| 70)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 90
                                  '(0 0 0 10 0 6 0 11 3 0 0 0 7 12 13 1 7 15 16
                                    17 1 0 0 16 18 1 22 0 21 23 0 0 0 25 2 0 0
                                    27 0 28 2 29 6 0 6 30 1 29 0 0 31 2 22 0 21
                                    21 32 1 0 33 0 34 1 0 6 0 35 2 0 0 6 0 36 1
                                    0 37 0 38 2 5 39 0 7 40 4 41 26 26 26 22 21
                                    42 2 5 0 39 7 43 1 0 0 6 45 2 0 15 0 6 47 1
                                    0 12 0 48 1 0 0 0 49 0 6 0 50 2 0 33 0 0 51
                                    2 5 15 0 0 52 2 0 0 0 0 53 2 0 0 0 0 54 2 0
                                    15 0 0 55 1 6 59 0 60 1 16 59 0 61 1 7 59 0
                                    62 2 59 0 0 0 63 2 26 59 0 59 64 2 0 33 0 0
                                    51 1 37 33 0 1 1 0 82 0 1 1 31 71 0 1 1 31
                                    0 0 1 1 31 33 0 1 2 0 12 0 82 1 2 0 12 0 82
                                    1 1 0 12 0 48 1 0 87 0 1 2 36 15 0 0 1 2 12
                                    33 0 0 1 0 37 0 1 1 33 15 0 1 2 33 0 0 12 1
                                    2 0 0 0 56 1 1 9 77 0 1 1 10 78 0 1 1 0 85
                                    0 1 1 9 72 0 1 1 10 70 0 1 1 0 6 0 35 1 14
                                    0 0 1 1 26 66 67 1 2 26 68 67 69 1 1 6 79
                                    67 1 2 6 80 67 69 1 1 33 15 0 1 1 18 0 0 1
                                    1 5 81 0 1 4 0 0 0 6 73 0 1 2 37 33 0 0 1 1
                                    33 33 0 1 1 0 12 0 1 1 0 81 0 1 1 0 33 0 1
                                    3 0 0 0 82 83 1 3 0 0 0 7 12 13 2 0 0 6 73
                                    1 1 0 73 0 1 2 0 0 84 0 1 2 0 0 27 0 28 1 0
                                    37 0 38 1 0 75 0 1 2 8 6 76 0 1 1 33 15 0 1
                                    2 33 0 0 12 1 2 0 0 0 56 1 1 14 74 0 1 1 14
                                    73 0 1 1 14 0 0 49 1 14 6 0 1 1 0 89 0 1 2
                                    0 88 88 0 1 1 0 90 0 1 1 0 33 0 34 1 0 6 0
                                    1 4 6 0 0 73 6 0 1 2 31 15 0 0 55 2 4 15 0
                                    6 47 2 0 83 0 82 1 2 0 12 0 7 1 1 0 73 0 1
                                    1 18 6 0 1 1 14 0 75 1 1 0 0 75 1 2 34 0 0
                                    0 1 1 32 0 70 1 1 29 0 0 1 1 17 0 72 1 1 0
                                    0 6 45 1 0 59 0 65 1 0 86 0 1 3 0 0 0 82 83
                                    1 3 0 0 0 7 12 1 2 0 6 0 73 1 1 2 15 0 1 0
                                    34 12 1 3 30 0 0 0 12 1 3 34 0 0 0 0 1 2 31
                                    33 0 0 1 2 0 0 0 0 1 2 34 33 0 0 1 2 33 0 0
                                    12 58 2 0 0 0 56 57 0 37 0 25 0 33 0 10 1
                                    28 0 16 18 1 0 0 7 14 2 0 33 0 0 1 2 15 0 0
                                    6 1 1 35 0 0 1 2 35 0 0 0 54 2 0 0 0 0 53 2
                                    26 0 0 70 1 2 35 0 70 0 1 2 37 0 12 0 1 2 1
                                    0 72 0 1 2 1 0 0 72 1 2 0 0 0 6 46 2 0 0 6
                                    0 36 2 0 0 0 0 44 2 0 0 56 0 1)))))
           '|lookupComplete|)) 
