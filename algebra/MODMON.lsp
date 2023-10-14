
(DEFUN |MODMON;setPoly;2Rep;1| (|mon| $)
  (PROG (#1=#:G123 |i| #2=#:G112 |copymon| |oldm|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |mon| (QREFELT $ 12) (QREFELT $ 27)) |mon|)
            (#3='T
             (SEQ (LETT |oldm| (QREFELT $ 12) . #4=(|MODMON;setPoly;2Rep;1|))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |mon| (QREFELT $ 28))
                               (|spadConstant| $ 9) (QREFELT $ 29))
                     (|error| "polynomial must be monic"))
                    (#3#
                     (SEQ (LETT |copymon| (|spadConstant| $ 20) . #4#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((SPADCALL |mon| (QREFELT $ 30)) 'NIL)
                                        ('T 'T)))
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
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#)))
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
                          (EXIT (QREFELT $ 12))))))))))))) 

(DEFUN |MODMON;modulus;Rep;2| ($) (QREFELT $ 12)) 

(DEFUN |MODMON;size;Nni;3| ($) (* (QREFELT $ 14) (SPADCALL (QREFELT $ 46)))) 

(DEFUN |MODMON;random;$;4| ($)
  (PROG (#1=#:G129 |i| #2=#:G128)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT $ 15)))
              . #4=(|MODMON;random;$;4|))
        (SEQ (LETT |i| 0 . #4#) (LETT #1# #3# . #4#) G190
             (COND ((|greater_SI| |i| #1#) (GO G191)))
             (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT $ 48)))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        #2#)
       (QREFELT $ 50)))))) 

(DEFUN |MODMON;Zero;$;5| ($) (|spadConstant| $ 52)) 

(DEFUN |MODMON;One;$;6| ($) (|spadConstant| $ 53)) 

(DEFUN |MODMON;*;R2$;7| (|c| |x| $) (SPADCALL |c| |x| (QREFELT $ 54))) 

(DEFUN |MODMON;*;I2$;8| (|n| |x| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 56)) |x| (QREFELT $ 54))) 

(DEFUN |MODMON;coerce;R$;9| (|c| $) (SPADCALL |c| 0 (QREFELT $ 11))) 

(DEFUN |MODMON;coerce;$Of;10| (|x| $) (SPADCALL |x| (QREFELT $ 60))) 

(DEFUN |MODMON;coefficient;$NniR;11| (|x| |e| $)
  (SPADCALL |x| |e| (QREFELT $ 62))) 

(DEFUN |MODMON;reductum;2$;12| (|x| $) (SPADCALL |x| (QREFELT $ 64))) 

(DEFUN |MODMON;leadingCoefficient;$R;13| (|x| $) (SPADCALL |x| (QREFELT $ 65))) 

(DEFUN |MODMON;degree;$Nni;14| (|x| $) (SPADCALL |x| (QREFELT $ 13))) 

(PUT '|MODMON;lift;$Rep;15| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |MODMON;lift;$Rep;15| (|x| $) |x|) 

(DEFUN |MODMON;reduce;Rep$;16| (|p| $)
  (QCDR (SPADCALL |p| (QREFELT $ 12) (QREFELT $ 67)))) 

(DEFUN |MODMON;coerce;Rep$;17| (|p| $) (SPADCALL |p| (QREFELT $ 42))) 

(DEFUN |MODMON;=;2$B;18| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 27))) 

(DEFUN |MODMON;+;3$;19| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 70))) 

(DEFUN |MODMON;-;2$;20| (|x| $) (SPADCALL |x| (QREFELT $ 71))) 

(DEFUN |MODMON;*;3$;21| (|x| |y| $)
  (PROG (|p| |ans| |n|)
    (RETURN
     (SEQ (LETT |p| (SPADCALL |x| |y| (QREFELT $ 73)) . #1=(|MODMON;*;3$;21|))
          (LETT |ans| (|spadConstant| $ 52) . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |n| (SPADCALL |p| (QREFELT $ 31)) . #1#)
                            (QREFELT $ 15) (QREFELT $ 74)))
                 (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL (SPADCALL |p| (QREFELT $ 28))
                                          (SPADCALL (QREFELT $ 24)
                                                    (- |n| (QREFELT $ 14))
                                                    (QREFELT $ 40))
                                          (QREFELT $ 55))
                                (QREFELT $ 32))
                      . #1#)
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 33)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |ans| |p| (QREFELT $ 32))))))) 

(DEFUN |MODMON;Vectorise;$V;22| (|x| $)
  (PROG (#1=#:G154 |i| #2=#:G153)
    (RETURN
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
            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
       #2#))))) 

(DEFUN |MODMON;UnVectorise;V$;23| (|vect| $)
  (PROG (#1=#:G156 #2=#:G155 #3=#:G157 #4=#:G159 |i|)
    (RETURN
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
                      (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT $ 77)) |i|
                                (QREFELT $ 78))
                      . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 20))))
       (QREFELT $ 42)))))) 

(DEFUN |MODMON;computePowers;Pa;24| ($)
  (PROG (#1=#:G164 |i| |w| |mat|)
    (RETURN
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
                      (SPADCALL |w| (SPADCALL |mat| (- |i| 1) (QREFELT $ 40))
                                (QREFELT $ 73))
                      (QREFELT $ 43))
            (EXIT
             (COND
              ((EQL
                (SPADCALL (SPADCALL |mat| |i| (QREFELT $ 40)) (QREFELT $ 31))
                (QREFELT $ 14))
               (SPADCALL |mat| |i|
                         (SPADCALL
                          (SPADCALL (SPADCALL |mat| |i| (QREFELT $ 40))
                                    (QREFELT $ 33))
                          (SPADCALL
                           (SPADCALL (SPADCALL |mat| |i| (QREFELT $ 40))
                                     (QREFELT $ 28))
                           (SPADCALL |mat| 0 (QREFELT $ 40)) (QREFELT $ 55))
                          (QREFELT $ 32))
                         (QREFELT $ 43))))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |mat|))))) 

(DEFUN |MODMON;computeFrobeniusPowers| ($)
  (PROG (#1=#:G168 |i| |mult| |mat|)
    (RETURN
     (SEQ
      (LETT |mat| (SPADCALL (QREFELT $ 14) (|spadConstant| $ 8) (QREFELT $ 23))
            . #2=(|MODMON;computeFrobeniusPowers|))
      (SPADCALL |mat| 1
                (LETT |mult|
                      (SPADCALL (|spadConstant| $ 9) (SPADCALL (QREFELT $ 46))
                                (QREFELT $ 78))
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
      (EXIT |mat|))))) 

(DEFUN |MODMON;frobenius;2$;26| (|a| $)
  (PROG (|aq|)
    (RETURN
     (SEQ (LETT |aq| (|spadConstant| $ 20) . #1=(|MODMON;frobenius;2$;26|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |a| (|spadConstant| $ 20) (QREFELT $ 79)))
                 (GO G191)))
               (SEQ
                (LETT |aq|
                      (SPADCALL |aq|
                                (SPADCALL (SPADCALL |a| (QREFELT $ 28))
                                          (SPADCALL (QREFELT $ 25)
                                                    (SPADCALL |a|
                                                              (QREFELT $ 31))
                                                    (QREFELT $ 40))
                                          (QREFELT $ 55))
                                (QREFELT $ 32))
                      . #1#)
                (EXIT (LETT |a| (SPADCALL |a| (QREFELT $ 33)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |aq|))))) 

(DEFUN |MODMON;pow;Pa;27| ($) (QREFELT $ 24)) 

(DEFUN |MODMON;monomial;RNni$;28| (|c| |e| $)
  (PROG (|k2| #1=#:G174 |k1|)
    (RETURN
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
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (QREFELT $ 24) (QREFELT $ 15) (QREFELT $ 40)) |k1|
                  (QREFELT $ 83))
                 (SPADCALL |c| |k2| (QREFELT $ 78)) (QREFELT $ 75))
                (QREFELT $ 42)))))))))) 

(DEFUN |MODMON;exquo;2$U;29| (|x| |y| $)
  (PROG (#1=#:G185 |uv|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |uv| (SPADCALL |y| (SPADCALL (QREFELT $ 45)) |x| (QREFELT $ 86))
              . #2=(|MODMON;exquo;2$U;29|))
        (EXIT
         (COND ((QEQCAR |uv| 1) (CONS 1 "failed"))
               ('T
                (PROGN
                 (LETT #1#
                       (CONS 0 (SPADCALL (QCAR (QCDR |uv|)) (QREFELT $ 42)))
                       . #2#)
                 (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODMON;recip;$U;30| (|y| $)
  (SPADCALL (|spadConstant| $ 8) |y| (QREFELT $ 87))) 

(DEFUN |MODMON;divide;2$R;31| (|x| |y| $)
  (PROG (|q|)
    (RETURN
     (SEQ (LETT |q| (SPADCALL |x| |y| (QREFELT $ 87)) |MODMON;divide;2$R;31|)
          (EXIT
           (COND ((QEQCAR |q| 1) (|error| "not divisible"))
                 ('T (CONS (QCDR |q|) (|spadConstant| $ 20))))))))) 

(DECLAIM (NOTINLINE |ModMonic;|)) 

(DEFUN |ModMonic| (|#1| |#2|)
  (PROG (#1=#:G108 #2=#:G238 |pv$| #3=#:G234 #4=#:G235 #5=#:G236 #6=#:G237 $
         |dv$| DV$2 DV$1)
    (RETURN
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
                                                         '(|PolynomialFactorizationExplicit|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
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
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #7#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #6#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           #6#)
                                          (LETT #5#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #7#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #6# #5#
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #7#)
                                          (OR #4#
                                              (|HasCategory| |#1| '(|Field|))
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
                                              #6# #5#)
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|FiniteFieldCategory|))
                                                . #7#)
                                          (OR #4#
                                              (|HasCategory| |#1| '(|Field|))
                                              #3# #6# #5#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))))
                      . #7#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 8589934592))
      (AND
       (LETT #2#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #7#)
       (|augmentPredVector| $ 17179869184))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #2#)
           (|augmentPredVector| $ 34359738368))
      (AND
       (OR (|HasCategory| |#1| '(|EntireRing|))
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 68719476736))
      (AND
       (OR #6#
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 137438953472))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 11)))
      (QSETREFV $ 14 (SPADCALL (QREFELT $ 12) (QREFELT $ 13)))
      (QSETREFV $ 15
                (PROG1 (LETT #1# (- (QREFELT $ 14) 1) . #7#)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
      (QSETREFV $ 18 (+ (SPADCALL 2 (QREFELT $ 15) (QREFELT $ 17)) 1))
      (QSETREFV $ 19 (|HasCategory| |#1| '(|FiniteFieldCategory|)))
      (QSETREFV $ 24 (SPADCALL 0 (|spadConstant| $ 20) (QREFELT $ 23)))
      (QSETREFV $ 25 (SPADCALL 0 (|spadConstant| $ 20) (QREFELT $ 23)))
      (COND
       ((|testBitVector| |pv$| 24)
        (PROGN
         (QSETREFV $ 47 (CONS (|dispatchFunction| |MODMON;size;Nni;3|) $))
         (QSETREFV $ 51 (CONS (|dispatchFunction| |MODMON;random;$;4|) $)))))
      (COND
       ((QREFELT $ 19)
        (PROGN
         (QSETREFV $ 80
                   (CONS (|dispatchFunction| |MODMON;frobenius;2$;26|) $)))))
      (COND
       ((|testBitVector| |pv$| 14)
        (PROGN
         (QSETREFV $ 87 (CONS (|dispatchFunction| |MODMON;exquo;2$U;29|) $))
         (QSETREFV $ 88 (CONS (|dispatchFunction| |MODMON;recip;$U;30|) $))
         (QSETREFV $ 89
                   (CONS (|dispatchFunction| |MODMON;divide;2$R;31|) $)))))
      $)))) 

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
              |MODMON;lift;$Rep;15| |MODMON;reduce;Rep$;16| (66 . |setelt|)
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
              (205 . |divide|) (|Union| 113 '#1="failed") (|Matrix| $)
              (|Pattern| (|Float|)) (|Pattern| 39)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 39 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|InputForm|) (|Fraction| 39) (|SingletonAsOrderedSet|)
              (|Union| 101 '"failed") (|List| $)
              (|Record| (|:| |coef| 101) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 104 '"failed") (|Matrix| 39)
              (|Record| (|:| |mat| 111) (|:| |vec| (|Vector| 39))) (|Vector| $)
              (|List| 116) (|List| 10) (|Symbol|) (|Factored| 106)
              (|Union| 119 '#1#) (|List| 106) (|Union| 98 '#2="failed")
              (|Union| 39 '#2#) (|Mapping| 6 6)
              (|SparseUnivariatePolynomial| 6)
              (|Record| (|:| |var| 99) (|:| |exponent| 10))
              (|Union| 124 '"failed") (|List| 99) (|Union| 99 '#2#) (|List| 6)
              (|Equation| $) (|List| 129) (|Union| 6 '#2#) (|Mapping| 10 10)
              (|Record| (|:| |mat| 134) (|:| |vec| 49)) (|Matrix| 6)
              (|HashState|) (|String|) (|SingleInteger|))
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
              |frobenius| 790 |factorSquareFreePolynomial| 795
              |factorPolynomial| 800 |factor| 805 |extendedEuclidean| 810
              |exquo| 823 |expressIdealMember| 835 |eval| 841 |euclideanSize|
              895 |enumerate| 900 |elt| 904 |divideExponents| 934 |divide| 940
              |discriminant| 946 |differentiate| 957 |degree| 1040 |convert|
              1057 |content| 1072 |conditionP| 1083 |computePowers| 1088
              |composite| 1092 |coerce| 1104 |coefficients| 1139 |coefficient|
              1144 |charthRoot| 1164 |characteristic| 1169 |binomThmExpt| 1173
              |associates?| 1180 |annihilate?| 1186 ^ 1192 |Zero| 1204
              |Vectorise| 1208 |UnVectorise| 1213 |One| 1218 D 1222 |An| 1298 =
              1303 / 1309 - 1315 + 1326 * 1332)
           'NIL
           (CONS
            (|makeByteWordVec2| 33
                                '(0 0 0 1 14 0 1 14 0 17 20 0 0 6 33 21 16 0 0
                                  0 6 7 8 33 13 28 21 18 23 0 0 6 31 0 0 0 0 6
                                  6 29 0 0 0 0 0 0 0 0 2 3 12 22 24 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 4 5 9 10 11 14 30 15 19 25))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| NIL |PartialDifferentialRing&| |DifferentialRing&|
                NIL |Module&| NIL NIL |Module&| NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |Ring&| NIL NIL NIL |Rng&| NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |Finite&| |Evalable&| |FullyRetractableTo&| |SetCategory&| NIL
                NIL NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 10 99)
                 (|MaybeSkewPolynomialCategory| 6 10 99)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 10) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 10)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 98)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|PartialDifferentialRing| 99) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 6) (|Module| 98)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 39) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 116)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 98 98)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 98) (|RightModule| 98)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 39)
                 (|Comparable|) (|StepThrough|) (|Finite|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 6 6) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 99) (|InnerEvalable| 99 $$)
                 (|InnerEvalable| 99 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 59) (|ConvertibleTo| 92) (|ConvertibleTo| 93)
                 (|RetractableTo| 98) (|RetractableTo| 39)
                 (|canonicalUnitNormal|) (|additiveValuation|)
                 (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$))
                 (|ConvertibleTo| 97))
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
                                    88 2 0 66 0 0 89 2 0 26 0 0 79 1 0 26 0 30
                                    2 0 49 0 10 1 1 0 126 0 1 1 0 0 49 1 1 0 0
                                    123 1 2 0 106 0 99 1 1 0 123 0 1 1 37 96 0
                                    1 1 37 0 0 1 1 37 26 0 1 2 0 10 0 126 1 1 0
                                    10 0 1 2 0 10 0 126 1 2 0 37 0 0 1 2 19 0 0
                                    0 1 1 1 117 106 1 1 16 0 0 1 1 16 108 0 1 2
                                    1 118 119 106 1 2 12 26 0 0 1 2 14 26 0 0 1
                                    0 24 10 47 2 0 0 0 10 1 2 0 0 0 10 1 1 0 7
                                    7 44 2 16 107 0 0 1 0 0 0 1 1 9 120 0 1 1
                                    10 121 0 1 1 0 127 0 1 1 0 131 0 1 1 9 98 0
                                    1 1 10 39 0 1 1 0 99 0 1 1 0 6 0 1 2 27 6 0
                                    0 1 3 27 0 0 0 99 1 2 14 0 0 0 1 1 0 0 0 33
                                    1 13 111 91 1 2 13 112 91 113 1 2 0 133 91
                                    113 1 1 0 134 91 1 1 0 0 7 42 1 0 37 0 88 0
                                    24 0 51 2 14 0 0 0 1 2 0 0 0 0 1 2 19 0 0 0
                                    1 2 19 109 0 0 1 1 14 102 101 1 2 16 0 0 99
                                    1 1 16 0 0 1 1 0 101 0 1 1 1 26 0 1 0 0 34
                                    81 4 0 0 0 6 10 0 1 3 2 94 0 92 94 1 3 3 95
                                    0 93 95 1 2 19 10 0 0 1 2 0 26 0 0 1 1 0 26
                                    0 1 1 0 10 0 1 1 22 37 0 1 2 0 0 106 99 1 2
                                    0 0 123 99 1 2 0 0 0 10 1 2 14 100 101 0 1
                                    1 0 101 0 1 1 0 26 0 1 2 0 0 6 10 78 3 0 0
                                    0 99 10 1 3 0 0 0 126 115 1 2 0 66 0 0 1 3
                                    0 66 0 0 99 1 0 0 7 45 2 0 115 0 126 1 2 0
                                    10 0 99 1 1 0 10 0 1 2 0 0 132 0 1 2 0 0
                                    122 0 1 1 0 123 0 1 1 0 127 0 1 1 24 16 0 1
                                    1 0 7 0 41 1 0 0 0 1 1 0 6 0 28 2 16 105 0
                                    0 1 1 16 0 101 1 2 16 0 0 0 1 1 0 136 0 1 2
                                    0 66 0 10 1 1 0 100 0 1 1 0 100 0 1 1 0 125
                                    0 1 1 6 0 0 1 0 22 0 1 1 24 0 16 1 2 0 135
                                    135 0 1 1 0 137 0 1 1 0 26 0 1 1 0 6 0 1 2
                                    16 106 106 106 1 2 16 0 0 0 1 1 16 0 101 1
                                    1 32 0 0 80 1 1 117 106 1 1 1 117 106 1 1 1
                                    108 0 1 3 14 85 0 0 0 1 2 14 103 0 0 1 2 37
                                    37 0 0 87 2 15 37 0 6 1 2 14 100 101 0 1 3
                                    0 0 0 126 101 1 3 0 0 0 99 0 1 3 0 0 0 99 6
                                    1 3 0 0 0 126 128 1 3 0 0 0 101 101 1 2 0 0
                                    0 129 1 3 0 0 0 0 0 1 2 0 0 0 130 1 1 14 10
                                    0 1 0 24 101 1 2 14 6 104 6 1 2 19 104 0
                                    104 1 2 19 104 104 104 1 2 0 0 0 0 1 2 0 6
                                    0 6 1 2 0 37 0 10 1 2 14 66 0 0 89 1 27 6 0
                                    1 2 27 0 0 99 1 3 23 0 0 114 115 1 2 23 0 0
                                    114 1 3 23 0 0 116 10 1 2 23 0 0 116 1 3 0
                                    0 0 122 0 1 2 0 0 0 122 1 3 0 0 0 122 10 1
                                    1 0 0 0 1 2 0 0 0 10 1 3 0 0 0 99 10 1 3 0
                                    0 0 126 115 1 2 0 0 0 99 1 2 0 0 0 126 1 1
                                    0 10 0 31 2 0 115 0 126 1 2 0 10 0 99 1 1 4
                                    92 0 1 1 5 93 0 1 1 25 97 0 1 2 16 0 0 99 1
                                    1 16 6 0 1 1 35 90 91 1 0 0 34 35 2 19 37 0
                                    0 1 2 19 110 104 0 1 1 38 0 0 1 1 26 0 98 1
                                    1 0 0 7 68 1 0 0 99 1 1 0 0 6 58 1 0 0 39 1
                                    1 0 59 0 61 1 0 128 0 1 2 0 6 0 10 63 3 0 0
                                    0 99 10 1 3 0 0 0 126 115 1 1 36 37 0 1 0 0
                                    10 1 3 34 0 0 0 10 1 2 37 26 0 0 1 2 0 26 0
                                    0 1 2 0 0 0 10 83 2 0 0 0 16 1 0 0 0 20 1 0
                                    49 0 76 1 0 0 49 50 0 0 0 8 3 23 0 0 114
                                    115 1 2 23 0 0 114 1 3 23 0 0 116 10 1 2 23
                                    0 0 116 1 3 0 0 0 122 10 1 2 0 0 0 122 1 1
                                    0 0 0 1 2 0 0 0 10 1 3 0 0 0 126 115 1 3 0
                                    0 0 99 10 1 2 0 0 0 99 1 2 0 0 0 126 1 1 0
                                    49 0 1 2 0 26 0 0 69 2 14 0 0 6 1 2 0 0 0 0
                                    1 1 0 0 0 72 2 0 0 0 0 32 2 6 0 98 0 1 2 6
                                    0 0 98 1 2 0 0 6 0 55 2 0 0 0 6 1 2 0 0 0 0
                                    75 2 0 0 39 0 57 2 0 0 10 0 1 2 0 0 16 0
                                    1)))))
           '|lookupComplete|)) 
