
(SDEFUN |INTLOCP;split|
        ((|z| . #1=(|Integer|))
         ($ |Record| (|:| |ppow| (|NonNegativeInteger|))
          (|:| |pfree| (|Integer|))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|a| #1#) (#2=#:G134 NIL)
          (|x| (|Union| (|Integer|) #3="failed")))
         (SEQ
          (COND ((ZEROP |z|) (CONS 0 0))
                ('T
                 (SEQ (LETT |a| |z| . #4=(|INTLOCP;split|)) (LETT |n| 0 . #4#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SEQ
                               (LETT |x|
                                     (SPADCALL |a| (QREFELT $ 6)
                                               (QREFELT $ 13))
                                     . #4#)
                               (EXIT (NULL (QEQCAR |x| 1)))))
                             (GO G191)))
                           (SEQ
                            (LETT |a|
                                  (PROG2 (LETT #2# |x| . #4#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                                    (|Union| (|Integer|) #3#)
                                                    #2#))
                                  . #4#)
                            (EXIT (LETT |n| (+ |n| 1) . #4#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS |n| |a|)))))))) 

(PUT '|INTLOCP;exponent;$Nni;2| '|SPADreplace| 'QCAR) 

(SDEFUN |INTLOCP;exponent;$Nni;2| ((|x| $) ($ |NonNegativeInteger|)) (QCAR |x|)) 

(PUT '|INTLOCP;unitPart;$F;3| '|SPADreplace| 'QCDR) 

(SDEFUN |INTLOCP;unitPart;$F;3| ((|x| $) ($ |Fraction| (|Integer|))) (QCDR |x|)) 

(SDEFUN |INTLOCP;coerce;I$;4| ((|z| |Integer|) ($ $))
        (SPROG
         ((|s|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|)))))
         (SEQ (LETT |s| (|INTLOCP;split| |z| $) |INTLOCP;coerce;I$;4|)
              (EXIT (CONS (QCAR |s|) (SPADCALL (QCDR |s|) (QREFELT $ 18))))))) 

(SDEFUN |INTLOCP;retract;$I;5| ((|x| $) ($ |Integer|))
        (SPROG ((|q| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |q| (SPADCALL |x| (QREFELT $ 17)) |INTLOCP;retract;$I;5|)
                (COND
                 ((NULL (EQL (SPADCALL |q| (QREFELT $ 20)) 1))
                  (EXIT (|error| "not an integer"))))
                (EXIT
                 (SPADCALL (EXPT (QREFELT $ 6) (SPADCALL |x| (QREFELT $ 15)))
                           (SPADCALL |q| (QREFELT $ 21)) (QREFELT $ 22)))))) 

(SDEFUN |INTLOCP;retractIfCan;$U;6| ((|x| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|q| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |q| (SPADCALL |x| (QREFELT $ 17))
                      |INTLOCP;retractIfCan;$U;6|)
                (COND
                 ((NULL (EQL (SPADCALL |q| (QREFELT $ 20)) 1))
                  (EXIT (CONS 1 "failed"))))
                (EXIT
                 (CONS 0
                       (SPADCALL
                        (EXPT (QREFELT $ 6) (SPADCALL |x| (QREFELT $ 15)))
                        (SPADCALL |q| (QREFELT $ 21)) (QREFELT $ 22))))))) 

(SDEFUN |INTLOCP;coerce;$F;7| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (EXPT (QREFELT $ 6) (SPADCALL |x| (QREFELT $ 15)))
                  (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 26))) 

(SDEFUN |INTLOCP;retract;F$;8| ((|q| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|d| (|Integer|)))
         (SEQ
          (LETT |d| (SPADCALL |q| (QREFELT $ 20))
                . #1=(|INTLOCP;retract;F$;8|))
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |d| (QREFELT $ 6) (QREFELT $ 13)) 0)
             (|error| "denominator contains power of p"))
            ('T
             (SEQ
              (LETT |snum| (|INTLOCP;split| (SPADCALL |q| (QREFELT $ 21)) $)
                    . #1#)
              (EXIT
               (CONS (QCAR |snum|)
                     (SPADCALL (QCDR |snum|) |d| (QREFELT $ 28))))))))))) 

(SDEFUN |INTLOCP;retractIfCan;FU;9|
        ((|q| |Fraction| (|Integer|)) ($ |Union| $ "failed"))
        (SPROG
         ((|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|d| (|Integer|)))
         (SEQ
          (LETT |d| (SPADCALL |q| (QREFELT $ 20))
                . #1=(|INTLOCP;retractIfCan;FU;9|))
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |d| (QREFELT $ 6) (QREFELT $ 13)) 0)
             (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |snum| (|INTLOCP;split| (SPADCALL |q| (QREFELT $ 21)) $)
                    . #1#)
              (EXIT
               (CONS 0
                     (CONS (QCAR |snum|)
                           (SPADCALL (QCDR |snum|) |d| (QREFELT $ 28)))))))))))) 

(SDEFUN |INTLOCP;coerce;$Of;10| ((|x| $) ($ |OutputForm|))
        (SPROG ((|q| (|Fraction| (|Integer|))) (|po| (|OutputForm|)))
               (SEQ
                (COND
                 ((ZEROP (SPADCALL |x| (QREFELT $ 15)))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 32)))
                 (#1='T
                  (SEQ
                   (LETT |po| (SPADCALL (QREFELT $ 6) (QREFELT $ 34))
                         . #2=(|INTLOCP;coerce;$Of;10|))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT $ 15)) 1 (QREFELT $ 35))
                     (LETT |po|
                           (SPADCALL |po|
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                               (QREFELT $ 36))
                                     (QREFELT $ 37))
                           . #2#)))
                   (LETT |q| (SPADCALL |x| (QREFELT $ 17)) . #2#)
                   (EXIT
                    (COND ((SPADCALL |q| (QREFELT $ 38)) |po|)
                          (#1#
                           (SPADCALL |po| (SPADCALL |q| (QREFELT $ 32))
                                     (QREFELT $ 39))))))))))) 

(SDEFUN |INTLOCP;Zero;$;11| (($ $)) (SPADCALL 0 (QREFELT $ 19))) 

(SDEFUN |INTLOCP;One;$;12| (($ $)) (SPADCALL 1 (QREFELT $ 19))) 

(SDEFUN |INTLOCP;zero?;$B;13| ((|x| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 43))) 

(SDEFUN |INTLOCP;+;3$;14| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|e| (|Integer|)) (|#G18| ($)) (|#G17| ($)) (|#G16| (|Integer|))
          (|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|q| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 44)) |y|)
                ((SPADCALL |y| (QREFELT $ 44)) |x|)
                (#1='T
                 (SEQ
                  (LETT |e|
                        (- (SPADCALL |x| (QREFELT $ 15))
                           (SPADCALL |y| (QREFELT $ 15)))
                        . #2=(|INTLOCP;+;3$;14|))
                  (EXIT
                   (COND
                    ((ZEROP |e|)
                     (SEQ
                      (LETT |q|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                      (SPADCALL |y| (QREFELT $ 17))
                                      (QREFELT $ 45))
                            . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |q| (QREFELT $ 43)) (|spadConstant| $ 41))
                        (#1#
                         (SEQ
                          (LETT |snum|
                                (|INTLOCP;split| (SPADCALL |q| (QREFELT $ 21))
                                 $)
                                . #2#)
                          (EXIT
                           (CONS
                            (+ (SPADCALL |x| (QREFELT $ 15)) (QCAR |snum|))
                            (SPADCALL (QCDR |snum|)
                                      (SPADCALL |q| (QREFELT $ 20))
                                      (QREFELT $ 28))))))))))
                    (#1#
                     (SEQ
                      (COND
                       ((< |e| 0)
                        (PROGN
                         (LETT |#G16| (- |e|) . #2#)
                         (LETT |#G17| |y| . #2#)
                         (LETT |#G18| |x| . #2#)
                         (LETT |e| |#G16| . #2#)
                         (LETT |x| |#G17| . #2#)
                         (LETT |y| |#G18| . #2#))))
                      (EXIT
                       (CONS (SPADCALL |y| (QREFELT $ 15))
                             (SPADCALL
                              (SPADCALL (EXPT (QREFELT $ 6) |e|)
                                        (SPADCALL |x| (QREFELT $ 17))
                                        (QREFELT $ 26))
                              (SPADCALL |y| (QREFELT $ 17))
                              (QREFELT $ 45)))))))))))))) 

(SDEFUN |INTLOCP;-;2$;15| ((|x| $) ($ $))
        (CONS (SPADCALL |x| (QREFELT $ 15))
              (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 47)))) 

(SDEFUN |INTLOCP;*;3$;16| ((|x| $) (|y| $) ($ $))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 44)) (SPADCALL |y| (QREFELT $ 44)))
          (|spadConstant| $ 41))
         ('T
          (CONS (+ (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
                (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                          (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 49)))))) 

(SDEFUN |INTLOCP;*;I2$;17| ((|z| |Integer|) (|x| $) ($ $))
        (SPADCALL (SPADCALL |z| (QREFELT $ 19)) |x| (QREFELT $ 50))) 

(SDEFUN |INTLOCP;^;$Nni$;18| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (CONS (* |n| (SPADCALL |x| (QREFELT $ 15)))
              (SPADCALL (SPADCALL |x| (QREFELT $ 17)) |n| (QREFELT $ 52)))) 

(SDEFUN |INTLOCP;=;2$B;19| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((EQL (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
          (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
                    (QREFELT $ 54)))
         ('T NIL))) 

(PUT '|INTLOCP;characteristic;Nni;20| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INTLOCP;characteristic;Nni;20| (($ |NonNegativeInteger|)) 0) 

(SDEFUN |INTLOCP;euclideanSize;$Nni;21| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 15))) 

(SDEFUN |INTLOCP;divide;2$R;22|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG ((|z| ($)) (|e| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |y| (QREFELT $ 44)) (|error| "division by zero"))
                 (#1='T
                  (SEQ
                   (LETT |e|
                         (- (SPADCALL |x| (QREFELT $ 15))
                            (SPADCALL |y| (QREFELT $ 15)))
                         . #2=(|INTLOCP;divide;2$R;22|))
                   (EXIT
                    (COND ((< |e| 0) (CONS (|spadConstant| $ 41) |x|))
                          (#1#
                           (SEQ
                            (LETT |z|
                                  (CONS |e|
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                                  (SPADCALL |y| (QREFELT $ 17))
                                                  (QREFELT $ 58)))
                                  . #2#)
                            (EXIT (CONS |z| (|spadConstant| $ 41))))))))))))) 

(SDEFUN |INTLOCP;exquo;2$U;23| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|z| ($)) (|e| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 44)) (CONS 1 "failed"))
                      (#1='T
                       (SEQ
                        (LETT |e|
                              (- (SPADCALL |x| (QREFELT $ 15))
                                 (SPADCALL |y| (QREFELT $ 15)))
                              . #2=(|INTLOCP;exquo;2$U;23|))
                        (EXIT
                         (COND ((< |e| 0) (CONS 1 "failed"))
                               (#1#
                                (SEQ
                                 (LETT |z|
                                       (CONS |e|
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT $ 17))
                                              (SPADCALL |y| (QREFELT $ 17))
                                              (QREFELT $ 58)))
                                       . #2#)
                                 (EXIT (CONS 0 |z|)))))))))))) 

(SDEFUN |INTLOCP;opposite?;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((EQL (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
          (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
                    (QREFELT $ 62)))
         ('T NIL))) 

(SDEFUN |INTLOCP;unitNormal;$R;25|
        ((|x| $)
         ($ |Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $)))
        (COND
         ((SPADCALL |x| (QREFELT $ 44))
          (VECTOR (|spadConstant| $ 42) |x| (|spadConstant| $ 42)))
         ('T
          (VECTOR (CONS 0 (SPADCALL |x| (QREFELT $ 17)))
                  (CONS (SPADCALL |x| (QREFELT $ 15)) (|spadConstant| $ 64))
                  (CONS 0
                        (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                  (QREFELT $ 65))))))) 

(SDEFUN |INTLOCP;unitCanonical;2$;26| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 44)) |x|)
              ('T (CONS (SPADCALL |x| (QREFELT $ 15)) (|spadConstant| $ 64))))) 

(SDEFUN |INTLOCP;associates?;2$B;27| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 44)) (SPADCALL |y| (QREFELT $ 44)))
              ((SPADCALL |y| (QREFELT $ 44)) (SPADCALL |x| (QREFELT $ 44)))
              ('T
               (EQL (SPADCALL |x| (QREFELT $ 15))
                    (SPADCALL |y| (QREFELT $ 15)))))) 

(SDEFUN |INTLOCP;unit?;$B;28| ((|x| $) ($ |Boolean|))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT $ 15)))
          (NULL (SPADCALL |x| (QREFELT $ 44))))
         ('T NIL))) 

(SDEFUN |INTLOCP;recip;$U;29| ((|x| $) ($ |Union| $ "failed"))
        (COND ((NULL (SPADCALL |x| (QREFELT $ 70))) (CONS 1 "failed"))
              ('T
               (CONS 0
                     (CONS 0
                           (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                     (QREFELT $ 65))))))) 

(SDEFUN |INTLOCP;gcd;3$;30| ((|x| $) (|y| $) ($ $))
        (CONS (MIN (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
              (|spadConstant| $ 64))) 

(SDEFUN |INTLOCP;lcm;3$;31| ((|x| $) (|y| $) ($ $))
        (CONS (MAX (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
              (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                        (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 49)))) 

(SDEFUN |INTLOCP;lcmCoef;2$R;32|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $)))
        (SPROG
         ((|cy| ($)) (|cx| ($)) (|emax| (|NonNegativeInteger|))
          (|uy| #1=(|Fraction| (|Integer|))) (|ey| #2=(|NonNegativeInteger|))
          (|ux| #1#) (|ex| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT $ 44)) (SPADCALL |y| (QREFELT $ 44)))
            (VECTOR (|spadConstant| $ 41) (|spadConstant| $ 41)
                    (|spadConstant| $ 41)))
           ('T
            (SEQ
             (LETT |ex| (SPADCALL |x| (QREFELT $ 15))
                   . #3=(|INTLOCP;lcmCoef;2$R;32|))
             (LETT |ux| (SPADCALL |x| (QREFELT $ 17)) . #3#)
             (LETT |ey| (SPADCALL |y| (QREFELT $ 15)) . #3#)
             (LETT |uy| (SPADCALL |y| (QREFELT $ 17)) . #3#)
             (LETT |emax| (MAX |ex| |ey|) . #3#)
             (LETT |cx| (CONS (- |emax| |ex|) |uy|) . #3#)
             (LETT |cy| (CONS (- |emax| |ey|) |ux|) . #3#)
             (EXIT
              (VECTOR (CONS |emax| (SPADCALL |ux| |uy| (QREFELT $ 49))) |cx|
                      |cy|)))))))) 

(DECLAIM (NOTINLINE |IntegerLocalizedAtPrime;|)) 

(DEFUN |IntegerLocalizedAtPrime| (#1=#:G266)
  (SPROG NIL
         (PROG (#2=#:G267)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IntegerLocalizedAtPrime|)
                                               '|domainEqualList|)
                    . #3=(|IntegerLocalizedAtPrime|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerLocalizedAtPrime;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IntegerLocalizedAtPrime|)))))))))) 

(DEFUN |IntegerLocalizedAtPrime;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerLocalizedAtPrime|))
          (LETT |dv$| (LIST '|IntegerLocalizedAtPrime| DV$1) . #1#)
          (LETT $ (GETREFV 86) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|IntegerLocalizedAtPrime|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
          (COND ((QREFELT $ 11))
                ('T
                 (|error|
                  "Argument of IntegerLocalizedAtPrime must be a prime")))
          $))) 

(MAKEPROP '|IntegerLocalizedAtPrime| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|Integer|)
              (|IntegerPrimesPackage| 8) (0 . |prime?|) '#:G104
              (|Union| $ '"failed") (5 . |exquo|) (|NonNegativeInteger|)
              |INTLOCP;exponent;$Nni;2| (|Fraction| 8) |INTLOCP;unitPart;$F;3|
              (11 . |coerce|) |INTLOCP;coerce;I$;4| (16 . |denom|)
              (21 . |numer|) (26 . *) |INTLOCP;retract;$I;5|
              (|Union| 8 '"failed") |INTLOCP;retractIfCan;$U;6| (32 . *)
              |INTLOCP;coerce;$F;7| (38 . /) |INTLOCP;retract;F$;8|
              |INTLOCP;retractIfCan;FU;9| (|OutputForm|) (44 . |coerce|)
              (|PositiveInteger|) (49 . |coerce|) (54 . >) (60 . |coerce|)
              (65 . ^) (71 . |one?|) (76 . *) |INTLOCP;coerce;$Of;10|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTLOCP;Zero;$;11|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTLOCP;One;$;12|) $))
              (82 . |zero?|) |INTLOCP;zero?;$B;13| (87 . +) |INTLOCP;+;3$;14|
              (93 . -) |INTLOCP;-;2$;15| (98 . *) |INTLOCP;*;3$;16|
              |INTLOCP;*;I2$;17| (104 . ^) |INTLOCP;^;$Nni$;18| (110 . =)
              |INTLOCP;=;2$B;19| |INTLOCP;characteristic;Nni;20|
              |INTLOCP;euclideanSize;$Nni;21| (116 . /)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INTLOCP;divide;2$R;22| |INTLOCP;exquo;2$U;23|
              (122 . |opposite?|) |INTLOCP;opposite?;2$B;24| (128 . |One|)
              (132 . |inv|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INTLOCP;unitNormal;$R;25| |INTLOCP;unitCanonical;2$;26|
              |INTLOCP;associates?;2$B;27| |INTLOCP;unit?;$B;28|
              |INTLOCP;recip;$U;29| |INTLOCP;gcd;3$;30| |INTLOCP;lcm;3$;31|
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              |INTLOCP;lcmCoef;2$R;32| (|Union| 77 '#1="failed") (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 79 '#1#)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 77) (|:| |generator| $)) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 137 |zero?| 143 |unitPart| 148 |unitNormal| 153
              |unitCanonical| 158 |unit?| 163 |subtractIfCan| 168 |sizeLess?|
              174 |sample| 180 |rightRecip| 184 |rightPower| 189 |retractIfCan|
              201 |retract| 211 |rem| 221 |recip| 227 |quo| 232
              |principalIdeal| 238 |opposite?| 243 |one?| 249 |multiEuclidean|
              254 |leftRecip| 260 |leftPower| 265 |lcmCoef| 277 |lcm| 283
              |latex| 294 |hashUpdate!| 299 |hash| 305 |gcdPolynomial| 310
              |gcd| 316 |extendedEuclidean| 327 |exquo| 340
              |expressIdealMember| 346 |exponent| 352 |euclideanSize| 357
              |divide| 362 |commutator| 368 |coerce| 374 |characteristic| 394
              |associator| 398 |associates?| 405 |antiCommutator| 411
              |annihilate?| 417 ^ 423 |Zero| 435 |One| 439 = 443 - 449 + 460 *
              466)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|EuclideanDomain&| NIL |GcdDomain&| NIL NIL NIL |EntireRing&|
                |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL |RetractableFrom&|
                |RetractableTo&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|EuclideanDomain|) (|PrincipalIdealDomain|) (|GcdDomain|)
                 (|IntegralDomain|) (|CommutativeRing|) (|LeftOreRing|)
                 (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| $$) (|SemiRng|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|canonicalUnitNormal|) (|RetractableFrom| 16)
                 (|RetractableTo| 8) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 31))
              (|makeByteWordVec2| 85
                                  '(1 9 7 8 10 2 8 12 0 0 13 1 16 0 8 18 1 16 8
                                    0 20 1 16 8 0 21 2 8 0 14 0 22 2 16 0 14 0
                                    26 2 16 0 8 8 28 1 16 31 0 32 1 33 31 0 34
                                    2 14 7 0 0 35 1 14 31 0 36 2 31 0 0 0 37 1
                                    16 7 0 38 2 31 0 0 0 39 1 16 7 0 43 2 16 0
                                    0 0 45 1 16 0 0 47 2 16 0 0 16 49 2 16 0 0
                                    8 52 2 16 7 0 0 54 2 16 0 0 0 58 2 16 7 0 0
                                    62 0 16 0 64 1 16 0 0 65 2 0 7 0 0 1 1 0 7
                                    0 44 1 0 16 0 17 1 0 66 0 67 1 0 0 0 68 1 0
                                    7 0 70 2 0 12 0 0 1 2 0 7 0 0 1 0 0 0 1 1 0
                                    12 0 1 2 0 0 0 14 1 2 0 0 0 33 1 1 0 12 16
                                    30 1 0 24 0 25 1 0 0 16 29 1 0 8 0 23 2 0 0
                                    0 0 1 1 0 12 0 71 2 0 0 0 0 1 1 0 82 77 1 2
                                    0 7 0 0 63 1 0 7 0 1 2 0 76 77 0 1 1 0 12 0
                                    1 2 0 0 0 14 1 2 0 0 0 33 1 2 0 74 0 0 75 2
                                    0 0 0 0 73 1 0 0 77 1 1 0 84 0 1 2 0 83 83
                                    0 1 1 0 85 0 1 2 0 81 81 81 1 2 0 0 0 0 72
                                    1 0 0 77 1 2 0 78 0 0 1 3 0 80 0 0 0 1 2 0
                                    12 0 0 61 2 0 76 77 0 1 1 0 14 0 15 1 0 14
                                    0 57 2 0 59 0 0 60 2 0 0 0 0 1 1 0 16 0 27
                                    1 0 0 0 1 1 0 0 8 19 1 0 31 0 40 0 0 14 56
                                    3 0 0 0 0 0 1 2 0 7 0 0 69 2 0 0 0 0 1 2 0
                                    7 0 0 1 2 0 0 0 14 53 2 0 0 0 33 1 0 0 0 41
                                    0 0 0 42 2 0 7 0 0 55 2 0 0 0 0 1 1 0 0 0
                                    48 2 0 0 0 0 46 2 0 0 14 0 1 2 0 0 8 0 51 2
                                    0 0 0 0 50 2 0 0 33 0 1)))))
           '|lookupComplete|)) 
