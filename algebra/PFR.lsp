
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
         ((|c| ($)) (|d| ($)) (#1=#:G178 NIL) (|i| NIL)
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
          (|f| (R)) (|e| (|Integer|)) (#1=#:G191 NIL) (|s| NIL) (|b| ($)))
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
          (|bw| (R)) (#1=#:G196 NIL) (#2=#:G204 NIL) (|t| NIL)
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
        (SPROG ((|q| (|Fraction| R)) (#1=#:G218 NIL) (|s| NIL))
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
        (SPROG ((|r1| (R)) (|u| (R)) (#1=#:G221 NIL))
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

(SDEFUN |PFR;numberOfFractionalTerms;$I;19| ((|a| $) ($ |Integer|))
        (LENGTH (QCDR |a|))) 

(PUT '|PFR;wholePart;$R;20| '|SPADreplace| 'QCAR) 

(SDEFUN |PFR;wholePart;$R;20| ((|a| $) ($ R)) (QCAR |a|)) 

(PUT '|PFR;fractionalTerms;$L;21| '|SPADreplace| 'QCDR) 

(SDEFUN |PFR;fractionalTerms;$L;21|
        ((|a| $)
         ($ |List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
        (QCDR |a|)) 

(SDEFUN |PFR;partialFraction;RF$;22| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG ((|u| (R)) (#1=#:G243 NIL))
               (SEQ
                (COND
                 ((SPADCALL |nm| (|spadConstant| $ 25) (QREFELT $ 17))
                  (|spadConstant| $ 24))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL |dn| (QREFELT $ 65))
                         . #2=(|PFR;partialFraction;RF$;22|))
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

(SDEFUN |PFR;padicallyExpand;2RSup;23|
        ((|p| R) (|r| R) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ
                (LETT |qr| (SPADCALL |r| |p| (QREFELT $ 30))
                      |PFR;padicallyExpand;2RSup;23|)
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |qr|) (|spadConstant| $ 25) (QREFELT $ 17))
                   (SPADCALL (QCDR |qr|) (QREFELT $ 82)))
                  ('T
                   (SPADCALL (SPADCALL (QCDR |qr|) (QREFELT $ 82))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 83))
                              (SPADCALL |p| (QCAR |qr|) (QREFELT $ 42))
                              (QREFELT $ 84))
                             (QREFELT $ 85)))))))) 

(SDEFUN |PFR;=;2$B;24| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 26)) NIL)
              ((NULL (QCDR |a|))
               (COND
                ((NULL (QCDR |b|))
                 (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 17)))
                (#1='T NIL)))
              ((NULL (QCDR |b|)) NIL)
              (#1#
               (SPADCALL (SPADCALL |a| (QREFELT $ 62))
                         (SPADCALL |b| (QREFELT $ 62)) (QREFELT $ 86))))) 

(SDEFUN |PFR;-;2$;25| ((|a| $) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (#1=#:G264 NIL) (|s| NIL))
         (SEQ (LETT |l| NIL . #2=(|PFR;-;2$;25|))
              (SEQ (LETT |s| NIL . #2#) (LETT #1# (REVERSE (QCDR |a|)) . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |l|
                           (CONS
                            (CONS (SPADCALL (QCAR |s|) (QREFELT $ 87))
                                  (QCDR |s|))
                            |l|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL (QCAR |a|) (QREFELT $ 87)) |l|))))) 

(SDEFUN |PFR;*;R2$;26| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G274 NIL) (|c| ($)) (#2=#:G275 NIL) (|s| NIL) (|b| ($)))
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
                         . #3=(|PFR;*;R2$;26|))
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
                               (GO #4=#:G268)))))))
                         #4# (EXIT #1#))
                        (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                   (EXIT |b|))))))) 

(SDEFUN |PFR;*;I2$;27| ((|n| |Integer|) (|a| $) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 56)) |a| (QREFELT $ 89))) 

(SDEFUN |PFR;+;3$;28| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (CONS (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 27))
               (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                         (SPADCALL (QCDR |a|)
                                   (SPADCALL (QCDR |b|) (QREFELT $ 15))
                                   (QREFELT $ 28))
                         (QREFELT $ 50)))
         (QREFELT $ 40))) 

(SDEFUN |PFR;*;3$;29| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c| ($)) (#1=#:G291 NIL) (|t| NIL) (#2=#:G290 NIL) (|s| NIL)
          (|af| ($)))
         (SEQ
          (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) |b| (QREFELT $ 89)))
                ((NULL (QCDR |b|)) (SPADCALL (QCAR |b|) |a| (QREFELT $ 89)))
                ('T
                 (SEQ
                  (LETT |af| (CONS (|spadConstant| $ 25) (QCDR |a|))
                        . #3=(|PFR;*;3$;29|))
                  (LETT |c|
                        (SPADCALL (SPADCALL (QCAR |a|) |b| (QREFELT $ 89))
                                  (SPADCALL (QCAR |b|) |af| (QREFELT $ 89))
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

(SDEFUN |PFR;coerce;$Of;30| ((|a| $) ($ |OutputForm|))
        (SPROG ((|l| (|List| (|OutputForm|))) (#1=#:G304 NIL) (|s| NIL))
               (SEQ
                (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) (QREFELT $ 92)))
                      (#2='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |a|) (|spadConstant| $ 25)
                                    (QREFELT $ 17))
                          (LETT |l| NIL . #3=(|PFR;coerce;$Of;30|)))
                         (#2#
                          (LETT |l| (LIST (SPADCALL (QCAR |a|) (QREFELT $ 92)))
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
                                        (SPADCALL (QCAR |s|) (QREFELT $ 92))
                                        |l|)
                                       . #3#))
                                ('T
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QCAR |s|) (QREFELT $ 92))
                                         (SPADCALL (QCDR |s|) (QREFELT $ 93))
                                         (QREFELT $ 94))
                                        |l|)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND ((EQL (LENGTH |l|) 1) (|SPADfirst| |l|))
                               (#2#
                                (SPADCALL (ELT $ 95) (REVERSE |l|)
                                          (QREFELT $ 98))))))))))) 

(SDEFUN |PFR;partialFraction;F$;31| ((|f| |Fraction| R) ($ $))
        (SPADCALL (SPADCALL |f| (QREFELT $ 73))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 74)) (QREFELT $ 101))
                  (QREFELT $ 76))) 

(DECLAIM (NOTINLINE |PartialFraction;|)) 

(DEFUN |PartialFraction| (#1=#:G313)
  (SPROG NIL
         (PROG (#2=#:G314)
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
          (LETT $ (GETREFV 115) . #1#)
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
            (QSETREFV $ 102
                      (CONS (|dispatchFunction| |PFR;partialFraction;F$;31|)
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
              (78 . |One|) (82 . =) |PFR;*;3$;29| |PFR;+;3$;28|
              |PFR;compactFraction;2$;9| (|SparseUnivariatePolynomial| 6)
              |PFR;padicallyExpand;2RSup;23| (|NonNegativeInteger|)
              (88 . |degree|) (93 . |Zero|) (97 . ~=)
              (103 . |leadingCoefficient|) (108 . |reductum|)
              (|Mapping| 16 13 13) (113 . |sort|) |PFR;padicFraction;2$;8|
              (119 . >) (125 . ^) (131 . |characteristic|)
              |PFR;characteristic;Nni;12| (135 . |coerce|) |PFR;coerce;I$;14|
              (|Fraction| 6) (140 . |coerce|) (145 . /) (151 . +)
              |PFR;coerce;$F;15| (|Fraction| 11) (157 . |denom|) (162 . |unit|)
              (|Union| $ '"failed") (167 . |recip|) (172 . |numer|) (177 . *)
              |PFR;coerce;F$;16| |PFR;=;2$B;24| (183 . |inv|) (188 . |numer|)
              (193 . |denom|) (198 . |coerce|) |PFR;partialFraction;RF$;22|
              |PFR;exquo;2$U;17| |PFR;recip;$U;18|
              |PFR;numberOfFractionalTerms;$I;19| |PFR;wholePart;$R;20|
              |PFR;fractionalTerms;$L;21| (203 . |coerce|) (208 . |monomial|)
              (214 . *) (220 . +) (226 . =) (232 . -) |PFR;-;2$;25|
              |PFR;*;R2$;26| |PFR;*;I2$;27| (|OutputForm|) (237 . |coerce|)
              (242 . |coerce|) (247 . /) (253 . +) (|Mapping| 91 91 91)
              (|List| 91) (259 . |reduce|) |PFR;coerce;$Of;30| (|Factored| $)
              (265 . |factor|) (270 . |partialFraction|) (|Fraction| 34)
              (|Union| 105 '#1#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 105) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 275 |zero?| 281 |wholePart| 286 |unitNormal| 291
              |unitCanonical| 296 |unit?| 301 |subtractIfCan| 306
              |squareFreePart| 312 |squareFree| 317 |sizeLess?| 322 |sample|
              328 |rightRecip| 332 |rightPower| 337 |rem| 349 |recip| 355 |quo|
              360 |principalIdeal| 366 |prime?| 371 |partialFraction| 376
              |padicallyExpand| 387 |padicFraction| 393 |opposite?| 398 |one?|
              404 |numberOfFractionalTerms| 409 |multiEuclidean| 414
              |leftRecip| 420 |leftPower| 425 |lcmCoef| 437 |lcm| 443 |latex|
              454 |inv| 459 |hashUpdate!| 464 |hash| 470 |gcdPolynomial| 475
              |gcd| 481 |fractionalTerms| 492 |factor| 497 |extendedEuclidean|
              502 |exquo| 515 |expressIdealMember| 521 |euclideanSize| 527
              |divide| 532 |compactFraction| 538 |commutator| 543 |coerce| 549
              |characteristic| 584 |associator| 588 |associates?| 595
              |antiCommutator| 601 |annihilate?| 607 ^ 613 |Zero| 631 |One| 635
              = 639 / 645 - 651 + 662 * 668)
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
                 (|Algebra| 6) (|Algebra| 103) (|EntireRing|) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| 6) (|Module| 103)
                 (|Module| $$) (|SemiRng|) (|BiModule| 6 6)
                 (|BiModule| 103 103) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 103)
                 (|LeftModule| 103) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 91))
              (|makeByteWordVec2| 114
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
                                    11 0 6 75 1 41 0 6 82 2 41 0 6 43 83 2 41 0
                                    0 0 84 2 41 0 0 0 85 2 58 16 0 0 86 1 6 0 0
                                    87 1 6 91 0 92 1 11 91 0 93 2 91 0 0 0 94 2
                                    91 0 0 0 95 2 97 91 96 0 98 1 6 100 0 101 1
                                    0 0 58 102 2 0 16 0 0 1 1 0 16 0 1 1 0 6 0
                                    80 1 0 110 0 1 1 0 0 0 1 1 0 16 0 1 2 0 66
                                    0 0 1 1 0 0 0 1 1 0 100 0 1 2 0 16 0 0 1 0
                                    0 0 1 1 0 66 0 1 2 0 0 0 43 1 2 0 0 0 111 1
                                    2 0 0 0 0 1 1 0 66 0 78 2 0 0 0 0 1 1 0 107
                                    105 1 1 0 16 0 1 1 1 0 58 102 2 0 0 6 11 76
                                    2 0 41 6 6 42 1 0 0 0 51 2 0 16 0 0 1 1 0
                                    16 0 1 1 0 34 0 79 2 0 104 105 0 1 1 0 66 0
                                    1 2 0 0 0 43 1 2 0 0 0 111 1 2 0 109 0 0 1
                                    1 0 0 105 1 2 0 0 0 0 1 1 0 112 0 1 1 0 0 0
                                    1 2 0 114 114 0 1 1 0 113 0 1 2 0 108 108
                                    108 1 1 0 0 105 1 2 0 0 0 0 1 1 0 14 0 81 1
                                    0 100 0 1 3 0 22 0 0 0 1 2 0 106 0 0 1 2 0
                                    66 0 0 77 2 0 104 105 0 1 1 0 43 0 1 2 0 29
                                    0 0 1 1 0 0 0 40 2 0 0 0 0 1 1 0 58 0 62 1
                                    0 0 63 70 1 0 0 6 33 1 0 0 103 1 1 0 0 0 1
                                    1 0 0 34 57 1 0 91 0 99 0 0 43 55 3 0 0 0 0
                                    0 1 2 0 16 0 0 1 2 0 0 0 0 1 2 0 16 0 0 1 2
                                    0 0 0 34 1 2 0 0 0 43 1 2 0 0 0 111 1 0 0 0
                                    24 0 0 0 31 2 0 16 0 0 71 2 0 0 0 0 1 1 0 0
                                    0 88 2 0 0 0 0 1 2 0 0 0 0 39 2 0 0 6 0 89
                                    2 0 0 0 6 1 2 0 0 0 103 1 2 0 0 103 0 1 2 0
                                    0 43 0 1 2 0 0 34 0 90 2 0 0 0 0 38 2 0 0
                                    111 0 1)))))
           '|lookupComplete|)) 
