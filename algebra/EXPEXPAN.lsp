
(/VERSIONCHECK 2) 

(PUT '|EXPEXPAN;coeff| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 0))) 

(DEFUN |EXPEXPAN;coeff| (|term| $) (QVELT |term| 0)) 

(PUT '|EXPEXPAN;exponent| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 1))) 

(DEFUN |EXPEXPAN;exponent| (|term| $) (QVELT |term| 1)) 

(DEFUN |EXPEXPAN;upxssingIfCan| (|f| $)
  (COND
   ((SPADCALL (SPADCALL |f| (QREFELT $ 17)) (|spadConstant| $ 18)
              (QREFELT $ 20))
    (CONS 0 (SPADCALL |f| (QREFELT $ 21))))
   ('T (CONS 1 "failed")))) 

(DEFUN |EXPEXPAN;retractIfCan;$U;4| (|f| $)
  (PROG (|fff| |ff|)
    (RETURN
     (SEQ
      (LETT |ff| (|EXPEXPAN;upxssingIfCan| |f| $)
            . #1=(|EXPEXPAN;retractIfCan;$U;4|))
      (EXIT
       (COND ((QEQCAR |ff| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |fff| (SPADCALL (QCDR |ff|) (QREFELT $ 23)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |fff| 1) (CONS 1 "failed"))
                          (#2# (CONS 0 (QCDR |fff|))))))))))))) 

(DEFUN |EXPEXPAN;/;2Upswes$;5| (|f| |g| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |g| (QREFELT $ 26)) |EXPEXPAN;/;2Upswes$;5|)
          (EXIT
           (COND ((QEQCAR |rec| 1) (SPADCALL |f| |g| (QREFELT $ 27)))
                 ('T
                  (SPADCALL |f| (SPADCALL (QCDR |rec|) (QREFELT $ 28))
                            (QREFELT $ 29))))))))) 

(DEFUN |EXPEXPAN;/;3$;6| (|f| |g| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL (SPADCALL |g| (QREFELT $ 21)) (QREFELT $ 26))
            |EXPEXPAN;/;3$;6|)
      (EXIT
       (COND ((QEQCAR |rec| 1) (SPADCALL |f| |g| (QREFELT $ 31)))
             ('T
              (SPADCALL
               (SPADCALL (QCDR |rec|) (SPADCALL |g| (QREFELT $ 17))
                         (QREFELT $ 32))
               |f| (QREFELT $ 29))))))))) 

(DEFUN |EXPEXPAN;coerce;Ups$;7| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 35)) (QREFELT $ 28))) 

(DEFUN |EXPEXPAN;seriesQuotientLimit| (|num| |den| $)
  (PROG (#1=#:G169 |sig| |coef| |ord| |series|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |series| (SPADCALL |num| |den| (QREFELT $ 37))
              . #2=(|EXPEXPAN;seriesQuotientLimit|))
        (LETT |ord| (SPADCALL |series| (|spadConstant| $ 38) (QREFELT $ 39))
              . #2#)
        (EXIT
         (COND
          ((SPADCALL |ord| (|spadConstant| $ 41) (QREFELT $ 42))
           (CONS 0 (|spadConstant| $ 44)))
          (#3='T
           (SEQ (LETT |coef| (SPADCALL |series| |ord| (QREFELT $ 45)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT $ 8) (SPADCALL |coef| (QREFELT $ 47))
                             (QREFELT $ 49))
                   (CONS 1 "failed"))
                  ((SPADCALL |ord| (|spadConstant| $ 41) (QREFELT $ 50))
                   (CONS 0 (SPADCALL |coef| (QREFELT $ 51))))
                  (#3#
                   (SEQ (LETT |sig| (SPADCALL |coef| (QREFELT $ 54)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |sig| 1)
                           (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                          ((EQL (QCDR |sig|) 1)
                           (CONS 0 (SPADCALL (QREFELT $ 55))))
                          (#3# (CONS 0 (SPADCALL (QREFELT $ 56))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPEXPAN;seriesQuotientInfinity| (|num| |den| $)
  (PROG (#1=#:G180 |sig| |cc| |denOrd| |numOrd|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |numOrd| (SPADCALL |num| (QREFELT $ 15) (QREFELT $ 39))
              . #2=(|EXPEXPAN;seriesQuotientInfinity|))
        (EXIT
         (COND
          ((SPADCALL |numOrd| (QREFELT $ 15) (QREFELT $ 50)) (CONS 1 "failed"))
          (#3='T
           (SEQ
            (LETT |denOrd| (SPADCALL |den| (QREFELT $ 15) (QREFELT $ 39))
                  . #2#)
            (EXIT
             (COND
              ((SPADCALL |denOrd| (QREFELT $ 15) (QREFELT $ 50))
               (CONS 1 "failed"))
              (#3#
               (SEQ
                (LETT |cc|
                      (SPADCALL (SPADCALL |num| |numOrd| (QREFELT $ 45))
                                (SPADCALL |den| |denOrd| (QREFELT $ 45))
                                (QREFELT $ 57))
                      . #2#)
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT $ 8) (SPADCALL |cc| (QREFELT $ 47))
                             (QREFELT $ 49))
                   (CONS 1 "failed"))
                  (#3#
                   (SEQ (LETT |sig| (SPADCALL |cc| (QREFELT $ 54)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |sig| 1)
                           (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                          ((EQL (QCDR |sig|) 1)
                           (CONS 0 (SPADCALL (QREFELT $ 55))))
                          (#3#
                           (CONS 0 (SPADCALL (QREFELT $ 56))))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPEXPAN;limitPlus;$U;10| (|f| $)
  (PROG (#1=#:G203 |sig| |expCoef| |exponDiff| |denCoef| |numCoef| |denExpon|
         |numExpon| |denType| |denTerm| |denomTerm| |numType| |numTerm|
         |numerTerm| |num| |den|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |f| (QREFELT $ 58)) (CONS 0 (|spadConstant| $ 44)))
             (#2='T
              (SEQ
               (LETT |den| (SPADCALL |f| (QREFELT $ 17))
                     . #3=(|EXPEXPAN;limitPlus;$U;10|))
               (EXIT
                (COND
                 ((SPADCALL |den| (|spadConstant| $ 18) (QREFELT $ 20))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 21)) (QREFELT $ 60)))
                 (#2#
                  (SEQ
                   (LETT |numerTerm|
                         (SPADCALL
                          (LETT |num| (SPADCALL |f| (QREFELT $ 21)) . #3#)
                          (QREFELT $ 65))
                         . #3#)
                   (EXIT
                    (COND ((QEQCAR |numerTerm| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ
                            (LETT |numType|
                                  (QCDR
                                   (LETT |numTerm| (QCDR |numerTerm|) . #3#))
                                  . #3#)
                            (LETT |denomTerm| (SPADCALL |den| (QREFELT $ 65))
                                  . #3#)
                            (EXIT
                             (COND ((QEQCAR |denomTerm| 1) (CONS 1 "failed"))
                                   (#2#
                                    (SEQ
                                     (LETT |denType|
                                           (QCDR
                                            (LETT |denTerm| (QCDR |denomTerm|)
                                                  . #3#))
                                           . #3#)
                                     (LETT |numExpon|
                                           (|EXPEXPAN;exponent|
                                            (QCAR |numTerm|) $)
                                           . #3#)
                                     (LETT |denExpon|
                                           (|EXPEXPAN;exponent|
                                            (QCAR |denTerm|) $)
                                           . #3#)
                                     (LETT |numCoef|
                                           (|EXPEXPAN;coeff| (QCAR |numTerm|)
                                            $)
                                           . #3#)
                                     (LETT |denCoef|
                                           (|EXPEXPAN;coeff| (QCAR |denTerm|)
                                            $)
                                           . #3#)
                                     (EXIT
                                      (COND
                                       ((EQUAL |numType| "zero")
                                        (COND
                                         ((EQUAL |denType| "zero")
                                          (SEQ
                                           (LETT |exponDiff|
                                                 (SPADCALL |numExpon|
                                                           |denExpon|
                                                           (QREFELT $ 67))
                                                 . #3#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |exponDiff|
                                                        (|spadConstant| $ 68)
                                                        (QREFELT $ 69))
                                              (|EXPEXPAN;seriesQuotientLimit|
                                               |numCoef| |denCoef| $))
                                             (#2#
                                              (SEQ
                                               (LETT |expCoef|
                                                     (SPADCALL |exponDiff|
                                                               (SPADCALL
                                                                |exponDiff|
                                                                (QREFELT $ 70))
                                                               (QREFELT $ 71))
                                                     . #3#)
                                               (LETT |sig|
                                                     (SPADCALL |expCoef|
                                                               (QREFELT $ 54))
                                                     . #3#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |sig| 1)
                                                  (PROGN
                                                   (LETT #1# (CONS 1 "failed")
                                                         . #3#)
                                                   (GO #1#)))
                                                 ((EQL (QCDR |sig|) -1)
                                                  (CONS 0
                                                        (|spadConstant| $ 44)))
                                                 (#2#
                                                  (|EXPEXPAN;seriesQuotientInfinity|
                                                   |numCoef| |denCoef|
                                                   $))))))))))
                                         (#2# (CONS 0 (|spadConstant| $ 44)))))
                                       ((EQUAL |numType| "series")
                                        (COND
                                         ((EQUAL |denType| "zero")
                                          (|EXPEXPAN;seriesQuotientInfinity|
                                           |numCoef| |denCoef| $))
                                         ((EQUAL |denType| "series")
                                          (|EXPEXPAN;seriesQuotientLimit|
                                           |numCoef| |denCoef| $))
                                         (#2# (CONS 0 (|spadConstant| $ 44)))))
                                       ((EQUAL |denType| "infinity")
                                        (SEQ
                                         (LETT |exponDiff|
                                               (SPADCALL |numExpon| |denExpon|
                                                         (QREFELT $ 67))
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |exponDiff|
                                                      (|spadConstant| $ 68)
                                                      (QREFELT $ 69))
                                            (|EXPEXPAN;seriesQuotientLimit|
                                             |numCoef| |denCoef| $))
                                           (#2#
                                            (SEQ
                                             (LETT |expCoef|
                                                   (SPADCALL |exponDiff|
                                                             (SPADCALL
                                                              |exponDiff|
                                                              (QREFELT $ 70))
                                                             (QREFELT $ 71))
                                                   . #3#)
                                             (LETT |sig|
                                                   (SPADCALL |expCoef|
                                                             (QREFELT $ 54))
                                                   . #3#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |sig| 1)
                                                (PROGN
                                                 (LETT #1# (CONS 1 "failed")
                                                       . #3#)
                                                 (GO #1#)))
                                               ((EQL (QCDR |sig|) -1)
                                                (CONS 0 (|spadConstant| $ 44)))
                                               (#2#
                                                (|EXPEXPAN;seriesQuotientInfinity|
                                                 |numCoef| |denCoef|
                                                 $))))))))))
                                       (#2#
                                        (|EXPEXPAN;seriesQuotientInfinity|
                                         |numCoef| |denCoef|
                                         $))))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ExponentialExpansion| (&REST #1=#:G235)
  (PROG ()
    (RETURN
     (PROG (#2=#:G236)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ExponentialExpansion|)
                                           '|domainEqualList|)
                . #3=(|ExponentialExpansion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ExponentialExpansion;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ExponentialExpansion|))))))))))) 

(DEFUN |ExponentialExpansion;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| #1=#:G234 $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|ExponentialExpansion|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT DV$3 (|devaluate| |#3|) . #2#)
      (LETT DV$4 (|devaluate| |#4|) . #2#)
      (LETT |dv$| (LIST '|ExponentialExpansion| DV$1 DV$2 DV$3 DV$4) . #2#)
      (LETT $ (GETREFV 114) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|RetractableTo| (|Symbol|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|RealConstant|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|OrderedIntegralDomain|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|OrderedSet|))
                                          (OR
                                           (|HasCategory|
                                            (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                             |#1| |#2| |#3| |#4|)
                                            '(|OrderedIntegralDomain|))
                                           (|HasCategory|
                                            (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                             |#1| |#2| |#3| |#4|)
                                            '(|OrderedSet|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|RetractableTo| (|Integer|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|StepThrough|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           (LIST '|InnerEvalable| '(|Symbol|)
                                                 (LIST
                                                  '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                  (|devaluate| |#1|)
                                                  (|devaluate| |#2|)
                                                  (|devaluate| |#3|)
                                                  (|devaluate| |#4|))))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           (LIST '|Evalable|
                                                 (LIST
                                                  '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                  (|devaluate| |#1|)
                                                  (|devaluate| |#2|)
                                                  (|devaluate| |#3|)
                                                  (|devaluate| |#4|))))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           (LIST '|Eltable|
                                                 (LIST
                                                  '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                  (|devaluate| |#1|)
                                                  (|devaluate| |#2|)
                                                  (|devaluate| |#3|)
                                                  (|devaluate| |#4|))
                                                 (LIST
                                                  '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                  (|devaluate| |#1|)
                                                  (|devaluate| |#2|)
                                                  (|devaluate| |#3|)
                                                  (|devaluate| |#4|))))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|PartialDifferentialRing|
                                             (|Symbol|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|LinearlyExplicitRingOver|
                                             (|Integer|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|))))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|))))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|PatternMatchable| (|Float|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|PatternMatchable| (|Integer|)))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|EuclideanDomain|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                            |#1| |#2| |#3| |#4|)
                                           '(|IntegerNumberSystem|))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                  |#1| |#2| |#3| |#4|)
                                                 '(|Comparable|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory|
                                               (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                |#1| |#2| |#3| |#4|)
                                               '(|OrderedIntegralDomain|))
                                              (|HasCategory|
                                               (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                                |#1| |#2| |#3| |#4|)
                                               '(|OrderedSet|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|ExponentialExpansion|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory|
            (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2| |#3|
                                                                 |#4|)
            '(|PolynomialFactorizationExplicit|))
           (|augmentPredVector| $ 33554432))
      (AND
       (OR
        (AND (|HasCategory| $ '(|CharacteristicNonZero|))
             (|HasCategory|
              (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2|
                                                                   |#3| |#4|)
              '(|PolynomialFactorizationExplicit|)))
        (|HasCategory|
         (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2| |#3|
                                                              |#4|)
         '(|CharacteristicNonZero|)))
       (|augmentPredVector| $ 67108864))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10
                (|Fraction|
                 (|UnivariatePuiseuxSeriesWithExponentialSingularity| |#1| |#2|
                                                                      |#3|
                                                                      |#4|)))
      (QSETREFV $ 15 (SPADCALL 1000 1 (QREFELT $ 14)))
      $)))) 

(MAKEPROP '|ExponentialExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Fraction| 16) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (0 . |One|) (|Integer|)
              (|Fraction| 12) (4 . /) 'ZEROCOUNT
              (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
              (10 . |denom|) (15 . |One|) (|Boolean|) (19 . =) (25 . |numer|)
              (|Union| 34 '"failed") (30 . |retractIfCan|)
              |EXPEXPAN;retractIfCan;$U;4| (|Union| $ '"failed") (35 . |recip|)
              (40 . /) (46 . |coerce|) (51 . *) |EXPEXPAN;/;2Upswes$;5|
              (57 . /) (63 . *) |EXPEXPAN;/;3$;6|
              (|UnivariatePuiseuxSeries| 7 8 9) (69 . |coerce|)
              |EXPEXPAN;coerce;Ups$;7| (74 . /) (80 . |One|) (84 . |order|)
              (90 . |Zero|) (94 . |Zero|) (98 . >) (|OrderedCompletion| 7)
              (104 . |Zero|) (108 . |coefficient|) (|List| 48)
              (114 . |variables|) (|Symbol|) (119 . |member?|) (125 . =)
              (131 . |coerce|) (|Union| 12 '"failed")
              (|ElementaryFunctionSign| 6 7) (136 . |sign|)
              (141 . |plusInfinity|) (145 . |minusInfinity|) (149 . /)
              (155 . |zero?|) (|Union| 43 '"failed") (160 . |limitPlus|)
              (|Record| (|:| |k| 13) (|:| |c| 7))
              (|Record| (|:| |%coef| 34) (|:| |%expon| 66)
                        (|:| |%expTerms| (|List| 61)))
              (|Record| (|:| |%term| 62) (|:| |%type| 112))
              (|Union| 63 '"failed") (165 . |dominantTerm|)
              (|ExponentialOfUnivariatePuiseuxSeries| 7 8 9) (170 . -)
              (176 . |Zero|) (180 . =) (186 . |order|) (191 . |coefficient|)
              |EXPEXPAN;limitPlus;$U;10| (|Union| 83 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| 93) (|Pattern| 12)
              (|NonNegativeInteger|) (|List| 80) (|Equation| 16) (|List| 16)
              (|Record| (|:| |mat| 84) (|:| |vec| (|Vector| 12))) (|Vector| $)
              (|Matrix| 12) (|List| 78) (|PatternMatchResult| 93 $)
              (|PatternMatchResult| 12 $) (|Factored| 89)
              (|SparseUnivariatePolynomial| $) (|Union| 91 '#1#) (|List| 89)
              (|DoubleFloat|) (|Float|) (|Union| 13 '#2="failed")
              (|Union| 48 '#2#) (|Matrix| 16)
              (|Record| (|:| |mat| 96) (|:| |vec| (|Vector| 16)))
              (|Mapping| 16 16) (|Union| 16 '#2#) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 101 '#3="failed") (|Union| 104 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 104) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|SingleInteger|) (|String|) (|OutputForm|))
           '#(~= 197 |zero?| 203 |wholePart| 208 |unitNormal| 213
              |unitCanonical| 218 |unit?| 223 |subtractIfCan| 228
              |squareFreePolynomial| 234 |squareFreePart| 239 |squareFree| 244
              |solveLinearPolynomialEquation| 249 |smaller?| 255 |sizeLess?|
              261 |sign| 267 |sample| 272 |retractIfCan| 276 |retract| 301
              |rem| 326 |reducedSystem| 332 |recip| 354 |random| 359 |quo| 363
              |principalIdeal| 369 |prime?| 374 |positive?| 379 |patternMatch|
              384 |one?| 398 |numerator| 403 |numer| 408 |nextItem| 413
              |negative?| 418 |multiEuclidean| 423 |min| 429 |max| 435 |map|
              441 |limitPlus| 447 |lcmCoef| 452 |lcm| 458 |latex| 469 |inv| 474
              |init| 479 |hash| 483 |gcdPolynomial| 488 |gcd| 494
              |fractionPart| 505 |floor| 510 |factorSquareFreePolynomial| 515
              |factorPolynomial| 520 |factor| 525 |extendedEuclidean| 530
              |exquo| 543 |expressIdealMember| 549 |eval| 555 |euclideanSize|
              595 |elt| 600 |divide| 606 |differentiate| 612 |denominator| 662
              |denom| 667 |convert| 672 |conditionP| 697 |coerce| 702
              |charthRoot| 737 |characteristic| 742 |ceiling| 746 |associates?|
              751 |abs| 757 ^ 762 |Zero| 780 |One| 784 D 788 >= 838 > 844 = 850
              <= 856 < 862 / 868 - 880 + 891 * 897)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3
                                  4 7 15 16 17 0 0 0 0 7 0 0 0 0 0 0 0 7 0 7 0
                                  0 7 0 0 0 0 9 0 0 0 25 11 20 21 0 0 6 13 0 0
                                  0 0 0 0 0 0 0 0 2 5 6 6 8 10 10 12 13 14 18
                                  19))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| NIL |Module&| |Module&|
                NIL |EntireRing&| |Module&| NIL NIL |OrderedRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&| NIL NIL
                NIL NIL NIL |SetCategory&| NIL |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| NIL NIL NIL NIL NIL |BasicType&| NIL
                |RetractableTo&| NIL NIL NIL |PartialOrder&| |RetractableTo&|
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|DifferentialExtension|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Algebra|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Algebra| 13) (|LeftOreRing|) (|Algebra| $$)
                 (|LinearlyExplicitRingOver|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Module|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Module| 13) (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|OrderedRing|) (|PartialDifferentialRing| 48)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 12)
                 (|BiModule|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|BiModule| 13 13) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedAbelianGroup|)
                 (|RightModule|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|LeftModule|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|RightModule| 13) (|LeftModule| 13) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|)
                 (|FullyPatternMatchable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|PatternMatchable| 93)
                 (|PatternMatchable| 12)
                 (|Patternable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|SetCategory|) (|RealConstant|)
                 (|Evalable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|RetractableTo| (|UnivariatePuiseuxSeries| 7 8 9)) (|Type|)
                 (|RetractableTo|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 113) (|RetractableTo| 48)
                 (|ConvertibleTo| 75) (|ConvertibleTo| 92) (|ConvertibleTo| 93)
                 (|PartialOrder|) (|RetractableTo| 13) (|RetractableTo| 12)
                 (|InnerEvalable| 48
                                  (|UnivariatePuiseuxSeriesWithExponentialSingularity|
                                   6 7 8 9))
                 (|InnerEvalable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8
                                                                       9))
                 (|Eltable|
                  (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
                  $$)
                 (|ConvertibleTo| 76) (|ConvertibleTo| 77))
              (|makeByteWordVec2| 113
                                  '(0 7 0 11 2 13 0 12 12 14 1 0 16 0 17 0 16 0
                                    18 2 16 19 0 0 20 1 0 16 0 21 1 16 22 0 23
                                    1 16 25 0 26 2 10 0 16 16 27 1 0 0 16 28 2
                                    0 0 16 0 29 2 10 0 0 0 31 2 16 0 0 0 32 1
                                    16 0 34 35 2 34 0 0 0 37 0 13 0 38 2 34 13
                                    0 13 39 0 7 0 40 0 13 0 41 2 13 19 0 0 42 0
                                    43 0 44 2 34 7 0 13 45 1 7 46 0 47 2 46 19
                                    48 0 49 2 13 19 0 0 50 1 43 0 7 51 1 53 52
                                    7 54 0 43 0 55 0 43 0 56 2 7 0 0 0 57 1 0
                                    19 0 58 1 16 59 0 60 1 16 64 0 65 2 66 0 0
                                    0 67 0 66 0 68 2 66 19 0 0 69 1 66 13 0 70
                                    2 66 7 0 13 71 2 0 19 0 0 1 1 0 19 0 58 1
                                    22 16 0 1 1 0 109 0 1 1 0 0 0 1 1 0 19 0 1
                                    2 0 25 0 0 1 1 1 88 89 1 1 0 0 0 1 1 0 100
                                    0 1 2 1 90 91 89 1 2 24 19 0 0 1 2 0 19 0 0
                                    1 1 7 12 0 1 0 0 0 1 1 10 52 0 1 1 10 94 0
                                    1 1 2 95 0 1 1 0 22 0 24 1 0 99 0 1 1 10 12
                                    0 1 1 10 13 0 1 1 2 48 0 1 1 0 34 0 1 1 0
                                    16 0 1 2 0 0 0 0 1 2 17 82 74 83 1 1 17 84
                                    74 1 1 0 96 74 1 2 0 97 74 83 1 1 0 25 0 1
                                    0 23 0 1 2 0 0 0 0 1 1 0 107 104 1 1 0 19 0
                                    1 1 7 19 0 1 3 20 86 0 76 86 1 3 21 87 0 77
                                    87 1 1 0 19 0 1 1 0 0 0 1 1 0 16 0 21 1 11
                                    25 0 1 1 7 19 0 1 2 0 103 104 0 1 2 8 0 0 0
                                    1 2 8 0 0 0 1 2 0 0 98 0 1 1 0 59 0 72 2 0
                                    108 0 0 1 2 0 0 0 0 1 1 0 0 104 1 1 0 112 0
                                    1 1 0 0 0 1 0 11 0 1 1 0 111 0 1 2 0 89 89
                                    89 1 2 0 0 0 0 1 1 0 0 104 1 1 22 0 0 1 1
                                    23 16 0 1 1 1 88 89 1 1 1 88 89 1 1 0 100 0
                                    1 3 0 102 0 0 0 1 2 0 105 0 0 1 2 0 25 0 0
                                    1 2 0 103 104 0 1 2 13 0 0 79 1 3 13 0 0 16
                                    16 1 2 13 0 0 80 1 3 13 0 0 81 81 1 3 12 0
                                    0 48 16 1 3 12 0 0 46 81 1 1 0 78 0 1 2 14
                                    0 0 16 1 2 0 106 0 0 1 2 16 0 0 78 1 1 16 0
                                    0 1 3 15 0 0 46 85 1 2 15 0 0 46 1 3 15 0 0
                                    48 78 1 2 15 0 0 48 1 2 0 0 0 98 1 3 0 0 0
                                    98 78 1 1 0 0 0 1 1 0 16 0 17 1 5 75 0 1 1
                                    18 76 0 1 1 19 77 0 1 1 6 92 0 1 1 6 93 0 1
                                    1 26 73 74 1 1 2 0 48 1 1 0 0 34 36 1 0 0
                                    16 28 1 0 0 13 1 1 0 0 12 1 1 0 0 0 1 1 0
                                    113 0 1 1 27 25 0 1 0 0 78 1 1 23 16 0 1 2
                                    0 19 0 0 1 1 7 0 0 1 2 0 0 0 12 1 2 0 0 0
                                    78 1 2 0 0 0 110 1 0 0 0 1 0 0 0 1 2 16 0 0
                                    78 1 1 16 0 0 1 3 15 0 0 46 85 1 2 15 0 0
                                    46 1 3 15 0 0 48 78 1 2 15 0 0 48 1 2 0 0 0
                                    98 1 3 0 0 0 98 78 1 2 8 19 0 0 1 2 8 19 0
                                    0 1 2 0 19 0 0 1 2 8 19 0 0 1 2 8 19 0 0 1
                                    2 0 0 16 16 30 2 0 0 0 0 33 2 0 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 16 0 29 2 0 0 0 16
                                    1 2 0 0 0 13 1 2 0 0 13 0 1 2 0 0 0 0 1 2 0
                                    0 12 0 1 2 0 0 78 0 1 2 0 0 110 0 1)))))
           '|lookupComplete|)) 
