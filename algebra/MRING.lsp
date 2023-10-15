
(PUT '|MRING;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MRING;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|MRING;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |MRING;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |MRING;coerce;L$;3|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (|MRING;per| |x| $)) 

(SDEFUN |MRING;monomial;RM$;4| ((|r| R) (|m| M) ($ $))
        (COND ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15)) NIL)
              ('T (LIST (CONS |m| |r|))))) 

(SDEFUN |MRING;size;Nni;5| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 18)) (SPADCALL (QREFELT $ 19)))) 

(SDEFUN |MRING;index;Pi$;6| ((|i0| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|m| (M)) (#1=#:G163 NIL) (|cf| (R))
          (#2=#:G161 NIL) (|h| (|Integer|)) (|j| NIL) (|n| (|Integer|))
          (|p| (|Integer|)))
         (SEQ
          (LETT |i| (REM |i0| (SPADCALL (QREFELT $ 20)))
                . #3=(|MRING;index;Pi$;6|))
          (LETT |p| (SPADCALL (QREFELT $ 18)) . #3#)
          (LETT |n| (SPADCALL (QREFELT $ 19)) . #3#)
          (LETT |ans| (|spadConstant| $ 12) . #3#)
          (SEQ (LETT |j| 0 . #3#) G190
               (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 22))) (GO G191)))
               (SEQ (LETT |h| (REM |i| |p|) . #3#)
                    (COND
                     ((SPADCALL |h| 0 (QREFELT $ 23))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL
                              (PROG1 (LETT #2# |h| . #3#)
                                (|check_subtype2| (> #2# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 25))
                             . #3#)
                       (LETT |m|
                             (SPADCALL
                              (PROG1 (LETT #1# (+ |j| |n|) . #3#)
                                (|check_subtype2| (> #1# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT $ 26))
                             . #3#)
                       (EXIT
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL |cf| |m| (QREFELT $ 16))
                                        (QREFELT $ 27))
                              . #3#)))))
                    (EXIT (LETT |i| (QUOTIENT2 |i| |p|) . #3#)))
               (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MRING;lookup;$Pi;7| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|res| (|Integer|)) (|co| (|Integer|))
          (|ex| #1=(|NonNegativeInteger|)) (|l| #1#) (#2=#:G176 NIL) (|te| NIL)
          (|n| (|Integer|)) (|p| (|Integer|))
          (|liTe| (|List| (|Record| (|:| |k| M) (|:| |c| R)))))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 29)) (SPADCALL (QREFELT $ 20)))
                ('T
                 (SEQ
                  (LETT |liTe| (SPADCALL |z| (QREFELT $ 30))
                        . #3=(|MRING;lookup;$Pi;7|))
                  (LETT |p| (SPADCALL (QREFELT $ 18)) . #3#)
                  (LETT |n| (SPADCALL (QREFELT $ 19)) . #3#)
                  (LETT |res| 0 . #3#)
                  (SEQ (LETT |te| NIL . #3#) (LETT #2# |liTe| . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |te| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |l| (SPADCALL (QCAR |te|) (QREFELT $ 31)) . #3#)
                        (LETT |ex| (COND ((EQL |n| |l|) 0) ('T |l|)) . #3#)
                        (LETT |co| (SPADCALL (QCDR |te|) (QREFELT $ 32)) . #3#)
                        (EXIT
                         (LETT |res| (+ |res| (* |co| (EXPT |p| |ex|)))
                               . #3#)))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(PUT '|MRING;Zero;$;8| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |MRING;Zero;$;8| (($ $)) NIL) 

(SDEFUN |MRING;One;$;9| (($ $))
        (LIST (CONS (|spadConstant| $ 36) (|spadConstant| $ 35)))) 

(SDEFUN |MRING;terms;$L;10|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPADCALL (|MRING;rep| |a| $) (QREFELT $ 37))) 

(SDEFUN |MRING;monomials;$L;11| ((|a| $) ($ |List| $))
        (SPROG ((#1=#:G186 NIL) (|t| NIL) (#2=#:G185 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;monomials;$L;11|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (LIST |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;coefficients;$L;12| ((|a| $) ($ |List| R))
        (SPROG ((#1=#:G191 NIL) (|t| NIL) (#2=#:G190 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;coefficients;$L;12|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;coerce;M$;13| ((|m| M) ($ $))
        (LIST (CONS |m| (|spadConstant| $ 35)))) 

(SDEFUN |MRING;coerce;R$;14| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
          (|spadConstant| $ 12))
         ('T (LIST (CONS (|spadConstant| $ 36) |r|))))) 

(SDEFUN |MRING;coerce;I$;15| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 12))
              ('T
               (LIST
                (CONS (|spadConstant| $ 36) (SPADCALL |n| (QREFELT $ 44))))))) 

(SDEFUN |MRING;-;2$;16| ((|a| $) ($ $))
        (SPROG ((#1=#:G202 NIL) (|t| NIL) (#2=#:G201 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;-;2$;16|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (QCAR |t|)
                                     (SPADCALL (QCDR |t|) (QREFELT $ 46)))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;*;R2$;17| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G207 NIL) (|t| NIL) (#2=#:G206 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|spadConstant| $ 12))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|MRING;*;R2$;17|))
                   (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS (QCAR |t|)
                                       (SPADCALL |r| (QCDR |t|)
                                                 (QREFELT $ 48)))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;R2$;18| ((|r| R) (|a| $) ($ $))
        (SPROG ((|rt| (R)) (#1=#:G212 NIL) (|t| NIL) (#2=#:G211 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|spadConstant| $ 12))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|MRING;*;R2$;18|))
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
                                   (SPADCALL |r| (QCDR |t|) (QREFELT $ 48))
                                   . #3#)
                             (|spadConstant| $ 13) (QREFELT $ 50))
                            (LETT #2# (CONS (CONS (QCAR |t|) |rt|) #2#)
                                  . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;19| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((#1=#:G217 NIL) (|t| NIL) (#2=#:G216 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 12))
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|MRING;*;I2$;19|))
                        (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS (QCAR |t|)
                                            (SPADCALL |n| (QCDR |t|)
                                                      (QREFELT $ 51)))
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;20| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((|nt| (R)) (#1=#:G222 NIL) (|t| NIL) (#2=#:G221 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 12))
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|MRING;*;I2$;20|))
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
                                        (SPADCALL |n| (QCDR |t|)
                                                  (QREFELT $ 51))
                                        . #3#)
                                  (|spadConstant| $ 13) (QREFELT $ 50))
                                 (LETT #2# (CONS (CONS (QCAR |t|) |nt|) #2#)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;map;M2$;21| ((|f| |Mapping| R R) (|a| $) ($ $))
        (SPROG ((|ft| (R)) (#1=#:G228 NIL) (|t| NIL) (#2=#:G227 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;map;M2$;21|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |ft| (SPADCALL (QCDR |t|) |f|) . #3#)
                                    (|spadConstant| $ 13) (QREFELT $ 50))
                          (LETT #2# (CONS (CONS (QCAR |t|) |ft|) #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|MRING;numberOfMonomials;$Nni;22| '|SPADreplace| 'LENGTH) 

(SDEFUN |MRING;numberOfMonomials;$Nni;22| ((|a| $) ($ |NonNegativeInteger|))
        (LENGTH |a|)) 

(SDEFUN |MRING;retractIfCan;$U;23| ((|a| $) ($ |Union| M "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCDR (|SPADfirst| |a|)) (|spadConstant| $ 35)
                       (QREFELT $ 15))
             (EXIT (CONS 0 (QCAR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;retractIfCan;$U;24| ((|a| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 36)
                       (QREFELT $ 58))
             (EXIT (CONS 0 (QCDR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;recip;$U;25| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)) (|lt| ($)))
               (SEQ
                (LETT |lt| (SPADCALL |a| (QREFELT $ 30))
                      . #2=(|MRING;recip;$U;25|))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |lt|) 1 (QREFELT $ 61)) (CONS 1 "failed"))
                  (#3='T
                   (SEQ
                    (LETT |u|
                          (SPADCALL (QCDR (|SPADfirst| |lt|)) (QREFELT $ 63))
                          . #2#)
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           (#3#
                            (CONS 0
                                  (SPADCALL (QCDR |u|)
                                            (SPADCALL (QCAR (|SPADfirst| |lt|))
                                                      (QREFELT $ 64))
                                            (QREFELT $ 16))))))))))))) 

(SDEFUN |MRING;recip;$U;26| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL (LENGTH |a|) 1 (QREFELT $ 61))
                      (SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 36)
                                (QREFELT $ 66)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u| (SPADCALL (QCDR (|SPADfirst| |a|)) (QREFELT $ 63))
                         |MRING;recip;$U;26|)
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

(SDEFUN |MRING;coerce;$Of;28| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G283 NIL) (|t| NIL) (#2=#:G282 NIL))
               (SEQ
                (COND ((NULL |a|) (SPADCALL 0 (QREFELT $ 71)))
                      ((NULL (CDR |a|))
                       (|MRING;mkTerm| (QCDR (|SPADfirst| |a|))
                        (QCAR (|SPADfirst| |a|)) $))
                      ('T
                       (SPADCALL (ELT $ 72)
                                 (PROGN
                                  (LETT #2# NIL . #3=(|MRING;coerce;$Of;28|))
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
                                                (|MRING;mkTerm| (QCDR |t|)
                                                 (QCAR |t|) $)
                                                #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 75))))))) 

(SDEFUN |MRING;leadingCoefficient;$R;29| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 13)) ('T (QCDR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingSupport;$M;30| ((|a| $) ($ M))
        (COND ((NULL |a|) (|spadConstant| $ 36)) ('T (QCAR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingMonomial;2$;31| ((|a| $) ($ $))
        (COND ((NULL (|MRING;rep| |a| $)) (|error| "empty support"))
              ('T
               (SPADCALL (QCDR (|SPADfirst| (|MRING;rep| |a| $)))
                         (QCAR (|SPADfirst| (|MRING;rep| |a| $)))
                         (QREFELT $ 16))))) 

(SDEFUN |MRING;leadingTerm;$R;32|
        ((|a| $) ($ |Record| (|:| |k| M) (|:| |c| R)))
        (COND ((NULL |a|) (|error| "empty support")) ('T (|SPADfirst| |a|)))) 

(SDEFUN |MRING;reductum;2$;33| ((|a| $) ($ $))
        (COND ((NULL |a|) |a|) ('T (CDR |a|)))) 

(SDEFUN |MRING;listOfTerms;$L;34|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (|MRING;rep| |a| $)) 

(SDEFUN |MRING;support;$L;35| ((|a| $) ($ |List| M))
        (SPROG ((#1=#:G304 NIL) (|t| NIL) (#2=#:G303 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MRING;support;$L;35|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# (|MRING;rep| |a| $) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;constructOrdered;L$;36|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (|MRING;per| |x| $)) 

(SDEFUN |MRING;termless|
        ((|t1| |Record| (|:| |k| M) (|:| |c| R))
         (|t2| |Record| (|:| |k| M) (|:| |c| R)) ($ |Boolean|))
        (SPADCALL (QCAR |t1|) (QCAR |t2|) (QREFELT $ 86))) 

(SDEFUN |MRING;construct;L$;38|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R))))
          (|xs| (|List| (|Record| (|:| |k| M) (|:| |c| R))))
          (|t2| #1=(|Record| (|:| |k| M) (|:| |c| R))) (|t1| #1#))
         (SEQ
          (LETT |xs|
                (SPADCALL (CONS (|function| |MRING;termless|) $) |x|
                          (QREFELT $ 88))
                . #2=(|MRING;construct;L$;38|))
          (LETT |res| NIL . #2#)
          (SEQ G190 (COND ((NULL (COND ((NULL |xs|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |t1| (|SPADfirst| |xs|) . #2#)
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |xs|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ (LETT |t2| (|SPADfirst| |xs|) . #2#)
                              (EXIT
                               (COND
                                ((SPADCALL (QCAR |t1|) (QCAR |t2|)
                                           (QREFELT $ 58))
                                 (SEQ
                                  (PROGN
                                   (RPLACD |t1|
                                           (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                     (QREFELT $ 89)))
                                   (QCDR |t1|))
                                  (EXIT (LETT |xs| (CDR |xs|) . #2#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL (SPADCALL (QCDR |t1|) (QREFELT $ 90)))
                       (LETT |res| (CONS |t1| |res|) . #2#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (|MRING;per| (REVERSE |res|) $))))) 

(SDEFUN |MRING;linearExtend;M$R;39| ((|f| |Mapping| R M) (|x| $) ($ R))
        (SPROG ((|res| (R)) (#1=#:G327 NIL) (|t| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 29)) (|spadConstant| $ 13))
                      ('T
                       (SEQ
                        (LETT |res| (|spadConstant| $ 13)
                              . #2=(|MRING;linearExtend;M$R;39|))
                        (SEQ (LETT |t| NIL . #2#)
                             (LETT #1# (|MRING;rep| |x| $) . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |res|
                                     (SPADCALL |res|
                                               (SPADCALL (QCDR |t|)
                                                         (SPADCALL (QCAR |t|)
                                                                   |f|)
                                                         (QREFELT $ 48))
                                               (QREFELT $ 89))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |MRING;=;2$B;40| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G335 NIL) (#2=#:G336 NIL) (#3=#:G337 NIL) (|ta| NIL)
          (#4=#:G338 NIL) (|tb| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH (|MRING;rep| |a| $))
                       (LENGTH (|MRING;rep| |b| $)) (QREFELT $ 61))
             'NIL)
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |tb| NIL . #5=(|MRING;=;2$B;40|))
                     (LETT #4# (|MRING;rep| |b| $) . #5#) (LETT |ta| NIL . #5#)
                     (LETT #3# (|MRING;rep| |a| $) . #5#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |ta| (CAR #3#) . #5#) NIL)
                           (ATOM #4#) (PROGN (LETT |tb| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 50))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 66)))
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# 'NIL . #5#) (GO #6=#:G334))
                                . #5#)
                          (GO #7=#:G331))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#))
                           . #5#)
                     (GO G190) G191 (EXIT NIL)))
               #7# (EXIT #1#))
              (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |MRING;+;3$;41| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (|r| (R)) (|repb| (|Rep|)) (|repa| (|Rep|))
          (|rb| (|Rep|)) (|ra| (|Rep|))
          (|tb| #1=(|Record| (|:| |k| M) (|:| |c| R))) (|ta| #1#))
         (SEQ (LETT |repa| (|MRING;rep| |a| $) . #2=(|MRING;+;3$;41|))
              (LETT |repb| (|MRING;rep| |b| $) . #2#) (LETT |res| NIL . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((OR (NULL |repa|) (NULL |repb|)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |ta| (|SPADfirst| |repa|) . #2#)
                        (LETT |tb| (|SPADfirst| |repb|) . #2#)
                        (LETT |ra| (CDR |repa|) . #2#)
                        (LETT |rb| (CDR |repb|) . #2#)
                        (EXIT
                         (LETT |res|
                               (COND
                                ((SPADCALL (QCAR |tb|) (QCAR |ta|)
                                           (QREFELT $ 86))
                                 (SEQ (LETT |repa| |ra| . #2#)
                                      (EXIT
                                       (SPADCALL |res| |ta| (QREFELT $ 95)))))
                                ((SPADCALL (QCAR |ta|) (QCAR |tb|)
                                           (QREFELT $ 86))
                                 (SEQ (LETT |repb| |rb| . #2#)
                                      (EXIT
                                       (SPADCALL |res| |tb| (QREFELT $ 95)))))
                                ('T
                                 (SEQ (LETT |repa| |ra| . #2#)
                                      (LETT |repb| |rb| . #2#)
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (LETT |r|
                                                (SPADCALL (QCDR |ta|)
                                                          (QCDR |tb|)
                                                          (QREFELT $ 89))
                                                . #2#)
                                          (QREFELT $ 90)))
                                        (EXIT
                                         (SPADCALL |res| (CONS (QCAR |ta|) |r|)
                                                   (QREFELT $ 95)))))
                                      (EXIT |res|))))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (|MRING;per|
                (SPADCALL |res| (SPADCALL |repa| |repb| (QREFELT $ 96))
                          (QREFELT $ 97))
                $))))) 

(SDEFUN |MRING;coefficient;$MR;42| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G358 NIL) (#2=#:G359 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |t| NIL . #3=(|MRING;coefficient;$MR;42|))
                       (LETT #2# |a| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |t|) |m| (QREFELT $ 58))
                          (PROGN (LETT #1# (QCDR |t|) . #3#) (GO #4=#:G357))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |t|) |m| (QREFELT $ 86))
                           (PROGN
                            (LETT #1# (|spadConstant| $ 13) . #3#)
                            (GO #4#))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 13))))
                #4# (EXIT #1#)))) 

(SDEFUN |MRING;*;3$;43| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G362 NIL) (#2=#:G361 ($)) (#3=#:G363 ($)) (#4=#:G368 NIL)
          (|tb| NIL) (#5=#:G367 NIL) (#6=#:G366 NIL) (|ta| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|MRING;*;3$;43|))
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
                                                   (QREFELT $ 99))
                                         (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                                   (QREFELT $ 48)))
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

(SDEFUN |MRING;*;3$;44| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G371 NIL) (#2=#:G370 ($)) (#3=#:G372 ($)) (|r| (R))
          (#4=#:G378 NIL) (|tb| NIL) (#5=#:G377 NIL) (#6=#:G376 NIL)
          (|ta| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|MRING;*;3$;44|))
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
                                            (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                                      (QREFELT $ 48))
                                            . #7#)
                                      (QREFELT $ 90))
                                     'NIL)
                                    ('T 'T))
                                   (LETT #5#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                     (QREFELT $ 99))
                                           |r|)
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
        ((|s| |Record| (|:| |k| M) (|:| |c| R))
         (|t| |Record| (|:| |k| M) (|:| |c| R)) ($ |Boolean|))
        (COND ((SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 86)) 'NIL) ('T 'T))) 

(SDEFUN |MRING;sortAndAdd|
        ((|liTe| |List| (|Record| (|:| |k| M) (|:| |c| R)))
         ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (|cf| (R))
          (|m| (M)) (#1=#:G392 NIL) (|te| NIL))
         (SEQ
          (LETT |liTe|
                (SPADCALL (CONS (|function| |MRING;ge|) $) |liTe|
                          (QREFELT $ 88))
                . #2=(|MRING;sortAndAdd|))
          (LETT |m| (QCAR (|SPADfirst| |liTe|)) . #2#)
          (LETT |cf| (QCDR (|SPADfirst| |liTe|)) . #2#) (LETT |res| NIL . #2#)
          (SEQ (LETT |te| NIL . #2#) (LETT #1# (CDR |liTe|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |te| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |m| (QCAR |te|) (QREFELT $ 58))
                   (LETT |cf| (SPADCALL |cf| (QCDR |te|) (QREFELT $ 89))
                         . #2#))
                  ('T
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |cf| (QREFELT $ 90)))
                      (LETT |res| (CONS (CONS |m| |cf|) |res|) . #2#)))
                    (LETT |m| (QCAR |te|) . #2#)
                    (EXIT (LETT |cf| (QCDR |te|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (SPADCALL |cf| (QREFELT $ 90)))
            (LETT |res| (CONS (CONS |m| |cf|) |res|) . #2#)))
          (EXIT (REVERSE |res|))))) 

(SDEFUN |MRING;*;3$;47| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G395 NIL) (#2=#:G394 ($)) (#3=#:G396 ($)) (#4=#:G407 NIL)
          (|tb| NIL) (#5=#:G406 NIL) (#6=#:G405 NIL) (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 29)) |a|)
                ((SPADCALL |b| (QREFELT $ 29)) |b|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL . #8=(|MRING;*;3$;47|))
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
                                                           (QREFELT $ 99))
                                                 (SPADCALL (QCDR |ta|)
                                                           (QCDR |tb|)
                                                           (QREFELT $ 48)))
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

(SDEFUN |MRING;*;3$;48| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G410 NIL) (#2=#:G409 ($)) (#3=#:G411 ($)) (|r| (R))
          (#4=#:G427 NIL) (|tb| NIL) (#5=#:G426 NIL) (#6=#:G425 NIL)
          (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 29)) |a|)
                ((SPADCALL |b| (QREFELT $ 29)) |b|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL . #8=(|MRING;*;3$;48|))
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
                                                    (SPADCALL (QCDR |ta|)
                                                              (QCDR |tb|)
                                                              (QREFELT $ 48))
                                                    . #8#)
                                              (QREFELT $ 90))
                                             'NIL)
                                            ('T 'T))
                                           (LETT #5#
                                                 (CONS
                                                  (CONS
                                                   (SPADCALL (QCAR |ta|)
                                                             (QCAR |tb|)
                                                             (QREFELT $ 99))
                                                   |r|)
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

(SDEFUN |MRING;=;2$B;49| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 61)) 'NIL)
              ('T
               (SPADCALL (SPADCALL |a| (QREFELT $ 102))
                         (SPADCALL |b| (QREFELT $ 102)) (QREFELT $ 103))))) 

(SDEFUN |MRING;coefficient;$MR;50| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G437 NIL) (#2=#:G438 NIL) (#3=#:G439 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |t| NIL . #4=(|MRING;coefficient;$MR;50|))
                         (LETT #3# |a| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |t| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCAR |t|) |m| (QREFELT $ 58))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (QCDR |t|) . #4#)
                                     (GO #5=#:G436))
                                    . #4#)
                              (GO #6=#:G434))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|spadConstant| $ 13))))
                #5# (EXIT #2#)))) 

(SDEFUN |MRING;addterm| ((|Tabl| |AssociationList| M R) (|r| R) (|m| M) ($ R))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ
                (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 105))
                      . #1=(|MRING;addterm|))
                (EXIT
                 (COND
                  ((OR (QEQCAR |u| 1)
                       (NULL
                        (SPADCALL
                         (LETT |r| (SPADCALL |r| (QCDR |u|) (QREFELT $ 89))
                               . #1#)
                         (QREFELT $ 90))))
                   (SPADCALL |Tabl| |m| |r| (QREFELT $ 106)))
                  ('T
                   (SEQ (SPADCALL |m| |Tabl| (QREFELT $ 107))
                        (EXIT (|spadConstant| $ 13))))))))) 

(SDEFUN |MRING;+;3$;52| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G457 NIL) (|m| NIL) (#2=#:G456 NIL) (#3=#:G455 NIL) (|t| NIL)
          (#4=#:G454 NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 108)) . #5=(|MRING;+;3$;52|))
              (SEQ (LETT |t| NIL . #5#) (LETT #4# (|MRING;rep| |a| $) . #5#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |Tabl| (QCAR |t|) (QCDR |t|) (QREFELT $ 106))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |t| NIL . #5#) (LETT #3# (|MRING;rep| |b| $) . #5#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (|MRING;addterm| |Tabl| (QCDR |t|) (QCAR |t|) $)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |m| NIL . #5#)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 109)) . #5#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 110)))
                              #2#)
                             . #5#)))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MRING;*;3$;53| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G467 NIL) (|m| NIL) (#2=#:G466 NIL) (#3=#:G465 NIL) (|tb| NIL)
          (#4=#:G464 NIL) (|ta| NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 108)) . #5=(|MRING;*;3$;53|))
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
                             (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 48))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 99))
                             $)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |m| NIL . #5#)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 109)) . #5#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 110)))
                              #2#)
                             . #5#)))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |MonoidRing;|)) 

(DEFUN |MonoidRing| (&REST #1=#:G470)
  (SPROG NIL
         (PROG (#2=#:G471)
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
  (SPROG
   ((|pv$| NIL) (#1=#:G468 NIL) (#2=#:G469 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|MonoidRing|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT |dv$| (LIST '|MonoidRing| DV$1 DV$2) . #3#)
    (LETT $ (GETREFV 115) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #3#)
                                        (OR #2#
                                            (|HasCategory| |#2|
                                                           '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|Comparable|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedSet|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedSet|))))
                                        (AND (|HasCategory| |#1| '(|Finite|))
                                             (|HasCategory| |#2| '(|Finite|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (AND #2#
                                             (|HasCategory| |#2|
                                                            '(|Comparable|)))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory| |#2|
                                                              '(|Comparable|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedSet|)))
                                              . #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|Comparable|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         #1#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         #1#)))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|MonoidRing| (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#1| '(|Finite|))
      (COND
       ((|HasCategory| |#2| '(|Finite|))
        (PROGN
         (QSETREFV $ 20 (CONS (|dispatchFunction| |MRING;size;Nni;5|) $))
         (QSETREFV $ 28 (CONS (|dispatchFunction| |MRING;index;Pi$;6|) $))
         (QSETREFV $ 33
                   (CONS (|dispatchFunction| |MRING;lookup;$Pi;7|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 49 (CONS (|dispatchFunction| |MRING;*;R2$;17|) $)))
     ('T (QSETREFV $ 49 (CONS (|dispatchFunction| |MRING;*;R2$;18|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 52 (CONS (|dispatchFunction| |MRING;*;I2$;19|) $)))
     ('T (QSETREFV $ 52 (CONS (|dispatchFunction| |MRING;*;I2$;20|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (COND
       ((|HasCategory| |#2| '(|Group|))
        (QSETREFV $ 65 (CONS (|dispatchFunction| |MRING;recip;$U;25|) $)))
       ('T
        (QSETREFV $ 65 (CONS (|dispatchFunction| |MRING;recip;$U;26|) $))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 77
                 (CONS (|dispatchFunction| |MRING;leadingCoefficient;$R;29|)
                       $))
       (QSETREFV $ 78
                 (CONS (|dispatchFunction| |MRING;leadingSupport;$M;30|) $))
       (QSETREFV $ 79
                 (CONS (|dispatchFunction| |MRING;leadingMonomial;2$;31|) $))
       (QSETREFV $ 80 (CONS (|dispatchFunction| |MRING;leadingTerm;$R;32|) $))
       (QSETREFV $ 81 (CONS (|dispatchFunction| |MRING;reductum;2$;33|) $))
       (QSETREFV $ 82 (CONS (|dispatchFunction| |MRING;listOfTerms;$L;34|) $))
       (QSETREFV $ 84 (CONS (|dispatchFunction| |MRING;support;$L;35|) $))
       (QSETREFV $ 85
                 (CONS (|dispatchFunction| |MRING;constructOrdered;L$;36|) $))
       (QSETREFV $ 91 (CONS (|dispatchFunction| |MRING;construct;L$;38|) $))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (QSETREFV $ 93
                    (CONS (|dispatchFunction| |MRING;linearExtend;M$R;39|)
                          $)))))
       (QSETREFV $ 94 (CONS (|dispatchFunction| |MRING;=;2$B;40|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |MRING;+;3$;41|) $))
       (QSETREFV $ 98 (CONS (|dispatchFunction| |MRING;coefficient;$MR;42|) $))
       (COND
        ((|HasCategory| |#2| '(|OrderedMonoid|))
         (COND
          ((|HasCategory| |#1| '(|noZeroDivisors|))
           (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;43|) $)))
          ('T (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;44|) $)))))
        ('T
         (PROGN
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;47|) $)))
           ('T
            (QSETREFV $ 100
                      (CONS (|dispatchFunction| |MRING;*;3$;48|) $)))))))))
     ('T
      (PROGN
       (QSETREFV $ 94 (CONS (|dispatchFunction| |MRING;=;2$B;49|) $))
       (QSETREFV $ 98 (CONS (|dispatchFunction| |MRING;coefficient;$MR;50|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |MRING;+;3$;52|) $))
       (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;53|) $)))))
    $))) 

(MAKEPROP '|MonoidRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (|List| 9) |MRING;coerce;L$;3|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MRING;Zero;$;8|) $))
              (0 . |Zero|) (|Boolean|) (4 . =) |MRING;monomial;RM$;4|
              (|NonNegativeInteger|) (10 . |size|) (14 . |size|) (18 . |size|)
              (|Integer|) (22 . >) (28 . ~=) (|PositiveInteger|) (34 . |index|)
              (39 . |index|) (44 . +) (50 . |index|) (55 . |zero?|)
              |MRING;terms;$L;10| (60 . |lookup|) (65 . |lookup|)
              (70 . |lookup|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MRING;One;$;9|) $))
              (75 . |One|) (79 . |One|) (83 . |copy|) (|List| $)
              |MRING;monomials;$L;11| (|List| 6) |MRING;coefficients;$L;12|
              |MRING;coerce;M$;13| |MRING;coerce;R$;14| (88 . |coerce|)
              |MRING;coerce;I$;15| (93 . -) |MRING;-;2$;16| (98 . *) (104 . *)
              (110 . ~=) (116 . *) (122 . *) (|Mapping| 6 6) |MRING;map;M2$;21|
              |MRING;numberOfMonomials;$Nni;22| (|Union| 7 '"failed")
              |MRING;retractIfCan;$U;23| (128 . =) (|Union| 6 '"failed")
              |MRING;retractIfCan;$U;24| (134 . ~=) (|Union| $ '"failed")
              (140 . |recip|) (145 . |inv|) (150 . |recip|) (155 . ~=)
              (|OutputForm|) (161 . |coerce|) (166 . |coerce|) (171 . *)
              (177 . |coerce|) (182 . +) (|Mapping| 67 67 67) (|List| 67)
              (188 . |reduce|) |MRING;coerce;$Of;28|
              (194 . |leadingCoefficient|) (199 . |leadingSupport|)
              (204 . |leadingMonomial|) (209 . |leadingTerm|)
              (214 . |reductum|) (219 . |listOfTerms|) (|List| 7)
              (224 . |support|) (229 . |constructOrdered|) (234 . |smaller?|)
              (|Mapping| 14 9 9) (240 . |sort|) (246 . +) (252 . |zero?|)
              (257 . |construct|) (|Mapping| 6 7) (262 . |linearExtend|)
              (268 . =) (274 . |concat!|) (280 . |concat|) (286 . |concat!|)
              (292 . |coefficient|) (298 . *) (304 . *) (|Set| 9)
              (310 . |brace|) (315 . =) (|AssociationList| 7 6)
              (321 . |search|) (327 . |setelt!|) (334 . |remove!|)
              (340 . |table|) (344 . |keys|) (349 . |elt|) (|InputForm|)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 355 |zero?| 361 |terms| 366 |support| 371 |sup| 376
              |subtractIfCan| 382 |smaller?| 388 |size| 394 |sample| 398
              |retractIfCan| 402 |retract| 412 |reductum| 422 |recip| 427
              |random| 432 |opposite?| 436 |one?| 442 |numberOfMonomials| 447
              |monomials| 452 |monomial?| 457 |monomial| 462 |monom| 468 |min|
              474 |max| 480 |map| 486 |lookup| 492 |listOfTerms| 497
              |linearExtend| 502 |leadingTerm| 508 |leadingSupport| 513
              |leadingMonomial| 518 |leadingCoefficient| 523 |latex| 528
              |index| 533 |hashUpdate!| 538 |hash| 544 |enumerate| 549
              |convert| 553 |constructOrdered| 558 |construct| 563 |coerce| 568
              |coefficients| 593 |coefficient| 598 |charthRoot| 604
              |characteristic| 609 |annihilate?| 613 ^ 619 |Zero| 631 |One| 635
              >= 639 > 645 = 651 <= 657 < 663 - 669 + 680 * 686)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 1 2 2 1 8 9 0 3 4 0 0 3 3 1 4 0 6 0 0 6 0 0
                                  0 6 0 0 5 7 0 0 0 0 0 0 6 7))
            (CONS
             '#(NIL |FreeModuleCategory&| |Algebra&| |Module&| NIL NIL NIL
                |Ring&| NIL NIL |Rng&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |SemiGroup&| |AbelianSemiGroup&| NIL |Finite&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL |BasicType&| NIL
                |PartialOrder&| NIL)
             (CONS
              '#((|MonoidRingCategory| 6 7) (|FreeModuleCategory| 6 7)
                 (|Algebra| 6) (|Module| 6)
                 (|IndexedDirectProductCategory| 6 7) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Ring|) (|BiModule| 6 6)
                 (|OrderedAbelianMonoidSup|) (|Rng|) (|LeftModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|OrderedSet|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|Finite|) (|SetCategory|)
                 (|RetractableTo| 6) (|RetractableTo| 7) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 67) (|PartialOrder|)
                 (|ConvertibleTo| 111))
              (|makeByteWordVec2| 114
                                  '(0 6 0 13 2 6 14 0 0 15 0 6 17 18 0 7 17 19
                                    0 0 17 20 2 21 14 0 0 22 2 21 14 0 0 23 1 6
                                    0 24 25 1 7 0 24 26 2 0 0 0 0 27 1 0 0 24
                                    28 1 0 14 0 29 1 7 24 0 31 1 6 24 0 32 1 0
                                    24 0 33 0 6 0 35 0 7 0 36 1 10 0 0 37 1 6 0
                                    21 44 1 6 0 0 46 2 6 0 0 0 48 2 0 0 6 0 49
                                    2 6 14 0 0 50 2 6 0 21 0 51 2 0 0 21 0 52 2
                                    7 14 0 0 58 2 17 14 0 0 61 1 6 62 0 63 1 7
                                    0 0 64 1 0 62 0 65 2 7 14 0 0 66 1 7 67 0
                                    68 1 6 67 0 69 2 67 0 0 0 70 1 21 67 0 71 2
                                    67 0 0 0 72 2 74 67 73 0 75 1 0 6 0 77 1 0
                                    7 0 78 1 0 0 0 79 1 0 9 0 80 1 0 0 0 81 1 0
                                    10 0 82 1 0 83 0 84 1 0 0 10 85 2 7 14 0 0
                                    86 2 10 0 87 0 88 2 6 0 0 0 89 1 6 14 0 90
                                    1 0 0 10 91 2 0 6 92 0 93 2 0 14 0 0 94 2 8
                                    0 0 9 95 2 8 0 0 0 96 2 8 0 0 0 97 2 0 6 0
                                    7 98 2 7 0 0 0 99 2 0 0 0 0 100 1 101 0 10
                                    102 2 101 14 0 0 103 2 104 59 7 0 105 3 104
                                    6 0 7 6 106 2 104 59 7 0 107 0 104 0 108 1
                                    104 83 0 109 2 104 6 0 7 110 2 0 14 0 0 1 1
                                    0 14 0 29 1 0 10 0 30 1 1 83 0 84 2 11 0 0
                                    0 1 2 0 62 0 0 1 2 12 14 0 0 1 0 7 17 20 0
                                    0 0 1 1 0 59 0 60 1 0 56 0 57 1 0 6 0 1 1 0
                                    7 0 1 1 1 0 0 81 1 0 62 0 65 0 7 0 1 2 0 14
                                    0 0 1 1 0 14 0 1 1 0 17 0 55 1 0 38 0 39 1
                                    0 14 0 1 2 0 0 6 7 16 2 1 0 7 6 1 2 13 0 0
                                    0 1 2 13 0 0 0 1 2 0 0 53 0 54 1 7 24 0 33
                                    1 1 10 0 82 2 10 6 92 0 93 1 1 9 0 80 1 1 7
                                    0 78 1 1 0 0 79 1 1 6 0 77 1 0 112 0 1 1 7
                                    0 24 28 2 0 114 114 0 1 1 0 113 0 1 0 7 38
                                    1 1 7 111 0 1 1 1 0 10 85 1 1 0 10 91 1 0 0
                                    10 11 1 0 0 6 43 1 0 0 21 45 1 0 0 7 42 1 0
                                    67 0 76 1 0 40 0 41 2 0 6 0 7 98 1 8 62 0 1
                                    0 0 17 1 2 0 14 0 0 1 2 0 0 0 17 1 2 0 0 0
                                    24 1 0 0 0 12 0 0 0 34 2 13 14 0 0 1 2 13
                                    14 0 0 1 2 0 14 0 0 94 2 13 14 0 0 1 2 13
                                    14 0 0 1 1 0 0 0 47 2 0 0 0 0 1 2 0 0 0 0
                                    27 2 3 0 0 6 1 2 3 0 6 0 49 2 1 0 6 7 1 2 1
                                    0 7 6 1 2 0 0 21 0 52 2 0 0 0 0 100 2 0 0
                                    17 0 1 2 0 0 24 0 1)))))
           '|lookupComplete|)) 
