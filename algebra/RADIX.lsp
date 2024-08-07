
(PUT '|RADIX;characteristic;Nni;1| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |RADIX;characteristic;Nni;1| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |RADIX;differentiate;2%;2| ((|a| (%)) (% (%))) (|spadConstant| % 10)) 

(PUT '|RADIX;Zero;%;3| '|SPADreplace| '(XLAM NIL (VECTOR 1 NIL NIL NIL))) 

(SDEFUN |RADIX;Zero;%;3| ((% (%))) (VECTOR 1 NIL NIL NIL)) 

(SDEFUN |RADIX;One;%;4| ((% (%))) (VECTOR 1 (LIST 1) NIL NIL)) 

(SDEFUN |RADIX;-;2%;5| ((|a| (%)) (% (%)))
        (COND
         ((SPADCALL |a| (|spadConstant| % 10) (QREFELT % 14))
          (|spadConstant| % 10))
         ('T
          (VECTOR (- (QVELT |a| 0)) (QVELT |a| 1) (QVELT |a| 2)
                  (QVELT |a| 3))))) 

(SDEFUN |RADIX;+;3%;6| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 18))
         (QREFELT % 19))) 

(SDEFUN |RADIX;-;3%;7| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 21))
         (QREFELT % 19))) 

(SDEFUN |RADIX;*;I2%;8| ((|n| (|Integer|)) (|a| (%)) (% (%)))
        (SPADCALL (SPADCALL |n| (SPADCALL |a| (QREFELT % 17)) (QREFELT % 24))
                  (QREFELT % 19))) 

(SDEFUN |RADIX;*;3%;9| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 26))
         (QREFELT % 19))) 

(SDEFUN |RADIX;/;3%;10| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                   (QREFELT % 28))
         (QREFELT % 19))) 

(SDEFUN |RADIX;/;2I%;11| ((|i| #1=(|Integer|)) (|j| #1#) (% (%)))
        (SPADCALL (SPADCALL |i| |j| (QREFELT % 30)) (QREFELT % 19))) 

(SDEFUN |RADIX;<;2%B;12| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (SPADCALL |b| (QREFELT % 17))
                  (QREFELT % 32))) 

(SDEFUN |RADIX;=;2%B;13| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (COND
         ((EQL (QVELT |a| 0) (QVELT |b| 0))
          (COND
           ((SPADCALL (QVELT |a| 1) (QVELT |b| 1) (QREFELT % 35))
            (COND
             ((SPADCALL (QVELT |a| 2) (QVELT |b| 2) (QREFELT % 35))
              (SPADCALL (QVELT |a| 3) (QVELT |b| 3) (QREFELT % 35)))
             (#1='T NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |RADIX;numer;%I;14| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 36))) 

(SDEFUN |RADIX;denom;%I;15| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 38))) 

(SDEFUN |RADIX;coerce;%F;16| ((|a| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT % 40)) (QREFELT % 41))
                  (SPADCALL |a| (QREFELT % 42)) (QREFELT % 18))) 

(SDEFUN |RADIX;coerce;I%;17| ((|n| (|Integer|)) (% (%)))
        (SPADCALL (SPADCALL |n| (QREFELT % 41)) (QREFELT % 19))) 

(SDEFUN |RADIX;coerce;F%;18| ((|q| (|Fraction| (|Integer|))) (% (%)))
        (SPROG
         ((|cycle| #1=(|List| (|Integer|)))
          (|fractn|
           (|Record| (|:| |pfx| (|List| (|Integer|))) (|:| |cyc| #1#)))
          (|whole| (|List| (|Integer|)))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|s| (|Integer|)))
         (SEQ (LETT |s| 1)
              (COND
               ((SPADCALL |q| (|spadConstant| % 44) (QREFELT % 32))
                (SEQ (LETT |s| -1)
                     (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 45)))))))
              (LETT |qr|
                    (DIVIDE2 (SPADCALL |q| (QREFELT % 36))
                             (SPADCALL |q| (QREFELT % 38))))
              (LETT |whole| (|RADIX;radixInt| (QCAR |qr|) (QREFELT % 6) %))
              (LETT |fractn|
                    (|RADIX;radixFrac| (QCDR |qr|)
                     (SPADCALL |q| (QREFELT % 38)) (QREFELT % 6) %))
              (LETT |cycle|
                    (COND
                     ((SPADCALL (QCDR |fractn|) (LIST 0) (QREFELT % 35)) NIL)
                     ('T (QCDR |fractn|))))
              (EXIT (VECTOR |s| |whole| (QCAR |fractn|) |cycle|))))) 

(SDEFUN |RADIX;retractIfCan;%U;19|
        ((|a| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (CONS 0 (SPADCALL |a| (QREFELT % 17)))) 

(SDEFUN |RADIX;retractIfCan;%U;20|
        ((|a| (%)) (% (|Union| (|Integer|) "failed")))
        (SEQ
         (COND
          ((NULL (QVELT |a| 2))
           (COND
            ((NULL (QVELT |a| 3))
             (EXIT (CONS 0 (SPADCALL |a| (QREFELT % 40))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADIX;ceiling;%I;21| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 50))) 

(SDEFUN |RADIX;floor;%I;22| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 17)) (QREFELT % 52))) 

(SDEFUN |RADIX;wholePart;%I;23| ((|a| (%)) (% (|Integer|)))
        (SPROG ((|n0| (|Integer|)) (#1=#:G81 NIL) (|r| NIL))
               (SEQ (LETT |n0| 0)
                    (SEQ (LETT |r| NIL) (LETT #1# (QVELT |a| 1)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT |n0| (+ (* (QREFELT % 6) |n0|) |r|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (* (QVELT |a| 0) |n0|))))) 

(SDEFUN |RADIX;fractionPart;%F;24| ((|a| (%)) (% (|Fraction| (|Integer|))))
        (SPROG
         ((|d| (|Integer|)) (|n| (|Integer|)) (|n1| (|Integer|)) (#1=#:G90 NIL)
          (|r| NIL) (|n0| (|Integer|)) (#2=#:G89 NIL))
         (SEQ (LETT |n0| 0)
              (SEQ (LETT |r| NIL) (LETT #2# (QVELT |a| 2)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |n0| (+ (* (QREFELT % 6) |n0|) |r|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL (QVELT |a| 3))
                 (SPADCALL (* (QVELT |a| 0) |n0|)
                           (EXPT (QREFELT % 6) (LENGTH (QVELT |a| 2)))
                           (QREFELT % 30)))
                ('T
                 (SEQ (LETT |n1| |n0|)
                      (SEQ (LETT |r| NIL) (LETT #1# (QVELT |a| 3)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT (LETT |n1| (+ (* (QREFELT % 6) |n1|) |r|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |n| (- |n1| |n0|))
                      (LETT |d|
                            (*
                             (- (EXPT (QREFELT % 6) (LENGTH (QVELT |a| 3))) 1)
                             (EXPT (QREFELT % 6) (LENGTH (QVELT |a| 2)))))
                      (EXIT
                       (SPADCALL (* (QVELT |a| 0) |n|) |d|
                                 (QREFELT % 30)))))))))) 

(PUT '|RADIX;wholeRagits;%L;25| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 1))) 

(SDEFUN |RADIX;wholeRagits;%L;25| ((|a| (%)) (% (|List| (|Integer|))))
        (QVELT |a| 1)) 

(SDEFUN |RADIX;fractRagits;%S;26| ((|a| (%)) (% (|Stream| (|Integer|))))
        (SPADCALL (SPADCALL (QVELT |a| 2) (QREFELT % 56))
                  (SPADCALL (QVELT |a| 3) (QREFELT % 57)) (QREFELT % 58))) 

(PUT '|RADIX;prefixRagits;%L;27| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 2))) 

(SDEFUN |RADIX;prefixRagits;%L;27| ((|a| (%)) (% (|List| (|Integer|))))
        (QVELT |a| 2)) 

(PUT '|RADIX;cycleRagits;%L;28| '|SPADreplace| '(XLAM (|a|) (QVELT |a| 3))) 

(SDEFUN |RADIX;cycleRagits;%L;28| ((|a| (%)) (% (|List| (|Integer|))))
        (QVELT |a| 3)) 

(SDEFUN |RADIX;wholeRadix;L%;29| ((|li| (|List| (|Integer|))) (% (%)))
        (SEQ (|RADIX;checkRagits| |li| %) (EXIT (VECTOR 1 |li| NIL NIL)))) 

(SDEFUN |RADIX;fractRadix;2L%;30|
        ((|lpfx| (|List| (|Integer|))) (|lcyc| (|List| (|Integer|))) (% (%)))
        (SEQ (|RADIX;checkRagits| |lpfx| %) (|RADIX;checkRagits| |lcyc| %)
             (EXIT (VECTOR 1 NIL |lpfx| |lcyc|)))) 

(SDEFUN |RADIX;intToExpr| ((|i| (|Integer|)) (% (|OutputForm|)))
        (COND ((< |i| 10) (SPADCALL |i| (QREFELT % 66)))
              ('T
               (SPADCALL
                (SPADCALL (QREFELT % 64)
                          (+ (- |i| 10)
                             (SPADCALL (QREFELT % 64) (QREFELT % 68)))
                          (QREFELT % 70))
                (QREFELT % 71))))) 

(SDEFUN |RADIX;exprgroup| ((|le| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (COND ((NULL |le|) (|error| "exprgroup needs non-null list"))
              ((NULL (CDR |le|)) (|SPADfirst| |le|))
              ((<= (ABS (QREFELT % 6)) 36) (SPADCALL |le| (QREFELT % 73)))
              ('T (SPADCALL |le| (QREFELT % 74))))) 

(SDEFUN |RADIX;intgroup| ((|li| (|List| (|Integer|))) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G121 NIL) (|i| NIL) (#2=#:G120 NIL) (#3=#:G119 NIL)
          (#4=#:G118 NIL) (#5=#:G117 NIL) (#6=#:G116 NIL))
         (SEQ
          (COND ((NULL |li|) (|error| "intgroup needs non-null list"))
                ((NULL (CDR |li|))
                 (COND
                  ((<= (ABS (QREFELT % 6)) 36)
                   (|RADIX;intToExpr| (|SPADfirst| |li|) %))
                  (#7='T (SPADCALL (|SPADfirst| |li|) (QREFELT % 66)))))
                ((<= (ABS (QREFELT % 6)) 10)
                 (SPADCALL
                  (PROGN
                   (LETT #6# NIL)
                   (SEQ (LETT |i| NIL) (LETT #5# |li|) G190
                        (COND
                         ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #6# (CONS (SPADCALL |i| (QREFELT % 66)) #6#))))
                        (LETT #5# (CDR #5#)) (GO G190) G191
                        (EXIT (NREVERSE #6#))))
                  (QREFELT % 73)))
                ((<= (ABS (QREFELT % 6)) 36)
                 (SPADCALL
                  (PROGN
                   (LETT #4# NIL)
                   (SEQ (LETT |i| NIL) (LETT #3# |li|) G190
                        (COND
                         ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4# (CONS (|RADIX;intToExpr| |i| %) #4#))))
                        (LETT #3# (CDR #3#)) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  (QREFELT % 73)))
                (#7#
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |i| NIL) (LETT #1# |li|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |i| (QREFELT % 66)) #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT % 74))))))) 

(SDEFUN |RADIX;overBar| ((|li| (|List| (|Integer|))) (% (|OutputForm|)))
        (SPADCALL (|RADIX;intgroup| |li| %) (QREFELT % 75))) 

(SDEFUN |RADIX;coerce;%Of;35| ((|a| (%)) (% (|OutputForm|)))
        (SPROG ((|rex| (|OutputForm|)) (|le| (|List| (|OutputForm|))))
               (SEQ (LETT |le| NIL)
                    (COND
                     ((NULL (NULL (QVELT |a| 3)))
                      (LETT |le|
                            (CONS (|RADIX;overBar| (QVELT |a| 3) %) |le|))))
                    (COND
                     ((NULL (NULL (QVELT |a| 2)))
                      (LETT |le|
                            (CONS (|RADIX;intgroup| (QVELT |a| 2) %) |le|))))
                    (COND
                     ((NULL (NULL |le|))
                      (LETT |le| (CONS (SPADCALL "." (QREFELT % 76)) |le|))))
                    (COND
                     ((NULL (QVELT |a| 1))
                      (LETT |le| (CONS (SPADCALL 0 (QREFELT % 66)) |le|)))
                     (#1='T
                      (LETT |le|
                            (CONS (|RADIX;intgroup| (QVELT |a| 1) %) |le|))))
                    (LETT |rex| (|RADIX;exprgroup| |le| %))
                    (EXIT
                     (COND
                      ((< (QVELT |a| 0) 0) (SPADCALL |rex| (QREFELT % 77)))
                      (#1# |rex|)))))) 

(SDEFUN |RADIX;checkRagits| ((|li| (|List| (|Integer|))) (% (|Boolean|)))
        (SPROG ((#1=#:G133 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| NIL) (LETT #1# |li|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (< |i| 0) (>= |i| (QREFELT % 6)))
                         (|error|
                          "Each ragit (digit) must be between 0 and base-1")))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))) 

(SDEFUN |RADIX;radixInt|
        ((|n| (|Integer|)) (|bas| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|rits| (|List| (|Integer|)))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ (LETT |rits| NIL)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL (ABS |n|) 0 (QREFELT % 79))) (GO G191)))
                   (SEQ (LETT |qr| (DIVIDE2 |n| |bas|)) (LETT |n| (QCAR |qr|))
                        (EXIT (LETT |rits| (CONS (QCDR |qr|) |rits|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |rits|)))) 

(SDEFUN |RADIX;radixFrac|
        ((|num| (|Integer|)) (|den| (|Integer|)) (|bas| (|Integer|))
         (%
          (|Record| (|:| |pfx| (|List| (|Integer|)))
                    (|:| |cyc| (|List| (|Integer|))))))
        (SPROG
         ((|rits|
           (|List|
            #1=(|Record| (|:| |quotient| (|Integer|))
                         (|:| |remainder| (|Integer|)))))
          (|ritscyc| (|List| (|Integer|))) (#2=#:G171 NIL) (|i| (|Integer|))
          (|ritspfx| (|List| (|Integer|))) (#3=#:G170 NIL) (|c| (|Integer|))
          (|cfound| (|Boolean|))
          (|ritsn|
           #4=(|List|
               (|Record| (|:| |quotient| (|Integer|))
                         (|:| |remainder| (|Integer|)))))
          (#5=#:G169 NIL)
          (|rn|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (#6=#:G168 NIL) (|p| #7=(|Integer|)) (|ritsi| #4#) (#8=#:G167 NIL)
          (|n| #7#) (|qr2i| #1#) (|qrt| #1#) (|qr1i| #1#) (#9=#:G166 NIL)
          (|qr| #1#))
         (SEQ (LETT |qr| (DIVIDE2 (* |bas| |num|) |den|)) (LETT |i| 0)
              (LETT |qr1i| (LETT |qr2i| |qr|)) (LETT |rits| (LIST |qr|))
              (SEQ (LETT #9# NIL) G190 (COND (#9# (GO G191)))
                   (SEQ (LETT |qr1i| (DIVIDE2 (* |bas| (QCDR |qr1i|)) |den|))
                        (LETT |qrt| (DIVIDE2 (* |bas| (QCDR |qr2i|)) |den|))
                        (LETT |qr2i| (DIVIDE2 (* |bas| (QCDR |qrt|)) |den|))
                        (LETT |rits| (CONS |qr2i| (CONS |qrt| |rits|)))
                        (EXIT (LETT |i| (+ |i| 1))))
                   (LETT #9# (SPADCALL |qr1i| |qr2i| (QREFELT % 81))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |rits| (NREVERSE |rits|)) (LETT |n| |i|)
              (LETT |ritsi| |rits|) (LETT |ritsn| |rits|)
              (SEQ (LETT |i| 1) (LETT #8# |n|) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ (EXIT (LETT |ritsn| (CDR |ritsn|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |i| 0)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (|SPADfirst| |ritsi|) (|SPADfirst| |ritsn|)
                                (QREFELT % 82)))
                     (GO G191)))
                   (SEQ (LETT |ritsi| (CDR |ritsi|))
                        (LETT |ritsn| (CDR |ritsn|))
                        (EXIT (LETT |i| (+ |i| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |p| |i|) (LETT |ritsn| |rits|)
              (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ (EXIT (LETT |ritsn| (CDR |ritsn|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |rn| (|SPADfirst| |ritsn|)) (LETT |cfound| NIL)
              (LETT |c| 0)
              (SEQ (LETT |i| 1) (LETT #5# |p|) G190
                   (COND
                    ((OR (|greater_SI| |i| #5#) (NULL (NULL |cfound|)))
                     (GO G191)))
                   (SEQ (LETT |ritsn| (CDR |ritsn|))
                        (EXIT
                         (COND
                          ((SPADCALL |rn| (|SPADfirst| |ritsn|) (QREFELT % 81))
                           (SEQ (LETT |c| |i|) (EXIT (LETT |cfound| 'T)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (COND ((NULL |cfound|) (LETT |c| |n|))) (LETT |ritspfx| NIL)
              (LETT |ritscyc| NIL)
              (SEQ (LETT |i| 1) (LETT #3# |p|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |ritspfx|
                          (CONS (QCAR (|SPADfirst| |rits|)) |ritspfx|))
                    (EXIT (LETT |rits| (CDR |rits|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #2# |c|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |ritscyc|
                          (CONS (QCAR (|SPADfirst| |rits|)) |ritscyc|))
                    (EXIT (LETT |rits| (CDR |rits|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |ritspfx|) (NREVERSE |ritscyc|)))))) 

(DECLAIM (NOTINLINE |RadixExpansion;|)) 

(DEFUN |RadixExpansion| (#1=#:G199)
  (SPROG NIL
         (PROG (#2=#:G200)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RadixExpansion|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RadixExpansion;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadixExpansion|)))))))))) 

(DEFUN |RadixExpansion;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G198 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|RadixExpansion| DV$1))
          (LETT % (GETREFV 117))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
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
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|EuclideanDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegerNumberSystem|))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|Comparable|)))
                                              (OR #1#
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedIntegralDomain|))
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedSet|)))))))
          (|haddProp| |$ConstructorCache| '|RadixExpansion| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 33554432))
          (AND
           (OR
            (AND (|HasCategory| % '(|CharacteristicNonZero|))
                 (|HasCategory| (|Integer|)
                                '(|PolynomialFactorizationExplicit|)))
            (|HasCategory| (|Integer|) '(|CharacteristicNonZero|)))
           (|augmentPredVector| % 67108864))
          (SETF |pv$| (QREFELT % 3))
          (COND ((< |#1| 2) (|error| "Radix base must be at least 2")))
          (QSETREFV % 7
                    (|Record| (|:| |sgn| (|Integer|))
                              (|:| |int| (|List| (|Integer|)))
                              (|:| |pfx| (|List| (|Integer|)))
                              (|:| |cyc| (|List| (|Integer|)))))
          (QSETREFV % 64 "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
          %))) 

(MAKEPROP '|RadixExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |RADIX;characteristic;Nni;1|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |RADIX;Zero;%;3|) %))
              |RADIX;differentiate;2%;2|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |RADIX;One;%;4|) %))
              (|Boolean|) |RADIX;=;2%B;13| |RADIX;-;2%;5| (|Fraction| 23)
              |RADIX;coerce;%F;16| (0 . +) |RADIX;coerce;F%;18| |RADIX;+;3%;6|
              (6 . -) |RADIX;-;3%;7| (|Integer|) (12 . *) |RADIX;*;I2%;8|
              (18 . *) |RADIX;*;3%;9| (24 . /) |RADIX;/;3%;10| (30 . /)
              |RADIX;/;2I%;11| (36 . <) |RADIX;<;2%B;12| (|List| 23) (42 . =)
              (48 . |numer|) |RADIX;numer;%I;14| (53 . |denom|)
              |RADIX;denom;%I;15| |RADIX;wholePart;%I;23| (58 . |coerce|)
              |RADIX;fractionPart;%F;24| |RADIX;coerce;I%;17| (63 . |Zero|)
              (67 . -) (|Union| 16 '"failed") |RADIX;retractIfCan;%U;19|
              (|Union| 23 '"failed") |RADIX;retractIfCan;%U;20|
              (72 . |ceiling|) |RADIX;ceiling;%I;21| (77 . |floor|)
              |RADIX;floor;%I;22| |RADIX;wholeRagits;%L;25| (|Stream| 23)
              (82 . |construct|) (87 . |repeating|) (92 . |concat|)
              |RADIX;fractRagits;%S;26| |RADIX;prefixRagits;%L;27|
              |RADIX;cycleRagits;%L;28| |RADIX;wholeRadix;L%;29|
              |RADIX;fractRadix;2L%;30| 'ALPHAS (|OutputForm|) (98 . |coerce|)
              (|String|) (103 . |minIndex|) (|Character|) (108 . |elt|)
              (114 . |coerce|) (|List| %) (119 . |hconcat|)
              (124 . |blankSeparate|) (129 . |overbar|) (134 . |message|)
              (139 . -) |RADIX;coerce;%Of;35| (144 . ~=)
              (|Record| (|:| |quotient| 23) (|:| |remainder| 23)) (150 . =)
              (156 . ~=) (|PositiveInteger|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %) (|Union| 72 '"failed")
              (|Record| (|:| |coef| 72) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 91 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Mapping| 23 23)
              (|Record| (|:| |mat| 99) (|:| |vec| (|Vector| 23))) (|Matrix| %)
              (|Vector| %) (|Matrix| 23) (|Union| 98 '#1="failed")
              (|InputForm|) (|Pattern| 115) (|Pattern| 23) (|Equation| 23)
              (|List| 104) (|List| 107) (|Symbol|) (|List| 8)
              (|PatternMatchResult| 115 %) (|PatternMatchResult| 23 %)
              (|Union| 112 '#1#) (|List| 87) (|Factored| 87) (|DoubleFloat|)
              (|Float|) (|Union| 107 '"failed"))
           '#(~= 162 |zero?| 168 |wholeRagits| 173 |wholeRadix| 178 |wholePart|
              183 |unitNormal| 188 |unitCanonical| 193 |unit?| 198
              |subtractIfCan| 203 |squareFreePolynomial| 209 |squareFreePart|
              214 |squareFree| 219 |solveLinearPolynomialEquation| 224
              |smaller?| 230 |sizeLess?| 236 |sign| 242 |sample| 247
              |rightRecip| 251 |rightPower| 256 |retractIfCan| 268 |retract|
              288 |rem| 308 |reducedSystem| 314 |recip| 336 |quo| 341
              |principalIdeal| 347 |prime?| 352 |prefixRagits| 357 |positive?|
              362 |plenaryPower| 367 |patternMatch| 373 |opposite?| 387 |one?|
              393 |numerator| 398 |numer| 403 |nextItem| 408 |negative?| 413
              |multiEuclidean| 418 |min| 424 |max| 430 |map| 436 |leftRecip|
              442 |leftPower| 447 |lcmCoef| 459 |lcm| 465 |latex| 476 |inv| 481
              |init| 486 |gcdPolynomial| 490 |gcd| 496 |fractionPart| 507
              |fractRagits| 517 |fractRadix| 522 |floor| 528
              |factorSquareFreePolynomial| 533 |factorPolynomial| 538 |factor|
              543 |extendedEuclidean| 548 |exquo| 561 |expressIdealMember| 567
              |eval| 573 |euclideanSize| 613 |elt| 618 |divide| 624
              |differentiate| 630 |denominator| 680 |denom| 685 |cycleRagits|
              690 |convert| 695 |conditionP| 720 |commutator| 725 |coerce| 731
              |charthRoot| 761 |characteristic| 766 |ceiling| 770 |associator|
              775 |associates?| 782 |antiCommutator| 788 |annihilate?| 794
              |abs| 800 ^ 805 |Zero| 823 |One| 827 D 831 >= 881 > 887 = 893 <=
              899 < 905 / 911 - 923 + 934 * 940)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 0 0 7 0 0 7 0 0 0 0 16 15 4 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 7 0 0 0 0 0
                                  0 0 7 0 7 0 0 0 9 0 0 0 0 0 20 19 11 25 0 0 0
                                  13 10 6 2 0 0 0 0 18 17 14 13 12 10 8 6 6 5 2
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL NIL NIL
                NIL |AbelianSemiGroup&| |Magma&| |FullyEvalableOver&|
                |Evalable&| |RetractableTo&| NIL |RetractableTo&|
                |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL |PartialOrder&| NIL NIL
                NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 23) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|CommutativeRing|)
                 (|DivisionRing|) (|DifferentialExtension| 23)
                 (|DifferentialRing|) (|PartialDifferentialRing| 107)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 16) (|Algebra| 23)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 16) (|NonAssociativeAlgebra| 23)
                 (|SemiRng|) (|Module| $$) (|Module| 16) (|Module| 23)
                 (|FullyLinearlyExplicitOver| 23) (|OrderedAbelianGroup|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 16 16)
                 (|BiModule| 23 23) (|LinearlyExplicitOver| 23)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 16)
                 (|RightModule| 16) (|LeftModule| 23) (|RightModule| 23)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|FullyPatternMatchable| 23)
                 (|PatternMatchable| 23) (|PatternMatchable| 115)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyEvalableOver| 23) (|Evalable| 23) (|RetractableTo| 16)
                 (|RealConstant|) (|RetractableTo| 107) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 23) (|Patternable| 23)
                 (|ConvertibleTo| 103) (|ConvertibleTo| 102) (|Eltable| 23 $$)
                 (|InnerEvalable| 23 23) (|InnerEvalable| 107 23)
                 (|CoercibleFrom| 16) (|PartialOrder|) (|ConvertibleTo| 115)
                 (|ConvertibleTo| 114) (|ConvertibleTo| 101)
                 (|CoercibleFrom| 107) (|CoercibleTo| 65) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 23) (|Type|))
              (|makeByteWordVec2| 116
                                  '(2 16 0 0 0 18 2 16 0 0 0 21 2 16 0 23 0 24
                                    2 16 0 16 0 26 2 16 0 0 0 28 2 16 0 23 23
                                    30 2 16 13 0 0 32 2 34 13 0 0 35 1 16 23 0
                                    36 1 16 23 0 38 1 16 0 23 41 0 16 0 44 1 16
                                    0 0 45 1 16 23 0 50 1 16 23 0 52 1 55 0 34
                                    56 1 55 0 34 57 2 55 0 0 0 58 1 23 65 0 66
                                    1 67 23 0 68 2 67 69 0 23 70 1 69 65 0 71 1
                                    65 0 72 73 1 65 0 72 74 1 65 0 0 75 1 65 0
                                    67 76 1 65 0 0 77 2 23 13 0 0 79 2 80 13 0
                                    0 81 2 80 13 0 0 82 2 0 13 0 0 1 1 0 13 0 1
                                    1 0 34 0 54 1 0 0 34 62 1 22 23 0 40 1 0 85
                                    0 1 1 0 0 0 1 1 0 13 0 1 2 0 84 0 0 1 1 1
                                    113 87 1 1 0 0 0 1 1 0 94 0 1 2 1 111 112
                                    87 1 2 24 13 0 0 1 2 0 13 0 0 1 1 7 23 0 1
                                    0 0 0 1 1 0 84 0 1 2 0 0 0 83 1 2 0 0 0 8 1
                                    1 0 48 0 49 1 10 46 0 47 1 10 48 0 49 1 2
                                    116 0 1 1 0 23 0 1 1 10 16 0 1 1 10 23 0 1
                                    1 2 107 0 1 2 0 0 0 0 1 2 0 96 97 98 1 1 0
                                    99 97 1 1 21 99 97 1 2 21 96 97 98 1 1 0 84
                                    0 1 2 0 0 0 0 1 1 0 89 72 1 1 0 13 0 1 1 0
                                    34 0 60 1 7 13 0 1 2 0 0 0 83 1 3 19 109 0
                                    102 109 1 3 20 110 0 103 110 1 2 0 13 0 0 1
                                    1 0 13 0 1 1 0 0 0 1 1 0 23 0 37 1 11 84 0
                                    1 1 7 13 0 1 2 0 88 72 0 1 2 8 0 0 0 1 2 8
                                    0 0 0 1 2 0 0 95 0 1 1 0 84 0 1 2 0 0 0 83
                                    1 2 0 0 0 8 1 2 0 86 0 0 1 1 0 0 72 1 2 0 0
                                    0 0 1 1 0 67 0 1 1 0 0 0 1 0 11 0 1 2 0 87
                                    87 87 1 1 0 0 72 1 2 0 0 0 0 1 1 0 16 0 42
                                    1 22 0 0 1 1 0 55 0 59 2 0 0 34 34 63 1 23
                                    23 0 53 1 1 113 87 1 1 1 113 87 1 1 0 94 0
                                    1 3 0 92 0 0 0 1 2 0 93 0 0 1 2 0 84 0 0 1
                                    2 0 88 72 0 1 3 13 0 0 34 34 1 2 13 0 0 104
                                    1 3 13 0 0 23 23 1 2 13 0 0 105 1 3 12 0 0
                                    106 34 1 3 12 0 0 107 23 1 1 0 8 0 1 2 14 0
                                    0 23 1 2 0 90 0 0 1 3 0 0 0 95 8 1 2 0 0 0
                                    95 1 1 16 0 0 11 2 16 0 0 8 1 2 15 0 0 106
                                    1 2 15 0 0 107 1 3 15 0 0 106 108 1 3 15 0
                                    0 107 8 1 1 0 0 0 1 1 0 23 0 39 1 0 34 0 61
                                    1 5 101 0 1 1 17 102 0 1 1 18 103 0 1 1 6
                                    114 0 1 1 6 115 0 1 1 26 100 97 1 2 0 0 0 0
                                    1 1 0 65 0 78 1 0 0 23 43 1 0 0 0 1 1 0 0
                                    16 19 1 0 16 0 17 1 2 0 107 1 1 27 84 0 1 0
                                    0 8 9 1 23 23 0 51 3 0 0 0 0 0 1 2 0 13 0 0
                                    1 2 0 0 0 0 1 2 0 13 0 0 1 1 7 0 0 1 2 0 0
                                    0 83 1 2 0 0 0 8 1 2 0 0 0 23 1 0 0 0 10 0
                                    0 0 12 3 0 0 0 95 8 1 2 0 0 0 95 1 1 16 0 0
                                    1 2 16 0 0 8 1 2 15 0 0 107 1 3 15 0 0 107
                                    8 1 2 15 0 0 106 1 3 15 0 0 106 108 1 2 8
                                    13 0 0 1 2 8 13 0 0 1 2 0 13 0 0 14 2 8 13
                                    0 0 1 2 8 13 0 0 33 2 0 0 0 0 29 2 0 0 23
                                    23 31 2 0 0 0 0 22 1 0 0 0 15 2 0 0 0 0 20
                                    2 0 0 83 0 1 2 0 0 0 0 27 2 0 0 23 0 25 2 0
                                    0 8 0 1 2 0 0 0 16 1 2 0 0 16 0 1 2 0 0 0
                                    23 1 2 21 0 0 23 1)))))
           '|lookupComplete|)) 
