
(SDEFUN |QALGSET;factorset| ((|y| |Dpoly|) ($ |List| |Dpoly|))
        (SPROG ((#1=#:G129 NIL) (|j| NIL) (#2=#:G128 NIL))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 12)) NIL)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|QALGSET;factorset|))
                        (SEQ (LETT |j| NIL . #3#)
                             (LETT #1#
                                   (SPADCALL (SPADCALL |y| (QREFELT $ 15))
                                             (QREFELT $ 19))
                                   . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |j| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #2# (CONS (QVELT |j| 1) #2#) . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |QALGSET;simplify;2$;2| ((|x| $) ($ $))
        (SPROG
         ((#1=#:G141 NIL) (#2=#:G140 (|Dpoly|)) (#3=#:G142 (|Dpoly|))
          (#4=#:G153 NIL) (#5=#:G105 NIL) (|zro| (|List| |Dpoly|))
          (#6=#:G137 NIL) (#7=#:G136 (|Dpoly|)) (#8=#:G138 (|Dpoly|))
          (#9=#:G152 NIL) (#10=#:G104 NIL) (#11=#:G151 NIL) (|s| NIL)
          (#12=#:G150 NIL) (|mset| (|List| (|List| |Dpoly|))) (#13=#:G149 NIL)
          (#14=#:G148 NIL) (#15=#:G147 NIL) (|p| NIL) (#16=#:G146 NIL)
          (|nzro| (|List| |Dpoly|)) (|pnzero| (|Dpoly|)))
         (SEQ
          (COND
           ((QEQCAR (QVELT |x| 0) 1)
            (LETT |x|
                  (SPADCALL
                   (LETT |zro| (SPADCALL (QVELT |x| 1) (QREFELT $ 22))
                         . #17=(|QALGSET;simplify;2$;2|))
                   (SPADCALL (QVELT |x| 2) |zro| (QREFELT $ 24))
                   (QREFELT $ 25))
                  . #17#)))
          (LETT |pnzero| (QVELT |x| 2) . #17#)
          (EXIT
           (COND
            ((SPADCALL |pnzero| (|spadConstant| $ 28) (QREFELT $ 29))
             (SPADCALL (QREFELT $ 30)))
            (#18='T
             (SEQ (LETT |nzro| (|QALGSET;factorset| |pnzero| $) . #17#)
                  (LETT |mset|
                        (|QALGSET;minset|
                         (PROGN
                          (LETT #16# NIL . #17#)
                          (SEQ (LETT |p| NIL . #17#)
                               (LETT #15# (QVELT |x| 1) . #17#) G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |p| (CAR #15#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #16#
                                       (CONS (|QALGSET;factorset| |p| $) #16#)
                                       . #17#)))
                               (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                               (EXIT (NREVERSE #16#))))
                         $)
                        . #17#)
                  (LETT |mset|
                        (PROGN
                         (LETT #14# NIL . #17#)
                         (SEQ (LETT |s| NIL . #17#) (LETT #13# |mset| . #17#)
                              G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |s| (CAR #13#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #14#
                                      (CONS
                                       (SPADCALL |s| |nzro| (QREFELT $ 31))
                                       #14#)
                                      . #17#)))
                              (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        . #17#)
                  (LETT |zro|
                        (SPADCALL
                         (PROGN
                          (LETT #12# NIL . #17#)
                          (SEQ (LETT |s| NIL . #17#) (LETT #11# |mset| . #17#)
                               G190
                               (COND
                                ((OR (ATOM #11#)
                                     (PROGN (LETT |s| (CAR #11#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #12#
                                       (CONS
                                        (PROGN
                                         (LETT #6# NIL . #17#)
                                         (SEQ (LETT #10# NIL . #17#)
                                              (LETT #9# |s| . #17#) G190
                                              (COND
                                               ((OR (ATOM #9#)
                                                    (PROGN
                                                     (LETT #10# (CAR #9#)
                                                           . #17#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #8# #10# . #17#)
                                                 (COND
                                                  (#6#
                                                   (LETT #7#
                                                         (SPADCALL #7# #8#
                                                                   (QREFELT $
                                                                            32))
                                                         . #17#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #7# #8# . #17#)
                                                    (LETT #6# 'T . #17#)))))))
                                              (LETT #9# (CDR #9#) . #17#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#6# #7#)
                                               ('T (|spadConstant| $ 33))))
                                        #12#)
                                       . #17#)))
                               (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                               (EXIT (NREVERSE #12#))))
                         (QREFELT $ 22))
                        . #17#)
                  (EXIT
                   (COND
                    ((SPADCALL (|spadConstant| $ 33) |zro| (QREFELT $ 34))
                     (SPADCALL (QREFELT $ 30)))
                    (#18#
                     (VECTOR (QVELT |x| 0) |zro|
                             (SPADCALL
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL . #17#)
                                (SEQ (LETT #5# NIL . #17#)
                                     (LETT #4# |nzro| . #17#) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT #5# (CAR #4#) . #17#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3# #5# . #17#)
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #3#
                                                          (QREFELT $ 32))
                                                . #17#))
                                         ('T
                                          (PROGN
                                           (LETT #2# #3# . #17#)
                                           (LETT #1# 'T . #17#)))))))
                                     (LETT #4# (CDR #4#) . #17#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#1# #2#) (#18# (|spadConstant| $ 33))))
                               |zro| (QREFELT $ 24))
                              (QREFELT $ 35))))))))))))) 

(SDEFUN |QALGSET;npoly|
        ((|f| |Dpoly|)
         ($ |PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|)))
        (COND ((SPADCALL |f| (QREFELT $ 37)) (|spadConstant| $ 39))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 40))
                          (SPADCALL 0 (SPADCALL |f| (QREFELT $ 41))
                                    (QREFELT $ 44))
                          (QREFELT $ 45))
                (|QALGSET;npoly| (SPADCALL |f| (QREFELT $ 46)) $)
                (QREFELT $ 47))))) 

(SDEFUN |QALGSET;oldpoly|
        ((|q| |PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|))
         ($ . #1=(|Union| |Dpoly| "failed")))
        (SPROG
         ((|g| #1#) (|n| (|NonNegativeInteger|))
          (|dq| (|Product| (|NonNegativeInteger|) |Expon|)))
         (SEQ
          (COND
           ((SPADCALL |q| (|spadConstant| $ 39) (QREFELT $ 48))
            (CONS 0 (|spadConstant| $ 28)))
           (#2='T
            (SEQ
             (LETT |dq| (SPADCALL |q| (QREFELT $ 49)) . #3=(|QALGSET;oldpoly|))
             (LETT |n| (SPADCALL |dq| (QREFELT $ 50)) . #3#)
             (EXIT
              (COND ((SPADCALL |n| 0 (QREFELT $ 51)) (CONS 1 "failed"))
                    (#2#
                     (SEQ
                      (LETT |g|
                            (|QALGSET;oldpoly| (SPADCALL |q| (QREFELT $ 52)) $)
                            . #3#)
                      (EXIT
                       (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                             (#2#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                               (SPADCALL |dq| (QREFELT $ 54))
                                               (QREFELT $ 55))
                                     (QCDR |g|) (QREFELT $ 56)))))))))))))))) 

(SDEFUN |QALGSET;coerce;$Of;5| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G174 NIL) (|f| NIL) (#2=#:G173 NIL))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |x| 0) (CONS 0 'T) (QREFELT $ 58))
                  (SPADCALL "Empty" (QREFELT $ 61)))
                 ('T
                  (SPADCALL
                   (LIST
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #3=(|QALGSET;coerce;$Of;5|))
                      (SEQ (LETT |f| NIL . #3#) (LETT #1# (QVELT |x| 1) . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 62))
                                              (SPADCALL " = 0" (QREFELT $ 61))
                                              (QREFELT $ 63))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 65))
                    (SPADCALL (SPADCALL (QVELT |x| 2) (QREFELT $ 62))
                              (SPADCALL " != 0" (QREFELT $ 61))
                              (QREFELT $ 63)))
                   (QREFELT $ 67))))))) 

(SDEFUN |QALGSET;empty?;$B;6| ((|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G176 NIL))
               (SEQ
                (COND
                 ((QEQCAR (QVELT |x| 0) 1)
                  (LETT |x| (SPADCALL |x| (QREFELT $ 69))
                        . #2=(|QALGSET;empty?;$B;6|))))
                (EXIT
                 (PROG2 (LETT #1# (QVELT |x| 0) . #2#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|Boolean|)
                                   (|Union| (|Boolean|) "failed") #1#)))))) 

(SDEFUN |QALGSET;empty;$;7| (($ $))
        (VECTOR (CONS 0 'T) (LIST (|spadConstant| $ 33)) (|spadConstant| $ 28))) 

(PUT '|QALGSET;status;$U;8| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(SDEFUN |QALGSET;status;$U;8| ((|x| $) ($ |Union| (|Boolean|) "failed"))
        (QVELT |x| 0)) 

(SDEFUN |QALGSET;setStatus;$U$;9|
        ((|x| $) (|t| |Union| (|Boolean|) "failed") ($ $))
        (VECTOR |t| (QVELT |x| 1) (QVELT |x| 2))) 

(PUT '|QALGSET;definingEquations;$L;10| '|SPADreplace|
     '(XLAM (|x|) (QVELT |x| 1))) 

(SDEFUN |QALGSET;definingEquations;$L;10| ((|x| $) ($ |List| |Dpoly|))
        (QVELT |x| 1)) 

(PUT '|QALGSET;definingInequation;$Dpoly;11| '|SPADreplace|
     '(XLAM (|x|) (QVELT |x| 2))) 

(SDEFUN |QALGSET;definingInequation;$Dpoly;11| ((|x| $) ($ |Dpoly|))
        (QVELT |x| 2)) 

(SDEFUN |QALGSET;quasiAlgebraicSet;LDpoly$;12|
        ((|z0| |List| |Dpoly|) (|n0| |Dpoly|) ($ $))
        (VECTOR (CONS 1 "failed") |z0| |n0|)) 

(SDEFUN |QALGSET;idealSimplify;2$;13| ((|x| $) ($ $))
        (SPROG
         ((|ngb|
           (|List|
            (|PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|))))
          (|gb| (|List| |Dpoly|)) (|f| (|Union| |Dpoly| "failed"))
          (#1=#:G215 NIL) (|g| NIL) (#2=#:G214 NIL)
          (|tp|
           (|PolynomialRing| R (|Product| (|NonNegativeInteger|) |Expon|)))
          (|n0| (|Dpoly|)) (|z0| (|List| |Dpoly|)))
         (SEQ
          (COND ((QEQCAR (QVELT |x| 0) 0) |x|)
                (#3='T
                 (SEQ
                  (LETT |z0| (QVELT |x| 1)
                        . #4=(|QALGSET;idealSimplify;2$;13|))
                  (LETT |n0| (QVELT |x| 2) . #4#)
                  (EXIT
                   (COND ((NULL |z0|) (VECTOR (CONS 0 NIL) |z0| |n0|))
                         ((SPADCALL (|spadConstant| $ 33) |z0| (QREFELT $ 34))
                          (SPADCALL (QREFELT $ 30)))
                         (#3#
                          (SEQ
                           (LETT |tp|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 75)
                                             (SPADCALL 1 (|spadConstant| $ 27)
                                                       (QREFELT $ 44))
                                             (QREFELT $ 45))
                                   (|QALGSET;npoly| |n0| $) (QREFELT $ 76))
                                  (|spadConstant| $ 77) (QREFELT $ 78))
                                 . #4#)
                           (LETT |ngb|
                                 (SPADCALL
                                  (CONS |tp|
                                        (PROGN
                                         (LETT #2# NIL . #4#)
                                         (SEQ (LETT |g| NIL . #4#)
                                              (LETT #1# |z0| . #4#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |g| (CAR #1#) . #4#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (|QALGSET;npoly| |g| $)
                                                       #2#)
                                                      . #4#)))
                                              (LETT #1# (CDR #1#) . #4#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#)))))
                                  (QREFELT $ 81))
                                 . #4#)
                           (EXIT
                            (COND
                             ((SPADCALL (|spadConstant| $ 77) |ngb|
                                        (QREFELT $ 82))
                              (SPADCALL (QREFELT $ 30)))
                             (#3#
                              (SEQ (LETT |gb| NIL . #4#)
                                   (SEQ G190
                                        (COND
                                         ((NULL (NULL (NULL |ngb|)))
                                          (GO G191)))
                                        (SEQ
                                         (SEQ
                                          (LETT |f|
                                                (|QALGSET;oldpoly|
                                                 (|SPADfirst| |ngb|) $)
                                                . #4#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |f| 0)
                                             (LETT |gb| (CONS (QCDR |f|) |gb|)
                                                   . #4#)))))
                                         (EXIT (LETT |ngb| (CDR |ngb|) . #4#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (VECTOR (CONS 0 NIL) |gb|
                                            (SPADCALL
                                             (SPADCALL |n0| |gb|
                                                       (QREFELT $ 24))
                                             (QREFELT $ 35)))))))))))))))))) 

(SDEFUN |QALGSET;minset|
        ((|lset| |List| (|List| |Dpoly|)) ($ |List| (|List| |Dpoly|)))
        (SPROG ((#1=#:G221 NIL) (|s| NIL) (#2=#:G220 NIL))
               (SEQ
                (COND ((NULL |lset|) |lset|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|QALGSET;minset|))
                        (SEQ (LETT |s| NIL . #3#) (LETT #1# |lset| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (|QALGSET;overset?| |s| |lset| $))
                                 (LETT #2# (CONS |s| #2#) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |QALGSET;overset?|
        ((|p| |List| |Dpoly|) (|qlist| |List| (|List| |Dpoly|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G223 NIL) (#2=#:G222 #3=(|Boolean|)) (#4=#:G224 #3#)
          (#5=#:G227 NIL) (|q| NIL))
         (SEQ
          (COND ((NULL |qlist|) NIL)
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|QALGSET;overset?|))
                  (SEQ (LETT |q| NIL . #7#) (LETT #5# |qlist| . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL (SPADCALL |q| (QREFELT $ 84))
                                          (SPADCALL |p| (QREFELT $ 84))
                                          (QREFELT $ 85))
                                . #7#)
                          (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(DECLAIM (NOTINLINE |QuasiAlgebraicSet;|)) 

(DEFUN |QuasiAlgebraicSet| (&REST #1=#:G228)
  (SPROG NIL
         (PROG (#2=#:G229)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|QuasiAlgebraicSet|)
                                               '|domainEqualList|)
                    . #3=(|QuasiAlgebraicSet|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |QuasiAlgebraicSet;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|QuasiAlgebraicSet|)))))))))) 

(DEFUN |QuasiAlgebraicSet;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|QuasiAlgebraicSet|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|QuasiAlgebraicSet| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 88) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|QuasiAlgebraicSet|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Record| (|:| |status| (|Union| (|Boolean|) "failed"))
                        (|:| |zero| (|List| |#4|)) (|:| |nzero| |#4|)))
    (COND
     ((|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (PROGN
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |QALGSET;simplify;2$;2|) $)))))))
    $))) 

(MAKEPROP '|QuasiAlgebraicSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|Boolean|) (0 . |ground?|)
              (|Factored| 9) (|MultivariateFactorize| 7 8 6 9) (5 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 16) (|:| |factor| 9) (|:| |exponent| 42))
              (|List| 17) (10 . |factorList|) (|List| 9)
              (|GroebnerPackage| 6 8 9) (15 . |groebner|)
              (|GroebnerInternalPackage| 6 8 9) (20 . |redPol|)
              |QALGSET;quasiAlgebraicSet;LDpoly$;12| (26 . |Zero|)
              (30 . |Zero|) (34 . |Zero|) (38 . =) |QALGSET;empty;$;7|
              (44 . |setDifference|) (50 . *) (56 . |One|) (60 . |member?|)
              (66 . |primitivePart|) (71 . |simplify|) (76 . |zero?|)
              (|PolynomialRing| 6 43) (81 . |Zero|) (85 . |leadingCoefficient|)
              (90 . |degree|) (|NonNegativeInteger|) (|Product| 42 8)
              (95 . |construct|) (101 . |monomial|) (107 . |reductum|)
              (112 . +) (118 . =) (124 . |degree|) (129 . |first|) (134 . ~=)
              (140 . |reductum|) (145 . |leadingCoefficient|) (150 . |second|)
              (155 . |monomial|) (161 . +) (|Union| 11 '"failed") (167 . =)
              (|String|) (|OutputForm|) (173 . |message|) (178 . |coerce|)
              (183 . |hconcat|) (|List| 60) (189 . |coerce|) (|List| $)
              (194 . |bracket|) |QALGSET;coerce;$Of;5|
              |QALGSET;idealSimplify;2$;13| |QALGSET;empty?;$B;6|
              |QALGSET;status;$U;8| |QALGSET;setStatus;$U$;9|
              |QALGSET;definingEquations;$L;10|
              |QALGSET;definingInequation;$Dpoly;11| (199 . |One|) (203 . *)
              (209 . |One|) (213 . -) (|List| 38) (|GroebnerPackage| 6 43 38)
              (219 . |groebner|) (224 . |member?|) (|Set| 9) (230 . |set|)
              (235 . <) (|HashState|) (|SingleInteger|))
           '#(~= 241 |status| 247 |simplify| 252 |setStatus| 257
              |quasiAlgebraicSet| 263 |latex| 269 |idealSimplify| 274
              |hashUpdate!| 279 |hash| 285 |empty?| 290 |empty| 295
              |definingInequation| 299 |definingEquations| 304 |coerce| 309 =
              314)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 60))
                        (|makeByteWordVec2| 87
                                            '(1 9 11 0 12 1 14 13 9 15 1 13 18
                                              0 19 1 21 20 20 22 2 23 9 9 20 24
                                              0 6 0 26 0 8 0 27 0 9 0 28 2 9 11
                                              0 0 29 2 20 0 0 0 31 2 9 0 0 0 32
                                              0 9 0 33 2 20 11 9 0 34 1 9 0 0
                                              35 1 0 0 0 36 1 9 11 0 37 0 38 0
                                              39 1 9 6 0 40 1 9 8 0 41 2 43 0
                                              42 8 44 2 38 0 6 43 45 1 9 0 0 46
                                              2 38 0 0 0 47 2 38 11 0 0 48 1 38
                                              43 0 49 1 43 42 0 50 2 42 11 0 0
                                              51 1 38 0 0 52 1 38 6 0 53 1 43 8
                                              0 54 2 9 0 6 8 55 2 9 0 0 0 56 2
                                              57 11 0 0 58 1 60 0 59 61 1 9 60
                                              0 62 2 60 0 0 0 63 1 64 60 0 65 1
                                              60 0 66 67 0 6 0 75 2 38 0 0 0 76
                                              0 38 0 77 2 38 0 0 0 78 1 80 79
                                              79 81 2 79 11 38 0 82 1 83 0 20
                                              84 2 83 11 0 0 85 2 0 11 0 0 1 1
                                              0 57 0 71 1 1 0 0 36 2 0 0 0 57
                                              72 2 0 0 20 9 25 1 0 59 0 1 1 0 0
                                              0 69 2 0 86 86 0 1 1 0 87 0 1 1 0
                                              11 0 70 0 0 0 30 1 0 9 0 74 1 0
                                              20 0 73 1 0 60 0 68 2 0 11 0 0
                                              1)))))
           '|lookupComplete|)) 
