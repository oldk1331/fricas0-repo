
(/VERSIONCHECK 2) 

(PUT '|RADIX;characteristic;Nni;1| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |RADIX;characteristic;Nni;1| ($) 0) 

(DEFUN |RADIX;differentiate;2$;2| (|a| $) (|spadConstant| $ 10)) 

(PUT '|RADIX;Zero;$;3| '|SPADreplace| '(XLAM NIL (VECTOR 1 NIL NIL NIL))) 

(DEFUN |RADIX;Zero;$;3| ($) (VECTOR 1 NIL NIL NIL)) 

(DEFUN |RADIX;One;$;4| ($) (VECTOR 1 (LIST 1) NIL NIL)) 

(DEFUN |RADIX;-;2$;5| (|a| $)
  (COND
   ((SPADCALL |a| (|spadConstant| $ 10) (QREFELT $ 14)) (|spadConstant| $ 10))
   ('T (VECTOR (- (QVELT |a| 0)) (QVELT |a| 1) (QVELT |a| 2) (QVELT |a| 3))))) 

(DEFUN |RADIX;+;3$;6| (|a| |b| $)
  (SPADCALL
   (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (SPADCALL |b| (QREFELT $ 17))
             (QREFELT $ 18))
   (QREFELT $ 19))) 

(DEFUN |RADIX;-;3$;7| (|a| |b| $)
  (SPADCALL
   (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (SPADCALL |b| (QREFELT $ 17))
             (QREFELT $ 21))
   (QREFELT $ 19))) 

(DEFUN |RADIX;*;I2$;8| (|n| |a| $)
  (SPADCALL (SPADCALL |n| (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 24))
            (QREFELT $ 19))) 

(DEFUN |RADIX;*;3$;9| (|a| |b| $)
  (SPADCALL
   (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (SPADCALL |b| (QREFELT $ 17))
             (QREFELT $ 26))
   (QREFELT $ 19))) 

(DEFUN |RADIX;/;3$;10| (|a| |b| $)
  (SPADCALL
   (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (SPADCALL |b| (QREFELT $ 17))
             (QREFELT $ 28))
   (QREFELT $ 19))) 

(DEFUN |RADIX;/;2I$;11| (|i| |j| $)
  (SPADCALL (SPADCALL |i| |j| (QREFELT $ 30)) (QREFELT $ 19))) 

(DEFUN |RADIX;<;2$B;12| (|a| |b| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (SPADCALL |b| (QREFELT $ 17))
            (QREFELT $ 32))) 

(DEFUN |RADIX;=;2$B;13| (|a| |b| $)
  (COND
   ((EQL (QVELT |a| 0) (QVELT |b| 0))
    (COND
     ((SPADCALL (QVELT |a| 1) (QVELT |b| 1) (QREFELT $ 35))
      (COND
       ((SPADCALL (QVELT |a| 2) (QVELT |b| 2) (QREFELT $ 35))
        (SPADCALL (QVELT |a| 3) (QVELT |b| 3) (QREFELT $ 35)))
       (#1='T 'NIL)))
     (#1# 'NIL)))
   (#1# 'NIL))) 

(DEFUN |RADIX;numer;$I;14| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 36))) 

(DEFUN |RADIX;denom;$I;15| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 38))) 

(DEFUN |RADIX;coerce;$F;16| (|a| $)
  (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 41))
            (SPADCALL |a| (QREFELT $ 42)) (QREFELT $ 18))) 

(DEFUN |RADIX;coerce;I$;17| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 41)) (QREFELT $ 19))) 

(DEFUN |RADIX;coerce;F$;18| (|q| $)
  (PROG (|cycle| |fractn| |whole| |qr| |s|)
    (RETURN
     (SEQ (LETT |s| 1 . #1=(|RADIX;coerce;F$;18|))
          (COND
           ((SPADCALL |q| (|spadConstant| $ 44) (QREFELT $ 32))
            (SEQ (LETT |s| -1 . #1#)
                 (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 45)) . #1#)))))
          (LETT |qr|
                (DIVIDE2 (SPADCALL |q| (QREFELT $ 36))
                         (SPADCALL |q| (QREFELT $ 38)))
                . #1#)
          (LETT |whole| (|RADIX;radixInt| (QCAR |qr|) (QREFELT $ 6) $) . #1#)
          (LETT |fractn|
                (|RADIX;radixFrac| (QCDR |qr|) (SPADCALL |q| (QREFELT $ 38))
                 (QREFELT $ 6) $)
                . #1#)
          (LETT |cycle|
                (COND ((SPADCALL (QCDR |fractn|) (LIST 0) (QREFELT $ 35)) NIL)
                      ('T (QCDR |fractn|)))
                . #1#)
          (EXIT (VECTOR |s| |whole| (QCAR |fractn|) |cycle|)))))) 

(DEFUN |RADIX;retractIfCan;$U;19| (|a| $)
  (CONS 0 (SPADCALL |a| (QREFELT $ 17)))) 

(DEFUN |RADIX;retractIfCan;$U;20| (|a| $)
  (SEQ
   (COND
    ((NULL (QVELT |a| 2))
     (COND
      ((NULL (QVELT |a| 3)) (EXIT (CONS 0 (SPADCALL |a| (QREFELT $ 40))))))))
   (EXIT (CONS 1 "failed")))) 

(DEFUN |RADIX;ceiling;$I;21| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 50))) 

(DEFUN |RADIX;floor;$I;22| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 52))) 

(DEFUN |RADIX;wholePart;$I;23| (|a| $)
  (PROG (|n0| #1=#:G206 |r|)
    (RETURN
     (SEQ (LETT |n0| 0 . #2=(|RADIX;wholePart;$I;23|))
          (SEQ (LETT |r| NIL . #2#) (LETT #1# (QVELT |a| 1) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |n0| (+ (* (QREFELT $ 6) |n0|) |r|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (* (QVELT |a| 0) |n0|)))))) 

(DEFUN |RADIX;fractionPart;$F;24| (|a| $)
  (PROG (|d| |n| |n1| #1=#:G213 |r| |n0| #2=#:G212)
    (RETURN
     (SEQ (LETT |n0| 0 . #3=(|RADIX;fractionPart;$F;24|))
          (SEQ (LETT |r| NIL . #3#) (LETT #2# (QVELT |a| 2) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |n0| (+ (* (QREFELT $ 6) |n0|) |r|) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL (QVELT |a| 3))
             (SPADCALL (* (QVELT |a| 0) |n0|)
                       (EXPT (QREFELT $ 6) (LENGTH (QVELT |a| 2)))
                       (QREFELT $ 30)))
            ('T
             (SEQ (LETT |n1| |n0| . #3#)
                  (SEQ (LETT |r| NIL . #3#) (LETT #1# (QVELT |a| 3) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |n1| (+ (* (QREFELT $ 6) |n1|) |r|) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                  (LETT |n| (- |n1| |n0|) . #3#)
                  (LETT |d|
                        (* (- (EXPT (QREFELT $ 6) (LENGTH (QVELT |a| 3))) 1)
                           (EXPT (QREFELT $ 6) (LENGTH (QVELT |a| 2))))
                        . #3#)
                  (EXIT
                   (SPADCALL (* (QVELT |a| 0) |n|) |d| (QREFELT $ 30))))))))))) 

(PUT '|RADIX;wholeRagits;$L;25| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 1))) 

(DEFUN |RADIX;wholeRagits;$L;25| (|a| $) (QVELT |a| 1)) 

(DEFUN |RADIX;fractRagits;$S;26| (|a| $)
  (SPADCALL (SPADCALL (QVELT |a| 2) (QREFELT $ 56))
            (SPADCALL (QVELT |a| 3) (QREFELT $ 57)) (QREFELT $ 58))) 

(PUT '|RADIX;prefixRagits;$L;27| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 2))) 

(DEFUN |RADIX;prefixRagits;$L;27| (|a| $) (QVELT |a| 2)) 

(PUT '|RADIX;cycleRagits;$L;28| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 3))) 

(DEFUN |RADIX;cycleRagits;$L;28| (|a| $) (QVELT |a| 3)) 

(DEFUN |RADIX;wholeRadix;L$;29| (|li| $)
  (SEQ (|RADIX;checkRagits| |li| $) (EXIT (VECTOR 1 |li| NIL NIL)))) 

(DEFUN |RADIX;fractRadix;2L$;30| (|lpfx| |lcyc| $)
  (SEQ (|RADIX;checkRagits| |lpfx| $) (|RADIX;checkRagits| |lcyc| $)
       (EXIT (VECTOR 1 NIL |lpfx| |lcyc|)))) 

(DEFUN |RADIX;intToExpr| (|i| $)
  (COND ((< |i| 10) (SPADCALL |i| (QREFELT $ 66)))
        ('T
         (NUM2USTR
          (SPADCALL (QREFELT $ 64)
                    (+ (- |i| 10) (SPADCALL (QREFELT $ 64) (QREFELT $ 68)))
                    (QREFELT $ 70)))))) 

(DEFUN |RADIX;exprgroup| (|le| $)
  (COND ((NULL |le|) (|error| "exprgroup needs non-null list"))
        ((NULL (CDR |le|)) (|SPADfirst| |le|))
        ((SPADCALL (ABS (QREFELT $ 6)) 36 (QREFELT $ 71))
         (SPADCALL |le| (QREFELT $ 73)))
        ('T (SPADCALL |le| (QREFELT $ 74))))) 

(DEFUN |RADIX;intgroup| (|li| $)
  (PROG (#1=#:G241 |i| #2=#:G240 #3=#:G239 #4=#:G238 #5=#:G237 #6=#:G236)
    (RETURN
     (SEQ
      (COND ((NULL |li|) (|error| "intgroup needs non-null list"))
            ((NULL (CDR |li|))
             (COND
              ((SPADCALL (ABS (QREFELT $ 6)) 36 (QREFELT $ 71))
               (|RADIX;intToExpr| (|SPADfirst| |li|) $))
              (#7='T (SPADCALL (|SPADfirst| |li|) (QREFELT $ 66)))))
            ((SPADCALL (ABS (QREFELT $ 6)) 10 (QREFELT $ 71))
             (SPADCALL
              (PROGN
               (LETT #6# NIL . #8=(|RADIX;intgroup|))
               (SEQ (LETT |i| NIL . #8#) (LETT #5# |li| . #8#) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #8#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #6# (CONS (SPADCALL |i| (QREFELT $ 66)) #6#)
                            . #8#)))
                    (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #6#))))
              (QREFELT $ 73)))
            ((SPADCALL (ABS (QREFELT $ 6)) 36 (QREFELT $ 71))
             (SPADCALL
              (PROGN
               (LETT #4# NIL . #8#)
               (SEQ (LETT |i| NIL . #8#) (LETT #3# |li| . #8#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #8#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4# (CONS (|RADIX;intToExpr| |i| $) #4#) . #8#)))
                    (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              (QREFELT $ 73)))
            (#7#
             (SPADCALL
              (PROGN
               (LETT #2# NIL . #8#)
               (SEQ (LETT |i| NIL . #8#) (LETT #1# |li| . #8#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #8#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 66)) #2#)
                            . #8#)))
                    (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QREFELT $ 74)))))))) 

(DEFUN |RADIX;overBar| (|li| $)
  (SPADCALL (|RADIX;intgroup| |li| $) (QREFELT $ 75))) 

(DEFUN |RADIX;coerce;$Of;35| (|a| $)
  (PROG (|rex| |le|)
    (RETURN
     (SEQ (LETT |le| NIL . #1=(|RADIX;coerce;$Of;35|))
          (COND
           ((NULL (NULL (QVELT |a| 3)))
            (LETT |le| (CONS (|RADIX;overBar| (QVELT |a| 3) $) |le|) . #1#)))
          (COND
           ((NULL (NULL (QVELT |a| 2)))
            (LETT |le| (CONS (|RADIX;intgroup| (QVELT |a| 2) $) |le|) . #1#)))
          (COND ((NULL (NULL |le|)) (LETT |le| (CONS "." |le|) . #1#)))
          (COND
           ((NULL (QVELT |a| 1))
            (LETT |le| (CONS (SPADCALL 0 (QREFELT $ 66)) |le|) . #1#))
           (#2='T
            (LETT |le| (CONS (|RADIX;intgroup| (QVELT |a| 1) $) |le|) . #1#)))
          (LETT |rex| (|RADIX;exprgroup| |le| $) . #1#)
          (EXIT
           (COND ((< (QVELT |a| 0) 0) (SPADCALL |rex| (QREFELT $ 76)))
                 (#2# |rex|))))))) 

(DEFUN |RADIX;checkRagits| (|li| $)
  (PROG (#1=#:G251 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| NIL . #2=(|RADIX;checkRagits|)) (LETT #1# |li| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((OR (< |i| 0) (>= |i| (QREFELT $ 6)))
               (|error| "Each ragit (digit) must be between 0 and base-1")))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT 'T))))) 

(DEFUN |RADIX;radixInt| (|n| |bas| $)
  (PROG (|rits| |qr|)
    (RETURN
     (SEQ (LETT |rits| NIL . #1=(|RADIX;radixInt|))
          (SEQ G190
               (COND ((NULL (SPADCALL (ABS |n|) 0 (QREFELT $ 78))) (GO G191)))
               (SEQ (LETT |qr| (DIVIDE2 |n| |bas|) . #1#)
                    (LETT |n| (QCAR |qr|) . #1#)
                    (EXIT (LETT |rits| (CONS (QCDR |qr|) |rits|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |rits|))))) 

(DEFUN |RADIX;radixFrac| (|num| |den| |bas| $)
  (PROG (|rits| |ritscyc| |i| |ritspfx| |c| |cfound| |ritsn| |rn| |p| |ritsi|
         |n| |qr2i| |qrt| |qr1i| #1=#:G275 |qr|)
    (RETURN
     (SEQ (LETT |qr| (DIVIDE2 (* |bas| |num|) |den|) . #2=(|RADIX;radixFrac|))
          (LETT |i| 0 . #2#) (LETT |qr1i| (LETT |qr2i| |qr| . #2#) . #2#)
          (LETT |rits| (LIST |qr|) . #2#)
          (SEQ (LETT #1# NIL . #2#) G190 (COND (#1# (GO G191)))
               (SEQ (LETT |qr1i| (DIVIDE2 (* |bas| (QCDR |qr1i|)) |den|) . #2#)
                    (LETT |qrt| (DIVIDE2 (* |bas| (QCDR |qr2i|)) |den|) . #2#)
                    (LETT |qr2i| (DIVIDE2 (* |bas| (QCDR |qrt|)) |den|) . #2#)
                    (LETT |rits| (CONS |qr2i| (CONS |qrt| |rits|)) . #2#)
                    (EXIT (LETT |i| (+ |i| 1) . #2#)))
               (LETT #1# (SPADCALL |qr1i| |qr2i| (QREFELT $ 80)) . #2#)
               (GO G190) G191 (EXIT NIL))
          (LETT |rits| (NREVERSE |rits|) . #2#) (LETT |n| |i| . #2#)
          (LETT |ritsi| |rits| . #2#) (LETT |ritsn| |rits| . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (EXIT (LETT |ritsn| (CDR |ritsn|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |i| 0 . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (|SPADfirst| |ritsi|) (|SPADfirst| |ritsn|)
                            (QREFELT $ 81)))
                 (GO G191)))
               (SEQ (LETT |ritsi| (CDR |ritsi|) . #2#)
                    (LETT |ritsn| (CDR |ritsn|) . #2#)
                    (EXIT (LETT |i| (+ |i| 1) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |p| |i| . #2#) (LETT |ritsn| |rits| . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (EXIT (LETT |ritsn| (CDR |ritsn|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |rn| (|SPADfirst| |ritsn|) . #2#) (LETT |cfound| 'NIL . #2#)
          (LETT |c| 0 . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND
                ((OR (|greater_SI| |i| |p|)
                     (NULL (COND (|cfound| 'NIL) ('T 'T))))
                 (GO G191)))
               (SEQ (LETT |ritsn| (CDR |ritsn|) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |rn| (|SPADfirst| |ritsn|) (QREFELT $ 80))
                       (SEQ (LETT |c| |i| . #2#)
                            (EXIT (LETT |cfound| 'T . #2#)))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (COND ((NULL |cfound|) (LETT |c| |n| . #2#)))
          (LETT |ritspfx| NIL . #2#) (LETT |ritscyc| NIL . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |p|) (GO G191)))
               (SEQ
                (LETT |ritspfx| (CONS (QCAR (|SPADfirst| |rits|)) |ritspfx|)
                      . #2#)
                (EXIT (LETT |rits| (CDR |rits|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |c|) (GO G191)))
               (SEQ
                (LETT |ritscyc| (CONS (QCAR (|SPADfirst| |rits|)) |ritscyc|)
                      . #2#)
                (EXIT (LETT |rits| (CDR |rits|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |ritspfx|) (NREVERSE |ritscyc|))))))) 

(DECLAIM (NOTINLINE |RadixExpansion;|)) 

(DEFUN |RadixExpansion| (#1=#:G303)
  (PROG ()
    (RETURN
     (PROG (#2=#:G304)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RadixExpansion|)
                                           '|domainEqualList|)
                . #3=(|RadixExpansion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|RadixExpansion;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|RadixExpansion|))))))))))) 

(DEFUN |RadixExpansion;| (|#1|)
  (PROG (|pv$| #1=#:G302 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|RadixExpansion|))
      (LETT |dv$| (LIST '|RadixExpansion| DV$1) . #2#)
      (LETT $ (GETREFV 118) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Integer|)
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Symbol|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|Integer|)
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RealConstant|))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedIntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedIntegralDomain|))
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedSet|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|StepThrough|))
                                          (|HasCategory| (|Integer|)
                                                         '(|InnerEvalable|
                                                           (|Symbol|)
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Evalable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Eltable|
                                                           (|Integer|)
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|DifferentialRing|))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|IntegerNumberSystem|))
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|Comparable|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedIntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|RadixExpansion| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
           (|augmentPredVector| $ 33554432))
      (AND
       (OR
        (AND (|HasCategory| $ '(|CharacteristicNonZero|))
             (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|)))
        (|HasCategory| (|Integer|) '(|CharacteristicNonZero|)))
       (|augmentPredVector| $ 67108864))
      (SETF |pv$| (QREFELT $ 3))
      (COND ((< |#1| 2) (|error| "Radix base must be at least 2")))
      (QSETREFV $ 7
                (|Record| (|:| |sgn| (|Integer|))
                          (|:| |int| (|List| (|Integer|)))
                          (|:| |pfx| (|List| (|Integer|)))
                          (|:| |cyc| (|List| (|Integer|)))))
      (QSETREFV $ 64 "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
      $)))) 

(MAKEPROP '|RadixExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |RADIX;characteristic;Nni;1|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |RADIX;Zero;$;3|) $))
              |RADIX;differentiate;2$;2|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |RADIX;One;$;4|) $))
              (|Boolean|) |RADIX;=;2$B;13| |RADIX;-;2$;5| (|Fraction| 23)
              |RADIX;coerce;$F;16| (0 . +) |RADIX;coerce;F$;18| |RADIX;+;3$;6|
              (6 . -) |RADIX;-;3$;7| (|Integer|) (12 . *) |RADIX;*;I2$;8|
              (18 . *) |RADIX;*;3$;9| (24 . /) |RADIX;/;3$;10| (30 . /)
              |RADIX;/;2I$;11| (36 . <) |RADIX;<;2$B;12| (|List| 23) (42 . =)
              (48 . |numer|) |RADIX;numer;$I;14| (53 . |denom|)
              |RADIX;denom;$I;15| |RADIX;wholePart;$I;23| (58 . |coerce|)
              |RADIX;fractionPart;$F;24| |RADIX;coerce;I$;17| (63 . |Zero|)
              (67 . -) (|Union| 16 '"failed") |RADIX;retractIfCan;$U;19|
              (|Union| 23 '"failed") |RADIX;retractIfCan;$U;20|
              (72 . |ceiling|) |RADIX;ceiling;$I;21| (77 . |floor|)
              |RADIX;floor;$I;22| |RADIX;wholeRagits;$L;25| (|Stream| 23)
              (82 . |construct|) (87 . |repeating|) (92 . |concat|)
              |RADIX;fractRagits;$S;26| |RADIX;prefixRagits;$L;27|
              |RADIX;cycleRagits;$L;28| |RADIX;wholeRadix;L$;29|
              |RADIX;fractRadix;2L$;30| 'ALPHAS (|OutputForm|) (98 . |coerce|)
              (|String|) (103 . |minIndex|) (|Character|) (108 . |elt|)
              (114 . <=) (|List| $) (120 . |hconcat|) (125 . |blankSeparate|)
              (130 . |overbar|) (135 . -) |RADIX;coerce;$Of;35| (140 . ~=)
              (|Record| (|:| |quotient| 23) (|:| |remainder| 23)) (146 . =)
              (152 . ~=) (|Union| 93 '#1="failed") (|Matrix| $)
              (|Union| $ '"failed") (|InputForm|) (|Pattern| 103)
              (|Pattern| 23) (|Equation| 23) (|List| 88) (|List| 91) (|Symbol|)
              (|Record| (|:| |mat| 94) (|:| |vec| (|Vector| 23))) (|Vector| $)
              (|Matrix| 23) (|List| 8) (|PatternMatchResult| 103 $)
              (|PatternMatchResult| 23 $) (|Factored| 99)
              (|SparseUnivariatePolynomial| $) (|Union| 101 '#1#) (|List| 99)
              (|DoubleFloat|) (|Float|) (|Union| 91 '"failed")
              (|Mapping| 23 23) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 107 '#2="failed") (|Union| 72 '#2#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 72) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|SingleInteger|) (|HashState|))
           '#(~= 158 |zero?| 164 |wholeRagits| 169 |wholeRadix| 174 |wholePart|
              179 |unitNormal| 184 |unitCanonical| 189 |unit?| 194
              |subtractIfCan| 199 |squareFreePolynomial| 205 |squareFreePart|
              210 |squareFree| 215 |solveLinearPolynomialEquation| 220
              |smaller?| 226 |sizeLess?| 232 |sign| 238 |sample| 243
              |retractIfCan| 247 |retract| 267 |rem| 287 |reducedSystem| 293
              |recip| 315 |random| 320 |quo| 324 |principalIdeal| 330 |prime?|
              335 |prefixRagits| 340 |positive?| 345 |patternMatch| 350 |one?|
              364 |numerator| 369 |numer| 374 |nextItem| 379 |negative?| 384
              |multiEuclidean| 389 |min| 395 |max| 401 |map| 407 |lcmCoef| 413
              |lcm| 419 |latex| 430 |inv| 435 |init| 440 |hashUpdate!| 444
              |hash| 450 |gcdPolynomial| 455 |gcd| 461 |fractionPart| 472
              |fractRagits| 482 |fractRadix| 487 |floor| 493
              |factorSquareFreePolynomial| 498 |factorPolynomial| 503 |factor|
              508 |extendedEuclidean| 513 |exquo| 526 |expressIdealMember| 532
              |eval| 538 |euclideanSize| 578 |elt| 583 |divide| 589
              |differentiate| 595 |denominator| 645 |denom| 650 |cycleRagits|
              655 |convert| 660 |conditionP| 685 |coerce| 690 |charthRoot| 725
              |characteristic| 730 |ceiling| 734 |associates?| 739 |abs| 745 ^
              750 |Zero| 768 |One| 772 D 776 >= 826 > 832 = 838 <= 844 < 850 /
              856 - 868 + 879 * 885)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3
                                  4 7 15 16 0 0 0 0 7 0 0 0 0 0 0 0 7 0 7 0 0 7
                                  0 0 0 0 9 0 0 0 25 11 19 20 0 0 6 13 0 0 0 0
                                  0 0 0 0 0 2 5 6 6 8 10 12 13 14 17 18))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| NIL |Module&| |Module&|
                NIL |EntireRing&| |Module&| NIL NIL |OrderedRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&| NIL NIL
                NIL NIL NIL |SetCategory&| NIL |Evalable&| NIL |RetractableTo&|
                NIL NIL NIL NIL NIL |BasicType&| NIL |RetractableTo&| NIL NIL
                NIL |PartialOrder&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 23) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 23)
                 (|DifferentialExtension| 23) (|Algebra| 23) (|Algebra| 16)
                 (|LeftOreRing|) (|Algebra| $$) (|LinearlyExplicitRingOver| 23)
                 (|Module| 23) (|Module| 16) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|OrderedRing|) (|PartialDifferentialRing| 91)
                 (|DifferentialRing|) (|BiModule| 23 23) (|BiModule| 16 16)
                 (|BiModule| $$ $$) (|Ring|) (|OrderedAbelianGroup|)
                 (|RightModule| 23) (|LeftModule| 23) (|RightModule| 16)
                 (|LeftModule| 16) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|)
                 (|FullyPatternMatchable| 23) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|OrderedSet|) (|FullyEvalableOver| 23)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|PatternMatchable| 103)
                 (|PatternMatchable| 23) (|Patternable| 23) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 23) (|Type|) (|RetractableTo| 23)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 65) (|RetractableTo| 91)
                 (|ConvertibleTo| 85) (|ConvertibleTo| 102)
                 (|ConvertibleTo| 103) (|PartialOrder|) (|RetractableTo| 16)
                 (|InnerEvalable| 91 23) (|InnerEvalable| 23 23)
                 (|Eltable| 23 $$) (|ConvertibleTo| 86) (|ConvertibleTo| 87))
              (|makeByteWordVec2| 117
                                  '(2 16 0 0 0 18 2 16 0 0 0 21 2 16 0 23 0 24
                                    2 16 0 0 0 26 2 16 0 0 0 28 2 16 0 23 23 30
                                    2 16 13 0 0 32 2 34 13 0 0 35 1 16 23 0 36
                                    1 16 23 0 38 1 16 0 23 41 0 16 0 44 1 16 0
                                    0 45 1 16 23 0 50 1 16 23 0 52 1 55 0 34 56
                                    1 55 0 34 57 2 55 0 0 0 58 1 23 65 0 66 1
                                    67 23 0 68 2 67 69 0 23 70 2 23 13 0 0 71 1
                                    65 0 72 73 1 65 0 72 74 1 65 0 0 75 1 65 0
                                    0 76 2 23 13 0 0 78 2 79 13 0 0 80 2 79 13
                                    0 0 81 2 0 13 0 0 1 1 0 13 0 1 1 0 34 0 54
                                    1 0 0 34 62 1 22 23 0 40 1 0 114 0 1 1 0 0
                                    0 1 1 0 13 0 1 2 0 84 0 0 1 1 1 98 99 1 1 0
                                    0 0 1 1 0 106 0 1 2 1 100 101 99 1 2 24 13
                                    0 0 1 2 0 13 0 0 1 1 7 23 0 1 0 0 0 1 1 10
                                    48 0 49 1 10 46 0 47 1 2 104 0 1 1 0 48 0
                                    49 1 10 23 0 1 1 10 16 0 1 1 2 91 0 1 1 0
                                    23 0 1 2 0 0 0 0 1 2 21 92 83 93 1 1 21 94
                                    83 1 1 0 94 83 1 2 0 92 83 93 1 1 0 84 0 1
                                    0 23 0 1 2 0 0 0 0 1 1 0 112 72 1 1 0 13 0
                                    1 1 0 34 0 60 1 7 13 0 1 3 19 96 0 86 96 1
                                    3 20 97 0 87 97 1 1 0 13 0 1 1 0 0 0 1 1 0
                                    23 0 37 1 11 84 0 1 1 7 13 0 1 2 0 109 72 0
                                    1 2 8 0 0 0 1 2 8 0 0 0 1 2 0 0 105 0 1 2 0
                                    113 0 0 1 2 0 0 0 0 1 1 0 0 72 1 1 0 67 0 1
                                    1 0 0 0 1 0 11 0 1 2 0 117 117 0 1 1 0 116
                                    0 1 2 0 99 99 99 1 2 0 0 0 0 1 1 0 0 72 1 1
                                    22 0 0 1 1 0 16 0 42 1 0 55 0 59 2 0 0 34
                                    34 63 1 23 23 0 53 1 1 98 99 1 1 1 98 99 1
                                    1 0 106 0 1 3 0 108 0 0 0 1 2 0 110 0 0 1 2
                                    0 84 0 0 1 2 0 109 72 0 1 2 13 0 0 88 1 2
                                    13 0 0 89 1 3 13 0 0 34 34 1 3 13 0 0 23 23
                                    1 3 12 0 0 90 34 1 3 12 0 0 91 23 1 1 0 8 0
                                    1 2 14 0 0 23 1 2 0 111 0 0 1 2 16 0 0 8 1
                                    1 16 0 0 11 3 15 0 0 91 8 1 3 15 0 0 90 95
                                    1 2 15 0 0 91 1 2 15 0 0 90 1 2 0 0 0 105 1
                                    3 0 0 0 105 8 1 1 0 0 0 1 1 0 23 0 39 1 0
                                    34 0 61 1 5 85 0 1 1 17 86 0 1 1 18 87 0 1
                                    1 6 102 0 1 1 6 103 0 1 1 26 82 83 1 1 2 0
                                    91 1 1 0 16 0 17 1 0 0 23 43 1 0 0 16 19 1
                                    0 0 23 43 1 0 0 0 1 1 0 65 0 77 1 27 84 0 1
                                    0 0 8 9 1 23 23 0 51 2 0 13 0 0 1 1 7 0 0 1
                                    2 0 0 0 23 1 2 0 0 0 8 1 2 0 0 0 115 1 0 0
                                    0 10 0 0 0 12 2 16 0 0 8 1 1 16 0 0 1 3 15
                                    0 0 91 8 1 3 15 0 0 90 95 1 2 15 0 0 91 1 2
                                    15 0 0 90 1 2 0 0 0 105 1 3 0 0 0 105 8 1 2
                                    8 13 0 0 1 2 8 13 0 0 1 2 0 13 0 0 14 2 8
                                    13 0 0 1 2 8 13 0 0 33 2 0 0 23 23 31 2 0 0
                                    0 0 29 2 0 0 0 0 22 1 0 0 0 15 2 0 0 0 0 20
                                    2 0 0 0 23 1 2 0 0 23 0 25 2 0 0 16 0 1 2 0
                                    0 0 16 1 2 0 0 0 0 27 2 0 0 23 0 25 2 0 0 8
                                    0 1 2 0 0 115 0 1)))))
           '|lookupComplete|)) 
