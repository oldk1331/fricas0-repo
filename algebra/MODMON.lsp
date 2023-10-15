
(SDEFUN |MODMON;setPoly;2Rep;1| ((|mon| |Rep|) ($ |Rep|))
        (SPROG
         ((#1=#:G124 NIL) (|i| NIL) (#2=#:G113 NIL) (|copymon| (|Rep|))
          (|oldm| (|Rep|)))
         (SEQ
          (COND ((SPADCALL |mon| (QREFELT $ 12) (QREFELT $ 27)) |mon|)
                (#3='T
                 (SEQ
                  (LETT |oldm| (QREFELT $ 12) . #4=(|MODMON;setPoly;2Rep;1|))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |mon| (QREFELT $ 28))
                               (|spadConstant| $ 9) (QREFELT $ 29))
                     (|error| "polynomial must be monic"))
                    (#3#
                     (SEQ (LETT |copymon| (|spadConstant| $ 20) . #4#)
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |mon| (QREFELT $ 30))))
                                 (GO G191)))
                               (SEQ
                                (LETT |copymon|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |mon| (QREFELT $ 28))
                                        (SPADCALL |mon| (QREFELT $ 31))
                                        (QREFELT $ 11))
                                       |copymon| (QREFELT $ 32))
                                      . #4#)
                                (EXIT
                                 (LETT |mon| (SPADCALL |mon| (QREFELT $ 33))
                                       . #4#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (SETELT $ 12 |copymon|)
                          (SETELT $ 14
                                  (SPADCALL (QREFELT $ 12) (QREFELT $ 13)))
                          (SETELT $ 15
                                  (PROG1 (LETT #2# (- (QREFELT $ 14) 1) . #4#)
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#)))
                          (SETELT $ 18
                                  (+ (SPADCALL 2 (QREFELT $ 15) (QREFELT $ 17))
                                     1))
                          (SETELT $ 24 (SPADCALL (QREFELT $ 35)))
                          (COND
                           ((QREFELT $ 19)
                            (SEQ
                             (COND
                              ((SPADCALL (SPADCALL |oldm| (QREFELT $ 31)) 1
                                         (QREFELT $ 36))
                               (COND
                                ((NULL
                                  (QEQCAR
                                   (SPADCALL |oldm| (QREFELT $ 12)
                                             (QREFELT $ 38))
                                   1))
                                 (EXIT
                                  (SEQ (LETT |i| 1 . #4#)
                                       (LETT #1# (QREFELT $ 15) . #4#) G190
                                       (COND
                                        ((|greater_SI| |i| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL (QREFELT $ 25) |i|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 25)
                                                               |i|
                                                               (QREFELT $ 40))
                                                     (QREFELT $ 41))
                                                    (QREFELT $ 42))
                                                   (QREFELT $ 43))))
                                       (LETT |i| (|inc_SI| |i|) . #4#)
                                       (GO G190) G191 (EXIT NIL)))))))
                             (EXIT
                              (SETELT $ 25
                                      (|MODMON;computeFrobeniusPowers| $))))))
                          (EXIT (QREFELT $ 12)))))))))))) 

(SDEFUN |MODMON;modulus;Rep;2| (($ |Rep|)) (QREFELT $ 12)) 

(SDEFUN |MODMON;size;Nni;3| (($ |NonNegativeInteger|))
        (* (QREFELT $ 14) (SPADCALL (QREFELT $ 46)))) 

(SDEFUN |MODMON;random;$;4| (($ $))
        (SPROG ((#1=#:G130 NIL) (|i| NIL) (#2=#:G129 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 15)))
                        . #4=(|MODMON;random;$;4|))
                  (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT $ 48)))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  #2#)
                 (QREFELT $ 50))))) 

(SDEFUN |MODMON;Zero;$;5| (($ $)) (|spadConstant| $ 52)) 

(SDEFUN |MODMON;One;$;6| (($ $)) (|spadConstant| $ 53)) 

(SDEFUN |MODMON;*;R2$;7| ((|c| R) (|x| $) ($ $))
        (SPADCALL |c| |x| (QREFELT $ 54))) 

(SDEFUN |MODMON;*;I2$;8| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 56)) |x| (QREFELT $ 54))) 

(SDEFUN |MODMON;coerce;R$;9| ((|c| R) ($ $)) (SPADCALL |c| 0 (QREFELT $ 11))) 

(SDEFUN |MODMON;coerce;$Of;10| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 60))) 

(SDEFUN |MODMON;coefficient;$NniR;11|
        ((|x| $) (|e| |NonNegativeInteger|) ($ R))
        (SPADCALL |x| |e| (QREFELT $ 62))) 

(SDEFUN |MODMON;reductum;2$;12| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 64))) 

(SDEFUN |MODMON;leadingCoefficient;$R;13| ((|x| $) ($ R))
        (SPADCALL |x| (QREFELT $ 65))) 

(SDEFUN |MODMON;degree;$Nni;14| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 13))) 

(PUT '|MODMON;lift;$Rep;15| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MODMON;lift;$Rep;15| ((|x| $) ($ |Rep|)) |x|) 

(SDEFUN |MODMON;reduce;Rep$;16| ((|p| |Rep|) ($ $))
        (QCDR (SPADCALL |p| (QREFELT $ 12) (QREFELT $ 67)))) 

(SDEFUN |MODMON;coerce;Rep$;17| ((|p| |Rep|) ($ $))
        (SPADCALL |p| (QREFELT $ 42))) 

(SDEFUN |MODMON;=;2$B;18| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 27))) 

(SDEFUN |MODMON;+;3$;19| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 70))) 

(SDEFUN |MODMON;-;2$;20| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 71))) 

(SDEFUN |MODMON;*;3$;21| ((|x| $) (|y| $) ($ $))
        (SPROG ((|p| (|Rep|)) (|ans| ($)) (|n| (|Integer|)))
               (SEQ
                (LETT |p| (SPADCALL |x| |y| (QREFELT $ 73))
                      . #1=(|MODMON;*;3$;21|))
                (LETT |ans| (|spadConstant| $ 52) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |n| (SPADCALL |p| (QREFELT $ 31)) . #1#)
                         (QREFELT $ 15) (QREFELT $ 74)))
                       (GO G191)))
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL (SPADCALL |p| (QREFELT $ 28))
                                                (SPADCALL (QREFELT $ 24)
                                                          (- |n|
                                                             (QREFELT $ 14))
                                                          (QREFELT $ 40))
                                                (QREFELT $ 55))
                                      (QREFELT $ 32))
                            . #1#)
                      (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 33)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |ans| |p| (QREFELT $ 32)))))) 

(SDEFUN |MODMON;Vectorise;$V;22| ((|x| $) ($ |Vector| R))
        (SPROG ((#1=#:G155 NIL) (|i| NIL) (#2=#:G154 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 15)))
                       . #4=(|MODMON;Vectorise;$V;22|))
                 (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 41)) |i|
                                          (QREFELT $ 63)))))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT NIL))
                 #2#)))) 

(SDEFUN |MODMON;UnVectorise;V$;23| ((|vect| |Vector| R) ($ $))
        (SPROG
         ((#1=#:G157 NIL) (#2=#:G156 (|Rep|)) (#3=#:G158 (|Rep|))
          (#4=#:G160 NIL) (|i| NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL . #5=(|MODMON;UnVectorise;V$;23|))
            (SEQ (LETT |i| 0 . #5#) (LETT #4# (QREFELT $ 15) . #5#) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT $ 77))
                                    |i| (QREFELT $ 78))
                          . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 20))))
           (QREFELT $ 42))))) 

(SDEFUN |MODMON;computePowers;Pa;24| (($ |PrimitiveArray| $))
        (SPROG
         ((#1=#:G165 NIL) (|i| NIL) (|w| ($)) (|mat| (|PrimitiveArray| $)))
         (SEQ
          (LETT |mat|
                (SPADCALL (QREFELT $ 14) (|spadConstant| $ 20) (QREFELT $ 23))
                . #2=(|MODMON;computePowers;Pa;24|))
          (SPADCALL |mat| 0
                    (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 72))
                              (QREFELT $ 64))
                    (QREFELT $ 43))
          (LETT |w| (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 11)) . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QREFELT $ 15) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (SPADCALL |mat| |i|
                          (SPADCALL |w|
                                    (SPADCALL |mat| (- |i| 1) (QREFELT $ 40))
                                    (QREFELT $ 73))
                          (QREFELT $ 43))
                (EXIT
                 (COND
                  ((EQL
                    (SPADCALL (SPADCALL |mat| |i| (QREFELT $ 40))
                              (QREFELT $ 31))
                    (QREFELT $ 14))
                   (SPADCALL |mat| |i|
                             (SPADCALL
                              (SPADCALL (SPADCALL |mat| |i| (QREFELT $ 40))
                                        (QREFELT $ 33))
                              (SPADCALL
                               (SPADCALL (SPADCALL |mat| |i| (QREFELT $ 40))
                                         (QREFELT $ 28))
                               (SPADCALL |mat| 0 (QREFELT $ 40))
                               (QREFELT $ 55))
                              (QREFELT $ 32))
                             (QREFELT $ 43))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MODMON;computeFrobeniusPowers| (($ |PrimitiveArray| $))
        (SPROG
         ((#1=#:G169 NIL) (|i| NIL) (|mult| ($)) (|mat| (|PrimitiveArray| $)))
         (SEQ
          (LETT |mat|
                (SPADCALL (QREFELT $ 14) (|spadConstant| $ 8) (QREFELT $ 23))
                . #2=(|MODMON;computeFrobeniusPowers|))
          (SPADCALL |mat| 1
                    (LETT |mult|
                          (SPADCALL (|spadConstant| $ 9)
                                    (SPADCALL (QREFELT $ 46)) (QREFELT $ 78))
                          . #2#)
                    (QREFELT $ 43))
          (SEQ (LETT |i| 2 . #2#) (LETT #1# (QREFELT $ 15) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |mat| |i|
                           (SPADCALL |mult|
                                     (SPADCALL |mat| (- |i| 1) (QREFELT $ 40))
                                     (QREFELT $ 75))
                           (QREFELT $ 43))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MODMON;frobenius;2$;26| ((|a| $) ($ $))
        (SPROG ((|aq| ($)))
               (SEQ
                (LETT |aq| (|spadConstant| $ 20)
                      . #1=(|MODMON;frobenius;2$;26|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |a| (|spadConstant| $ 20) (QREFELT $ 79)))
                       (GO G191)))
                     (SEQ
                      (LETT |aq|
                            (SPADCALL |aq|
                                      (SPADCALL (SPADCALL |a| (QREFELT $ 28))
                                                (SPADCALL (QREFELT $ 25)
                                                          (SPADCALL |a|
                                                                    (QREFELT $
                                                                             31))
                                                          (QREFELT $ 40))
                                                (QREFELT $ 55))
                                      (QREFELT $ 32))
                            . #1#)
                      (EXIT (LETT |a| (SPADCALL |a| (QREFELT $ 33)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |aq|)))) 

(SDEFUN |MODMON;pow;Pa;27| (($ |PrimitiveArray| $)) (QREFELT $ 24)) 

(SDEFUN |MODMON;monomial;RNni$;28| ((|c| R) (|e| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|k2| (|NonNegativeInteger|)) (#1=#:G175 NIL)
          (|k1| (|NonNegativeInteger|)))
         (SEQ
          (COND ((< |e| (QREFELT $ 14)) (SPADCALL |c| |e| (QREFELT $ 11)))
                ((SPADCALL |e| (QREFELT $ 18) (QREFELT $ 82))
                 (SPADCALL |c|
                           (SPADCALL (QREFELT $ 24) (- |e| (QREFELT $ 14))
                                     (QREFELT $ 40))
                           (QREFELT $ 55)))
                ('T
                 (SEQ
                  (LETT |k1| (QUOTIENT2 |e| (QREFELT $ 18))
                        . #2=(|MODMON;monomial;RNni$;28|))
                  (LETT |k2|
                        (PROG1 (LETT #1# (- |e| (* |k1| (QREFELT $ 18))) . #2#)
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        . #2#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (QREFELT $ 24) (QREFELT $ 15) (QREFELT $ 40))
                      |k1| (QREFELT $ 83))
                     (SPADCALL |c| |k2| (QREFELT $ 78)) (QREFELT $ 75))
                    (QREFELT $ 42))))))))) 

(SDEFUN |MODMON;exquo;2$U;29| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G187 NIL)
          (|uv| (|Union| (|Record| (|:| |coef1| $) (|:| |coef2| $)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |uv|
                  (SPADCALL |y| (SPADCALL (QREFELT $ 45)) |x| (QREFELT $ 86))
                  . #2=(|MODMON;exquo;2$U;29|))
            (EXIT
             (COND ((QEQCAR |uv| 1) (CONS 1 "failed"))
                   ('T
                    (PROGN
                     (LETT #1#
                           (CONS 0
                                 (SPADCALL (QCAR (QCDR |uv|)) (QREFELT $ 42)))
                           . #2#)
                     (GO #3=#:G186)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |MODMON;recip;$U;30| ((|y| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 8) |y| (QREFELT $ 87))) 

(SDEFUN |MODMON;divide;2$R;31|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG ((|q| (|Union| $ "failed")))
               (SEQ
                (LETT |q| (SPADCALL |x| |y| (QREFELT $ 87))
                      |MODMON;divide;2$R;31|)
                (EXIT
                 (COND ((QEQCAR |q| 1) (|error| "not divisible"))
                       ('T (CONS (QCDR |q|) (|spadConstant| $ 20)))))))) 

(DECLAIM (NOTINLINE |ModMonic;|)) 

(DEFUN |ModMonic| (|#1| |#2|)
  (SPROG
   ((#1=#:G109 NIL) (#2=#:G240 NIL) (|pv$| NIL) (#3=#:G236 NIL) (#4=#:G237 NIL)
    (#5=#:G238 NIL) (#6=#:G239 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #7=(|ModMonic|))
    (LETT DV$2 (|devaluate| |#2|) . #7#)
    (LETT |dv$| (LIST '|ModMonic| DV$1 DV$2) . #7#)
    (LETT $ (GETREFV 138) . #7#)
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
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #7#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #6#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #7#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #6#
                                            #5#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #6# #5#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo| (|InputForm|))))
                                         (|HasCategory| |#1| '(|Finite|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Float|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Integer|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Float|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo|
                                            (|Pattern| (|Float|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo|
                                            (|Pattern| (|Integer|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #7#)
                                        (OR #4# (|HasCategory| |#1| '(|Field|))
                                            #6# #5#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #4# #6# #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #6# #5#
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #6# #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))
                                              . #7#)
                                        (OR #4# (|HasCategory| |#1| '(|Field|))
                                            #3# #6# #5#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #6#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #5#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #5#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #6#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #5#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #6#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #5#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|))))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #3#
                                         #6# #5#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #3#
                                         #6# #5#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #3#
                                         #6# #5#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #3#
                                         #6# #5#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #7#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 562949953421312))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #7#)
     (|augmentPredVector| $ 1125899906842624))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #2#)
         (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR #6# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 72057594037927936))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 144115188075855872))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 576460752303423488))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12 (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 11)))
    (QSETREFV $ 14 (SPADCALL (QREFELT $ 12) (QREFELT $ 13)))
    (QSETREFV $ 15
              (PROG1 (LETT #1# (- (QREFELT $ 14) 1) . #7#)
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV $ 18 (+ (SPADCALL 2 (QREFELT $ 15) (QREFELT $ 17)) 1))
    (QSETREFV $ 19 (|HasCategory| |#1| '(|FiniteFieldCategory|)))
    (QSETREFV $ 24 (SPADCALL 0 (|spadConstant| $ 20) (QREFELT $ 23)))
    (QSETREFV $ 25 (SPADCALL 0 (|spadConstant| $ 20) (QREFELT $ 23)))
    (COND
     ((|testBitVector| |pv$| 21)
      (PROGN
       (QSETREFV $ 47 (CONS (|dispatchFunction| |MODMON;size;Nni;3|) $))
       (QSETREFV $ 51 (CONS (|dispatchFunction| |MODMON;random;$;4|) $)))))
    (COND
     ((QREFELT $ 19)
      (PROGN
       (QSETREFV $ 80
                 (CONS (|dispatchFunction| |MODMON;frobenius;2$;26|) $)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (PROGN
       (QSETREFV $ 87 (CONS (|dispatchFunction| |MODMON;exquo;2$U;29|) $))
       (QSETREFV $ 88 (CONS (|dispatchFunction| |MODMON;recip;$U;30|) $))
       (QSETREFV $ 89 (CONS (|dispatchFunction| |MODMON;divide;2$R;31|) $)))))
    $))) 

(MAKEPROP '|ModMonic| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MODMON;One;$;6|) $))
              (0 . |One|) (|NonNegativeInteger|) (4 . |monomial|) '|m|
              (10 . |degree|) '|d| '|d1| (|PositiveInteger|) (15 . *) '|twod|
              '|frobenius?|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MODMON;Zero;$;5|) $))
              (21 . |Zero|) (|PrimitiveArray| $$) (25 . |new|) '|power|
              '|frobeniusPower| (|Boolean|) (31 . =)
              |MODMON;leadingCoefficient;$R;13| (37 . ~=) (43 . |zero?|)
              |MODMON;degree;$Nni;14| |MODMON;+;3$;19| |MODMON;reductum;2$;12|
              (|PrimitiveArray| $) |MODMON;computePowers;Pa;24| (48 . >)
              (|Union| $ '"failed") (54 . |exquo|) (|Integer|) (60 . |elt|)
              |MODMON;lift;$Rep;15| |MODMON;reduce;Rep$;16| (66 . |setelt!|)
              |MODMON;setPoly;2Rep;1| |MODMON;modulus;Rep;2| (73 . |size|)
              (77 . |size|) (81 . |random|) (|Vector| 6)
              |MODMON;UnVectorise;V$;23| (85 . |random|) (89 . |Zero|)
              (93 . |One|) (97 . *) |MODMON;*;R2$;7| (103 . |coerce|)
              |MODMON;*;I2$;8| |MODMON;coerce;R$;9| (|OutputForm|)
              (108 . |coerce|) |MODMON;coerce;$Of;10| (113 . |coefficient|)
              |MODMON;coefficient;$NniR;11| (119 . |reductum|)
              (124 . |leadingCoefficient|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (129 . |monicDivide|) |MODMON;coerce;Rep$;17| |MODMON;=;2$B;18|
              (135 . +) (141 . -) |MODMON;-;2$;20| (146 . *) (152 . >)
              |MODMON;*;3$;21| |MODMON;Vectorise;$V;22| (158 . |elt|)
              |MODMON;monomial;RNni$;28| (164 . ~=) (170 . |frobenius|)
              |MODMON;pow;Pa;27| (175 . <=) (181 . ^)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 84 '"failed")
              (187 . |extendedEuclidean|) (194 . |exquo|) (200 . |recip|)
              (205 . |divide|) (|Union| 96 '#1="failed") (|Matrix| $)
              (|Pattern| (|Float|)) (|Pattern| 39) (|Matrix| 39)
              (|Record| (|:| |mat| 94) (|:| |vec| (|Vector| 39))) (|Vector| $)
              (|List| 99) (|List| 10) (|Symbol|)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 39 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|InputForm|) (|Fraction| 39) (|SingletonAsOrderedSet|)
              (|Record| (|:| |coef| 107) (|:| |generator| $)) (|List| $)
              (|Union| 107 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 110 '"failed") (|Factored| 112) (|Union| 119 '#1#)
              (|List| 112) (|Union| 104 '#2="failed") (|Union| 39 '#2#)
              (|Mapping| 6 6) (|List| 105) (|Matrix| 6)
              (|Record| (|:| |mat| 124) (|:| |vec| 49)) (|Union| 105 '#2#)
              (|Equation| $) (|List| 127)
              (|Record| (|:| |var| 105) (|:| |exponent| 10))
              (|Union| 129 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 6) (|Mapping| 10 10) (|Union| 6 '#2#) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 211 |zero?| 217 |vectorise| 222 |variables| 228 |unvectorise|
              233 |unmakeSUP| 238 |univariate| 243 |unitNormal| 254
              |unitCanonical| 259 |unit?| 264 |totalDegreeSorted| 269
              |totalDegree| 275 |subtractIfCan| 286 |subResultantGcd| 292
              |squareFreePolynomial| 298 |squareFreePart| 303 |squareFree| 308
              |solveLinearPolynomialEquation| 313 |smaller?| 319 |sizeLess?|
              325 |size| 331 |shiftRight| 335 |shiftLeft| 341 |setPoly| 347
              |separate| 352 |sample| 358 |retractIfCan| 362 |retract| 382
              |resultant| 402 |rem| 415 |reductum| 421 |reducedSystem| 426
              |reduce| 448 |recip| 453 |random| 458 |quo| 462 |pseudoRemainder|
              468 |pseudoQuotient| 474 |pseudoDivide| 480 |principalIdeal| 486
              |primitivePart| 491 |primitiveMonomials| 502 |prime?| 507 |pow|
              512 |pomopo!| 516 |patternMatch| 524 |order| 538 |opposite?| 544
              |one?| 550 |numberOfMonomials| 555 |nextItem| 560 |multivariate|
              565 |multiplyExponents| 577 |multiEuclidean| 583 |monomials| 589
              |monomial?| 594 |monomial| 599 |monicDivide| 619 |modulus| 632
              |minimumDegree| 636 |mapExponents| 653 |map| 659 |makeSUP| 665
              |mainVariable| 670 |lookup| 675 |lift| 680 |leadingMonomial| 685
              |leadingCoefficient| 690 |lcmCoef| 695 |lcm| 701 |latex| 712
              |karatsubaDivide| 717 |isTimes| 723 |isPlus| 728 |isExpt| 733
              |integrate| 738 |init| 743 |index| 747 |hashUpdate!| 752 |hash|
              758 |ground?| 763 |ground| 768 |gcdPolynomial| 773 |gcd| 779
              |frobenius| 790 |fmecg| 795 |factorSquareFreePolynomial| 803
              |factorPolynomial| 808 |factor| 813 |extendedEuclidean| 818
              |exquo| 831 |expressIdealMember| 843 |eval| 849 |euclideanSize|
              903 |enumerate| 908 |elt| 912 |divideExponents| 942 |divide| 948
              |discriminant| 954 |differentiate| 965 |degree| 1048 |convert|
              1065 |content| 1080 |conditionP| 1091 |computePowers| 1096
              |composite| 1100 |coerce| 1112 |coefficients| 1147 |coefficient|
              1152 |charthRoot| 1172 |characteristic| 1177 |binomThmExpt| 1181
              |associates?| 1188 |annihilate?| 1194 ^ 1200 |Zero| 1212
              |Vectorise| 1216 |UnVectorise| 1221 |One| 1226 D 1230 |An| 1306 =
              1311 / 1317 - 1323 + 1334 * 1340)
           'NIL
           (CONS
            (|makeByteWordVec2| 49
                                '(0 0 0 9 11 0 9 11 0 14 17 1 41 4 18 13 4 1 2
                                  3 41 4 8 4 31 18 15 20 4 0 1 35 49 0 0 1 1 32
                                  34 49 48 10 47 0 10 46 21 0 0 42 43 19 23 0 0
                                  10 0 0 0 0 0 0 0 0 4 5 6 7 44 45 10 10 11 33
                                  12 16 22))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Algebra&| NIL
                |DifferentialExtension&| |Module&| NIL NIL |Module&| NIL NIL
                |PartialDifferentialRing&| NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |Finite&| |AbelianSemiGroup&|
                |SemiGroup&| NIL NIL NIL NIL |FullyRetractableTo&|
                |SetCategory&| |Evalable&| NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |BasicType&| NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |InnerEvalable&|
                |RetractableTo&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 10 105)
                 (|MaybeSkewPolynomialCategory| 6 10 105)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 10) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 10)
                 (|GcdDomain|) (|IntegralDomain|) (|Algebra| 104) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|DifferentialExtension| 6) (|Module| 104)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 39)
                 (|PartialDifferentialRing| 105) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 99)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 104 104)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 104) (|RightModule| 104) (|RightModule| $$)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|Finite|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 39) (|StepThrough|) (|Comparable|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 105 $$)
                 (|InnerEvalable| 105 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 59) (|unitsKnown|) (|RetractableTo| 104)
                 (|RetractableTo| 39) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 92) (|ConvertibleTo| 93)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 105)
                 (|additiveValuation|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$))
                 (|ConvertibleTo| 103))
              (|makeByteWordVec2| 137
                                  '(0 6 0 9 2 7 0 6 10 11 1 7 10 0 13 2 10 0 16
                                    0 17 0 6 0 21 2 22 0 10 2 23 2 7 26 0 0 27
                                    2 6 26 0 0 29 1 0 26 0 30 2 10 26 0 0 36 2
                                    7 37 0 0 38 2 22 2 0 39 40 3 22 2 0 39 2 43
                                    0 6 10 46 0 0 10 47 0 6 0 48 0 0 0 51 0 7 0
                                    52 0 7 0 53 2 7 0 6 0 54 1 6 0 39 56 1 7 59
                                    0 60 2 7 6 0 10 62 1 7 0 0 64 1 7 6 0 65 2
                                    7 66 0 0 67 2 7 0 0 0 70 1 7 0 0 71 2 7 0 0
                                    0 73 2 39 26 0 0 74 2 49 6 0 39 77 2 0 26 0
                                    0 79 1 0 0 0 80 2 10 26 0 0 82 2 0 0 0 10
                                    83 3 7 85 0 0 0 86 2 0 37 0 0 87 1 0 37 0
                                    88 2 0 66 0 0 89 2 0 26 0 0 79 1 60 26 0 30
                                    2 0 49 0 10 1 1 0 123 0 1 1 0 0 49 1 1 0 0
                                    131 1 1 0 131 0 1 2 0 112 0 105 1 1 53 102
                                    0 1 1 53 0 0 1 1 53 26 0 1 2 0 10 0 123 1 2
                                    0 10 0 123 1 1 0 10 0 1 2 59 37 0 0 1 2 16
                                    0 0 0 1 1 9 117 112 1 1 13 0 0 1 1 13 114 0
                                    1 2 9 118 119 112 1 2 23 26 0 0 1 2 11 26 0
                                    0 1 0 21 10 47 2 4 0 0 10 1 2 0 0 0 10 1 1
                                    0 7 7 44 2 13 113 0 0 1 0 60 0 1 1 5 120 0
                                    1 1 6 121 0 1 1 10 126 0 1 1 0 134 0 1 1 5
                                    104 0 1 1 6 39 0 1 1 10 105 0 1 1 0 6 0 1 2
                                    30 6 0 0 1 3 30 0 0 0 105 1 2 11 0 0 0 1 1
                                    0 0 0 33 1 25 94 91 1 2 25 95 91 96 1 1 4
                                    124 91 1 2 4 125 91 96 1 1 0 0 7 42 1 56 37
                                    0 88 0 21 0 51 2 11 0 0 0 1 2 4 0 0 0 1 2
                                    16 0 0 0 1 2 16 115 0 0 1 1 11 106 107 1 2
                                    13 0 0 105 1 1 13 0 0 1 1 10 107 0 1 1 9 26
                                    0 1 0 0 34 81 4 0 0 0 6 10 0 1 3 26 100 0
                                    92 100 1 3 27 101 0 93 101 1 2 16 10 0 0 1
                                    2 60 26 0 0 1 1 56 26 0 1 1 0 10 0 1 1 19
                                    37 0 1 2 0 0 131 105 1 2 0 0 112 105 1 2 0
                                    0 0 10 1 2 11 108 107 0 1 1 0 107 0 1 1 0
                                    26 0 1 3 0 0 0 105 10 1 3 0 0 0 123 98 1 2
                                    0 0 6 10 78 2 4 66 0 0 1 3 4 66 0 0 105 1 0
                                    0 7 45 2 0 98 0 123 1 2 0 10 0 105 1 1 0 10
                                    0 1 2 0 0 133 0 1 2 0 0 122 0 1 1 0 131 0 1
                                    1 0 126 0 1 1 21 16 0 1 1 0 7 0 41 1 0 0 0
                                    1 1 0 6 0 28 2 13 111 0 0 1 2 13 0 0 0 1 1
                                    13 0 107 1 1 0 136 0 1 2 4 66 0 10 1 1 10
                                    108 0 1 1 0 108 0 1 1 10 130 0 1 1 1 0 0 1
                                    0 19 0 1 1 21 0 16 1 2 0 135 135 0 1 1 0
                                    137 0 1 1 0 26 0 1 1 0 6 0 1 2 13 112 112
                                    112 1 2 13 0 0 0 1 1 13 0 107 1 1 40 0 0 80
                                    4 4 0 0 10 6 0 1 1 9 117 112 1 1 9 117 112
                                    1 1 9 114 0 1 3 11 85 0 0 0 1 2 11 109 0 0
                                    1 2 53 37 0 0 87 2 12 37 0 6 1 2 11 108 107
                                    0 1 3 10 0 0 107 107 1 2 10 0 0 127 1 3 10
                                    0 0 0 0 1 2 10 0 0 128 1 3 0 0 0 105 0 1 3
                                    0 0 0 123 107 1 3 0 0 0 123 132 1 3 0 0 0
                                    105 6 1 1 11 10 0 1 0 21 107 1 2 11 6 110 6
                                    1 2 16 110 0 110 1 2 16 110 110 110 1 2 0 0
                                    0 0 1 2 0 6 0 6 1 2 0 37 0 10 1 2 11 66 0 0
                                    89 1 30 6 0 1 2 30 0 0 105 1 3 36 0 0 99 10
                                    1 3 36 0 0 97 98 1 2 36 0 0 99 1 2 36 0 0
                                    97 1 1 4 0 0 1 2 4 0 0 10 1 2 4 0 0 122 1 3
                                    4 0 0 122 10 1 3 4 0 0 122 0 1 2 4 0 0 123
                                    1 2 4 0 0 105 1 3 4 0 0 105 10 1 3 4 0 0
                                    123 98 1 2 0 10 0 105 1 2 0 98 0 123 1 1 0
                                    10 0 31 1 28 92 0 1 1 29 93 0 1 1 22 103 0
                                    1 2 13 0 0 105 1 1 13 6 0 1 1 51 90 91 1 0
                                    0 34 35 2 16 116 110 0 1 2 16 37 0 0 1 1 55
                                    0 39 1 1 54 0 0 1 1 24 0 104 1 1 10 0 105 1
                                    1 0 0 7 68 1 0 0 6 58 1 0 59 0 61 1 0 132 0
                                    1 3 0 0 0 123 98 1 3 0 0 0 105 10 1 2 0 6 0
                                    10 63 1 52 37 0 1 0 57 10 1 3 50 0 0 0 10 1
                                    2 53 26 0 0 1 2 57 26 0 0 1 2 56 0 0 10 83
                                    2 0 0 0 16 1 0 60 0 20 1 0 49 0 76 1 0 0 49
                                    50 0 56 0 8 3 36 0 0 97 98 1 2 36 0 0 97 1
                                    3 36 0 0 99 10 1 2 36 0 0 99 1 1 4 0 0 1 2
                                    4 0 0 10 1 3 4 0 0 122 10 1 2 4 0 0 122 1 2
                                    4 0 0 105 1 3 4 0 0 105 10 1 2 4 0 0 123 1
                                    3 4 0 0 123 98 1 1 0 49 0 1 2 0 26 0 0 69 2
                                    11 0 0 6 1 2 58 0 0 0 1 1 58 0 0 72 2 0 0 0
                                    0 32 2 58 0 39 0 57 2 60 0 10 0 1 2 1 0 0
                                    104 1 2 1 0 104 0 1 2 0 0 0 6 1 2 0 0 6 0
                                    55 2 0 0 0 0 75 2 0 0 16 0 1)))))
           '|lookupComplete|)) 
