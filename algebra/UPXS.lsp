
(PUT '|UPXS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |UPXS;getExpon| ((|pxs| $) ($ |Fraction| (|Integer|))) (QCAR |pxs|)) 

(SDEFUN |UPXS;variable;$S;2| ((|upxs| $) ($ |Symbol|)) (QREFELT $ 7)) 

(SDEFUN |UPXS;center;$Coef;3| ((|upxs| $) ($ |Coef|)) (QREFELT $ 8)) 

(SDEFUN |UPXS;coerce;Uts$;4|
        ((|uts| |UnivariateTaylorSeries| |Coef| |var| |cen|) ($ $))
        (SPADCALL (SPADCALL |uts| (QREFELT $ 15)) (QREFELT $ 16))) 

(SDEFUN |UPXS;retractIfCan;$U;5|
        ((|upxs| $)
         ($ |Union| (|UnivariateTaylorSeries| |Coef| |var| |cen|) "failed"))
        (SPROG
         ((|ulsIfCan|
           (|Union| (|UnivariateLaurentSeries| |Coef| |var| |cen|) "failed")))
         (SEQ
          (LETT |ulsIfCan| (SPADCALL |upxs| (QREFELT $ 19))
                |UPXS;retractIfCan;$U;5|)
          (EXIT
           (COND ((QEQCAR |ulsIfCan| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |ulsIfCan|) (QREFELT $ 21)))))))) 

(SDEFUN |UPXS;coerce;V$;6| ((|v| |Variable| |var|) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 8) (QREFELT $ 24))
          (SPADCALL (|spadConstant| $ 25) (|spadConstant| $ 28)
                    (QREFELT $ 29)))
         ('T
          (SPADCALL
           (SPADCALL (|spadConstant| $ 25) (|spadConstant| $ 28)
                     (QREFELT $ 29))
           (SPADCALL (QREFELT $ 8) (|spadConstant| $ 32) (QREFELT $ 29))
           (QREFELT $ 33))))) 

(SDEFUN |UPXS;differentiate;$V$;7| ((|upxs| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |upxs| (QREFELT $ 36))) 

(SDEFUN |UPXS;integrate;$V$;8| ((|upxs| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |upxs| (QREFELT $ 38))) 

(SDEFUN |UPXS;roundDown| ((|rn| |Fraction| (|Integer|)) ($ |Integer|))
        (SPROG ((|n| (|Integer|)) (|num| (|Integer|)) (|den| (|Integer|)))
               (SEQ
                (LETT |den| (SPADCALL |rn| (QREFELT $ 41))
                      . #1=(|UPXS;roundDown|))
                (EXIT
                 (COND ((EQL |den| 1) (SPADCALL |rn| (QREFELT $ 42)))
                       (#2='T
                        (SEQ
                         (LETT |n|
                               (QUOTIENT2
                                (LETT |num| (SPADCALL |rn| (QREFELT $ 42))
                                      . #1#)
                                |den|)
                               . #1#)
                         (EXIT
                          (COND ((SPADCALL |num| (QREFELT $ 43)) |n|)
                                (#2# (- |n| 1))))))))))) 

(SDEFUN |UPXS;stToCoef|
        ((|st| |Stream| |Coef|) (|term| |Coef|) (|n| |NonNegativeInteger|)
         (|n0| |NonNegativeInteger|) ($ |Coef|))
        (COND
         ((OR (SPADCALL |n| |n0| (QREFELT $ 45))
              (SPADCALL |st| (QREFELT $ 47)))
          (|spadConstant| $ 30))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |st| (QREFELT $ 48))
                     (SPADCALL |term| |n| (QREFELT $ 49)) (QREFELT $ 50))
           (|UPXS;stToCoef| (SPADCALL |st| (QREFELT $ 51)) |term| (+ |n| 1)
            |n0| $)
           (QREFELT $ 52))))) 

(SDEFUN |UPXS;approximateLaurent|
        ((|x| |UnivariateLaurentSeries| |Coef| |var| |cen|) (|term| |Coef|)
         (|n| |Integer|) ($ |Coef|))
        (SPROG
         ((|app| (|Coef|)) (#1=#:G145 NIL) (|m| (|Integer|)) (|e| (|Integer|)))
         (SEQ
          (LETT |m|
                (- |n|
                   (LETT |e| (SPADCALL |x| (QREFELT $ 53))
                         . #2=(|UPXS;approximateLaurent|)))
                . #2#)
          (EXIT
           (COND ((< |m| 0) (|spadConstant| $ 30))
                 (#3='T
                  (SEQ
                   (LETT |app|
                         (|UPXS;stToCoef|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 54))
                                    (QREFELT $ 55))
                          |term| 0
                          (PROG1 (LETT #1# |m| . #2#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          $)
                         . #2#)
                   (EXIT
                    (COND ((ZEROP |e|) |app|)
                          (#3#
                           (SPADCALL |app|
                                     (SPADCALL |term|
                                               (SPADCALL |e| (QREFELT $ 56))
                                               (QREFELT $ 57))
                                     (QREFELT $ 50)))))))))))) 

(SDEFUN |UPXS;approximate;$FCoef;12|
        ((|x| $) (|r| |Fraction| (|Integer|)) ($ |Coef|))
        (SPROG ((|term| (|Coef|)) (|e| (|Fraction| (|Integer|))))
               (SEQ
                (LETT |e| (SPADCALL |x| (QREFELT $ 58))
                      . #1=(|UPXS;approximate;$FCoef;12|))
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 59))
                        (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 60))
                       |e| (QREFELT $ 57))
                      . #1#)
                (EXIT
                 (|UPXS;approximateLaurent| (SPADCALL |x| (QREFELT $ 61))
                  |term| (|UPXS;roundDown| (SPADCALL |r| |e| (QREFELT $ 62)) $)
                  $))))) 

(SDEFUN |UPXS;termOutput|
        ((|k| |Fraction| (|Integer|)) (|c| |Coef|) (|vv| |OutputForm|)
         ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND
                 ((SPADCALL |k| (|spadConstant| $ 32) (QREFELT $ 64))
                  (SPADCALL |c| (QREFELT $ 66)))
                 (#1='T
                  (SEQ
                   (LETT |mon|
                         (COND
                          ((SPADCALL |k| (|spadConstant| $ 28) (QREFELT $ 64))
                           |vv|)
                          (#1#
                           (SPADCALL |vv| (SPADCALL |k| (QREFELT $ 67))
                                     (QREFELT $ 68))))
                         |UPXS;termOutput|)
                   (EXIT
                    (COND
                     ((SPADCALL |c| (|spadConstant| $ 25) (QREFELT $ 69))
                      |mon|)
                     ((SPADCALL |c|
                                (SPADCALL (|spadConstant| $ 25) (QREFELT $ 70))
                                (QREFELT $ 69))
                      (SPADCALL |mon| (QREFELT $ 71)))
                     (#1#
                      (SPADCALL (SPADCALL |c| (QREFELT $ 66)) |mon|
                                (QREFELT $ 72))))))))))) 

(PUT '|UPXS;showAll?| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |UPXS;showAll?| (($ |Boolean|)) 'T) 

(SDEFUN |UPXS;termsToOutputForm|
        ((|m| |Fraction| (|Integer|)) (|rat| |Fraction| (|Integer|))
         (|uu| |Stream| |Coef|) (|xxx| |OutputForm|) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|n| NIL)
          (|count| (|NonNegativeInteger|)))
         (SEQ (LETT |l| NIL . #1=(|UPXS;termsToOutputForm|))
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT $ 47))
                 (SPADCALL (|spadConstant| $ 30) (QREFELT $ 66)))
                (#2='T
                 (SEQ (LETT |count| |$streamCount| . #1#)
                      (SEQ (LETT |n| 0 . #1#) G190
                           (COND
                            ((OR (|greater_SI| |n| |count|)
                                 (NULL
                                  (COND ((SPADCALL |uu| (QREFELT $ 47)) 'NIL)
                                        ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT $ 48))
                                        (|spadConstant| $ 30) (QREFELT $ 73))
                              (LETT |l|
                                    (CONS
                                     (|UPXS;termOutput|
                                      (SPADCALL
                                       (SPADCALL |n| |rat| (QREFELT $ 74)) |m|
                                       (QREFELT $ 75))
                                      (SPADCALL |uu| (QREFELT $ 48)) |xxx| $)
                                     |l|)
                                    . #1#)))
                            (EXIT
                             (LETT |uu| (SPADCALL |uu| (QREFELT $ 51)) . #1#)))
                           (LETT |n| (|inc_SI| |n|) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((|UPXS;showAll?| $)
                        (SEQ (LETT |n| (+ |count| 1) . #1#) G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL |uu| (QREFELT $ 76))
                                  (COND
                                   ((SPADCALL |uu|
                                              (SPADCALL |uu| (QREFELT $ 51))
                                              (QREFELT $ 77))
                                    'NIL)
                                   ('T 'T)))
                                 ('T 'NIL)))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((SPADCALL (SPADCALL |uu| (QREFELT $ 48))
                                          (|spadConstant| $ 30) (QREFELT $ 73))
                                (LETT |l|
                                      (CONS
                                       (|UPXS;termOutput|
                                        (SPADCALL
                                         (SPADCALL |n| |rat| (QREFELT $ 74))
                                         |m| (QREFELT $ 75))
                                        (SPADCALL |uu| (QREFELT $ 48)) |xxx| $)
                                       |l|)
                                      . #1#)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT $ 51))
                                     . #1#)))
                             (LETT |n| (+ |n| 1) . #1#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT $ 78)) |l|)
                                  (#2#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT $ 51))
                                                (QREFELT $ 77))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |uu| (QREFELT $ 48))
                                         (|spadConstant| $ 30) (QREFELT $ 69))
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL "O"
                                                (LIST
                                                 (SPADCALL |xxx|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |n|
                                                                       |rat|
                                                                       (QREFELT
                                                                        $ 74))
                                                             |m|
                                                             (QREFELT $ 75))
                                                            (QREFELT $ 67))
                                                           (QREFELT $ 68)))
                                                (QREFELT $ 80))
                                      |l|)))))
                            . #1#)
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (SPADCALL (|spadConstant| $ 30) (QREFELT $ 66)))
                        (#2#
                         (SPADCALL (ELT $ 81) (NREVERSE |l|)
                                   (QREFELT $ 84)))))))))))) 

(SDEFUN |UPXS;coerce;$Of;16| ((|upxs| $) ($ |OutputForm|))
        (SPROG
         ((|xxx| (|OutputForm|)) (|p| (|Stream| |Coef|))
          (|m| (|Fraction| (|Integer|)))
          (|uls| (|UnivariateLaurentSeries| |Coef| |var| |cen|))
          (|count| (|Integer|)) (|rat| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |rat| (|UPXS;getExpon| |upxs| $) . #1=(|UPXS;coerce;$Of;16|))
          (LETT |uls| (SPADCALL |upxs| (QREFELT $ 61)) . #1#)
          (LETT |count| |$streamCount| . #1#)
          (LETT |uls| (SPADCALL |$streamCount| |uls| (QREFELT $ 85)) . #1#)
          (LETT |m|
                (SPADCALL (SPADCALL |uls| (QREFELT $ 53)) |rat| (QREFELT $ 74))
                . #1#)
          (LETT |p| (SPADCALL (SPADCALL |uls| (QREFELT $ 54)) (QREFELT $ 55))
                . #1#)
          (LETT |xxx|
                (COND
                 ((SPADCALL (QREFELT $ 8) (QREFELT $ 24))
                  (SPADCALL (QREFELT $ 7) (QREFELT $ 86)))
                 ('T
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 86))
                             (SPADCALL (QREFELT $ 8) (QREFELT $ 66))
                             (QREFELT $ 87))
                   (QREFELT $ 88))))
                . #1#)
          (EXIT (|UPXS;termsToOutputForm| |m| |rat| |p| |xxx| $))))) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeries;|)) 

(DEFUN |UnivariatePuiseuxSeries| (&REST #1=#:G205)
  (SPROG NIL
         (PROG (#2=#:G206)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePuiseuxSeries|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePuiseuxSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariatePuiseuxSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariatePuiseuxSeries|)))))))))) 

(DEFUN |UnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G196 NIL) (#2=#:G197 NIL) (#3=#:G198 NIL) (#4=#:G199 NIL)
    (#5=#:G200 NIL) (#6=#:G201 NIL) (#7=#:G203 NIL) ($ NIL) (|dv$| NIL)
    (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|UnivariatePuiseuxSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #8#)
    (LETT DV$3 (|devaluate| |#3|) . #8#)
    (LETT |dv$| (LIST '|UnivariatePuiseuxSeries| DV$1 DV$2 DV$3) . #8#)
    (LETT $ (GETREFV 113) . #8#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #8#)
                                        (OR #7#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedFunctionSpace|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PrimitiveFunctionCategory|))
                                          (|HasCategory| |#1|
                                                         '(|TranscendentalFunctionCategory|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|integrate|
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Symbol|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|variables|
                                                                (LIST
                                                                 '(|List|
                                                                   (|Symbol|))
                                                                 (|devaluate|
                                                                  |#1|))))))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #8#)
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #8#)
                                        (OR #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #8#)
                                        (OR #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #6# #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #6# #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|UnivariatePuiseuxSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #5#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #3# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #2# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #1# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9
              (|Record| (|:| |expon| (|Fraction| (|Integer|)))
                        (|:| |lSeries|
                             (|UnivariateLaurentSeries| |#1| |#2| |#3|))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 37
                (CONS (|dispatchFunction| |UPXS;differentiate;$V$;7|) $))))
    (COND
     ((|testBitVector| |pv$| 7)
      (QSETREFV $ 39 (CONS (|dispatchFunction| |UPXS;integrate;$V$;8|) $))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|coerce| (LIST (|devaluate| |#1|) '(|Symbol|))))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |UPXS;approximate;$FCoef;12|)
                         $)))))))
    $))) 

(MAKEPROP '|UnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeriesConstructor| 6 14)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Symbol|)
              |UPXS;variable;$S;2| |UPXS;center;$Coef;3|
              (|UnivariateTaylorSeries| 6 7 8)
              (|UnivariateLaurentSeries| 6 7 8) (0 . |coerce|) (5 . |coerce|)
              |UPXS;coerce;Uts$;4| (|Union| 14 '"failed") (10 . |retractIfCan|)
              (|Union| 13 '"failed") (15 . |retractIfCan|)
              |UPXS;retractIfCan;$U;5| (|Boolean|) (20 . |zero?|) (25 . |One|)
              (29 . |One|) (|Fraction| 40) (33 . |One|) (37 . |monomial|)
              (43 . |Zero|) (47 . |Zero|) (51 . |Zero|) (55 . +) (|Variable| 7)
              |UPXS;coerce;V$;6| (61 . |differentiate|) (66 . |differentiate|)
              (72 . |integrate|) (77 . |integrate|) (|Integer|) (83 . |denom|)
              (88 . |numer|) (93 . |positive?|) (|NonNegativeInteger|) (98 . >)
              (|Stream| 6) (104 . |empty?|) (109 . |frst|) (114 . ^) (120 . *)
              (126 . |rst|) (131 . +) (137 . |degree|) (142 . |taylorRep|)
              (147 . |coefficients|) (152 . |coerce|) (157 . ^)
              (163 . |rationalPower|) (168 . |coerce|) (173 . -)
              (179 . |laurentRep|) (184 . /) (190 . |approximate|) (196 . =)
              (|OutputForm|) (202 . |coerce|) (207 . |coerce|) (212 . ^)
              (218 . =) (224 . -) (229 . -) (234 . *) (240 . ~=) (246 . *)
              (252 . +) (258 . |explicitEntries?|) (263 . |eq?|)
              (269 . |explicitlyEmpty?|) (|List| $) (274 . |prefix|) (280 . +)
              (|Mapping| 65 65 65) (|List| 65) (286 . |reduce|)
              (292 . |removeZeroes|) (298 . |coerce|) (303 . -) (309 . |paren|)
              |UPXS;coerce;$Of;16| (|List| 10) (|List| 44)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Union| 79 '"failed")
              (|Record| (|:| |coef| 79) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 100 '"failed") (|Factored| $)
              (|Record| (|:| |k| 27) (|:| |c| 6)) (|Stream| 103)
              (|PositiveInteger|) (|List| 108) (|List| 27)
              (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(|variable| 314 |retractIfCan| 319 |rationalPower| 329 |monomial|
              334 |laurentRep| 340 |integrate| 345 |differentiate| 356 |coerce|
              367 |center| 387 |approximate| 392 |Zero| 398 |One| 402 + 406)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 6 0 6 0 6 6 0 6 15 6 9 15 6 7 1 2 9 4 3
                                  15 14 15 7 0 14 21 7 0 0 14 20 21 7 7 23 17
                                  25 0 17 27 0 0 0 7 0 0 0 0 0 5 19 14 15 6 6 7
                                  7 7 7 7 7))
            (CONS
             '#(|UnivariatePuiseuxSeriesConstructorCategory&| NIL |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PowerSeriesCategory&| NIL |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL |DivisionRing&|
                |Algebra&| |Algebra&| NIL |Algebra&| NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| |Module&| NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL |Monoid&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |RetractableTo&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesConstructorCategory| 6
                                                               (|UnivariateLaurentSeries|
                                                                6 7 8))
                 (|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 27) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 27 108) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 27)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 27)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 10) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 27)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 27 27) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 27)
                 (|RightModule| 27) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| (|UnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| (|UnivariateLaurentSeries| 6 7 8))
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 65) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 89
                                  '(1 14 0 13 15 1 0 0 14 16 1 0 18 0 19 1 14
                                    20 0 21 1 6 23 0 24 0 6 0 25 0 0 0 26 0 27
                                    0 28 2 0 0 6 27 29 0 6 0 30 0 0 0 31 0 27 0
                                    32 2 0 0 0 0 33 1 0 0 0 36 2 0 0 0 34 37 1
                                    0 0 0 38 2 0 0 0 34 39 1 27 40 0 41 1 27 40
                                    0 42 1 40 23 0 43 2 44 23 0 0 45 1 46 23 0
                                    47 1 46 6 0 48 2 6 0 0 44 49 2 6 0 0 0 50 1
                                    46 0 0 51 2 6 0 0 0 52 1 14 40 0 53 1 14 13
                                    0 54 1 13 46 0 55 1 27 0 40 56 2 6 0 0 27
                                    57 1 0 27 0 58 1 6 0 10 59 2 6 0 0 0 60 1 0
                                    14 0 61 2 27 0 0 0 62 2 0 6 0 27 63 2 27 23
                                    0 0 64 1 6 65 0 66 1 27 65 0 67 2 65 0 0 0
                                    68 2 6 23 0 0 69 1 6 0 0 70 1 65 0 0 71 2
                                    65 0 0 0 72 2 6 23 0 0 73 2 27 0 40 0 74 2
                                    27 0 0 0 75 1 46 23 0 76 2 46 23 0 0 77 1
                                    46 23 0 78 2 65 0 0 79 80 2 65 0 0 0 81 2
                                    83 65 82 0 84 2 14 0 40 0 85 1 10 65 0 86 2
                                    65 0 0 0 87 1 65 0 0 88 1 0 10 0 11 1 0 20
                                    0 22 1 0 18 0 19 1 0 27 0 58 2 0 0 6 27 29
                                    1 0 14 0 61 2 7 0 0 34 39 1 7 0 0 38 1 3 0
                                    0 36 2 0 0 0 34 37 1 0 0 34 35 1 0 0 13 17
                                    1 0 0 14 16 1 0 65 0 89 1 0 6 0 12 2 11 6 0
                                    27 63 0 34 0 31 0 30 0 26 2 0 0 0 0 33)))))
           '|lookupIncomplete|)) 
