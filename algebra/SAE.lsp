
(/VERSIONCHECK 2) 

(DEFUN |SAE;size;Nni;1| ($) (EXPT (SPADCALL (QREFELT $ 39)) (QREFELT $ 17))) 

(DEFUN |SAE;random;$;2| ($)
  (PROG (#1=#:G140 |i| #2=#:G139)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 21)))
              . #4=(|SAE;random;$;2|))
        (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
             (COND ((|greater_SI| |i| #1#) (GO G191)))
             (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT $ 41)))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        #2#)
       (QREFELT $ 43)))))) 

(DEFUN |SAE;Zero;$;3| ($) (|spadConstant| $ 45)) 

(DEFUN |SAE;One;$;4| ($) (|spadConstant| $ 46)) 

(DEFUN |SAE;*;R2$;5| (|c| |x| $) (SPADCALL |c| |x| (QREFELT $ 47))) 

(DEFUN |SAE;*;I2$;6| (|n| |x| $) (SPADCALL |n| |x| (QREFELT $ 50))) 

(DEFUN |SAE;coerce;I$;7| (|n| $) (SPADCALL |n| (QREFELT $ 52))) 

(DEFUN |SAE;coerce;R$;8| (|c| $) (SPADCALL |c| 0 (QREFELT $ 37))) 

(DEFUN |SAE;coerce;$Of;9| (|x| $) (SPADCALL |x| (QREFELT $ 56))) 

(PUT '|SAE;lift;$UP;10| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |SAE;lift;$UP;10| (|x| $) |x|) 

(DEFUN |SAE;reduce;UP$;11| (|p| $)
  (QCDR (SPADCALL |p| (QREFELT $ 8) (QREFELT $ 60)))) 

(DEFUN |SAE;=;2$B;12| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 62))) 

(DEFUN |SAE;+;3$;13| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |SAE;-;2$;14| (|x| $) (SPADCALL |x| (QREFELT $ 66))) 

(DEFUN |SAE;*;3$;15| (|x| |y| $)
  (SPADCALL (SPADCALL |x| |y| (QREFELT $ 68)) (QREFELT $ 61))) 

(DEFUN |SAE;coordinates;$V;16| (|x| $)
  (PROG (#1=#:G158 |i| #2=#:G157)
    (RETURN
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
            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
       #2#))))) 

(DEFUN |SAE;represents;V$;17| (|vect| $)
  (PROG (#1=#:G160 #2=#:G159 #3=#:G161 #4=#:G163 |i|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|SAE;represents;V$;17|))
       (SEQ (LETT |i| 0 . #5#) (LETT #4# (QREFELT $ 21) . #5#) G190
            (COND ((|greater_SI| |i| #4#) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT $ 72)) |i|
                               (QREFELT $ 37))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 30)))))))) 

(DEFUN |SAE;definingPolynomial;UP;18| ($) (QREFELT $ 8)) 

(DEFUN |SAE;characteristic;Nni;19| ($) (SPADCALL (QREFELT $ 74))) 

(DEFUN |SAE;rank;Pi;20| ($)
  (PROG (#1=#:G166)
    (RETURN
     (PROG1 (LETT #1# (QREFELT $ 17) |SAE;rank;Pi;20|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |SAE;basis;V;21| ($) (SPADCALL (QREFELT $ 38) (QREFELT $ 79))) 

(DEFUN |SAE;minimalPolynomial;$UP;22| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 82)) (QREFELT $ 83))) 

(DEFUN |SAE;coordinates;$VV;23| (|x| |bas| $)
  (PROG (|m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (SPADCALL (SPADCALL |bas| (QREFELT $ 85)) (QREFELT $ 86))
                      (QREFELT $ 87))
            |SAE;coordinates;$VV;23|)
      (EXIT
       (COND
        ((QEQCAR |m| 1)
         (|error| "coordinates: second argument must be a basis"))
        ('T
         (SPADCALL (QCDR |m|) (SPADCALL |x| (QREFELT $ 71))
                   (QREFELT $ 88))))))))) 

(DEFUN |SAE;coordinates;$VV;24| (|x| |bas| $)
  (PROG (|xi| #1=#:G183 |i| |vec| |vecQF| |coordsQF| |m| |mat| |imatqf| |qf|)
    (RETURN
     (SEQ
      (LETT |qf| (|Fraction| (QREFELT $ 6)) . #2=(|SAE;coordinates;$VV;24|))
      (LETT |imatqf|
            (|InnerMatrixQuotientFieldFunctions| (QREFELT $ 6)
                                                 (|Vector| (QREFELT $ 6))
                                                 (|Vector| (QREFELT $ 6))
                                                 (|Matrix| (QREFELT $ 6)) |qf|
                                                 (|Vector| |qf|)
                                                 (|Vector| |qf|)
                                                 (|Matrix| |qf|))
            . #2#)
      (LETT |mat| (SPADCALL (SPADCALL |bas| (QREFELT $ 85)) (QREFELT $ 86))
            . #2#)
      (LETT |m|
            (SPADCALL |mat|
                      (|compiledLookupCheck| '|inverse|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|Matrix|
                                                          (|devaluate| |qf|))
                                                    '"failed")
                                              (LIST '|Matrix|
                                                    (|devaluate| (ELT $ 6))))
                                             |imatqf|))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |m| 1)
         (|error| "coordinates: second argument must be a basis"))
        ('T
         (SEQ
          (LETT |coordsQF|
                (SPADCALL
                 (|compiledLookupCheck| '|coerce|
                                        (LIST '$ (|devaluate| (ELT $ 6))) |qf|)
                 (SPADCALL |x| (QREFELT $ 71))
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|Vector| (|devaluate| |qf|))
                                         (LIST '|Mapping| (|devaluate| |qf|)
                                               (|devaluate| (ELT $ 6)))
                                         (LIST '|Vector|
                                               (|devaluate| (ELT $ 6))))
                                        (|VectorFunctions2| (ELT $ 6) |qf|)))
                . #2#)
          (LETT |vecQF|
                (SPADCALL (QCDR |m|) |coordsQF|
                          (|compiledLookupCheck| '*
                                                 (LIST
                                                  (LIST '|Vector|
                                                        (|devaluate| |qf|))
                                                  '$
                                                  (LIST '|Vector|
                                                        (|devaluate| |qf|)))
                                                 (|Matrix| |qf|)))
                . #2#)
          (LETT |vec| (MAKEARR1 (QREFELT $ 17) (|spadConstant| $ 31)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QREFELT $ 17) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |xi| (QAREF1O |vecQF| |i| 1) . #2#)
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
                                             (|compiledLookupCheck| '|numer|
                                                                    (LIST
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           6))
                                                                     '$)
                                                                    |qf|))
                                   1))
                      ('T
                       (|error|
                        "coordinates: coordinates are not integral over ground ring")))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |vec|))))))))) 

(DEFUN |SAE;reducedSystem;MM;25| (|m| $)
  (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 95)) (QREFELT $ 97))) 

(DEFUN |SAE;reducedSystem;MVR;26| (|m| |v| $)
  (SPADCALL (SPADCALL (ELT $ 58) |m| (QREFELT $ 95))
            (SPADCALL (ELT $ 58) |v| (QREFELT $ 101)) (QREFELT $ 103))) 

(DEFUN |SAE;discriminant;R;27| ($)
  (SEQ (COND ((SPADCALL (QREFELT $ 35) (QREFELT $ 105)) (|SAE;mkDisc| 'NIL $)))
       (EXIT (SPADCALL (QREFELT $ 34) (QREFELT $ 106))))) 

(DEFUN |SAE;mkDisc| (|b| $)
  (SEQ (SPADCALL (QREFELT $ 35) |b| (QREFELT $ 108))
       (SPADCALL (QREFELT $ 34) (SPADCALL (QREFELT $ 8) (QREFELT $ 109))
                 (QREFELT $ 110))
       (EXIT (SPADCALL (QREFELT $ 112))))) 

(DEFUN |SAE;traceMatrix;M;29| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 28) (QREFELT $ 105)) (|SAE;mkDiscMat| 'NIL $)))
   (EXIT (QREFELT $ 24)))) 

(DEFUN |SAE;mkDiscMat| (|b| $)
  (PROG (#1=#:G201 |j| #2=#:G200 |i| |mc| |mr|)
    (RETURN
     (SEQ (SPADCALL (QREFELT $ 28) |b| (QREFELT $ 108))
          (LETT |mr| 1 . #3=(|SAE;mkDiscMat|)) (LETT |mc| 1 . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (QREFELT $ 21) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 0 . #3#) (LETT #1# (QREFELT $ 21) . #3#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O (QREFELT $ 24) (+ |mr| |i|) (+ |mc| |j|)
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 36)
                                                (+ |i| |j|) (QREFELT $ 114))
                                      (QREFELT $ 61))
                                     (QREFELT $ 115))
                                    1 1)))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 112))))))) 

(DEFUN |SAE;trace;$R;31| (|x| $)
  (PROG (|ans| |xn| #1=#:G206 |n|)
    (RETURN
     (SEQ (LETT |xn| |x| . #2=(|SAE;trace;$R;31|))
          (LETT |ans|
                (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) 0 (QREFELT $ 70))
                . #2#)
          (SEQ (LETT |n| 1 . #2#) (LETT #1# (QREFELT $ 21) . #2#) G190
               (COND ((|greater_SI| |n| #1#) (GO G191)))
               (SEQ
                (LETT |xn|
                      (SPADCALL (SPADCALL (QREFELT $ 116)) |xn| (QREFELT $ 69))
                      . #2#)
                (EXIT
                 (LETT |ans|
                       (SPADCALL
                        (SPADCALL (SPADCALL |xn| (QREFELT $ 58)) |n|
                                  (QREFELT $ 70))
                        |ans| (QREFELT $ 117))
                       . #2#)))
               (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |SAE;index;Pi$;32| (|k| $)
  (PROG (|i| |ans| |a| #1=#:G208 |h| |j| |p|)
    (RETURN
     (SEQ
      (LETT |i| (REM |k| (SPADCALL (QREFELT $ 40))) . #2=(|SAE;index;Pi$;32|))
      (LETT |p| (SPADCALL (QREFELT $ 39)) . #2#)
      (LETT |ans| (|spadConstant| $ 30) . #2#)
      (SEQ (LETT |j| 0 . #2#) G190
           (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 118))) (GO G191)))
           (SEQ (LETT |h| (REM |i| |p|) . #2#)
                (COND
                 ((SPADCALL |h| 0 (QREFELT $ 119))
                  (SEQ
                   (LETT |a|
                         (SPADCALL
                          (PROG1 (LETT #1# |h| . #2#)
                            (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                             #1#))
                          (QREFELT $ 120))
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
      (EXIT |ans|))))) 

(DEFUN |SAE;lookup;$Pi;33| (|z| $)
  (PROG (|co| |n| |p|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |z| (QREFELT $ 122)) (SPADCALL (QREFELT $ 40)))
            (#1='T
             (SEQ
              (LETT |p| (SPADCALL (QREFELT $ 39)) . #2=(|SAE;lookup;$Pi;33|))
              (LETT |co|
                    (SPADCALL (SPADCALL |z| (QREFELT $ 123)) (QREFELT $ 124))
                    . #2#)
              (LETT |n| (SPADCALL |z| (QREFELT $ 16)) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL
                         (LETT |z| (SPADCALL |z| (QREFELT $ 125)) . #2#)
                         (QREFELT $ 122))
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
                                        (LETT |n| (SPADCALL |z| (QREFELT $ 16))
                                              . #2#))))
                            (SPADCALL (SPADCALL |z| (QREFELT $ 123))
                                      (QREFELT $ 124)))
                           . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |n| 0) |co|) (#1# (* |co| (EXPT |p| |n|)))))))))))) 

(DEFUN |SimpleAlgebraicExtension| (&REST #1=#:G259)
  (PROG ()
    (RETURN
     (PROG (#2=#:G260)
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
              (HREM |$ConstructorCache| '|SimpleAlgebraicExtension|))))))))))) 

(DEFUN |SimpleAlgebraicExtension;| (|#1| |#2| |#3|)
  (PROG (#1=#:G258 |i| #2=#:G257 #3=#:G133 #4=#:G130 |pv$| #5=#:G255 #6=#:G256
         $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #7=(|SimpleAlgebraicExtension|))
       (LETT DV$2 (|devaluate| |#2|) . #7#)
       (LETT DV$3 (|devaluate| |#3|) . #7#)
       (LETT |dv$| (LIST '|SimpleAlgebraicExtension| DV$1 DV$2 DV$3) . #7#)
       (LETT $ (GETREFV 158) . #7#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3
                 (LETT |pv$|
                       (|buildPredVector| 0 0
                                          (LIST
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (|HasCategory| |#1|
                                                          '(|FiniteFieldCategory|))
                                           (LETT #6#
                                                 (|HasCategory| |#1|
                                                                '(|Field|))
                                                 . #7#)
                                           (OR #6#
                                               (|HasCategory| |#1|
                                                              '(|FiniteFieldCategory|)))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1| '(|Finite|))
                                           (OR
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|DifferentialRing|))
                                             #6#)
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
                                           (LETT #5#
                                                 (AND
                                                  (|HasCategory| |#1|
                                                                 '(|PartialDifferentialRing|
                                                                   (|Symbol|)))
                                                  (|HasCategory| |#1|
                                                                 '(|Field|)))
                                                 . #7#)
                                           (OR #5#
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
                                            #6#)))
                       . #7#))
       (|haddProp| |$ConstructorCache| '|SimpleAlgebraicExtension|
                   (LIST DV$1 DV$2 DV$3) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (QSETREFV $ 8 |#3|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 12 (SPADCALL (SPADCALL |#3| (QREFELT $ 9)) (QREFELT $ 11)))
       (COND
        ((QEQCAR (QREFELT $ 12) 1) (|error| "Modulus cannot be made monic")))
       (QSETREFV $ 13 |#2|)
       (SETELT $ 8
               (SPADCALL
                (PROG2 (LETT #4# #8=(QREFELT $ 12) . #7#)
                    (QCDR #4#)
                  (|check_union| (QEQCAR #4# 0) #8# #4#))
                |#3| (QREFELT $ 14)))
       (QSETREFV $ 17 (SPADCALL |#3| (QREFELT $ 16)))
       (QSETREFV $ 21
                 (PROG2
                     (LETT #3# (SPADCALL (QREFELT $ 17) 1 (QREFELT $ 20))
                           . #7#)
                     (QCDR #3#)
                   (|check_union| (QEQCAR #3# 0) (|NonNegativeInteger|) #3#)))
       (QSETREFV $ 24 (SPADCALL (QREFELT $ 17) (QREFELT $ 17) (QREFELT $ 23)))
       (QSETREFV $ 28 (SPADCALL 'T (QREFELT $ 27)))
       (QSETREFV $ 34 (SPADCALL (|spadConstant| $ 31) (QREFELT $ 33)))
       (QSETREFV $ 35 (SPADCALL 'T (QREFELT $ 27)))
       (QSETREFV $ 38
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #9=(QREFELT $ 21))) . #7#)
                  (SEQ (LETT |i| 0 . #7#) (LETT #1# #9# . #7#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #2# |i|
                                 (SPADCALL (|spadConstant| $ 36) |i|
                                           (QREFELT $ 37)))))
                       (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                       (EXIT NIL))
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
         (QSETREFV $ 89
                   (CONS (|dispatchFunction| |SAE;coordinates;$VV;23|) $)))
        ((|HasCategory| |#1| '(|IntegralDomain|))
         (QSETREFV $ 89
                   (CONS (|dispatchFunction| |SAE;coordinates;$VV;24|) $))))
       (COND
        ((|testBitVector| |pv$| 6)
         (PROGN
          (QSETREFV $ 121 (CONS (|dispatchFunction| |SAE;index;Pi$;32|) $))
          (QSETREFV $ 126 (CONS (|dispatchFunction| |SAE;lookup;$Pi;33|) $)))))
       $))))) 

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
              (237 . |elt|) |SAE;discriminant;R;27| (242 . |setelt|)
              (248 . |discriminant|) (253 . |setelt|) (|Void|) (259 . |void|)
              |SAE;traceMatrix;M;29| (263 . |monomial|) |SAE;trace;$R;31|
              (269 . |generator|) (273 . +) (279 . >) (285 . ~=)
              (291 . |index|) (296 . |index|) (301 . |zero?|)
              (306 . |leadingCoefficient|) (311 . |lookup|) (316 . |reductum|)
              (321 . |lookup|) (|List| 129) (|List| 15) (|Symbol|)
              (|Fraction| 49)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 133 '"failed")
              (|Record| (|:| |coef| 133) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 138 '"failed") (|Factored| $) (|Mapping| 6 6)
              (|Fraction| 7) (|InputForm|) (|OnePointCompletion| 76)
              (|Union| 15 '"failed")
              (|Record| (|:| |factor| 49) (|:| |exponent| 49)) (|List| 146)
              (|Union| 80 '"failed") (|Table| 76 15)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |mat| 152) (|:| |vec| (|Vector| 49)))
              (|Matrix| 49) (|Union| 130 '#1="failed") (|Union| 49 '#1#)
              (|Union| 6 '#1#) (|SingleInteger|) (|String|))
           '#(~= 326 |zero?| 332 |unitNormal| 337 |unitCanonical| 342 |unit?|
              347 |traceMatrix| 352 |trace| 361 |tableForDiscreteLogarithm| 366
              |subtractIfCan| 371 |squareFreePart| 377 |squareFree| 382
              |sizeLess?| 387 |size| 393 |sample| 397 |retractIfCan| 401
              |retract| 416 |represents| 431 |representationType| 442 |rem| 446
              |regularRepresentation| 452 |reducedSystem| 463 |reduce| 485
              |recip| 495 |rank| 500 |random| 504 |quo| 508 |principalIdeal|
              514 |primitiveElement| 519 |primitive?| 523 |primeFrobenius| 528
              |prime?| 539 |order| 544 |one?| 554 |norm| 559 |nextItem| 564
              |multiEuclidean| 569 |minimalPolynomial| 575 |lookup| 580 |lift|
              585 |lcmCoef| 590 |lcm| 596 |latex| 607 |inv| 612 |init| 617
              |index| 621 |hash| 626 |generator| 631 |gcdPolynomial| 635 |gcd|
              641 |factorsOfCyclicGroupSize| 652 |factor| 656
              |extendedEuclidean| 661 |exquo| 674 |expressIdealMember| 680
              |euclideanSize| 686 |enumerate| 691 |divide| 695 |discriminant|
              701 |discreteLog| 710 |differentiate| 721 |derivationCoordinates|
              771 |definingPolynomial| 777 |createPrimitiveElement| 781
              |coordinates| 785 |convert| 807 |conditionP| 832 |coerce| 837
              |charthRoot| 862 |characteristicPolynomial| 872 |characteristic|
              877 |basis| 881 |associates?| 885 ^ 891 |Zero| 909 |One| 913 D
              917 = 967 / 973 - 979 + 990 * 996)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 2 2 4 4 4 3 0 4 0 4 3 0 0 3 3 3 3 0 0 0 1 3
                                  3 3 5 7 12 10 0 0 0 3 0 0 0 0 0 3 3 0 0 0 0 0
                                  0 0 0 6 2 0 0 0 0 0 0 0 0 3 3 3 6 8 9))
            (CONS
             '#(|MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&| NIL
                |UniqueFactorizationDomain&| |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| NIL |DivisionRing&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |DifferentialExtension&| NIL NIL |Module&| NIL |Module&|
                |EntireRing&| |Module&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |Finite&| NIL
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&| NIL NIL
                NIL |BasicType&| NIL NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|MonogenicAlgebra| 6 7) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FramedAlgebra| 6 7) (|GcdDomain|) (|FiniteRankAlgebra| 6 7)
                 (|IntegralDomain|) (|DivisionRing|) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 130) (|DifferentialExtension| 6)
                 (|LinearlyExplicitRingOver| 6) (|CommutativeRing|)
                 (|Module| 6) (|CharacteristicZero|) (|Module| $$)
                 (|EntireRing|) (|Module| 130) (|CharacteristicNonZero|)
                 (|DifferentialRing|) (|PartialDifferentialRing| 129)
                 (|LinearlyExplicitRingOver| 49) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 130 130) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|RightModule| 6) (|LeftModule| 6)
                 (|LeftModule| 130) (|RightModule| 130) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Finite|) (|StepThrough|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 6) (|ConvertibleTo| 7)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 55) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|ConvertibleTo| 143)
                 (|RetractableTo| 130) (|RetractableTo| 49))
              (|makeByteWordVec2| 157
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
                                    0 0 117 2 49 25 0 0 118 2 49 25 0 0 119 1 6
                                    0 76 120 1 0 0 76 121 1 0 25 0 122 1 13 6 0
                                    123 1 6 76 0 124 1 13 0 0 125 1 0 76 0 126
                                    2 0 25 0 0 1 1 0 25 0 122 1 3 131 0 1 1 3 0
                                    0 1 1 3 25 0 1 0 0 22 113 1 0 22 80 1 1 0 6
                                    0 115 1 2 149 49 1 2 0 10 0 0 1 1 3 0 0 1 1
                                    3 140 0 1 2 3 25 0 0 1 0 6 15 40 0 0 0 1 1
                                    8 153 0 1 1 9 154 0 1 1 0 155 0 1 1 8 130 0
                                    1 1 9 49 0 1 1 0 6 0 1 1 0 0 42 43 2 0 0 42
                                    80 1 0 2 150 1 2 3 0 0 0 1 1 0 22 0 1 2 0
                                    22 0 80 1 2 10 151 96 80 1 1 10 152 96 1 1
                                    0 22 96 98 2 0 102 96 80 104 1 3 10 142 1 1
                                    0 0 7 61 1 0 10 0 1 0 0 76 77 0 6 0 44 2 3
                                    0 0 0 1 1 3 136 133 1 0 2 0 1 1 2 25 0 1 1
                                    2 0 0 1 2 2 0 0 15 1 1 3 25 0 1 1 2 144 0 1
                                    1 2 76 0 1 1 0 25 0 1 1 0 6 0 1 1 2 10 0 1
                                    2 3 135 133 0 1 1 3 7 0 84 1 6 76 0 126 1 0
                                    7 0 58 2 3 132 0 0 1 2 3 0 0 0 1 1 3 0 133
                                    1 1 0 157 0 1 1 3 0 0 1 0 2 0 1 1 6 0 76
                                    121 1 0 156 0 1 0 0 0 116 2 3 134 134 134 1
                                    2 3 0 0 0 1 1 3 0 133 1 0 2 147 1 1 3 140 0
                                    1 2 3 137 0 0 1 3 3 139 0 0 0 1 2 3 10 0 0
                                    1 2 3 135 133 0 1 1 3 15 0 1 0 6 133 1 2 3
                                    59 0 0 1 0 0 6 107 1 0 6 80 1 2 2 145 0 0 1
                                    1 2 15 0 1 3 11 0 0 127 128 1 3 11 0 0 129
                                    15 1 2 11 0 0 129 1 2 11 0 0 127 1 2 7 0 0
                                    15 1 1 7 0 0 1 2 3 0 0 141 1 3 3 0 0 141 15
                                    1 2 3 22 80 141 1 0 0 7 73 0 2 0 1 1 0 22
                                    80 85 1 0 42 0 71 2 0 42 0 80 89 2 0 22 80
                                    80 1 1 6 143 0 1 1 0 0 7 1 1 0 7 0 1 1 0 42
                                    0 1 1 0 0 42 1 1 2 148 96 1 1 13 0 130 1 1
                                    3 0 0 1 1 0 0 6 54 1 0 0 49 53 1 0 55 0 57
                                    1 5 10 0 1 1 2 0 0 1 1 0 7 0 82 0 0 15 75 0
                                    0 80 81 2 3 25 0 0 1 2 3 0 0 49 1 2 0 0 0
                                    15 1 2 0 0 0 76 1 0 0 0 30 0 0 0 19 3 11 0
                                    0 127 128 1 2 11 0 0 127 1 3 11 0 0 129 15
                                    1 2 11 0 0 129 1 2 7 0 0 15 1 1 7 0 0 1 2 3
                                    0 0 141 1 3 3 0 0 141 15 1 2 0 25 0 0 63 2
                                    3 0 0 0 1 2 0 0 0 0 1 1 0 0 0 67 2 0 0 0 0
                                    65 2 3 0 0 130 1 2 3 0 130 0 1 2 0 0 6 0 48
                                    2 0 0 0 6 1 2 0 0 0 0 69 2 0 0 49 0 51 2 0
                                    0 15 0 1 2 0 0 76 0 1)))))
           '|lookupComplete|)) 
