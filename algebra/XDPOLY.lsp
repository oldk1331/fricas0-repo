
(SDEFUN |XDPOLY;mindegTerm;%R;1|
        ((|p| (%)) (% (|Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| R))))
        (SPADCALL |p| (QREFELT % 10))) 

(SDEFUN |XDPOLY;sh;%Nni%;2| ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G17 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| % 14)) ((EQL |n| 1) |p|)
                      ('T
                       (SEQ
                        (LETT |n1|
                              (PROG1 (LETT #1# (- |n| 1))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#)))
                        (EXIT
                         (SPADCALL |p| (SPADCALL |p| |n1| (QREFELT % 17))
                                   (QREFELT % 18))))))))) 

(SDEFUN |XDPOLY;sh;3%;3| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|p| (%)) (#1=#:G27 NIL) (|t2| NIL) (#2=#:G26 NIL) (|t1| NIL))
               (SEQ (LETT |p| (|spadConstant| % 12))
                    (SEQ (LETT |t1| NIL) (LETT #2# |p1|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |t2| NIL) (LETT #1# |p2|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |t2| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |p|
                                        (SPADCALL |p|
                                                  (SPADCALL
                                                   (SPADCALL (QCDR |t1|)
                                                             (QCDR |t2|)
                                                             (QREFELT % 19))
                                                   (|XDPOLY;shw| (QCAR |t1|)
                                                    (QCAR |t2|) %)
                                                   (QREFELT % 20))
                                                  (QREFELT % 21)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |p|)))) 

(SDEFUN |XDPOLY;coerce;Fm%;4| ((|w| (|FreeMonoid| |vl|)) (% (%)))
        (SPADCALL (|spadConstant| % 15) |w| (QREFELT % 23))) 

(SDEFUN |XDPOLY;coerce;vl%;5| ((|v| (|vl|)) (% (%)))
        (SPADCALL (SPADCALL |v| (QREFELT % 25)) (QREFELT % 24))) 

(SDEFUN |XDPOLY;*;vl2%;6| ((|v| (|vl|)) (|p| (%)) (% (%)))
        (SPROG ((#1=#:G34 NIL) (|t| NIL) (#2=#:G33 NIL))
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
                               (CONS (SPADCALL |v| (QCAR |t|) (QREFELT % 27))
                                     (QCDR |t|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |XDPOLY;retractIfCan;%U;7| ((|p| (%)) (% (|Union| R "failed")))
        (SPROG
         ((|t1| (|Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| R)))
          (|lt| (|Rep|)))
         (SEQ (LETT |lt| |p|)
              (EXIT
               (COND ((NULL |lt|) (CONS 0 (|spadConstant| % 13)))
                     ('T
                      (SEQ (LETT |t1| (|SPADfirst| |lt|))
                           (COND
                            ((NULL
                              (SPADCALL (QCAR |t1|) (|spadConstant| % 29)
                                        (QREFELT % 31)))
                             (EXIT (CONS 1 "failed"))))
                           (EXIT (CONS 0 (QCDR |t1|)))))))))) 

(SDEFUN |XDPOLY;retractIfCan;%U;8|
        ((|p| (%)) (% (|Union| (|FreeMonoid| |vl|) "failed")))
        (SPROG
         ((|t1| (|Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| R)))
          (|lt| (|Rep|)))
         (SEQ (LETT |lt| |p|)
              (EXIT
               (COND
                ((OR (NULL |lt|) (NULL (NULL (CDR |lt|)))) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |t1| (|SPADfirst| |lt|))
                      (EXIT
                       (COND
                        ((SPADCALL (QCDR |t1|) (|spadConstant| % 15)
                                   (QREFELT % 34))
                         (CONS 0 (QCAR |t1|)))
                        ('T (CONS 1 "failed"))))))))))) 

(SDEFUN |XDPOLY;mirror;2%;9| ((|p| (%)) (% (%)))
        (COND ((NULL |p|) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| (QREFELT % 37))
                          (SPADCALL (SPADCALL |p| (QREFELT % 38))
                                    (QREFELT % 39))
                          (QREFELT % 23))
                (SPADCALL (SPADCALL |p| (QREFELT % 40)) (QREFELT % 41))
                (QREFELT % 21))))) 

(SDEFUN |XDPOLY;degree;%Nni;10| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |p| (QREFELT % 42)) (QREFELT % 43))) 

(SDEFUN |XDPOLY;trunc;%Nni%;11|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| % 12) (QREFELT % 45))
              (NULL (> (SPADCALL |p| (QREFELT % 44)) |n|)))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT % 40)) |n| (QREFELT % 46))))) 

(SDEFUN |XDPOLY;varList;%L;12| ((|p| (%)) (% (|List| |vl|)))
        (SPROG
         ((|le| #1=(|List| |vl|)) (#2=#:G61 NIL) (#3=#:G60 #1#) (#4=#:G62 #1#)
          (#5=#:G66 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 47)) NIL)
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
                                       (SPADCALL (QCAR |t|) (QREFELT % 49)))
                                 (COND
                                  (#2#
                                   (LETT #3#
                                         (SPADCALL #3# #4# (QREFELT % 50))))
                                  ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# (|IdentityError| '|setUnion|)))))
                  (EXIT (SPADCALL |le| (QREFELT % 51))))))))) 

(SDEFUN |XDPOLY;rquo;%Fm%;13| ((|p| (%)) (|w| (|FreeMonoid| |vl|)) (% (%)))
        (SPROG
         ((#1=#:G69 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G75 NIL) (|t| NIL) (#4=#:G74 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT % 54)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT % 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT % 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;%Fm%;14| ((|p| (%)) (|w| (|FreeMonoid| |vl|)) (% (%)))
        (SPROG
         ((#1=#:G78 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G84 NIL) (|t| NIL) (#4=#:G83 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT % 56)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT % 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT % 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;rquo;%vl%;15| ((|p| (%)) (|v| (|vl|)) (% (%)))
        (SPROG
         ((#1=#:G87 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G93 NIL) (|t| NIL) (#4=#:G92 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT % 58)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT % 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT % 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;%vl%;16| ((|p| (%)) (|v| (|vl|)) (% (%)))
        (SPROG
         ((#1=#:G96 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G102 NIL) (|t| NIL) (#4=#:G101 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT % 60)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT % 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT % 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;shw|
        ((|w1| (|FreeMonoid| |vl|)) (|w2| (|FreeMonoid| |vl|)) (% (%)))
        (SPROG ((|y| (|vl|)) (|x| (|vl|)))
               (SEQ
                (COND
                 ((SPADCALL |w1| (|spadConstant| % 29) (QREFELT % 31))
                  (SPADCALL (|spadConstant| % 15) |w2| (QREFELT % 23)))
                 ((SPADCALL |w2| (|spadConstant| % 29) (QREFELT % 31))
                  (SPADCALL (|spadConstant| % 15) |w1| (QREFELT % 23)))
                 ('T
                  (SEQ (LETT |x| (SPADCALL |w1| (QREFELT % 62)))
                       (LETT |y| (SPADCALL |w2| (QREFELT % 62)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |x|
                                   (|XDPOLY;shw| (SPADCALL |w1| (QREFELT % 63))
                                    |w2| %)
                                   (QREFELT % 28))
                         (SPADCALL |y|
                                   (|XDPOLY;shw| |w1|
                                    (SPADCALL |w2| (QREFELT % 63)) %)
                                   (QREFELT % 28))
                         (QREFELT % 21))))))))) 

(SDEFUN |XDPOLY;lquo;3%;18| ((|p| (%)) (|q| (%)) (% (%)))
        (SPROG
         ((#1=#:G108 NIL) (#2=#:G107 (%)) (#3=#:G109 (%)) (|r| (%))
          (#4=#:G111 NIL) (|t| NIL))
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
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT % 57)))
                     (|spadConstant| % 12) (QREFELT % 64))
                    (PROGN
                     (LETT #3# (SPADCALL (QCDR |t|) |r| (QREFELT % 20)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 21))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 12))))))) 

(SDEFUN |XDPOLY;rquo;3%;19| ((|p| (%)) (|q| (%)) (% (%)))
        (SPROG
         ((#1=#:G113 NIL) (#2=#:G112 (%)) (#3=#:G114 (%)) (|r| (%))
          (#4=#:G116 NIL) (|t| NIL))
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
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT % 55)))
                     (|spadConstant| % 12) (QREFELT % 64))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT % 66)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 21))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 12))))))) 

(SDEFUN |XDPOLY;coef;2%R;20| ((|p| (%)) (|q| (%)) (% (R)))
        (SPROG ((#1=#:G120 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |p| (|spadConstant| % 12) (QREFELT % 45))
                       (SPADCALL |q| (|spadConstant| % 12) (QREFELT % 45)))
                   (|spadConstant| % 13))
                  ('T
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT % 68))
                     (SPADCALL (CDR |p|) |q| (QREFELT % 69)))
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT % 70))
                     (SPADCALL |p| (CDR |q|) (QREFELT % 69)))
                    ('T
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (QCDR (|SPADfirst| |p|))
                                       (QCDR (|SPADfirst| |q|)) (QREFELT % 19))
                             (SPADCALL (CDR |p|) (CDR |q|) (QREFELT % 69))
                             (QREFELT % 71)))
                      (GO #2=#:G119)))))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |XDistributedPolynomial;|)) 

(DEFUN |XDistributedPolynomial| (&REST #1=#:G125)
  (SPROG NIL
         (PROG (#2=#:G126)
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
   ((|pv$| NIL) (#1=#:G124 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XDistributedPolynomial| DV$1 DV$2))
    (LETT % (GETREFV 82))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|List| (|Record| (|:| |k| (|FreeMonoid| |#1|)) (|:| |c| |#2|))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 17 (CONS (|dispatchFunction| |XDPOLY;sh;%Nni%;2|) %))
       (QSETREFV % 18 (CONS (|dispatchFunction| |XDPOLY;sh;3%;3|) %)))))
    %))) 

(MAKEPROP '|XDistributedPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XPolynomialRing| 7 22) (|local| |#1|)
              (|local| |#2|) '|Rep| (|Record| (|:| |k| 22) (|:| |c| 7))
              (0 . |last|) |XDPOLY;mindegTerm;%R;1| (5 . |Zero|) (9 . |Zero|)
              (13 . |One|) (17 . |One|) (|NonNegativeInteger|) (21 . |sh|)
              (27 . |sh|) (33 . *) (39 . *) (45 . +) (|FreeMonoid| 6)
              (51 . |monomial|) |XDPOLY;coerce;Fm%;4| (57 . |coerce|)
              |XDPOLY;coerce;vl%;5| (62 . *) |XDPOLY;*;vl2%;6| (68 . |One|)
              (|Boolean|) (72 . =) (|Union| 7 '"failed")
              |XDPOLY;retractIfCan;%U;7| (78 . =) (|Union| 22 '"failed")
              |XDPOLY;retractIfCan;%U;8| (84 . |leadingCoefficient|)
              (89 . |leadingSupport|) (94 . |mirror|) (99 . |reductum|)
              |XDPOLY;mirror;2%;9| (104 . |maxdeg|) (109 . |length|)
              |XDPOLY;degree;%Nni;10| (114 . =) |XDPOLY;trunc;%Nni%;11|
              (120 . |constant?|) (|List| 6) (125 . |varList|)
              (130 . |setUnion|) (136 . |sort!|) |XDPOLY;varList;%L;12|
              (|Union| % '"failed") (141 . |rquo|) |XDPOLY;rquo;%Fm%;13|
              (147 . |lquo|) |XDPOLY;lquo;%Fm%;14| (153 . |rquo|)
              |XDPOLY;rquo;%vl%;15| (159 . |lquo|) |XDPOLY;lquo;%vl%;16|
              (165 . |first|) (170 . |rest|) (175 . ~=) |XDPOLY;lquo;3%;18|
              (181 . *) |XDPOLY;rquo;3%;19| (187 . >) |XDPOLY;coef;2%R;20|
              (193 . <) (199 . +) (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Integer|) (|Mapping| 7 7) (|List| %) (|List| 7) (|List| 22)
              (|List| 9) (|Mapping| 7 22))
           '#(~= 205 |zero?| 211 |varList| 216 |trunc| 221 |support| 227
              |subtractIfCan| 232 |smaller?| 238 |sh| 244 |sample| 256 |rquo|
              260 |rightRecip| 278 |rightPower| 283 |retractIfCan| 295
              |retract| 305 |reductum| 315 |recip| 320 |quasiRegular?| 325
              |quasiRegular| 330 |plenaryPower| 335 |opposite?| 341 |one?| 347
              |numberOfMonomials| 352 |monomials| 357 |monomial?| 362
              |monomial| 367 |mirror| 373 |mindegTerm| 378 |mindeg| 383
              |maxdeg| 388 |map| 393 |lquo| 399 |listOfTerms| 417
              |linearExtend| 422 |leftRecip| 428 |leftPower| 433 |leadingTerm|
              445 |leadingSupport| 450 |leadingMonomial| 455
              |leadingCoefficient| 460 |latex| 465 |degree| 470
              |constructOrdered| 475 |construct| 480 |constant?| 485 |constant|
              490 |commutator| 495 |coerce| 501 |coefficients| 526
              |coefficient| 531 |coef| 537 |characteristic| 549 |associator|
              553 |antiCommutator| 560 |annihilate?| 566 ^ 572 |Zero| 584 |One|
              588 = 592 - 598 + 609 * 615)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 4 0 0 0 0 0 2 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |FreeModuleCategory&| |Rng&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Ring|) (|NonAssociativeAlgebra| 7)
                 (|SemiRing|) (|FreeModuleCategory| 7 (|FreeMonoid| 6)) (|Rng|)
                 (|Module| 7) (|SemiRng|)
                 (|IndexedDirectProductCategory| 7 (|FreeMonoid| 6))
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7 (|FreeMonoid| 6))
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|SetCategory|)
                 (|RetractableTo| 7) (|RetractableTo| (|FreeMonoid| 6))
                 (|noZeroDivisors|) (|CoercibleTo| 72) (|BasicType|)
                 (|unitsKnown|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| (|FreeMonoid| 6)))
              (|makeByteWordVec2| 81
                                  '(1 8 9 0 10 0 0 0 12 0 7 0 13 0 0 0 14 0 7 0
                                    15 2 0 0 0 16 17 2 0 0 0 0 18 2 7 0 0 0 19
                                    2 0 0 7 0 20 2 0 0 0 0 21 2 0 0 7 22 23 1
                                    22 0 6 25 2 22 0 6 0 27 0 22 0 29 2 22 30 0
                                    0 31 2 7 30 0 0 34 1 0 7 0 37 1 0 22 0 38 1
                                    22 0 0 39 1 0 0 0 40 1 0 22 0 42 1 22 16 0
                                    43 2 0 30 0 0 45 1 0 30 0 47 1 22 48 0 49 2
                                    48 0 0 0 50 1 48 0 0 51 2 22 53 0 0 54 2 22
                                    53 0 0 56 2 22 53 0 6 58 2 22 53 0 6 60 1
                                    22 6 0 62 1 22 0 0 63 2 0 30 0 0 64 2 0 0 0
                                    7 66 2 22 30 0 0 68 2 22 30 0 0 70 2 7 0 0
                                    0 71 2 0 30 0 0 64 1 0 30 0 1 1 0 48 0 52 2
                                    0 0 0 16 46 1 0 79 0 1 2 0 53 0 0 1 2 4 30
                                    0 0 1 2 1 0 0 16 17 2 1 0 0 0 18 0 0 0 1 2
                                    0 0 0 6 59 2 0 0 0 0 67 2 0 0 0 22 55 1 0
                                    53 0 1 2 0 0 0 74 1 2 0 0 0 16 1 1 0 32 0
                                    33 1 0 35 0 36 1 0 7 0 1 1 0 22 0 1 1 3 0 0
                                    40 1 0 53 0 1 1 0 30 0 1 1 0 0 0 1 2 1 0 0
                                    74 1 2 0 30 0 0 1 1 0 30 0 1 1 0 16 0 1 1 0
                                    77 0 1 1 0 30 0 1 2 0 0 7 22 23 1 0 0 0 41
                                    1 0 9 0 11 1 0 22 0 1 1 0 22 0 42 2 0 0 76
                                    0 1 2 0 0 0 6 61 2 0 0 0 0 65 2 0 0 0 22 57
                                    1 0 80 0 1 2 1 7 81 0 1 1 0 53 0 1 2 0 0 0
                                    74 1 2 0 0 0 16 1 1 3 9 0 1 1 3 22 0 38 1 3
                                    0 0 1 1 3 7 0 37 1 0 73 0 1 1 0 16 0 44 1 3
                                    0 80 1 1 0 0 80 1 1 0 30 0 47 1 0 7 0 1 2 0
                                    0 0 0 1 1 0 72 0 1 1 0 0 75 1 1 0 0 7 1 1 0
                                    0 22 24 1 0 0 6 26 1 0 78 0 1 2 0 7 0 22 1
                                    2 0 7 0 0 69 2 0 7 0 22 1 0 0 16 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 30 0 0 1 2 0 0 0 74 1
                                    2 0 0 0 16 1 0 0 0 12 0 0 0 14 2 0 30 0 0
                                    45 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 21 2 0 0
                                    74 0 1 2 0 0 0 0 1 2 0 0 75 0 1 2 0 0 16 0
                                    1 2 0 0 0 7 66 2 0 0 7 0 20 2 0 0 6 0
                                    28)))))
           '|lookupComplete|)) 
