
(SDEFUN |SAE;size;Nni;1| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 39)) (QREFELT $ 17))) 

(SDEFUN |SAE;random;$;2| (($ $))
        (SPROG ((#1=#:G119 NIL) (|i| NIL) (#2=#:G118 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21)))
                        . #4=(|SAE;random;$;2|))
                  (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT $ 41)))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
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

(SDEFUN |SAE;+;3$;13| ((|x| $) (|y| $) ($ $)) (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |SAE;-;2$;14| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 66))) 

(SDEFUN |SAE;*;3$;15| ((|x| $) (|y| $) ($ $))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 68)) (QREFELT $ 61))) 

(SDEFUN |SAE;coordinates;$V;16| ((|x| $) ($ |Vector| R))
        (SPROG ((#1=#:G137 NIL) (|i| NIL) (#2=#:G136 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21)))
                       . #4=(|SAE;coordinates;$V;16|))
                 (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 58)) |i|
                                          (QREFELT $ 70)))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))
                 #2#)))) 

(SDEFUN |SAE;represents;V$;17| ((|vect| |Vector| R) ($ $))
        (SPROG
         ((#1=#:G139 NIL) (#2=#:G138 ($)) (#3=#:G140 ($)) (#4=#:G142 NIL)
          (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|SAE;represents;V$;17|))
           (SEQ (LETT |i| 0 . #5#) (LETT #4# (QREFELT $ 21) . #5#) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT $ 72))
                                   |i| (QREFELT $ 37))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 30))))))) 

(SDEFUN |SAE;definingPolynomial;UP;18| (($ UP)) (QREFELT $ 8)) 

(SDEFUN |SAE;characteristic;Nni;19| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 74))) 

(SDEFUN |SAE;rank;Pi;20| (($ |PositiveInteger|))
        (SPROG ((#1=#:G145 NIL))
               (PROG1 (LETT #1# (QREFELT $ 17) |SAE;rank;Pi;20|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |SAE;basis;V;21| (($ |Vector| $))
        (SPADCALL (QREFELT $ 38) (QREFELT $ 79))) 

(SDEFUN |SAE;minimalPolynomial;$UP;22| ((|x| $) ($ UP))
        (SPADCALL (SPADCALL |x| (QREFELT $ 82)) (QREFELT $ 83))) 

(SDEFUN |SAE;coordinates;$VV;23| ((|x| $) (|bas| |Vector| $) ($ |Vector| R))
        (SPROG ((|m| (|Union| (|Matrix| R) "failed")))
               (SEQ
                (LETT |m|
                      (SPADCALL
                       (SPADCALL (SPADCALL |bas| (QREFELT $ 85))
                                 (QREFELT $ 86))
                       (QREFELT $ 87))
                      |SAE;coordinates;$VV;23|)
                (EXIT
                 (COND
                  ((QEQCAR |m| 1)
                   (|error| "coordinates: second argument must be a basis"))
                  ('T
                   (SPADCALL (QCDR |m|) (SPADCALL |x| (QREFELT $ 71))
                             (QREFELT $ 88)))))))) 

(SDEFUN |SAE;coordinates;$VV;24| ((|x| $) (|bas| |Vector| $) ($ |Vector| R))
        (SPROG
         ((|xi| (|qf|)) (#1=#:G162 NIL) (|i| NIL) (|vec| (|Vector| R))
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
                   (CATEGORY |package|
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
                        |noBranch|)))))
         (SEQ
          (LETT |qf| (|Fraction| (QREFELT $ 6))
                . #5=(|SAE;coordinates;$VV;24|))
          (LETT |imatqf|
                (|InnerMatrixQuotientFieldFunctions| (QREFELT $ 6)
                                                     (|Vector| (QREFELT $ 6))
                                                     (|Vector| (QREFELT $ 6))
                                                     (|Matrix| (QREFELT $ 6))
                                                     |qf| (|Vector| |qf|)
                                                     (|Vector| |qf|)
                                                     (|Matrix| |qf|))
                . #5#)
          (LETT |mat| (SPADCALL (SPADCALL |bas| (QREFELT $ 85)) (QREFELT $ 86))
                . #5#)
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
                                                 |imatqf|))
                . #5#)
          (EXIT
           (COND
            ((QEQCAR |m| 1)
             (|error| "coordinates: second argument must be a basis"))
            ('T
             (SEQ
              (LETT |coordsQF|
                    (SPADCALL
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| (ELT $ 6)))
                                            |qf|)
                     (SPADCALL |x| (QREFELT $ 71))
                     (|compiledLookupCheck| '|map|
                                            (LIST
                                             (LIST '|Vector|
                                                   (|devaluate| |qf|))
                                             (LIST '|Mapping|
                                                   (|devaluate| |qf|)
                                                   (|devaluate| (ELT $ 6)))
                                             (LIST '|Vector|
                                                   (|devaluate| (ELT $ 6))))
                                            (|VectorFunctions2| (ELT $ 6)
                                                                |qf|)))
                    . #5#)
              (LETT |vecQF|
                    (SPADCALL (QCDR |m|) |coordsQF|
                              (|compiledLookupCheck| '*
                                                     (LIST
                                                      (LIST '|Vector|
                                                            (|devaluate| |qf|))
                                                      '$
                                                      (LIST '|Vector|
                                                            (|devaluate|
                                                             |qf|)))
                                                     (|Matrix| |qf|)))
                    . #5#)
              (LETT |vec| (MAKEARR1 (QREFELT $ 17) (|spadConstant| $ 31))
                    . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #1# (QREFELT $ 17) . #5#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |xi| (QAREF1O |vecQF| |i| 1) . #5#)
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
                            (|spadConstant| $ 36) (QREFELT $ 90))
                           (QSETAREF1O |vec| |i|
                                       (SPADCALL |xi|
                                                 (|compiledLookupCheck|
                                                  '|numer|
                                                  (LIST (|devaluate| (ELT $ 6))
                                                        '$)
                                                  |qf|))
                                       1))
                          ('T
                           (|error|
                            "coordinates: coordinates are not integral over ground ring")))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |vec|)))))))) 

(SDEFUN |SAE;reducedSystem;MM;25| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 95)) (QREFELT $ 97))) 

(SDEFUN |SAE;reducedSystem;MVR;26|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 95))
                  (SPADCALL (ELT $ 58) |v| (QREFELT $ 101)) (QREFELT $ 103))) 

(SDEFUN |SAE;discriminant;R;27| (($ R))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 35) (QREFELT $ 105)) (|SAE;mkDisc| 'NIL $)))
         (EXIT (SPADCALL (QREFELT $ 34) (QREFELT $ 106))))) 

(SDEFUN |SAE;mkDisc| ((|b| |Boolean|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 35) |b| (QREFELT $ 108))
             (SPADCALL (QREFELT $ 34) (SPADCALL (QREFELT $ 8) (QREFELT $ 109))
                       (QREFELT $ 110))
             (EXIT (SPADCALL (QREFELT $ 112))))) 

(SDEFUN |SAE;traceMatrix;M;29| (($ |Matrix| R))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 28) (QREFELT $ 105)) (|SAE;mkDiscMat| 'NIL $)))
         (EXIT (QREFELT $ 24)))) 

(SDEFUN |SAE;mkDiscMat| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G180 NIL) (|j| NIL) (#2=#:G179 NIL) (|i| NIL)
          (|mc| (|Integer|)) (|mr| (|Integer|)))
         (SEQ (SPADCALL (QREFELT $ 28) |b| (QREFELT $ 108))
              (LETT |mr| 1 . #3=(|SAE;mkDiscMat|)) (LETT |mc| 1 . #3#)
              (SEQ (LETT |i| 0 . #3#) (LETT #2# (QREFELT $ 21) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (QREFELT $ 21) . #3#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O (QREFELT $ 24) (+ |mr| |i|)
                                        (+ |mc| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 36)
                                                    (+ |i| |j|)
                                                    (QREFELT $ 114))
                                          (QREFELT $ 61))
                                         (QREFELT $ 115))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 112)))))) 

(SDEFUN |SAE;trace;$R;31| ((|x| $) ($ R))
        (SPROG ((|ans| (R)) (|xn| ($)) (#1=#:G185 NIL) (|n| NIL))
               (SEQ (LETT |xn| |x| . #2=(|SAE;trace;$R;31|))
                    (LETT |ans|
                          (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) 0
                                    (QREFELT $ 70))
                          . #2#)
                    (SEQ (LETT |n| 1 . #2#) (LETT #1# (QREFELT $ 21) . #2#)
                         G190 (COND ((|greater_SI| |n| #1#) (GO G191)))
                         (SEQ
                          (LETT |xn|
                                (SPADCALL (SPADCALL (QREFELT $ 116)) |xn|
                                          (QREFELT $ 69))
                                . #2#)
                          (EXIT
                           (LETT |ans|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) |n|
                                            (QREFELT $ 70))
                                  |ans| (QREFELT $ 117))
                                 . #2#)))
                         (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |SAE;fac1| ((|up| UP) ($ |Factored| UP))
        (SPROG ((|f1| (|Factored| (|SparseUnivariatePolynomial| R))))
               (SEQ
                (LETT |f1|
                      (SPADCALL (SPADCALL |up| (QREFELT $ 119))
                                (QREFELT $ 122))
                      |SAE;fac1|)
                (EXIT (SPADCALL (ELT $ 123) |f1| (QREFELT $ 128)))))) 

(SDEFUN |SAE;factorPolynomial;SupF;33|
        ((|up| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |up| (CONS (|function| |SAE;fac1|) $) (QREFELT $ 133))) 

(SDEFUN |SAE;index;Pi$;34| ((|k| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|a| (R)) (#1=#:G192 NIL)
          (|h| (|Integer|)) (|j| NIL) (|p| (|Integer|)))
         (SEQ
          (LETT |i| (REM |k| (SPADCALL (QREFELT $ 40)))
                . #2=(|SAE;index;Pi$;34|))
          (LETT |p| (SPADCALL (QREFELT $ 39)) . #2#)
          (LETT |ans| (|spadConstant| $ 30) . #2#)
          (SEQ (LETT |j| 0 . #2#) G190
               (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 135))) (GO G191)))
               (SEQ (LETT |h| (REM |i| |p|) . #2#)
                    (COND
                     ((SPADCALL |h| 0 (QREFELT $ 136))
                      (SEQ
                       (LETT |a|
                             (SPADCALL
                              (PROG1 (LETT #1# |h| . #2#)
                                (|check_subtype2| (> #1# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT $ 137))
                             . #2#)
                       (EXIT
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (SPADCALL |a| |j| (QREFELT $ 114))
                                         (QREFELT $ 61))
                                        (QREFELT $ 65))
                              . #2#)))))
                    (EXIT (LETT |i| (QUOTIENT2 |i| |p|) . #2#)))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |SAE;lookup;$Pi;35| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|co| (|Integer|)) (|n| (|NonNegativeInteger|)) (|p| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 139)) (SPADCALL (QREFELT $ 40)))
                (#1='T
                 (SEQ
                  (LETT |p| (SPADCALL (QREFELT $ 39))
                        . #2=(|SAE;lookup;$Pi;35|))
                  (LETT |co|
                        (SPADCALL (SPADCALL |z| (QREFELT $ 140))
                                  (QREFELT $ 141))
                        . #2#)
                  (LETT |n| (SPADCALL |z| (QREFELT $ 16)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL
                             (LETT |z| (SPADCALL |z| (QREFELT $ 142)) . #2#)
                             (QREFELT $ 139))
                            'NIL)
                           ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |co|
                               (+
                                (* |co|
                                   (EXPT |p|
                                         (- |n|
                                            (LETT |n|
                                                  (SPADCALL |z| (QREFELT $ 16))
                                                  . #2#))))
                                (SPADCALL (SPADCALL |z| (QREFELT $ 140))
                                          (QREFELT $ 141)))
                               . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#1# (* |co| (EXPT |p| |n|))))))))))) 

(DECLAIM (NOTINLINE |SimpleAlgebraicExtension;|)) 

(DEFUN |SimpleAlgebraicExtension| (&REST #1=#:G247)
  (SPROG NIL
         (PROG (#2=#:G248)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SimpleAlgebraicExtension|)
                                               '|domainEqualList|)
                    . #3=(|SimpleAlgebraicExtension|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SimpleAlgebraicExtension;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SimpleAlgebraicExtension|)))))))))) 

(DEFUN |SimpleAlgebraicExtension;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G246 NIL) (|i| NIL) (#2=#:G245 NIL) (#3=#:G112 NIL) (#4=#:G109 NIL)
    (|pv$| NIL) (#5=#:G242 NIL) (#6=#:G243 NIL) (#7=#:G244 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #8=(|SimpleAlgebraicExtension|))
     (LETT DV$2 (|devaluate| |#2|) . #8#)
     (LETT DV$3 (|devaluate| |#3|) . #8#)
     (LETT |dv$| (LIST '|SimpleAlgebraicExtension| DV$1 DV$2 DV$3) . #8#)
     (LETT $ (GETREFV 177) . #8#)
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
                                               (|HasCategory| |#1| '(|Field|))
                                               . #8#)
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
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (LETT #6#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#1|
                                                               '(|Field|)))
                                               . #8#)
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
                                                              '(|PolynomialFactorizationExplicit|))
                                               . #8#)
                                         (AND #7# #5#)))
                     . #8#))
     (|haddProp| |$ConstructorCache| '|SimpleAlgebraicExtension|
                 (LIST DV$1 DV$2 DV$3) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (AND
      (OR (AND #7# #5# (|HasCategory| $ '(|CharacteristicNonZero|)))
          (|HasCategory| |#1| '(|FiniteFieldCategory|)))
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
              (PROG2 (LETT #4# #9=(QREFELT $ 12) . #8#)
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 0) #9# (|Union| #9# #10="failed")
                                #4#))
              |#3| (QREFELT $ 14)))
     (QSETREFV $ 17 (SPADCALL |#3| (QREFELT $ 16)))
     (QSETREFV $ 21
               (PROG2
                   (LETT #3# (SPADCALL (QREFELT $ 17) 1 (QREFELT $ 20)) . #8#)
                   (QCDR #3#)
                 (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                 (|Union| (|NonNegativeInteger|) #10#) #3#)))
     (QSETREFV $ 24 (SPADCALL (QREFELT $ 17) (QREFELT $ 17) (QREFELT $ 23)))
     (QSETREFV $ 28 (SPADCALL 'T (QREFELT $ 27)))
     (QSETREFV $ 34 (SPADCALL (|spadConstant| $ 31) (QREFELT $ 33)))
     (QSETREFV $ 35 (SPADCALL 'T (QREFELT $ 27)))
     (QSETREFV $ 38
               (PROGN
                (LETT #2# (GETREFV (|inc_SI| #11=(QREFELT $ 21))) . #8#)
                (SEQ (LETT |i| 0 . #8#) (LETT #1# #11# . #8#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #2# |i|
                               (SPADCALL (|spadConstant| $ 36) |i|
                                         (QREFELT $ 37)))))
                     (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
                #2#))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 40 (CONS (|dispatchFunction| |SAE;size;Nni;1|) $))
        (QSETREFV $ 44 (CONS (|dispatchFunction| |SAE;random;$;2|) $)))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV $ 84
                 (CONS (|dispatchFunction| |SAE;minimalPolynomial;$UP;22|)
                       $))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV $ 89 (CONS (|dispatchFunction| |SAE;coordinates;$VV;23|) $)))
      ((|HasCategory| |#1| '(|IntegralDomain|))
       (QSETREFV $ 89 (CONS (|dispatchFunction| |SAE;coordinates;$VV;24|) $))))
     (COND
      ((|testBitVector| |pv$| 3)
       (COND
        ((|testBitVector| |pv$| 14)
         (PROGN
          (QSETREFV $ 134
                    (CONS (|dispatchFunction| |SAE;factorPolynomial;SupF;33|)
                          $)))))))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV $ 138 (CONS (|dispatchFunction| |SAE;index;Pi$;34|) $))
        (QSETREFV $ 143 (CONS (|dispatchFunction| |SAE;lookup;$Pi;35|) $)))))
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
              (69 . |size|) (73 . |random|) (|Vector| 6) |SAE;represents;V$;17|
              (77 . |random|) (81 . |Zero|) (85 . |One|) (89 . *) |SAE;*;R2$;5|
              (|Integer|) (95 . *) |SAE;*;I2$;6| (101 . |coerce|)
              |SAE;coerce;I$;7| |SAE;coerce;R$;8| (|OutputForm|)
              (106 . |coerce|) |SAE;coerce;$Of;9| |SAE;lift;$UP;10|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (111 . |monicDivide|) |SAE;reduce;UP$;11| (117 . =)
              |SAE;=;2$B;12| (123 . +) |SAE;+;3$;13| (129 . -) |SAE;-;2$;14|
              (134 . *) |SAE;*;3$;15| (140 . |coefficient|)
              |SAE;coordinates;$V;16| (146 . |elt|)
              |SAE;definingPolynomial;UP;18| (152 . |characteristic|)
              |SAE;characteristic;Nni;19| (|PositiveInteger|) |SAE;rank;Pi;20|
              (|Vector| $$) (156 . |copy|) (|Vector| $) |SAE;basis;V;21|
              (161 . |characteristicPolynomial|) (166 . |squareFreePart|)
              (171 . |minimalPolynomial|) (176 . |coordinates|)
              (181 . |transpose|) (186 . |inverse|) (191 . *)
              (197 . |coordinates|) (203 . =) (|Matrix| 7) (|Mapping| 7 $$)
              (|Matrix| $$) (|MatrixCategoryFunctions2| $$ 78 78 93 7 99 99 91)
              (209 . |map|) (|Matrix| $) (215 . |reducedSystem|)
              |SAE;reducedSystem;MM;25| (|Vector| 7) (|VectorFunctions2| $$ 7)
              (220 . |map|) (|Record| (|:| |mat| 22) (|:| |vec| 42))
              (226 . |reducedSystem|) |SAE;reducedSystem;MVR;26| (232 . |elt|)
              (237 . |elt|) |SAE;discriminant;R;27| (242 . |setelt!|)
              (248 . |discriminant|) (253 . |setelt!|) (|Void|) (259 . |void|)
              |SAE;traceMatrix;M;29| (263 . |monomial|) |SAE;trace;$R;31|
              (269 . |generator|) (273 . +) (|SparseUnivariatePolynomial| 6)
              (279 . |makeSUP|) (|Factored| 121)
              (|SparseUnivariatePolynomial| $) (284 . |factorPolynomial|)
              (289 . |unmakeSUP|) (|Factored| 7) (|Mapping| 7 118)
              (|Factored| 118) (|FactoredFunctions2| 118 7) (294 . |map|)
              (|Factored| 130) (|SparseUnivariatePolynomial| $$)
              (|Mapping| 124 7) (|InnerAlgFactor| 6 7 $$ 130) (300 . |factor|)
              (306 . |factorPolynomial|) (311 . >) (317 . ~=) (323 . |index|)
              (328 . |index|) (333 . |zero?|) (338 . |leadingCoefficient|)
              (343 . |lookup|) (348 . |reductum|) (353 . |lookup|) (|List| 146)
              (|List| 15) (|Symbol|) (|Union| 148 '#1="failed") (|List| 121)
              (|Union| 80 '#1#) (|Fraction| 49) (|Factored| $) (|List| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 152) (|:| |generator| $))
              (|Union| 152 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 158 '"failed") (|Mapping| 6 6) (|Fraction| 7)
              (|InputForm|) (|OnePointCompletion| 76) (|Union| 15 '"failed")
              (|Record| (|:| |factor| 49) (|:| |exponent| 49)) (|List| 165)
              (|Table| 76 15)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |mat| 170) (|:| |vec| (|Vector| 49)))
              (|Matrix| 49) (|Union| 150 '#2="failed") (|Union| 49 '#2#)
              (|Union| 6 '#2#) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 358 |zero?| 364 |unitNormal| 369 |unitCanonical| 374 |unit?|
              379 |traceMatrix| 384 |trace| 393 |tableForDiscreteLogarithm| 398
              |subtractIfCan| 403 |squareFreePolynomial| 409 |squareFreePart|
              414 |squareFree| 419 |solveLinearPolynomialEquation| 424
              |smaller?| 430 |sizeLess?| 436 |size| 442 |sample| 446
              |retractIfCan| 450 |retract| 465 |represents| 480
              |representationType| 491 |rem| 495 |regularRepresentation| 501
              |reducedSystem| 512 |reduce| 534 |recip| 544 |rank| 549 |random|
              553 |quo| 557 |principalIdeal| 563 |primitiveElement| 568
              |primitive?| 572 |primeFrobenius| 577 |prime?| 588 |order| 593
              |opposite?| 603 |one?| 609 |norm| 614 |nextItem| 619
              |multiEuclidean| 624 |minimalPolynomial| 630 |lookup| 635 |lift|
              640 |lcmCoef| 645 |lcm| 651 |latex| 662 |inv| 667 |init| 672
              |index| 676 |hashUpdate!| 681 |hash| 687 |generator| 692
              |gcdPolynomial| 696 |gcd| 702 |factorsOfCyclicGroupSize| 713
              |factorSquareFreePolynomial| 717 |factorPolynomial| 722 |factor|
              727 |extendedEuclidean| 732 |exquo| 745 |expressIdealMember| 751
              |euclideanSize| 757 |enumerate| 762 |divide| 766 |discriminant|
              772 |discreteLog| 781 |differentiate| 792 |derivationCoordinates|
              842 |definingPolynomial| 848 |createPrimitiveElement| 852
              |coordinates| 856 |convert| 878 |conditionP| 903 |coerce| 908
              |charthRoot| 933 |characteristicPolynomial| 943 |characteristic|
              948 |basis| 952 |associates?| 956 |annihilate?| 962 ^ 968 |Zero|
              986 |One| 990 D 994 = 1044 / 1050 - 1056 + 1067 * 1073)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 2 2 4 4 15 4 3 0 4 0 3 4 0 0 3 3 3 3 0 0 0
                                  1 3 3 3 5 7 12 10 0 0 0 3 0 0 0 0 0 3 3 0 0 0
                                  0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0 3 3 3 6 8 9))
            (CONS
             '#(|MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| |DivisionRing&| NIL |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |DifferentialExtension&| NIL NIL |Module&| NIL |Module&|
                |EntireRing&| |Module&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Ring&| NIL NIL NIL NIL
                |Rng&| NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |Finite&| |SemiGroup&| |AbelianSemiGroup&| NIL
                NIL |FullyRetractableTo&| |SetCategory&| |RetractableTo&| NIL
                NIL NIL |BasicType&| NIL NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|MonogenicAlgebra| 6 7) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|FramedAlgebra| 6 7)
                 (|GcdDomain|) (|FiniteRankAlgebra| 6 7) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 150) (|DifferentialExtension| 6)
                 (|LinearlyExplicitRingOver| 6) (|CommutativeRing|)
                 (|Module| 6) (|CharacteristicZero|) (|Module| $$)
                 (|EntireRing|) (|Module| 150) (|CharacteristicNonZero|)
                 (|DifferentialRing|) (|PartialDifferentialRing| 146)
                 (|LinearlyExplicitRingOver| 49) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 150 150) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|RightModule| 6) (|LeftModule| 6)
                 (|LeftModule| 150) (|RightModule| 150) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|Finite|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|RetractableTo| 6)
                 (|ConvertibleTo| 7) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 55) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|ConvertibleTo| 162) (|RetractableTo| 150)
                 (|RetractableTo| 49))
              (|makeByteWordVec2| 176
                                  '(1 7 6 0 9 1 6 10 0 11 2 7 0 6 0 14 1 13 15
                                    0 16 0 7 0 18 2 15 10 0 0 20 2 22 0 15 15
                                    23 1 26 0 25 27 0 7 0 29 0 6 0 31 1 32 0 6
                                    33 0 6 0 36 2 13 0 6 15 37 0 6 15 39 0 0 15
                                    40 0 6 0 41 0 0 0 44 0 13 0 45 0 13 0 46 2
                                    13 0 6 0 47 2 13 0 49 0 50 1 13 0 49 52 1
                                    13 55 0 56 2 13 59 0 0 60 2 13 25 0 0 62 2
                                    13 0 0 0 64 1 13 0 0 66 2 13 0 0 0 68 2 7 6
                                    0 15 70 2 42 6 0 49 72 0 6 15 74 1 78 0 0
                                    79 1 0 7 0 82 1 7 0 0 83 1 0 7 0 84 1 0 22
                                    80 85 1 22 0 0 86 1 22 10 0 87 2 22 42 0 42
                                    88 2 0 42 0 80 89 2 6 25 0 0 90 2 94 91 92
                                    93 95 1 7 22 96 97 2 100 99 92 78 101 2 7
                                    102 96 80 103 1 26 25 0 105 1 32 6 0 106 2
                                    26 25 0 25 108 1 13 6 0 109 2 32 6 0 6 110
                                    0 111 0 112 2 7 0 6 15 114 0 0 0 116 2 6 0
                                    0 0 117 1 7 118 0 119 1 6 120 121 122 1 7 0
                                    118 123 2 127 124 125 126 128 2 132 129 130
                                    131 133 1 0 120 121 134 2 49 25 0 0 135 2
                                    49 25 0 0 136 1 6 0 76 137 1 0 0 76 138 1 0
                                    25 0 139 1 13 6 0 140 1 6 76 0 141 1 13 0 0
                                    142 1 0 76 0 143 2 0 25 0 0 1 1 0 25 0 139
                                    1 3 154 0 1 1 3 0 0 1 1 3 25 0 1 0 0 22 113
                                    1 0 22 80 1 1 0 6 0 115 1 2 167 49 1 2 0 10
                                    0 0 1 1 15 120 121 1 1 3 0 0 1 1 3 151 0 1
                                    2 15 147 148 121 1 2 6 25 0 0 1 2 3 25 0 0
                                    1 0 6 15 40 0 0 0 1 1 8 171 0 1 1 9 172 0 1
                                    1 0 173 0 1 1 8 150 0 1 1 9 49 0 1 1 0 6 0
                                    1 1 0 0 42 43 2 0 0 42 80 1 0 2 168 1 2 3 0
                                    0 0 1 1 0 22 0 1 2 0 22 0 80 1 2 10 169 96
                                    80 1 1 10 170 96 1 1 0 22 96 98 2 0 102 96
                                    80 104 1 3 10 161 1 1 0 0 7 61 1 0 10 0 1 0
                                    0 76 77 0 6 0 44 2 3 0 0 0 1 1 3 155 152 1
                                    0 2 0 1 1 2 25 0 1 1 2 0 0 1 2 2 0 0 15 1 1
                                    3 25 0 1 1 2 163 0 1 1 2 76 0 1 2 0 25 0 0
                                    1 1 0 25 0 1 1 0 6 0 1 1 2 10 0 1 2 3 156
                                    152 0 1 1 3 7 0 84 1 6 76 0 143 1 0 7 0 58
                                    2 3 153 0 0 1 1 3 0 152 1 2 3 0 0 0 1 1 0
                                    174 0 1 1 3 0 0 1 0 2 0 1 1 6 0 76 138 2 0
                                    176 176 0 1 1 0 175 0 1 0 0 0 116 2 3 121
                                    121 121 1 1 3 0 152 1 2 3 0 0 0 1 0 2 166 1
                                    1 15 120 121 1 1 15 120 121 134 1 3 151 0 1
                                    2 3 157 0 0 1 3 3 159 0 0 0 1 2 3 10 0 0 1
                                    2 3 156 152 0 1 1 3 15 0 1 0 6 152 1 2 3 59
                                    0 0 1 0 0 6 107 1 0 6 80 1 2 2 164 0 0 1 1
                                    2 15 0 1 3 11 0 0 146 15 1 3 11 0 0 144 145
                                    1 2 11 0 0 146 1 2 11 0 0 144 1 2 7 0 0 15
                                    1 1 7 0 0 1 2 3 0 0 160 1 3 3 0 0 160 15 1
                                    2 3 22 80 160 1 0 0 7 73 0 2 0 1 1 0 42 0
                                    71 1 0 22 80 85 2 0 22 80 80 1 2 0 42 0 80
                                    89 1 6 162 0 1 1 0 0 7 1 1 0 7 0 1 1 0 0 42
                                    1 1 0 42 0 1 1 16 149 96 1 1 13 0 150 1 1 3
                                    0 0 1 1 0 0 6 54 1 0 0 49 53 1 0 55 0 57 1
                                    17 10 0 1 1 2 0 0 1 1 0 7 0 82 0 0 15 75 0
                                    0 80 81 2 3 25 0 0 1 2 0 25 0 0 1 2 3 0 0
                                    49 1 2 0 0 0 15 1 2 0 0 0 76 1 0 0 0 30 0 0
                                    0 19 3 11 0 0 144 145 1 3 11 0 0 146 15 1 2
                                    11 0 0 146 1 2 11 0 0 144 1 2 7 0 0 15 1 1
                                    7 0 0 1 2 3 0 0 160 1 3 3 0 0 160 15 1 2 0
                                    25 0 0 63 2 3 0 0 0 1 1 0 0 0 67 2 0 0 0 0
                                    1 2 0 0 0 0 65 2 3 0 0 150 1 2 3 0 150 0 1
                                    2 0 0 6 0 48 2 0 0 0 6 1 2 0 0 49 0 51 2 0
                                    0 0 0 69 2 0 0 15 0 1 2 0 0 76 0 1)))))
           '|lookupComplete|)) 
