
(/VERSIONCHECK 2) 

(DEFUN |MODMON;setPoly;2Rep;1| (|mon| $)
  (PROG (#1=#:G145 |i| #2=#:G134 |copymon| |oldm|)
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
  (PROG (#1=#:G151 |i| #2=#:G150)
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
  (PROG (#1=#:G176 |i| #2=#:G175)
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
  (PROG (#1=#:G178 #2=#:G177 #3=#:G179 #4=#:G181 |i|)
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
  (PROG (#1=#:G186 |i| |w| |mat|)
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
  (PROG (#1=#:G190 |i| |mult| |mat|)
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
  (PROG (|k2| #1=#:G196 |k1|)
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
  (PROG (#1=#:G207 |uv|)
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

(DEFUN |ModMonic| (|#1| |#2|)
  (PROG (#1=#:G130 #2=#:G256 |pv$| #3=#:G255 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|ModMonic|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|ModMonic| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 136) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
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
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
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
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1| '(|Field|)) #3#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (|HasCategory| |#1|
                                                         '(|FiniteFieldCategory|))))
                      . #4#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND
       (LETT #2#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 134217728))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #2#)
           (|augmentPredVector| $ 268435456))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (SPADCALL (|spadConstant| $ 9) 1 (QREFELT $ 11)))
      (QSETREFV $ 14 (SPADCALL (QREFELT $ 12) (QREFELT $ 13)))
      (QSETREFV $ 15
                (PROG1 (LETT #1# (- (QREFELT $ 14) 1) . #4#)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
      (QSETREFV $ 18 (+ (SPADCALL 2 (QREFELT $ 15) (QREFELT $ 17)) 1))
      (QSETREFV $ 19 (|HasCategory| |#1| '(|FiniteFieldCategory|)))
      (QSETREFV $ 24 (SPADCALL 0 (|spadConstant| $ 20) (QREFELT $ 23)))
      (QSETREFV $ 25 (SPADCALL 0 (|spadConstant| $ 20) (QREFELT $ 23)))
      (COND
       ((|testBitVector| |pv$| 20)
        (PROGN
         (QSETREFV $ 47 (CONS (|dispatchFunction| |MODMON;size;Nni;3|) $))
         (QSETREFV $ 51 (CONS (|dispatchFunction| |MODMON;random;$;4|) $)))))
      (COND
       ((QREFELT $ 19)
        (PROGN
         (QSETREFV $ 80
                   (CONS (|dispatchFunction| |MODMON;frobenius;2$;26|) $)))))
      (COND
       ((|testBitVector| |pv$| 15)
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
              (205 . |divide|) (|Union| 111 '#1="failed") (|Matrix| $)
              (|Pattern| (|Float|)) (|Pattern| 39)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 39 $)
              (|InputForm|) (|Fraction| 39) (|SingletonAsOrderedSet|)
              (|Record| (|:| |coef| 100) (|:| |generator| $)) (|List| $)
              (|Union| 100 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 103 '"failed")
              (|Record| (|:| |mat| 112) (|:| |vec| (|Vector| 39))) (|Vector| $)
              (|Matrix| 39) (|List| 115) (|List| 10) (|Symbol|)
              (|Factored| 104) (|Union| 118 '#1#) (|List| 104)
              (|Union| 97 '#2="failed") (|Union| 39 '#2#) (|Mapping| 6 6)
              (|SparseUnivariatePolynomial| 6) (|List| 98)
              (|Record| (|:| |var| 98) (|:| |exponent| 10))
              (|Union| 124 '#3="failed") (|Union| 98 '#3#)
              (|Record| (|:| |mat| 128) (|:| |vec| 49)) (|Matrix| 6) (|List| 6)
              (|Equation| $) (|List| 130) (|Union| 6 '#2#) (|Mapping| 10 10)
              (|String|) (|SingleInteger|))
           '#(~= 211 |zero?| 217 |vectorise| 222 |variables| 228 |unmakeSUP|
              233 |univariate| 238 |unitNormal| 249 |unitCanonical| 254 |unit?|
              259 |totalDegreeSorted| 264 |totalDegree| 270 |subtractIfCan| 281
              |subResultantGcd| 287 |squareFreePolynomial| 293 |squareFreePart|
              298 |squareFree| 303 |solveLinearPolynomialEquation| 308
              |smaller?| 314 |sizeLess?| 320 |size| 326 |shiftRight| 330
              |shiftLeft| 336 |setPoly| 342 |separate| 347 |sample| 353
              |retractIfCan| 357 |retract| 377 |resultant| 397 |rem| 410
              |reductum| 416 |reducedSystem| 421 |reduce| 443 |recip| 448
              |random| 453 |quo| 457 |pseudoRemainder| 463 |pseudoQuotient| 469
              |pseudoDivide| 475 |principalIdeal| 481 |primitivePart| 486
              |primitiveMonomials| 497 |prime?| 502 |pow| 507 |pomopo!| 511
              |patternMatch| 519 |order| 533 |one?| 539 |numberOfMonomials| 544
              |nextItem| 549 |multivariate| 554 |multiplyExponents| 566
              |multiEuclidean| 572 |monomials| 578 |monomial?| 583 |monomial|
              588 |monicDivide| 608 |modulus| 621 |minimumDegree| 625
              |mapExponents| 642 |map| 648 |makeSUP| 654 |mainVariable| 659
              |lookup| 664 |lift| 669 |leadingMonomial| 674
              |leadingCoefficient| 679 |lcm| 684 |latex| 695 |karatsubaDivide|
              700 |isTimes| 706 |isPlus| 711 |isExpt| 716 |integrate| 721
              |init| 726 |index| 730 |hash| 735 |ground?| 740 |ground| 745
              |gcdPolynomial| 750 |gcd| 756 |frobenius| 767
              |factorSquareFreePolynomial| 772 |factorPolynomial| 777 |factor|
              782 |extendedEuclidean| 787 |exquo| 800 |expressIdealMember| 812
              |eval| 818 |euclideanSize| 872 |enumerate| 877 |elt| 881
              |divideExponents| 911 |divide| 917 |discriminant| 923
              |differentiate| 934 |degree| 1017 |convert| 1034 |content| 1049
              |conditionP| 1060 |computePowers| 1065 |composite| 1069 |coerce|
              1081 |coefficients| 1116 |coefficient| 1121 |charthRoot| 1141
              |characteristic| 1146 |binomThmExpt| 1150 |associates?| 1157 ^
              1163 |Zero| 1175 |Vectorise| 1179 |UnVectorise| 1184 |One| 1189 D
              1193 |An| 1269 = 1274 / 1280 - 1286 + 1297 * 1303)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 1 15 0 1 15 0 26 25 0 0 8 11 16 0 0 0 8 9
                                  10 11 14 24 16 16 19 0 0 8 17 0 0 0 0 8 8 11
                                  0 0 0 0 0 0 0 0 3 4 7 18 20 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 2 5 6 12 13 15 11 16 16 21))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| |IntegralDomain&|
                |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Module&| NIL NIL |Module&| NIL NIL
                |Module&| NIL |PartialDifferentialRing&| |Ring&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL NIL |Finite&| |Evalable&| |FullyRetractableTo&|
                |SetCategory&| NIL NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| NIL
                |BasicType&| NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|
                NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 10 98)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 10) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 10)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 97)
                 (|Algebra| 6) (|Algebra| $$) (|PartialDifferentialRing| 98)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 6)
                 (|Module| 97) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Module| 6) (|LinearlyExplicitRingOver| 39)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 115) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 97 97) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| $$) (|LeftModule| 97)
                 (|RightModule| 97) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 39)
                 (|Comparable|) (|StepThrough|) (|Finite|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 6 6) (|RetractableTo| 98) (|InnerEvalable| 98 $$)
                 (|InnerEvalable| 98 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 59) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 92) (|ConvertibleTo| 93) (|RetractableTo| 97)
                 (|RetractableTo| 39) (|additiveValuation|) (|CommutativeStar|)
                 (|noZeroDivisors|) (|Eltable| (|Fraction| $$) (|Fraction| $$))
                 (|ConvertibleTo| 96))
              (|makeByteWordVec2| 135
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
                                    2 0 49 0 10 1 1 0 123 0 1 1 0 0 122 1 2 0
                                    104 0 98 1 1 0 122 0 1 1 16 107 0 1 1 16 0
                                    0 1 1 16 26 0 1 2 0 10 0 123 1 2 0 10 0 123
                                    1 1 0 10 0 1 2 0 37 0 0 1 2 16 0 0 0 1 1 1
                                    116 104 1 1 23 0 0 1 1 23 106 0 1 2 1 117
                                    118 104 1 2 7 26 0 0 1 2 15 26 0 0 1 0 20
                                    10 47 2 0 0 0 10 1 2 0 0 0 10 1 1 0 7 7 44
                                    2 23 105 0 0 1 0 0 0 1 1 12 119 0 1 1 13
                                    120 0 1 1 0 126 0 1 1 0 132 0 1 1 12 97 0 1
                                    1 13 39 0 1 1 0 98 0 1 1 0 6 0 1 2 11 6 0 0
                                    1 3 11 0 0 0 98 1 2 15 0 0 0 1 1 0 0 0 33 2
                                    14 110 91 111 1 1 14 112 91 1 2 0 127 91
                                    111 1 1 0 128 91 1 1 0 0 7 42 1 0 37 0 88 0
                                    20 0 51 2 15 0 0 0 1 2 0 0 0 0 1 2 16 0 0 0
                                    1 2 16 108 0 0 1 1 15 99 100 1 2 23 0 0 98
                                    1 1 23 0 0 1 1 0 100 0 1 1 1 26 0 1 0 0 34
                                    81 4 0 0 0 6 10 0 1 3 3 94 0 92 94 1 3 4 95
                                    0 93 95 1 2 16 10 0 0 1 1 0 26 0 1 1 0 10 0
                                    1 1 18 37 0 1 2 0 0 104 98 1 2 0 0 122 98 1
                                    2 0 0 0 10 1 2 15 101 100 0 1 1 0 100 0 1 1
                                    0 26 0 1 3 0 0 0 98 10 1 3 0 0 0 123 114 1
                                    2 0 0 6 10 78 2 0 66 0 0 1 3 0 66 0 0 98 1
                                    0 0 7 45 2 0 10 0 98 1 2 0 114 0 123 1 1 0
                                    10 0 1 2 0 0 133 0 1 2 0 0 121 0 1 1 0 122
                                    0 1 1 0 126 0 1 1 20 16 0 1 1 0 7 0 41 1 0
                                    0 0 1 1 0 6 0 28 2 23 0 0 0 1 1 23 0 100 1
                                    1 0 134 0 1 2 0 66 0 10 1 1 0 101 0 1 1 0
                                    101 0 1 1 0 125 0 1 1 8 0 0 1 0 18 0 1 1 20
                                    0 16 1 1 0 135 0 1 1 0 26 0 1 1 0 6 0 1 2
                                    23 104 104 104 1 1 23 0 100 1 2 23 0 0 0 1
                                    1 27 0 0 80 1 1 116 104 1 1 1 116 104 1 1 1
                                    106 0 1 3 15 85 0 0 0 1 2 15 102 0 0 1 2 16
                                    37 0 0 87 2 16 37 0 6 1 2 15 101 100 0 1 3
                                    0 0 0 123 100 1 3 0 0 0 98 0 1 3 0 0 0 98 6
                                    1 3 0 0 0 123 129 1 3 0 0 0 100 100 1 2 0 0
                                    0 130 1 3 0 0 0 0 0 1 2 0 0 0 131 1 1 15 10
                                    0 1 0 20 100 1 2 15 6 103 6 1 2 16 103 0
                                    103 1 2 16 103 103 103 1 2 0 0 0 0 1 2 0 6
                                    0 6 1 2 0 37 0 10 1 2 15 66 0 0 89 1 11 6 0
                                    1 2 11 0 0 98 1 3 19 0 0 113 114 1 2 19 0 0
                                    113 1 3 19 0 0 115 10 1 2 19 0 0 115 1 3 0
                                    0 0 121 0 1 2 0 0 0 121 1 3 0 0 0 121 10 1
                                    1 0 0 0 1 2 0 0 0 10 1 3 0 0 0 123 114 1 3
                                    0 0 0 98 10 1 2 0 0 0 98 1 2 0 0 0 123 1 2
                                    0 10 0 98 1 2 0 114 0 123 1 1 0 10 0 31 1 5
                                    92 0 1 1 6 93 0 1 1 21 96 0 1 2 23 0 0 98 1
                                    1 23 6 0 1 1 28 90 91 1 0 0 34 35 2 16 37 0
                                    0 1 2 16 109 103 0 1 1 22 0 97 1 1 16 0 0 1
                                    1 0 0 7 68 1 0 0 98 1 1 0 0 6 58 1 0 0 39 1
                                    1 0 59 0 61 1 0 129 0 1 3 0 0 0 98 10 1 3 0
                                    0 0 123 114 1 2 0 6 0 10 63 1 29 37 0 1 0 0
                                    10 1 3 11 0 0 0 10 1 2 16 26 0 0 1 2 0 0 0
                                    10 83 2 0 0 0 16 1 0 0 0 20 1 0 49 0 76 1 0
                                    0 49 50 0 0 0 8 3 19 0 0 113 114 1 2 19 0 0
                                    113 1 3 19 0 0 115 10 1 2 19 0 0 115 1 3 0
                                    0 0 121 10 1 2 0 0 0 121 1 1 0 0 0 1 2 0 0
                                    0 10 1 3 0 0 0 123 114 1 2 0 0 0 123 1 3 0
                                    0 0 98 10 1 2 0 0 0 98 1 1 0 49 0 1 2 0 26
                                    0 0 69 2 15 0 0 6 1 2 0 0 0 0 1 1 0 0 0 72
                                    2 0 0 0 0 32 2 8 0 97 0 1 2 8 0 0 97 1 2 0
                                    0 6 0 55 2 0 0 0 6 1 2 0 0 0 0 75 2 0 0 39
                                    0 57 2 0 0 10 0 1 2 0 0 16 0 1)))))
           '|lookupComplete|)) 
