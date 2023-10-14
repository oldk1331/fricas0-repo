
(SDEFUN |XDPOLY;mindegTerm;$R;1|
        ((|p| $) ($ |Record| (|:| |k| (|OrderedFreeMonoid| |vl|)) (|:| |c| R)))
        (SPADCALL |p| (QREFELT $ 10))) 

(SDEFUN |XDPOLY;sh;$Nni$;2| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G112 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 14)) ((EQL |n| 1) |p|)
                      ('T
                       (SEQ
                        (LETT |n1|
                              (PROG1
                                  (LETT #1# (- |n| 1)
                                        . #2=(|XDPOLY;sh;$Nni$;2|))
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              . #2#)
                        (EXIT
                         (SPADCALL |p| (SPADCALL |p| |n1| (QREFELT $ 17))
                                   (QREFELT $ 18))))))))) 

(SDEFUN |XDPOLY;sh;3$;3| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|p| ($)) (#1=#:G120 NIL) (|t2| NIL) (#2=#:G119 NIL) (|t1| NIL))
         (SEQ (LETT |p| (|spadConstant| $ 12) . #3=(|XDPOLY;sh;3$;3|))
              (SEQ (LETT |t1| NIL . #3#) (LETT #2# |p1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL . #3#) (LETT #1# |p2| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |t2| (CAR #1#) . #3#) NIL))
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
                                            (QREFELT $ 21))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(SDEFUN |XDPOLY;coerce;vl$;4| ((|v| |vl|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 23)) (QREFELT $ 24))) 

(SDEFUN |XDPOLY;*;vl2$;5| ((|v| |vl|) (|p| $) ($ $))
        (SPROG ((#1=#:G125 NIL) (|t| NIL) (#2=#:G124 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|XDPOLY;*;vl2$;5|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL |v| (QCAR |t|) (QREFELT $ 26))
                                     (QCDR |t|))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
              (NULL
               (SPADCALL (SPADCALL |p| (QREFELT $ 36)) |n| (QREFELT $ 39))))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 32)) |n| (QREFELT $ 40))))) 

(SDEFUN |XDPOLY;varList;$L;9| ((|p| $) ($ |List| |vl|))
        (SPROG
         ((|le| #1=(|List| |vl|)) (#2=#:G131 NIL) (#3=#:G130 #1#)
          (#4=#:G132 #1#) (#5=#:G136 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 41)) NIL)
                (#6='T
                 (SEQ
                  (LETT |le|
                        (PROGN
                         (LETT #2# NIL . #7=(|XDPOLY;varList;$L;9|))
                         (SEQ (LETT |t| NIL . #7#) (LETT #5# |p| . #7#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL (QCAR |t|) (QREFELT $ 43))
                                       . #7#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 44))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #7#)
                                    (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# (|IdentityError| '|setUnion|))))
                        . #7#)
                  (EXIT (SPADCALL |le| (QREFELT $ 45))))))))) 

(SDEFUN |XDPOLY;rquo;$Ofm$;10| ((|p| $) (|w| |OrderedFreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G138 NIL) (|r| (|Union| (|OrderedFreeMonoid| |vl|) "failed"))
          (#2=#:G144 NIL) (|t| NIL) (#3=#:G143 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|XDPOLY;rquo;$Ofm$;10|))
           (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 48)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                    (LETT #3#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #4#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|OrderedFreeMonoid|
                                              (QREFELT $ 6))
                                             #1#))
                            (QCDR |t|))
                           #3#)
                          . #4#)))))
                (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                (EXIT (NREVERSE #3#))))))) 

(SDEFUN |XDPOLY;lquo;$Ofm$;11| ((|p| $) (|w| |OrderedFreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G146 NIL) (|r| (|Union| (|OrderedFreeMonoid| |vl|) "failed"))
          (#2=#:G152 NIL) (|t| NIL) (#3=#:G151 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|XDPOLY;lquo;$Ofm$;11|))
           (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 50)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                    (LETT #3#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #4#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|OrderedFreeMonoid|
                                              (QREFELT $ 6))
                                             #1#))
                            (QCDR |t|))
                           #3#)
                          . #4#)))))
                (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                (EXIT (NREVERSE #3#))))))) 

(SDEFUN |XDPOLY;rquo;$vl$;12| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G154 NIL) (|r| (|Union| (|OrderedFreeMonoid| |vl|) "failed"))
          (#2=#:G160 NIL) (|t| NIL) (#3=#:G159 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|XDPOLY;rquo;$vl$;12|))
           (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 52)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                    (LETT #3#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #4#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|OrderedFreeMonoid|
                                              (QREFELT $ 6))
                                             #1#))
                            (QCDR |t|))
                           #3#)
                          . #4#)))))
                (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                (EXIT (NREVERSE #3#))))))) 

(SDEFUN |XDPOLY;lquo;$vl$;13| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G162 NIL) (|r| (|Union| (|OrderedFreeMonoid| |vl|) "failed"))
          (#2=#:G168 NIL) (|t| NIL) (#3=#:G167 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|XDPOLY;lquo;$vl$;13|))
           (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 54)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                    (LETT #3#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #4#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|OrderedFreeMonoid|
                                              (QREFELT $ 6))
                                             #1#))
                            (QCDR |t|))
                           #3#)
                          . #4#)))))
                (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                (EXIT (NREVERSE #3#))))))) 

(SDEFUN |XDPOLY;shw|
        ((|w1| |OrderedFreeMonoid| |vl|) (|w2| |OrderedFreeMonoid| |vl|) ($ $))
        (SPROG ((|y| (|vl|)) (|x| (|vl|)))
               (SEQ
                (COND
                 ((SPADCALL |w1| (|spadConstant| $ 56) (QREFELT $ 57))
                  (SPADCALL |w2| (QREFELT $ 24)))
                 ((SPADCALL |w2| (|spadConstant| $ 56) (QREFELT $ 57))
                  (SPADCALL |w1| (QREFELT $ 24)))
                 ('T
                  (SEQ
                   (LETT |x| (SPADCALL |w1| (QREFELT $ 58))
                         . #1=(|XDPOLY;shw|))
                   (LETT |y| (SPADCALL |w2| (QREFELT $ 58)) . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |x|
                               (|XDPOLY;shw| (SPADCALL |w1| (QREFELT $ 59))
                                |w2| $)
                               (QREFELT $ 27))
                     (SPADCALL |y|
                               (|XDPOLY;shw| |w1|
                                (SPADCALL |w2| (QREFELT $ 59)) $)
                               (QREFELT $ 27))
                     (QREFELT $ 21))))))))) 

(SDEFUN |XDPOLY;lquo;3$;15| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G172 NIL) (#2=#:G171 ($)) (#3=#:G173 ($)) (|r| ($))
          (#4=#:G175 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XDPOLY;lquo;3$;15|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |q| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 51)) . #5#)
                     (|spadConstant| $ 12) (QREFELT $ 60))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 61)) . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                      ('T
                       (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;rquo;3$;16| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G177 NIL) (#2=#:G176 ($)) (#3=#:G178 ($)) (|r| ($))
          (#4=#:G180 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XDPOLY;rquo;3$;16|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |q| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 49)) . #5#)
                     (|spadConstant| $ 12) (QREFELT $ 60))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 61)) . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                      ('T
                       (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;coef;2$R;17| ((|p| $) (|q| $) ($ R))
        (SPROG ((#1=#:G184 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
                       (SPADCALL |q| (|spadConstant| $ 12) (QREFELT $ 38)))
                   (|spadConstant| $ 13))
                  ('T
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 64))
                     (SPADCALL (CDR |p|) |q| (QREFELT $ 65)))
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 66))
                     (SPADCALL |p| (CDR |q|) (QREFELT $ 65)))
                    ('T
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (QCDR (|SPADfirst| |p|))
                                       (QCDR (|SPADfirst| |q|)) (QREFELT $ 19))
                             (SPADCALL (CDR |p|) (CDR |q|) (QREFELT $ 65))
                             (QREFELT $ 67))
                            |XDPOLY;coef;2$R;17|)
                      (GO #2=#:G183)))))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |XDistributedPolynomial;|)) 

(DEFUN |XDistributedPolynomial| (&REST #1=#:G191)
  (SPROG NIL
         (PROG (#2=#:G192)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XDistributedPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|XDistributedPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XDistributedPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XDistributedPolynomial|)))))))))) 

(DEFUN |XDistributedPolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|XDistributedPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|XDistributedPolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 81) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory|
                                                (|OrderedFreeMonoid| |#1|)
                                                '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|OrderedFreeMonoid| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|OrderedFreeMonoid| |#1|)
                                                 '(|OrderedSet|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|OrderedFreeMonoid| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|OrderedFreeMonoid| |#1|)
                                                 '(|OrderedSet|))))
                                              (|HasCategory| |#2|
                                                             '(|noZeroDivisors|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|XDistributedPolynomial|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List|
                     (|Record| (|:| |k| (|OrderedFreeMonoid| |#1|))
                               (|:| |c| |#2|))))
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
              (27 . |sh|) (33 . *) (39 . *) (45 . +) (|OrderedFreeMonoid| 6)
              (51 . |coerce|) (56 . |coerce|) |XDPOLY;coerce;vl$;4| (61 . *)
              |XDPOLY;*;vl2$;5| (67 . |leadingMonomial|) (72 . |mirror|)
              (77 . |leadingCoefficient|) (82 . |monom|) (88 . |reductum|)
              |XDPOLY;mirror;2$;6| (93 . |maxdeg|) (98 . |length|)
              |XDPOLY;degree;$Nni;7| (|Boolean|) (103 . =) (109 . >)
              |XDPOLY;trunc;$Nni$;8| (115 . |constant?|) (|List| 6)
              (120 . |varList|) (125 . |setUnion|) (131 . |sort!|)
              |XDPOLY;varList;$L;9| (|Union| $ '"failed") (136 . |rquo|)
              |XDPOLY;rquo;$Ofm$;10| (142 . |lquo|) |XDPOLY;lquo;$Ofm$;11|
              (148 . |rquo|) |XDPOLY;rquo;$vl$;12| (154 . |lquo|)
              |XDPOLY;lquo;$vl$;13| (160 . |One|) (164 . =) (170 . |first|)
              (175 . |rest|) (180 . ~=) (186 . *) |XDPOLY;lquo;3$;15|
              |XDPOLY;rquo;3$;16| (192 . >) |XDPOLY;coef;2$R;17| (198 . <)
              (204 . +) (|Mapping| 7 22) (|Integer|) (|PositiveInteger|)
              (|Union| 22 '"failed") (|List| $) (|List| 22) (|List| 7)
              (|Mapping| 7 7) (|List| 9) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 210 |zero?| 216 |varList| 221 |trunc| 226 |support| 232 |sup|
              237 |subtractIfCan| 243 |smaller?| 249 |sh| 255 |sample| 267
              |rquo| 271 |retractIfCan| 289 |retract| 294 |reductum| 299
              |recip| 304 |quasiRegular?| 309 |quasiRegular| 314 |opposite?|
              319 |one?| 325 |numberOfMonomials| 330 |monomials| 335
              |monomial?| 340 |monomial| 345 |monom| 351 |mirror| 357
              |mindegTerm| 362 |mindeg| 367 |min| 372 |maxdeg| 378 |max| 383
              |map| 389 |lquo| 395 |listOfTerms| 413 |linearExtend| 418
              |leadingTerm| 424 |leadingSupport| 429 |leadingMonomial| 434
              |leadingCoefficient| 439 |latex| 444 |hashUpdate!| 449 |hash| 455
              |degree| 460 |constructOrdered| 465 |construct| 470 |constant?|
              475 |constant| 480 |coerce| 485 |coefficients| 510 |coefficient|
              515 |coef| 521 |characteristic| 533 |annihilate?| 537 ^ 543
              |Zero| 555 |One| 559 >= 563 > 569 = 575 <= 581 < 587 - 593 + 604
              * 610)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 1 0 1 0 0 2 0 0 0 0 0 2 0 4 0 0 4 0 0
                                  0 4 0 0 3 0 0 0 0 0 4 5))
            (CONS
             '#(NIL NIL NIL |FreeModuleCategory&| |Algebra&| NIL |Module&| NIL
                |Ring&| NIL NIL NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL
                NIL NIL |Monoid&| NIL |AbelianMonoid&| |OrderedSet&|
                |SemiGroup&| |AbelianSemiGroup&| NIL |SetCategory&| NIL
                |RetractableTo&| |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|FreeModuleCategory| 7 (|OrderedFreeMonoid| 6)) (|Algebra| 7)
                 (|IndexedDirectProductCategory| 7 (|OrderedFreeMonoid| 6))
                 (|Module| 7) (|BiModule| 7 7) (|Ring|)
                 (|OrderedAbelianMonoidSup|) (|LeftModule| 7) (|LeftModule| $$)
                 (|Rng|) (|AbelianProductCategory| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|Monoid|) (|SemiRng|) (|AbelianMonoid|) (|OrderedSet|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|SetCategory|) (|unitsKnown|)
                 (|RetractableTo| (|OrderedFreeMonoid| 6)) (|BasicType|)
                 (|CoercibleTo| 80) (|PartialOrder|) (|noZeroDivisors|))
              (|makeByteWordVec2| 80
                                  '(1 8 9 0 10 0 0 0 12 0 7 0 13 0 0 0 14 0 7 0
                                    15 2 0 0 0 16 17 2 0 0 0 0 18 2 7 0 0 0 19
                                    2 0 0 7 0 20 2 0 0 0 0 21 1 22 0 6 23 1 0 0
                                    22 24 2 22 0 6 0 26 1 0 22 0 28 1 22 0 0 29
                                    1 0 7 0 30 2 0 0 22 7 31 1 0 0 0 32 1 0 22
                                    0 34 1 22 16 0 35 2 0 37 0 0 38 2 16 37 0 0
                                    39 1 0 37 0 41 1 22 42 0 43 2 42 0 0 0 44 1
                                    42 0 0 45 2 22 47 0 0 48 2 22 47 0 0 50 2
                                    22 47 0 6 52 2 22 47 0 6 54 0 22 0 56 2 22
                                    37 0 0 57 1 22 6 0 58 1 22 0 0 59 2 0 37 0
                                    0 60 2 0 0 0 7 61 2 22 37 0 0 64 2 22 37 0
                                    0 66 2 7 0 0 0 67 2 0 37 0 0 60 1 0 37 0 1
                                    1 0 42 0 46 2 0 0 0 16 40 1 0 73 0 1 2 2 0
                                    0 0 1 2 0 47 0 0 1 2 3 37 0 0 1 2 1 0 0 16
                                    17 2 1 0 0 0 18 0 0 0 1 2 0 0 0 22 49 2 0 0
                                    0 6 53 2 0 0 0 0 63 1 0 71 0 1 1 0 22 0 1 1
                                    0 0 0 32 1 0 47 0 1 1 0 37 0 1 1 0 0 0 1 2
                                    0 37 0 0 1 1 0 37 0 1 1 0 16 0 1 1 0 72 0 1
                                    1 0 37 0 1 2 0 0 7 22 1 2 0 0 22 7 31 1 0 0
                                    0 33 1 0 9 0 11 1 0 22 0 1 2 4 0 0 0 1 1 0
                                    22 0 34 2 4 0 0 0 1 2 0 0 75 0 1 2 0 0 0 6
                                    55 2 0 0 0 0 62 2 0 0 0 22 51 1 0 76 0 1 2
                                    1 7 68 0 1 1 0 9 0 1 1 0 22 0 1 1 0 22 0 28
                                    1 0 7 0 30 1 0 77 0 1 2 0 79 79 0 1 1 0 78
                                    0 1 1 0 16 0 36 1 0 0 76 1 1 0 0 76 1 1 0
                                    37 0 41 1 0 7 0 1 1 0 0 69 1 1 0 0 22 24 1
                                    0 0 7 1 1 0 0 6 25 1 0 80 0 1 1 0 74 0 1 2
                                    0 7 0 22 1 2 0 7 0 0 65 2 0 7 0 22 1 0 0 16
                                    1 2 0 37 0 0 1 2 0 0 0 70 1 2 0 0 0 16 1 0
                                    0 0 12 0 0 0 14 2 4 37 0 0 1 2 4 37 0 0 1 2
                                    0 37 0 0 38 2 4 37 0 0 1 2 4 37 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 21 2 0 0 16 0 1 2
                                    0 0 0 0 1 2 0 0 69 0 1 2 0 0 6 0 27 2 0 0
                                    22 7 1 2 0 0 7 22 1 2 0 0 0 7 61 2 0 0 7 0
                                    20 2 0 0 70 0 1)))))
           '|lookupComplete|)) 
