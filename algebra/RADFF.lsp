
(SDEFUN |RADFF;discriminant;F;1| (($ |Fraction| UP))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (SPADCALL (QREFELT $ 24) (QREFELT $ 40))))) 

(SDEFUN |RADFF;radcand| (($ UP))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (SPADCALL (QREFELT $ 28) (QREFELT $ 42))))) 

(SDEFUN |RADFF;integralBasis;V;3| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (|RADFF;diag| (QREFELT $ 31) $)))) 

(SDEFUN |RADFF;integralBasisAtInfinity;V;4| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (|RADFF;diag| (QREFELT $ 33) $)))) 

(SDEFUN |RADFF;basisvec| (($ |Vector| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (QREFELT $ 31)))) 

(SDEFUN |RADFF;integralMatrix;M;6| (($ |Matrix| (|Fraction| UP)))
        (SPADCALL (|RADFF;basisvec| $) (QREFELT $ 47))) 

(SDEFUN |RADFF;integralMatrixAtInfinity;M;7| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (SPADCALL (QREFELT $ 33) (QREFELT $ 47))))) 

(SDEFUN |RADFF;inverseIntegralMatrix;M;8| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (SPADCALL (QREFELT $ 32) (QREFELT $ 47))))) 

(SDEFUN |RADFF;inverseIntegralMatrixAtInfinity;M;9|
        (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 20) (QREFELT $ 39)) (|RADFF;startUp| 'NIL $)))
         (EXIT (SPADCALL (QREFELT $ 34) (QREFELT $ 47))))) 

(SDEFUN |RADFF;definingPolynomial;UPUP;10| (($ UPUP)) (QREFELT $ 30)) 

(SDEFUN |RADFF;ramified?;FB;11| ((|point| F) ($ |Boolean|))
        (SPADCALL (SPADCALL (|RADFF;radcand| $) |point| (QREFELT $ 53))
                  (QREFELT $ 54))) 

(SDEFUN |RADFF;branchPointAtInfinity?;B;12| (($ |Boolean|))
        (QEQCAR
         (SPADCALL (SPADCALL (|RADFF;radcand| $) (QREFELT $ 56)) (QREFELT $ 10)
                   (QREFELT $ 58))
         1)) 

(SDEFUN |RADFF;elliptic;U;13| (($ |Union| UP "failed"))
        (SEQ
         (COND
          ((EQL (QREFELT $ 10) 2)
           (COND
            ((EQL (SPADCALL (|RADFF;radcand| $) (QREFELT $ 56)) 3)
             (EXIT (CONS 0 (|RADFF;radcand| $)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;hyperelliptic;U;14| (($ |Union| UP "failed"))
        (SEQ
         (COND
          ((EQL (QREFELT $ 10) 2)
           (COND
            ((ODDP (SPADCALL (|RADFF;radcand| $) (QREFELT $ 56)))
             (EXIT (CONS 0 (|RADFF;radcand| $)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;diag| ((|v| |Vector| (|Fraction| UP)) ($ |Vector| $))
        (SPROG ((#1=#:G172 NIL) (|i| NIL) (#2=#:G171 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 29)))
                       . #4=(|RADFF;diag|))
                 (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL
                                 (SPADCALL
                                  (QAREF1O |v| (+ |i| (QREFELT $ 38)) 1) |i|
                                  (QREFELT $ 14))
                                 (QREFELT $ 63)))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))
                 #2#)))) 

(SDEFUN |RADFF;integralRepresents;VUP$;16| ((|v| |Vector| UP) (|d| UP) ($ $))
        (SPROG
         ((#1=#:G176 NIL) (#2=#:G178 NIL) (|i| NIL) (#3=#:G177 NIL)
          (|ib| (|Vector| (|Fraction| UP))))
         (SEQ
          (LETT |ib| (|RADFF;basisvec| $)
                . #4=(|RADFF;integralRepresents;VUP$;16|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV (|inc_SI| (- #5=(QVSIZE |ib|) #6=(QREFELT $ 38))))
                   . #4#)
             (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O |ib| |i| 1)
                                      (SPADCALL (QAREF1O |v| |i| 1) |d|
                                                (QREFELT $ 64))
                                      (QREFELT $ 65)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (QREFELT $ 66)))))) 

(SDEFUN |RADFF;integralCoordinates;$R;17|
        ((|f| $) ($ |Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
        (SPROG
         ((#1=#:G183 NIL) (#2=#:G185 NIL) (|i| NIL) (#3=#:G184 NIL)
          (|ib| (|Vector| (|Fraction| UP))) (|v| (|Vector| (|Fraction| UP))))
         (SEQ
          (LETT |v| (SPADCALL |f| (QREFELT $ 69))
                . #4=(|RADFF;integralCoordinates;$R;17|))
          (LETT |ib| (|RADFF;basisvec| $) . #4#)
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV (|inc_SI| (- #5=(QVSIZE |ib|) #6=(QREFELT $ 38))))
                   . #4#)
             (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O |v| |i| 1) (QAREF1O |ib| |i| 1)
                                      (QREFELT $ 70)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (QREFELT $ 73)))))) 

(SDEFUN |RADFF;integralDerivationMatrix;MR;18|
        ((|d| |Mapping| UP UP)
         ($ |Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
        (SPROG
         ((|cd| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
          (#1=#:G194 NIL) (#2=#:G196 NIL) (|i| NIL) (#3=#:G195 NIL)
          (|v| (|Vector| (|Fraction| UP))) (|dlogp| (|Fraction| UP)))
         (SEQ
          (LETT |dlogp|
                (SPADCALL (SPADCALL (QREFELT $ 9) |d| (QREFELT $ 76))
                          (SPADCALL (QREFELT $ 10) (QREFELT $ 9)
                                    (QREFELT $ 77))
                          (QREFELT $ 70))
                . #4=(|RADFF;integralDerivationMatrix;MR;18|))
          (LETT |v| (|RADFF;basisvec| $) . #4#)
          (LETT |cd|
                (SPADCALL
                 (PROGN
                  (LETT #3#
                        (GETREFV
                         (|inc_SI| (- #5=(QVSIZE |v|) #6=(QREFELT $ 38))))
                        . #4#)
                  (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#)
                       (LETT #1# 0 . #4#) G190 (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #3# #1#
                                 (SPADCALL
                                  (SPADCALL (- |i| (QREFELT $ 38)) |dlogp|
                                            (QREFELT $ 78))
                                  (SPADCALL
                                   (SPADCALL (QAREF1O |v| |i| 1) |d|
                                             (QREFELT $ 76))
                                   (QAREF1O |v| |i| 1) (QREFELT $ 70))
                                  (QREFELT $ 79)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 73))
                . #4#)
          (EXIT (CONS (SPADCALL (QCAR |cd|) (QREFELT $ 81)) (QCDR |cd|)))))) 

(SDEFUN |RADFF;iBasis| ((|p| UP) (|d| |NonNegativeInteger|) ($ |Vector| UP))
        (SPROG
         ((#1=#:G199 NIL) (#2=#:G198 (UP)) (#3=#:G200 (UP)) (#4=#:G206 NIL)
          (|j| NIL) (#5=#:G205 NIL) (|i| NIL) (#6=#:G204 NIL)
          (|d1| (|NonNegativeInteger|)) (#7=#:G197 NIL)
          (|pl| (|PrimitiveArray| UP)))
         (SEQ
          (LETT |pl| (|RADFF;fullVector| (SPADCALL |p| (QREFELT $ 85)) |d| $)
                . #8=(|RADFF;iBasis|))
          (LETT |d1|
                (PROG1 (LETT #7# (- |d| 1) . #8#)
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#))
                . #8#)
          (EXIT
           (PROGN
            (LETT #6# (GETREFV (|inc_SI| |d1|)) . #8#)
            (SEQ (LETT |i| 0 . #8#) (LETT #5# |d1| . #8#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #6# |i|
                           (PROGN
                            (LETT #1# NIL . #8#)
                            (SEQ (LETT |j| 0 . #8#) (LETT #4# |d1| . #8#) G190
                                 (COND ((|greater_SI| |j| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL (QAREF1 |pl| |j|)
                                                    (QUOTIENT2 (* |i| |j|) |d|)
                                                    (QREFELT $ 86))
                                          . #8#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 87))
                                            . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #3# . #8#)
                                       (LETT #1# 'T . #8#)))))))
                                 (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T (|spadConstant| $ 88)))))))
                 (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
            #6#))))) 

(SDEFUN |RADFF;fullVector|
        ((|p| |Factored| UP) (|m| |NonNegativeInteger|)
         ($ |PrimitiveArray| UP))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))
                    "failed"))
          (#1=#:G216 NIL) (|i| NIL)
          (|l|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|)))))
          (|ans| (|PrimitiveArray| UP)))
         (SEQ
          (LETT |ans| (MAKEARR1 |m| (|spadConstant| $ 25))
                . #2=(|RADFF;fullVector|))
          (QSETAREF1 |ans| 0 (SPADCALL |p| (QREFELT $ 94)))
          (LETT |l| (SPADCALL |p| (QREFELT $ 97)) . #2#)
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |ans| (QREFELT $ 99)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |ans| |i|
                            (SEQ
                             (LETT |u|
                                   (SPADCALL
                                    (CONS #'|RADFF;fullVector!0|
                                          (VECTOR $ |i|))
                                    |l| (QREFELT $ 103))
                                   . #2#)
                             (EXIT
                              (COND ((QEQCAR |u| 1) (|spadConstant| $ 88))
                                    ('T (QCAR (QCDR |u|)))))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |RADFF;fullVector!0| ((|s| NIL) ($$ NIL))
        (PROG (|i| $)
          (LETT |i| (QREFELT $$ 1) . #1=(|RADFF;fullVector|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (QCDR |s|) |i| (QREFELT $ 100)))))) 

(SDEFUN |RADFF;inftyBasis|
        ((|p| |Fraction| UP) (|m| |NonNegativeInteger|)
         ($ |Vector| (|Fraction| UP)))
        (SPROG
         ((|b| (|Fraction| UP)) (#1=#:G223 NIL) (|i| NIL)
          (|w| (|Vector| (|Fraction| UP))) (|v| (|Vector| UP))
          (|a| (|Fraction| UP))
          (|rt|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP)))
          (|x| (|Fraction| UP)))
         (SEQ
          (LETT |rt|
                (SPADCALL
                 (SPADCALL |p|
                           (LETT |x|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 104) 1
                                             (QREFELT $ 105))
                                   (QREFELT $ 106))
                                  (QREFELT $ 107))
                                 . #2=(|RADFF;inftyBasis|))
                           (QREFELT $ 109))
                 |m| (QREFELT $ 112))
                . #2#)
          (EXIT
           (COND
            ((SPADCALL |m| (QVELT |rt| 0) (QREFELT $ 113))
             (|error|
              "Curve not irreducible after change of variable 0 -> infinity"))
            ('T
             (SEQ
              (LETT |a| (SPADCALL (QVELT |rt| 1) |x| (QREFELT $ 109)) . #2#)
              (LETT |b| (|spadConstant| $ 12) . #2#)
              (LETT |v| (|RADFF;iBasis| (QVELT |rt| 2) |m| $) . #2#)
              (LETT |w| (MAKEARR1 |m| (|spadConstant| $ 21)) . #2#)
              (SEQ (LETT |i| (QREFELT $ 38) . #2#)
                   (LETT #1# (QVSIZE |v|) . #2#) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (QSETAREF1O |w| |i|
                                (SPADCALL |b|
                                          (SPADCALL
                                           (SPADCALL (QAREF1O |v| |i| 1)
                                                     (QREFELT $ 106))
                                           |x| (QREFELT $ 109))
                                          (QREFELT $ 70))
                                1)
                    (EXIT (LETT |b| (SPADCALL |b| |a| (QREFELT $ 65)) . #2#)))
                   (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |w|)))))))) 

(SDEFUN |RADFF;charPintbas|
        ((|p| UPUP) (|c| |Fraction| UP) (|v| |Vector| (|Fraction| UP))
         (|w| |Vector| (|Fraction| UP)) ($ |Void|))
        (SPROG
         ((|a| (|Fraction| UP)) (#1=#:G231 NIL) (|i| NIL) (#2=#:G232 NIL)
          (|j| NIL) (#3=#:G233 NIL) (|k| NIL)
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|q| (|SparseUnivariatePolynomial| UP)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| (QREFELT $ 114)) (QREFELT $ 10)
                      (QREFELT $ 113))
            (|error| "charPintbas: should not happen"))
           ('T
            (SEQ
             (LETT |q| (SPADCALL (ELT $ 115) |p| (QREFELT $ 119))
                   . #4=(|RADFF;charPintbas|))
             (LETT |ib|
                   (SPADCALL
                    (|compiledLookupCheck| '|integralBasis|
                                           (LIST
                                            (LIST '|Record|
                                                  (LIST '|:| '|basis|
                                                        (LIST '|Matrix|
                                                              (|devaluate|
                                                               (ELT $ 7))))
                                                  (LIST '|:| '|basisDen|
                                                        (|devaluate|
                                                         (ELT $ 7)))
                                                  (LIST '|:| '|basisInv|
                                                        (LIST '|Matrix|
                                                              (|devaluate|
                                                               (ELT $ 7))))))
                                           (|FunctionFieldIntegralBasis|
                                            (ELT $ 7)
                                            (|SparseUnivariatePolynomial|
                                             (ELT $ 7))
                                            (|SimpleAlgebraicExtension|
                                             (ELT $ 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 7))
                                             |q|))))
                   . #4#)
             (COND
              ((NULL (SPADCALL (QVELT |ib| 0) (QREFELT $ 121)))
               (EXIT (|error| "charPintbas: integral basis not diagonal"))))
             (LETT |a| (|spadConstant| $ 12) . #4#)
             (SEQ (LETT |k| (QREFELT $ 38) . #4#) (LETT #3# (QVSIZE |v|) . #4#)
                  (LETT |j| 1 . #4#)
                  (LETT #2# (SPADCALL (QVELT |ib| 0) (QREFELT $ 123)) . #4#)
                  (LETT |i| 1 . #4#)
                  (LETT #1# (SPADCALL (QVELT |ib| 0) (QREFELT $ 122)) . #4#)
                  G190
                  (COND
                   ((OR (|greater_SI| |i| #1#) (|greater_SI| |j| #2#)
                        (> |k| #3#))
                    (GO G191)))
                  (SEQ
                   (QSETAREF1O |v| |k|
                               (SPADCALL
                                (SPADCALL (QAREF2O (QVELT |ib| 0) |i| |j| 1 1)
                                          (QVELT |ib| 1) (QREFELT $ 64))
                                |a| (QREFELT $ 65))
                               1)
                   (QSETAREF1O |w| |k|
                               (SPADCALL (QAREF2O (QVELT |ib| 2) |i| |j| 1 1)
                                         (SPADCALL |a| (QREFELT $ 107))
                                         (QREFELT $ 124))
                               1)
                   (EXIT (LETT |a| (SPADCALL |a| |c| (QREFELT $ 65)) . #4#)))
                  (LETT |i|
                        (PROG1 (|inc_SI| |i|)
                          (LETT |j|
                                (PROG1 (|inc_SI| |j|)
                                  (LETT |k| (+ |k| 1) . #4#))
                                . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (QREFELT $ 126))))))))) 

(SDEFUN |RADFF;charPStartUp| (($ |Void|))
        (SPROG
         ((|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|invmod| (UPUP)) (|x| (|Fraction| UP)))
         (SEQ
          (LETT |r| (SPADCALL (QREFELT $ 30) (QREFELT $ 128))
                . #1=(|RADFF;charPStartUp|))
          (|RADFF;charPintbas| (QCDR |r|) (QCAR |r|) (QREFELT $ 31)
           (QREFELT $ 32) $)
          (LETT |x|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 104) 1 (QREFELT $ 105))
                           (QREFELT $ 106))
                 (QREFELT $ 107))
                . #1#)
          (LETT |invmod|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 12) (QREFELT $ 10) (QREFELT $ 14))
                 (SPADCALL (SPADCALL (QREFELT $ 9) |x| (QREFELT $ 109))
                           (QREFELT $ 15))
                 (QREFELT $ 16))
                . #1#)
          (LETT |r| (SPADCALL |invmod| (QREFELT $ 128)) . #1#)
          (EXIT
           (|RADFF;charPintbas| (QCDR |r|)
            (SPADCALL (QCAR |r|) |x| (QREFELT $ 109)) (QREFELT $ 33)
            (QREFELT $ 34) $))))) 

(SDEFUN |RADFF;startUp| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((|dsc| (|Fraction| UP)) (#1=#:G248 NIL)
          (#2=#:G247 #3=(|Fraction| UP)) (#4=#:G249 #3#) (#5=#:G252 NIL)
          (|i| NIL) (|p| (|NonNegativeInteger|)))
         (SEQ (SPADCALL (QREFELT $ 20) |b| (QREFELT $ 129))
              (COND
               ((OR
                 (ZEROP
                  (LETT |p| (SPADCALL (QREFELT $ 130)) . #6=(|RADFF;startUp|)))
                 (SPADCALL |p| (QREFELT $ 10) (QREFELT $ 131)))
                (|RADFF;char0StartUp| $))
               ('T (|RADFF;charPStartUp| $)))
              (LETT |dsc|
                    (SPADCALL
                     (SPADCALL
                      (*
                       (EXPT -1
                             (QUOTIENT2 (* (QREFELT $ 10) (QREFELT $ 29)) 2))
                       (EXPT (QREFELT $ 10) (QREFELT $ 10)))
                      (SPADCALL (QREFELT $ 9) (QREFELT $ 29) (QREFELT $ 132))
                      (QREFELT $ 78))
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |i| (QREFELT $ 38) . #6#)
                           (LETT #5# (QVSIZE (QREFELT $ 31)) . #6#) G190
                           (COND ((> |i| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (SPADCALL (QAREF1O (QREFELT $ 31) |i| 1) 2
                                              (QREFELT $ 133))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 65))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 12))))
                     (QREFELT $ 65))
                    . #6#)
              (SPADCALL (QREFELT $ 24)
                        (SPADCALL
                         (SPADCALL (SPADCALL |dsc| (QREFELT $ 134))
                                   (QREFELT $ 135))
                         (SPADCALL |dsc| (QREFELT $ 136)) (QREFELT $ 64))
                        (QREFELT $ 137))
              (EXIT (SPADCALL (QREFELT $ 126)))))) 

(SDEFUN |RADFF;char0StartUp| (($ |Void|))
        (SPROG
         ((|a| (|Fraction| UP)) (|invden| (|Fraction| UP)) (#1=#:G259 NIL)
          (|i| NIL) (|infb| (|Vector| (|Fraction| UP))) (|ib| (|Vector| UP))
          (|rp|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP))))
         (SEQ
          (LETT |rp| (SPADCALL (QREFELT $ 9) (QREFELT $ 10) (QREFELT $ 112))
                . #2=(|RADFF;char0StartUp|))
          (EXIT
           (COND
            ((SPADCALL (QVELT |rp| 0) (QREFELT $ 10) (QREFELT $ 113))
             (|error| "RadicalFunctionField: curve is not irreducible"))
            ('T
             (SEQ (SPADCALL (QREFELT $ 28) (QVELT |rp| 2) (QREFELT $ 138))
                  (LETT |ib|
                        (|RADFF;iBasis|
                         (SPADCALL (QREFELT $ 28) (QREFELT $ 42))
                         (QREFELT $ 10) $)
                        . #2#)
                  (LETT |infb|
                        (|RADFF;inftyBasis| (QREFELT $ 9) (QREFELT $ 10) $)
                        . #2#)
                  (LETT |invden| (|spadConstant| $ 12) . #2#)
                  (SEQ (LETT |i| (QREFELT $ 38) . #2#)
                       (LETT #1# (QVSIZE |ib|) . #2#) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (QSETAREF1O (QREFELT $ 32) |i|
                                    (LETT |a|
                                          (SPADCALL (QAREF1O |ib| |i| 1)
                                                    |invden| (QREFELT $ 124))
                                          . #2#)
                                    1)
                        (QSETAREF1O (QREFELT $ 31) |i|
                                    (SPADCALL |a| (QREFELT $ 107)) 1)
                        (LETT |invden|
                              (SPADCALL |invden| (QVELT |rp| 1) (QREFELT $ 70))
                              . #2#)
                        (QSETAREF1O (QREFELT $ 33) |i|
                                    (LETT |a| (QAREF1O |infb| |i| 1) . #2#) 1)
                        (EXIT
                         (QSETAREF1O (QREFELT $ 34) |i|
                                     (SPADCALL |a| (QREFELT $ 107)) 1)))
                       (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (QREFELT $ 126)))))))))) 

(SDEFUN |RADFF;ramified?;UPB;26| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 140))
                      |RADFF;ramified?;UPB;26|)
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 141)))
                       ('T
                        (QEQCAR
                         (SPADCALL (|RADFF;radcand| $) |p| (QREFELT $ 142))
                         0))))))) 

(SDEFUN |RADFF;singular?;UPB;27| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 140))
                      |RADFF;singular?;UPB;27|)
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 141)))
                       ('T
                        (QEQCAR
                         (SPADCALL (|RADFF;radcand| $)
                                   (SPADCALL |p| 2 (QREFELT $ 145))
                                   (QREFELT $ 142))
                         0))))))) 

(SDEFUN |RADFF;branchPoint?;UPB;28| ((|p| UP) ($ |Boolean|))
        (SPROG ((|q| (|Union| UP "failed")) (|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 140))
                      . #1=(|RADFF;branchPoint?;UPB;28|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 147)))
                       (#2='T
                        (SEQ
                         (LETT |q|
                               (SPADCALL (|RADFF;radcand| $) |p|
                                         (QREFELT $ 142))
                               . #1#)
                         (EXIT
                          (COND
                           ((QEQCAR |q| 0)
                            (QEQCAR (SPADCALL (QCDR |q|) |p| (QREFELT $ 142))
                                    1))
                           (#2# 'NIL)))))))))) 

(SDEFUN |RADFF;singular?;FB;29| ((|point| F) ($ |Boolean|))
        (SPROG ((#1=#:G286 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| $) |point| (QREFELT $ 53))
                  (QREFELT $ 54))
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|RADFF;radcand| $)
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 104) 1
                                                  (QREFELT $ 105))
                                        (SPADCALL |point| (QREFELT $ 149))
                                        (QREFELT $ 150))
                                       (QREFELT $ 142))
                             |RADFF;singular?;FB;29|)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) "failed") #1#))
                   |point| (QREFELT $ 53))
                  (QREFELT $ 54)))
                ('T 'NIL)))) 

(SDEFUN |RADFF;branchPoint?;FB;30| ((|point| F) ($ |Boolean|))
        (SPROG ((#1=#:G291 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| $) |point| (QREFELT $ 53))
                  (QREFELT $ 54))
                 (COND
                  ((SPADCALL
                    (SPADCALL
                     (PROG2
                         (LETT #1#
                               (SPADCALL (|RADFF;radcand| $)
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 104) 1
                                                    (QREFELT $ 105))
                                          (SPADCALL |point| (QREFELT $ 149))
                                          (QREFELT $ 150))
                                         (QREFELT $ 142))
                               |RADFF;branchPoint?;FB;30|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                       (|Union| (QREFELT $ 7) "failed") #1#))
                     |point| (QREFELT $ 53))
                    (QREFELT $ 54))
                   'NIL)
                  (#2='T 'T)))
                (#2# 'NIL)))) 

(DECLAIM (NOTINLINE |RadicalFunctionField;|)) 

(DEFUN |RadicalFunctionField| (&REST #1=#:G336)
  (SPROG NIL
         (PROG (#2=#:G337)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RadicalFunctionField|)
                                               '|domainEqualList|)
                    . #3=(|RadicalFunctionField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RadicalFunctionField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalFunctionField|)))))))))) 

(DEFUN |RadicalFunctionField;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((#1=#:G122 NIL) (|pv$| NIL) (#2=#:G334 NIL) (#3=#:G335 NIL) ($ NIL)
    (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|RadicalFunctionField|))
    (LETT DV$2 (|devaluate| |#2|) . #4#)
    (LETT DV$3 (|devaluate| |#3|) . #4#)
    (LETT DV$4 (|devaluate| |#4|) . #4#)
    (LETT DV$5 (|devaluate| |#5|) . #4#)
    (LETT |dv$| (LIST '|RadicalFunctionField| DV$1 DV$2 DV$3 DV$4 DV$5) . #4#)
    (LETT $ (GETREFV 189) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #3#
                                              (|HasCategory| (|Fraction| |#2|)
                                                             '(|Field|))
                                              . #4#)
                                        (OR #3#
                                            (|HasCategory| (|Fraction| |#2|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Finite|))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|DifferentialRing|))
                                          #3#)
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|LinearlyExplicitRingOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|Field|)))
                                              . #4#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|FiniteFieldCategory|))))
                                        (OR
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#)
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|Finite|))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|RadicalFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 20 (SPADCALL 'T (QREFELT $ 19)))
    (QSETREFV $ 24 (SPADCALL (|spadConstant| $ 21) (QREFELT $ 23)))
    (QSETREFV $ 28 (SPADCALL (|spadConstant| $ 25) (QREFELT $ 27)))
    (QSETREFV $ 29
              (PROG1 (LETT #1# (- |#5| 1) . #4#)
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV $ 30
              (SPADCALL (SPADCALL (|spadConstant| $ 12) |#5| (QREFELT $ 14))
                        (SPADCALL |#4| (QREFELT $ 15)) (QREFELT $ 16)))
    (QSETREFV $ 31 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 32 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 33 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 34 (MAKEARR1 |#5| (|spadConstant| $ 21)))
    (QSETREFV $ 38 (SPADCALL (QREFELT $ 31) (QREFELT $ 37)))
    $))) 

(MAKEPROP '|RadicalFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 11 8
                                          (NRTEVAL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 12)
                                                      (QREFELT $ 10)
                                                      (QREFELT $ 14))
                                            (SPADCALL (QREFELT $ 9)
                                                      (QREFELT $ 15))
                                            (QREFELT $ 16))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|local| |#5|) (|Fraction| 7) (0 . |One|) (|NonNegativeInteger|)
              (4 . |monomial|) (10 . |coerce|) (15 . -) (|Boolean|)
              (|Reference| 17) (21 . |ref|) '|brandNew?| (26 . |Zero|)
              (|Reference| 11) (30 . |ref|) '|discPoly| (35 . |Zero|)
              (|Reference| 7) (39 . |ref|) '|newrad| '|n1| '|modulus| '|ibasis|
              '|invibasis| '|infbasis| '|invinfbasis| (|Integer|) (|Vector| 11)
              (44 . |minIndex|) '|mini| (49 . |deref|) (54 . |elt|)
              |RADFF;discriminant;F;1| (59 . |elt|) (|Vector| $)
              |RADFF;integralBasis;V;3| |RADFF;integralBasisAtInfinity;V;4|
              (|Matrix| 11) (64 . |diagonalMatrix|) |RADFF;integralMatrix;M;6|
              |RADFF;integralMatrixAtInfinity;M;7|
              |RADFF;inverseIntegralMatrix;M;8|
              |RADFF;inverseIntegralMatrixAtInfinity;M;9|
              |RADFF;definingPolynomial;UPUP;10| (69 . |elt|) (75 . |zero?|)
              |RADFF;ramified?;FB;11| (80 . |degree|) (|Union| $ '"failed")
              (85 . |exquo|) |RADFF;branchPointAtInfinity?;B;12|
              (|Union| 7 '"failed") |RADFF;elliptic;U;13|
              |RADFF;hyperelliptic;U;14| (91 . |reduce|) (96 . /) (102 . *)
              (108 . |represents|) (|Vector| 7)
              |RADFF;integralRepresents;VUP$;16| (113 . |coordinates|)
              (118 . /) (|Record| (|:| |num| 67) (|:| |den| 7))
              (|InnerCommonDenominator| 7 11 67 36) (124 . |splitDenominator|)
              |RADFF;integralCoordinates;$R;17| (|Mapping| 7 7)
              (129 . |differentiate|) (135 . *) (141 . *) (147 . +)
              (|Matrix| 7) (153 . |diagonalMatrix|)
              (|Record| (|:| |num| 80) (|:| |den| 7))
              |RADFF;integralDerivationMatrix;MR;18| (|Factored| $)
              (158 . |squareFree|) (163 . ^) (169 . *) (175 . |One|)
              (179 . |Zero|) (183 . |Zero|) (187 . |Zero|) (|Factored| 7)
              (191 . |Zero|) (195 . |unit|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 35)) (|List| 95)
              (200 . |factors|) (|PrimitiveArray| 7) (205 . |maxIndex|)
              (210 . =) (|Union| 95 '"failed") (|Mapping| 17 95) (216 . |find|)
              (222 . |One|) (226 . |monomial|) (232 . |coerce|) (237 . |inv|)
              (|Fraction| $) (242 . |elt|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 11) (|:| |radicand| 7))
              (|ChangeOfVariable| 6 7 8) (248 . |rootPoly|) (254 . ~=)
              (260 . |degree|) (265 . |retract|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 8 7 116)
              (270 . |map|) (276 . |basis|) (280 . |diagonal?|)
              (285 . |maxRowIndex|) (290 . |maxColIndex|) (295 . *) (|Void|)
              (301 . |void|) (|Record| (|:| |coef| 11) (|:| |poly| 8))
              (305 . |mkIntegral|) (310 . |setelt!|) (316 . |characteristic|)
              (320 . >) (326 . ^) (332 . ^) (338 . |numer|)
              (343 . |primitivePart|) (348 . |denom|) (353 . |setelt!|)
              (359 . |setelt!|) (|Union| 6 '#1="failed") (365 . |retractIfCan|)
              |RADFF;singular?;FB;29| (370 . |exquo|) |RADFF;ramified?;UPB;26|
              (|PositiveInteger|) (376 . ^) |RADFF;singular?;UPB;27|
              |RADFF;branchPoint?;FB;30| |RADFF;branchPoint?;UPB;28|
              (382 . |coerce|) (387 . -) (|List| 153) (|List| 13) (|Symbol|)
              (|Fraction| 35)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 157 '"failed")
              (|Record| (|:| |coef| 157) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 163 '"failed") (|Mapping| 11 11) (|Fraction| 8)
              (|InputForm|) (|Union| 13 '"failed") (|OnePointCompletion| 144)
              (|Union| 43 '"failed") (|Matrix| $) (|Table| 144 13)
              (|Record| (|:| |factor| 35) (|:| |exponent| 35)) (|List| 173)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Matrix| 35)
              (|Record| (|:| |mat| 176) (|:| |vec| (|Vector| 35)))
              (|Union| 154 '#1#) (|Union| 35 '#1#) (|List| (|Polynomial| 6))
              (|List| (|List| 6))
              (|Record| (|:| |num| $) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Record| (|:| |mat| 46) (|:| |vec| 36)) (|Union| 11 '#1#)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 393 |zero?| 399 |yCoordinates| 404 |unitNormal| 409
              |unitCanonical| 414 |unit?| 419 |traceMatrix| 424 |trace| 433
              |tableForDiscreteLogarithm| 438 |subtractIfCan| 443
              |squareFreePart| 449 |squareFree| 454 |smaller?| 459 |sizeLess?|
              465 |size| 471 |singularAtInfinity?| 475 |singular?| 479 |sample|
              489 |retractIfCan| 493 |retract| 508 |represents| 523
              |representationType| 540 |rem| 544 |regularRepresentation| 550
              |reducedSystem| 561 |reduceBasisAtInfinity| 583 |reduce| 588
              |recip| 598 |rationalPoints| 603 |rationalPoint?| 607 |rank| 613
              |random| 617 |ramifiedAtInfinity?| 621 |ramified?| 625 |quo| 635
              |principalIdeal| 641 |primitivePart| 646 |primitiveElement| 651
              |primitive?| 655 |primeFrobenius| 660 |prime?| 671 |order| 676
              |opposite?| 686 |one?| 692 |numberOfComponents| 697
              |normalizeAtInfinity| 701 |norm| 706 |nonSingularModel| 711
              |nextItem| 716 |multiEuclidean| 721 |minimalPolynomial| 727
              |lookup| 732 |lift| 737 |lcmCoef| 742 |lcm| 748 |latex| 759
              |inverseIntegralMatrixAtInfinity| 764 |inverseIntegralMatrix| 768
              |inv| 772 |integralRepresents| 777 |integralMatrixAtInfinity| 783
              |integralMatrix| 787 |integralDerivationMatrix| 791
              |integralCoordinates| 796 |integralBasisAtInfinity| 801
              |integralBasis| 805 |integralAtInfinity?| 809 |integral?| 814
              |init| 831 |index| 835 |hyperelliptic| 840 |hashUpdate!| 844
              |hash| 850 |genus| 855 |generator| 859 |gcdPolynomial| 863 |gcd|
              869 |factorsOfCyclicGroupSize| 880 |factor| 884
              |extendedEuclidean| 889 |exquo| 902 |expressIdealMember| 908
              |euclideanSize| 914 |enumerate| 919 |elt| 923 |elliptic| 930
              |divide| 934 |discriminant| 940 |discreteLog| 949 |differentiate|
              960 |derivationCoordinates| 1016 |definingPolynomial| 1022
              |createPrimitiveElement| 1026 |coordinates| 1030 |convert| 1052
              |conditionP| 1077 |complementaryBasis| 1082 |coerce| 1087
              |charthRoot| 1112 |characteristicPolynomial| 1122
              |characteristic| 1127 |branchPointAtInfinity?| 1131
              |branchPoint?| 1135 |basis| 1145 |associates?| 1149 |annihilate?|
              1155 |algSplitSimple| 1161 |absolutelyIrreducible?| 1167 ^ 1171
              |Zero| 1189 |One| 1193 D 1197 = 1247 / 1253 - 1259 + 1270 * 1276)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 2 2 4 4 4 3 0 4 0 4 3 0 0 3 3 3 3 0 0 0 1
                                  3 3 3 5 7 12 10 0 0 0 3 0 0 0 0 0 3 3 0 0 0 0
                                  0 0 6 0 0 6 2 0 0 0 0 0 0 0 0 3 3 3 6 8 9))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |FramedAlgebra&| |GcdDomain&| |FiniteRankAlgebra&| NIL
                |DivisionRing&| |Algebra&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| NIL |Algebra&| |DifferentialExtension&| NIL NIL
                |Module&| NIL |Module&| |EntireRing&| |Module&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL |Ring&|
                NIL NIL NIL NIL |Rng&| NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |Finite&| |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL |FullyRetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8) (|GcdDomain|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8) (|IntegralDomain|)
                 (|DivisionRing|) (|Algebra| (|Fraction| 7))
                 (|FullyLinearlyExplicitRingOver| (|Fraction| 7))
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 154)
                 (|DifferentialExtension| (|Fraction| 7))
                 (|LinearlyExplicitRingOver| (|Fraction| 7))
                 (|CommutativeRing|) (|Module| (|Fraction| 7))
                 (|CharacteristicZero|) (|Module| $$) (|EntireRing|)
                 (|Module| 154) (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 153)
                 (|LinearlyExplicitRingOver| 35) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|BiModule| 154 154) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|RightModule| (|Fraction| 7))
                 (|LeftModule| (|Fraction| 7)) (|LeftModule| 154)
                 (|RightModule| 154) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|Finite|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|SetCategory|)
                 (|RetractableTo| (|Fraction| 7)) (|ConvertibleTo| 8)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 188) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|ConvertibleTo| 167)
                 (|RetractableTo| 154) (|RetractableTo| 35))
              (|makeByteWordVec2| 188
                                  '(0 11 0 12 2 8 0 11 13 14 1 8 0 11 15 2 8 0
                                    0 0 16 1 18 0 17 19 0 11 0 21 1 22 0 11 23
                                    0 7 0 25 1 26 0 7 27 1 36 35 0 37 1 18 17 0
                                    39 1 22 11 0 40 1 26 7 0 42 1 46 0 36 47 2
                                    7 6 0 6 53 1 6 17 0 54 1 7 13 0 56 2 13 57
                                    0 0 58 1 0 0 8 63 2 11 0 7 7 64 2 11 0 0 0
                                    65 1 0 0 36 66 1 0 36 0 69 2 11 0 0 0 70 1
                                    72 71 36 73 2 11 0 0 75 76 2 11 0 13 0 77 2
                                    11 0 35 0 78 2 11 0 0 0 79 1 80 0 67 81 1 7
                                    84 0 85 2 7 0 0 13 86 2 7 0 0 0 87 0 7 0 88
                                    0 0 0 89 0 6 0 90 0 8 0 91 0 92 0 93 1 92 7
                                    0 94 1 92 96 0 97 1 98 35 0 99 2 35 17 0 0
                                    100 2 96 101 102 0 103 0 6 0 104 2 7 0 6 13
                                    105 1 11 0 7 106 1 11 0 0 107 2 7 108 108
                                    108 109 2 111 110 11 13 112 2 13 17 0 0 113
                                    1 8 13 0 114 1 11 7 0 115 2 118 116 117 8
                                    119 0 0 43 120 1 80 17 0 121 1 80 35 0 122
                                    1 80 35 0 123 2 11 0 7 0 124 0 125 0 126 1
                                    111 127 8 128 2 18 17 0 17 129 0 6 13 130 2
                                    13 17 0 0 131 2 11 0 0 13 132 2 11 0 0 35
                                    133 1 11 7 0 134 1 7 0 0 135 1 11 7 0 136 2
                                    22 11 0 11 137 2 26 7 0 7 138 1 7 139 0 140
                                    2 7 57 0 0 142 2 7 0 0 144 145 1 7 0 6 149
                                    2 7 0 0 0 150 2 0 17 0 0 1 1 0 17 0 1 1 0
                                    71 0 1 1 3 155 0 1 1 3 0 0 1 1 3 17 0 1 0 0
                                    46 1 1 0 46 43 1 1 0 11 0 1 1 2 172 35 1 2
                                    0 57 0 0 1 1 3 0 0 1 1 3 84 0 1 2 6 17 0 0
                                    1 2 3 17 0 0 1 0 6 13 1 0 0 17 1 1 0 17 7
                                    146 1 0 17 6 141 0 0 0 1 1 8 178 0 1 1 9
                                    179 0 1 1 0 184 0 1 1 8 154 0 1 1 9 35 0 1
                                    1 0 11 0 1 2 0 0 67 7 1 1 0 0 36 66 2 0 0
                                    36 43 1 0 2 175 1 2 3 0 0 0 1 1 0 46 0 1 2
                                    0 46 0 43 1 1 10 176 171 1 2 10 177 171 43
                                    1 1 0 46 171 1 2 0 183 171 43 1 1 0 43 43 1
                                    1 3 57 166 1 1 0 0 8 63 1 0 57 0 1 0 15 181
                                    1 2 0 17 6 6 1 0 0 144 1 0 6 0 1 0 0 17 1 1
                                    0 17 7 143 1 0 17 6 55 2 3 0 0 0 1 1 3 160
                                    157 1 1 0 0 0 1 0 2 0 1 1 2 17 0 1 1 2 0 0
                                    1 2 2 0 0 13 1 1 3 17 0 1 1 2 169 0 1 1 2
                                    144 0 1 2 0 17 0 0 1 1 0 17 0 1 0 0 13 1 1
                                    0 43 43 1 1 0 11 0 1 1 14 180 153 1 1 2 57
                                    0 1 2 3 159 157 0 1 1 3 8 0 1 1 6 144 0 1 1
                                    0 8 0 1 2 3 156 0 0 1 1 3 0 157 1 2 3 0 0 0
                                    1 1 0 185 0 1 0 0 46 51 0 0 46 50 1 3 0 0 1
                                    2 0 0 67 7 68 0 0 46 49 0 0 46 48 1 0 82 75
                                    83 1 0 71 0 74 0 0 43 45 0 0 43 44 1 0 17 0
                                    1 2 0 17 0 6 1 2 0 17 0 7 1 1 0 17 0 1 0 2
                                    0 1 1 6 0 144 1 0 0 60 62 2 0 187 187 0 1 1
                                    0 186 0 1 0 0 13 1 0 0 0 1 2 3 158 158 158
                                    1 1 3 0 157 1 2 3 0 0 0 1 0 2 174 1 1 3 84
                                    0 1 2 3 162 0 0 1 3 3 164 0 0 0 1 2 3 57 0
                                    0 1 2 3 159 157 0 1 1 3 13 0 1 0 6 157 1 3
                                    0 6 0 6 6 1 0 0 60 61 2 3 161 0 0 1 0 0 11
                                    41 1 0 11 43 1 2 2 168 0 0 1 1 2 13 0 1 3
                                    11 0 0 151 152 1 2 11 0 0 151 1 3 11 0 0
                                    153 13 1 2 11 0 0 153 1 2 7 0 0 13 1 1 7 0
                                    0 1 3 3 0 0 165 13 1 2 3 0 0 165 1 2 0 0 0
                                    75 1 2 3 46 43 165 1 0 0 8 52 0 2 0 1 1 0
                                    46 43 1 1 0 36 0 69 2 0 46 43 43 1 2 0 36 0
                                    43 1 1 6 167 0 1 1 0 0 8 1 1 0 8 0 1 1 0 0
                                    36 1 1 0 36 0 1 1 2 170 171 1 1 0 43 43 1 1
                                    13 0 154 1 1 3 0 0 1 1 0 0 11 1 1 0 0 35 1
                                    1 0 188 0 1 1 5 57 0 1 1 2 0 0 1 1 0 8 0 1
                                    0 0 13 1 0 0 17 59 1 0 17 7 148 1 0 17 6
                                    147 0 0 43 120 2 3 17 0 0 1 2 0 17 0 0 1 2
                                    0 182 0 75 1 0 0 17 1 2 3 0 0 35 1 2 0 0 0
                                    13 1 2 0 0 0 144 1 0 0 0 89 0 0 0 1 3 11 0
                                    0 151 152 1 3 11 0 0 153 13 1 2 11 0 0 153
                                    1 2 11 0 0 151 1 2 7 0 0 13 1 1 7 0 0 1 2 3
                                    0 0 165 1 3 3 0 0 165 13 1 2 0 17 0 0 1 2 3
                                    0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    3 0 0 154 1 2 3 0 154 0 1 2 0 0 0 11 1 2 0
                                    0 11 0 1 2 0 0 0 0 1 2 0 0 35 0 1 2 0 0 13
                                    0 1 2 0 0 144 0 1)))))
           '|lookupComplete|)) 
