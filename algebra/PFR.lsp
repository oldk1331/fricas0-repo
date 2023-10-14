
(SDEFUN |PFR;copypf| ((|a| $) ($ $))
        (CONS (QCAR |a|) (SPADCALL (QCDR |a|) (QREFELT $ 10)))) 

(SDEFUN |PFR;LessThan|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R)))
         (|t| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ |Boolean|))
        (COND ((GGREATERP (QCDR |s|) (QCDR |t|)) 'NIL) ('T 'T))) 

(SDEFUN |PFR;multiplyFracTerms|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R)))
         (|t| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ $))
        (SPROG
         ((|d| ($)) (|c| ($))
          (|coefs| (|Record| (|:| |coef1| R) (|:| |coef2| R)))
          (|i| (|Union| (|Record| (|:| |coef1| R) (|:| |coef2| R)) "failed")))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (QCDR |s|) 1 (QREFELT $ 14))
                      (SPADCALL (QCDR |t|) 1 (QREFELT $ 14)) (QREFELT $ 16))
            (|PFR;normalizeFracTerm|
             (CONS (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 17))
                   (SPADCALL (QCDR |s|) (QCDR |t|) (QREFELT $ 18)))
             $))
           (#1='T
            (SEQ
             (LETT |i|
                   (SPADCALL (SPADCALL (QCDR |t|) (QREFELT $ 19))
                             (SPADCALL (QCDR |s|) (QREFELT $ 19))
                             (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 17))
                             (QREFELT $ 22))
                   . #2=(|PFR;multiplyFracTerms|))
             (EXIT
              (COND ((QEQCAR |i| 1) (|error| "PartialFraction: not in ideal"))
                    (#1#
                     (SEQ (LETT |coefs| (QCDR |i|) . #2#)
                          (LETT |c| (|PFR;copypf| (|spadConstant| $ 23) $)
                                . #2#)
                          (COND
                           ((SPADCALL (QCDR |coefs|) (|spadConstant| $ 24)
                                      (QREFELT $ 25))
                            (LETT |c|
                                  (|PFR;normalizeFracTerm|
                                   (CONS (QCDR |coefs|) (QCDR |t|)) $)
                                  . #2#)))
                          (COND
                           ((SPADCALL (QCAR |coefs|) (|spadConstant| $ 24)
                                      (QREFELT $ 25))
                            (SEQ
                             (LETT |d|
                                   (|PFR;normalizeFracTerm|
                                    (CONS (QCAR |coefs|) (QCDR |s|)) $)
                                   . #2#)
                             (PROGN
                              (RPLACA |c|
                                      (SPADCALL (QCAR |c|) (QCAR |d|)
                                                (QREFELT $ 26)))
                              (QCAR |c|))
                             (EXIT
                              (COND
                               ((NULL (NULL (QCDR |d|)))
                                (PROGN
                                 (RPLACD |c| (APPEND (QCDR |d|) (QCDR |c|)))
                                 (QCDR |c|))))))))
                          (EXIT |c|))))))))))) 

(SDEFUN |PFR;normalizeFracTerm|
        ((|s| |Record| (|:| |num| R) (|:| |den| (|Factored| R))) ($ $))
        (SPROG
         ((|q| #1=(|Record| (|:| |quotient| R) (|:| |remainder| R)))
          (|expon| (|Integer|)) (|nexpon| (|Integer|)) (|f| (R)) (|qr| #1#))
         (SEQ
          (LETT |qr|
                (SPADCALL (QCAR |s|) (SPADCALL (QCDR |s|) (QREFELT $ 19))
                          (QREFELT $ 28))
                . #2=(|PFR;normalizeFracTerm|))
          (EXIT
           (COND
            ((SPADCALL (QCDR |qr|) (|spadConstant| $ 24) (QREFELT $ 16))
             (CONS (QCAR |qr|) NIL))
            (#3='T
             (SEQ (LETT |f| (SPADCALL (QCDR |s|) 1 (QREFELT $ 14)) . #2#)
                  (LETT |nexpon| (SPADCALL (QCDR |s|) 1 (QREFELT $ 29)) . #2#)
                  (LETT |expon| 0 . #2#)
                  (LETT |q| (SPADCALL (QCDR |qr|) |f| (QREFELT $ 28)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL (QCDR |q|) (|spadConstant| $ 24)
                                      (QREFELT $ 16))
                            (< |expon| |nexpon|))
                           ('T 'NIL)))
                         (GO G191)))
                       (SEQ (LETT |expon| (+ |expon| 1) . #2#)
                            (PROGN (RPLACD |qr| (QCAR |q|)) (QCDR |qr|))
                            (EXIT
                             (LETT |q|
                                   (SPADCALL (QCDR |qr|) |f| (QREFELT $ 28))
                                   . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((EQL |expon| 0)
                     (CONS (QCAR |qr|) (LIST (CONS (QCDR |qr|) (QCDR |s|)))))
                    ((EQL |expon| |nexpon|)
                     (SPADCALL
                      (SPADCALL (QCAR |qr|) (QCDR |qr|) (QREFELT $ 26))
                      (QREFELT $ 31)))
                    (#3#
                     (CONS (QCAR |qr|)
                           (LIST
                            (CONS (QCDR |qr|)
                                  (SPADCALL |f| (- |nexpon| |expon|)
                                            (QREFELT $ 32))))))))))))))) 

(SDEFUN |PFR;partialFractionNormalized| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG
         ((|c| ($)) (|d| ($)) (#1=#:G166 NIL) (|i| NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
         (SEQ
          (COND
           ((SPADCALL |nm| (|spadConstant| $ 24) (QREFELT $ 16))
            (|spadConstant| $ 23))
           ((SPADCALL |dn| (|spadConstant| $ 33) (QREFELT $ 34))
            (SPADCALL |nm| (QREFELT $ 31)))
           ('T
            (SEQ
             (LETT |qr|
                   (SPADCALL |nm| (SPADCALL |dn| (QREFELT $ 19))
                             (QREFELT $ 28))
                   . #2=(|PFR;partialFractionNormalized|))
             (LETT |c|
                   (CONS (|spadConstant| $ 24)
                         (LIST
                          (CONS (QCDR |qr|)
                                (SPADCALL (SPADCALL |dn| 1 (QREFELT $ 14))
                                          (SPADCALL |dn| 1 (QREFELT $ 29))
                                          (QREFELT $ 32)))))
                   . #2#)
             (SEQ (LETT |i| 2 . #2#)
                  (LETT #1# (SPADCALL |dn| (QREFELT $ 36)) . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (LETT |d|
                         (CONS (|spadConstant| $ 24)
                               (LIST
                                (CONS (|spadConstant| $ 30)
                                      (SPADCALL
                                       (SPADCALL |dn| |i| (QREFELT $ 14))
                                       (SPADCALL |dn| |i| (QREFELT $ 29))
                                       (QREFELT $ 32)))))
                         . #2#)
                   (EXIT (LETT |c| (SPADCALL |c| |d| (QREFELT $ 37)) . #2#)))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (SPADCALL (QCAR |qr|) (QREFELT $ 31)) |c|
                        (QREFELT $ 38))))))))) 

(SDEFUN |PFR;padicFraction;2$;6| ((|a| $) ($ $))
        (SPROG
         ((|d| (|Integer|)) (|sp| (|SparseUnivariatePolynomial| R))
          (|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (|f| (R)) (|e| (|Integer|)) (#1=#:G178 NIL) (|s| NIL) (|b| ($)))
         (SEQ
          (LETT |b| (SPADCALL |a| (QREFELT $ 39))
                . #2=(|PFR;padicFraction;2$;6|))
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
                             (LETT |e| (SPADCALL (QCDR |s|) 1 (QREFELT $ 29))
                                   . #2#)
                             (EXIT
                              (COND
                               ((EQL |e| 1) (LETT |l| (CONS |s| |l|) . #2#))
                               ('T
                                (SEQ
                                 (LETT |f|
                                       (SPADCALL (QCDR |s|) 1 (QREFELT $ 14))
                                       . #2#)
                                 (LETT |d|
                                       (SPADCALL
                                        (LETT |sp|
                                              (SPADCALL |f| (QCAR |s|)
                                                        (QREFELT $ 41))
                                              . #2#)
                                        (QREFELT $ 42))
                                       . #2#)
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (SPADCALL |sp| (|spadConstant| $ 43)
                                                    (QREFELT $ 44)))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |l|
                                              (CONS
                                               (CONS
                                                (SPADCALL |sp| (QREFELT $ 45))
                                                (SPADCALL |f| (- |e| |d|)
                                                          (QREFELT $ 32)))
                                               |l|)
                                              . #2#)
                                        (EXIT
                                         (LETT |d|
                                               (SPADCALL
                                                (LETT |sp|
                                                      (SPADCALL |sp|
                                                                (QREFELT $ 46))
                                                      . #2#)
                                                (QREFELT $ 42))
                                               . #2#)))
                                       NIL (GO G190) G191 (EXIT NIL))))))))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (CONS (QCAR |b|)
                              (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                                        |l| (QREFELT $ 48))))))))))) 

(SDEFUN |PFR;compactFraction;2$;7| ((|a| $) ($ $))
        (SPROG
         ((|b| ($)) (|e| (|Integer|)) (|f| (R))
          (|s| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))
          (|bf| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (|bw| (R)) (#1=#:G182 NIL) (#2=#:G190 NIL) (|t| NIL)
          (|af| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ
          (COND ((SPADCALL 2 (LENGTH (QCDR |a|)) (QREFELT $ 50)) |a|)
                ('T
                 (SEQ
                  (LETT |af| (REVERSE (QCDR |a|))
                        . #3=(|PFR;compactFraction;2$;7|))
                  (LETT |bf| NIL . #3#) (LETT |bw| (QCAR |a|) . #3#)
                  (LETT |s|
                        (CONS (QCAR (|SPADfirst| |af|))
                              (QCDR (|SPADfirst| |af|)))
                        . #3#)
                  (LETT |f| (SPADCALL (QCDR |s|) 1 (QREFELT $ 14)) . #3#)
                  (LETT |e| (SPADCALL (QCDR |s|) 1 (QREFELT $ 29)) . #3#)
                  (SEQ (LETT |t| NIL . #3#) (LETT #2# (CDR |af|) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |f| (SPADCALL (QCDR |t|) 1 (QREFELT $ 14))
                                     (QREFELT $ 16))
                           (PROGN
                            (RPLACA |s|
                                    (SPADCALL (QCAR |s|)
                                              (SPADCALL (QCAR |t|)
                                                        (SPADCALL |f|
                                                                  (PROG1
                                                                      (LETT #1#
                                                                            (-
                                                                             |e|
                                                                             (SPADCALL
                                                                              (QCDR
                                                                               |t|)
                                                                              1
                                                                              (QREFELT
                                                                               $
                                                                               29)))
                                                                            . #3#)
                                                                    (|check_subtype|
                                                                     (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #1#))
                                                                  (QREFELT $
                                                                           51))
                                                        (QREFELT $ 17))
                                              (QREFELT $ 26)))
                            (QCAR |s|)))
                          ('T
                           (SEQ
                            (LETT |b| (|PFR;normalizeFracTerm| |s| $) . #3#)
                            (LETT |bw|
                                  (SPADCALL |bw| (QCAR |b|) (QREFELT $ 26))
                                  . #3#)
                            (COND
                             ((NULL (NULL (QCDR |b|)))
                              (LETT |bf| (CONS (|SPADfirst| (QCDR |b|)) |bf|)
                                    . #3#)))
                            (LETT |s| (CONS (QCAR |t|) (QCDR |t|)) . #3#)
                            (LETT |f| (SPADCALL (QCDR |s|) 1 (QREFELT $ 14))
                                  . #3#)
                            (EXIT
                             (LETT |e| (SPADCALL (QCDR |s|) 1 (QREFELT $ 29))
                                   . #3#)))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (LETT |b| (|PFR;normalizeFracTerm| |s| $) . #3#)
                  (EXIT
                   (CONS (SPADCALL |bw| (QCAR |b|) (QREFELT $ 26))
                         (APPEND (QCDR |b|) |bf|))))))))) 

(SDEFUN |PFR;Zero;$;8| (($ $)) (CONS (|spadConstant| $ 24) NIL)) 

(SDEFUN |PFR;One;$;9| (($ $)) (CONS (|spadConstant| $ 30) NIL)) 

(SDEFUN |PFR;characteristic;Nni;10| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 52))) 

(PUT '|PFR;coerce;R$;11| '|SPADreplace| '(XLAM (|r|) (CONS |r| NIL))) 

(SDEFUN |PFR;coerce;R$;11| ((|r| R) ($ $)) (CONS |r| NIL)) 

(SDEFUN |PFR;coerce;I$;12| ((|n| |Integer|) ($ $))
        (CONS (SPADCALL |n| (QREFELT $ 54)) NIL)) 

(SDEFUN |PFR;coerce;$F;13| ((|a| $) ($ |Fraction| R))
        (SPROG ((|q| (|Fraction| R)) (#1=#:G204 NIL) (|s| NIL))
               (SEQ
                (LETT |q| (SPADCALL (QCAR |a|) (QREFELT $ 57))
                      . #2=(|PFR;coerce;$F;13|))
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
                                                           (QREFELT $ 19))
                                                 (QREFELT $ 58))
                                       (QREFELT $ 59))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |q|)))) 

(SDEFUN |PFR;coerce;F$;14| ((|q| |Fraction| (|Factored| R)) ($ $))
        (SPROG ((|r1| (R)) (|u| (R)) (#1=#:G207 NIL))
               (SEQ
                (LETT |u|
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT $ 62))
                                           (QREFELT $ 63))
                                 (QREFELT $ 65))
                                . #2=(|PFR;coerce;F$;14|))
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                      . #2#)
                (LETT |r1|
                      (SPADCALL |u|
                                (SPADCALL (SPADCALL |q| (QREFELT $ 66))
                                          (QREFELT $ 19))
                                (QREFELT $ 17))
                      . #2#)
                (EXIT
                 (|PFR;partialFractionNormalized| |r1|
                  (SPADCALL |u| (SPADCALL |q| (QREFELT $ 62)) (QREFELT $ 67))
                  $))))) 

(SDEFUN |PFR;exquo;2$U;15| ((|a| $) (|b| $) ($ |Union| $ "failed"))
        (SPROG ((|br| (|Fraction| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| $ 23) (QREFELT $ 69))
                  (CONS 1 "failed"))
                 ((SPADCALL |b| (|spadConstant| $ 11) (QREFELT $ 69))
                  (CONS 0 |a|))
                 ('T
                  (SEQ
                   (LETT |br|
                         (SPADCALL (SPADCALL |b| (QREFELT $ 60))
                                   (QREFELT $ 70))
                         |PFR;exquo;2$U;15|)
                   (EXIT
                    (CONS 0
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |br| (QREFELT $ 71))
                                              (SPADCALL
                                               (SPADCALL |br| (QREFELT $ 72))
                                               (QREFELT $ 73))
                                              (QREFELT $ 74))
                                    (QREFELT $ 37)))))))))) 

(SDEFUN |PFR;recip;$U;16| ((|a| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 11) |a| (QREFELT $ 75))) 

(SDEFUN |PFR;firstDenom;$F;17| ((|a| $) ($ |Factored| R))
        (COND ((NULL (QCDR |a|)) (|spadConstant| $ 33))
              ('T (QCDR (|SPADfirst| (QCDR |a|)))))) 

(SDEFUN |PFR;firstNumer;$R;18| ((|a| $) ($ R))
        (COND ((NULL (QCDR |a|)) (|spadConstant| $ 24))
              ('T (QCAR (|SPADfirst| (QCDR |a|)))))) 

(SDEFUN |PFR;numberOfFractionalTerms;$I;19| ((|a| $) ($ |Integer|))
        (LENGTH (QCDR |a|))) 

(SDEFUN |PFR;nthFractionalTerm;$I$;20| ((|a| $) (|n| |Integer|) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R))))))
         (SEQ (LETT |l| (QCDR |a|) |PFR;nthFractionalTerm;$I$;20|)
              (COND
               ((OR (< |n| 1) (SPADCALL |n| (LENGTH |l|) (QREFELT $ 50)))
                (EXIT (|spadConstant| $ 23))))
              (EXIT
               (CONS (|spadConstant| $ 24)
                     (LIST (SPADCALL |l| |n| (QREFELT $ 80)))))))) 

(PUT '|PFR;wholePart;$R;21| '|SPADreplace| 'QCAR) 

(SDEFUN |PFR;wholePart;$R;21| ((|a| $) ($ R)) (QCAR |a|)) 

(SDEFUN |PFR;partialFraction;RF$;22| ((|nm| R) (|dn| |Factored| R) ($ $))
        (SPROG ((|u| (R)) (#1=#:G237 NIL))
               (SEQ
                (COND
                 ((SPADCALL |nm| (|spadConstant| $ 24) (QREFELT $ 16))
                  (|spadConstant| $ 23))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL |dn| (QREFELT $ 63))
                         . #2=(|PFR;partialFraction;RF$;22|))
                   (LETT |u|
                         (PROG2 (LETT #1# (SPADCALL |u| (QREFELT $ 65)) . #2#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                         . #2#)
                   (EXIT
                    (|PFR;partialFractionNormalized|
                     (SPADCALL |u| |nm| (QREFELT $ 17))
                     (SPADCALL |u| |dn| (QREFELT $ 67)) $)))))))) 

(SDEFUN |PFR;padicallyExpand;2RSup;23|
        ((|p| R) (|r| R) ($ |SparseUnivariatePolynomial| R))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ
                (LETT |qr| (SPADCALL |r| |p| (QREFELT $ 28))
                      |PFR;padicallyExpand;2RSup;23|)
                (EXIT
                 (COND
                  ((SPADCALL (QCAR |qr|) (|spadConstant| $ 24) (QREFELT $ 16))
                   (SPADCALL (QCDR |qr|) (QREFELT $ 83)))
                  ('T
                   (SPADCALL (SPADCALL (QCDR |qr|) (QREFELT $ 83))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 84))
                              (SPADCALL |p| (QCAR |qr|) (QREFELT $ 41))
                              (QREFELT $ 85))
                             (QREFELT $ 86)))))))) 

(SDEFUN |PFR;=;2$B;24| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 25)) 'NIL)
              ((NULL (QCDR |a|))
               (COND
                ((NULL (QCDR |b|))
                 (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 16)))
                (#1='T 'NIL)))
              ((NULL (QCDR |b|)) 'NIL)
              (#1#
               (SPADCALL (SPADCALL |a| (QREFELT $ 60))
                         (SPADCALL |b| (QREFELT $ 60)) (QREFELT $ 87))))) 

(SDEFUN |PFR;-;2$;25| ((|a| $) ($ $))
        (SPROG
         ((|l| (|List| (|Record| (|:| |num| R) (|:| |den| (|Factored| R)))))
          (#1=#:G256 NIL) (|s| NIL))
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
                            (CONS (SPADCALL (QCAR |s|) (QREFELT $ 88))
                                  (QCDR |s|))
                            |l|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL (QCAR |a|) (QREFELT $ 88)) |l|))))) 

(SDEFUN |PFR;*;R2$;26| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G259 NIL) (|c| ($)) (#2=#:G263 NIL) (|s| NIL) (|b| ($)))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 24) (QREFELT $ 16))
                  (|spadConstant| $ 23))
                 ((SPADCALL |r| (|spadConstant| $ 30) (QREFELT $ 16)) |a|)
                 ('T
                  (SEQ
                   (LETT |b|
                         (SPADCALL (SPADCALL |r| (QCAR |a|) (QREFELT $ 17))
                                   (QREFELT $ 31))
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
                                   (SPADCALL |r| (QCAR |s|) (QREFELT $ 17))
                                   (QCDR |s|))
                                  $)
                                 . #3#)
                           (PROGN
                            (RPLACA |b|
                                    (SPADCALL (QCAR |b|) (QCAR |c|)
                                              (QREFELT $ 26)))
                            (QCAR |b|))
                           (EXIT
                            (COND
                             ((NULL (NULL (QCDR |c|)))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (RPLACD |b|
                                              (APPEND (QCDR |c|) (QCDR |b|)))
                                      (QCDR |b|))
                                     . #3#)
                               (GO #1#)))))))
                         #1# (EXIT #1#))
                        (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                   (EXIT |b|))))))) 

(SDEFUN |PFR;*;I2$;27| ((|n| |Integer|) (|a| $) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 54)) |a| (QREFELT $ 90))) 

(SDEFUN |PFR;+;3$;28| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (CONS (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 26))
               (SPADCALL (CONS (|function| |PFR;LessThan|) $)
                         (APPEND (QCDR |a|)
                                 (SPADCALL (QCDR |b|) (QREFELT $ 10)))
                         (QREFELT $ 48)))
         (QREFELT $ 39))) 

(SDEFUN |PFR;*;3$;29| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c| ($)) (#1=#:G278 NIL) (|t| NIL) (#2=#:G277 NIL) (|s| NIL)
          (|af| ($)))
         (SEQ
          (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) |b| (QREFELT $ 90)))
                ((NULL (QCDR |b|)) (SPADCALL (QCAR |b|) |a| (QREFELT $ 90)))
                ('T
                 (SEQ
                  (LETT |af| (CONS (|spadConstant| $ 24) (QCDR |a|))
                        . #3=(|PFR;*;3$;29|))
                  (LETT |c|
                        (SPADCALL (SPADCALL (QCAR |a|) |b| (QREFELT $ 90))
                                  (SPADCALL (QCAR |b|) |af| (QREFELT $ 90))
                                  (QREFELT $ 38))
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
                                                (QREFELT $ 38))
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |c|))))))) 

(SDEFUN |PFR;coerce;$Of;30| ((|a| $) ($ |OutputForm|))
        (SPROG ((|l| (|List| (|OutputForm|))) (#1=#:G291 NIL) (|s| NIL))
               (SEQ
                (COND ((NULL (QCDR |a|)) (SPADCALL (QCAR |a|) (QREFELT $ 93)))
                      (#2='T
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |a|) (|spadConstant| $ 24)
                                    (QREFELT $ 16))
                          (LETT |l| NIL . #3=(|PFR;coerce;$Of;30|)))
                         (#2#
                          (LETT |l| (LIST (SPADCALL (QCAR |a|) (QREFELT $ 93)))
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
                                ((SPADCALL (QCDR |s|) (|spadConstant| $ 33)
                                           (QREFELT $ 34))
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL (QCAR |s|) (QREFELT $ 93))
                                        |l|)
                                       . #3#))
                                ('T
                                 (LETT |l|
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QCAR |s|) (QREFELT $ 93))
                                         (SPADCALL (QCDR |s|) (QREFELT $ 94))
                                         (QREFELT $ 95))
                                        |l|)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND ((EQL (LENGTH |l|) 1) (|SPADfirst| |l|))
                               (#2#
                                (SPADCALL (ELT $ 96) (REVERSE |l|)
                                          (QREFELT $ 99))))))))))) 

(DECLAIM (NOTINLINE |PartialFraction;|)) 

(DEFUN |PartialFraction| (#1=#:G299)
  (SPROG NIL
         (PROG (#2=#:G300)
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
          (LETT $ (GETREFV 114) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
          $))) 

(MAKEPROP '|PartialFraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Record| (|:| |num| 6) (|:| |den| 13)) (|List| 8) (0 . |copy|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;One;$;9|) $))
              (|Integer|) (|Factored| 6) (5 . |nthFactor|) (|Boolean|) (11 . =)
              (17 . *) (23 . *) (29 . |expand|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 20 '#1="failed") (34 . |extendedEuclidean|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PFR;Zero;$;8|) $))
              (41 . |Zero|) (45 . ~=) (51 . +)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (57 . |divide|)
              (63 . |nthExponent|) (69 . |One|) |PFR;coerce;R$;11|
              (73 . |nilFactor|) (79 . |One|) (83 . =) (|NonNegativeInteger|)
              (89 . |numberOfFactors|) |PFR;*;3$;29| |PFR;+;3$;28|
              |PFR;compactFraction;2$;7| (|SparseUnivariatePolynomial| 6)
              |PFR;padicallyExpand;2RSup;23| (94 . |degree|) (99 . |Zero|)
              (103 . ~=) (109 . |leadingCoefficient|) (114 . |reductum|)
              (|Mapping| 15 8 8) (119 . |sort|) |PFR;padicFraction;2$;6|
              (125 . >) (131 . ^) (137 . |characteristic|)
              |PFR;characteristic;Nni;10| (141 . |coerce|) |PFR;coerce;I$;12|
              (|Fraction| 6) (146 . |coerce|) (151 . /) (157 . +)
              |PFR;coerce;$F;13| (|Fraction| 13) (163 . |denom|) (168 . |unit|)
              (|Union| $ '"failed") (173 . |recip|) (178 . |numer|) (183 . *)
              |PFR;coerce;F$;14| |PFR;=;2$B;24| (189 . |inv|) (194 . |numer|)
              (199 . |denom|) (204 . |coerce|) |PFR;partialFraction;RF$;22|
              |PFR;exquo;2$U;15| |PFR;recip;$U;16| |PFR;firstDenom;$F;17|
              |PFR;firstNumer;$R;18| |PFR;numberOfFractionalTerms;$I;19|
              (209 . |elt|) |PFR;nthFractionalTerm;$I$;20|
              |PFR;wholePart;$R;21| (215 . |coerce|) (220 . |monomial|)
              (226 . *) (232 . +) (238 . =) (244 . -) |PFR;-;2$;25|
              |PFR;*;R2$;26| |PFR;*;I2$;27| (|OutputForm|) (249 . |coerce|)
              (254 . |coerce|) (259 . /) (265 . +) (|Mapping| 92 92 92)
              (|List| 92) (271 . |reduce|) |PFR;coerce;$Of;30| (|Fraction| 12)
              (|Factored| $) (|Union| 104 '#1#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 104) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 277 |zero?| 283 |wholePart| 288 |unitNormal| 293
              |unitCanonical| 298 |unit?| 303 |subtractIfCan| 308
              |squareFreePart| 314 |squareFree| 319 |sizeLess?| 324 |sample|
              330 |rem| 334 |recip| 340 |quo| 345 |principalIdeal| 351 |prime?|
              356 |partialFraction| 361 |padicallyExpand| 367 |padicFraction|
              373 |opposite?| 378 |one?| 384 |numberOfFractionalTerms| 389
              |nthFractionalTerm| 394 |multiEuclidean| 400 |lcmCoef| 406 |lcm|
              412 |latex| 423 |inv| 428 |hashUpdate!| 433 |hash| 439
              |gcdPolynomial| 444 |gcd| 450 |firstNumer| 461 |firstDenom| 466
              |factor| 471 |extendedEuclidean| 476 |exquo| 489
              |expressIdealMember| 495 |euclideanSize| 501 |divide| 506
              |compactFraction| 512 |coerce| 517 |characteristic| 552
              |associates?| 556 |annihilate?| 562 ^ 568 |Zero| 586 |One| 590 =
              594 / 600 - 606 + 617 * 623)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|Field&| |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| |Algebra&| NIL
                |Algebra&| |Module&| |Module&| NIL |EntireRing&| |Module&| NIL
                NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&|
                NIL NIL |AbelianMonoid&| |Monoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6) (|Algebra| 101)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| 6) (|Module| 101)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|BiModule| 6 6) (|BiModule| 101 101) (|BiModule| $$ $$)
                 (|Ring|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 101) (|LeftModule| 101) (|LeftModule| $$)
                 (|Rng|) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 92))
              (|makeByteWordVec2| 113
                                  '(1 9 0 0 10 2 13 6 0 12 14 2 6 15 0 0 16 2 6
                                    0 0 0 17 2 13 0 0 0 18 1 13 6 0 19 3 6 21 0
                                    0 0 22 0 6 0 24 2 6 15 0 0 25 2 6 0 0 0 26
                                    2 6 27 0 0 28 2 13 12 0 12 29 0 6 0 30 2 13
                                    0 6 12 32 0 13 0 33 2 13 15 0 0 34 1 13 35
                                    0 36 1 40 35 0 42 0 40 0 43 2 40 15 0 0 44
                                    1 40 6 0 45 1 40 0 0 46 2 9 0 47 0 48 2 12
                                    15 0 0 50 2 6 0 0 35 51 0 6 35 52 1 6 0 12
                                    54 1 56 0 6 57 2 56 0 6 6 58 2 56 0 0 0 59
                                    1 61 13 0 62 1 13 6 0 63 1 6 64 0 65 1 61
                                    13 0 66 2 13 0 6 0 67 1 56 0 0 70 1 56 6 0
                                    71 1 56 6 0 72 1 13 0 6 73 2 9 8 0 12 80 1
                                    40 0 6 83 2 40 0 6 35 84 2 40 0 0 0 85 2 40
                                    0 0 0 86 2 56 15 0 0 87 1 6 0 0 88 1 6 92 0
                                    93 1 13 92 0 94 2 92 0 0 0 95 2 92 0 0 0 96
                                    2 98 92 97 0 99 2 0 15 0 0 1 1 0 15 0 1 1 0
                                    6 0 82 1 0 109 0 1 1 0 0 0 1 1 0 15 0 1 2 0
                                    64 0 0 1 1 0 0 0 1 1 0 102 0 1 2 0 15 0 0 1
                                    0 0 0 1 2 0 0 0 0 1 1 0 64 0 76 2 0 0 0 0 1
                                    1 0 106 104 1 1 0 15 0 1 2 0 0 6 13 74 2 0
                                    40 6 6 41 1 0 0 0 49 2 0 15 0 0 1 1 0 15 0
                                    1 1 0 12 0 79 2 0 0 0 12 81 2 0 103 104 0 1
                                    2 0 108 0 0 1 1 0 0 104 1 2 0 0 0 0 1 1 0
                                    111 0 1 1 0 0 0 1 2 0 113 113 0 1 1 0 112 0
                                    1 2 0 107 107 107 1 1 0 0 104 1 2 0 0 0 0 1
                                    1 0 6 0 78 1 0 13 0 77 1 0 102 0 1 2 0 105
                                    0 0 1 3 0 21 0 0 0 1 2 0 64 0 0 75 2 0 103
                                    104 0 1 1 0 35 0 1 2 0 27 0 0 1 1 0 0 0 39
                                    1 0 56 0 60 1 0 0 61 68 1 0 0 6 31 1 0 0
                                    101 1 1 0 0 12 55 1 0 0 0 1 1 0 92 0 100 0
                                    0 35 53 2 0 15 0 0 1 2 0 15 0 0 1 2 0 0 0
                                    12 1 2 0 0 0 35 1 2 0 0 0 110 1 0 0 0 23 0
                                    0 0 11 2 0 15 0 0 69 2 0 0 0 0 1 1 0 0 0 89
                                    2 0 0 0 0 1 2 0 0 0 0 38 2 0 0 6 0 90 2 0 0
                                    0 6 1 2 0 0 0 101 1 2 0 0 101 0 1 2 0 0 12
                                    0 91 2 0 0 0 0 37 2 0 0 35 0 1 2 0 0 110 0
                                    1)))))
           '|lookupComplete|)) 
