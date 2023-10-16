
(PUT '|MRING;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MRING;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|MRING;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |MRING;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |MRING;characteristic;Nni;3| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 10))) 

(SDEFUN |MRING;coerce;L$;4|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (|MRING;per| |x| $)) 

(SDEFUN |MRING;monomial;RM$;5| ((|r| R) (|m| M) ($ $))
        (COND ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18)) NIL)
              ('T (LIST (CONS |m| |r|))))) 

(SDEFUN |MRING;monomial?;$B;6| ((|x| $) ($ |Boolean|))
        (SPADCALL (LENGTH (|MRING;rep| |x| $)) 1 (QREFELT $ 21))) 

(SDEFUN |MRING;size;Nni;7| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 23)) (SPADCALL (QREFELT $ 24)))) 

(SDEFUN |MRING;index;Pi$;8| ((|i0| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|m| (M)) (#1=#:G166 NIL) (|cf| (R))
          (#2=#:G164 NIL) (|h| (|Integer|)) (|j| NIL) (|n| (|Integer|))
          (|p| (|Integer|)))
         (SEQ (LETT |i| (REM |i0| (SPADCALL (QREFELT $ 25))))
              (LETT |p| (SPADCALL (QREFELT $ 23)))
              (LETT |n| (SPADCALL (QREFELT $ 24)))
              (LETT |ans| (|spadConstant| $ 15))
              (SEQ (LETT |j| 0) G190
                   (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 27))) (GO G191)))
                   (SEQ (LETT |h| (REM |i| |p|))
                        (COND
                         ((SPADCALL |h| 0 (QREFELT $ 28))
                          (SEQ
                           (LETT |cf|
                                 (SPADCALL
                                  (PROG1 (LETT #2# |h|)
                                    (|check_subtype2| (> #2# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 30)))
                           (LETT |m|
                                 (SPADCALL
                                  (PROG1 (LETT #1# (+ |j| |n|))
                                    (|check_subtype2| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 31)))
                           (EXIT
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL |cf| |m| (QREFELT $ 19))
                                            (QREFELT $ 32)))))))
                        (EXIT (LETT |i| (QUOTIENT2 |i| |p|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MRING;lookup;$Pi;9| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|res| (|Integer|)) (|co| (|Integer|))
          (|ex| #1=(|NonNegativeInteger|)) (|l| #1#) (#2=#:G179 NIL) (|te| NIL)
          (|n| (|Integer|)) (|p| (|Integer|))
          (|liTe| (|List| (|Record| (|:| |k| M) (|:| |c| R)))))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 34)) (SPADCALL (QREFELT $ 25)))
                ('T
                 (SEQ (LETT |liTe| (SPADCALL |z| (QREFELT $ 35)))
                      (LETT |p| (SPADCALL (QREFELT $ 23)))
                      (LETT |n| (SPADCALL (QREFELT $ 24))) (LETT |res| 0)
                      (SEQ (LETT |te| NIL) (LETT #2# |liTe|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |te| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |l| (SPADCALL (QCAR |te|) (QREFELT $ 36)))
                            (LETT |ex| (COND ((EQL |n| |l|) 0) ('T |l|)))
                            (LETT |co| (SPADCALL (QCDR |te|) (QREFELT $ 37)))
                            (EXIT
                             (LETT |res| (+ |res| (* |co| (EXPT |p| |ex|))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(PUT '|MRING;Zero;$;10| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |MRING;Zero;$;10| (($ $)) NIL) 

(SDEFUN |MRING;One;$;11| (($ $))
        (LIST (CONS (|spadConstant| $ 40) (|spadConstant| $ 39)))) 

(SDEFUN |MRING;terms;$L;12|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPADCALL (|MRING;rep| |a| $) (QREFELT $ 41))) 

(SDEFUN |MRING;monomials;$L;13| ((|a| $) ($ |List| $))
        (SPROG ((#1=#:G189 NIL) (|t| NIL) (#2=#:G188 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (LIST |t|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;coefficients;$L;14| ((|a| $) ($ |List| R))
        (SPROG ((#1=#:G194 NIL) (|t| NIL) (#2=#:G193 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |t|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;coerce;M$;15| ((|m| M) ($ $))
        (LIST (CONS |m| (|spadConstant| $ 39)))) 

(SDEFUN |MRING;coerce;R$;16| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
          (|spadConstant| $ 15))
         ('T (LIST (CONS (|spadConstant| $ 40) |r|))))) 

(SDEFUN |MRING;coerce;I$;17| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 15))
              ('T
               (LIST
                (CONS (|spadConstant| $ 40) (SPADCALL |n| (QREFELT $ 48))))))) 

(SDEFUN |MRING;-;2$;18| ((|a| $) ($ $))
        (SPROG ((#1=#:G205 NIL) (|t| NIL) (#2=#:G204 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (QCAR |t|)
                                     (SPADCALL (QCDR |t|) (QREFELT $ 50)))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;*;R2$;19| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G210 NIL) (|t| NIL) (#2=#:G209 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
                  (|spadConstant| $ 15))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS (QCAR |t|)
                                       (SPADCALL |r| (QCDR |t|)
                                                 (QREFELT $ 52)))
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;R2$;20| ((|r| R) (|a| $) ($ $))
        (SPROG ((|rt| (R)) (#1=#:G215 NIL) (|t| NIL) (#2=#:G214 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
                  (|spadConstant| $ 15))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LETT |rt|
                                   (SPADCALL |r| (QCDR |t|) (QREFELT $ 52)))
                             (|spadConstant| $ 16) (QREFELT $ 54))
                            (LETT #2# (CONS (CONS (QCAR |t|) |rt|) #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;21| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((#1=#:G220 NIL) (|t| NIL) (#2=#:G219 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 15))
                      ('T
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS (QCAR |t|)
                                            (SPADCALL |n| (QCDR |t|)
                                                      (QREFELT $ 55)))
                                      #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;22| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((|nt| (R)) (#1=#:G225 NIL) (|t| NIL) (#2=#:G224 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 15))
                      ('T
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |nt|
                                        (SPADCALL |n| (QCDR |t|)
                                                  (QREFELT $ 55)))
                                  (|spadConstant| $ 16) (QREFELT $ 54))
                                 (LETT #2#
                                       (CONS (CONS (QCAR |t|) |nt|) #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;map;M2$;23| ((|f| |Mapping| R R) (|a| $) ($ $))
        (SPROG ((|ft| (R)) (#1=#:G231 NIL) (|t| NIL) (#2=#:G230 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |ft| (SPADCALL (QCDR |t|) |f|))
                                    (|spadConstant| $ 16) (QREFELT $ 54))
                          (LETT #2# (CONS (CONS (QCAR |t|) |ft|) #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|MRING;numberOfMonomials;$Nni;24| '|SPADreplace| 'LENGTH) 

(SDEFUN |MRING;numberOfMonomials;$Nni;24| ((|a| $) ($ |NonNegativeInteger|))
        (LENGTH |a|)) 

(SDEFUN |MRING;retractIfCan;$U;25| ((|a| $) ($ |Union| M "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCDR (|SPADfirst| |a|)) (|spadConstant| $ 39)
                       (QREFELT $ 18))
             (EXIT (CONS 0 (QCAR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;retractIfCan;$U;26| ((|a| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 40)
                       (QREFELT $ 62))
             (EXIT (CONS 0 (QCDR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;recip;$U;27| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)) (|lt| ($)))
               (SEQ (LETT |lt| (SPADCALL |a| (QREFELT $ 35)))
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |lt|) 1 (QREFELT $ 65))
                       (CONS 1 "failed"))
                      (#2='T
                       (SEQ
                        (LETT |u|
                              (SPADCALL (QCDR (|SPADfirst| |lt|))
                                        (QREFELT $ 67)))
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#2#
                                (CONS 0
                                      (SPADCALL (QCDR |u|)
                                                (SPADCALL
                                                 (QCAR (|SPADfirst| |lt|))
                                                 (QREFELT $ 68))
                                                (QREFELT $ 19))))))))))))) 

(SDEFUN |MRING;recip;$U;28| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL (LENGTH |a|) 1 (QREFELT $ 65))
                      (SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 40)
                                (QREFELT $ 70)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |a|)) (QREFELT $ 67)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 47)))))))))))) 

(SDEFUN |MRING;mkTerm| ((|r| R) (|m| M) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 39) (QREFELT $ 18))
          (SPADCALL |m| (QREFELT $ 72)))
         ((OR (SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
              (SPADCALL |m| (|spadConstant| $ 40) (QREFELT $ 62)))
          (SPADCALL |r| (QREFELT $ 73)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 73)) (SPADCALL |m| (QREFELT $ 72))
                    (QREFELT $ 74))))) 

(SDEFUN |MRING;coerce;$Of;30| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G286 NIL) (|t| NIL) (#2=#:G285 NIL))
               (SEQ
                (COND ((NULL |a|) (SPADCALL 0 (QREFELT $ 75)))
                      ((NULL (CDR |a|))
                       (|MRING;mkTerm| (QCDR (|SPADfirst| |a|))
                        (QCAR (|SPADfirst| |a|)) $))
                      ('T
                       (SPADCALL (ELT $ 76)
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |t| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (|MRING;mkTerm| (QCDR |t|)
                                                 (QCAR |t|) $)
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 79))))))) 

(SDEFUN |MRING;leadingCoefficient;$R;31| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 16)) ('T (QCDR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingSupport;$M;32| ((|a| $) ($ M))
        (COND ((NULL |a|) (|spadConstant| $ 40)) ('T (QCAR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingMonomial;2$;33| ((|a| $) ($ $))
        (COND ((NULL (|MRING;rep| |a| $)) (|error| "empty support"))
              ('T
               (SPADCALL (QCDR (|SPADfirst| (|MRING;rep| |a| $)))
                         (QCAR (|SPADfirst| (|MRING;rep| |a| $)))
                         (QREFELT $ 19))))) 

(SDEFUN |MRING;leadingTerm;$R;34|
        ((|a| $) ($ |Record| (|:| |k| M) (|:| |c| R)))
        (COND ((NULL |a|) (|error| "empty support")) ('T (|SPADfirst| |a|)))) 

(SDEFUN |MRING;reductum;2$;35| ((|a| $) ($ $))
        (COND ((NULL |a|) |a|) ('T (CDR |a|)))) 

(SDEFUN |MRING;listOfTerms;$L;36|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (|MRING;rep| |a| $)) 

(SDEFUN |MRING;support;$L;37| ((|a| $) ($ |List| M))
        (SPROG ((#1=#:G307 NIL) (|t| NIL) (#2=#:G306 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# (|MRING;rep| |a| $)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |t|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;constructOrdered;L$;38|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (|MRING;per| |x| $)) 

(SDEFUN |MRING;termless|
        ((|t1| |Record| (|:| |k| M) (|:| |c| R))
         (|t2| |Record| (|:| |k| M) (|:| |c| R)) ($ |Boolean|))
        (SPADCALL (QCAR |t1|) (QCAR |t2|) (QREFELT $ 90))) 

(SDEFUN |MRING;construct;L$;40|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (#1=#:G325 NIL)
          (|xs| (|List| (|Record| (|:| |k| M) (|:| |c| R))))
          (|t2| #2=(|Record| (|:| |k| M) (|:| |c| R))) (|t1| #2#))
         (SEQ
          (LETT |xs|
                (SPADCALL (CONS (|function| |MRING;termless|) $) |x|
                          (QREFELT $ 92)))
          (LETT |res| NIL)
          (SEQ G190 (COND ((NULL (NULL (NULL |xs|))) (GO G191)))
               (SEQ (LETT |t1| (|SPADfirst| |xs|)) (LETT |xs| (CDR |xs|))
                    (SEQ
                     (EXIT
                      (SEQ G190 (COND ((NULL (NULL (NULL |xs|))) (GO G191)))
                           (SEQ (LETT |t2| (|SPADfirst| |xs|))
                                (EXIT
                                 (COND
                                  ((SPADCALL (QCAR |t1|) (QCAR |t2|)
                                             (QREFELT $ 62))
                                   (SEQ
                                    (PROGN
                                     (RPLACD |t1|
                                             (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                       (QREFELT $ 93)))
                                     (QCDR |t1|))
                                    (EXIT (LETT |xs| (CDR |xs|)))))
                                  ('T
                                   (PROGN
                                    (LETT #1# |$NoValue|)
                                    (GO #3=#:G320))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #3# (EXIT #1#))
                    (EXIT
                     (COND
                      ((NULL (SPADCALL (QCDR |t1|) (QREFELT $ 94)))
                       (LETT |res| (CONS |t1| |res|))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |MRING;linearExtend;M$R;41| ((|f| |Mapping| R M) (|x| $) ($ R))
        (SPROG ((|res| (R)) (#1=#:G332 NIL) (|t| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 34)) (|spadConstant| $ 16))
                      ('T
                       (SEQ (LETT |res| (|spadConstant| $ 16))
                            (SEQ (LETT |t| NIL) (LETT #1# (|MRING;rep| |x| $))
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL |res|
                                                   (SPADCALL (QCDR |t|)
                                                             (SPADCALL
                                                              (QCAR |t|) |f|)
                                                             (QREFELT $ 52))
                                                   (QREFELT $ 93)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |res|))))))) 

(SDEFUN |MRING;=;2$B;42| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G340 NIL) (#2=#:G341 NIL) (#3=#:G342 NIL) (|ta| NIL)
          (#4=#:G343 NIL) (|tb| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH (|MRING;rep| |a| $))
                       (LENGTH (|MRING;rep| |b| $)) (QREFELT $ 65))
             NIL)
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |tb| NIL) (LETT #4# (|MRING;rep| |b| $))
                     (LETT |ta| NIL) (LETT #3# (|MRING;rep| |a| $)) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |ta| (CAR #3#)) NIL)
                           (ATOM #4#) (PROGN (LETT |tb| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 54))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 70)))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# NIL) (GO #5=#:G339)))
                          (GO #6=#:G336))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #1#))
              (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MRING;+;3$;43| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (|r| (R)) (|repb| (|Rep|)) (|repa| (|Rep|))
          (|rb| (|Rep|)) (|ra| (|Rep|))
          (|tb| #1=(|Record| (|:| |k| M) (|:| |c| R))) (|ta| #1#))
         (SEQ (LETT |repa| (|MRING;rep| |a| $))
              (LETT |repb| (|MRING;rep| |b| $)) (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |repa|) NIL) ('T (NULL (NULL |repb|)))))
                     (GO G191)))
                   (SEQ (LETT |ta| (|SPADfirst| |repa|))
                        (LETT |tb| (|SPADfirst| |repb|))
                        (LETT |ra| (CDR |repa|)) (LETT |rb| (CDR |repb|))
                        (EXIT
                         (LETT |res|
                               (COND
                                ((SPADCALL (QCAR |tb|) (QCAR |ta|)
                                           (QREFELT $ 90))
                                 (SEQ (LETT |repa| |ra|)
                                      (EXIT
                                       (SPADCALL |res| |ta| (QREFELT $ 99)))))
                                ((SPADCALL (QCAR |ta|) (QCAR |tb|)
                                           (QREFELT $ 90))
                                 (SEQ (LETT |repb| |rb|)
                                      (EXIT
                                       (SPADCALL |res| |tb| (QREFELT $ 99)))))
                                ('T
                                 (SEQ (LETT |repa| |ra|) (LETT |repb| |rb|)
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (LETT |r|
                                                (SPADCALL (QCDR |ta|)
                                                          (QCDR |tb|)
                                                          (QREFELT $ 93)))
                                          (QREFELT $ 94)))
                                        (EXIT
                                         (SPADCALL |res| (CONS (QCAR |ta|) |r|)
                                                   (QREFELT $ 99)))))
                                      (EXIT |res|)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (|MRING;per|
                (SPADCALL |res| (SPADCALL |repa| |repb| (QREFELT $ 100))
                          (QREFELT $ 101))
                $))))) 

(SDEFUN |MRING;coefficient;$MR;44| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G363 NIL) (#2=#:G364 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |t| NIL) (LETT #2# |a|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |t|) |m| (QREFELT $ 62))
                          (PROGN (LETT #1# (QCDR |t|)) (GO #3=#:G362))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |t|) |m| (QREFELT $ 90))
                           (PROGN
                            (LETT #1# (|spadConstant| $ 16))
                            (GO #3#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 16))))
                #3# (EXIT #1#)))) 

(SDEFUN |MRING;*;3$;45| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G367 NIL) (#2=#:G366 ($)) (#3=#:G368 ($)) (#4=#:G373 NIL)
          (|tb| NIL) (#5=#:G372 NIL) (#6=#:G371 NIL) (|ta| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |ta| NIL) (LETT #6# (REVERSE |a|)) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |ta| (CAR #6#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (PROGN
                          (LETT #5# NIL)
                          (SEQ (LETT |tb| NIL) (LETT #4# |b|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |tb| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                   (QREFELT $ 103))
                                         (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                                   (QREFELT $ 52)))
                                        #5#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |MRING;*;3$;46| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G376 NIL) (#2=#:G375 ($)) (#3=#:G377 ($)) (|r| (R))
          (#4=#:G383 NIL) (|tb| NIL) (#5=#:G382 NIL) (#6=#:G381 NIL)
          (|ta| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |ta| NIL) (LETT #6# (REVERSE |a|)) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |ta| (CAR #6#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (PROGN
                          (LETT #5# NIL)
                          (SEQ (LETT |tb| NIL) (LETT #4# |b|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |tb| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (LETT |r|
                                           (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                                     (QREFELT $ 52)))
                                     (QREFELT $ 94)))
                                   (LETT #5#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                     (QREFELT $ 103))
                                           |r|)
                                          #5#))))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |MRING;ge|
        ((|s| |Record| (|:| |k| M) (|:| |c| R))
         (|t| |Record| (|:| |k| M) (|:| |c| R)) ($ |Boolean|))
        (NULL (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 90)))) 

(SDEFUN |MRING;sortAndAdd|
        ((|liTe| |List| (|Record| (|:| |k| M) (|:| |c| R)))
         ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (|cf| (R))
          (|m| (M)) (#1=#:G399 NIL) (|te| NIL))
         (SEQ
          (LETT |liTe|
                (SPADCALL (CONS (|function| |MRING;ge|) $) |liTe|
                          (QREFELT $ 92)))
          (LETT |m| (QCAR (|SPADfirst| |liTe|)))
          (LETT |cf| (QCDR (|SPADfirst| |liTe|))) (LETT |res| NIL)
          (SEQ (LETT |te| NIL) (LETT #1# (CDR |liTe|)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |te| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |m| (QCAR |te|) (QREFELT $ 62))
                   (LETT |cf| (SPADCALL |cf| (QCDR |te|) (QREFELT $ 93))))
                  ('T
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |cf| (QREFELT $ 94)))
                      (LETT |res| (CONS (CONS |m| |cf|) |res|))))
                    (LETT |m| (QCAR |te|)) (EXIT (LETT |cf| (QCDR |te|))))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (SPADCALL |cf| (QREFELT $ 94)))
            (LETT |res| (CONS (CONS |m| |cf|) |res|))))
          (EXIT (REVERSE |res|))))) 

(SDEFUN |MRING;*;3$;49| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G402 NIL) (#2=#:G401 ($)) (#3=#:G403 ($)) (#4=#:G414 NIL)
          (|tb| NIL) (#5=#:G413 NIL) (#6=#:G412 NIL) (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 34)) |a|)
                ((SPADCALL |b| (QREFELT $ 34)) |b|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |ta| NIL) (LETT #6# (REVERSE |a|)) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |ta| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (|MRING;sortAndAdd|
                                 (PROGN
                                  (LETT #5# NIL)
                                  (SEQ (LETT |tb| NIL) (LETT #4# |b|) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN (LETT |tb| (CAR #4#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |ta|)
                                                           (QCAR |tb|)
                                                           (QREFELT $ 103))
                                                 (SPADCALL (QCDR |ta|)
                                                           (QCDR |tb|)
                                                           (QREFELT $ 52)))
                                                #5#))))
                                       (LETT #4# (CDR #4#)) (GO G190) G191
                                       (EXIT (NREVERSE #5#))))
                                 $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 15))))))))) 

(SDEFUN |MRING;*;3$;50| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G417 NIL) (#2=#:G416 ($)) (#3=#:G418 ($)) (|r| (R))
          (#4=#:G434 NIL) (|tb| NIL) (#5=#:G433 NIL) (#6=#:G432 NIL)
          (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 34)) |a|)
                ((SPADCALL |b| (QREFELT $ 34)) |b|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |ta| NIL) (LETT #6# (REVERSE |a|)) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |ta| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (|MRING;sortAndAdd|
                                 (PROGN
                                  (LETT #5# NIL)
                                  (SEQ (LETT |tb| NIL) (LETT #4# |b|) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN (LETT |tb| (CAR #4#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL
                                             (LETT |r|
                                                   (SPADCALL (QCDR |ta|)
                                                             (QCDR |tb|)
                                                             (QREFELT $ 52)))
                                             (QREFELT $ 94)))
                                           (LETT #5#
                                                 (CONS
                                                  (CONS
                                                   (SPADCALL (QCAR |ta|)
                                                             (QCAR |tb|)
                                                             (QREFELT $ 103))
                                                   |r|)
                                                  #5#))))))
                                       (LETT #4# (CDR #4#)) (GO G190) G191
                                       (EXIT (NREVERSE #5#))))
                                 $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 15))))))))) 

(SDEFUN |MRING;=;2$B;51| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 65)) NIL)
              ('T
               (SPADCALL (SPADCALL |a| (QREFELT $ 106))
                         (SPADCALL |b| (QREFELT $ 106)) (QREFELT $ 107))))) 

(SDEFUN |MRING;coefficient;$MR;52| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G444 NIL) (#2=#:G445 NIL) (#3=#:G446 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |t| NIL) (LETT #3# |a|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QCAR |t|) |m| (QREFELT $ 62))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (QCDR |t|))
                                     (GO #4=#:G443)))
                              (GO #5=#:G441))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (|spadConstant| $ 16))))
                #4# (EXIT #2#)))) 

(SDEFUN |MRING;addterm| ((|Tabl| |AssociationList| M R) (|r| R) (|m| M) ($ R))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 109)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |u| 1)
                           (NULL
                            (SPADCALL
                             (LETT |r|
                                   (SPADCALL |r| (QCDR |u|) (QREFELT $ 93)))
                             (QREFELT $ 94))))
                       (SPADCALL |Tabl| |m| |r| (QREFELT $ 110)))
                      ('T
                       (SEQ (SPADCALL |m| |Tabl| (QREFELT $ 111))
                            (EXIT (|spadConstant| $ 16))))))))) 

(SDEFUN |MRING;+;3$;54| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G464 NIL) (|m| NIL) (#2=#:G463 NIL) (#3=#:G462 NIL) (|t| NIL)
          (#4=#:G461 NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 112)))
              (SEQ (LETT |t| NIL) (LETT #4# (|MRING;rep| |a| $)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |Tabl| (QCAR |t|) (QCDR |t|) (QREFELT $ 110))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |t| NIL) (LETT #3# (|MRING;rep| |b| $)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (|MRING;addterm| |Tabl| (QCDR |t|) (QCAR |t|) $)))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |m| NIL)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 113))) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 114)))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MRING;*;3$;55| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G474 NIL) (|m| NIL) (#2=#:G473 NIL) (#3=#:G472 NIL) (|tb| NIL)
          (#4=#:G471 NIL) (|ta| NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 112)))
              (SEQ (LETT |ta| NIL) (LETT #4# |a|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |ta| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |tb| NIL) (LETT #3# |b|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |tb| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (|MRING;addterm| |Tabl|
                             (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 52))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 103))
                             $)))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |m| NIL)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 113))) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 114)))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |MonoidRing;|)) 

(DEFUN |MonoidRing| (&REST #1=#:G477)
  (SPROG NIL
         (PROG (#2=#:G478)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MonoidRing|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MonoidRing;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|MonoidRing|)))))))))) 

(DEFUN |MonoidRing;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G475 NIL) (#2=#:G476 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|MonoidRing| DV$1 DV$2))
    (LETT $ (GETREFV 119))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #2#
                                            (|HasCategory| |#2|
                                                           '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| |#2| '(|OrderedSet|)))
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
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|Finite|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|Comparable|)))
                                         #1#
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
                                        (AND #2#
                                             (|HasCategory| |#2|
                                                            '(|CommutativeStar|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (AND #2#
                                             (|HasCategory| |#2|
                                                            '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| |#2| '(|Comparable|))
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedSet|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|Comparable|)))
                                         #1#
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedSet|))))))))
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
         (QSETREFV $ 25 (CONS (|dispatchFunction| |MRING;size;Nni;7|) $))
         (QSETREFV $ 33 (CONS (|dispatchFunction| |MRING;index;Pi$;8|) $))
         (QSETREFV $ 38
                   (CONS (|dispatchFunction| |MRING;lookup;$Pi;9|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 53 (CONS (|dispatchFunction| |MRING;*;R2$;19|) $)))
     ('T (QSETREFV $ 53 (CONS (|dispatchFunction| |MRING;*;R2$;20|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 56 (CONS (|dispatchFunction| |MRING;*;I2$;21|) $)))
     ('T (QSETREFV $ 56 (CONS (|dispatchFunction| |MRING;*;I2$;22|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (COND
       ((|HasCategory| |#2| '(|Group|))
        (QSETREFV $ 69 (CONS (|dispatchFunction| |MRING;recip;$U;27|) $)))
       ('T
        (QSETREFV $ 69 (CONS (|dispatchFunction| |MRING;recip;$U;28|) $))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 81
                 (CONS (|dispatchFunction| |MRING;leadingCoefficient;$R;31|)
                       $))
       (QSETREFV $ 82
                 (CONS (|dispatchFunction| |MRING;leadingSupport;$M;32|) $))
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |MRING;leadingMonomial;2$;33|) $))
       (QSETREFV $ 84 (CONS (|dispatchFunction| |MRING;leadingTerm;$R;34|) $))
       (QSETREFV $ 85 (CONS (|dispatchFunction| |MRING;reductum;2$;35|) $))
       (QSETREFV $ 86 (CONS (|dispatchFunction| |MRING;listOfTerms;$L;36|) $))
       (QSETREFV $ 88 (CONS (|dispatchFunction| |MRING;support;$L;37|) $))
       (QSETREFV $ 89
                 (CONS (|dispatchFunction| |MRING;constructOrdered;L$;38|) $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |MRING;construct;L$;40|) $))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (QSETREFV $ 97
                    (CONS (|dispatchFunction| |MRING;linearExtend;M$R;41|)
                          $)))))
       (QSETREFV $ 98 (CONS (|dispatchFunction| |MRING;=;2$B;42|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |MRING;+;3$;43|) $))
       (QSETREFV $ 102
                 (CONS (|dispatchFunction| |MRING;coefficient;$MR;44|) $))
       (COND
        ((|HasCategory| |#2| '(|OrderedMonoid|))
         (COND
          ((|HasCategory| |#1| '(|noZeroDivisors|))
           (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;45|) $)))
          ('T (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;46|) $)))))
        ('T
         (PROGN
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;49|) $)))
           ('T
            (QSETREFV $ 104
                      (CONS (|dispatchFunction| |MRING;*;3$;50|) $)))))))))
     ('T
      (PROGN
       (QSETREFV $ 98 (CONS (|dispatchFunction| |MRING;=;2$B;51|) $))
       (QSETREFV $ 102
                 (CONS (|dispatchFunction| |MRING;coefficient;$MR;52|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |MRING;+;3$;54|) $))
       (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;55|) $)))))
    $))) 

(MAKEPROP '|MonoidRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (0 . |characteristic|)
              |MRING;characteristic;Nni;3| (|Record| (|:| |k| 7) (|:| |c| 6))
              (|List| 12) |MRING;coerce;L$;4|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MRING;Zero;$;10|) $))
              (4 . |Zero|) (|Boolean|) (8 . =) |MRING;monomial;RM$;5|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MRING;One;$;11|) $))
              (14 . <=) |MRING;monomial?;$B;6| (20 . |size|) (24 . |size|)
              (28 . |size|) (|Integer|) (32 . >) (38 . ~=) (|PositiveInteger|)
              (44 . |index|) (49 . |index|) (54 . +) (60 . |index|)
              (65 . |zero?|) |MRING;terms;$L;12| (70 . |lookup|)
              (75 . |lookup|) (80 . |lookup|) (85 . |One|) (89 . |One|)
              (93 . |copy|) (|List| $) |MRING;monomials;$L;13| (|List| 6)
              |MRING;coefficients;$L;14| |MRING;coerce;M$;15|
              |MRING;coerce;R$;16| (98 . |coerce|) |MRING;coerce;I$;17|
              (103 . -) |MRING;-;2$;18| (108 . *) (114 . *) (120 . ~=)
              (126 . *) (132 . *) (|Mapping| 6 6) |MRING;map;M2$;23|
              |MRING;numberOfMonomials;$Nni;24| (|Union| 7 '"failed")
              |MRING;retractIfCan;$U;25| (138 . =) (|Union| 6 '"failed")
              |MRING;retractIfCan;$U;26| (144 . ~=) (|Union| $ '"failed")
              (150 . |recip|) (155 . |inv|) (160 . |recip|) (165 . ~=)
              (|OutputForm|) (171 . |coerce|) (176 . |coerce|) (181 . *)
              (187 . |coerce|) (192 . +) (|Mapping| 71 71 71) (|List| 71)
              (198 . |reduce|) |MRING;coerce;$Of;30|
              (204 . |leadingCoefficient|) (209 . |leadingSupport|)
              (214 . |leadingMonomial|) (219 . |leadingTerm|)
              (224 . |reductum|) (229 . |listOfTerms|) (|List| 7)
              (234 . |support|) (239 . |constructOrdered|) (244 . |smaller?|)
              (|Mapping| 17 12 12) (250 . |sort|) (256 . +) (262 . |zero?|)
              (267 . |construct|) (|Mapping| 6 7) (272 . |linearExtend|)
              (278 . =) (284 . |concat!|) (290 . |concat|) (296 . |concat!|)
              (302 . |coefficient|) (308 . *) (314 . *) (|Set| 12)
              (320 . |set|) (325 . =) (|AssociationList| 7 6) (331 . |search|)
              (337 . |setelt!|) (344 . |remove!|) (350 . |table|)
              (354 . |keys|) (359 . |elt|) (|InputForm|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 365 |zero?| 371 |terms| 376 |support| 381 |sup| 386
              |subtractIfCan| 392 |smaller?| 398 |size| 404 |sample| 408
              |rightRecip| 412 |rightPower| 417 |retractIfCan| 429 |retract|
              439 |reductum| 449 |recip| 454 |random| 459 |opposite?| 463
              |one?| 469 |numberOfMonomials| 474 |monomials| 479 |monomial?|
              484 |monomial| 489 |min| 495 |max| 501 |map| 507 |lookup| 513
              |listOfTerms| 518 |linearExtend| 523 |leftRecip| 529 |leftPower|
              534 |leadingTerm| 546 |leadingSupport| 551 |leadingMonomial| 556
              |leadingCoefficient| 561 |latex| 566 |index| 571 |hashUpdate!|
              576 |hash| 582 |enumerate| 587 |convert| 591 |constructOrdered|
              596 |construct| 601 |commutator| 606 |coerce| 612 |coefficients|
              642 |coefficient| 647 |charthRoot| 653 |characteristic| 658
              |associator| 662 |antiCommutator| 669 |annihilate?| 675 ^ 681
              |Zero| 693 |One| 697 >= 701 > 707 = 713 <= 719 < 725 - 731 + 742
              * 748)
           'NIL
           (CONS
            (|makeByteWordVec2| 10
                                '(0 8 8 2 9 10 0 0 0 1 0 2 1 8 0 0 3 4 0 0 0 3
                                  3 1 4 0 5 0 0 0 5 0 0 0 0 5 6 0 0 7 0 8 0 0 0
                                  0 0 5 6 8))
            (CONS
             '#(NIL NIL |Algebra&| |Algebra&| NIL NIL NIL |Rng&| NIL
                |FreeModuleCategory&| NIL |Module&| NIL |Module&|
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |OrderedSet&| |Finite&| |Magma&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL |RetractableTo&| |RetractableTo&| NIL
                |BasicType&| NIL |PartialOrder&| NIL NIL)
             (CONS
              '#((|MonoidRingCategory| 6 7) (|CommutativeRing|) (|Algebra| $$)
                 (|Algebra| 6) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Ring|) (|Rng|) (|SemiRing|) (|FreeModuleCategory| 6 7)
                 (|SemiRng|) (|Module| 6) (|IndexedDirectProductCategory| 6 7)
                 (|Module| $$) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|OrderedSet|) (|Finite|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 6) (|RetractableTo| 7)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 71)
                 (|PartialOrder|) (|ConvertibleTo| 115) (|TwoSidedRecip|))
              (|makeByteWordVec2| 118
                                  '(0 6 9 10 0 6 0 16 2 6 17 0 0 18 2 9 17 0 0
                                    21 0 6 9 23 0 7 9 24 0 0 9 25 2 26 17 0 0
                                    27 2 26 17 0 0 28 1 6 0 29 30 1 7 0 29 31 2
                                    0 0 0 0 32 1 0 0 29 33 1 0 17 0 34 1 7 29 0
                                    36 1 6 29 0 37 1 0 29 0 38 0 6 0 39 0 7 0
                                    40 1 13 0 0 41 1 6 0 26 48 1 6 0 0 50 2 6 0
                                    0 0 52 2 0 0 6 0 53 2 6 17 0 0 54 2 6 0 26
                                    0 55 2 0 0 26 0 56 2 7 17 0 0 62 2 9 17 0 0
                                    65 1 6 66 0 67 1 7 0 0 68 1 0 66 0 69 2 7
                                    17 0 0 70 1 7 71 0 72 1 6 71 0 73 2 71 0 0
                                    0 74 1 26 71 0 75 2 71 0 0 0 76 2 78 71 77
                                    0 79 1 0 6 0 81 1 0 7 0 82 1 0 0 0 83 1 0
                                    12 0 84 1 0 0 0 85 1 0 13 0 86 1 0 87 0 88
                                    1 0 0 13 89 2 7 17 0 0 90 2 13 0 91 0 92 2
                                    6 0 0 0 93 1 6 17 0 94 1 0 0 13 95 2 0 6 96
                                    0 97 2 0 17 0 0 98 2 8 0 0 12 99 2 8 0 0 0
                                    100 2 8 0 0 0 101 2 0 6 0 7 102 2 7 0 0 0
                                    103 2 0 0 0 0 104 1 105 0 13 106 2 105 17 0
                                    0 107 2 108 63 7 0 109 3 108 6 0 7 6 110 2
                                    108 63 7 0 111 0 108 0 112 1 108 87 0 113 2
                                    108 6 0 7 114 2 0 17 0 0 1 1 0 17 0 34 1 0
                                    13 0 35 1 1 87 0 88 2 12 0 0 0 1 2 0 66 0 0
                                    1 2 14 17 0 0 1 0 6 9 25 0 0 0 1 1 0 66 0 1
                                    2 0 0 0 9 1 2 0 0 0 29 1 1 0 63 0 64 1 0 60
                                    0 61 1 0 6 0 1 1 0 7 0 1 1 1 0 0 85 1 0 66
                                    0 69 0 6 0 1 2 0 17 0 0 1 1 0 17 0 1 1 0 9
                                    0 59 1 0 42 0 43 1 0 17 0 22 2 0 0 6 7 19 2
                                    13 0 0 0 1 2 13 0 0 0 1 2 0 0 57 0 58 1 6
                                    29 0 38 1 1 13 0 86 2 11 6 96 0 97 1 0 66 0
                                    1 2 0 0 0 9 1 2 0 0 0 29 1 1 1 12 0 84 1 1
                                    7 0 82 1 1 0 0 83 1 1 6 0 81 1 0 116 0 1 1
                                    6 0 29 33 2 0 118 118 0 1 1 0 117 0 1 0 6
                                    42 1 1 6 115 0 1 1 1 0 13 89 1 1 0 13 95 2
                                    0 0 0 0 1 1 8 0 0 1 1 0 0 13 14 1 0 0 6 47
                                    1 0 0 7 46 1 0 0 26 49 1 0 71 0 80 1 0 44 0
                                    45 2 0 6 0 7 102 1 9 66 0 1 0 0 9 11 3 0 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 17 0 0 1 2 0 0 0 9
                                    1 2 0 0 0 29 1 0 0 0 15 0 0 0 20 2 13 17 0
                                    0 1 2 13 17 0 0 1 2 0 17 0 0 98 2 13 17 0 0
                                    1 2 13 17 0 0 1 1 0 0 0 51 2 0 0 0 0 1 2 0
                                    0 0 0 32 2 3 0 0 6 1 2 3 0 6 0 53 2 1 0 6 7
                                    1 2 1 0 7 6 1 2 0 0 9 0 1 2 0 0 26 0 56 2 0
                                    0 0 0 104 2 0 0 29 0 1)))))
           '|lookupComplete|)) 
