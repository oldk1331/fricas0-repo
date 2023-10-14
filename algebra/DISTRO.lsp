
(/VERSIONCHECK 2) 

(PUT '|DISTRO;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |DISTRO;rep| (|x| $) |x|) 

(PUT '|DISTRO;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(DEFUN |DISTRO;per| (|r| $) |r|) 

(DEFUN |DISTRO;Zero;$;3| ($)
  (SPADCALL
   (SPADCALL (SPADCALL (LIST (|spadConstant| $ 8)) (QREFELT $ 11))
             (QREFELT $ 13))
   (QREFELT $ 14))) 

(DEFUN |DISTRO;distributionByMoments;S$;4| (|mm| $)
  (|DISTRO;per|
   (VECTOR |mm| (SPADCALL |mm| (QREFELT $ 17)) (SPADCALL |mm| (QREFELT $ 18))
           (SPADCALL |mm| (QREFELT $ 19)))
   $)) 

(DEFUN |DISTRO;distributionByMoments;S$;5| (|mm| $)
  (SPADCALL (SPADCALL |mm| (QREFELT $ 13)) (QREFELT $ 14))) 

(DEFUN |DISTRO;interlace| (|x| |y| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DISTRO;interlace!0| (VECTOR |y| $ |x|))
               (QREFELT $ 25))))) 

(DEFUN |DISTRO;interlace!0| ($$)
  (PROG (|x| $ |y|)
    (LETT |x| (QREFELT $$ 2) . #1=(|DISTRO;interlace|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x| (QREFELT $ 21))
                (SPADCALL (SPADCALL |y| (QREFELT $ 21))
                          (|DISTRO;interlace| (SPADCALL |x| (QREFELT $ 22))
                           (SPADCALL |y| (QREFELT $ 22)) $)
                          (QREFELT $ 23))
                (QREFELT $ 23)))))) 

(DEFUN |DISTRO;distributionByEvenMoments;S$;7| (|mm| $)
  (SPADCALL
   (SPADCALL
    (|DISTRO;interlace| (SPADCALL (LIST (|spadConstant| $ 8)) (QREFELT $ 11))
     (SPADCALL |mm| (QREFELT $ 26)) $)
    (QREFELT $ 13))
   (QREFELT $ 14))) 

(DEFUN |DISTRO;distributionByEvenMoments;S$;8| (|mm| $)
  (SPADCALL (SPADCALL |mm| (QREFELT $ 13)) (QREFELT $ 27))) 

(DEFUN |DISTRO;distributionByClassicalCumulants;S$;9| (|cc| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (LETT |mm| (SPADCALL |cc| (QREFELT $ 29))
            |DISTRO;distributionByClassicalCumulants;S$;9|)
      (EXIT
       (|DISTRO;per|
        (VECTOR |mm| |cc| (SPADCALL |mm| (QREFELT $ 18))
                (SPADCALL |mm| (QREFELT $ 19)))
        $)))))) 

(DEFUN |DISTRO;distributionByClassicalCumulants;S$;10| (|mm| $)
  (SPADCALL (SPADCALL |mm| (QREFELT $ 13)) (QREFELT $ 30))) 

(DEFUN |DISTRO;distributionByFreeCumulants;S$;11| (|fc| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (LETT |mm| (SPADCALL |fc| (QREFELT $ 32))
            |DISTRO;distributionByFreeCumulants;S$;11|)
      (EXIT
       (|DISTRO;per|
        (VECTOR |mm| (SPADCALL |mm| (QREFELT $ 17)) |fc|
                (SPADCALL |mm| (QREFELT $ 19)))
        $)))))) 

(DEFUN |DISTRO;distributionByFreeCumulants;S$;12| (|mm| $)
  (SPADCALL (SPADCALL |mm| (QREFELT $ 13)) (QREFELT $ 33))) 

(DEFUN |DISTRO;distributionByBooleanCumulants;S$;13| (|bc| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (LETT |mm| (SPADCALL |bc| (QREFELT $ 35))
            |DISTRO;distributionByBooleanCumulants;S$;13|)
      (EXIT
       (|DISTRO;per|
        (VECTOR |mm| (SPADCALL |mm| (QREFELT $ 17))
                (SPADCALL |mm| (QREFELT $ 18)) |bc|)
        $)))))) 

(DEFUN |DISTRO;distributionByBooleanCumulants;S$;14| (|mm| $)
  (SPADCALL (SPADCALL |mm| (QREFELT $ 13)) (QREFELT $ 36))) 

(DEFUN |DISTRO;booleanCumulantFromJacobi;I2SR;15| (|n| |aa| |bb| $)
  (COND ((ZEROP |n|) (|spadConstant| $ 38))
        ((EQL |n| 1) (SPADCALL |aa| 1 (QREFELT $ 40)))
        ('T
         (SPADCALL (SPADCALL |bb| 1 (QREFELT $ 40))
                   (SPADCALL (- |n| 2) (SPADCALL |aa| (QREFELT $ 41))
                             (SPADCALL |bb| (QREFELT $ 41)) (QREFELT $ 42))
                   (QREFELT $ 43))))) 

(DEFUN |DISTRO;distributionByJacobiParameters;2S$;16| (|aa| |bb| $)
  (PROG (|mom| |rior|)
    (RETURN
     (SEQ
      (LETT |rior|
            (SPADCALL (SPADCALL |aa| (QREFELT $ 26))
                      (SPADCALL |bb| (QREFELT $ 26)) (QREFELT $ 46))
            . #1=(|DISTRO;distributionByJacobiParameters;2S$;16|))
      (LETT |mom| (SPADCALL (SPADCALL |rior| (QREFELT $ 47)) (QREFELT $ 22))
            . #1#)
      (EXIT (SPADCALL (SPADCALL |mom| (QREFELT $ 13)) (QREFELT $ 14))))))) 

(DEFUN |DISTRO;distributionByJacobiParameters;2S$;17| (|aa| |bb| $)
  (SPADCALL (SPADCALL |aa| (QREFELT $ 13)) (SPADCALL |bb| (QREFELT $ 13))
            (QREFELT $ 48))) 

(DEFUN |DISTRO;construct;4S$;18| (|mom| |ccum| |fcum| |bcum| $)
  (|DISTRO;per| (VECTOR |mom| |ccum| |fcum| |bcum|) $)) 

(DEFUN |DISTRO;monotoneCumulants;$S;19| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 51)) (QREFELT $ 52))) 

(DEFUN |DISTRO;distributionBySTransform;2FS$;20| (|puiseux| |laurent| |coef| $)
  (PROG (|psi| |psi2| |chi2| |z1z| S2 #1=#:G147 |chi|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |puiseux| (|spadConstant| $ 55) (QREFELT $ 57))
         (SEQ
          (LETT |z1z|
                (SPADCALL (|spadConstant| $ 8)
                          (SPADCALL
                           (LIST (|spadConstant| $ 38)
                                 (SPADCALL (|spadConstant| $ 38)
                                           (QREFELT $ 58)))
                           (QREFELT $ 11))
                          (QREFELT $ 23))
                . #2=(|DISTRO;distributionBySTransform;2FS$;20|))
          (LETT |chi|
                (SPADCALL (SPADCALL |coef| (QREFELT $ 26)) |z1z|
                          (QREFELT $ 60))
                . #2#)
          (LETT |psi| (SPADCALL |chi| (QREFELT $ 61)) . #2#)
          (EXIT
           (PROGN
            (LETT #1#
                  (SPADCALL
                   (SPADCALL (SPADCALL |psi| (QREFELT $ 22)) (QREFELT $ 13))
                   (QREFELT $ 14))
                  . #2#)
            (GO #1#)))))
        ((SPADCALL |puiseux| (SPADCALL 1 2 (QREFELT $ 62)) (QREFELT $ 57))
         (COND
          ((SPADCALL |laurent| (SPADCALL (|spadConstant| $ 55) (QREFELT $ 63))
                     (QREFELT $ 57))
           (SEQ (LETT S2 |coef| . #2#)
                (LETT |chi2|
                      (SPADCALL (|spadConstant| $ 8)
                                (SPADCALL S2 (QREFELT $ 26)) (QREFELT $ 23))
                      . #2#)
                (LETT |z1z|
                      (SPADCALL
                       (LIST (|spadConstant| $ 38) (|spadConstant| $ 8)
                             (SPADCALL (|spadConstant| $ 38) (QREFELT $ 58))
                             (|spadConstant| $ 8))
                       (QREFELT $ 11))
                      . #2#)
                (LETT |chi2| (SPADCALL |chi2| |z1z| (QREFELT $ 60)) . #2#)
                (LETT |psi2| (SPADCALL |chi2| (QREFELT $ 61)) . #2#)
                (LETT |psi|
                      (SPADCALL (SPADCALL 2 (QREFELT $ 64)) |psi2|
                                (QREFELT $ 65))
                      . #2#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |psi| (QREFELT $ 22)) (QREFELT $ 13))
                  (QREFELT $ 14)))))
          (#3='T (|error| "Not an S-transform"))))
        (#3# (|error| "Not an S-transform"))))
      #1# (EXIT #1#))))) 

(DEFUN |DISTRO;distributionBySTransform;R$;21| (S $)
  (SPADCALL (QVELT S 0) (QVELT S 1) (QVELT S 2) (QREFELT $ 66))) 

(DEFUN |DISTRO;freeMultiplicativeConvolution;3$;22| (|x| |y| $)
  (PROG (|Sxyc| #1=#:G161 |Syc| |Sxc| |Sy| |Sx|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |Sx| (SPADCALL (SPADCALL |x| (QREFELT $ 51)) (QREFELT $ 69))
              . #2=(|DISTRO;freeMultiplicativeConvolution;3$;22|))
        (LETT |Sy| (SPADCALL (SPADCALL |y| (QREFELT $ 51)) (QREFELT $ 69))
              . #2#)
        (COND
         ((SPADCALL (QVELT |Sx| 0) (SPADCALL 1 2 (QREFELT $ 62))
                    (QREFELT $ 57))
          (COND
           ((SPADCALL (QVELT |Sy| 0) (SPADCALL 1 2 (QREFELT $ 62))
                      (QREFELT $ 57))
            (EXIT (SPADCALL (QREFELT $ 15)))))))
        (LETT |Sxc| (SPADCALL (QVELT |Sx| 2) (QREFELT $ 26)) . #2#)
        (LETT |Syc| (SPADCALL (QVELT |Sy| 2) (QREFELT $ 26)) . #2#)
        (COND
         ((SPADCALL (QVELT |Sx| 0) (|spadConstant| $ 55) (QREFELT $ 57))
          (COND
           ((SPADCALL (QVELT |Sx| 0) (|spadConstant| $ 55) (QREFELT $ 57))
            (SEQ (LETT |Sxyc| (SPADCALL |Sxc| |Syc| (QREFELT $ 60)) . #2#)
                 (EXIT
                  (PROGN
                   (LETT #1#
                         (SPADCALL (|spadConstant| $ 55) (|spadConstant| $ 70)
                                   (SPADCALL |Sxyc| (QREFELT $ 13))
                                   (QREFELT $ 66))
                         . #2#)
                   (GO #1#)))))
           ((SPADCALL (QVELT |Sx| 0) (SPADCALL 1 2 (QREFELT $ 62))
                      (QREFELT $ 57))
            (LETT |Sxyc|
                  (SPADCALL |Sxc| (SPADCALL 2 0 |Syc| (QREFELT $ 71))
                            (QREFELT $ 60))
                  . #2#))
           (#3='T
            (LETT |Sxyc|
                  (SPADCALL (SPADCALL 2 0 |Sxc| (QREFELT $ 71)) |Syc|
                            (QREFELT $ 60))
                  . #2#))))
         ((SPADCALL (QVELT |Sx| 0) (SPADCALL 1 2 (QREFELT $ 62))
                    (QREFELT $ 57))
          (LETT |Sxyc|
                (SPADCALL |Sxc| (SPADCALL 2 0 |Syc| (QREFELT $ 71))
                          (QREFELT $ 60))
                . #2#))
         (#3#
          (LETT |Sxyc|
                (SPADCALL (SPADCALL 2 0 |Sxc| (QREFELT $ 71)) |Syc|
                          (QREFELT $ 60))
                . #2#)))
        (EXIT
         (SPADCALL (SPADCALL 1 2 (QREFELT $ 62))
                   (SPADCALL (|spadConstant| $ 55) (QREFELT $ 63))
                   (SPADCALL |Sxyc| (QREFELT $ 13)) (QREFELT $ 66)))))
      #1# (EXIT #1#))))) 

(DEFUN |DISTRO;coerce;$Of;23| (|x| $)
  (SPADCALL (QVELT (|DISTRO;rep| |x| $) 0) (QREFELT $ 74))) 

(DEFUN |DISTRO;moment;$NniR;24| (|x| |n| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (|spadConstant| $ 38))
            ('T
             (SEQ
              (LETT |mm| (QVELT (|DISTRO;rep| |x| $) 0)
                    |DISTRO;moment;$NniR;24|)
              (EXIT (SPADCALL |mm| |n| (QREFELT $ 40)))))))))) 

(DEFUN |DISTRO;classicalCumulant;$PiR;25| (|x| |n| $)
  (PROG (|cc|)
    (RETURN
     (SEQ
      (LETT |cc| (QVELT (|DISTRO;rep| |x| $) 1)
            |DISTRO;classicalCumulant;$PiR;25|)
      (EXIT (SPADCALL |cc| |n| (QREFELT $ 40))))))) 

(DEFUN |DISTRO;freeCumulant;$PiR;26| (|x| |n| $)
  (PROG (|fc|)
    (RETURN
     (SEQ
      (LETT |fc| (QVELT (|DISTRO;rep| |x| $) 2) |DISTRO;freeCumulant;$PiR;26|)
      (EXIT (SPADCALL |fc| |n| (QREFELT $ 40))))))) 

(DEFUN |DISTRO;booleanCumulant;$PiR;27| (|x| |n| $)
  (PROG (|fc|)
    (RETURN
     (SEQ
      (LETT |fc| (QVELT (|DISTRO;rep| |x| $) 3)
            |DISTRO;booleanCumulant;$PiR;27|)
      (EXIT (SPADCALL |fc| |n| (QREFELT $ 40))))))) 

(DEFUN |DISTRO;moments;$S;28| (|x| $) (QVELT (|DISTRO;rep| |x| $) 0)) 

(DEFUN |DISTRO;classicalCumulants;$S;29| (|x| $) (QVELT (|DISTRO;rep| |x| $) 1)) 

(DEFUN |DISTRO;freeCumulants;$S;30| (|x| $) (QVELT (|DISTRO;rep| |x| $) 2)) 

(DEFUN |DISTRO;booleanCumulants;$S;31| (|x| $) (QVELT (|DISTRO;rep| |x| $) 3)) 

(DEFUN |DISTRO;hankelDeterminants1| (|x| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DISTRO;hankelDeterminants1!0| (VECTOR |n| $ |x|))
               (QREFELT $ 25))))) 

(DEFUN |DISTRO;hankelDeterminants1!0| ($$)
  (PROG (|x| $ |n|)
    (LETT |x| (QREFELT $$ 2) . #1=(|DISTRO;hankelDeterminants1|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |n| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 51)) |n| (QREFELT $ 85))
                (|DISTRO;hankelDeterminants1| |x|
                 (SPADCALL |n| (|spadConstant| $ 86) (QREFELT $ 87)) $)
                (QREFELT $ 23)))))) 

(DEFUN |DISTRO;hankelDeterminants;$S;33| (|x| $)
  (|DISTRO;hankelDeterminants1| |x| 1 $)) 

(DEFUN |DISTRO;jacobiParameters;$R;34| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 51)) (QREFELT $ 90))) 

(DEFUN |DISTRO;orthogonalPolynomials;$S;35| (|x| $)
  (PROG (|jac|)
    (RETURN
     (SEQ
      (LETT |jac| (SPADCALL |x| (QREFELT $ 91))
            |DISTRO;orthogonalPolynomials;$S;35|)
      (EXIT (SPADCALL (QCAR |jac|) (QCDR |jac|) (QREFELT $ 93))))))) 

(DEFUN |DISTRO;jacobiParameters;$R;36| (|x| $)
  (PROG (|mm| |mm1|)
    (RETURN
     (SEQ
      (LETT |mm1| (SPADCALL (SPADCALL |x| (QREFELT $ 51)) (QREFELT $ 26))
            . #1=(|DISTRO;jacobiParameters;$R;36|))
      (LETT |mm| (SPADCALL (ELT $ 96) |mm1| (QREFELT $ 100)) . #1#)
      (EXIT (SPADCALL (SPADCALL |mm| (QREFELT $ 102)) (QREFELT $ 105))))))) 

(DEFUN |DISTRO;orthogonalPolynomials;$S;37| (|x| $)
  (PROG (|jac|)
    (RETURN
     (SEQ
      (LETT |jac| (SPADCALL |x| (QREFELT $ 106))
            |DISTRO;orthogonalPolynomials;$S;37|)
      (EXIT (SPADCALL (QCAR |jac|) (QCDR |jac|) (QREFELT $ 108))))))) 

(DEFUN |DISTRO;classicalConvolution;3$;38| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 82)) (SPADCALL |y| (QREFELT $ 82))
             (QREFELT $ 110))
   (QREFELT $ 30))) 

(DEFUN |DISTRO;freeConvolution;3$;39| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 83)) (SPADCALL |y| (QREFELT $ 83))
             (QREFELT $ 110))
   (QREFELT $ 33))) 

(DEFUN |DISTRO;booleanConvolution;3$;40| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 84)) (SPADCALL |y| (QREFELT $ 84))
             (QREFELT $ 110))
   (QREFELT $ 36))) 

(DEFUN |DISTRO;monotoneConvolution;3$;41| (|x| |y| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL
      (SPADCALL
       (SPADCALL (|spadConstant| $ 8)
                 (SPADCALL (|spadConstant| $ 38)
                           (SPADCALL (SPADCALL |x| (QREFELT $ 51))
                                     (QREFELT $ 26))
                           (QREFELT $ 23))
                 (QREFELT $ 23))
       (SPADCALL (|spadConstant| $ 8)
                 (SPADCALL (|spadConstant| $ 38)
                           (SPADCALL (SPADCALL |y| (QREFELT $ 51))
                                     (QREFELT $ 26))
                           (QREFELT $ 23))
                 (QREFELT $ 23))
       (QREFELT $ 114))
      (QREFELT $ 22))
     (QREFELT $ 22))
    (QREFELT $ 13))
   (QREFELT $ 14))) 

(DEFUN |DISTRO;nth| (|s| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|DISTRO;nth!0| (VECTOR $ |n| |s|)) (QREFELT $ 25)))))) 

(DEFUN |DISTRO;nth!0| ($$)
  (PROG (|s| |n| $)
    (LETT |s| (QREFELT $$ 2) . #1=(|DISTRO;nth|))
    (LETT |n| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|k| |res|)
        (RETURN
         (SEQ (LETT |res| |s| NIL)
              (SEQ (LETT |k| 2 NIL) G190
                   (COND ((|greater_SI| |k| |n|) (GO G191)))
                   (SEQ
                    (EXIT (LETT |res| (SPADCALL |res| (QREFELT $ 22)) NIL)))
                   (LETT |k| (|inc_SI| |k|) NIL) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |res| (QREFELT $ 21))
                         (|DISTRO;nth| (SPADCALL |res| (QREFELT $ 22)) |n| $)
                         (QREFELT $ 23)))))))))) 

(DEFUN |DISTRO;^;$Pi$;43| (|x| |n| $)
  (PROG (|momn|)
    (RETURN
     (SEQ
      (LETT |momn|
            (|DISTRO;nth|
             (SPADCALL (SPADCALL |x| (QREFELT $ 51)) (QREFELT $ 26)) |n| $)
            |DISTRO;^;$Pi$;43|)
      (EXIT (SPADCALL (SPADCALL |momn| (QREFELT $ 13)) (QREFELT $ 14))))))) 

(DECLAIM (NOTINLINE |Distribution;|)) 

(DEFUN |Distribution| (#1=#:G217)
  (PROG ()
    (RETURN
     (PROG (#2=#:G218)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Distribution|)
                                           '|domainEqualList|)
                . #3=(|Distribution|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Distribution;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|Distribution|))))))))))) 

(DEFUN |Distribution;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Distribution|))
      (LETT |dv$| (LIST '|Distribution| DV$1) . #1#)
      (LETT $ (GETREFV 120) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#1| '(|Field|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                (|not|
                                                 (|HasCategory| |#1|
                                                                '(|Field|))))
                                               (|HasCategory| |#1|
                                                              '(|Algebra|
                                                                (|Fraction|
                                                                 (|Integer|))))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|Distribution| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |moments| (|Sequence| |#1|))
                          (|:| |ccumulants| (|Sequence| |#1|))
                          (|:| |fcumulants| (|Sequence| |#1|))
                          (|:| |bcumulants| (|Sequence| |#1|))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 53
                   (CONS (|dispatchFunction| |DISTRO;monotoneCumulants;$S;19|)
                         $))
         (QSETREFV $ 66
                   (CONS
                    (|dispatchFunction|
                     |DISTRO;distributionBySTransform;2FS$;20|)
                    $))
         (QSETREFV $ 68
                   (CONS
                    (|dispatchFunction|
                     |DISTRO;distributionBySTransform;R$;21|)
                    $))
         (QSETREFV $ 72
                   (CONS
                    (|dispatchFunction|
                     |DISTRO;freeMultiplicativeConvolution;3$;22|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 91
                   (CONS (|dispatchFunction| |DISTRO;jacobiParameters;$R;34|)
                         $))
         (QSETREFV $ 94
                   (CONS
                    (|dispatchFunction| |DISTRO;orthogonalPolynomials;$S;35|)
                    $))))
       ((|HasCategory| |#1| '(|IntegralDomain|))
        (PROGN
         (QSETREFV $ 106
                   (CONS (|dispatchFunction| |DISTRO;jacobiParameters;$R;36|)
                         $))
         (QSETREFV $ 109
                   (CONS
                    (|dispatchFunction| |DISTRO;orthogonalPolynomials;$S;37|)
                    $)))))
      $)))) 

(MAKEPROP '|Distribution| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (0 . |Zero|)
              (|List| 6) (|Stream| 6) (4 . |repeating|) (|Sequence| 6)
              (9 . |sequence|) |DISTRO;distributionByMoments;S$;4|
              |DISTRO;Zero;$;3| (|MomentPackage| 6) (14 . |moment2cumulant|)
              (19 . |moment2freecumulant|) (24 . |moment2booleancumulant|)
              |DISTRO;distributionByMoments;S$;5| (29 . |first|) (34 . |rest|)
              (39 . |cons|) (|Mapping| $) (45 . |delay|) (50 . |stream|)
              |DISTRO;distributionByEvenMoments;S$;7|
              |DISTRO;distributionByEvenMoments;S$;8| (55 . |cumulant2moment|)
              |DISTRO;distributionByClassicalCumulants;S$;9|
              |DISTRO;distributionByClassicalCumulants;S$;10|
              (60 . |freecumulant2moment|)
              |DISTRO;distributionByFreeCumulants;S$;11|
              |DISTRO;distributionByFreeCumulants;S$;12|
              (65 . |booleancumulant2moment|)
              |DISTRO;distributionByBooleanCumulants;S$;13|
              |DISTRO;distributionByBooleanCumulants;S$;14| (70 . |One|)
              (|Integer|) (74 . |elt|) (80 . |rest|)
              |DISTRO;booleanCumulantFromJacobi;I2SR;15| (85 . *) (|Stream| 9)
              (|PathArrayPackage| 6) (91 . |jacobiPathArray|) (97 . |bottom|)
              |DISTRO;distributionByJacobiParameters;2S$;16|
              |DISTRO;distributionByJacobiParameters;2S$;17|
              |DISTRO;construct;4S$;18| |DISTRO;moments;$S;28|
              (102 . |moment2monotonecumulant|) (107 . |monotoneCumulants|)
              (|Fraction| 39) (112 . |One|) (|Boolean|) (116 . =) (122 . -)
              (|StreamTaylorSeriesOperations| 6) (127 . *) (133 . |revert|)
              (138 . /) (144 . -) (149 . |coerce|) (154 . |powern|)
              (160 . |distributionBySTransform|)
              (|Record| (|:| |puiseux| 54) (|:| |laurent| 54) (|:| |coef| 12))
              (167 . |distributionBySTransform|) (172 . |moment2Stransform|)
              (177 . |Zero|) (181 . |invmultisect|)
              (188 . |freeMultiplicativeConvolution|) (|OutputForm|)
              (194 . |coerce|) |DISTRO;coerce;$Of;23| (|NonNegativeInteger|)
              |DISTRO;moment;$NniR;24| (|PositiveInteger|)
              |DISTRO;classicalCumulant;$PiR;25| |DISTRO;freeCumulant;$PiR;26|
              |DISTRO;booleanCumulant;$PiR;27|
              |DISTRO;classicalCumulants;$S;29| |DISTRO;freeCumulants;$S;30|
              |DISTRO;booleanCumulants;$S;31| (199 . |hankelDeterminant|)
              (205 . |One|) (209 . +) |DISTRO;hankelDeterminants;$S;33|
              (|Record| (|:| |an| 10) (|:| |bn| 10)) (215 . |moment2jacobi|)
              (220 . |jacobiParameters|)
              (|Stream| (|SparseUnivariatePolynomial| 6)) (225 . |jacobi2poly|)
              (231 . |orthogonalPolynomials|) (|Fraction| 6) (236 . |coerce|)
              (|Stream| 95) (|Mapping| 95 6) (|StreamFunctions2| 6 95)
              (241 . |map|) (|Sequence| 95) (247 . |sequence|)
              (|Record| (|:| |an| 97) (|:| |bn| 97)) (|MomentPackage| 95)
              (252 . |moment2jacobi|) (257 . |jacobiParameters|)
              (|Stream| (|SparseUnivariatePolynomial| 95))
              (262 . |jacobi2poly|) (268 . |orthogonalPolynomials|) (273 . +)
              |DISTRO;classicalConvolution;3$;38|
              |DISTRO;freeConvolution;3$;39| |DISTRO;booleanConvolution;3$;40|
              (279 . |compose|) |DISTRO;monotoneConvolution;3$;41|
              |DISTRO;^;$Pi$;43| (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 285 |orthogonalPolynomials| 291 |monotoneCumulants| 301
              |monotoneConvolution| 306 |moments| 312 |moment| 317 |latex| 323
              |jacobiParameters| 328 |hashUpdate!| 338 |hash| 344
              |hankelDeterminants| 349 |freeMultiplicativeConvolution| 354
              |freeCumulants| 360 |freeCumulant| 365 |freeConvolution| 371
              |distributionBySTransform| 377 |distributionByMoments| 389
              |distributionByJacobiParameters| 399
              |distributionByFreeCumulants| 411 |distributionByEvenMoments| 421
              |distributionByClassicalCumulants| 431
              |distributionByBooleanCumulants| 441 |construct| 451 |coerce| 459
              |classicalCumulants| 464 |classicalCumulant| 469
              |classicalConvolution| 475 |booleanCumulants| 481
              |booleanCumulantFromJacobi| 486 |booleanCumulant| 493
              |booleanConvolution| 499 ^ 505 |Zero| 511 = 515)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|DistributionCategory| 6) (|SetCategory|)
                           (|BasicType|) (|CoercibleTo| 73))
                        (|makeByteWordVec2| 119
                                            '(0 6 0 8 1 10 0 9 11 1 12 0 10 13
                                              1 16 12 12 17 1 16 12 12 18 1 16
                                              12 12 19 1 10 6 0 21 1 10 0 0 22
                                              2 10 0 6 0 23 1 10 0 24 25 1 12
                                              10 0 26 1 16 12 12 29 1 16 12 12
                                              32 1 16 12 12 35 0 6 0 38 2 12 6
                                              0 39 40 1 12 0 0 41 2 6 0 0 0 43
                                              2 45 44 10 10 46 1 45 10 44 47 1
                                              16 12 12 52 1 0 12 0 53 0 54 0 55
                                              2 54 56 0 0 57 1 6 0 0 58 2 59 10
                                              10 10 60 1 59 10 10 61 2 54 0 39
                                              39 62 1 54 0 0 63 1 54 0 39 64 2
                                              59 10 54 10 65 3 0 0 54 54 12 66
                                              1 0 0 67 68 1 16 67 12 69 0 54 0
                                              70 3 59 10 39 39 10 71 2 0 0 0 0
                                              72 1 12 73 0 74 2 16 6 12 76 85 0
                                              76 0 86 2 76 0 0 0 87 1 16 89 12
                                              90 1 0 89 0 91 2 16 92 10 10 93 1
                                              0 92 0 94 1 95 0 6 96 2 99 97 98
                                              10 100 1 101 0 97 102 1 104 103
                                              101 105 1 0 103 0 106 2 104 107
                                              97 97 108 1 0 107 0 109 2 12 0 0
                                              0 110 2 59 10 10 10 114 2 0 56 0
                                              0 1 1 2 107 0 109 1 1 92 0 94 1 3
                                              12 0 53 2 0 0 0 0 115 1 0 12 0 51
                                              2 0 6 0 76 77 1 0 117 0 1 1 2 103
                                              0 106 1 1 89 0 91 2 0 119 119 0 1
                                              1 0 118 0 1 1 0 10 0 88 2 3 0 0 0
                                              72 1 0 12 0 83 2 0 6 0 78 80 2 0
                                              0 0 0 112 3 3 0 54 54 12 66 1 3 0
                                              67 68 1 0 0 12 14 1 0 0 10 20 2 0
                                              0 10 10 49 2 0 0 12 12 48 1 0 0
                                              12 33 1 0 0 10 34 1 0 0 10 28 1 0
                                              0 12 27 1 0 0 10 31 1 0 0 12 30 1
                                              0 0 12 36 1 0 0 10 37 4 0 0 12 12
                                              12 12 50 1 0 73 0 75 1 0 12 0 82
                                              2 0 6 0 78 79 2 0 0 0 0 111 1 0
                                              12 0 84 3 0 6 39 12 12 42 2 0 6 0
                                              78 81 2 0 0 0 0 113 2 0 0 0 78
                                              116 0 0 0 15 2 0 56 0 0 1)))))
           '|lookupComplete|)) 
