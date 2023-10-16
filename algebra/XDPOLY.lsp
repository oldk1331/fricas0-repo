
(SDEFUN |XDPOLY;mindegTerm;$R;1|
        ((|p| $) ($ |Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| R)))
        (SPADCALL |p| (QREFELT $ 10))) 

(SDEFUN |XDPOLY;sh;$Nni$;2| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G115 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 14)) ((EQL |n| 1) |p|)
                      ('T
                       (SEQ
                        (LETT |n1|
                              (PROG1 (LETT #1# (- |n| 1))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#)))
                        (EXIT
                         (SPADCALL |p| (SPADCALL |p| |n1| (QREFELT $ 17))
                                   (QREFELT $ 18))))))))) 

(SDEFUN |XDPOLY;sh;3$;3| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|p| ($)) (#1=#:G123 NIL) (|t2| NIL) (#2=#:G122 NIL) (|t1| NIL))
         (SEQ (LETT |p| (|spadConstant| $ 12))
              (SEQ (LETT |t1| NIL) (LETT #2# |p1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL) (LETT #1# |p2|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |t2| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |p|
                                  (SPADCALL |p|
                                            (SPADCALL
                                             (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                       (QREFELT $ 19))
                                             (|XDPOLY;shw| (QCAR |t1|)
                                              (QCAR |t2|) $)
                                             (QREFELT $ 20))
                                            (QREFELT $ 21)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(SDEFUN |XDPOLY;coerce;vl$;4| ((|v| |vl|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 23)) (QREFELT $ 24))) 

(SDEFUN |XDPOLY;*;vl2$;5| ((|v| |vl|) (|p| $) ($ $))
        (SPROG ((#1=#:G128 NIL) (|t| NIL) (#2=#:G127 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL |v| (QCAR |t|) (QREFELT $ 26))
                                     (QCDR |t|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |XDPOLY;mirror;2$;6| ((|p| $) ($ $))
        (COND ((NULL |p|) |p|)
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 28)) (QREFELT $ 29))
                 (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 31))
                (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 33))
                (QREFELT $ 21))))) 

(SDEFUN |XDPOLY;degree;$Nni;7| ((|p| $) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 34)) (QREFELT $ 35))) 

(SDEFUN |XDPOLY;trunc;$Nni$;8| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
              (NULL (> (SPADCALL |p| (QREFELT $ 36)) |n|)))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 32)) |n| (QREFELT $ 39))))) 

(SDEFUN |XDPOLY;varList;$L;9| ((|p| $) ($ |List| |vl|))
        (SPROG
         ((|le| #1=(|List| |vl|)) (#2=#:G135 NIL) (#3=#:G134 #1#)
          (#4=#:G136 #1#) (#5=#:G140 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 40)) NIL)
                (#6='T
                 (SEQ
                  (LETT |le|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |t| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL (QCAR |t|) (QREFELT $ 42)))
                                 (COND
                                  (#2#
                                   (LETT #3#
                                         (SPADCALL #3# #4# (QREFELT $ 43))))
                                  ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# (|IdentityError| '|setUnion|)))))
                  (EXIT (SPADCALL |le| (QREFELT $ 44))))))))) 

(SDEFUN |XDPOLY;rquo;$Fm$;10| ((|p| $) (|w| |FreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G142 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G148 NIL) (|t| NIL) (#4=#:G147 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 47)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;$Fm$;11| ((|p| $) (|w| |FreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G150 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G156 NIL) (|t| NIL) (#4=#:G155 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 49)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;rquo;$vl$;12| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G158 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G164 NIL) (|t| NIL) (#4=#:G163 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 51)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;$vl$;13| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G166 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G172 NIL) (|t| NIL) (#4=#:G171 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 53)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;shw| ((|w1| |FreeMonoid| |vl|) (|w2| |FreeMonoid| |vl|) ($ $))
        (SPROG ((|y| (|vl|)) (|x| (|vl|)))
               (SEQ
                (COND
                 ((SPADCALL |w1| (|spadConstant| $ 55) (QREFELT $ 56))
                  (SPADCALL |w2| (QREFELT $ 24)))
                 ((SPADCALL |w2| (|spadConstant| $ 55) (QREFELT $ 56))
                  (SPADCALL |w1| (QREFELT $ 24)))
                 ('T
                  (SEQ (LETT |x| (SPADCALL |w1| (QREFELT $ 57)))
                       (LETT |y| (SPADCALL |w2| (QREFELT $ 57)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |x|
                                   (|XDPOLY;shw| (SPADCALL |w1| (QREFELT $ 58))
                                    |w2| $)
                                   (QREFELT $ 27))
                         (SPADCALL |y|
                                   (|XDPOLY;shw| |w1|
                                    (SPADCALL |w2| (QREFELT $ 58)) $)
                                   (QREFELT $ 27))
                         (QREFELT $ 21))))))))) 

(SDEFUN |XDPOLY;lquo;3$;15| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G178 NIL) (#2=#:G177 ($)) (#3=#:G179 ($)) (|r| ($))
          (#4=#:G181 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |q|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 50)))
                     (|spadConstant| $ 12) (QREFELT $ 59))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 60)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;rquo;3$;16| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G183 NIL) (#2=#:G182 ($)) (#3=#:G184 ($)) (|r| ($))
          (#4=#:G186 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |q|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 48)))
                     (|spadConstant| $ 12) (QREFELT $ 59))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 60)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;coef;2$R;17| ((|p| $) (|q| $) ($ R))
        (SPROG ((#1=#:G190 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
                       (SPADCALL |q| (|spadConstant| $ 12) (QREFELT $ 38)))
                   (|spadConstant| $ 13))
                  ('T
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 63))
                     (SPADCALL (CDR |p|) |q| (QREFELT $ 64)))
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 65))
                     (SPADCALL |p| (CDR |q|) (QREFELT $ 64)))
                    ('T
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (QCDR (|SPADfirst| |p|))
                                       (QCDR (|SPADfirst| |q|)) (QREFELT $ 19))
                             (SPADCALL (CDR |p|) (CDR |q|) (QREFELT $ 64))
                             (QREFELT $ 66)))
                      (GO #2=#:G189)))))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |XDistributedPolynomial;|)) 

(DEFUN |XDistributedPolynomial| (&REST #1=#:G198)
  (SPROG NIL
         (PROG (#2=#:G199)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XDistributedPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XDistributedPolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XDistributedPolynomial|)))))))))) 

(DEFUN |XDistributedPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G197 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XDistributedPolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 80))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|noZeroDivisors|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|FreeMonoid| |#1|)
                                               '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#2| '(|Comparable|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|XDistributedPolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8
              (|List| (|Record| (|:| |k| (|FreeMonoid| |#1|)) (|:| |c| |#2|))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 17 (CONS (|dispatchFunction| |XDPOLY;sh;$Nni$;2|) $))
       (QSETREFV $ 18 (CONS (|dispatchFunction| |XDPOLY;sh;3$;3|) $)))))
    $))) 

(MAKEPROP '|XDistributedPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XPolynomialRing| 7 22) (|local| |#1|)
              (|local| |#2|) '|Rep| (|Record| (|:| |k| 22) (|:| |c| 7))
              (0 . |last|) |XDPOLY;mindegTerm;$R;1| (5 . |Zero|) (9 . |Zero|)
              (13 . |One|) (17 . |One|) (|NonNegativeInteger|) (21 . |sh|)
              (27 . |sh|) (33 . *) (39 . *) (45 . +) (|FreeMonoid| 6)
              (51 . |coerce|) (56 . |coerce|) |XDPOLY;coerce;vl$;4| (61 . *)
              |XDPOLY;*;vl2$;5| (67 . |leadingSupport|) (72 . |mirror|)
              (77 . |leadingCoefficient|) (82 . |monom|) (88 . |reductum|)
              |XDPOLY;mirror;2$;6| (93 . |maxdeg|) (98 . |length|)
              |XDPOLY;degree;$Nni;7| (|Boolean|) (103 . =)
              |XDPOLY;trunc;$Nni$;8| (109 . |constant?|) (|List| 6)
              (114 . |varList|) (119 . |setUnion|) (125 . |sort!|)
              |XDPOLY;varList;$L;9| (|Union| $ '"failed") (130 . |rquo|)
              |XDPOLY;rquo;$Fm$;10| (136 . |lquo|) |XDPOLY;lquo;$Fm$;11|
              (142 . |rquo|) |XDPOLY;rquo;$vl$;12| (148 . |lquo|)
              |XDPOLY;lquo;$vl$;13| (154 . |One|) (158 . =) (164 . |first|)
              (169 . |rest|) (174 . ~=) (180 . *) |XDPOLY;lquo;3$;15|
              |XDPOLY;rquo;3$;16| (186 . >) |XDPOLY;coef;2$R;17| (192 . <)
              (198 . +) (|List| 9) (|Mapping| 7 22) (|PositiveInteger|)
              (|Integer|) (|Union| 22 '"failed") (|List| 22) (|List| $)
              (|List| 7) (|Mapping| 7 7) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 204 |zero?| 210 |varList| 215 |trunc| 220 |support| 226
              |subtractIfCan| 231 |smaller?| 237 |sh| 243 |sample| 255 |rquo|
              259 |rightRecip| 277 |rightPower| 282 |retractIfCan| 294
              |retract| 299 |reductum| 304 |recip| 309 |quasiRegular?| 314
              |quasiRegular| 319 |opposite?| 324 |one?| 330 |numberOfMonomials|
              335 |monomials| 340 |monomial?| 345 |monomial| 350 |monom| 356
              |mirror| 362 |mindegTerm| 367 |mindeg| 372 |maxdeg| 377 |map| 382
              |lquo| 388 |listOfTerms| 406 |linearExtend| 411 |leftRecip| 417
              |leftPower| 422 |leadingTerm| 434 |leadingSupport| 439
              |leadingMonomial| 444 |leadingCoefficient| 449 |latex| 454
              |hashUpdate!| 459 |hash| 465 |degree| 470 |constructOrdered| 475
              |construct| 480 |constant?| 485 |constant| 490 |commutator| 495
              |coerce| 501 |coefficients| 526 |coefficient| 531 |coef| 537
              |characteristic| 549 |associator| 553 |antiCommutator| 560
              |annihilate?| 566 ^ 572 |Zero| 584 |One| 588 = 592 - 598 + 609 *
              615)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 2))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |FreeModuleCategory&| NIL |Rng&| NIL
                NIL |Module&| NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| |NonAssociativeSemiRng&|
                |Magma&| |AbelianSemiGroup&| NIL |RetractableTo&|
                |SetCategory&| NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Ring|)
                 (|FreeModuleCategory| 7 (|FreeMonoid| 6)) (|SemiRing|) (|Rng|)
                 (|SemiRng|)
                 (|IndexedDirectProductCategory| 7 (|FreeMonoid| 6))
                 (|Module| 7) (|BiModule| 7 7) (|NonAssociativeRing|)
                 (|BiModule| $$ $$)
                 (|IndexedProductCategory| 7 (|FreeMonoid| 6)) (|LeftModule| 7)
                 (|RightModule| $$) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|AbelianProductCategory| 7) (|RightModule| 7)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|)
                 (|RetractableTo| (|FreeMonoid| 6)) (|SetCategory|)
                 (|CoercibleFrom| (|FreeMonoid| 6)) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 79) (|noZeroDivisors|))
              (|makeByteWordVec2| 79
                                  '(1 8 9 0 10 0 0 0 12 0 7 0 13 0 0 0 14 0 7 0
                                    15 2 0 0 0 16 17 2 0 0 0 0 18 2 7 0 0 0 19
                                    2 0 0 7 0 20 2 0 0 0 0 21 1 22 0 6 23 1 0 0
                                    22 24 2 22 0 6 0 26 1 0 22 0 28 1 22 0 0 29
                                    1 0 7 0 30 2 0 0 22 7 31 1 0 0 0 32 1 0 22
                                    0 34 1 22 16 0 35 2 0 37 0 0 38 1 0 37 0 40
                                    1 22 41 0 42 2 41 0 0 0 43 1 41 0 0 44 2 22
                                    46 0 0 47 2 22 46 0 0 49 2 22 46 0 6 51 2
                                    22 46 0 6 53 0 22 0 55 2 22 37 0 0 56 1 22
                                    6 0 57 1 22 0 0 58 2 0 37 0 0 59 2 0 0 0 7
                                    60 2 22 37 0 0 63 2 22 37 0 0 65 2 7 0 0 0
                                    66 2 0 37 0 0 59 1 0 37 0 1 1 0 41 0 45 2 0
                                    0 0 16 39 1 0 72 0 1 2 0 46 0 0 1 2 4 37 0
                                    0 1 2 1 0 0 16 17 2 1 0 0 0 18 0 0 0 1 2 0
                                    0 0 22 48 2 0 0 0 6 52 2 0 0 0 0 62 1 0 46
                                    0 1 2 0 0 0 69 1 2 0 0 0 16 1 1 0 71 0 1 1
                                    0 22 0 1 1 3 0 0 32 1 0 46 0 1 1 0 37 0 1 1
                                    0 0 0 1 2 0 37 0 0 1 1 0 37 0 1 1 0 16 0 1
                                    1 0 73 0 1 1 0 37 0 1 2 0 0 7 22 1 2 0 0 22
                                    7 31 1 0 0 0 33 1 0 9 0 11 1 0 22 0 1 1 0
                                    22 0 34 2 0 0 75 0 1 2 0 0 0 22 50 2 0 0 0
                                    6 54 2 0 0 0 0 61 1 0 67 0 1 2 1 7 68 0 1 1
                                    0 46 0 1 2 0 0 0 69 1 2 0 0 0 16 1 1 3 9 0
                                    1 1 3 22 0 28 1 3 0 0 1 1 3 7 0 30 1 0 76 0
                                    1 2 0 78 78 0 1 1 0 77 0 1 1 0 16 0 36 1 3
                                    0 67 1 1 0 0 67 1 1 0 37 0 40 1 0 7 0 1 2 0
                                    0 0 0 1 1 0 0 70 1 1 0 0 7 1 1 0 0 22 24 1
                                    0 0 6 25 1 0 79 0 1 1 0 74 0 1 2 0 7 0 22 1
                                    2 0 7 0 22 1 2 0 7 0 0 64 0 0 16 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 37 0 0 1 2 0 0 0 69 1
                                    2 0 0 0 16 1 0 0 0 12 0 0 0 14 2 0 37 0 0
                                    38 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 21 2 0 0
                                    0 0 1 2 0 0 70 0 1 2 0 0 16 0 1 2 0 0 6 0
                                    27 2 0 0 0 7 60 2 0 0 7 0 20 2 0 0 69 0
                                    1)))))
           '|lookupComplete|)) 
