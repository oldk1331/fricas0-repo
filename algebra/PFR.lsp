
(SDEFUN |PFR;firstFactor| ((|x| |Factored| R) ($ R))
        (QVELT (|SPADfirst| (SPADCALL |x| (QREFELT $ 12))) 1)) 

(SDEFUN |PFR;firstExponent| ((|x| |Factored| R) ($ |Integer|))
        (QVELT (|SPADfirst| (SPADCALL |x| (QREFELT $ 12))) 2)) 

(SDEFUN |PFR;copypf| ((|a| $) ($ $))
        (CONS (QCAR |a|) (SPADCALL (QCDR |a|) (QREFELT $ 15)))) 

(SDEFUN |PFR;LessThan|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R)))
         (|t| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ |Boolean|))
        (NULL (GGREATERP (QCDR |s|) (QCDR |t|)))) 

(SDEFUN |PFR;multiplyFracTerms|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R)))
         (|t| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ $))
        (SPROG
         ((|d| ($)) (|c| ($))
          (|coefs| (|Record| (|:| |coef1| R) (|:| |coef2| R)))
          (|i| (|Union| (|Record| (|:| |coef1| R) (|:| |coef2| R)) "failed")))
         (SEQ
          (COND
           ((SPADCALL (|PFR;firstFactor| (QCDR |s|) $)
                      (|PFR;firstFactor| (QCDR |t|) $) (QREFELT $ 17))
            (|PFR;normalizeFracTerm|
             (CONS (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 18))
                   (SPADCALL (QCDR |s|) (QCDR |t|) (QREFELT $ 19)))
             $))
           (#1='T
            (SEQ
             (LETT |i|
                   (SPADCALL (SPADCALL (QCDR |t|) (QREFELT $ 20))
                             (SPADCALL (QCDR |s|) (QREFELT $ 20))
                             (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 18))
                             (QREFELT $ 23))
                   . #2=(|PFR;multiplyFracTerms|))
             (EXIT
              (COND ((QEQCAR |i| 1) (|error| "PartialFraction: not in ideal"))
                    (#1#
                     (SEQ (LETT |coefs| (QCDR |i|) . #2#)
                          (LETT |c| (|PFR;copypf| (|spadConstant| $ 24) $)
                                . #2#)
                          (COND
                           ((SPADCALL (QCDR |coefs|) (|spadConstant| $ 25)
                                      (QREFELT $ 26))
                            (LETT |c|
                                  (|PFR;normalizeFracTerm|
                                   (CONS (QCDR |coefs|) (QCDR |t|)) $)
                                  . #2#)))
                          (COND
                           ((SPADCALL (QCAR |coefs|) (|spadConstant| $ 25)
                                      (QREFELT $ 26))
                            (SEQ
                             (LETT |d|
                                   (|PFR;normalizeFracTerm|
                                    (CONS (QCAR |coefs|) (QCDR |s|)) $)
                                   . #2#)
                             (PROGN
                              (RPLACA |c|
                                      (SPADCALL (QCAR |c|) (QCAR |d|)
                                                (QREFELT $ 27)))
                              (QCAR |c|))
                             (EXIT
                              (COND
                               ((NULL (NULL (QCDR |d|)))
                                (PROGN
                                 (RPLACD |c|
                                         (SPADCALL (QCDR |d|) (QCDR |c|)
                                                   (QREFELT $ 28)))
                                 (QCDR |c|))))))))
                          (EXIT |c|))))))))))) 

(SDEFUN |PFR;normalizeFracTerm|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ $))
        (SPROG
         ((|q| #1=(|Record| (|:| |quotient| R) (|:| |remainder| R)))
          (|expon| (|Integer|)) (|nexpon| (|Integer|)) (|f| (R)) (|qr| #1#))
         (SEQ
          (LETT |qr|
                (SPADCALL (QCAR |s|) (SPADCALL (QCDR |s|) (QREFELT $ 20))
                          (QREFELT $ 30))
                . #2=(|PFR;normalizeFracTerm|))
          (EXIT
           (COND
            ((SPADCALL (QCDR |qr|) (|spadConstant| $ 25) (QREFELT $ 17))
             (CONS (QCAR |qr|) NIL))
            (#3='T
             (SEQ (LETT |f| (|PFR;firstFactor| (QCDR |s|) $) . #2#)
                  (LETT |nexpon| (|PFR;firstExponent| (QCDR |s|) $) . #2#)
                  (LETT |expon| 0 . #2#)
                  (LETT |q| (SPADCALL (QCDR |qr|) |f| (QREFELT $ 30)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL (QCDR |q|) (|spadConstant| $ 25)
                                      (QREFELT $ 17))
                            (< |expon| |nexpon|))
                           ('T NIL)))
                         (GO G191)))
                       (SEQ (LETT |expon| (+ |expon| 1) . #2#)
                            (PROGN (RPLACD |qr| (QCAR |q|)) (QCDR |qr|))
                            (EXIT
                             (LETT |q|
                                   (SPADCALL (QCDR |qr|) |f| (QREFELT $ 30))
                                   . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((EQL |expon| 0)
                     (CONS (QCAR |qr|) (LIST (CONS (QCDR |qr|) (QCDR |s|)))))
                    ((EQL |expon| |nexpon|)
                     (SPADCALL
                      (SPADCALL (QCAR |qr|) (QCDR |qr|) (QREFELT $ 27))
                      (QREFELT $ 33)))
                    (#3#
                     (CONS (QCAR |qr|)
                           (LIST
                            (CONS (QCDR |qr|)
                                  (SPADCALL |f| (- |nexpon| |expon|)
                                            (QREFELT $ 35))))))))))))))) 

(SDEFUN |PFR;partialFractionNormalized| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG
         ((|c| ($)) (|d| ($)) (#1=#:G181 NIL) (|i| NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
         (SEQ
          (COND
           ((SPADCALL |nm| (|spadConstant| $ 25) (QREFELT $ 17))
            (|spadConstant| $ 24))
           ((SPADCALL |dn| (|spadConstant| $ 36) (QREFELT $ 37))
            (SPADCALL |nm| (QREFELT $ 33)))
           ('T
            (SEQ
             (LETT |qr|
                   (SPADCALL |nm| (SPADCALL |dn| (QREFELT $ 20))
                             (QREFELT $ 30))
                   . #2=(|PFR;partialFractionNormalized|))
             (LETT |c|
                   (CONS (|spadConstant| $ 25)
                         (LIST
                          (CONS (QCDR |qr|)
                                (SPADCALL (|PFR;firstFactor| |dn| $)
                                          (|PFR;firstExponent| |dn| $)
                                          (QREFELT $ 35)))))
                   . #2#)
             (SEQ (LETT |i| NIL . #2#)
                  (LETT #1# (CDR (SPADCALL |dn| (QREFELT $ 12))) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |d|
                         (CONS (|spadConstant| $ 25)
                               (LIST
                                (CONS (|spadConstant| $ 32)
                                      (SPADCALL (QVELT |i| 1) (QVELT |i| 2)
                                                (QREFELT $ 35)))))
                         . #2#)
                   (EXIT (LETT |c| (SPADCALL |c| |d| (QREFELT $ 38)) . #2#)))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (SPADCALL (QCAR |qr|) (QREFELT $ 33)) |c|
                        (QREFELT $ 39))))))))) 

(SDEFUN |PFR;padicFraction;2$;8| ((|a| $) ($ $))
        (SPROG
         ((|d| (|Integer|)) (|sp| (|SparseUnivariatePolynomial| R))
          (|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (|f| (R)) (|e| (|Integer|)) (#1=#:G194 NIL) (|s| NIL) (|b| ($)))
         (SEQ
          (LETT |b| (SPADCALL |a| (QREFELT $ 40))
                . #2=(|PFR;padicFraction;2$;8|))
          (EXIT
           (COND ((NULL (QCDR |b|)) |b|)
                 ('T
                  (SEQ (LETT |l| NIL . #2#)
                       (SEQ (LETT |s| NIL . #2#) (LETT #1# (QCDR |b|) . #2#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |e| (|PFR;firstExponent| (QCDR |s|) $)
                                   . #2#)
                             (EXIT
                              (COND
                               ((EQL |e| 1) (LETT |l| (CONS |s| |l|) . #2#))
                               ('T
                                (SEQ
                                 (LETT |f| (|PFR;firstFactor| (QCDR |s|) $)
                                       . #2#)
                                 (LETT |d|
                                       (SPADCALL
                                        (LETT |sp|
                                              (SPADCALL |f| (QCAR |s|)
                                                        (QREFELT $ 42))
                                              . #2#)
                                        (QREFELT $ 44))
                                       . #2#)
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL |sp| (|spadConstant| $ 45)
                                                    (QREFELT $ 46)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |l|
                                              (CONS
                                               (CONS
                                                (SPADCALL |sp| (QREFELT $ 47))
                                                (SPADCALL |f| (- |e| |d|)
                                                          (QREFELT $ 35)))
                                               |l|)
                                              . #2#)
                                        (EXIT
                                         (LETT |d|
                                               (SPADCALL
                                                (LETT |sp|
                                                      (SPADCALL |sp|
                                                                (QREFELT $ 48))
                                                      . #2#)
                                                (QREFELT $ 44))
                                               . #2#)))
                                       NIL (GO G190) G191 (EXIT NIL))))))))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (CONS (QCAR |b|)
                              (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                                        |l| (QREFELT $ 50))))))))))) 

(SDEFUN |PFR;compactFraction;2$;9| ((|a| $) ($ $))
        (SPROG
         ((|b| ($)) (|e| (|Integer|)) (|f| (R))
          (|s| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))
          (|bf| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (|bw| (R)) (#1=#:G199 NIL) (#2=#:G207 NIL) (|t| NIL)
          (|af| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ
          (COND ((SPADCALL 2 (LENGTH (QCDR |a|)) (QREFELT $ 52)) |a|)
                ('T
                 (SEQ
                  (LETT |af| (REVERSE (QCDR |a|))
                        . #3=(|PFR;compactFraction;2$;9|))
                  (LETT |bf| NIL . #3#) (LETT |bw| (QCAR |a|) . #3#)
                  (LETT |s|
                        (CONS (QCAR (|SPADfirst| |af|))
                              (QCDR (|SPADfirst| |af|)))
                        . #3#)
                  (LETT |f| (|PFR;firstFactor| (QCDR |s|) $) . #3#)
                  (LETT |e| (|PFR;firstExponent| (QCDR |s|) $) . #3#)
                  (SEQ (LETT |t| NIL . #3#) (LETT #2# (CDR |af|) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |f| (|PFR;firstFactor| (QCDR |t|) $)
                                     (QREFELT $ 17))
                           (PROGN
                            (RPLACA |s|
                                    (SPADCALL (QCAR |s|)
                                              (SPADCALL (QCAR |t|)
                                                        (SPADCALL |f|
                                                                  (PROG1
                                                                      (LETT #1#
                                                                            (-
                                                                             |e|
                                                                             (|PFR;firstExponent|
                                                                              (QCDR
                                                                               |t|)
                                                                              $))
                                                                            . #3#)
                                                                    (|check_subtype2|
                                                                     (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 18))
                                              (QREFELT $ 27)))
                            (QCAR |s|)))
                          ('T
                           (SEQ
                            (LETT |b| (|PFR;normalizeFracTerm| |s| $) . #3#)
                            (LETT |bw|
                                  (SPADCALL |bw| (QCAR |b|) (QREFELT $ 27))
                                  . #3#)
                            (COND
                             ((NULL (NULL (QCDR |b|)))
                              (LETT |bf| (CONS (|SPADfirst| (QCDR |b|)) |bf|)
                                    . #3#)))
                            (LETT |s| (CONS (QCAR |t|) (QCDR |t|)) . #3#)
                            (LETT |f| (|PFR;firstFactor| (QCDR |s|) $) . #3#)
                            (EXIT
                             (LETT |e| (|PFR;firstExponent| (QCDR |s|) $)
                                   . #3#)))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (LETT |b| (|PFR;normalizeFracTerm| |s| $) . #3#)
                  (EXIT
                   (CONS (SPADCALL |bw| (QCAR |b|) (QREFELT $ 27))
                         (SPADCALL (QCDR |b|) |bf| (QREFELT $ 28)))))))))) 

(SDEFUN |PFR;Zero;$;10| (($ $)) (CONS (|spadConstant| $ 25) NIL)) 

(SDEFUN |PFR;One;$;11| (($ $)) (CONS (|spadConstant| $ 32) NIL)) 

(SDEFUN |PFR;characteristic;Nni;12| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 54))) 

(PUT '|PFR;coerce;R$;13| '|SPADreplace| '(XLAM (|r|) (CONS |r| NIL))) 

(SDEFUN |PFR;coerce;R$;13| ((|r| R) ($ $)) (CONS |r| NIL)) 

(SDEFUN |PFR;coerce;I$;14| ((|n| |Integer|) ($ $))
        (CONS (SPADCALL |n| (QREFELT $ 56)) NIL)) 

(SDEFUN |PFR;coerce;$F;15| ((|a| $) ($ |Fraction| R))
        (SPROG ((|q| (|Fraction| R)) (#1=#:G221 NIL) (|s| NIL))
               (SEQ
                (LETT |q| (SPADCALL (QCAR |a|) (QREFELT $ 59))
                      . #2=(|PFR;coerce;$F;15|))
                (SEQ (LETT |s| NIL . #2#) (LETT #1# (QCDR |a|) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |q|
                             (SPADCALL |q|
                                       (SPADCALL (QCAR |s|)
                                                 (SPADCALL (QCDR |s|)
                                                           (QREFELT $ 20))
                                                 (QREFELT $ 60))
                                       (QREFELT $ 61))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |q|)))) 

(SDEFUN |PFR;coerce;F$;16| ((|q| |Fraction| (|Factored| R)) ($ $))
        (SPROG ((|r1| (R)) (|u| (R)) (#1=#:G224 NIL))
               (SEQ
                (LETT |u|
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 64))
                                           (QREFELT $ 65))
                                 (QREFELT $ 67))
                                . #2=(|PFR;coerce;F$;16|))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #1#))
                      . #2#)
                (LETT |r1|
                      (SPADCALL |u|
                                (SPADCALL (SPADCALL |q| (QREFELT $ 68))
                                          (QREFELT $ 20))
                                (QREFELT $ 18))
                      . #2#)
                (EXIT
                 (|PFR;partialFractionNormalized| |r1|
                  (SPADCALL |u| (SPADCALL |q| (QREFELT $ 64)) (QREFELT $ 69))
                  $))))) 

(SDEFUN |PFR;exquo;2$U;17| ((|a| $) (|b| $) ($ |Union| $ "failed"))
        (SPROG ((|br| (|Fraction| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| $ 24) (QREFELT $ 71))
                  (CONS 1 "failed"))
                 ((SPADCALL |b| (|spadConstant| $ 31) (QREFELT $ 71))
                  (CONS 0 |a|))
                 ('T
                  (SEQ
                   (LETT |br|
                         (SPADCALL (SPADCALL |b| (QREFELT $ 62))
                                   (QREFELT $ 72))
                         |PFR;exquo;2$U;17|)
                   (EXIT
                    (CONS 0
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |br| (QREFELT $ 73))
                                              (SPADCALL
                                               (SPADCALL |br| (QREFELT $ 74))
                                               (QREFELT $ 75))
                                              (QREFELT $ 76))
                                    (QREFELT $ 38)))))))))) 

(SDEFUN |PFR;recip;$U;18| ((|a| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 31) |a| (QREFELT $ 77))) 

(SDEFUN |PFR;firstDenom;$F;19| ((|a| $) ($ |Factored| R))
        (COND ((NULL (QCDR |a|)) (|spadConstant| $ 36))
              ('T (QCDR (|SPADfirst| (QCDR |a|)))))) 

(SDEFUN |PFR;firstNumer;$R;20| ((|a| $) ($ R))
        (COND ((NULL (QCDR |a|)) (|spadConstant| $ 25))
              ('T (QCAR (|SPADfirst| (QCDR |a|)))))) 

(SDEFUN |PFR;numberOfFractionalTerms;$I;21| ((|a| $) ($ |Integer|))
        (LENGTH (QCDR |a|))) 

(SDEFUN |PFR;nthFractionalTerm;$I$;22| ((|a| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ (LETT |l| (QCDR |a|) |PFR;nthFractionalTerm;$I$;22|)
              (COND
               ((OR (< |n| 1) (SPADCALL |n| (LENGTH |l|) (QREFELT $ 52)))
                (EXIT (|spadConstant| $ 24))))
              (EXIT
               (CONS (|spadConstant| $ 25)
                     (LIST (SPADCALL |l| |n| (QREFELT $ 82)))))))) 

(PUT '|PFR;wholePart;$R;23| '|SPADreplace| 'QCAR) 

(SDEFUN |PFR;wholePart;$R;23| ((|a| $) ($ R)) (QCAR |a|)) 

(SDEFUN |PFR;fractionalTerms;$L;24| ((|a| $) ($ |List| (|Fraction| R)))
        (SPROG
         ((#1=#:G260 NIL) (|x| NIL) (#2=#:G259 NIL)
          (|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ (LETT |l| (QCDR |a|) . #3=(|PFR;fractionalTerms;$L;24|))
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (QCAR |x|)
                                        (SPADCALL (QCDR |x|) (QREFELT $ 20))
                                        (QREFELT $ 60))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |PFR;partialFraction;RF$;25| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG ((|u| (R)) (#1=#:G262 NIL))
               (SEQ
                (COND
                 ((SPADCALL |nm| (|spadConstant| $ 25) (QREFELT $ 17))
                  (|spadConstant| $ 24))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL |dn| (QREFELT $ 65))
                         . #2=(|PFR;partialFraction;RF$;25|))
                   (LETT |u|
                         (PROG2 (LETT #1# (SPADCALL |u| (QREFELT $ 67)) . #2#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                           (|Union| (QREFELT $ 6) "failed")
                                           #1#))
                         . #2#)
                   (EXIT
                    (|PFR;partialFractionNormalized|
                     (SPADCALL |u| |nm| (QREFELT $ 18))
                     (SPADCALL |u| |dn| (QREFELT $ 69)) $)))))))) 

(SDEFUN |PFR;padicallyExpand;2RSup;26|
        ((|p| R) (|r| R) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ
                (LETT |qr| (SPADCALL |r| |p| (QREFELT $ 30))
                      |PFR;padicallyExpand;2RSup;26|)
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |qr|) (|spadConstant| $ 25) (QREFELT $ 17))
                   (SPADCALL (QCDR |qr|) (QREFELT $ 87)))
                  ('T
                   (SPADCALL (SPADCALL (QCDR |qr|) (QREFELT $ 87))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 88))
                              (SPADCALL |p| (QCAR |qr|) (QREFELT $ 42))
                              (QREFELT $ 89))
                             (QREFELT $ 90)))))))) 

(SDEFUN |PFR;=;2$B;27| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 26)) NIL)
              ((NULL (QCDR |a|))
               (COND
                ((NULL (QCDR |b|))
                 (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 17)))
                (#1='T NIL)))
              ((NULL (QCDR |b|)) NIL)
              (#1#
               (SPADCALL (SPADCALL |a| (QREFELT $ 62))
                         (SPADCALL |b| (QREFELT $ 62)) (QREFELT $ 91))))) 

(SDEFUN |PFR;-;2$;28| ((|a| $) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (#1=#:G283 NIL) (|s| NIL))
         (SEQ (LETT |l| NIL . #2=(|PFR;-;2$;28|))
              (SEQ (LETT |s| NIL . #2#) (LETT #1# (REVERSE (QCDR |a|)) . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |l|
                           (CONS
                            (CONS (SPADCALL (QCAR |s|) (QREFELT $ 92))
                                  (QCDR |s|))
                            |l|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL (QCAR |a|) (QREFELT $ 92)) |l|))))) 

(SDEFUN |PFR;*;R2$;29| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G293 NIL) (|c| ($)) (#2=#:G294 NIL) (|s| NIL) (|b| ($)))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 25) (QREFELT $ 17))
                  (|spadConstant| $ 24))
                 ((SPADCALL |r| (|spadConstant| $ 32) (QREFELT $ 17)) |a|)
                 ('T
                  (SEQ
                   (LETT |b|
                         (SPADCALL (SPADCALL |r| (QCAR |a|) (QREFELT $ 18))
                                   (QREFELT $ 33))
                         . #3=(|PFR;*;R2$;29|))
                   (SEQ (LETT |s| NIL . #3#)
                        (LETT #2# (REVERSE (QCDR |a|)) . #3#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |c|
                                 (|PFR;normalizeFracTerm|
                                  (CONS
                                   (SPADCALL |r| (QCAR |s|) (QREFELT $ 18))
                                   (QCDR |s|))
                                  $)
                                 . #3#)
                           (PROGN
                            (RPLACA |b|
                                    (SPADCALL (QCAR |b|) (QCAR |c|)
                                              (QREFELT $ 27)))
                            (QCAR |b|))
                           (EXIT
                            (COND
                             ((NULL (NULL (QCDR |c|)))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (RPLACD |b|
                                              (SPADCALL (QCDR |c|) (QCDR |b|)
                                                        (QREFELT $ 28)))
                                      (QCDR |b|))
                                     . #3#)
                               (GO #4=#:G287)))))))
                         #4# (EXIT #1#))
                        (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                   (EXIT |b|))))))) 

(SDEFUN |PFR;*;I2$;30| ((|n| |Integer|) (|a| $) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 56)) |a| (QREFELT $ 94))) 

(SDEFUN |PFR;+;3$;31| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (CONS (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 27))
               (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                         (SPADCALL (QCDR |a|)
                                   (SPADCALL (QCDR |b|) (QREFELT $ 15))
                                   (QREFELT $ 28))
                         (QREFELT $ 50)))
         (QREFELT $ 40))) 

(SDEFUN |PFR;*;3$;32| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c| ($)) (#1=#:G310 NIL) (|t| NIL) (#2=#:G309 NIL) (|s| NIL)
          (|af| ($)))
         (SEQ
          (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) |b| (QREFELT $ 94)))
                ((NULL (QCDR |b|)) (SPADCALL (QCAR |b|) |a| (QREFELT $ 94)))
                ('T
                 (SEQ
                  (LETT |af| (CONS (|spadConstant| $ 25) (QCDR |a|))
                        . #3=(|PFR;*;3$;32|))
                  (LETT |c|
                        (SPADCALL (SPADCALL (QCAR |a|) |b| (QREFELT $ 94))
                                  (SPADCALL (QCAR |b|) |af| (QREFELT $ 94))
                                  (QREFELT $ 39))
                        . #3#)
                  (SEQ (LETT |s| NIL . #3#) (LETT #2# (QCDR |a|) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |t| NIL . #3#) (LETT #1# (QCDR |b|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |c|
                                      (SPADCALL |c|
                                                (|PFR;multiplyFracTerms| |s|
                                                 |t| $)
                                                (QREFELT $ 39))
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |c|))))))) 

(SDEFUN |PFR;coerce;$Of;33| ((|a| $) ($ |OutputForm|))
        (SPROG ((|l| (|List| (|OutputForm|))) (#1=#:G323 NIL) (|s| NIL))
               (SEQ
                (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) (QREFELT $ 97)))
                      (#2='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |a|) (|spadConstant| $ 25)
                                    (QREFELT $ 17))
                          (LETT |l| NIL . #3=(|PFR;coerce;$Of;33|)))
                         (#2#
                          (LETT |l| (LIST (SPADCALL (QCAR |a|) (QREFELT $ 97)))
                                . #3#)))
                        (SEQ (LETT |s| NIL . #3#) (LETT #1# (QCDR |a|) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QCDR |s|) (|spadConstant| $ 36)
                                           (QREFELT $ 37))
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL (QCAR |s|) (QREFELT $ 97))
                                        |l|)
                                       . #3#))
                                ('T
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QCAR |s|) (QREFELT $ 97))
                                         (SPADCALL (QCDR |s|) (QREFELT $ 98))
                                         (QREFELT $ 99))
                                        |l|)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND ((EQL (LENGTH |l|) 1) (|SPADfirst| |l|))
                               (#2#
                                (SPADCALL (ELT $ 100) (REVERSE |l|)
                                          (QREFELT $ 103))))))))))) 

(SDEFUN |PFR;partialFraction;F$;34| ((|f| |Fraction| R) ($ $))
        (SPADCALL (SPADCALL |f| (QREFELT $ 73))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 74)) (QREFELT $ 106))
                  (QREFELT $ 76))) 

(DECLAIM (NOTINLINE |PartialFraction;|)) 

(DEFUN |PartialFraction| (#1=#:G332)
  (SPROG NIL
         (PROG (#2=#:G333)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PartialFraction|)
                                               '|domainEqualList|)
                    . #3=(|PartialFraction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PartialFraction;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PartialFraction|)))))))))) 

(DEFUN |PartialFraction;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialFraction|))
          (LETT |dv$| (LIST '|PartialFraction| DV$1) . #1#)
          (LETT $ (GETREFV 120) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|UniqueFactorizationDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|PartialFraction| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |whole| |#1|)
                              (|:| |fract|
                                   (|List|
                                    (|Record| (|:| |num| |#1|)
                                              (|:| |den|
                                                   (|Factored| |#1|)))))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 107
                      (CONS (|dispatchFunction| |PFR;partialFraction;F$;34|)
                            $))))
          $))) 

(MAKEPROP '|PartialFraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 8) (|:| |fctr| 6) (|:| |xpnt| 34))
              (|List| 9) (|Factored| 6) (0 . |factorList|)
              (|Record| (|:| |num| 6) (|:| |den| 11)) (|List| 13) (5 . |copy|)
              (|Boolean|) (10 . =) (16 . *) (22 . *) (28 . |expand|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 21 '#1="failed") (33 . |extendedEuclidean|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;Zero;$;10|) $))
              (40 . |Zero|) (44 . ~=) (50 . +) (56 . |append|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (62 . |divide|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;One;$;11|) $))
              (68 . |One|) |PFR;coerce;R$;13| (|Integer|) (72 . |nilFactor|)
              (78 . |One|) (82 . =) |PFR;*;3$;32| |PFR;+;3$;31|
              |PFR;compactFraction;2$;9| (|SparseUnivariatePolynomial| 6)
              |PFR;padicallyExpand;2RSup;26| (|NonNegativeInteger|)
              (88 . |degree|) (93 . |Zero|) (97 . ~=)
              (103 . |leadingCoefficient|) (108 . |reductum|)
              (|Mapping| 16 13 13) (113 . |sort|) |PFR;padicFraction;2$;8|
              (119 . >) (125 . ^) (131 . |characteristic|)
              |PFR;characteristic;Nni;12| (135 . |coerce|) |PFR;coerce;I$;14|
              (|Fraction| 6) (140 . |coerce|) (145 . /) (151 . +)
              |PFR;coerce;$F;15| (|Fraction| 11) (157 . |denom|) (162 . |unit|)
              (|Union| $ '"failed") (167 . |recip|) (172 . |numer|) (177 . *)
              |PFR;coerce;F$;16| |PFR;=;2$B;27| (183 . |inv|) (188 . |numer|)
              (193 . |denom|) (198 . |coerce|) |PFR;partialFraction;RF$;25|
              |PFR;exquo;2$U;17| |PFR;recip;$U;18| |PFR;firstDenom;$F;19|
              |PFR;firstNumer;$R;20| |PFR;numberOfFractionalTerms;$I;21|
              (203 . |elt|) |PFR;nthFractionalTerm;$I$;22|
              |PFR;wholePart;$R;23| (|List| 58) |PFR;fractionalTerms;$L;24|
              (209 . |coerce|) (214 . |monomial|) (220 . *) (226 . +) (232 . =)
              (238 . -) |PFR;-;2$;28| |PFR;*;R2$;29| |PFR;*;I2$;30|
              (|OutputForm|) (243 . |coerce|) (248 . |coerce|) (253 . /)
              (259 . +) (|Mapping| 96 96 96) (|List| 96) (265 . |reduce|)
              |PFR;coerce;$Of;33| (|Factored| $) (271 . |factor|)
              (276 . |partialFraction|) (|Fraction| 34) (|Union| 110 '#1#)
              (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 110) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 281 |zero?| 287 |wholePart| 292 |unitNormal| 297
              |unitCanonical| 302 |unit?| 307 |subtractIfCan| 312
              |squareFreePart| 318 |squareFree| 323 |sizeLess?| 328 |sample|
              334 |rightRecip| 338 |rightPower| 343 |rem| 355 |recip| 361 |quo|
              366 |principalIdeal| 372 |prime?| 377 |partialFraction| 382
              |padicallyExpand| 393 |padicFraction| 399 |opposite?| 404 |one?|
              410 |numberOfFractionalTerms| 415 |nthFractionalTerm| 420
              |multiEuclidean| 426 |leftRecip| 432 |leftPower| 437 |lcmCoef|
              449 |lcm| 455 |latex| 466 |inv| 471 |hashUpdate!| 476 |hash| 482
              |gcdPolynomial| 487 |gcd| 493 |fractionalTerms| 504 |firstNumer|
              509 |firstDenom| 514 |factor| 519 |extendedEuclidean| 524 |exquo|
              537 |expressIdealMember| 543 |euclideanSize| 549 |divide| 554
              |compactFraction| 560 |commutator| 565 |coerce| 571
              |characteristic| 606 |associator| 610 |associates?| 617
              |antiCommutator| 623 |annihilate?| 629 ^ 635 |Zero| 653 |One| 657
              = 661 / 667 - 673 + 684 * 690)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0))
            (CONS
             '#(|Field&| |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL |Algebra&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 6) (|Algebra| 108) (|EntireRing|) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| 6) (|Module| 108)
                 (|Module| $$) (|SemiRng|) (|BiModule| 6 6)
                 (|BiModule| 108 108) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 108)
                 (|LeftModule| 108) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 96))
              (|makeByteWordVec2| 119
                                  '(1 11 10 0 12 1 14 0 0 15 2 6 16 0 0 17 2 6
                                    0 0 0 18 2 11 0 0 0 19 1 11 6 0 20 3 6 22 0
                                    0 0 23 0 6 0 25 2 6 16 0 0 26 2 6 0 0 0 27
                                    2 14 0 0 0 28 2 6 29 0 0 30 0 6 0 32 2 11 0
                                    6 34 35 0 11 0 36 2 11 16 0 0 37 1 41 43 0
                                    44 0 41 0 45 2 41 16 0 0 46 1 41 6 0 47 1
                                    41 0 0 48 2 14 0 49 0 50 2 34 16 0 0 52 2 6
                                    0 0 43 53 0 6 43 54 1 6 0 34 56 1 58 0 6 59
                                    2 58 0 6 6 60 2 58 0 0 0 61 1 63 11 0 64 1
                                    11 6 0 65 1 6 66 0 67 1 63 11 0 68 2 11 0 6
                                    0 69 1 58 0 0 72 1 58 6 0 73 1 58 6 0 74 1
                                    11 0 6 75 2 14 13 0 34 82 1 41 0 6 87 2 41
                                    0 6 43 88 2 41 0 0 0 89 2 41 0 0 0 90 2 58
                                    16 0 0 91 1 6 0 0 92 1 6 96 0 97 1 11 96 0
                                    98 2 96 0 0 0 99 2 96 0 0 0 100 2 102 96
                                    101 0 103 1 6 105 0 106 1 0 0 58 107 2 0 16
                                    0 0 1 1 0 16 0 1 1 0 6 0 84 1 0 115 0 1 1 0
                                    0 0 1 1 0 16 0 1 2 0 66 0 0 1 1 0 0 0 1 1 0
                                    105 0 1 2 0 16 0 0 1 0 0 0 1 1 0 66 0 1 2 0
                                    0 0 43 1 2 0 0 0 116 1 2 0 0 0 0 1 1 0 66 0
                                    78 2 0 0 0 0 1 1 0 112 110 1 1 0 16 0 1 1 1
                                    0 58 107 2 0 0 6 11 76 2 0 41 6 6 42 1 0 0
                                    0 51 2 0 16 0 0 1 1 0 16 0 1 1 0 34 0 81 2
                                    0 0 0 34 83 2 0 109 110 0 1 1 0 66 0 1 2 0
                                    0 0 43 1 2 0 0 0 116 1 2 0 114 0 0 1 1 0 0
                                    110 1 2 0 0 0 0 1 1 0 117 0 1 1 0 0 0 1 2 0
                                    119 119 0 1 1 0 118 0 1 2 0 113 113 113 1 2
                                    0 0 0 0 1 1 0 0 110 1 1 0 85 0 86 1 0 6 0
                                    80 1 0 11 0 79 1 0 105 0 1 3 0 22 0 0 0 1 2
                                    0 111 0 0 1 2 0 66 0 0 77 2 0 109 110 0 1 1
                                    0 43 0 1 2 0 29 0 0 1 1 0 0 0 40 2 0 0 0 0
                                    1 1 0 0 63 70 1 0 58 0 62 1 0 0 6 33 1 0 0
                                    108 1 1 0 0 0 1 1 0 0 34 57 1 0 96 0 104 0
                                    0 43 55 3 0 0 0 0 0 1 2 0 16 0 0 1 2 0 0 0
                                    0 1 2 0 16 0 0 1 2 0 0 0 34 1 2 0 0 0 43 1
                                    2 0 0 0 116 1 0 0 0 24 0 0 0 31 2 0 16 0 0
                                    71 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 93 2 0 0
                                    0 0 39 2 0 0 6 0 94 2 0 0 0 6 1 2 0 0 0 108
                                    1 2 0 0 108 0 1 2 0 0 43 0 1 2 0 0 34 0 95
                                    2 0 0 0 0 38 2 0 0 116 0 1)))))
           '|lookupComplete|)) 
