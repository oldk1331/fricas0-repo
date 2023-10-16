
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
        (<= (LENGTH (|MRING;rep| |x| $)) 1)) 

(SDEFUN |MRING;size;Nni;7| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 22)) (SPADCALL (QREFELT $ 23)))) 

(SDEFUN |MRING;index;Pi$;8| ((|i0| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|m| (M)) (#1=#:G168 NIL) (|cf| (R))
          (#2=#:G166 NIL) (|h| (|Integer|)) (|j| NIL) (|n| (|Integer|))
          (|p| (|Integer|)))
         (SEQ (LETT |i| (REM |i0| (SPADCALL (QREFELT $ 24))))
              (LETT |p| (SPADCALL (QREFELT $ 22)))
              (LETT |n| (SPADCALL (QREFELT $ 23)))
              (LETT |ans| (|spadConstant| $ 15))
              (SEQ (LETT |j| 0) G190 (COND ((NULL (> |i| 0)) (GO G191)))
                   (SEQ (LETT |h| (REM |i| |p|))
                        (COND
                         ((SPADCALL |h| 0 (QREFELT $ 26))
                          (SEQ
                           (LETT |cf|
                                 (SPADCALL
                                  (PROG1 (LETT #2# |h|)
                                    (|check_subtype2| (> #2# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 28)))
                           (LETT |m|
                                 (SPADCALL
                                  (PROG1 (LETT #1# (+ |j| |n|))
                                    (|check_subtype2| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 29)))
                           (EXIT
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL |cf| |m| (QREFELT $ 19))
                                            (QREFELT $ 30)))))))
                        (EXIT (LETT |i| (QUOTIENT2 |i| |p|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MRING;lookup;$Pi;9| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|res| (|Integer|)) (|co| (|Integer|))
          (|ex| #1=(|NonNegativeInteger|)) (|l| #1#) (#2=#:G181 NIL) (|te| NIL)
          (|n| (|Integer|)) (|p| (|Integer|))
          (|liTe| (|List| (|Record| (|:| |k| M) (|:| |c| R)))))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 32)) (SPADCALL (QREFELT $ 24)))
                ('T
                 (SEQ (LETT |liTe| (SPADCALL |z| (QREFELT $ 33)))
                      (LETT |p| (SPADCALL (QREFELT $ 22)))
                      (LETT |n| (SPADCALL (QREFELT $ 23))) (LETT |res| 0)
                      (SEQ (LETT |te| NIL) (LETT #2# |liTe|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |te| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |l| (SPADCALL (QCAR |te|) (QREFELT $ 34)))
                            (LETT |ex| (COND ((EQL |n| |l|) 0) ('T |l|)))
                            (LETT |co| (SPADCALL (QCDR |te|) (QREFELT $ 35)))
                            (EXIT
                             (LETT |res| (+ |res| (* |co| (EXPT |p| |ex|))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(PUT '|MRING;Zero;$;10| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |MRING;Zero;$;10| (($ $)) NIL) 

(SDEFUN |MRING;One;$;11| (($ $))
        (LIST (CONS (|spadConstant| $ 38) (|spadConstant| $ 37)))) 

(SDEFUN |MRING;terms;$L;12|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPADCALL (|MRING;rep| |a| $) (QREFELT $ 39))) 

(SDEFUN |MRING;monomials;$L;13| ((|a| $) ($ |List| $))
        (SPROG ((#1=#:G191 NIL) (|t| NIL) (#2=#:G190 NIL))
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
        (SPROG ((#1=#:G196 NIL) (|t| NIL) (#2=#:G195 NIL))
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
        (LIST (CONS |m| (|spadConstant| $ 37)))) 

(SDEFUN |MRING;coerce;R$;16| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
          (|spadConstant| $ 15))
         ('T (LIST (CONS (|spadConstant| $ 38) |r|))))) 

(SDEFUN |MRING;coerce;I$;17| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 15))
              ('T
               (LIST
                (CONS (|spadConstant| $ 38) (SPADCALL |n| (QREFELT $ 46))))))) 

(SDEFUN |MRING;-;2$;18| ((|a| $) ($ $))
        (SPROG ((#1=#:G207 NIL) (|t| NIL) (#2=#:G206 NIL))
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
                                     (SPADCALL (QCDR |t|) (QREFELT $ 48)))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;*;R2$;19| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G212 NIL) (|t| NIL) (#2=#:G211 NIL))
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
                                                 (QREFELT $ 50)))
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;R2$;20| ((|r| R) (|a| $) ($ $))
        (SPROG ((|rt| (R)) (#1=#:G217 NIL) (|t| NIL) (#2=#:G216 NIL))
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
                                   (SPADCALL |r| (QCDR |t|) (QREFELT $ 50)))
                             (|spadConstant| $ 16) (QREFELT $ 52))
                            (LETT #2# (CONS (CONS (QCAR |t|) |rt|) #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;21| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((#1=#:G222 NIL) (|t| NIL) (#2=#:G221 NIL))
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
                                                      (QREFELT $ 53)))
                                      #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;22| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((|nt| (R)) (#1=#:G227 NIL) (|t| NIL) (#2=#:G226 NIL))
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
                                                  (QREFELT $ 53)))
                                  (|spadConstant| $ 16) (QREFELT $ 52))
                                 (LETT #2#
                                       (CONS (CONS (QCAR |t|) |nt|) #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;map;M2$;23| ((|f| |Mapping| R R) (|a| $) ($ $))
        (SPROG ((|ft| (R)) (#1=#:G233 NIL) (|t| NIL) (#2=#:G232 NIL))
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
                                    (|spadConstant| $ 16) (QREFELT $ 52))
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
            ((SPADCALL (QCDR (|SPADfirst| |a|)) (|spadConstant| $ 37)
                       (QREFELT $ 18))
             (EXIT (CONS 0 (QCAR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;retractIfCan;$U;26| ((|a| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 38)
                       (QREFELT $ 60))
             (EXIT (CONS 0 (QCDR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;recip;$U;27| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)) (|lt| ($)))
               (SEQ (LETT |lt| (SPADCALL |a| (QREFELT $ 33)))
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |lt|) 1 (QREFELT $ 63))
                       (CONS 1 "failed"))
                      (#2='T
                       (SEQ
                        (LETT |u|
                              (SPADCALL (QCDR (|SPADfirst| |lt|))
                                        (QREFELT $ 65)))
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#2#
                                (CONS 0
                                      (SPADCALL (QCDR |u|)
                                                (SPADCALL
                                                 (QCAR (|SPADfirst| |lt|))
                                                 (QREFELT $ 66))
                                                (QREFELT $ 19))))))))))))) 

(SDEFUN |MRING;recip;$U;28| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL (LENGTH |a|) 1 (QREFELT $ 63))
                      (SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 38)
                                (QREFELT $ 68)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |a|)) (QREFELT $ 65)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 45)))))))))))) 

(SDEFUN |MRING;mkTerm| ((|r| R) (|m| M) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 37) (QREFELT $ 18))
          (SPADCALL |m| (QREFELT $ 70)))
         ((OR (SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
              (SPADCALL |m| (|spadConstant| $ 38) (QREFELT $ 60)))
          (SPADCALL |r| (QREFELT $ 71)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 71)) (SPADCALL |m| (QREFELT $ 70))
                    (QREFELT $ 72))))) 

(SDEFUN |MRING;coerce;$Of;30| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G288 NIL) (|t| NIL) (#2=#:G287 NIL))
               (SEQ
                (COND ((NULL |a|) (SPADCALL 0 (QREFELT $ 73)))
                      ((NULL (CDR |a|))
                       (|MRING;mkTerm| (QCDR (|SPADfirst| |a|))
                        (QCAR (|SPADfirst| |a|)) $))
                      ('T
                       (SPADCALL (ELT $ 74)
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
                                 (QREFELT $ 77))))))) 

(SDEFUN |MRING;leadingCoefficient;$R;31| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 16)) ('T (QCDR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingSupport;$M;32| ((|a| $) ($ M))
        (COND ((NULL |a|) (|spadConstant| $ 38)) ('T (QCAR (|SPADfirst| |a|))))) 

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
        (SPROG ((#1=#:G309 NIL) (|t| NIL) (#2=#:G308 NIL))
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
        (SPADCALL (QCAR |t1|) (QCAR |t2|) (QREFELT $ 88))) 

(SDEFUN |MRING;construct;L$;40|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (#1=#:G328 NIL)
          (|xs| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (|newc| (R))
          (|t2| #2=(|Record| (|:| |k| M) (|:| |c| R))) (|t1| #2#))
         (SEQ
          (LETT |xs|
                (SPADCALL (CONS (|function| |MRING;termless|) $) |x|
                          (QREFELT $ 90)))
          (LETT |res| NIL)
          (SEQ G190 (COND ((NULL (NULL (NULL |xs|))) (GO G191)))
               (SEQ (LETT |t1| (|SPADfirst| |xs|)) (LETT |xs| (CDR |xs|))
                    (LETT |newc| (QCDR |t1|))
                    (SEQ
                     (EXIT
                      (SEQ G190 (COND ((NULL (NULL (NULL |xs|))) (GO G191)))
                           (SEQ (LETT |t2| (|SPADfirst| |xs|))
                                (EXIT
                                 (COND
                                  ((SPADCALL (QCAR |t1|) (QCAR |t2|)
                                             (QREFELT $ 60))
                                   (SEQ
                                    (LETT |newc|
                                          (SPADCALL |newc| (QCDR |t2|)
                                                    (QREFELT $ 91)))
                                    (EXIT (LETT |xs| (CDR |xs|)))))
                                  ('T
                                   (PROGN
                                    (LETT #1# |$NoValue|)
                                    (GO #3=#:G322))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #3# (EXIT #1#))
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |newc| (QREFELT $ 92)))
                       (LETT |res|
                             (COND
                              ((SPADCALL |newc| (QCDR |t1|) (QREFELT $ 18))
                               (CONS |t1| |res|))
                              ('T (CONS (CONS (QCAR |t1|) |newc|) |res|))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |MRING;linearExtend;M$R;41| ((|f| |Mapping| R M) (|x| $) ($ R))
        (SPROG ((|res| (R)) (#1=#:G335 NIL) (|t| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 32)) (|spadConstant| $ 16))
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
                                                             (QREFELT $ 50))
                                                   (QREFELT $ 91)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |res|))))))) 

(SDEFUN |MRING;=;2$B;42| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G343 NIL) (#2=#:G344 NIL) (#3=#:G345 NIL) (|ta| NIL)
          (#4=#:G346 NIL) (|tb| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH (|MRING;rep| |a| $))
                       (LENGTH (|MRING;rep| |b| $)) (QREFELT $ 63))
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
                        ((OR (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 52))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 68)))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# NIL) (GO #5=#:G342)))
                          (GO #6=#:G339))))))
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
                                           (QREFELT $ 88))
                                 (SEQ (LETT |repa| |ra|)
                                      (EXIT (CONS |ta| |res|))))
                                ((SPADCALL (QCAR |ta|) (QCAR |tb|)
                                           (QREFELT $ 88))
                                 (SEQ (LETT |repb| |rb|)
                                      (EXIT (CONS |tb| |res|))))
                                ('T
                                 (SEQ (LETT |repa| |ra|) (LETT |repb| |rb|)
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (LETT |r|
                                                (SPADCALL (QCDR |ta|)
                                                          (QCDR |tb|)
                                                          (QREFELT $ 91)))
                                          (QREFELT $ 92)))
                                        (EXIT
                                         (CONS (CONS (QCAR |ta|) |r|) |res|))))
                                      (EXIT |res|)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (|MRING;per|
                (SPADCALL (NREVERSE |res|)
                          (COND ((NULL |repa|) |repb|) ('T |repa|))
                          (QREFELT $ 97))
                $))))) 

(SDEFUN |MRING;coefficient;$MR;44| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G367 NIL) (#2=#:G368 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |t| NIL) (LETT #2# |a|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |t|) |m| (QREFELT $ 60))
                          (PROGN (LETT #1# (QCDR |t|)) (GO #3=#:G366))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |t|) |m| (QREFELT $ 88))
                           (PROGN
                            (LETT #1# (|spadConstant| $ 16))
                            (GO #3#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 16))))
                #3# (EXIT #1#)))) 

(SDEFUN |MRING;*;3$;45| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G371 NIL) (#2=#:G370 ($)) (#3=#:G372 ($)) (#4=#:G377 NIL)
          (|tb| NIL) (#5=#:G376 NIL) (#6=#:G375 NIL) (|ta| NIL))
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
                                                   (QREFELT $ 99))
                                         (SPADCALL (QCDR |ta|) (QCDR |tb|)
                                                   (QREFELT $ 50)))
                                        #5#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 30))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |MRING;*;3$;46| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G380 NIL) (#2=#:G379 ($)) (#3=#:G381 ($)) (|r| (R))
          (#4=#:G387 NIL) (|tb| NIL) (#5=#:G386 NIL) (#6=#:G385 NIL)
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
                                                     (QREFELT $ 50)))
                                     (QREFELT $ 92)))
                                   (LETT #5#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                     (QREFELT $ 99))
                                           |r|)
                                          #5#))))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 30))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |MRING;ge|
        ((|s| |Record| (|:| |k| M) (|:| |c| R))
         (|t| |Record| (|:| |k| M) (|:| |c| R)) ($ |Boolean|))
        (NULL (SPADCALL (QCAR |s|) (QCAR |t|) (QREFELT $ 88)))) 

(SDEFUN |MRING;sortAndAdd|
        ((|liTe| |List| (|Record| (|:| |k| M) (|:| |c| R)))
         ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (|cf| (R))
          (|m| (M)) (#1=#:G403 NIL) (|te| NIL))
         (SEQ
          (LETT |liTe|
                (SPADCALL (CONS (|function| |MRING;ge|) $) |liTe|
                          (QREFELT $ 90)))
          (LETT |m| (QCAR (|SPADfirst| |liTe|)))
          (LETT |cf| (QCDR (|SPADfirst| |liTe|))) (LETT |res| NIL)
          (SEQ (LETT |te| NIL) (LETT #1# (CDR |liTe|)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |te| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |m| (QCAR |te|) (QREFELT $ 60))
                   (LETT |cf| (SPADCALL |cf| (QCDR |te|) (QREFELT $ 91))))
                  ('T
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |cf| (QREFELT $ 92)))
                      (LETT |res| (CONS (CONS |m| |cf|) |res|))))
                    (LETT |m| (QCAR |te|)) (EXIT (LETT |cf| (QCDR |te|))))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (SPADCALL |cf| (QREFELT $ 92)))
            (LETT |res| (CONS (CONS |m| |cf|) |res|))))
          (EXIT (REVERSE |res|))))) 

(SDEFUN |MRING;*;3$;49| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G406 NIL) (#2=#:G405 ($)) (#3=#:G407 ($)) (#4=#:G418 NIL)
          (|tb| NIL) (#5=#:G417 NIL) (#6=#:G416 NIL) (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 32)) |a|)
                ((SPADCALL |b| (QREFELT $ 32)) |b|)
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
                                                           (QREFELT $ 99))
                                                 (SPADCALL (QCDR |ta|)
                                                           (QCDR |tb|)
                                                           (QREFELT $ 50)))
                                                #5#))))
                                       (LETT #4# (CDR #4#)) (GO G190) G191
                                       (EXIT (NREVERSE #5#))))
                                 $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 30))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 15))))))))) 

(SDEFUN |MRING;*;3$;50| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G421 NIL) (#2=#:G420 ($)) (#3=#:G422 ($)) (|r| (R))
          (#4=#:G438 NIL) (|tb| NIL) (#5=#:G437 NIL) (#6=#:G436 NIL)
          (|ta| NIL))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 32)) |a|)
                ((SPADCALL |b| (QREFELT $ 32)) |b|)
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
                                                             (QREFELT $ 50)))
                                             (QREFELT $ 92)))
                                           (LETT #5#
                                                 (CONS
                                                  (CONS
                                                   (SPADCALL (QCAR |ta|)
                                                             (QCAR |tb|)
                                                             (QREFELT $ 99))
                                                   |r|)
                                                  #5#))))))
                                       (LETT #4# (CDR #4#)) (GO G190) G191
                                       (EXIT (NREVERSE #5#))))
                                 $))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 30))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 15))))))))) 

(SDEFUN |MRING;=;2$B;51| ((|a| $) (|b| $) ($ |Boolean|))
        (COND ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 63)) NIL)
              ('T
               (SPADCALL (SPADCALL |a| (QREFELT $ 102))
                         (SPADCALL |b| (QREFELT $ 102)) (QREFELT $ 103))))) 

(SDEFUN |MRING;coefficient;$MR;52| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G448 NIL) (#2=#:G449 NIL) (#3=#:G450 NIL) (|t| NIL))
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
                            ((SPADCALL (QCAR |t|) |m| (QREFELT $ 60))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (QCDR |t|))
                                     (GO #4=#:G447)))
                              (GO #5=#:G445))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (|spadConstant| $ 16))))
                #4# (EXIT #2#)))) 

(SDEFUN |MRING;addterm| ((|Tabl| |AssociationList| M R) (|r| R) (|m| M) ($ R))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 105)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |u| 1)
                           (NULL
                            (SPADCALL
                             (LETT |r|
                                   (SPADCALL |r| (QCDR |u|) (QREFELT $ 91)))
                             (QREFELT $ 92))))
                       (SPADCALL |Tabl| |m| |r| (QREFELT $ 106)))
                      ('T
                       (SEQ (SPADCALL |m| |Tabl| (QREFELT $ 107))
                            (EXIT (|spadConstant| $ 16))))))))) 

(SDEFUN |MRING;+;3$;54| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G468 NIL) (|m| NIL) (#2=#:G467 NIL) (#3=#:G466 NIL) (|t| NIL)
          (#4=#:G465 NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 108)))
              (SEQ (LETT |t| NIL) (LETT #4# (|MRING;rep| |a| $)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |Tabl| (QCAR |t|) (QCDR |t|) (QREFELT $ 106))))
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
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 109))) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 110)))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MRING;*;3$;55| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G478 NIL) (|m| NIL) (#2=#:G477 NIL) (#3=#:G476 NIL) (|tb| NIL)
          (#4=#:G475 NIL) (|ta| NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 108)))
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
                             (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 50))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 99))
                             $)))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |m| NIL)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 109))) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 110)))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |MonoidRing;|)) 

(DEFUN |MonoidRing| (&REST #1=#:G481)
  (SPROG NIL
         (PROG (#2=#:G482)
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
   ((|pv$| NIL) (#1=#:G479 NIL) (#2=#:G480 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|MonoidRing| DV$1 DV$2))
    (LETT $ (GETREFV 115))
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
         (QSETREFV $ 24 (CONS (|dispatchFunction| |MRING;size;Nni;7|) $))
         (QSETREFV $ 31 (CONS (|dispatchFunction| |MRING;index;Pi$;8|) $))
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |MRING;lookup;$Pi;9|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 51 (CONS (|dispatchFunction| |MRING;*;R2$;19|) $)))
     ('T (QSETREFV $ 51 (CONS (|dispatchFunction| |MRING;*;R2$;20|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 54 (CONS (|dispatchFunction| |MRING;*;I2$;21|) $)))
     ('T (QSETREFV $ 54 (CONS (|dispatchFunction| |MRING;*;I2$;22|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (COND
       ((|HasCategory| |#2| '(|Group|))
        (QSETREFV $ 67 (CONS (|dispatchFunction| |MRING;recip;$U;27|) $)))
       ('T
        (QSETREFV $ 67 (CONS (|dispatchFunction| |MRING;recip;$U;28|) $))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 79
                 (CONS (|dispatchFunction| |MRING;leadingCoefficient;$R;31|)
                       $))
       (QSETREFV $ 80
                 (CONS (|dispatchFunction| |MRING;leadingSupport;$M;32|) $))
       (QSETREFV $ 81
                 (CONS (|dispatchFunction| |MRING;leadingMonomial;2$;33|) $))
       (QSETREFV $ 82 (CONS (|dispatchFunction| |MRING;leadingTerm;$R;34|) $))
       (QSETREFV $ 83 (CONS (|dispatchFunction| |MRING;reductum;2$;35|) $))
       (QSETREFV $ 84 (CONS (|dispatchFunction| |MRING;listOfTerms;$L;36|) $))
       (QSETREFV $ 86 (CONS (|dispatchFunction| |MRING;support;$L;37|) $))
       (QSETREFV $ 87
                 (CONS (|dispatchFunction| |MRING;constructOrdered;L$;38|) $))
       (QSETREFV $ 93 (CONS (|dispatchFunction| |MRING;construct;L$;40|) $))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (QSETREFV $ 95
                    (CONS (|dispatchFunction| |MRING;linearExtend;M$R;41|)
                          $)))))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |MRING;=;2$B;42|) $))
       (QSETREFV $ 30 (CONS (|dispatchFunction| |MRING;+;3$;43|) $))
       (QSETREFV $ 98 (CONS (|dispatchFunction| |MRING;coefficient;$MR;44|) $))
       (COND
        ((|HasCategory| |#2| '(|OrderedMonoid|))
         (COND
          ((|HasCategory| |#1| '(|noZeroDivisors|))
           (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;45|) $)))
          ('T (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;46|) $)))))
        ('T
         (PROGN
          (COND
           ((|HasCategory| |#1| '(|noZeroDivisors|))
            (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;49|) $)))
           ('T
            (QSETREFV $ 100
                      (CONS (|dispatchFunction| |MRING;*;3$;50|) $)))))))))
     ('T
      (PROGN
       (QSETREFV $ 96 (CONS (|dispatchFunction| |MRING;=;2$B;51|) $))
       (QSETREFV $ 98 (CONS (|dispatchFunction| |MRING;coefficient;$MR;52|) $))
       (QSETREFV $ 30 (CONS (|dispatchFunction| |MRING;+;3$;54|) $))
       (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;*;3$;55|) $)))))
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
              |MRING;monomial?;$B;6| (14 . |size|) (18 . |size|) (22 . |size|)
              (|Integer|) (26 . ~=) (|PositiveInteger|) (32 . |index|)
              (37 . |index|) (42 . +) (48 . |index|) (53 . |zero?|)
              |MRING;terms;$L;12| (58 . |lookup|) (63 . |lookup|)
              (68 . |lookup|) (73 . |One|) (77 . |One|) (81 . |copy|)
              (|List| $) |MRING;monomials;$L;13| (|List| 6)
              |MRING;coefficients;$L;14| |MRING;coerce;M$;15|
              |MRING;coerce;R$;16| (86 . |coerce|) |MRING;coerce;I$;17|
              (91 . -) |MRING;-;2$;18| (96 . *) (102 . *) (108 . ~=) (114 . *)
              (120 . *) (|Mapping| 6 6) |MRING;map;M2$;23|
              |MRING;numberOfMonomials;$Nni;24| (|Union| 7 '"failed")
              |MRING;retractIfCan;$U;25| (126 . =) (|Union| 6 '"failed")
              |MRING;retractIfCan;$U;26| (132 . ~=) (|Union| $ '"failed")
              (138 . |recip|) (143 . |inv|) (148 . |recip|) (153 . ~=)
              (|OutputForm|) (159 . |coerce|) (164 . |coerce|) (169 . *)
              (175 . |coerce|) (180 . +) (|Mapping| 69 69 69) (|List| 69)
              (186 . |reduce|) |MRING;coerce;$Of;30|
              (192 . |leadingCoefficient|) (197 . |leadingSupport|)
              (202 . |leadingMonomial|) (207 . |leadingTerm|)
              (212 . |reductum|) (217 . |listOfTerms|) (|List| 7)
              (222 . |support|) (227 . |constructOrdered|) (232 . |smaller?|)
              (|Mapping| 17 12 12) (238 . |sort|) (244 . +) (250 . |zero?|)
              (255 . |construct|) (|Mapping| 6 7) (260 . |linearExtend|)
              (266 . =) (272 . |concat!|) (278 . |coefficient|) (284 . *)
              (290 . *) (|Set| 12) (296 . |set|) (301 . =)
              (|AssociationList| 7 6) (307 . |search|) (313 . |setelt!|)
              (320 . |remove!|) (326 . |table|) (330 . |keys|) (335 . |elt|)
              (|InputForm|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 341 |zero?| 347 |terms| 352 |support| 357 |sup| 362
              |subtractIfCan| 368 |smaller?| 374 |size| 380 |sample| 384
              |rightRecip| 388 |rightPower| 393 |retractIfCan| 405 |retract|
              415 |reductum| 425 |recip| 430 |random| 435 |opposite?| 439
              |one?| 445 |numberOfMonomials| 450 |monomials| 455 |monomial?|
              460 |monomial| 465 |min| 471 |max| 477 |map| 483 |lookup| 489
              |listOfTerms| 494 |linearExtend| 499 |leftRecip| 505 |leftPower|
              510 |leadingTerm| 522 |leadingSupport| 527 |leadingMonomial| 532
              |leadingCoefficient| 537 |latex| 542 |index| 547 |hashUpdate!|
              552 |hash| 558 |enumerate| 563 |convert| 567 |constructOrdered|
              572 |construct| 577 |commutator| 582 |coerce| 588 |coefficients|
              618 |coefficient| 623 |charthRoot| 629 |characteristic| 634
              |associator| 638 |antiCommutator| 645 |annihilate?| 651 ^ 657
              |Zero| 669 |One| 673 >= 677 > 683 = 689 <= 695 < 701 - 707 + 718
              * 724)
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
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 69)
                 (|PartialOrder|) (|ConvertibleTo| 111) (|TwoSidedRecip|))
              (|makeByteWordVec2| 114
                                  '(0 6 9 10 0 6 0 16 2 6 17 0 0 18 0 6 9 22 0
                                    7 9 23 0 0 9 24 2 25 17 0 0 26 1 6 0 27 28
                                    1 7 0 27 29 2 0 0 0 0 30 1 0 0 27 31 1 0 17
                                    0 32 1 7 27 0 34 1 6 27 0 35 1 0 27 0 36 0
                                    6 0 37 0 7 0 38 1 13 0 0 39 1 6 0 25 46 1 6
                                    0 0 48 2 6 0 0 0 50 2 0 0 6 0 51 2 6 17 0 0
                                    52 2 6 0 25 0 53 2 0 0 25 0 54 2 7 17 0 0
                                    60 2 9 17 0 0 63 1 6 64 0 65 1 7 0 0 66 1 0
                                    64 0 67 2 7 17 0 0 68 1 7 69 0 70 1 6 69 0
                                    71 2 69 0 0 0 72 1 25 69 0 73 2 69 0 0 0 74
                                    2 76 69 75 0 77 1 0 6 0 79 1 0 7 0 80 1 0 0
                                    0 81 1 0 12 0 82 1 0 0 0 83 1 0 13 0 84 1 0
                                    85 0 86 1 0 0 13 87 2 7 17 0 0 88 2 13 0 89
                                    0 90 2 6 0 0 0 91 1 6 17 0 92 1 0 0 13 93 2
                                    0 6 94 0 95 2 0 17 0 0 96 2 8 0 0 0 97 2 0
                                    6 0 7 98 2 7 0 0 0 99 2 0 0 0 0 100 1 101 0
                                    13 102 2 101 17 0 0 103 2 104 61 7 0 105 3
                                    104 6 0 7 6 106 2 104 61 7 0 107 0 104 0
                                    108 1 104 85 0 109 2 104 6 0 7 110 2 0 17 0
                                    0 1 1 0 17 0 32 1 0 13 0 33 1 1 85 0 86 2
                                    12 0 0 0 1 2 0 64 0 0 1 2 14 17 0 0 1 0 6 9
                                    24 0 0 0 1 1 0 64 0 1 2 0 0 0 9 1 2 0 0 0
                                    27 1 1 0 61 0 62 1 0 58 0 59 1 0 6 0 1 1 0
                                    7 0 1 1 1 0 0 83 1 0 64 0 67 0 6 0 1 2 0 17
                                    0 0 1 1 0 17 0 1 1 0 9 0 57 1 0 40 0 41 1 0
                                    17 0 21 2 0 0 6 7 19 2 13 0 0 0 1 2 13 0 0
                                    0 1 2 0 0 55 0 56 1 6 27 0 36 1 1 13 0 84 2
                                    11 6 94 0 95 1 0 64 0 1 2 0 0 0 9 1 2 0 0 0
                                    27 1 1 1 12 0 82 1 1 7 0 80 1 1 0 0 81 1 1
                                    6 0 79 1 0 112 0 1 1 6 0 27 31 2 0 114 114
                                    0 1 1 0 113 0 1 0 6 40 1 1 6 111 0 1 1 1 0
                                    13 87 1 1 0 13 93 2 0 0 0 0 1 1 8 0 0 1 1 0
                                    0 13 14 1 0 0 6 45 1 0 0 7 44 1 0 0 25 47 1
                                    0 69 0 78 1 0 42 0 43 2 0 6 0 7 98 1 9 64 0
                                    1 0 0 9 11 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 17
                                    0 0 1 2 0 0 0 9 1 2 0 0 0 27 1 0 0 0 15 0 0
                                    0 20 2 13 17 0 0 1 2 13 17 0 0 1 2 0 17 0 0
                                    96 2 13 17 0 0 1 2 13 17 0 0 1 1 0 0 0 49 2
                                    0 0 0 0 1 2 0 0 0 0 30 2 3 0 0 6 1 2 3 0 6
                                    0 51 2 1 0 6 7 1 2 1 0 7 6 1 2 0 0 9 0 1 2
                                    0 0 25 0 54 2 0 0 0 0 100 2 0 0 27 0 1)))))
           '|lookupComplete|)) 
