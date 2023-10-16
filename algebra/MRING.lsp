
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
        (COND ((NULL |x|) 'T) ('T (NULL (CDR |x|))))) 

(SDEFUN |MRING;size;Nni;7| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 21)) (SPADCALL (QREFELT $ 22)))) 

(SDEFUN |MRING;index;Pi$;8| ((|i0| |PositiveInteger|) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|ans| ($)) (|m| (M)) (#1=#:G171 NIL) (|cf| (R))
          (#2=#:G169 NIL) (|h| (|Integer|)) (|j| NIL) (|n| (|Integer|))
          (|p| (|Integer|)))
         (SEQ (LETT |i| (REM |i0| (SPADCALL (QREFELT $ 23))))
              (LETT |p| (SPADCALL (QREFELT $ 21)))
              (LETT |n| (SPADCALL (QREFELT $ 22)))
              (LETT |ans| (|spadConstant| $ 15))
              (SEQ (LETT |j| 0) G190 (COND ((NULL (> |i| 0)) (GO G191)))
                   (SEQ (LETT |h| (REM |i| |p|))
                        (COND
                         ((SPADCALL |h| 0 (QREFELT $ 25))
                          (SEQ
                           (LETT |cf|
                                 (SPADCALL
                                  (PROG1 (LETT #2# |h|)
                                    (|check_subtype2| (> #2# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 27)))
                           (LETT |m|
                                 (SPADCALL
                                  (PROG1 (LETT #1# (+ |j| |n|))
                                    (|check_subtype2| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 28)))
                           (EXIT
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL |cf| |m| (QREFELT $ 19))
                                            (QREFELT $ 29)))))))
                        (EXIT (LETT |i| (QUOTIENT2 |i| |p|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MRING;lookup;$Pi;9| ((|z| $) ($ |PositiveInteger|))
        (SPROG
         ((|res| (|Integer|)) (|co| (|Integer|))
          (|ex| #1=(|NonNegativeInteger|)) (|l| #1#) (#2=#:G184 NIL) (|te| NIL)
          (|n| (|Integer|)) (|p| (|Integer|))
          (|liTe| (|List| (|Record| (|:| |k| M) (|:| |c| R)))))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT $ 31)) (SPADCALL (QREFELT $ 23)))
                ('T
                 (SEQ (LETT |liTe| (SPADCALL |z| (QREFELT $ 32)))
                      (LETT |p| (SPADCALL (QREFELT $ 21)))
                      (LETT |n| (SPADCALL (QREFELT $ 22))) (LETT |res| 0)
                      (SEQ (LETT |te| NIL) (LETT #2# |liTe|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |te| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |l| (SPADCALL (QCAR |te|) (QREFELT $ 33)))
                            (LETT |ex| (COND ((EQL |n| |l|) 0) ('T |l|)))
                            (LETT |co| (SPADCALL (QCDR |te|) (QREFELT $ 34)))
                            (EXIT
                             (LETT |res| (+ |res| (* |co| (EXPT |p| |ex|))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(PUT '|MRING;Zero;$;10| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |MRING;Zero;$;10| (($ $)) NIL) 

(SDEFUN |MRING;One;$;11| (($ $))
        (LIST (CONS (|spadConstant| $ 38) (|spadConstant| $ 37)))) 

(PUT '|MRING;zero?;$B;12| '|SPADreplace| 'NULL) 

(SDEFUN |MRING;zero?;$B;12| ((|a| $) ($ |Boolean|)) (NULL |a|)) 

(SDEFUN |MRING;one?;$B;13| ((|a| $) ($ |Boolean|))
        (COND
         ((SPADCALL |a| 1 (QREFELT $ 39))
          (COND
           ((SPADCALL (QCDR (|SPADfirst| |a|)) (QREFELT $ 40))
            (SPADCALL (QCAR (|SPADfirst| |a|)) (QREFELT $ 41)))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |MRING;terms;$L;14|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (SPADCALL (|MRING;rep| |a| $) (QREFELT $ 43))) 

(SDEFUN |MRING;monomials;$L;15| ((|a| $) ($ |List| $))
        (SPROG ((#1=#:G199 NIL) (|t| NIL) (#2=#:G198 NIL))
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

(SDEFUN |MRING;coefficients;$L;16| ((|a| $) ($ |List| R))
        (SPROG ((#1=#:G204 NIL) (|t| NIL) (#2=#:G203 NIL))
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

(SDEFUN |MRING;coerce;M$;17| ((|m| M) ($ $))
        (LIST (CONS |m| (|spadConstant| $ 37)))) 

(SDEFUN |MRING;coerce;R$;18| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
          (|spadConstant| $ 15))
         ('T (LIST (CONS (|spadConstant| $ 38) |r|))))) 

(SDEFUN |MRING;coerce;I$;19| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 15))
              ('T
               (LIST
                (CONS (|spadConstant| $ 38) (SPADCALL |n| (QREFELT $ 50))))))) 

(SDEFUN |MRING;-;2$;20| ((|a| $) ($ $))
        (SPROG ((#1=#:G215 NIL) (|t| NIL) (#2=#:G214 NIL))
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
                                     (SPADCALL (QCDR |t|) (QREFELT $ 52)))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MRING;*;R2$;21| ((|r| R) (|a| $) ($ $))
        (SPROG ((#1=#:G221 NIL) (|t| NIL) (#2=#:G220 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
                  (|spadConstant| $ 15))
                 ((SPADCALL |r| (QREFELT $ 40)) |a|)
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
                                                 (QREFELT $ 54)))
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;R2$;22| ((|r| R) (|a| $) ($ $))
        (SPROG ((|rt| (R)) (#1=#:G227 NIL) (|t| NIL) (#2=#:G226 NIL))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
                  (|spadConstant| $ 15))
                 ((SPADCALL |r| (QREFELT $ 40)) |a|)
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
                                   (SPADCALL |r| (QCDR |t|) (QREFELT $ 54)))
                             (|spadConstant| $ 16) (QREFELT $ 56))
                            (LETT #2# (CONS (CONS (QCAR |t|) |rt|) #2#))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;23| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((#1=#:G232 NIL) (|t| NIL) (#2=#:G231 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 15)) ((EQL |n| 1) |a|)
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
                                                      (QREFELT $ 57)))
                                      #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;*;I2$;24| ((|n| |Integer|) (|a| $) ($ $))
        (SPROG ((|nt| (R)) (#1=#:G237 NIL) (|t| NIL) (#2=#:G236 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 15)) ((EQL |n| 1) |a|)
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
                                                  (QREFELT $ 57)))
                                  (|spadConstant| $ 16) (QREFELT $ 56))
                                 (LETT #2#
                                       (CONS (CONS (QCAR |t|) |nt|) #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MRING;map;M2$;25| ((|f| |Mapping| R R) (|a| $) ($ $))
        (SPROG ((|ft| (R)) (#1=#:G243 NIL) (|t| NIL) (#2=#:G242 NIL))
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
                                    (|spadConstant| $ 16) (QREFELT $ 56))
                          (LETT #2# (CONS (CONS (QCAR |t|) |ft|) #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|MRING;numberOfMonomials;$Nni;26| '|SPADreplace| 'LENGTH) 

(SDEFUN |MRING;numberOfMonomials;$Nni;26| ((|a| $) ($ |NonNegativeInteger|))
        (LENGTH |a|)) 

(SDEFUN |MRING;retractIfCan;$U;27| ((|a| $) ($ |Union| M "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCDR (|SPADfirst| |a|)) (|spadConstant| $ 37)
                       (QREFELT $ 18))
             (EXIT (CONS 0 (QCAR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;retractIfCan;$U;28| ((|a| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((EQL (LENGTH |a|) 1)
           (COND
            ((SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 38)
                       (QREFELT $ 64))
             (EXIT (CONS 0 (QCDR (|SPADfirst| |a|))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |MRING;recip;$U;29| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((NULL (SPADCALL |a| 1 (QREFELT $ 39))) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |a|)) (QREFELT $ 68)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|)
                                           (SPADCALL (QCAR (|SPADfirst| |a|))
                                                     (QREFELT $ 69))
                                           (QREFELT $ 19)))))))))))) 

(SDEFUN |MRING;recip;$U;30| ((|a| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL (LENGTH |a|) 1 (QREFELT $ 71))
                      (SPADCALL (QCAR (|SPADfirst| |a|)) (|spadConstant| $ 38)
                                (QREFELT $ 72)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |a|)) (QREFELT $ 68)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 49)))))))))))) 

(SDEFUN |MRING;mkTerm| ((|r| R) (|m| M) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 37) (QREFELT $ 18))
          (SPADCALL |m| (QREFELT $ 74)))
         ((OR (SPADCALL |r| (|spadConstant| $ 16) (QREFELT $ 18))
              (SPADCALL |m| (|spadConstant| $ 38) (QREFELT $ 64)))
          (SPADCALL |r| (QREFELT $ 75)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 75)) (SPADCALL |m| (QREFELT $ 74))
                    (QREFELT $ 76))))) 

(SDEFUN |MRING;coerce;$Of;32| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G298 NIL) (|t| NIL) (#2=#:G297 NIL))
               (SEQ
                (COND ((NULL |a|) (SPADCALL 0 (QREFELT $ 77)))
                      ((NULL (CDR |a|))
                       (|MRING;mkTerm| (QCDR (|SPADfirst| |a|))
                        (QCAR (|SPADfirst| |a|)) $))
                      ('T
                       (SPADCALL (ELT $ 78)
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
                                 (QREFELT $ 81))))))) 

(SDEFUN |MRING;leadingCoefficient;$R;33| ((|a| $) ($ R))
        (COND ((NULL |a|) (|spadConstant| $ 16)) ('T (QCDR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingSupport;$M;34| ((|a| $) ($ M))
        (COND ((NULL |a|) (|spadConstant| $ 38)) ('T (QCAR (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingMonomial;2$;35| ((|a| $) ($ $))
        (COND ((NULL (|MRING;rep| |a| $)) (|error| "empty support"))
              ('T (LIST (|SPADfirst| |a|))))) 

(SDEFUN |MRING;leadingTerm;$R;36|
        ((|a| $) ($ |Record| (|:| |k| M) (|:| |c| R)))
        (COND ((NULL |a|) (|error| "empty support")) ('T (|SPADfirst| |a|)))) 

(SDEFUN |MRING;reductum;2$;37| ((|a| $) ($ $))
        (COND ((NULL |a|) |a|) ('T (CDR |a|)))) 

(SDEFUN |MRING;listOfTerms;$L;38|
        ((|a| $) ($ |List| (|Record| (|:| |k| M) (|:| |c| R))))
        (|MRING;rep| |a| $)) 

(SDEFUN |MRING;support;$L;39| ((|a| $) ($ |List| M))
        (SPROG ((#1=#:G319 NIL) (|t| NIL) (#2=#:G318 NIL))
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

(SDEFUN |MRING;constructOrdered;L$;40|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (|MRING;per| |x| $)) 

(SDEFUN |MRING;termless|
        ((|t1| |Record| (|:| |k| M) (|:| |c| R))
         (|t2| |Record| (|:| |k| M) (|:| |c| R)) ($ |Boolean|))
        (SPADCALL (QCAR |t1|) (QCAR |t2|) (QREFELT $ 92))) 

(SDEFUN |MRING;construct!|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (SPROG
         ((|res| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (#1=#:G339 NIL)
          (|xs| (|List| (|Record| (|:| |k| M) (|:| |c| R)))) (|newc| (R))
          (|t2| #2=(|Record| (|:| |k| M) (|:| |c| R))) (|t1| #2#))
         (SEQ
          (LETT |xs|
                (SPADCALL (CONS (|function| |MRING;termless|) $) |x|
                          (QREFELT $ 94)))
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
                                             (QREFELT $ 64))
                                   (SEQ
                                    (LETT |newc|
                                          (SPADCALL |newc| (QCDR |t2|)
                                                    (QREFELT $ 95)))
                                    (EXIT (LETT |xs| (CDR |xs|)))))
                                  ('T
                                   (PROGN
                                    (LETT #1# |$NoValue|)
                                    (GO #3=#:G333))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #3# (EXIT #1#))
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |newc| (QREFELT $ 96)))
                       (LETT |res|
                             (COND
                              ((SPADCALL |newc| (QCDR |t1|) (QREFELT $ 18))
                               (CONS |t1| |res|))
                              ('T (CONS (CONS (QCAR |t1|) |newc|) |res|))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |MRING;construct;L$;43|
        ((|x| |List| (|Record| (|:| |k| M) (|:| |c| R))) ($ $))
        (|MRING;construct!| (SPADCALL |x| (QREFELT $ 43)) $)) 

(SDEFUN |MRING;linearExtend;M$R;44| ((|f| |Mapping| R M) (|x| $) ($ R))
        (SPROG ((|res| (R)) (#1=#:G348 NIL) (|t| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 31)) (|spadConstant| $ 16))
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
                                                             (QREFELT $ 54))
                                                   (QREFELT $ 95)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |res|))))))) 

(SDEFUN |MRING;=;2$B;45| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G356 NIL) (#2=#:G357 NIL) (#3=#:G358 NIL) (|ta| NIL)
          (#4=#:G359 NIL) (|tb| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH (|MRING;rep| |a| $))
                       (LENGTH (|MRING;rep| |b| $)) (QREFELT $ 71))
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
                        ((OR (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 56))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 72)))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# NIL) (GO #5=#:G355)))
                          (GO #6=#:G352))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #1#))
              (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MRING;+;3$;46| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (|r| (R)) (|repb| (|Rep|)) (|repa| (|Rep|))
          (|rb| (|Rep|)) (|ra| (|Rep|))
          (|tb| #1=(|Record| (|:| |k| M) (|:| |c| R))) (|ta| #1#))
         (SEQ
          (COND ((SPADCALL |a| (QREFELT $ 31)) |b|)
                ((SPADCALL |b| (QREFELT $ 31)) |a|)
                (#2='T
                 (SEQ (LETT |repa| (|MRING;rep| |a| $))
                      (LETT |repb| (|MRING;rep| |b| $)) (LETT |res| NIL)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL |repa|) NIL)
                                    ('T (NULL (NULL |repb|)))))
                             (GO G191)))
                           (SEQ (LETT |ta| (|SPADfirst| |repa|))
                                (LETT |tb| (|SPADfirst| |repb|))
                                (LETT |ra| (CDR |repa|))
                                (LETT |rb| (CDR |repb|))
                                (EXIT
                                 (LETT |res|
                                       (COND
                                        ((SPADCALL (QCAR |tb|) (QCAR |ta|)
                                                   (QREFELT $ 92))
                                         (SEQ (LETT |repa| |ra|)
                                              (EXIT (CONS |ta| |res|))))
                                        ((SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                   (QREFELT $ 92))
                                         (SEQ (LETT |repb| |rb|)
                                              (EXIT (CONS |tb| |res|))))
                                        ('T
                                         (SEQ (LETT |repa| |ra|)
                                              (LETT |repb| |rb|)
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (LETT |r|
                                                        (SPADCALL (QCDR |ta|)
                                                                  (QCDR |tb|)
                                                                  (QREFELT $
                                                                           95)))
                                                  (QREFELT $ 96)))
                                                (EXIT
                                                 (CONS (CONS (QCAR |ta|) |r|)
                                                       |res|))))
                                              (EXIT |res|)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (|MRING;per|
                        (SPADCALL (NREVERSE |res|)
                                  (COND ((NULL |repa|) |repb|) (#2# |repa|))
                                  (QREFELT $ 101))
                        $)))))))) 

(SDEFUN |MRING;coefficient;$MR;47| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G382 NIL) (#2=#:G383 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |t| NIL) (LETT #2# |a|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QCAR |t|) |m| (QREFELT $ 64))
                          (PROGN (LETT #1# (QCDR |t|)) (GO #3=#:G381))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |t|) |m| (QREFELT $ 92))
                           (PROGN
                            (LETT #1# (|spadConstant| $ 16))
                            (GO #3#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 16))))
                #3# (EXIT #1#)))) 

(SDEFUN |MRING;*;3$;48| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G386 NIL) (#2=#:G385 ($)) (#3=#:G387 ($)) (#4=#:G392 NIL)
          (|tb| NIL) (#5=#:G391 NIL) (#6=#:G390 NIL) (|ta| NIL))
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
                                                   (QREFELT $ 54)))
                                        #5#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |MRING;*;3$;49| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G395 NIL) (#2=#:G394 ($)) (#3=#:G396 ($)) (|r| (R))
          (#4=#:G402 NIL) (|tb| NIL) (#5=#:G401 NIL) (#6=#:G400 NIL)
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
                                                     (QREFELT $ 54)))
                                     (QREFELT $ 96)))
                                   (LETT #5#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |ta|) (QCAR |tb|)
                                                     (QREFELT $ 103))
                                           |r|)
                                          #5#))))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 15))))))) 

(SDEFUN |MRING;*;3$;50| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G415 NIL) (|tb| NIL) (#2=#:G414 NIL) (#3=#:G413 NIL) (|ta| NIL)
          (#4=#:G412 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |a| (QREFELT $ 31)) (SPADCALL |b| (QREFELT $ 31)))
            (|spadConstant| $ 15))
           ('T
            (COND ((SPADCALL |a| (QREFELT $ 42)) |b|)
                  ((SPADCALL |b| (QREFELT $ 42)) |a|)
                  ('T
                   (|MRING;construct!|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |ta| NIL) (LETT #3# |a|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |ta| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (PROGN
                                     (LETT #2# NIL)
                                     (SEQ (LETT |tb| NIL) (LETT #1# |b|) G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |tb| (CAR #1#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (CONS
                                                    (SPADCALL (QCAR |ta|)
                                                              (QCAR |tb|)
                                                              (QREFELT $ 103))
                                                    (SPADCALL (QCDR |ta|)
                                                              (QCDR |tb|)
                                                              (QREFELT $ 54)))
                                                   #2#))))
                                          (LETT #1# (CDR #1#)) (GO G190) G191
                                          (EXIT (NREVERSE #2#))))
                                    #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (QREFELT $ 105))
                    $)))))))) 

(SDEFUN |MRING;=;2$B;51| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((#1=#:G423 NIL) (#2=#:G424 NIL) (#3=#:G425 NIL) (|t| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 71)) NIL)
                  ('T
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
                              ((NULL (SPADCALL |t| |b| (QREFELT $ 106)))
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# NIL) (GO #4=#:G422)))
                                (GO #5=#:G419))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #1#))
                    (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |MRING;coefficient;$MR;52| ((|a| $) (|m| M) ($ R))
        (SPROG ((#1=#:G431 NIL) (#2=#:G432 NIL) (#3=#:G433 NIL) (|t| NIL))
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
                            ((SPADCALL (QCAR |t|) |m| (QREFELT $ 64))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (QCDR |t|))
                                     (GO #4=#:G430)))
                              (GO #5=#:G428))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (|spadConstant| $ 16))))
                #4# (EXIT #2#)))) 

(SDEFUN |MRING;addterm| ((|Tabl| |AssociationList| M R) (|r| R) (|m| M) ($ R))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 108)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |u| 1)
                           (NULL
                            (SPADCALL
                             (LETT |r|
                                   (SPADCALL |r| (QCDR |u|) (QREFELT $ 95)))
                             (QREFELT $ 96))))
                       (SPADCALL |Tabl| |m| |r| (QREFELT $ 109)))
                      ('T
                       (SEQ (SPADCALL |m| |Tabl| (QREFELT $ 110))
                            (EXIT (|spadConstant| $ 16))))))))) 

(SDEFUN |MRING;+;3$;54| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G451 NIL) (|m| NIL) (#2=#:G450 NIL) (#3=#:G449 NIL) (|t| NIL)
          (#4=#:G448 NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 111)))
              (SEQ (LETT |t| NIL) (LETT #4# (|MRING;rep| |a| $)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |Tabl| (QCAR |t|) (QCDR |t|) (QREFELT $ 109))))
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
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 112))) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 113)))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MRING;*;3$;55| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G461 NIL) (|m| NIL) (#2=#:G460 NIL) (#3=#:G459 NIL) (|tb| NIL)
          (#4=#:G458 NIL) (|ta| NIL) (|Tabl| (|AssociationList| M R)))
         (SEQ (LETT |Tabl| (SPADCALL (QREFELT $ 111)))
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
                             (SPADCALL (QCDR |ta|) (QCDR |tb|) (QREFELT $ 54))
                             (SPADCALL (QCAR |ta|) (QCAR |tb|) (QREFELT $ 103))
                             $)))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |m| NIL)
                     (LETT #1# (SPADCALL |Tabl| (QREFELT $ 112))) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS |m| (SPADCALL |Tabl| |m| (QREFELT $ 113)))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |MonoidRing;|)) 

(DEFUN |MonoidRing| (&REST #1=#:G464)
  (SPROG NIL
         (PROG (#2=#:G465)
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
   ((|pv$| NIL) (#1=#:G462 NIL) (#2=#:G463 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|MonoidRing| DV$1 DV$2))
    (LETT $ (GETREFV 118))
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
         (QSETREFV $ 23 (CONS (|dispatchFunction| |MRING;size;Nni;7|) $))
         (QSETREFV $ 30 (CONS (|dispatchFunction| |MRING;index;Pi$;8|) $))
         (QSETREFV $ 35
                   (CONS (|dispatchFunction| |MRING;lookup;$Pi;9|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 55 (CONS (|dispatchFunction| |MRING;*;R2$;21|) $)))
     ('T (QSETREFV $ 55 (CONS (|dispatchFunction| |MRING;*;R2$;22|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV $ 58 (CONS (|dispatchFunction| |MRING;*;I2$;23|) $)))
     ('T (QSETREFV $ 58 (CONS (|dispatchFunction| |MRING;*;I2$;24|) $))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (COND
       ((|HasCategory| |#2| '(|Group|))
        (QSETREFV $ 70 (CONS (|dispatchFunction| |MRING;recip;$U;29|) $)))
       ('T
        (QSETREFV $ 70 (CONS (|dispatchFunction| |MRING;recip;$U;30|) $))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |MRING;leadingCoefficient;$R;33|)
                       $))
       (QSETREFV $ 84
                 (CONS (|dispatchFunction| |MRING;leadingSupport;$M;34|) $))
       (QSETREFV $ 85
                 (CONS (|dispatchFunction| |MRING;leadingMonomial;2$;35|) $))
       (QSETREFV $ 86 (CONS (|dispatchFunction| |MRING;leadingTerm;$R;36|) $))
       (QSETREFV $ 87 (CONS (|dispatchFunction| |MRING;reductum;2$;37|) $))
       (QSETREFV $ 88 (CONS (|dispatchFunction| |MRING;listOfTerms;$L;38|) $))
       (QSETREFV $ 90 (CONS (|dispatchFunction| |MRING;support;$L;39|) $))
       (QSETREFV $ 91
                 (CONS (|dispatchFunction| |MRING;constructOrdered;L$;40|) $))
       (QSETREFV $ 97 (CONS (|dispatchFunction| |MRING;construct;L$;43|) $))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (QSETREFV $ 99
                    (CONS (|dispatchFunction| |MRING;linearExtend;M$R;44|)
                          $)))))
       (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;=;2$B;45|) $))
       (QSETREFV $ 29 (CONS (|dispatchFunction| |MRING;+;3$;46|) $))
       (QSETREFV $ 102
                 (CONS (|dispatchFunction| |MRING;coefficient;$MR;47|) $))
       (COND
        ((|HasCategory| |#2| '(|OrderedMonoid|))
         (COND
          ((|HasCategory| |#1| '(|noZeroDivisors|))
           (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;48|) $)))
          ('T (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;49|) $)))))
        ('T (QSETREFV $ 104 (CONS (|dispatchFunction| |MRING;*;3$;50|) $))))))
     ('T
      (PROGN
       (QSETREFV $ 100 (CONS (|dispatchFunction| |MRING;=;2$B;51|) $))
       (QSETREFV $ 102
                 (CONS (|dispatchFunction| |MRING;coefficient;$MR;52|) $))
       (QSETREFV $ 29 (CONS (|dispatchFunction| |MRING;+;3$;54|) $))
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
              |MRING;monomial?;$B;6| (14 . |size|) (18 . |size|) (22 . |size|)
              (|Integer|) (26 . ~=) (|PositiveInteger|) (32 . |index|)
              (37 . |index|) (42 . +) (48 . |index|) |MRING;zero?;$B;12|
              |MRING;terms;$L;14| (53 . |lookup|) (58 . |lookup|)
              (63 . |lookup|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MRING;One;$;11|) $))
              (68 . |One|) (72 . |One|) (76 . |size?|) (82 . |one?|)
              (87 . |one?|) |MRING;one?;$B;13| (92 . |copy|) (|List| $)
              |MRING;monomials;$L;15| (|List| 6) |MRING;coefficients;$L;16|
              |MRING;coerce;M$;17| |MRING;coerce;R$;18| (97 . |coerce|)
              |MRING;coerce;I$;19| (102 . -) |MRING;-;2$;20| (107 . *)
              (113 . *) (119 . ~=) (125 . *) (131 . *) (|Mapping| 6 6)
              |MRING;map;M2$;25| |MRING;numberOfMonomials;$Nni;26|
              (|Union| 7 '"failed") |MRING;retractIfCan;$U;27| (137 . =)
              (|Union| 6 '"failed") |MRING;retractIfCan;$U;28|
              (|Union| $ '"failed") (143 . |recip|) (148 . |inv|)
              (153 . |recip|) (158 . ~=) (164 . ~=) (|OutputForm|)
              (170 . |coerce|) (175 . |coerce|) (180 . *) (186 . |coerce|)
              (191 . +) (|Mapping| 73 73 73) (|List| 73) (197 . |reduce|)
              |MRING;coerce;$Of;32| (203 . |leadingCoefficient|)
              (208 . |leadingSupport|) (213 . |leadingMonomial|)
              (218 . |leadingTerm|) (223 . |reductum|) (228 . |listOfTerms|)
              (|List| 7) (233 . |support|) (238 . |constructOrdered|)
              (243 . |smaller?|) (|Mapping| 17 12 12) (249 . |sort!|) (255 . +)
              (261 . |zero?|) (266 . |construct|) (|Mapping| 6 7)
              (271 . |linearExtend|) (277 . =) (283 . |concat!|)
              (289 . |coefficient|) (295 . *) (301 . *) (307 . |concat!|)
              (312 . |member?|) (|AssociationList| 7 6) (318 . |search|)
              (324 . |setelt!|) (331 . |remove!|) (337 . |table|)
              (341 . |keys|) (346 . |elt|) (|InputForm|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 352 |zero?| 358 |terms| 363 |support| 368 |sup| 373
              |subtractIfCan| 379 |smaller?| 385 |size| 391 |sample| 395
              |rightRecip| 399 |rightPower| 404 |retractIfCan| 416 |retract|
              426 |reductum| 436 |recip| 441 |random| 446 |opposite?| 450
              |one?| 456 |numberOfMonomials| 461 |monomials| 466 |monomial?|
              471 |monomial| 476 |min| 482 |max| 488 |map| 494 |lookup| 500
              |listOfTerms| 505 |linearExtend| 510 |leftRecip| 516 |leftPower|
              521 |leadingTerm| 533 |leadingSupport| 538 |leadingMonomial| 543
              |leadingCoefficient| 548 |latex| 553 |index| 558 |hashUpdate!|
              563 |hash| 569 |enumerate| 574 |convert| 578 |constructOrdered|
              583 |construct| 588 |commutator| 593 |coerce| 599 |coefficients|
              629 |coefficient| 634 |charthRoot| 640 |characteristic| 645
              |associator| 649 |antiCommutator| 656 |annihilate?| 662 ^ 668
              |Zero| 680 |One| 684 >= 688 > 694 = 700 <= 706 < 712 - 718 + 729
              * 735)
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
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 73)
                 (|PartialOrder|) (|ConvertibleTo| 114) (|TwoSidedRecip|))
              (|makeByteWordVec2| 117
                                  '(0 6 9 10 0 6 0 16 2 6 17 0 0 18 0 6 9 21 0
                                    7 9 22 0 0 9 23 2 24 17 0 0 25 1 6 0 26 27
                                    1 7 0 26 28 2 0 0 0 0 29 1 0 0 26 30 1 7 26
                                    0 33 1 6 26 0 34 1 0 26 0 35 0 6 0 37 0 7 0
                                    38 2 8 17 0 9 39 1 6 17 0 40 1 7 17 0 41 1
                                    13 0 0 43 1 6 0 24 50 1 6 0 0 52 2 6 0 0 0
                                    54 2 0 0 6 0 55 2 6 17 0 0 56 2 6 0 24 0 57
                                    2 0 0 24 0 58 2 7 17 0 0 64 1 6 67 0 68 1 7
                                    0 0 69 1 0 67 0 70 2 9 17 0 0 71 2 7 17 0 0
                                    72 1 7 73 0 74 1 6 73 0 75 2 73 0 0 0 76 1
                                    24 73 0 77 2 73 0 0 0 78 2 80 73 79 0 81 1
                                    0 6 0 83 1 0 7 0 84 1 0 0 0 85 1 0 12 0 86
                                    1 0 0 0 87 1 0 13 0 88 1 0 89 0 90 1 0 0 13
                                    91 2 7 17 0 0 92 2 13 0 93 0 94 2 6 0 0 0
                                    95 1 6 17 0 96 1 0 0 13 97 2 0 6 98 0 99 2
                                    0 17 0 0 100 2 8 0 0 0 101 2 0 6 0 7 102 2
                                    7 0 0 0 103 2 0 0 0 0 104 1 13 0 44 105 2 8
                                    17 12 0 106 2 107 65 7 0 108 3 107 6 0 7 6
                                    109 2 107 65 7 0 110 0 107 0 111 1 107 89 0
                                    112 2 107 6 0 7 113 2 0 17 0 0 1 1 0 17 0
                                    31 1 0 13 0 32 1 1 89 0 90 2 12 0 0 0 1 2 0
                                    67 0 0 1 2 14 17 0 0 1 0 6 9 23 0 0 0 1 1 0
                                    67 0 1 2 0 0 0 9 1 2 0 0 0 26 1 1 0 65 0 66
                                    1 0 62 0 63 1 0 6 0 1 1 0 7 0 1 1 1 0 0 87
                                    1 0 67 0 70 0 6 0 1 2 0 17 0 0 1 1 0 17 0
                                    42 1 0 9 0 61 1 0 44 0 45 1 0 17 0 20 2 0 0
                                    6 7 19 2 13 0 0 0 1 2 13 0 0 0 1 2 0 0 59 0
                                    60 1 6 26 0 35 1 1 13 0 88 2 11 6 98 0 99 1
                                    0 67 0 1 2 0 0 0 9 1 2 0 0 0 26 1 1 1 12 0
                                    86 1 1 7 0 84 1 1 0 0 85 1 1 6 0 83 1 0 115
                                    0 1 1 6 0 26 30 2 0 117 117 0 1 1 0 116 0 1
                                    0 6 44 1 1 6 114 0 1 1 1 0 13 91 1 1 0 13
                                    97 2 0 0 0 0 1 1 8 0 0 1 1 0 0 13 14 1 0 0
                                    6 49 1 0 0 7 48 1 0 0 24 51 1 0 73 0 82 1 0
                                    46 0 47 2 0 6 0 7 102 1 9 67 0 1 0 0 9 11 3
                                    0 0 0 0 0 1 2 0 0 0 0 1 2 0 17 0 0 1 2 0 0
                                    0 9 1 2 0 0 0 26 1 0 0 0 15 0 0 0 36 2 13
                                    17 0 0 1 2 13 17 0 0 1 2 0 17 0 0 100 2 13
                                    17 0 0 1 2 13 17 0 0 1 1 0 0 0 53 2 0 0 0 0
                                    1 2 0 0 0 0 29 2 3 0 0 6 1 2 3 0 6 0 55 2 1
                                    0 6 7 1 2 1 0 7 6 1 2 0 0 9 0 1 2 0 0 24 0
                                    58 2 0 0 0 0 104 2 0 0 26 0 1)))))
           '|lookupComplete|)) 
