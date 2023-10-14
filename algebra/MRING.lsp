
(PUT '|MRING;coerce;L$;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MRING;coerce;L$;1|
        ((|x| |List| (|Record| (|:| |coef| R) (|:| |monom| M))) ($ $)) |x|) 

(SDEFUN |MRING;monomial;RM$;2| ((|r| R) (|m| M) ($ $))
        (COND ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15)) NIL)
              ('T (LIST (CONS |r| |m|))))) 

(SDEFUN |MRING;size;Nni;3| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 18)) (SPADCALL (QREFELT $ 19)))) 

(SDEFUN |MRING;index;Pi$;4| ((|k| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|m| (M)) (#1=#:G152 NIL) (|c| (R))
          (#2=#:G150 NIL) (|h| (|Integer|)) (|j| NIL) (|n| (|Integer|))
          (|p| (|Integer|)))
         (SEQ
          (LETT |i| (REM |k| (SPADCALL (QREFELT $ 20)))
                . #3=(|MRING;index;Pi$;4|))
          (LETT |p| (SPADCALL (QREFELT $ 18)) . #3#)
          (LETT |n| (SPADCALL (QREFELT $ 19)) . #3#)
          (LETT |ans| (|spadConstant| $ 12) . #3#)
          (SEQ (LETT |j| 0 . #3#) G190
               (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 22))) (GO G191)))
               (SEQ (LETT |h| (REM |i| |p|) . #3#)
                    (COND
                     ((SPADCALL |h| 0 (QREFELT $ 23))
                      (SEQ
                       (LETT |c|
                             (SPADCALL
                              (PROG1 (LETT #2# |h| . #3#)
                                (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                                 #2#))
                              (QREFELT $ 25))
                             . #3#)
                       (LETT |m|
                             (SPADCALL
                              (PROG1 (LETT #1# (+ |j| |n|) . #3#)
                                (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                                 #1#))
                              (QREFELT $ 26))
                             . #3#)
                       (EXIT
                        (LETT |ans|
                              (SPADCALL |ans| (SPADCALL |c| |m| (QREFELT $ 16))
                                        (QREFELT $ 27))
                              . #3#)))))
                    (EXIT (LETT |i| (QUOTIENT2 |i| |p|) . #3#)))
               (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MRING;lookup;$Pi;5| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|res| (|Integer|)) (|co| (|Integer|))
          (|ex| #1=(|NonNegativeInteger|)) (|l| #1#) (#2=#:G165 NIL) (|te| NIL)
          (|n| (|Integer|)) (|p| (|Integer|))
          (|liTe| (|List| (|Record| (|:| |coef| R) (|:| |monom| M)))))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 29)) (SPADCALL (QREFELT $ 20)))
                ('T
                 (SEQ
                  (LETT |liTe| (SPADCALL |z| (QREFELT $ 30))
                        . #3=(|MRING;lookup;$Pi;5|))
                  (LETT |p| (SPADCALL (QREFELT $ 18)) . #3#)
                  (LETT |n| (SPADCALL (QREFELT $ 19)) . #3#)
                  (LETT |res| 0 . #3#)
                  (SEQ (LETT |te| NIL . #3#) (LETT #2# |liTe| . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |te| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |l| (SPADCALL (QCDR |te|) (QREFELT $ 31)) . #3#)
                        (LETT |ex| (COND ((EQL |n| |l|) 0) ('T |l|)) . #3#)
                        (LETT |co| (SPADCALL (QCAR |te|) (QREFELT $ 32)) . #3#)
                        (EXIT
                         (LETT |res| (+ |res| (* |co| (EXPT |p| |ex|)))
                               . #3#)))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(PUT '|MRING;Zero;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |MRING;Zero;$;6| (($ $)) NIL) 

(SDEFUN |MRING;One;$;7| (($ $))
        (LIST (CONS (|spadConstant| $ 35) (|spadConstant| $ 36)))) 

(SDEFUN |MRING;terms;$L;8|
        ((|a| $) ($ |List| (|Record| (|:| |coef| R) (|:| |monom| M))))
        (SPADCALL |a| (QREFELT $ 37))) 

(SDEFUN |MRING;monomials;$L;9| ((|a| $) ($ |List| $))
        (SPROG ((#1=#:G175 NIL) (|t| NIL) (#2=#:G174 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;monomials;$L;9|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (LIST |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;coefficients;$L;10| ((|a| $) ($ |List| R))
        (SPROG ((#1=#:G180 NIL) (|t| NIL) (#2=#:G179 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;coefficients;$L;10|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;coerce;M$;11| ((|m| M) ($ $))
        (LIST (CONS (|spadConstant| $ 35) |m|))) 

(SDEFUN |MRING;coerce;R$;12| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
          (|spadConstant| $ 12))
         ('T (LIST (CONS |r| (|spadConstant| $ 36)))))) 

(SDEFUN |MRING;coerce;I$;13| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 12))
              ('T
               (LIST
                (CONS (SPADCALL |n| (QREFELT $ 44)) (|spadConstant| $ 36)))))) 

(SDEFUN |MRING;-;2$;14| ((|a| $) ($ $))
        (SPROG ((#1=#:G191 NIL) (|t| NIL) (#2=#:G190 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;-;2$;14|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL (QCAR |t|) (QREFELT $ 46))
                                     (QCDR |t|))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;*;R2$;15| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G196 NIL) (|t| NIL) (#2=#:G195 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|spadConstant| $ 12))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|MRING;*;R2$;15|))
                   (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS (SPADCALL |r| (QCAR |t|) (QREFELT $ 48))
                                       (QCDR |t|))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;R2$;16| ((|r| R) (|a| $) ($ $))
        (SPROG ((|rt| (R)) (#1=#:G201 NIL) (|t| NIL) (#2=#:G200 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|spadConstant| $ 12))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|MRING;*;R2$;16|))
                   (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LETT |rt|
                                   (SPADCALL |r| (QCAR |t|) (QREFELT $ 48))
                                   . #3#)
                             (|spadConstant| $ 13) (QREFELT $ 50))
                            (LETT #2# (CONS (CONS |rt| (QCDR |t|)) #2#)
                                  . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;17| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((#1=#:G206 NIL) (|t| NIL) (#2=#:G205 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 12))
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|MRING;*;I2$;17|))
                        (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS
                                       (SPADCALL |n| (QCAR |t|) (QREFELT $ 51))
                                       (QCDR |t|))
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;18| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((|nt| (R)) (#1=#:G211 NIL) (|t| NIL) (#2=#:G210 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 12))
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|MRING;*;I2$;18|))
                        (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |nt|
                                        (SPADCALL |n| (QCAR |t|)
                                                  (QREFELT $ 51))
                                        . #3#)
                                  (|spadConstant| $ 13) (QREFELT $ 50))
                                 (LETT #2# (CONS (CONS |nt| (QCDR |t|)) #2#)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;map;M2$;19| ((|f| |Mapping| R R) (|a| $) ($ $))
        (SPROG ((|ft| (R)) (#1=#:G217 NIL) (|t| NIL) (#2=#:G216 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;map;M2$;19|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |ft| (SPADCALL (QCAR |t|) |f|) . #3#)
                                    (|spadConstant| $ 13) (QREFELT $ 50))
                          (LETT #2# (CONS (CONS |ft| (QCDR |t|)) #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|MRING;numberOfMonomials;$Nni;20| '|SPADreplace| 'LENGTH) 

(SDEFUN |MRING;numberOfMonomials;$Nni;20| ((|a| $) ($ |NonNegativeInteger|))
        (LENGTH |a|)) 

(SDEFUN |MRING;retractIfCan;$U;21| ((|a| $) ($ |Union| M "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 35)
                       (QREFELT $ 15))
             (EXIT (CONS 0 (QCDR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;retractIfCan;$U;22| ((|a| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCDR (|SPADfirst| |a|)) (|spadConstant| $ 36)
                       (QREFELT $ 58))
             (EXIT (CONS 0 (QCAR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;recip;$U;23| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)) (|lt| ($)))
               (SEQ
                (LETT |lt| (SPADCALL |a| (QREFELT $ 30))
                      . #2=(|MRING;recip;$U;23|))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |lt|) 1 (QREFELT $ 61)) (CONS 1 "failed"))
                  (#3='T
                   (SEQ
                    (LETT |u|
                          (SPADCALL (QCAR (|SPADfirst| |lt|)) (QREFELT $ 63))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           (#3#
                            (CONS 0
                                  (SPADCALL (QCDR |u|)
                                            (SPADCALL (QCDR (|SPADfirst| |lt|))
                                                      (QREFELT $ 64))
                                            (QREFELT $ 16))))))))))))) 

(SDEFUN |MRING;recip;$U;24| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL (LENGTH |a|) 1 (QREFELT $ 61))
                      (SPADCALL (QCDR (|SPADfirst| |a|)) (|spadConstant| $ 36)
                                (QREFELT $ 66)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL (QCAR (|SPADfirst| |a|)) (QREFELT $ 63))
                         |MRING;recip;$U;24|)
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 43)))))))))))) 

(SDEFUN |MRING;mkTerm| ((|r| R) (|m| M) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 35) (QREFELT $ 15))
          (SPADCALL |m| (QREFELT $ 68)))
         ((OR (SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
              (SPADCALL |m| (|spadConstant| $ 36) (QREFELT $ 58)))
          (SPADCALL |r| (QREFELT $ 69)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 69)) (SPADCALL |m| (QREFELT $ 68))
                    (QREFELT $ 70))))) 

(SDEFUN |MRING;coerce;$Of;26| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G272 NIL) (|t| NIL) (#2=#:G271 NIL))
               (SEQ
                (COND ((NULL |a|) (SPADCALL 0 (QREFELT $ 71)))
                      ((NULL (CDR |a|))
                       (|MRING;mkTerm| (QCAR (|SPADfirst| |a|))
                        (QCDR (|SPADfirst| |a|)) $))
                      ('T
                       (SPADCALL (ELT $ 72)
                                 (PROGN
                                  (LETT #2# NIL . #3=(|MRING;coerce;$Of;26|))
                                  (SEQ (LETT |t| NIL . #3#)
                                       (LETT #1# |a| . #3#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |t| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (|MRING;mkTerm| (QCAR |t|)
                                                 (QCDR |t|) $)
                                                #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 75))))))) 

(SDEFUN |MRING;leadingCoefficient;$R;27| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 13)) ('T (QCAR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingMonomial;$M;28| ((|a| $) ($ M))
        (COND ((NULL |a|) (|spadConstant| $ 36)) ('T (QCDR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;reductum;2$;29| ((|a| $) ($ $))
        (COND ((NULL |a|) |a|) ('T (CDR |a|)))) 

(SDEFUN |MRING;=;2$B;30| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G284 NIL) (#2=#:G287 NIL) (#3=#:G288 NIL) (|ta| NIL)
          (#4=#:G289 NIL) (|tb| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 61)) 'NIL)
                 ('T
                  (SEQ
                   (SEQ
                    (EXIT
                     (SEQ (LETT |tb| NIL . #5=(|MRING;=;2$B;30|))
                          (LETT #4# |b| . #5#) (LETT |ta| NIL . #5#)
                          (LETT #3# |a| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |ta| (CAR #3#) . #5#) NIL)
                                (ATOM #4#)
                                (PROGN (LETT |tb| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((OR
                               (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                         (QREFELT $ 50))
                               (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                         (QREFELT $ 66)))
                              (PROGN
                               (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                     . #5#)
                               (GO #1#))))))
                          (LETT #3#
                                (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL)))
                    #1# (EXIT #1#))
                   (EXIT 'T)))))
          #2# (EXIT #2#)))) 

(SDEFUN |MRING;+;3$;31| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c| ($)) (|r| (R)) (|rb| ($)) (|ra| ($))
          (|tb| #1=(|Record| (|:| |coef| R) (|:| |monom| M))) (|ta| #1#))
         (SEQ (LETT |c| NIL . #2=(|MRING;+;3$;31|))
              (SEQ G190
                   (COND
                    ((NULL (COND ((OR (NULL |a|) (NULL |b|)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |ta| (|SPADfirst| |a|) . #2#)
                        (LETT |tb| (|SPADfirst| |b|) . #2#)
                        (LETT |ra| (CDR |a|) . #2#) (LETT |rb| (CDR |b|) . #2#)
                        (EXIT
                         (LETT |c|
                               (COND
                                ((SPADCALL (QCDR |ta|) (QCDR |tb|)
                                           (QREFELT $ 81))
                                 (SEQ (LETT |a| |ra| . #2#)
                                      (EXIT
                                       (SPADCALL |c| |ta| (QREFELT $ 82)))))
                                ((SPADCALL (QCDR |ta|) (QCDR |tb|)
                                           (QREFELT $ 83))
                                 (SEQ (LETT |b| |rb| . #2#)
                                      (EXIT
                                       (SPADCALL |c| |tb| (QREFELT $ 82)))))
                                ('T
                                 (SEQ (LETT |a| |ra| . #2#)
                                      (LETT |b| |rb| . #2#)
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (LETT |r|
                                                (SPADCALL (QCAR |ta|)
                                                          (QCAR |tb|)
                                                          (QREFELT $ 84))
                                                . #2#)
                                          (QREFELT $ 85)))
                                        (EXIT
                                         (SPADCALL |c| (CONS |r| (QCDR |ta|))
                                                   (QREFELT $ 82)))))
                                      (EXIT |c|))))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |c| (SPADCALL |a| |b| (QREFELT $ 86))
                         (QREFELT $ 87)))))) 

(SDEFUN |MRING;coefficient;$MR;32| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G308 NIL) (#2=#:G309 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |t| NIL . #3=(|MRING;coefficient;$MR;32|))
                       (LETT #2# |a| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCDR |t|) |m| (QREFELT $ 58))
                          (PROGN (LETT #1# (QCAR |t|) . #3#) (GO #1#))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |t|) |m| (QREFELT $ 83))
                           (PROGN
                            (LETT #1# (|spadConstant| $ 13) . #3#)
                            (GO #1#))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 13))))
                #1# (EXIT #1#)))) 

(SDEFUN |MRING;*;3$;33| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G312 NIL) (#2=#:G311 ($)) (#3=#:G313 ($)) (#4=#:G318 NIL)
          (|tb| NIL) (#5=#:G317 NIL) (#6=#:G316 NIL) (|ta| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|MRING;*;3$;33|))
           (SEQ (LETT |ta| NIL . #7#) (LETT #6# (REVERSE |a|) . #7#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |ta| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (PROGN
                          (LETT #5# NIL . #7#)
                          (SEQ (LETT |tb| NIL . #7#) (LETT #4# |b| . #7#) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |tb| (CAR #4#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                   (QREFELT $ 48))
                                         (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                                   (QREFELT $ 89)))
                                        #5#)
                                       . #7#)))
                               (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 27)) . #7#))
                    ('T (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |MRING;*;3$;34| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G321 NIL) (#2=#:G320 ($)) (#3=#:G322 ($)) (|r| (R))
          (#4=#:G328 NIL) (|tb| NIL) (#5=#:G327 NIL) (#6=#:G326 NIL)
          (|ta| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|MRING;*;3$;34|))
           (SEQ (LETT |ta| NIL . #7#) (LETT #6# (REVERSE |a|) . #7#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |ta| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (PROGN
                          (LETT #5# NIL . #7#)
                          (SEQ (LETT |tb| NIL . #7#) (LETT #4# |b| . #7#) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |tb| (CAR #4#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((COND
                                    ((SPADCALL
                                      (LETT |r|
                                            (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                      (QREFELT $ 48))
                                            . #7#)
                                      (QREFELT $ 85))
                                     'NIL)
                                    ('T 'T))
                                   (LETT #5#
                                         (CONS
                                          (CONS |r|
                                                (SPADCALL (QCDR |ta|)
                                                          (QCDR |tb|)
                                                          (QREFELT $ 89)))
                                          #5#)
                                         . #7#)))))
                               (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 27)) . #7#))
                    ('T (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |MRING;ge|
        ((|s| |Record| (|:| |coef| R) (|:| |monom| M))
         (|t| |Record| (|:| |coef| R) (|:| |monom| M)) ($ |Boolean|))
        (SPADCALL (QCDR |t|) (QCDR |s|) (QREFELT $ 91))) 

(SDEFUN |MRING;sortAndAdd|
        ((|liTe| |List| (|Record| (|:| |coef| R) (|:| |monom| M)))
         ($ |List| (|Record| (|:| |coef| R) (|:| |monom| M))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |coef| R) (|:| |monom| M)))) (|cf| (R))
          (|m| (M)) (#1=#:G341 NIL) (|te| NIL))
         (SEQ
          (LETT |liTe|
                (SPADCALL (CONS (|function| |MRING;ge|) $) |liTe|
                          (QREFELT $ 93))
                . #2=(|MRING;sortAndAdd|))
          (LETT |m| (QCDR (|SPADfirst| |liTe|)) . #2#)
          (LETT |cf| (QCAR (|SPADfirst| |liTe|)) . #2#) (LETT |res| NIL . #2#)
          (SEQ (LETT |te| NIL . #2#) (LETT #1# (CDR |liTe|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |te| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |m| (QCDR |te|) (QREFELT $ 58))
                   (LETT |cf| (SPADCALL |cf| (QCAR |te|) (QREFELT $ 84))
                         . #2#))
                  ('T
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |cf| (QREFELT $ 85)))
                      (LETT |res| (CONS (CONS |cf| |m|) |res|) . #2#)))
                    (LETT |m| (QCDR |te|) . #2#)
                    (EXIT (LETT |cf| (QCAR |te|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (SPADCALL |cf| (QREFELT $ 85)))
            (LETT |res| (CONS (CONS |cf| |m|) |res|) . #2#)))
          (EXIT (REVERSE |res|))))) 

(SDEFUN |MRING;*;3$;37| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G344 NIL) (#2=#:G343 ($)) (#3=#:G345 ($)) (#4=#:G356 NIL)
          (|tb| NIL) (#5=#:G355 NIL) (#6=#:G354 NIL) (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 29)) |a|)
                ((SPADCALL |b| (QREFELT $ 29)) |b|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL . #8=(|MRING;*;3$;37|))
                  (SEQ (LETT |ta| NIL . #8#) (LETT #6# (REVERSE |a|) . #8#)
                       G190
                       (COND
                        ((OR (ATOM #6#)
                             (PROGN (LETT |ta| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (|MRING;sortAndAdd|
                                 (PROGN
                                  (LETT #5# NIL . #8#)
                                  (SEQ (LETT |tb| NIL . #8#)
                                       (LETT #4# |b| . #8#) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN
                                              (LETT |tb| (CAR #4#) . #8#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |ta|)
                                                           (QCAR |tb|)
                                                           (QREFELT $ 48))
                                                 (SPADCALL (QCDR |ta|)
                                                           (QCDR |tb|)
                                                           (QREFELT $ 89)))
                                                #5#)
                                               . #8#)))
                                       (LETT #4# (CDR #4#) . #8#) (GO G190)
                                       G191 (EXIT (NREVERSE #5#))))
                                 $)
                                . #8#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 27)) . #8#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #8#)
                             (LETT #1# 'T . #8#)))))))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 12))))))))) 

(SDEFUN |MRING;*;3$;38| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G359 NIL) (#2=#:G358 ($)) (#3=#:G360 ($)) (|r| (R))
          (#4=#:G376 NIL) (|tb| NIL) (#5=#:G375 NIL) (#6=#:G374 NIL)
          (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 29)) |a|)
                ((SPADCALL |b| (QREFELT $ 29)) |b|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL . #8=(|MRING;*;3$;38|))
                  (SEQ (LETT |ta| NIL . #8#) (LETT #6# (REVERSE |a|) . #8#)
                       G190
                       (COND
                        ((OR (ATOM #6#)
                             (PROGN (LETT |ta| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (|MRING;sortAndAdd|
                                 (PROGN
                                  (LETT #5# NIL . #8#)
                                  (SEQ (LETT |tb| NIL . #8#)
                                       (LETT #4# |b| . #8#) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN
                                              (LETT |tb| (CAR #4#) . #8#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((COND
                                            ((SPADCALL
                                              (LETT |r|
                                                    (SPADCALL (QCAR |ta|)
                                                              (QCAR |tb|)
                                                              (QREFELT $ 48))
                                                    . #8#)
                                              (QREFELT $ 85))
                                             'NIL)
                                            ('T 'T))
                                           (LETT #5#
                                                 (CONS
                                                  (CONS |r|
                                                        (SPADCALL (QCDR |ta|)
                                                                  (QCDR |tb|)
                                                                  (QREFELT $
                                                                           89)))
                                                  #5#)
                                                 . #8#)))))
                                       (LETT #4# (CDR #4#) . #8#) (GO G190)
                                       G191 (EXIT (NREVERSE #5#))))
                                 $)
                                . #8#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 27)) . #8#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #8#)
                             (LETT #1# 'T . #8#)))))))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 12))))))))) 

(SDEFUN |MRING;=;2$B;39| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 61)) 'NIL)
              ('T
               (SPADCALL (SPADCALL |a| (QREFELT $ 95))
                         (SPADCALL |b| (QREFELT $ 95)) (QREFELT $ 96))))) 

(SDEFUN |MRING;coefficient;$MR;40| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G383 NIL) (#2=#:G385 NIL) (#3=#:G386 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |t| NIL . #4=(|MRING;coefficient;$MR;40|))
                         (LETT #3# |a| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |t| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCDR |t|) |m| (QREFELT $ 58))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (QCAR |t|) . #4#)
                                     (GO #2#))
                                    . #4#)
                              (GO #1#))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #1# (EXIT #1#))
                  (EXIT (|spadConstant| $ 13))))
                #2# (EXIT #2#)))) 

(SDEFUN |MRING;addterm| ((|Tabl| |AssociationList| M R) (|r| R) (|m| M) ($ R))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ
                (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 98))
                      . #1=(|MRING;addterm|))
                (EXIT
                 (COND
                  ((OR (QEQCAR |u| 1)
                       (NULL
                        (SPADCALL
                         (LETT |r| (SPADCALL |r| (QCDR |u|) (QREFELT $ 84))
                               . #1#)
                         (QREFELT $ 85))))
                   (SPADCALL |Tabl| |m| |r| (QREFELT $ 99)))
                  ('T
                   (SEQ (SPADCALL |m| |Tabl| (QREFELT $ 100))
                        (EXIT (|spadConstant| $ 13))))))))) 

(SDEFUN |MRING;+;3$;42| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G404 NIL) (|m| NIL) (#2=#:G403 NIL) (#3=#:G402 NIL) (|t| NIL)
          (#4=#:G401 NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 101)) . #5=(|MRING;+;3$;42|))
              (SEQ (LETT |t| NIL . #5#) (LETT #4# |a| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |Tabl| (QCDR |t|) (QCAR |t|) (QREFELT $ 99))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |t| NIL . #5#) (LETT #3# |b| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (|MRING;addterm| |Tabl| (QCAR |t|) (QCDR |t|) $)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |m| NIL . #5#)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 103)) . #5#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS (SPADCALL |Tabl| |m| (QREFELT $ 104)) |m|)
                              #2#)
                             . #5#)))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MRING;*;3$;43| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G414 NIL) (|m| NIL) (#2=#:G413 NIL) (#3=#:G412 NIL) (|tb| NIL)
          (#4=#:G411 NIL) (|ta| NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 101)) . #5=(|MRING;*;3$;43|))
              (SEQ (LETT |ta| NIL . #5#) (LETT #4# |a| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |ta| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |tb| NIL . #5#) (LETT #3# |b| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |tb| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (|MRING;addterm| |Tabl|
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 48))
                             (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 89))
                             $)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |m| NIL . #5#)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 103)) . #5#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS (SPADCALL |Tabl| |m| (QREFELT $ 104)) |m|)
                              #2#)
                             . #5#)))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |MonoidRing;|)) 

(DEFUN |MonoidRing| (&REST #1=#:G415)
  (SPROG NIL
         (PROG (#2=#:G416)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MonoidRing|)
                                               '|domainEqualList|)
                    . #3=(|MonoidRing|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MonoidRing;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|MonoidRing|)))))))))) 

(DEFUN |MonoidRing;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MonoidRing|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|MonoidRing| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 109) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|MonoidRing| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List| (|Record| (|:| |coef| |#1|) (|:| |monom| |#2|))))
          (COND
           ((|HasCategory| |#1| '(|Finite|))
            (COND
             ((|HasCategory| |#2| '(|Finite|))
              (PROGN
               (QSETREFV $ 20 (CONS (|dispatchFunction| |MRING;size;Nni;3|) $))
               (QSETREFV $ 28
                         (CONS (|dispatchFunction| |MRING;index;Pi$;4|) $))
               (QSETREFV $ 33
                         (CONS (|dispatchFunction| |MRING;lookup;$Pi;5|)
                               $)))))))
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 49 (CONS (|dispatchFunction| |MRING;*;R2$;15|) $)))
           ('T (QSETREFV $ 49 (CONS (|dispatchFunction| |MRING;*;R2$;16|) $))))
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 52 (CONS (|dispatchFunction| |MRING;*;I2$;17|) $)))
           ('T (QSETREFV $ 52 (CONS (|dispatchFunction| |MRING;*;I2$;18|) $))))
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (COND
             ((|HasCategory| |#2| '(|Group|))
              (QSETREFV $ 65
                        (CONS (|dispatchFunction| |MRING;recip;$U;23|) $)))
             ('T
              (QSETREFV $ 65
                        (CONS (|dispatchFunction| |MRING;recip;$U;24|) $))))))
          (COND
           ((|testBitVector| |pv$| 5)
            (PROGN
             (QSETREFV $ 77
                       (CONS
                        (|dispatchFunction| |MRING;leadingCoefficient;$R;27|)
                        $))
             (QSETREFV $ 78
                       (CONS (|dispatchFunction| |MRING;leadingMonomial;$M;28|)
                             $))
             (QSETREFV $ 79
                       (CONS (|dispatchFunction| |MRING;reductum;2$;29|) $))
             (QSETREFV $ 80 (CONS (|dispatchFunction| |MRING;=;2$B;30|) $))
             (QSETREFV $ 27 (CONS (|dispatchFunction| |MRING;+;3$;31|) $))
             (QSETREFV $ 88
                       (CONS (|dispatchFunction| |MRING;coefficient;$MR;32|)
                             $))
             (COND
              ((|HasCategory| |#2| '(|OrderedMonoid|))
               (COND
                ((|HasCategory| |#1| '(|noZeroDivisors|))
                 (QSETREFV $ 90 (CONS (|dispatchFunction| |MRING;*;3$;33|) $)))
                ('T
                 (QSETREFV $ 90
                           (CONS (|dispatchFunction| |MRING;*;3$;34|) $)))))
              ('T
               (PROGN
                (COND
                 ((|HasCategory| |#1| '(|noZeroDivisors|))
                  (QSETREFV $ 90
                            (CONS (|dispatchFunction| |MRING;*;3$;37|) $)))
                 ('T
                  (QSETREFV $ 90
                            (CONS (|dispatchFunction| |MRING;*;3$;38|)
                                  $)))))))))
           ('T
            (PROGN
             (QSETREFV $ 80 (CONS (|dispatchFunction| |MRING;=;2$B;39|) $))
             (QSETREFV $ 88
                       (CONS (|dispatchFunction| |MRING;coefficient;$MR;40|)
                             $))
             (QSETREFV $ 27 (CONS (|dispatchFunction| |MRING;+;3$;42|) $))
             (QSETREFV $ 90 (CONS (|dispatchFunction| |MRING;*;3$;43|) $)))))
          $))) 

(MAKEPROP '|MonoidRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Record| (|:| |coef| 6) (|:| |monom| 7)) (|List| 9)
              |MRING;coerce;L$;1|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MRING;Zero;$;6|) $))
              (0 . |Zero|) (|Boolean|) (4 . =) |MRING;monomial;RM$;2|
              (|NonNegativeInteger|) (10 . |size|) (14 . |size|) (18 . |size|)
              (|Integer|) (22 . >) (28 . ~=) (|PositiveInteger|) (34 . |index|)
              (39 . |index|) (44 . +) (50 . |index|) (55 . |zero?|)
              |MRING;terms;$L;8| (60 . |lookup|) (65 . |lookup|)
              (70 . |lookup|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MRING;One;$;7|) $))
              (75 . |One|) (79 . |One|) (83 . |copy|) (|List| $)
              |MRING;monomials;$L;9| (|List| 6) |MRING;coefficients;$L;10|
              |MRING;coerce;M$;11| |MRING;coerce;R$;12| (88 . |coerce|)
              |MRING;coerce;I$;13| (93 . -) |MRING;-;2$;14| (98 . *) (104 . *)
              (110 . ~=) (116 . *) (122 . *) (|Mapping| 6 6) |MRING;map;M2$;19|
              |MRING;numberOfMonomials;$Nni;20| (|Union| 7 '"failed")
              |MRING;retractIfCan;$U;21| (128 . =) (|Union| 6 '"failed")
              |MRING;retractIfCan;$U;22| (134 . ~=) (|Union| $ '"failed")
              (140 . |recip|) (145 . |inv|) (150 . |recip|) (155 . ~=)
              (|OutputForm|) (161 . |coerce|) (166 . |coerce|) (171 . *)
              (177 . |coerce|) (182 . +) (|Mapping| 67 67 67) (|List| 67)
              (188 . |reduce|) |MRING;coerce;$Of;26|
              (194 . |leadingCoefficient|) (199 . |leadingMonomial|)
              (204 . |reductum|) (209 . =) (215 . >) (221 . |concat!|)
              (227 . <) (233 . +) (239 . |zero?|) (244 . |concat|)
              (250 . |concat!|) (256 . |coefficient|) (262 . *) (268 . *)
              (274 . <=) (|Mapping| 14 9 9) (280 . |sort|) (|Set| 9)
              (286 . |brace|) (291 . =) (|AssociationList| 7 6)
              (297 . |search|) (303 . |setelt|) (310 . |remove!|)
              (316 . |table|) (|List| 7) (320 . |keys|) (325 . |elt|)
              (|InputForm|) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 331 |zero?| 337 |terms| 342 |subtractIfCan| 347 |size| 353
              |sample| 357 |retractIfCan| 361 |retract| 371 |reductum| 381
              |recip| 386 |random| 391 |opposite?| 395 |one?| 401
              |numberOfMonomials| 406 |monomials| 411 |monomial?| 416
              |monomial| 421 |map| 427 |lookup| 433 |leadingMonomial| 438
              |leadingCoefficient| 443 |latex| 448 |index| 453 |hashUpdate!|
              458 |hash| 464 |enumerate| 469 |convert| 473 |coerce| 478
              |coefficients| 503 |coefficient| 508 |charthRoot| 514
              |characteristic| 519 |annihilate?| 523 ^ 529 |Zero| 541 |One| 545
              = 549 - 555 + 566 * 572)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 2 2 3 4 0 2 0 0 2 2 0 0 0 0 0 0 0 0 1 0 0 0
                                  0 0 0 1))
            (CONS
             '#(NIL |Algebra&| |Module&| NIL NIL |Ring&| NIL |Rng&| NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |Finite&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL |BasicType&| NIL NIL)
             (CONS
              '#((|MonoidRingCategory| 6 7) (|Algebra| 6) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Ring|)
                 (|BiModule| 6 6) (|Rng|) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Finite|) (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| 7) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 67) (|ConvertibleTo| 105))
              (|makeByteWordVec2| 108
                                  '(0 6 0 13 2 6 14 0 0 15 0 6 17 18 0 7 17 19
                                    0 0 17 20 2 21 14 0 0 22 2 21 14 0 0 23 1 6
                                    0 24 25 1 7 0 24 26 2 0 0 0 0 27 1 0 0 24
                                    28 1 0 14 0 29 1 7 24 0 31 1 6 24 0 32 1 0
                                    24 0 33 0 6 0 35 0 7 0 36 1 8 0 0 37 1 6 0
                                    21 44 1 6 0 0 46 2 6 0 0 0 48 2 0 0 6 0 49
                                    2 6 14 0 0 50 2 6 0 21 0 51 2 0 0 21 0 52 2
                                    7 14 0 0 58 2 17 14 0 0 61 1 6 62 0 63 1 7
                                    0 0 64 1 0 62 0 65 2 7 14 0 0 66 1 7 67 0
                                    68 1 6 67 0 69 2 67 0 0 0 70 1 21 67 0 71 2
                                    67 0 0 0 72 2 74 67 73 0 75 1 0 6 0 77 1 0
                                    7 0 78 1 0 0 0 79 2 0 14 0 0 80 2 7 14 0 0
                                    81 2 8 0 0 9 82 2 7 14 0 0 83 2 6 0 0 0 84
                                    1 6 14 0 85 2 8 0 0 0 86 2 8 0 0 0 87 2 0 6
                                    0 7 88 2 7 0 0 0 89 2 0 0 0 0 90 2 7 14 0 0
                                    91 2 10 0 92 0 93 1 94 0 10 95 2 94 14 0 0
                                    96 2 97 59 7 0 98 3 97 6 0 7 6 99 2 97 59 7
                                    0 100 0 97 0 101 1 97 102 0 103 2 97 6 0 7
                                    104 2 0 14 0 0 1 1 0 14 0 29 1 0 10 0 30 2
                                    0 62 0 0 1 0 1 17 20 0 0 0 1 1 0 59 0 60 1
                                    0 56 0 57 1 0 6 0 1 1 0 7 0 1 1 5 0 0 79 1
                                    0 62 0 65 0 1 0 1 2 0 14 0 0 1 1 0 14 0 1 1
                                    0 17 0 55 1 0 38 0 39 1 0 14 0 1 2 0 0 6 7
                                    16 2 0 0 53 0 54 1 1 24 0 33 1 5 7 0 78 1 5
                                    6 0 77 1 0 107 0 1 1 1 0 24 28 2 0 106 106
                                    0 1 1 0 108 0 1 0 1 38 1 1 1 105 0 1 1 0 0
                                    10 11 1 0 0 6 43 1 0 0 7 42 1 0 0 21 45 1 0
                                    67 0 76 1 0 40 0 41 2 0 6 0 7 88 1 3 62 0 1
                                    0 0 17 1 2 0 14 0 0 1 2 0 0 0 17 1 2 0 0 0
                                    24 1 0 0 0 12 0 0 0 34 2 0 14 0 0 80 1 0 0
                                    0 47 2 0 0 0 0 1 2 0 0 0 0 27 2 2 0 6 0 49
                                    2 2 0 0 6 1 2 0 0 21 0 52 2 0 0 0 0 90 2 0
                                    0 17 0 1 2 0 0 24 0 1)))))
           '|lookupComplete|)) 
