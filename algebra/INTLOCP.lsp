
(SDEFUN |INTLOCP;split|
        ((|z| #1=(|Integer|))
         (%
          (|Record| (|:| |ppow| (|NonNegativeInteger|))
                    (|:| |pfree| (|Integer|)))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|a| #1#) (#2=#:G32 NIL)
          (|x| (|Union| (|Integer|) #3="failed")))
         (SEQ
          (COND ((ZEROP |z|) (CONS 0 0))
                ('T
                 (SEQ (LETT |a| |z|) (LETT |n| 0)
                      (SEQ G190
                           (COND
                            ((NULL
                              (SEQ
                               (LETT |x|
                                     (SPADCALL |a| (QREFELT % 6)
                                               (QREFELT % 13)))
                               (EXIT (NULL (QEQCAR |x| 1)))))
                             (GO G191)))
                           (SEQ
                            (LETT |a|
                                  (PROG2 (LETT #2# |x|)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                                    (|Union| (|Integer|) #3#)
                                                    #2#)))
                            (EXIT (LETT |n| (+ |n| 1))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS |n| |a|)))))))) 

(PUT '|INTLOCP;exponent;%Nni;2| '|SPADreplace| 'QCAR) 

(SDEFUN |INTLOCP;exponent;%Nni;2| ((|x| (%)) (% (|NonNegativeInteger|)))
        (QCAR |x|)) 

(PUT '|INTLOCP;unitPart;%F;3| '|SPADreplace| 'QCDR) 

(SDEFUN |INTLOCP;unitPart;%F;3| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (QCDR |x|)) 

(SDEFUN |INTLOCP;coerce;I%;4| ((|z| (|Integer|)) (% (%)))
        (SPROG
         ((|s|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|)))))
         (SEQ (LETT |s| (|INTLOCP;split| |z| %))
              (EXIT (CONS (QCAR |s|) (SPADCALL (QCDR |s|) (QREFELT % 18))))))) 

(SDEFUN |INTLOCP;retract;%I;5| ((|x| (%)) (% (|Integer|)))
        (SPROG ((|q| (|Fraction| (|Integer|))))
               (SEQ (LETT |q| (SPADCALL |x| (QREFELT % 17)))
                    (COND
                     ((NULL (EQL (SPADCALL |q| (QREFELT % 20)) 1))
                      (EXIT (|error| "not an integer"))))
                    (EXIT
                     (* (EXPT (QREFELT % 6) (SPADCALL |x| (QREFELT % 15)))
                        (SPADCALL |q| (QREFELT % 21))))))) 

(SDEFUN |INTLOCP;retractIfCan;%U;6|
        ((|x| (%)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|q| (|Fraction| (|Integer|))))
               (SEQ (LETT |q| (SPADCALL |x| (QREFELT % 17)))
                    (COND
                     ((NULL (EQL (SPADCALL |q| (QREFELT % 20)) 1))
                      (EXIT (CONS 1 "failed"))))
                    (EXIT
                     (CONS 0
                           (*
                            (EXPT (QREFELT % 6) (SPADCALL |x| (QREFELT % 15)))
                            (SPADCALL |q| (QREFELT % 21)))))))) 

(SDEFUN |INTLOCP;coerce;%F;7| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (EXPT (QREFELT % 6) (SPADCALL |x| (QREFELT % 15)))
                  (SPADCALL |x| (QREFELT % 17)) (QREFELT % 25))) 

(SDEFUN |INTLOCP;retract;F%;8| ((|q| (|Fraction| (|Integer|))) (% (%)))
        (SPROG
         ((|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|d| (|Integer|)))
         (SEQ (LETT |d| (SPADCALL |q| (QREFELT % 20)))
              (EXIT
               (COND
                ((QEQCAR (SPADCALL |d| (QREFELT % 6) (QREFELT % 13)) 0)
                 (|error| "denominator contains power of p"))
                ('T
                 (SEQ
                  (LETT |snum|
                        (|INTLOCP;split| (SPADCALL |q| (QREFELT % 21)) %))
                  (EXIT
                   (CONS (QCAR |snum|)
                         (SPADCALL (QCDR |snum|) |d| (QREFELT % 27))))))))))) 

(SDEFUN |INTLOCP;retractIfCan;FU;9|
        ((|q| (|Fraction| (|Integer|))) (% (|Union| % "failed")))
        (SPROG
         ((|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|d| (|Integer|)))
         (SEQ (LETT |d| (SPADCALL |q| (QREFELT % 20)))
              (EXIT
               (COND
                ((QEQCAR (SPADCALL |d| (QREFELT % 6) (QREFELT % 13)) 0)
                 (CONS 1 "failed"))
                ('T
                 (SEQ
                  (LETT |snum|
                        (|INTLOCP;split| (SPADCALL |q| (QREFELT % 21)) %))
                  (EXIT
                   (CONS 0
                         (CONS (QCAR |snum|)
                               (SPADCALL (QCDR |snum|) |d|
                                         (QREFELT % 27)))))))))))) 

(SDEFUN |INTLOCP;coerce;%Of;10| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((|q| (|Fraction| (|Integer|))) (|po| (|OutputForm|)))
               (SEQ
                (COND
                 ((ZEROP (SPADCALL |x| (QREFELT % 15)))
                  (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 31)))
                 (#1='T
                  (SEQ (LETT |po| (SPADCALL (QREFELT % 6) (QREFELT % 33)))
                       (COND
                        ((> (SPADCALL |x| (QREFELT % 15)) 1)
                         (LETT |po|
                               (SPADCALL |po|
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT % 15))
                                          (QREFELT % 34))
                                         (QREFELT % 35)))))
                       (LETT |q| (SPADCALL |x| (QREFELT % 17)))
                       (EXIT
                        (COND ((SPADCALL |q| (QREFELT % 36)) |po|)
                              (#1#
                               (SPADCALL |po| (SPADCALL |q| (QREFELT % 31))
                                         (QREFELT % 37))))))))))) 

(SDEFUN |INTLOCP;Zero;%;11| ((% (%))) (SPADCALL 0 (QREFELT % 19))) 

(SDEFUN |INTLOCP;One;%;12| ((% (%))) (SPADCALL 1 (QREFELT % 19))) 

(SDEFUN |INTLOCP;zero?;%B;13| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 41))) 

(SDEFUN |INTLOCP;+;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|e| (|Integer|)) (|#G18| (%)) (|#G17| (%)) (|#G16| (|Integer|))
          (|snum|
           (|Record| (|:| |ppow| (|NonNegativeInteger|))
                     (|:| |pfree| (|Integer|))))
          (|q| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 42)) |y|)
                ((SPADCALL |y| (QREFELT % 42)) |x|)
                (#1='T
                 (SEQ
                  (LETT |e|
                        (- (SPADCALL |x| (QREFELT % 15))
                           (SPADCALL |y| (QREFELT % 15))))
                  (EXIT
                   (COND
                    ((ZEROP |e|)
                     (SEQ
                      (LETT |q|
                            (SPADCALL (SPADCALL |x| (QREFELT % 17))
                                      (SPADCALL |y| (QREFELT % 17))
                                      (QREFELT % 43)))
                      (EXIT
                       (COND
                        ((SPADCALL |q| (QREFELT % 41)) (|spadConstant| % 39))
                        (#1#
                         (SEQ
                          (LETT |snum|
                                (|INTLOCP;split| (SPADCALL |q| (QREFELT % 21))
                                 %))
                          (EXIT
                           (CONS
                            (+ (SPADCALL |x| (QREFELT % 15)) (QCAR |snum|))
                            (SPADCALL (QCDR |snum|)
                                      (SPADCALL |q| (QREFELT % 20))
                                      (QREFELT % 27))))))))))
                    (#1#
                     (SEQ
                      (COND
                       ((< |e| 0)
                        (PROGN
                         (LETT |#G16| (- |e|))
                         (LETT |#G17| |y|)
                         (LETT |#G18| |x|)
                         (LETT |e| |#G16|)
                         (LETT |x| |#G17|)
                         (LETT |y| |#G18|))))
                      (EXIT
                       (CONS (SPADCALL |y| (QREFELT % 15))
                             (SPADCALL
                              (SPADCALL (EXPT (QREFELT % 6) |e|)
                                        (SPADCALL |x| (QREFELT % 17))
                                        (QREFELT % 25))
                              (SPADCALL |y| (QREFELT % 17))
                              (QREFELT % 43)))))))))))))) 

(SDEFUN |INTLOCP;-;2%;15| ((|x| (%)) (% (%)))
        (CONS (SPADCALL |x| (QREFELT % 15))
              (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 45)))) 

(SDEFUN |INTLOCP;*;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |x| (QREFELT % 42)) (SPADCALL |y| (QREFELT % 42)))
          (|spadConstant| % 39))
         ('T
          (CONS (+ (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))
                (SPADCALL (SPADCALL |x| (QREFELT % 17))
                          (SPADCALL |y| (QREFELT % 17)) (QREFELT % 47)))))) 

(SDEFUN |INTLOCP;*;I2%;17| ((|z| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |z| (QREFELT % 19)) |x| (QREFELT % 48))) 

(SDEFUN |INTLOCP;^;%Nni%;18| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (CONS (* |n| (SPADCALL |x| (QREFELT % 15)))
              (SPADCALL (SPADCALL |x| (QREFELT % 17)) |n| (QREFELT % 50)))) 

(SDEFUN |INTLOCP;=;2%B;19| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((EQL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))
          (SPADCALL (SPADCALL |x| (QREFELT % 17)) (SPADCALL |y| (QREFELT % 17))
                    (QREFELT % 52)))
         ('T NIL))) 

(PUT '|INTLOCP;characteristic;Nni;20| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INTLOCP;characteristic;Nni;20| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |INTLOCP;euclideanSize;%Nni;21| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 15))) 

(SDEFUN |INTLOCP;divide;2%R;22|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG ((|z| (%)) (|e| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |y| (QREFELT % 42)) (|error| "division by zero"))
                 (#1='T
                  (SEQ
                   (LETT |e|
                         (- (SPADCALL |x| (QREFELT % 15))
                            (SPADCALL |y| (QREFELT % 15))))
                   (EXIT
                    (COND ((< |e| 0) (CONS (|spadConstant| % 39) |x|))
                          (#1#
                           (SEQ
                            (LETT |z|
                                  (CONS |e|
                                        (SPADCALL (SPADCALL |x| (QREFELT % 17))
                                                  (SPADCALL |y| (QREFELT % 17))
                                                  (QREFELT % 56))))
                            (EXIT (CONS |z| (|spadConstant| % 39))))))))))))) 

(SDEFUN |INTLOCP;exquo;2%U;23| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|z| (%)) (|e| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT % 42)) (CONS 1 "failed"))
                      (#1='T
                       (SEQ
                        (LETT |e|
                              (- (SPADCALL |x| (QREFELT % 15))
                                 (SPADCALL |y| (QREFELT % 15))))
                        (EXIT
                         (COND ((< |e| 0) (CONS 1 "failed"))
                               (#1#
                                (SEQ
                                 (LETT |z|
                                       (CONS |e|
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT % 17))
                                              (SPADCALL |y| (QREFELT % 17))
                                              (QREFELT % 56))))
                                 (EXIT (CONS 0 |z|)))))))))))) 

(SDEFUN |INTLOCP;opposite?;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((EQL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))
          (SPADCALL (SPADCALL |x| (QREFELT % 17)) (SPADCALL |y| (QREFELT % 17))
                    (QREFELT % 60)))
         ('T NIL))) 

(SDEFUN |INTLOCP;unitNormal;%R;25|
        ((|x| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (COND
         ((SPADCALL |x| (QREFELT % 42))
          (VECTOR (|spadConstant| % 40) |x| (|spadConstant| % 40)))
         ('T
          (VECTOR (CONS 0 (SPADCALL |x| (QREFELT % 17)))
                  (CONS (SPADCALL |x| (QREFELT % 15)) (|spadConstant| % 62))
                  (CONS 0
                        (SPADCALL (SPADCALL |x| (QREFELT % 17))
                                  (QREFELT % 63))))))) 

(SDEFUN |INTLOCP;unitCanonical;2%;26| ((|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 42)) |x|)
              ('T (CONS (SPADCALL |x| (QREFELT % 15)) (|spadConstant| % 62))))) 

(SDEFUN |INTLOCP;associates?;2%B;27| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |x| (QREFELT % 42)) (SPADCALL |y| (QREFELT % 42)))
              ((SPADCALL |y| (QREFELT % 42)) (SPADCALL |x| (QREFELT % 42)))
              ('T
               (EQL (SPADCALL |x| (QREFELT % 15))
                    (SPADCALL |y| (QREFELT % 15)))))) 

(SDEFUN |INTLOCP;unit?;%B;28| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT % 15)))
          (NULL (SPADCALL |x| (QREFELT % 42))))
         ('T NIL))) 

(SDEFUN |INTLOCP;recip;%U;29| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((NULL (SPADCALL |x| (QREFELT % 68))) (CONS 1 "failed"))
              ('T
               (CONS 0
                     (CONS 0
                           (SPADCALL (SPADCALL |x| (QREFELT % 17))
                                     (QREFELT % 63))))))) 

(SDEFUN |INTLOCP;gcd;3%;30| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (MIN (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))
              (|spadConstant| % 62))) 

(SDEFUN |INTLOCP;lcm;3%;31| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (MAX (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))
              (SPADCALL (SPADCALL |x| (QREFELT % 17))
                        (SPADCALL |y| (QREFELT % 17)) (QREFELT % 47)))) 

(SDEFUN |INTLOCP;lcmCoef;2%R;32|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))))
        (SPROG
         ((|cy| (%)) (|cx| (%)) (|emax| (|NonNegativeInteger|))
          (|uy| #1=(|Fraction| (|Integer|))) (|ey| #2=(|NonNegativeInteger|))
          (|ux| #1#) (|ex| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT % 42)) (SPADCALL |y| (QREFELT % 42)))
            (VECTOR (|spadConstant| % 39) (|spadConstant| % 39)
                    (|spadConstant| % 39)))
           ('T
            (SEQ (LETT |ex| (SPADCALL |x| (QREFELT % 15)))
                 (LETT |ux| (SPADCALL |x| (QREFELT % 17)))
                 (LETT |ey| (SPADCALL |y| (QREFELT % 15)))
                 (LETT |uy| (SPADCALL |y| (QREFELT % 17)))
                 (LETT |emax| (MAX |ex| |ey|))
                 (LETT |cx| (CONS (- |emax| |ex|) |uy|))
                 (LETT |cy| (CONS (- |emax| |ey|) |ux|))
                 (EXIT
                  (VECTOR (CONS |emax| (SPADCALL |ux| |uy| (QREFELT % 47)))
                          |cx| |cy|)))))))) 

(SDEFUN |INTLOCP;<;2%B;33| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((EQL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))
          (SPADCALL (SPADCALL |x| (QREFELT % 17)) (SPADCALL |y| (QREFELT % 17))
                    (QREFELT % 74)))
         ('T
          (SPADCALL (SPADCALL |x| (QREFELT % 26)) (SPADCALL |y| (QREFELT % 26))
                    (QREFELT % 74))))) 

(SDEFUN |INTLOCP;positive?;%B;34| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 76))) 

(SDEFUN |INTLOCP;negative?;%B;35| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 78))) 

(SDEFUN |INTLOCP;hashUpdate!;Hs%Hs;36|
        ((|hs| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPADCALL (SPADCALL |hs| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 81))
                  (SPADCALL |x| (QREFELT % 17)) (QREFELT % 82))) 

(DECLAIM (NOTINLINE |IntegerLocalizedAtPrime;|)) 

(DEFUN |IntegerLocalizedAtPrime| (#1=#:G169)
  (SPROG NIL
         (PROG (#2=#:G170)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IntegerLocalizedAtPrime|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerLocalizedAtPrime;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IntegerLocalizedAtPrime|)))))))))) 

(DEFUN |IntegerLocalizedAtPrime;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|IntegerLocalizedAtPrime| DV$1))
          (LETT % (GETREFV 93))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IntegerLocalizedAtPrime|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (SPADCALL |#1| (QREFELT % 10)))
          (COND ((QREFELT % 11))
                ('T
                 (|error|
                  "Argument of IntegerLocalizedAtPrime must be a prime")))
          %))) 

(MAKEPROP '|IntegerLocalizedAtPrime| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (|Integer|)
              (|IntegerPrimesPackage| 8) (0 . |prime?|) '#:G0
              (|Union| % '"failed") (5 . |exquo|) (|NonNegativeInteger|)
              |INTLOCP;exponent;%Nni;2| (|Fraction| 8) |INTLOCP;unitPart;%F;3|
              (11 . |coerce|) |INTLOCP;coerce;I%;4| (16 . |denom|)
              (21 . |numer|) |INTLOCP;retract;%I;5| (|Union| 8 '"failed")
              |INTLOCP;retractIfCan;%U;6| (26 . *) |INTLOCP;coerce;%F;7|
              (32 . /) |INTLOCP;retract;F%;8| |INTLOCP;retractIfCan;FU;9|
              (|OutputForm|) (38 . |coerce|) (|PositiveInteger|)
              (43 . |coerce|) (48 . |coerce|) (53 . ^) (59 . |one?|) (64 . *)
              |INTLOCP;coerce;%Of;10|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTLOCP;Zero;%;11|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INTLOCP;One;%;12|) %))
              (70 . |zero?|) |INTLOCP;zero?;%B;13| (75 . +) |INTLOCP;+;3%;14|
              (81 . -) |INTLOCP;-;2%;15| (86 . *) |INTLOCP;*;3%;16|
              |INTLOCP;*;I2%;17| (92 . ^) |INTLOCP;^;%Nni%;18| (98 . =)
              |INTLOCP;=;2%B;19| |INTLOCP;characteristic;Nni;20|
              |INTLOCP;euclideanSize;%Nni;21| (104 . /)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |INTLOCP;divide;2%R;22| |INTLOCP;exquo;2%U;23|
              (110 . |opposite?|) |INTLOCP;opposite?;2%B;24| (116 . |One|)
              (120 . |inv|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              |INTLOCP;unitNormal;%R;25| |INTLOCP;unitCanonical;2%;26|
              |INTLOCP;associates?;2%B;27| |INTLOCP;unit?;%B;28|
              |INTLOCP;recip;%U;29| |INTLOCP;gcd;3%;30| |INTLOCP;lcm;3%;31|
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              |INTLOCP;lcmCoef;2%R;32| (125 . <) |INTLOCP;<;2%B;33|
              (131 . |positive?|) |INTLOCP;positive?;%B;34| (136 . |negative?|)
              |INTLOCP;negative?;%B;35| (|HashState|) (141 . |hashUpdate!|)
              (147 . |hashUpdate!|) |INTLOCP;hashUpdate!;Hs%Hs;36| (|String|)
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 85 '"failed")
              (|Record| (|:| |coef| 85) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 89 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|SingleInteger|))
           '#(~= 153 |zero?| 159 |unitPart| 164 |unitNormal| 169
              |unitCanonical| 174 |unit?| 179 |subtractIfCan| 184 |smaller?|
              190 |sizeLess?| 196 |sign| 202 |sample| 207 |rightRecip| 211
              |rightPower| 216 |retractIfCan| 228 |retract| 238 |rem| 248
              |recip| 254 |quo| 259 |principalIdeal| 265 |positive?| 270
              |plenaryPower| 275 |opposite?| 281 |one?| 287 |negative?| 292
              |multiEuclidean| 297 |min| 303 |max| 309 |leftRecip| 315
              |leftPower| 320 |lcmCoef| 332 |lcm| 338 |latex| 349 |hashUpdate!|
              354 |hash| 360 |gcdPolynomial| 365 |gcd| 371 |extendedEuclidean|
              382 |exquo| 395 |expressIdealMember| 401 |exponent| 407
              |euclideanSize| 412 |divide| 417 |commutator| 423 |coerce| 429
              |characteristic| 449 |associator| 453 |associates?| 460
              |antiCommutator| 466 |annihilate?| 472 |abs| 478 ^ 483 |Zero| 495
              |One| 499 >= 503 > 509 = 515 <= 521 < 527 - 533 + 544 * 550)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|EuclideanDomain&| NIL |GcdDomain&| NIL NIL |OrderedRing&| NIL
                |Algebra&| |EntireRing&| NIL NIL NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |Module&| |NonAssociativeRing&|
                NIL NIL NIL |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |OrderedSet&| |AbelianSemiGroup&| |Magma&|
                NIL |SetCategory&| NIL |RetractableTo&| |RetractableFrom&|
                |Hashable&| NIL |BasicType&| NIL NIL NIL |PartialOrder&| NIL
                NIL NIL)
             (CONS
              '#((|EuclideanDomain|) (|PrincipalIdealDomain|) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|OrderedRing|)
                 (|CommutativeRing|) (|Algebra| $$) (|EntireRing|)
                 (|CharacteristicZero|) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRng|) (|Module| $$)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|OrderedAbelianGroup|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 8)
                 (|RetractableFrom| 16) (|Hashable|) (|CoercibleTo| 30)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|PartialOrder|) (|CoercibleFrom| 8)
                 (|CoercibleTo| 16) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 92
                                  '(1 9 7 8 10 2 8 12 0 0 13 1 16 0 8 18 1 16 8
                                    0 20 1 16 8 0 21 2 16 0 14 0 25 2 16 0 8 8
                                    27 1 16 30 0 31 1 32 30 0 33 1 14 30 0 34 2
                                    30 0 0 0 35 1 16 7 0 36 2 30 0 0 0 37 1 16
                                    7 0 41 2 16 0 0 0 43 1 16 0 0 45 2 16 0 16
                                    0 47 2 16 0 0 8 50 2 16 7 0 0 52 2 16 0 0 0
                                    56 2 16 7 0 0 60 0 16 0 62 1 16 0 0 63 2 16
                                    7 0 0 74 1 16 7 0 76 1 16 7 0 78 2 14 80 80
                                    0 81 2 16 80 80 0 82 2 0 7 0 0 1 1 0 7 0 42
                                    1 0 16 0 17 1 0 64 0 65 1 0 0 0 66 1 0 7 0
                                    68 2 0 12 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 1 0
                                    8 0 1 0 0 0 1 1 0 12 0 1 2 0 0 0 32 1 2 0 0
                                    0 14 1 1 0 23 0 24 1 0 12 16 29 1 0 8 0 22
                                    1 0 0 16 28 2 0 0 0 0 1 1 0 12 0 69 2 0 0 0
                                    0 1 1 0 88 85 1 1 0 7 0 77 2 0 0 0 32 1 2 0
                                    7 0 0 61 1 0 7 0 1 1 0 7 0 79 2 0 87 85 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 1 0 12 0 1 2 0 0 0
                                    32 1 2 0 0 0 14 1 2 0 72 0 0 73 1 0 0 85 1
                                    2 0 0 0 0 71 1 0 84 0 1 2 0 80 80 0 83 1 0
                                    92 0 1 2 0 86 86 86 1 1 0 0 85 1 2 0 0 0 0
                                    70 3 0 90 0 0 0 1 2 0 91 0 0 1 2 0 12 0 0
                                    59 2 0 87 85 0 1 1 0 14 0 15 1 0 14 0 55 2
                                    0 57 0 0 58 2 0 0 0 0 1 1 0 30 0 38 1 0 0 8
                                    19 1 0 0 0 1 1 0 16 0 26 0 0 14 54 3 0 0 0
                                    0 0 1 2 0 7 0 0 67 2 0 0 0 0 1 2 0 7 0 0 1
                                    1 0 0 0 1 2 0 0 0 32 1 2 0 0 0 14 51 0 0 0
                                    39 0 0 0 40 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0
                                    0 53 2 0 7 0 0 1 2 0 7 0 0 75 2 0 0 0 0 1 1
                                    0 0 0 46 2 0 0 0 0 44 2 0 0 32 0 1 2 0 0 0
                                    0 48 2 0 0 8 0 49 2 0 0 14 0 1)))))
           '|lookupComplete|)) 
