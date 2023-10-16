
(SDEFUN |FFCGP;tableForDiscreteLogarithm;IT;1|
        ((|fac| |Integer|)
         ($ |Table| (|PositiveInteger|) (|NonNegativeInteger|)))
        (SPADCALL (QREFELT $ 40))) 

(SDEFUN |FFCGP;getZechTable;Pa;2| (($ |PrimitiveArray| (|SingleInteger|)))
        (QREFELT $ 24)) 

(SDEFUN |FFCGP;order;$Pi;3| ((|x| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G130 NIL))
               (COND
                ((SPADCALL |x| (QREFELT $ 45))
                 (|error| "order: order of zero undefined"))
                ('T
                 (PROG1
                     (LETT #1#
                           (QUOTIENT2 (QREFELT $ 22) (GCD (QREFELT $ 22) |x|)))
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|Integer|) #1#)))))) 

(SDEFUN |FFCGP;primitive?;$B;4| ((|x| $) ($ |Boolean|))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 45))
              (SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 47)))
          NIL)
         ('T
          (COND ((SPADCALL (GCD |x| (QREFELT $ 22)) 1 (QREFELT $ 47)) 'T)
                ('T NIL))))) 

(SDEFUN |FFCGP;coordinates;$V;5| ((|x| $) ($ |Vector| GF))
        (SPROG
         ((|primElement|
           (|SimpleAlgebraicExtension| GF (|SparseUnivariatePolynomial| GF)
                                       |defpol|)))
         (SEQ
          (COND
           ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 47))
            (MAKEARR1 (QREFELT $ 12) (|spadConstant| $ 49)))
           ('T
            (SEQ
             (LETT |primElement|
                   (SPADCALL (SPADCALL (|spadConstant| $ 50) 1 (QREFELT $ 51))
                             (QREFELT $ 53)))
             (EXIT
              (SPADCALL (SPADCALL |primElement| |x| (QREFELT $ 54))
                        (QREFELT $ 56))))))))) 

(SDEFUN |FFCGP;+;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG ((|d| (|Rep|)))
               (SEQ (COND ((QREFELT $ 36) (|FFCGP;initializeZech| $)))
                    (EXIT
                     (COND ((|eql_SI| |x| -1) |y|) ((|eql_SI| |y| -1) |x|)
                           (#1='T
                            (SEQ
                             (LETT |d| (|submod_SI| |y| |x| (QREFELT $ 22)))
                             (EXIT
                              (COND
                               ((SPADCALL |d| (|lshift_SI| (QREFELT $ 22) -1)
                                          (QREFELT $ 58))
                                (COND
                                 ((|eql_SI| (QAREF1 (QREFELT $ 24) |d|) -1) -1)
                                 (#1#
                                  (|addmod_SI| |x| (QAREF1 (QREFELT $ 24) |d|)
                                               (QREFELT $ 22)))))
                               (#1#
                                (SEQ (LETT |d| (|sub_SI| (QREFELT $ 22) |d|))
                                     (EXIT
                                      (|addmod_SI| |y|
                                                   (QAREF1 (QREFELT $ 24) |d|)
                                                   (QREFELT $ 22)))))))))))))) 

(SDEFUN |FFCGP;initializeZech| (($ |Void|))
        (SEQ (SETELT $ 24 (SPADCALL (QREFELT $ 7) (QREFELT $ 61)))
             (SETELT $ 36 NIL) (EXIT (SPADCALL (QREFELT $ 63))))) 

(SDEFUN |FFCGP;basis;PiV;8| ((|n| |PositiveInteger|) ($ |Vector| $))
        (SPROG
         ((#1=#:G145 NIL) (#2=#:G151 NIL) (|i| NIL) (#3=#:G150 NIL)
          (|m| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL (REM (SPADCALL (QREFELT $ 66)) |n|) 0 (QREFELT $ 67))
            (|error| "argument must divide extension degree"))
           ('T
            (SEQ
             (LETT |m|
                   (QUOTIENT2 (QREFELT $ 22)
                              (-
                               (SPADCALL (SPADCALL (QREFELT $ 13)) |n|
                                         (QREFELT $ 16))
                               1)))
             (EXIT
              (PROGN
               (LETT #3# (GETREFV |n|))
               (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT #3# |i|
                              (SPADCALL
                               (PROG1
                                   (LETT #1#
                                         (+ 1
                                            (SPADCALL |i| |m| (QREFELT $ 68))))
                                 (|check_subtype2| (> #1# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT $ 69)))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
               #3#)))))))) 

(SDEFUN |FFCGP;*;I2$;9| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 72)) (QREFELT $ 73)) |x|
                  (QREFELT $ 74))) 

(SDEFUN |FFCGP;minimalPolynomial;$Sup;10|
        ((|a| $) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|f| (|SparseUnivariatePolynomial| $))
          (|p| (|SparseUnivariatePolynomial| GF)) (|g| (GF)) (|u| ($)))
         (SEQ
          (LETT |f|
                (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 77))
                          (SPADCALL |a| 0 (QREFELT $ 77)) (QREFELT $ 78)))
          (LETT |u| (SPADCALL |a| (QREFELT $ 79)))
          (SEQ G190
               (COND
                ((NULL (NULL (SPADCALL |u| |a| (QREFELT $ 47)))) (GO G191)))
               (SEQ
                (LETT |f|
                      (SPADCALL |f|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 21) 1
                                           (QREFELT $ 77))
                                 (SPADCALL |u| 0 (QREFELT $ 77))
                                 (QREFELT $ 78))
                                (QREFELT $ 80)))
                (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 79)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |p| (|spadConstant| $ 30))
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |f| (QREFELT $ 81)))) (GO G191)))
               (SEQ
                (LETT |g|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 82)) (QREFELT $ 83)))
                (LETT |p|
                      (SPADCALL |p|
                                (SPADCALL |g| (SPADCALL |f| (QREFELT $ 84))
                                          (QREFELT $ 51))
                                (QREFELT $ 85)))
                (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 86)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |p|)))) 

(SDEFUN |FFCGP;factorsOfCyclicGroupSize;L;11|
        (($ |List|
          (|Record| (|:| |factor| (|Integer|))
                    (|:| |exponent| (|NonNegativeInteger|)))))
        (SEQ (COND ((NULL (QREFELT $ 35)) (|FFCGP;initializeElt| $)))
             (EXIT (QREFELT $ 35)))) 

(PUT '|FFCGP;representationType;U;12| '|SPADreplace|
     '(XLAM NIL (CONS 3 "cyclic"))) 

(SDEFUN |FFCGP;representationType;U;12|
        (($ |Union| "prime" "polynomial" "normal" "cyclic")) (CONS 3 "cyclic")) 

(SDEFUN |FFCGP;definingPolynomial;Sup;13| (($ |SparseUnivariatePolynomial| GF))
        (QREFELT $ 7)) 

(SDEFUN |FFCGP;random;$;14| (($ $)) (|sub_SI| (RANDOM (QREFELT $ 14)) 1)) 

(SDEFUN |FFCGP;represents;V$;15| ((|v| |Vector| GF) ($ $))
        (SPROG ((|u| (|FiniteFieldExtensionByPolynomial| GF |defpol|)))
               (SEQ (LETT |u| (SPADCALL |v| (QREFELT $ 96)))
                    (EXIT
                     (COND
                      ((SPADCALL |u| (|spadConstant| $ 97) (QREFELT $ 98))
                       (|spadConstant| $ 31))
                      ('T (SPADCALL |u| (QREFELT $ 99)))))))) 

(SDEFUN |FFCGP;coerce;GF$;16| ((|e| GF) ($ $))
        (SPROG ((|log| (|Integer|)) (#1=#:G181 NIL))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 101)) (|spadConstant| $ 31))
                      ('T
                       (SEQ
                        (LETT |log|
                              (SPADCALL
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL (QREFELT $ 34) |e|
                                                   (QREFELT $ 103)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0)
                                                 (|NonNegativeInteger|)
                                                 (|Union|
                                                  (|NonNegativeInteger|)
                                                  "failed")
                                                 #1#))
                               (QREFELT $ 23) (QREFELT $ 68)))
                        (EXIT
                         (SPADCALL |log| (QREFELT $ 22) (QREFELT $ 104))))))))) 

(SDEFUN |FFCGP;retractIfCan;$U;17| ((|x| $) ($ |Union| GF "failed"))
        (SPROG ((#1=#:G190 NIL) (|u| (|Union| $ #2="failed")))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 45)) (CONS 0 (|spadConstant| $ 49)))
                 (#3='T
                  (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 23) (QREFELT $ 106)))
                       (EXIT
                        (COND
                         ((SPADCALL |u| (CONS 1 "failed") (QREFELT $ 108))
                          (CONS 1 "failed"))
                         (#3#
                          (CONS 0
                                (SPADCALL (QREFELT $ 34)
                                          (PROG2 (LETT #1# |u|)
                                              (QCDR #1#)
                                            (|check_union2| (QEQCAR #1# 0) $
                                                            (|Union| $ #2#)
                                                            #1#))
                                          (QREFELT $ 109)))))))))))) 

(SDEFUN |FFCGP;retract;$GF;18| ((|x| $) ($ GF))
        (SPROG ((#1=#:G202 NIL) (|a| (|Union| GF #2="failed")))
               (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 111)))
                    (EXIT
                     (COND
                      ((SPADCALL |a| (CONS 1 "failed") (QREFELT $ 112))
                       (|error| "element not in ground field"))
                      ('T
                       (PROG2 (LETT #1# |a|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                         (|Union| (QREFELT $ 6) #2#) #1#)))))))) 

(SDEFUN |FFCGP;basis;V;19| (($ |Vector| $))
        (SPROG
         ((#1=#:G207 NIL) (#2=#:G210 NIL) (#3=#:G212 NIL) (|i| NIL)
          (#4=#:G211 NIL))
         (SEQ
          (PROGN
           (LETT #4# (GETREFV #5=(QREFELT $ 12)))
           (SEQ (LETT |i| 1) (LETT #3# #5#) (LETT #2# 0) G190
                (COND ((|greater_SI| |i| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #4# #2#
                          (SPADCALL
                           (PROG1 (LETT #1# |i|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|NonNegativeInteger|) #1#))
                           (QREFELT $ 69)))))
                (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #4#)))) 

(SDEFUN |FFCGP;inGroundField?;$B;20| ((|x| $) ($ |Boolean|))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 45))
              (|eql_SI| (SPADCALL |x| (QREFELT $ 23) (QREFELT $ 114)) 0))
          'T)
         ('T NIL))) 

(SDEFUN |FFCGP;discreteLog;2$U;21|
        ((|b| $) (|x| $) ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|e1| (|Record| (|:| |coef1| $) (|:| |coef2| $))) (#1=#:G221 NIL)
          (|e|
           (|Union| (|Record| (|:| |coef1| $) (|:| |coef2| $)) #2="failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 45)) (CONS 1 "failed"))
                (#3='T
                 (SEQ
                  (LETT |e| (SPADCALL |b| (QREFELT $ 22) |x| (QREFELT $ 118)))
                  (EXIT
                   (COND
                    ((SPADCALL |e| (CONS 1 "failed") (QREFELT $ 121))
                     (CONS 1 "failed"))
                    (#3#
                     (SEQ
                      (LETT |e1|
                            (PROG2 (LETT #1# |e|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|Record| (|:| |coef1| $)
                                                        (|:| |coef2| $))
                                              (|Union|
                                               (|Record| (|:| |coef1| $)
                                                         (|:| |coef2| $))
                                               #2#)
                                              #1#)))
                      (EXIT
                       (CONS 0
                             (SPADCALL (QCAR |e1|) (QREFELT $ 22)
                                       (QREFELT $ 114)))))))))))))) 

(SDEFUN |FFCGP;-;2$;22| ((|x| $) ($ $))
        (COND ((|eql_SI| |x| -1) -1) ((EQL (SPADCALL (QREFELT $ 123)) 2) |x|)
              ('T
               (|addmod_SI| |x| (|lshift_SI| (QREFELT $ 22) -1)
                            (QREFELT $ 22))))) 

(PUT '|FFCGP;generator;$;23| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |FFCGP;generator;$;23| (($ $)) 1) 

(PUT '|FFCGP;createPrimitiveElement;$;24| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |FFCGP;createPrimitiveElement;$;24| (($ $)) 1) 

(PUT '|FFCGP;primitiveElement;$;25| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |FFCGP;primitiveElement;$;25| (($ $)) 1) 

(SDEFUN |FFCGP;discreteLog;$Nni;26| ((|x| $) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL |x| (QREFELT $ 45)) (|error| "discrete logarithm error"))
         ('T |x|))) 

(SDEFUN |FFCGP;normalElement;$;27| (($ $))
        (SEQ (COND ((QREFELT $ 37) (|FFCGP;initializeElt| $)))
             (EXIT (QREFELT $ 38)))) 

(SDEFUN |FFCGP;initializeElt| (($ |Void|))
        (SEQ
         (SETELT $ 35
                 (SPADCALL (SPADCALL (QREFELT $ 22) (QREFELT $ 132))
                           (QREFELT $ 134)))
         (SETELT $ 38 (SPADCALL (QREFELT $ 135))) (SETELT $ 37 NIL)
         (EXIT (SPADCALL (QREFELT $ 63))))) 

(SDEFUN |FFCGP;extensionDegree;Pi;29| (($ |PositiveInteger|)) (QREFELT $ 12)) 

(SDEFUN |FFCGP;characteristic;Nni;30| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 136))) 

(SDEFUN |FFCGP;lookup;$Pi;31| ((|x| $) ($ |PositiveInteger|))
        (COND ((|eql_SI| |x| -1) (QREFELT $ 14)) ('T (|add_SI| |x| 1)))) 

(SDEFUN |FFCGP;index;Pi$;32| ((|a| |PositiveInteger|) ($ $))
        (|sub_SI| (SPADCALL |a| (QREFELT $ 14) (QREFELT $ 104)) 1)) 

(PUT '|FFCGP;Zero;$;33| '|SPADreplace| '(XLAM NIL -1)) 

(SDEFUN |FFCGP;Zero;$;33| (($ $)) -1) 

(PUT '|FFCGP;One;$;34| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |FFCGP;One;$;34| (($ $)) 0) 

(SDEFUN |FFCGP;coerce;$Of;35| ((|x| $) ($ |OutputForm|))
        (SPROG ((|y| (|Integer|)))
               (SEQ
                (COND ((|eql_SI| |x| -1) (SPADCALL "0" (QREFELT $ 140)))
                      ((|eql_SI| |x| 0) (SPADCALL "1" (QREFELT $ 140)))
                      ('T
                       (SEQ (LETT |y| (- (SPADCALL |x| (QREFELT $ 138)) 1))
                            (EXIT
                             (SPADCALL (QREFELT $ 29)
                                       (SPADCALL |y| (QREFELT $ 141))
                                       (QREFELT $ 142))))))))) 

(PUT '|FFCGP;=;2$B;36| '|SPADreplace| '|eql_SI|) 

(SDEFUN |FFCGP;=;2$B;36| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(SDEFUN |FFCGP;*;3$;37| ((|x| $) (|y| $) ($ $))
        (COND ((OR (|eql_SI| |x| -1) (|eql_SI| |y| -1)) -1)
              ('T (|addmod_SI| |x| |y| (QREFELT $ 22))))) 

(SDEFUN |FFCGP;*;GF2$;38| ((|a| GF) (|x| $) ($ $))
        (SPADCALL (SPADCALL |a| (QREFELT $ 73)) |x| (QREFELT $ 74))) 

(SDEFUN |FFCGP;/;$GF$;39| ((|x| $) (|a| GF) ($ $))
        (SPADCALL |x| (SPADCALL |a| (QREFELT $ 73)) (QREFELT $ 145))) 

(SDEFUN |FFCGP;inv;2$;40| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 45)) (|error| "inv: not invertible"))
              ((SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 47))
               (|spadConstant| $ 21))
              ('T (|sub_SI| (QREFELT $ 22) |x|)))) 

(SDEFUN |FFCGP;^;$Pi$;41| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 148))) 

(SDEFUN |FFCGP;^;$Nni$;42| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 148))) 

(SDEFUN |FFCGP;^;$I$;43| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|m| (|Rep|)))
               (SEQ (LETT |m| (SPADCALL |n| (QREFELT $ 22) (QREFELT $ 104)))
                    (EXIT
                     (COND ((|eql_SI| |m| 0) (|spadConstant| $ 21))
                           ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 47))
                            (|spadConstant| $ 31))
                           ('T (|mulmod_SI| |m| |x| (QREFELT $ 22)))))))) 

(DECLAIM (NOTINLINE |FiniteFieldCyclicGroupExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldCyclicGroupExtensionByPolynomial| (&REST #1=#:G279)
  (SPROG NIL
         (PROG (#2=#:G280)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldCyclicGroupExtensionByPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |FiniteFieldCyclicGroupExtensionByPolynomial;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldCyclicGroupExtensionByPolynomial|)))))))))) 

(DEFUN |FiniteFieldCyclicGroupExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G278 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$|
          (LIST '|FiniteFieldCyclicGroupExtensionByPolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 171))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache|
                '|FiniteFieldCyclicGroupExtensionByPolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #1# (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 8))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SingleInteger|))
    (QSETREFV $ 12 (SPADCALL |#2| (QREFELT $ 11)))
    (QSETREFV $ 14 (EXPT (SPADCALL (QREFELT $ 13)) (QREFELT $ 12)))
    (QSETREFV $ 19
              (SPADCALL (QREFELT $ 14) (SPADCALL 2 20 (QREFELT $ 16))
                        (QREFELT $ 18)))
    (COND ((QREFELT $ 19) (|error| "field too large for this representation")))
    (QSETREFV $ 22 (- (QREFELT $ 14) 1))
    (QSETREFV $ 23 (QUOTIENT2 (QREFELT $ 22) (- (SPADCALL (QREFELT $ 13)) 1)))
    (QSETREFV $ 24 (MAKEARR1 (QUOTIENT2 (+ (QREFELT $ 14) 1) 2) -1))
    (QSETREFV $ 29 (SPADCALL (SPADCALL (QREFELT $ 26)) (QREFELT $ 28)))
    (QSETREFV $ 34
              (COND
               ((ODDP (QREFELT $ 12))
                (SPADCALL (SPADCALL |#2| 0 (QREFELT $ 32)) (QREFELT $ 33)))
               ('T (SPADCALL |#2| 0 (QREFELT $ 32)))))
    (QSETREFV $ 35 NIL)
    (QSETREFV $ 36 'T)
    (QSETREFV $ 37 'T)
    (QSETREFV $ 38 0)
    $))) 

(MAKEPROP '|FiniteFieldCyclicGroupExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |degree|) '|extdeg| (5 . |size|) '|sizeFF|
              (|PositiveInteger|) (9 . ^) (|Boolean|) (15 . >) '#:G104
              (21 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFCGP;One;$;34|) $))
              '|sizeCG| '|sizeFG| '|zechlog| (|Symbol|) (25 . |new|)
              (|OutputForm|) (29 . |coerce|) '|alpha| (34 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FFCGP;Zero;$;33|) $))
              (38 . |coefficient|) (44 . -) '|primEltGF| '|facOfGroupSize|
              '|initzech?| '|initelt?| '|normalElt| (|Table| 15 9)
              (49 . |table|) (|Integer|) |FFCGP;tableForDiscreteLogarithm;IT;1|
              (|PrimitiveArray| 169) |FFCGP;getZechTable;Pa;2| (53 . |zero?|)
              |FFCGP;order;$Pi;3| |FFCGP;=;2$B;36| |FFCGP;primitive?;$B;4|
              (58 . |Zero|) (62 . |One|) (66 . |monomial|)
              (|SimpleAlgebraicExtension| 6 10 (NRTEVAL (QREFELT $ 7)))
              (72 . |convert|) (77 . ^) (|Vector| 6) (83 . |coordinates|)
              |FFCGP;coordinates;$V;5| (88 . <=) |FFCGP;+;3$;6|
              (|FiniteFieldFunctions| 6) (94 . |createZechTable|) (|Void|)
              (99 . |void|) (|OnePointCompletion| 15) (103 . |extensionDegree|)
              |FFCGP;extensionDegree;Pi;29| (107 . ~=) (113 . *)
              |FFCGP;index;Pi$;32| (|Vector| $) |FFCGP;basis;PiV;8|
              (119 . |coerce|) |FFCGP;coerce;GF$;16| |FFCGP;*;3$;37|
              |FFCGP;*;I2$;9| (|SparseUnivariatePolynomial| $$)
              (124 . |monomial|) (130 . -) (136 . |Frobenius|) (141 . *)
              (147 . |zero?|) (152 . |leadingCoefficient|)
              |FFCGP;retract;$GF;18| (157 . |degree|) (162 . +)
              (168 . |reductum|) |FFCGP;minimalPolynomial;$Sup;10|
              (|Record| (|:| |factor| 41) (|:| |exponent| 9)) (|List| 88)
              |FFCGP;factorsOfCyclicGroupSize;L;11|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFCGP;representationType;U;12| |FFCGP;definingPolynomial;Sup;13|
              |FFCGP;random;$;14|
              (|FiniteFieldExtensionByPolynomial| 6 (NRTEVAL (QREFELT $ 7)))
              (173 . |represents|) (178 . |Zero|) (182 . =)
              (188 . |discreteLog|) |FFCGP;represents;V$;15| (193 . |zero?|)
              (|Union| 9 '"failed") (198 . |discreteLog|)
              (204 . |positiveRemainder|) (|Union| $ '#1="failed")
              (210 . |exquo|) (|Union| $$ '#1#) (216 . =) (222 . ^)
              (|Union| 6 '"failed") |FFCGP;retractIfCan;$U;17| (228 . =)
              |FFCGP;basis;V;19| (234 . |positiveRemainder|)
              |FFCGP;inGroundField?;$B;20|
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 116 '#2="failed") (240 . |extendedEuclidean|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$)) (|Union| 119 '#2#)
              (247 . =) |FFCGP;discreteLog;2$U;21| (253 . |characteristic|)
              (257 . -) |FFCGP;-;2$;22| |FFCGP;generator;$;23|
              |FFCGP;createPrimitiveElement;$;24| |FFCGP;primitiveElement;$;25|
              |FFCGP;discreteLog;$Nni;26| |FFCGP;normalElement;$;27|
              (|Factored| $) (262 . |factor|) (|Factored| 41) (267 . |factors|)
              (272 . |createNormalElement|) (276 . |characteristic|)
              |FFCGP;characteristic;Nni;30| |FFCGP;lookup;$Pi;31| (|String|)
              (280 . |message|) (285 . |coerce|) (290 . ^)
              |FFCGP;coerce;$Of;35| |FFCGP;*;GF2$;38| (296 . /)
              |FFCGP;/;$GF$;39| |FFCGP;inv;2$;40| |FFCGP;^;$I$;43|
              |FFCGP;^;$Pi$;41| |FFCGP;^;$Nni$;42| (|Union| 70 '#3="failed")
              (|Matrix| $) (|List| $) (|InputForm|) (|Union| 156 '#3#)
              (|List| 157) (|SparseUnivariatePolynomial| $) (|Factored| 157)
              (|Union| 10 '"failed") (|Matrix| 6) (|CardinalNumber|)
              (|Fraction| 41) (|Union| 153 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 153) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|) (|HashState|))
           '#(~= 302 |zero?| 308 |unitNormal| 313 |unitCanonical| 318 |unit?|
              323 |transcendent?| 328 |transcendenceDegree| 333 |trace| 337
              |tableForDiscreteLogarithm| 348 |subtractIfCan| 353
              |squareFreePolynomial| 359 |squareFreePart| 364 |squareFree| 369
              |solveLinearPolynomialEquation| 374 |smaller?| 380 |sizeLess?|
              386 |size| 392 |sample| 396 |rightRecip| 400 |rightPower| 405
              |retractIfCan| 417 |retract| 422 |represents| 427
              |representationType| 432 |rem| 436 |recip| 442 |random| 447 |quo|
              451 |principalIdeal| 457 |primitiveElement| 462 |primitive?| 466
              |primeFrobenius| 471 |prime?| 482 |order| 487 |opposite?| 497
              |one?| 503 |normalElement| 508 |normal?| 512 |norm| 517
              |nextItem| 528 |multiEuclidean| 533 |minimalPolynomial| 539
              |lookup| 550 |linearAssociatedOrder| 555 |linearAssociatedLog|
              560 |linearAssociatedExp| 571 |leftRecip| 577 |leftPower| 582
              |lcmCoef| 594 |lcm| 600 |latex| 611 |inv| 616 |init| 621 |index|
              625 |inGroundField?| 630 |hashUpdate!| 635 |hash| 641
              |getZechTable| 646 |generator| 650 |gcdPolynomial| 654 |gcd| 660
              |factorsOfCyclicGroupSize| 671 |factorSquareFreePolynomial| 675
              |factorPolynomial| 680 |factor| 685 |extensionDegree| 690
              |extendedEuclidean| 698 |exquo| 711 |expressIdealMember| 717
              |euclideanSize| 723 |enumerate| 728 |divide| 732 |discreteLog|
              738 |dimension| 749 |differentiate| 753 |degree| 764
              |definingPolynomial| 774 |createPrimitiveElement| 778
              |createNormalElement| 782 |coordinates| 786 |convert| 796
              |conditionP| 801 |commutator| 806 |coerce| 812 |charthRoot| 837
              |characteristic| 847 |basis| 851 |associator| 860 |associates?|
              867 |antiCommutator| 873 |annihilate?| 879 |algebraic?| 885 ^ 890
              |Zero| 908 |One| 912 |Frobenius| 916 D 927 = 938 / 944 - 956 +
              967 * 973)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 2 0 0 2 2 0 0 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL NIL |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |DifferentialRing&| NIL |VectorSpace&| |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL
                NIL |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 162) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 162) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 162 162)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 162) (|LeftModule| 162)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 27) (|ConvertibleTo| 154))
              (|makeByteWordVec2| 170
                                  '(1 10 9 0 11 0 6 9 13 2 9 0 0 15 16 2 9 17 0
                                    0 18 0 10 0 20 0 25 0 26 1 25 27 0 28 0 10
                                    0 30 2 10 6 0 9 32 1 6 0 0 33 0 39 0 40 1 0
                                    17 0 45 0 6 0 49 0 6 0 50 2 10 0 6 9 51 1
                                    52 0 10 53 2 52 0 0 41 54 1 52 55 0 56 2 8
                                    17 0 0 58 1 60 43 10 61 0 62 0 63 0 0 64 65
                                    2 9 17 0 0 67 2 41 0 9 0 68 1 6 0 41 72 2
                                    76 0 2 9 77 2 76 0 0 0 78 1 0 0 0 79 2 76 0
                                    0 0 80 1 76 17 0 81 1 76 2 0 82 1 76 9 0 84
                                    2 10 0 0 0 85 1 76 0 0 86 1 95 0 55 96 0 95
                                    0 97 2 95 17 0 0 98 1 95 9 0 99 1 6 17 0
                                    101 2 6 102 0 0 103 2 41 0 0 0 104 2 8 105
                                    0 0 106 2 107 17 0 0 108 2 6 0 0 41 109 2
                                    110 17 0 0 112 2 8 0 0 0 114 3 8 117 0 0 0
                                    118 2 120 17 0 0 121 0 10 9 123 1 10 0 0
                                    124 1 41 131 0 132 1 133 89 0 134 0 0 0 135
                                    0 6 9 136 1 27 0 139 140 1 41 27 0 141 2 27
                                    0 0 0 142 2 0 0 0 0 145 2 0 17 0 0 1 1 0 17
                                    0 45 1 0 168 0 1 1 0 0 0 1 1 0 17 0 1 1 0
                                    17 0 1 0 0 9 1 2 2 0 0 15 1 1 0 6 0 1 1 2
                                    39 41 42 2 0 105 0 0 1 1 2 158 157 1 1 0 0
                                    0 1 1 0 131 0 1 2 2 155 156 157 1 2 2 17 0
                                    0 1 2 0 17 0 0 1 0 2 9 1 0 0 0 1 1 0 105 0
                                    1 2 0 0 0 9 1 2 0 0 0 15 1 1 0 110 0 111 1
                                    0 6 0 83 1 0 0 55 100 0 2 91 92 2 0 0 0 0 1
                                    1 0 105 0 1 0 2 0 94 2 0 0 0 0 1 1 0 166
                                    153 1 0 2 0 128 1 2 17 0 48 2 3 0 0 9 1 1 3
                                    0 0 1 1 0 17 0 1 1 3 64 0 1 1 2 15 0 46 2 0
                                    17 0 0 1 1 0 17 0 1 0 2 0 130 1 2 17 0 1 2
                                    2 0 0 15 1 1 0 6 0 1 1 2 105 0 1 2 0 163
                                    153 0 1 2 2 157 0 15 1 1 0 10 0 87 1 2 15 0
                                    138 1 2 10 0 1 2 2 159 0 0 1 1 2 10 0 1 2 2
                                    0 0 10 1 1 0 105 0 1 2 0 0 0 9 1 2 0 0 0 15
                                    1 2 0 167 0 0 1 2 0 0 0 0 1 1 0 0 153 1 1 0
                                    139 0 1 1 0 0 0 147 0 2 0 1 1 2 0 15 69 1 0
                                    17 0 115 2 0 170 170 0 1 1 0 169 0 1 0 0 43
                                    44 0 2 0 126 2 0 157 157 157 1 2 0 0 0 0 1
                                    1 0 0 153 1 0 2 89 90 1 2 158 157 1 1 2 158
                                    157 1 1 0 131 0 1 0 0 15 66 0 0 64 65 3 0
                                    117 0 0 0 1 2 0 164 0 0 1 2 0 105 0 0 1 2 0
                                    163 153 0 1 1 0 9 0 1 0 2 153 1 2 0 165 0 0
                                    1 2 3 102 0 0 122 1 2 9 0 129 0 0 161 1 2 2
                                    0 0 9 1 1 2 0 0 1 1 0 15 0 1 1 0 64 0 1 0 0
                                    10 93 0 2 0 127 0 2 0 135 1 0 55 0 57 1 0
                                    160 70 1 1 2 154 0 1 1 4 151 152 1 2 0 0 0
                                    0 1 1 0 0 6 73 1 0 0 162 1 1 0 0 0 1 1 0 0
                                    41 1 1 0 27 0 143 1 3 105 0 1 1 2 0 0 1 0 0
                                    9 137 0 0 70 113 1 0 70 15 71 3 0 0 0 0 0 1
                                    2 0 17 0 0 1 2 0 0 0 0 1 2 0 17 0 0 1 1 0
                                    17 0 1 2 0 0 0 41 148 2 0 0 0 9 150 2 0 0 0
                                    15 149 0 0 0 31 0 0 0 21 1 2 0 0 79 2 2 0 0
                                    9 1 2 2 0 0 9 1 1 2 0 0 1 2 0 17 0 0 47 2 0
                                    0 0 6 146 2 0 0 0 0 145 2 0 0 0 0 1 1 0 0 0
                                    125 2 0 0 0 0 59 2 0 0 0 6 1 2 0 0 6 0 144
                                    2 0 0 0 162 1 2 0 0 162 0 1 2 0 0 9 0 1 2 0
                                    0 41 0 75 2 0 0 0 0 74 2 0 0 15 0 1)))))
           '|lookupComplete|)) 
