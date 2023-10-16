
(SDEFUN |SAE;size;Nni;1| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 39)) (QREFELT $ 17))) 

(SDEFUN |SAE;random;$;2| (($ $))
        (SPROG ((#1=#:G119 NIL) (|i| NIL) (#2=#:G118 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21))))
                  (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT $ 41)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  #2#)
                 (QREFELT $ 43))))) 

(SDEFUN |SAE;Zero;$;3| (($ $)) (|spadConstant| $ 45)) 

(SDEFUN |SAE;One;$;4| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |SAE;*;R2$;5| ((|c| R) (|x| $) ($ $)) (SPADCALL |c| |x| (QREFELT $ 47))) 

(SDEFUN |SAE;*;I2$;6| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 50))) 

(SDEFUN |SAE;coerce;I$;7| ((|n| |Integer|) ($ $)) (SPADCALL |n| (QREFELT $ 52))) 

(SDEFUN |SAE;coerce;R$;8| ((|c| R) ($ $)) (SPADCALL |c| 0 (QREFELT $ 37))) 

(SDEFUN |SAE;coerce;$Of;9| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 56))) 

(PUT '|SAE;lift;$UP;10| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SAE;lift;$UP;10| ((|x| $) ($ UP)) |x|) 

(SDEFUN |SAE;reduce;UP$;11| ((|p| UP) ($ $))
        (QCDR (SPADCALL |p| (QREFELT $ 8) (QREFELT $ 60)))) 

(SDEFUN |SAE;=;2$B;12| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |SAE;hashUpdate!;Hs$Hs;13| ((|s| . #1=(|HashState|)) (|x| $) ($ . #1#))
        (SPADCALL |s| |x| (QREFELT $ 65))) 

(SDEFUN |SAE;+;3$;14| ((|x| $) (|y| $) ($ $)) (SPADCALL |x| |y| (QREFELT $ 67))) 

(SDEFUN |SAE;-;2$;15| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 69))) 

(SDEFUN |SAE;*;3$;16| ((|x| $) (|y| $) ($ $))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 71)) (QREFELT $ 61))) 

(SDEFUN |SAE;coordinates;$V;17| ((|x| $) ($ |Vector| R))
        (SPROG ((#1=#:G138 NIL) (|i| NIL) (#2=#:G137 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21))))
                 (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 58)) |i|
                                          (QREFELT $ 73)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 #2#)))) 

(SDEFUN |SAE;represents;V$;18| ((|vect| |Vector| R) ($ $))
        (SPROG
         ((#1=#:G140 NIL) (#2=#:G139 ($)) (#3=#:G141 ($)) (#4=#:G143 NIL)
          (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |i| 0) (LETT #4# (QREFELT $ 21)) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT $ 75))
                                   |i| (QREFELT $ 37)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 68))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 30))))))) 

(SDEFUN |SAE;definingPolynomial;UP;19| (($ UP)) (QREFELT $ 8)) 

(SDEFUN |SAE;characteristic;Nni;20| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 77))) 

(SDEFUN |SAE;rank;Pi;21| (($ |PositiveInteger|))
        (SPROG ((#1=#:G146 NIL))
               (PROG1 (LETT #1# (QREFELT $ 17))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |SAE;basis;V;22| (($ |Vector| $))
        (SPADCALL (QREFELT $ 38) (QREFELT $ 82))) 

(SDEFUN |SAE;minimalPolynomial;$UP;23| ((|x| $) ($ UP))
        (SPADCALL (SPADCALL |x| (QREFELT $ 85)) (QREFELT $ 86))) 

(SDEFUN |SAE;coordinates;$VV;24| ((|x| $) (|bas| |Vector| $) ($ |Vector| R))
        (SPROG ((|m| (|Union| (|Matrix| R) "failed")))
               (SEQ
                (LETT |m|
                      (SPADCALL
                       (SPADCALL (SPADCALL |bas| (QREFELT $ 88))
                                 (QREFELT $ 89))
                       (QREFELT $ 90)))
                (EXIT
                 (COND
                  ((QEQCAR |m| 1)
                   (|error| "coordinates: second argument must be a basis"))
                  ('T
                   (SPADCALL (QCDR |m|) (SPADCALL |x| (QREFELT $ 74))
                             (QREFELT $ 91)))))))) 

(SDEFUN |SAE;coordinates;$VV;25| ((|x| $) (|bas| |Vector| $) ($ |Vector| R))
        (SPROG
         ((|xi| (|qf|)) (#1=#:G163 NIL) (|i| NIL) (|vec| (|Vector| R))
          (|vecQF| (|Vector| |qf|)) (|coordsQF| (|Vector| |qf|))
          (|m| (|Union| (|Matrix| |qf|) #2="failed")) (|mat| (|Matrix| R))
          (|imatqf|
           (CATEGORY |package|
            (SIGNATURE |rowEchelon| (#3=(|Matrix| |qf|) #4=(|Matrix| R)))
            (SIGNATURE |inverse| ((|Union| #3# "failed") #4#))
            (IF (|has| (|Vector| |qf|) (|shallowlyMutable|))
                (SIGNATURE |nullSpace| ((|List| (|Vector| R)) #4#))
                |noBranch|)))
          (|qf|
           (|Join| (|QuotientFieldCategory| R)
                   (CATEGORY |domain|
                    (IF (|has| R (|IntegerNumberSystem|))
                        (IF (|has| R (|OpenMath|))
                            (ATTRIBUTE (|OpenMath|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|Canonical|))
                        (IF (|has| R (|GcdDomain|))
                            (IF (|has| R (|canonicalUnitNormal|))
                                (ATTRIBUTE (|Canonical|))
                                |noBranch|)
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|UniqueFactorizationDomain|))
                        (SIGNATURE |factorFraction|
                         ((|Fraction| (|Factored| R)) $))
                        |noBranch|)))))
         (SEQ (LETT |qf| (|Fraction| (QREFELT $ 6)))
              (LETT |imatqf|
                    (|InnerMatrixQuotientFieldFunctions| (QREFELT $ 6)
                                                         (|Vector|
                                                          (QREFELT $ 6))
                                                         (|Vector|
                                                          (QREFELT $ 6))
                                                         (|Matrix|
                                                          (QREFELT $ 6))
                                                         |qf| (|Vector| |qf|)
                                                         (|Vector| |qf|)
                                                         (|Matrix| |qf|)))
              (LETT |mat|
                    (SPADCALL (SPADCALL |bas| (QREFELT $ 88)) (QREFELT $ 89)))
              (LETT |m|
                    (SPADCALL |mat|
                              (|compiledLookupCheck| '|inverse|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|Matrix|
                                                                  (|devaluate|
                                                                   |qf|))
                                                            '#2#)
                                                      (LIST '|Matrix|
                                                            (|devaluate|
                                                             (ELT $ 6))))
                                                     |imatqf|)))
              (EXIT
               (COND
                ((QEQCAR |m| 1)
                 (|error| "coordinates: second argument must be a basis"))
                ('T
                 (SEQ
                  (LETT |coordsQF|
                        (SPADCALL
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '$
                                                      (|devaluate| (ELT $ 6)))
                                                |qf|)
                         (SPADCALL |x| (QREFELT $ 74))
                         (|compiledLookupCheck| '|map|
                                                (LIST
                                                 (LIST '|Vector|
                                                       (|devaluate| |qf|))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |qf|)
                                                       (|devaluate| (ELT $ 6)))
                                                 (LIST '|Vector|
                                                       (|devaluate|
                                                        (ELT $ 6))))
                                                (|VectorFunctions2| (ELT $ 6)
                                                                    |qf|))))
                  (LETT |vecQF|
                        (SPADCALL (QCDR |m|) |coordsQF|
                                  (|compiledLookupCheck| '*
                                                         (LIST
                                                          (LIST '|Vector|
                                                                (|devaluate|
                                                                 |qf|))
                                                          '$
                                                          (LIST '|Vector|
                                                                (|devaluate|
                                                                 |qf|)))
                                                         (|Matrix| |qf|))))
                  (LETT |vec| (MAKEARR1 (QREFELT $ 17) (|spadConstant| $ 31)))
                  (SEQ (LETT |i| 1) (LETT #1# (QREFELT $ 17)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |xi| (QAREF1O |vecQF| |i| 1))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (SPADCALL |xi|
                                          (|compiledLookupCheck| '|denom|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT $ 6))
                                                                  '$)
                                                                 |qf|))
                                (|spadConstant| $ 36) (QREFELT $ 93))
                               (QSETAREF1O |vec| |i|
                                           (SPADCALL |xi|
                                                     (|compiledLookupCheck|
                                                      '|numer|
                                                      (LIST
                                                       (|devaluate| (ELT $ 6))
                                                       '$)
                                                      |qf|))
                                           1))
                              ('T
                               (|error|
                                "coordinates: coordinates are not integral over ground ring")))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |vec|)))))))) 

(SDEFUN |SAE;reducedSystem;MM;26| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 98)) (QREFELT $ 100))) 

(SDEFUN |SAE;reducedSystem;MVR;27|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 98))
                  (SPADCALL (ELT $ 58) |v| (QREFELT $ 104)) (QREFELT $ 106))) 

(SDEFUN |SAE;discriminant;R;28| (($ R))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 35) (QREFELT $ 108)) (|SAE;mkDisc| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 34) (QREFELT $ 109))))) 

(SDEFUN |SAE;mkDisc| ((|b| |Boolean|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 35) |b| (QREFELT $ 111))
             (SPADCALL (QREFELT $ 34) (SPADCALL (QREFELT $ 8) (QREFELT $ 112))
                       (QREFELT $ 113))
             (EXIT (SPADCALL (QREFELT $ 115))))) 

(SDEFUN |SAE;traceMatrix;M;30| (($ |Matrix| R))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 28) (QREFELT $ 108)) (|SAE;mkDiscMat| NIL $)))
         (EXIT (QREFELT $ 24)))) 

(SDEFUN |SAE;mkDiscMat| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G181 NIL) (|j| NIL) (#2=#:G180 NIL) (|i| NIL)
          (|mc| (|Integer|)) (|mr| (|Integer|)))
         (SEQ (SPADCALL (QREFELT $ 28) |b| (QREFELT $ 111))
              (LETT |mr| (PROGN (QREFELT $ 24) 1))
              (LETT |mc| (PROGN (QREFELT $ 24) 1))
              (SEQ (LETT |i| 0) (LETT #2# (QREFELT $ 21)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (QREFELT $ 21)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O (QREFELT $ 24) (+ |mr| |i|)
                                        (+ |mc| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 36)
                                                    (+ |i| |j|)
                                                    (QREFELT $ 117))
                                          (QREFELT $ 61))
                                         (QREFELT $ 118))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 115)))))) 

(SDEFUN |SAE;trace;$R;32| ((|x| $) ($ R))
        (SPROG ((|ans| (R)) (|xn| ($)) (#1=#:G186 NIL) (|n| NIL))
               (SEQ (LETT |xn| |x|)
                    (LETT |ans|
                          (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) 0
                                    (QREFELT $ 73)))
                    (SEQ (LETT |n| 1) (LETT #1# (QREFELT $ 21)) G190
                         (COND ((|greater_SI| |n| #1#) (GO G191)))
                         (SEQ
                          (LETT |xn|
                                (SPADCALL (SPADCALL (QREFELT $ 119)) |xn|
                                          (QREFELT $ 72)))
                          (EXIT
                           (LETT |ans|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) |n|
                                            (QREFELT $ 73))
                                  |ans| (QREFELT $ 120)))))
                         (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |SAE;fac1| ((|up| UP) ($ |Factored| UP))
        (SPROG ((|f1| (|Factored| (|SparseUnivariatePolynomial| R))))
               (SEQ
                (LETT |f1|
                      (SPADCALL (SPADCALL |up| (QREFELT $ 122))
                                (QREFELT $ 125)))
                (EXIT (SPADCALL (ELT $ 126) |f1| (QREFELT $ 131)))))) 

(SDEFUN |SAE;factorPolynomial;SupF;34|
        ((|up| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |up| (CONS (|function| |SAE;fac1|) $) (QREFELT $ 136))) 

(SDEFUN |SAE;index;Pi$;35| ((|k| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|a| (R)) (#1=#:G193 NIL)
          (|h| (|Integer|)) (|j| NIL) (|p| (|Integer|)))
         (SEQ (LETT |i| (REM |k| (SPADCALL (QREFELT $ 40))))
              (LETT |p| (SPADCALL (QREFELT $ 39)))
              (LETT |ans| (|spadConstant| $ 30))
              (SEQ (LETT |j| 0) G190 (COND ((NULL (> |i| 0)) (GO G191)))
                   (SEQ (LETT |h| (REM |i| |p|))
                        (COND
                         ((SPADCALL |h| 0 (QREFELT $ 138))
                          (SEQ
                           (LETT |a|
                                 (SPADCALL
                                  (PROG1 (LETT #1# |h|)
                                    (|check_subtype2| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 139)))
                           (EXIT
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL
                                             (SPADCALL |a| |j| (QREFELT $ 117))
                                             (QREFELT $ 61))
                                            (QREFELT $ 68)))))))
                        (EXIT (LETT |i| (QUOTIENT2 |i| |p|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |SAE;lookup;$Pi;36| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|co| (|Integer|)) (|n| (|NonNegativeInteger|)) (|p| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 141)) (SPADCALL (QREFELT $ 40)))
                (#1='T
                 (SEQ (LETT |p| (SPADCALL (QREFELT $ 39)))
                      (LETT |co|
                            (SPADCALL (SPADCALL |z| (QREFELT $ 142))
                                      (QREFELT $ 143)))
                      (LETT |n| (SPADCALL |z| (QREFELT $ 16)))
                      (SEQ G190
                           (COND
                            ((NULL
                              (NULL
                               (SPADCALL
                                (LETT |z| (SPADCALL |z| (QREFELT $ 144)))
                                (QREFELT $ 141))))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |co|
                                   (+
                                    (* |co|
                                       (EXPT |p|
                                             (- |n|
                                                (LETT |n|
                                                      (SPADCALL |z|
                                                                (QREFELT $
                                                                         16))))))
                                    (SPADCALL (SPADCALL |z| (QREFELT $ 142))
                                              (QREFELT $ 143))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |n| 0) |co|)
                             (#1# (* |co| (EXPT |p| |n|))))))))))) 

(DECLAIM (NOTINLINE |SimpleAlgebraicExtension;|)) 

(DEFUN |SimpleAlgebraicExtension| (&REST #1=#:G248)
  (SPROG NIL
         (PROG (#2=#:G249)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SimpleAlgebraicExtension|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SimpleAlgebraicExtension;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SimpleAlgebraicExtension|)))))))))) 

(DEFUN |SimpleAlgebraicExtension;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G247 NIL) (|i| NIL) (#2=#:G246 NIL) (#3=#:G112 NIL) (#4=#:G109 NIL)
    (|pv$| NIL) (#5=#:G243 NIL) (#6=#:G244 NIL) (#7=#:G245 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT DV$3 (|devaluate| |#3|))
     (LETT |dv$| (LIST '|SimpleAlgebraicExtension| DV$1 DV$2 DV$3))
     (LETT $ (GETREFV 178))
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         (LETT #7#
                                               (|HasCategory| |#1| '(|Field|)))
                                         (OR #7#
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1| '(|Finite|))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|DifferentialRing|))
                                           #7#)
                                          (|HasCategory| |#1|
                                                         '(|FiniteFieldCategory|)))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (LETT #6#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#1|
                                                               '(|Field|))))
                                         (OR #6#
                                             (AND
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #7#)
                                         (LETT #5#
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                         (OR (AND #7# #5#)
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|)))))))
     (|haddProp| |$ConstructorCache| '|SimpleAlgebraicExtension|
                 (LIST DV$1 DV$2 DV$3) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (AND
      (OR (AND #7# #5# (|HasCategory| $ '(|CharacteristicNonZero|)))
          (AND (|HasCategory| |#1| '(|FiniteFieldCategory|))
               (|HasCategory| $ '(|CharacteristicNonZero|))))
      (|augmentPredVector| $ 32768))
     (AND
      (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
          (AND #7# #5# (|HasCategory| $ '(|CharacteristicNonZero|))))
      (|augmentPredVector| $ 65536))
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 12 (SPADCALL (SPADCALL |#3| (QREFELT $ 9)) (QREFELT $ 11)))
     (COND
      ((QEQCAR (QREFELT $ 12) 1) (|error| "Modulus cannot be made monic")))
     (QSETREFV $ 13 |#2|)
     (SETELT $ 8
             (SPADCALL
              (PROG2 (LETT #4# #8=(QREFELT $ 12))
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 0) #8# (|Union| #8# #9="failed")
                                #4#))
              |#3| (QREFELT $ 14)))
     (QSETREFV $ 17 (SPADCALL |#3| (QREFELT $ 16)))
     (QSETREFV $ 21
               (PROG2 (LETT #3# (SPADCALL (QREFELT $ 17) 1 (QREFELT $ 20)))
                   (QCDR #3#)
                 (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                 (|Union| (|NonNegativeInteger|) #9#) #3#)))
     (QSETREFV $ 24 (SPADCALL (QREFELT $ 17) (QREFELT $ 17) (QREFELT $ 23)))
     (QSETREFV $ 28 (SPADCALL 'T (QREFELT $ 27)))
     (QSETREFV $ 34 (SPADCALL (|spadConstant| $ 31) (QREFELT $ 33)))
     (QSETREFV $ 35 (SPADCALL 'T (QREFELT $ 27)))
     (QSETREFV $ 38
               (PROGN
                (LETT #2# (GETREFV (|inc_SI| #10=(QREFELT $ 21))))
                (SEQ (LETT |i| 0) (LETT #1# #10#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #2# |i|
                               (SPADCALL (|spadConstant| $ 36) |i|
                                         (QREFELT $ 37)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                #2#))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 40 (CONS (|dispatchFunction| |SAE;size;Nni;1|) $))
        (QSETREFV $ 44 (CONS (|dispatchFunction| |SAE;random;$;2|) $)))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV $ 87
                 (CONS (|dispatchFunction| |SAE;minimalPolynomial;$UP;23|)
                       $))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV $ 92 (CONS (|dispatchFunction| |SAE;coordinates;$VV;24|) $)))
      ((|HasCategory| |#1| '(|IntegralDomain|))
       (QSETREFV $ 92 (CONS (|dispatchFunction| |SAE;coordinates;$VV;25|) $))))
     (COND
      ((|testBitVector| |pv$| 3)
       (COND
        ((|testBitVector| |pv$| 14)
         (PROGN
          (QSETREFV $ 137
                    (CONS (|dispatchFunction| |SAE;factorPolynomial;SupF;34|)
                          $)))))))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 140 (CONS (|dispatchFunction| |SAE;index;Pi$;35|) $))
        (QSETREFV $ 145 (CONS (|dispatchFunction| |SAE;lookup;$Pi;36|) $)))))
     $)))) 

(MAKEPROP '|SimpleAlgebraicExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |leadingCoefficient|) (|Union| $ '"failed")
              (5 . |recip|) '|r| '|Rep| (10 . *) (|NonNegativeInteger|)
              (16 . |degree|) '|d| (21 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SAE;One;$;4|) $))
              (25 . |subtractIfCan|) '|d1| (|Matrix| 6) (31 . |zero|)
              '|discmat| (|Boolean|) (|Reference| 25) (37 . |ref|)
              '|nodiscmat?| (42 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SAE;Zero;$;3|) $))
              (46 . |Zero|) (|Reference| 6) (50 . |ref|) '|disc| '|nodisc?|
              (55 . |One|) (59 . |monomial|) '|bsis| (65 . |size|)
              (69 . |size|) (73 . |random|) (|Vector| 6) |SAE;represents;V$;18|
              (77 . |random|) (81 . |Zero|) (85 . |One|) (89 . *) |SAE;*;R2$;5|
              (|Integer|) (95 . *) |SAE;*;I2$;6| (101 . |coerce|)
              |SAE;coerce;I$;7| |SAE;coerce;R$;8| (|OutputForm|)
              (106 . |coerce|) |SAE;coerce;$Of;9| |SAE;lift;$UP;10|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (111 . |monicDivide|) |SAE;reduce;UP$;11| (117 . =)
              |SAE;=;2$B;12| (|HashState|) (123 . |hashUpdate!|)
              |SAE;hashUpdate!;Hs$Hs;13| (129 . +) |SAE;+;3$;14| (135 . -)
              |SAE;-;2$;15| (140 . *) |SAE;*;3$;16| (146 . |coefficient|)
              |SAE;coordinates;$V;17| (152 . |elt|)
              |SAE;definingPolynomial;UP;19| (158 . |characteristic|)
              |SAE;characteristic;Nni;20| (|PositiveInteger|) |SAE;rank;Pi;21|
              (|Vector| $$) (162 . |copy|) (|Vector| $) |SAE;basis;V;22|
              (167 . |characteristicPolynomial|) (172 . |squareFreePart|)
              (177 . |minimalPolynomial|) (182 . |coordinates|)
              (187 . |transpose|) (192 . |inverse|) (197 . *)
              (203 . |coordinates|) (209 . =) (|Matrix| 7) (|Mapping| 7 $$)
              (|Matrix| $$)
              (|MatrixCategoryFunctions2| $$ 81 81 96 7 102 102 94)
              (215 . |map|) (|Matrix| $) (221 . |reducedSystem|)
              |SAE;reducedSystem;MM;26| (|Vector| 7) (|VectorFunctions2| $$ 7)
              (226 . |map|) (|Record| (|:| |mat| 22) (|:| |vec| 42))
              (232 . |reducedSystem|) |SAE;reducedSystem;MVR;27| (238 . |elt|)
              (243 . |elt|) |SAE;discriminant;R;28| (248 . |setelt!|)
              (254 . |discriminant|) (259 . |setelt!|) (|Void|) (265 . |void|)
              |SAE;traceMatrix;M;30| (269 . |monomial|) |SAE;trace;$R;32|
              (275 . |generator|) (279 . +) (|SparseUnivariatePolynomial| 6)
              (285 . |makeSUP|) (|Factored| 124)
              (|SparseUnivariatePolynomial| $) (290 . |factorPolynomial|)
              (295 . |unmakeSUP|) (|Factored| 7) (|Mapping| 7 121)
              (|Factored| 121) (|FactoredFunctions2| 121 7) (300 . |map|)
              (|Factored| 133) (|SparseUnivariatePolynomial| $$)
              (|Mapping| 127 7) (|InnerAlgFactor| 6 7 $$ 133) (306 . |factor|)
              (312 . |factorPolynomial|) (317 . ~=) (323 . |index|)
              (328 . |index|) (333 . |zero?|) (338 . |leadingCoefficient|)
              (343 . |lookup|) (348 . |reductum|) (353 . |lookup|) (|List| 148)
              (|List| 15) (|Symbol|) (|Union| 83 '#1="failed")
              (|Union| 151 '#1#) (|List| 124) (|Fraction| 49) (|Factored| $)
              (|List| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| 154 '"failed")
              (|Record| (|:| |coef| 154) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 159 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Mapping| 6 6) (|Fraction| 7) (|InputForm|)
              (|OnePointCompletion| 79) (|Union| 15 '"failed")
              (|Record| (|:| |factor| 49) (|:| |exponent| 15)) (|List| 167)
              (|Table| 79 15)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |mat| 172) (|:| |vec| (|Vector| 49)))
              (|Matrix| 49) (|Union| 152 '#2="failed") (|Union| 49 '#2#)
              (|Union| 6 '#2#) (|String|) (|SingleInteger|))
           '#(~= 358 |zero?| 364 |unitNormal| 369 |unitCanonical| 374 |unit?|
              379 |traceMatrix| 384 |trace| 393 |tableForDiscreteLogarithm| 398
              |subtractIfCan| 403 |squareFreePolynomial| 409 |squareFreePart|
              414 |squareFree| 419 |solveLinearPolynomialEquation| 424
              |smaller?| 430 |sizeLess?| 436 |size| 442 |sample| 446
              |rightRecip| 450 |rightPower| 455 |retractIfCan| 467 |retract|
              482 |represents| 497 |representationType| 508 |rem| 512
              |regularRepresentation| 518 |reducedSystem| 529 |reduce| 551
              |recip| 561 |rank| 566 |random| 570 |quo| 574 |principalIdeal|
              580 |primitiveElement| 585 |primitive?| 589 |primeFrobenius| 594
              |prime?| 605 |order| 610 |opposite?| 620 |one?| 626 |norm| 631
              |nextItem| 636 |multiEuclidean| 641 |minimalPolynomial| 647
              |lookup| 652 |lift| 657 |leftRecip| 662 |leftPower| 667 |lcmCoef|
              679 |lcm| 685 |latex| 696 |inv| 701 |init| 706 |index| 710
              |hashUpdate!| 715 |hash| 721 |generator| 726 |gcdPolynomial| 730
              |gcd| 736 |factorsOfCyclicGroupSize| 747
              |factorSquareFreePolynomial| 751 |factorPolynomial| 756 |factor|
              761 |extendedEuclidean| 766 |exquo| 779 |expressIdealMember| 785
              |euclideanSize| 791 |enumerate| 796 |divide| 800 |discriminant|
              806 |discreteLog| 815 |differentiate| 826 |derivationCoordinates|
              876 |definingPolynomial| 882 |createPrimitiveElement| 886
              |coordinates| 890 |convert| 912 |conditionP| 937 |commutator| 942
              |coerce| 948 |charthRoot| 973 |characteristicPolynomial| 983
              |characteristic| 988 |basis| 992 |associator| 996 |associates?|
              1003 |antiCommutator| 1009 |annihilate?| 1015 ^ 1021 |Zero| 1039
              |One| 1043 D 1047 = 1097 / 1103 - 1109 + 1120 * 1126)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 2 2 4 4 15 4 4 4 0 4 0 0 0 3 3 3 0 0 0 1 3
                                  3 5 7 12 10 0 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0 0
                                  3 3 0 0 0 0 0 0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0
                                  0 3 3 3 6 8 9))
            (CONS
             '#(|MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| |FramedAlgebra&| NIL
                |FiniteRankAlgebra&| |FullyLinearlyExplicitOver&| NIL NIL
                |DivisionRing&| |DifferentialExtension&| |Algebra&| NIL
                |Algebra&| NIL |EntireRing&| |Algebra&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| NIL |Module&| NIL |FramedModule&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&| |Magma&|
                |AbelianSemiGroup&| NIL NIL |FullyRetractableTo&| NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|MonogenicAlgebra| 6 7) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| 6 7) (|IntegralDomain|)
                 (|FiniteRankAlgebra| 6 7) (|FullyLinearlyExplicitOver| 6)
                 (|CommutativeRing|) (|LeftOreRing|) (|DivisionRing|)
                 (|DifferentialExtension| 6) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|Algebra| $$)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 152)
                 (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 148) (|LinearlyExplicitOver| 49)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| $$) (|Module| 6)
                 (|SemiRng|) (|Module| 152) (|BiModule| $$ $$)
                 (|FramedModule| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| 152 152) (|LeftModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| 152) (|RightModule| 152) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|CommutativeStar|) (|SetCategory|)
                 (|RetractableTo| 6) (|ConvertibleTo| 7) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 55)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|ConvertibleTo| 164)
                 (|RetractableTo| 152) (|RetractableTo| 49))
              (|makeByteWordVec2| 177
                                  '(1 7 6 0 9 1 6 10 0 11 2 7 0 6 0 14 1 13 15
                                    0 16 0 7 0 18 2 15 10 0 0 20 2 22 0 15 15
                                    23 1 26 0 25 27 0 7 0 29 0 6 0 31 1 32 0 6
                                    33 0 6 0 36 2 13 0 6 15 37 0 6 15 39 0 0 15
                                    40 0 6 0 41 0 0 0 44 0 13 0 45 0 13 0 46 2
                                    13 0 6 0 47 2 13 0 49 0 50 1 13 0 49 52 1
                                    13 55 0 56 2 13 59 0 0 60 2 13 25 0 0 62 2
                                    13 64 64 0 65 2 13 0 0 0 67 1 13 0 0 69 2
                                    13 0 0 0 71 2 7 6 0 15 73 2 42 6 0 49 75 0
                                    6 15 77 1 81 0 0 82 1 0 7 0 85 1 7 0 0 86 1
                                    0 7 0 87 1 0 22 83 88 1 22 0 0 89 1 22 10 0
                                    90 2 22 42 0 42 91 2 0 42 0 83 92 2 6 25 0
                                    0 93 2 97 94 95 96 98 1 7 22 99 100 2 103
                                    102 95 81 104 2 7 105 99 83 106 1 26 25 0
                                    108 1 32 6 0 109 2 26 25 0 25 111 1 13 6 0
                                    112 2 32 6 0 6 113 0 114 0 115 2 7 0 6 15
                                    117 0 0 0 119 2 6 0 0 0 120 1 7 121 0 122 1
                                    6 123 124 125 1 7 0 121 126 2 130 127 128
                                    129 131 2 135 132 133 134 136 1 0 123 124
                                    137 2 49 25 0 0 138 1 6 0 79 139 1 0 0 79
                                    140 1 0 25 0 141 1 13 6 0 142 1 6 79 0 143
                                    1 13 0 0 144 1 0 79 0 145 2 0 25 0 0 1 1 0
                                    25 0 141 1 3 156 0 1 1 3 0 0 1 1 3 25 0 1 0
                                    0 22 116 1 0 22 83 1 1 0 6 0 118 1 2 169 49
                                    1 2 0 10 0 0 1 1 15 123 124 1 1 3 0 0 1 1 3
                                    153 0 1 2 15 150 151 124 1 2 6 25 0 0 1 2 3
                                    25 0 0 1 0 6 15 40 0 0 0 1 1 0 10 0 1 2 0 0
                                    0 15 1 2 0 0 0 79 1 1 8 173 0 1 1 9 174 0 1
                                    1 0 175 0 1 1 8 152 0 1 1 9 49 0 1 1 0 6 0
                                    1 1 0 0 42 43 2 0 0 42 83 1 0 2 170 1 2 3 0
                                    0 0 1 1 0 22 0 1 2 0 22 0 83 1 2 10 171 99
                                    83 1 1 10 172 99 1 1 0 22 99 101 2 0 105 99
                                    83 107 1 3 10 163 1 1 0 0 7 61 1 0 10 0 1 0
                                    0 79 80 0 6 0 44 2 3 0 0 0 1 1 3 158 154 1
                                    0 2 0 1 1 2 25 0 1 2 2 0 0 15 1 1 2 0 0 1 1
                                    3 25 0 1 1 2 165 0 1 1 2 79 0 1 2 0 25 0 0
                                    1 1 0 25 0 1 1 0 6 0 1 1 2 10 0 1 2 3 157
                                    154 0 1 1 3 7 0 87 1 6 79 0 145 1 0 7 0 58
                                    1 0 10 0 1 2 0 0 0 15 1 2 0 0 0 79 1 2 3
                                    155 0 0 1 1 3 0 154 1 2 3 0 0 0 1 1 0 176 0
                                    1 1 3 0 0 1 0 2 0 1 1 6 0 79 140 2 0 64 64
                                    0 66 1 0 177 0 1 0 0 0 119 2 3 124 124 124
                                    1 1 3 0 154 1 2 3 0 0 0 1 0 2 168 1 1 15
                                    123 124 1 1 15 123 124 137 1 3 153 0 1 3 3
                                    160 0 0 0 1 2 3 161 0 0 1 2 3 10 0 0 1 2 3
                                    157 154 0 1 1 3 15 0 1 0 6 154 1 2 3 59 0 0
                                    1 0 0 6 110 1 0 6 83 1 2 2 166 0 0 1 1 2 15
                                    0 1 3 11 0 0 148 15 1 3 11 0 0 146 147 1 2
                                    11 0 0 148 1 2 11 0 0 146 1 2 7 0 0 15 1 1
                                    7 0 0 1 2 3 0 0 162 1 3 3 0 0 162 15 1 2 3
                                    22 83 162 1 0 0 7 76 0 2 0 1 1 0 42 0 74 1
                                    0 22 83 88 2 0 22 83 83 1 2 0 42 0 83 92 1
                                    6 164 0 1 1 0 0 7 1 1 0 7 0 1 1 0 42 0 1 1
                                    0 0 42 1 1 16 149 99 1 2 0 0 0 0 1 1 13 0
                                    152 1 1 0 0 0 1 1 0 0 6 54 1 0 0 49 53 1 0
                                    55 0 57 1 17 10 0 1 1 2 0 0 1 1 0 7 0 85 0
                                    0 15 78 0 0 83 84 3 0 0 0 0 0 1 2 3 25 0 0
                                    1 2 0 0 0 0 1 2 0 25 0 0 1 2 3 0 0 49 1 2 0
                                    0 0 15 1 2 0 0 0 79 1 0 0 0 30 0 0 0 19 3
                                    11 0 0 146 147 1 2 11 0 0 146 1 3 11 0 0
                                    148 15 1 2 11 0 0 148 1 2 7 0 0 15 1 1 7 0
                                    0 1 2 3 0 0 162 1 3 3 0 0 162 15 1 2 0 25 0
                                    0 63 2 3 0 0 0 1 1 0 0 0 70 2 0 0 0 0 1 2 0
                                    0 0 0 68 2 3 0 152 0 1 2 3 0 0 152 1 2 0 0
                                    6 0 48 2 0 0 0 6 1 2 0 0 15 0 1 2 0 0 49 0
                                    51 2 0 0 0 0 72 2 0 0 79 0 1)))))
           '|lookupComplete|)) 
