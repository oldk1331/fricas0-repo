
(/VERSIONCHECK 2) 

(DEFUN |XDPOLY;mindegTerm;$R;1| (|p| $) (SPADCALL |p| (QREFELT $ 10))) 

(DEFUN |XDPOLY;sh;$Nni$;2| (|p| |n| $)
  (PROG (|n1| #1=#:G134)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 14)) ((EQL |n| 1) |p|)
            ('T
             (SEQ
              (LETT |n1|
                    (PROG1 (LETT #1# (- |n| 1) . #2=(|XDPOLY;sh;$Nni$;2|))
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    . #2#)
              (EXIT
               (SPADCALL |p| (SPADCALL |p| |n1| (QREFELT $ 17))
                         (QREFELT $ 18)))))))))) 

(DEFUN |XDPOLY;sh;3$;3| (|p1| |p2| $)
  (PROG (|p| #1=#:G142 |t2| #2=#:G141 |t1|)
    (RETURN
     (SEQ (LETT |p| (|spadConstant| $ 12) . #3=(|XDPOLY;sh;3$;3|))
          (SEQ (LETT |t1| NIL . #3#) (LETT #2# |p1| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t2| NIL . #3#) (LETT #1# |p2| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t2| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |p|
                              (SPADCALL |p|
                                        (SPADCALL
                                         (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                   (QREFELT $ 19))
                                         (|XDPOLY;shw| (QCAR |t1|) (QCAR |t2|)
                                          $)
                                         (QREFELT $ 20))
                                        (QREFELT $ 21))
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |p|))))) 

(DEFUN |XDPOLY;coerce;vl$;4| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 23)) (QREFELT $ 24))) 

(DEFUN |XDPOLY;*;vl2$;5| (|v| |p| $)
  (PROG (#1=#:G147 |t| #2=#:G146)
    (RETURN
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
                     (CONS (SPADCALL |v| (QCAR |t|) (QREFELT $ 26)) (QCDR |t|))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |XDPOLY;mirror;2$;6| (|p| $)
  (COND ((NULL |p|) |p|)
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 28)) (QREFELT $ 29))
                    (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 31))
          (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 33))
          (QREFELT $ 21))))) 

(DEFUN |XDPOLY;degree;$Nni;7| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 34)) (QREFELT $ 35))) 

(DEFUN |XDPOLY;trunc;$Nni$;8| (|p| |n| $)
  (COND
   ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
        (NULL (SPADCALL (SPADCALL |p| (QREFELT $ 36)) |n| (QREFELT $ 39))))
    |p|)
   ('T (SPADCALL (SPADCALL |p| (QREFELT $ 32)) |n| (QREFELT $ 40))))) 

(DEFUN |XDPOLY;varList;$L;9| (|p| $)
  (PROG (|le| #1=#:G153 #2=#:G152 #3=#:G154 #4=#:G158 |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 41)) NIL)
            (#5='T
             (SEQ
              (LETT |le|
                    (PROGN
                     (LETT #1# NIL . #6=(|XDPOLY;varList;$L;9|))
                     (SEQ (LETT |t| NIL . #6#) (LETT #4# |p| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# (SPADCALL (QCAR |t|) (QREFELT $ 43))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#5# (|IdentityError| '|setUnion|))))
                    . #6#)
              (EXIT (SPADCALL |le| (QREFELT $ 45)))))))))) 

(DEFUN |XDPOLY;rquo;$Ofm$;10| (|p| |w| $)
  (PROG (#1=#:G160 |r| #2=#:G166 |t| #3=#:G165)
    (RETURN
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
               ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 48)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                (LETT #3#
                      (CONS
                       (CONS
                        (PROG2 (LETT #1# |r| . #4#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0)
                                         (|OrderedFreeMonoid| (QREFELT $ 6))
                                         #1#))
                        (QCDR |t|))
                       #3#)
                      . #4#)))))
            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
            (EXIT (NREVERSE #3#)))))))) 

(DEFUN |XDPOLY;lquo;$Ofm$;11| (|p| |w| $)
  (PROG (#1=#:G168 |r| #2=#:G174 |t| #3=#:G173)
    (RETURN
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
               ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 50)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                (LETT #3#
                      (CONS
                       (CONS
                        (PROG2 (LETT #1# |r| . #4#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0)
                                         (|OrderedFreeMonoid| (QREFELT $ 6))
                                         #1#))
                        (QCDR |t|))
                       #3#)
                      . #4#)))))
            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
            (EXIT (NREVERSE #3#)))))))) 

(DEFUN |XDPOLY;rquo;$vl$;12| (|p| |v| $)
  (PROG (#1=#:G176 |r| #2=#:G182 |t| #3=#:G181)
    (RETURN
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
               ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 52)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                (LETT #3#
                      (CONS
                       (CONS
                        (PROG2 (LETT #1# |r| . #4#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0)
                                         (|OrderedFreeMonoid| (QREFELT $ 6))
                                         #1#))
                        (QCDR |t|))
                       #3#)
                      . #4#)))))
            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
            (EXIT (NREVERSE #3#)))))))) 

(DEFUN |XDPOLY;lquo;$vl$;13| (|p| |v| $)
  (PROG (#1=#:G184 |r| #2=#:G190 |t| #3=#:G189)
    (RETURN
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
               ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 54)) . #4#)
                     (EXIT (COND ((QEQCAR |r| 1) 'NIL) ('T 'T))))
                (LETT #3#
                      (CONS
                       (CONS
                        (PROG2 (LETT #1# |r| . #4#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0)
                                         (|OrderedFreeMonoid| (QREFELT $ 6))
                                         #1#))
                        (QCDR |t|))
                       #3#)
                      . #4#)))))
            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
            (EXIT (NREVERSE #3#)))))))) 

(DEFUN |XDPOLY;shw| (|w1| |w2| $)
  (PROG (|y| |x|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |w1| (|spadConstant| $ 56) (QREFELT $ 57))
        (SPADCALL |w2| (QREFELT $ 24)))
       ((SPADCALL |w2| (|spadConstant| $ 56) (QREFELT $ 57))
        (SPADCALL |w1| (QREFELT $ 24)))
       ('T
        (SEQ (LETT |x| (SPADCALL |w1| (QREFELT $ 58)) . #1=(|XDPOLY;shw|))
             (LETT |y| (SPADCALL |w2| (QREFELT $ 58)) . #1#)
             (EXIT
              (SPADCALL
               (SPADCALL |x|
                         (|XDPOLY;shw| (SPADCALL |w1| (QREFELT $ 59)) |w2| $)
                         (QREFELT $ 27))
               (SPADCALL |y|
                         (|XDPOLY;shw| |w1| (SPADCALL |w2| (QREFELT $ 59)) $)
                         (QREFELT $ 27))
               (QREFELT $ 21)))))))))) 

(DEFUN |XDPOLY;lquo;3$;15| (|p| |q| $)
  (PROG (#1=#:G194 #2=#:G193 #3=#:G195 |r| #4=#:G197 |t|)
    (RETURN
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
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 12)))))))) 

(DEFUN |XDPOLY;rquo;3$;16| (|p| |q| $)
  (PROG (#1=#:G199 #2=#:G198 #3=#:G200 |r| #4=#:G202 |t|)
    (RETURN
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
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 12)))))))) 

(DEFUN |XDPOLY;coef;2$R;17| (|p| |q| $)
  (PROG (#1=#:G205)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
             (SPADCALL |q| (|spadConstant| $ 12) (QREFELT $ 38)))
         (|spadConstant| $ 13))
        ('T
         (COND
          ((SPADCALL (QCAR (|SPADfirst| |p|)) (QCAR (|SPADfirst| |q|))
                     (QREFELT $ 64))
           (SPADCALL (CDR |p|) |q| (QREFELT $ 65)))
          ((SPADCALL (QCAR (|SPADfirst| |p|)) (QCAR (|SPADfirst| |q|))
                     (QREFELT $ 66))
           (SPADCALL |p| (CDR |q|) (QREFELT $ 65)))
          ('T
           (PROGN
            (LETT #1#
                  (SPADCALL
                   (SPADCALL (QCDR (|SPADfirst| |p|)) (QCDR (|SPADfirst| |q|))
                             (QREFELT $ 19))
                   (SPADCALL (CDR |p|) (CDR |q|) (QREFELT $ 65))
                   (QREFELT $ 67))
                  |XDPOLY;coef;2$R;17|)
            (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |XDistributedPolynomial| (&REST #1=#:G214)
  (PROG ()
    (RETURN
     (PROG (#2=#:G215)
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
              (HREM |$ConstructorCache| '|XDistributedPolynomial|))))))))))) 

(DEFUN |XDistributedPolynomial;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G212 #2=#:G213 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|XDistributedPolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT |dv$| (LIST '|XDistributedPolynomial| DV$1 DV$2) . #3#)
      (LETT $ (GETREFV 80) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                . #3#)
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (|HasCategory| |#2|
                                                         '(|noZeroDivisors|))
                                          (LETT #1#
                                                (|HasCategory| |#2|
                                                               '(|Comparable|))
                                                . #3#)
                                          (OR #1# #2#
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|)))))
                      . #3#))
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
      $)))) 

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
              (|Union| 22 '"failed") (|List| $) (|List| 7) (|List| 22)
              (|Mapping| 7 7) (|List| 9) (|SingleInteger|) (|String|)
              (|OutputForm|))
           '#(~= 210 |zero?| 216 |varList| 221 |trunc| 226 |support| 232 |sup|
              237 |subtractIfCan| 243 |smaller?| 249 |sh| 255 |sample| 267
              |rquo| 271 |retractIfCan| 289 |retract| 294 |reductum| 299
              |recip| 304 |quasiRegular?| 309 |quasiRegular| 314 |one?| 319
              |numberOfMonomials| 324 |monomials| 329 |monomial?| 334
              |monomial| 339 |monom| 345 |mirror| 351 |mindegTerm| 356 |mindeg|
              361 |min| 366 |maxdeg| 372 |max| 377 |map| 383 |lquo| 389
              |listOfTerms| 407 |linearExtend| 412 |leadingTerm| 418
              |leadingSupport| 423 |leadingMonomial| 428 |leadingCoefficient|
              433 |latex| 438 |hash| 443 |degree| 448 |constructOrdered| 453
              |construct| 458 |constant?| 463 |constant| 468 |coerce| 473
              |coefficients| 498 |coefficient| 503 |coef| 509 |characteristic|
              521 ^ 525 |Zero| 537 |One| 541 >= 545 > 551 = 557 <= 563 < 569 -
              575 + 586 * 592)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 1 0 1 0 0 2 0 0 0 0 0 2 0 4 0 0 4 0 0
                                  0 4 0 0 7 0 0 0 0 0 3 5))
            (CONS
             '#(NIL NIL NIL |FreeModuleCategory&| |Algebra&| NIL |Module&| NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL |Monoid&| NIL |AbelianMonoid&| |OrderedSet&| |SemiGroup&|
                |AbelianSemiGroup&| NIL |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL |PartialOrder&| NIL)
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
                 (|CoercibleTo| 79) (|PartialOrder|) (|noZeroDivisors|))
              (|makeByteWordVec2| 79
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
                                    1 0 42 0 46 2 0 0 0 16 40 1 0 74 0 1 2 2 0
                                    0 0 1 2 0 47 0 0 1 2 6 37 0 0 1 2 1 0 0 0
                                    18 2 1 0 0 16 17 0 0 0 1 2 0 0 0 22 49 2 0
                                    0 0 6 53 2 0 0 0 0 63 1 0 71 0 1 1 0 22 0 1
                                    1 0 0 0 32 1 0 47 0 1 1 0 37 0 1 1 0 0 0 1
                                    1 0 37 0 1 1 0 16 0 1 1 0 72 0 1 1 0 37 0 1
                                    2 0 0 7 22 1 2 0 0 22 7 31 1 0 0 0 33 1 0 9
                                    0 11 1 0 22 0 1 2 3 0 0 0 1 1 0 22 0 34 2 3
                                    0 0 0 1 2 0 0 75 0 1 2 0 0 0 22 51 2 0 0 0
                                    6 55 2 0 0 0 0 62 1 0 76 0 1 2 1 7 68 0 1 1
                                    0 9 0 1 1 0 22 0 1 1 0 22 0 28 1 0 7 0 30 1
                                    0 78 0 1 1 0 77 0 1 1 0 16 0 36 1 0 0 76 1
                                    1 0 0 76 1 1 0 37 0 41 1 0 7 0 1 1 0 0 7 1
                                    1 0 0 69 1 1 0 0 22 24 1 0 0 6 25 1 0 79 0
                                    1 1 0 73 0 1 2 0 7 0 22 1 2 0 7 0 0 65 2 0
                                    7 0 22 1 0 0 16 1 2 0 0 0 70 1 2 0 0 0 16 1
                                    0 0 0 12 0 0 0 14 2 3 37 0 0 1 2 3 37 0 0 1
                                    2 0 37 0 0 38 2 3 37 0 0 1 2 3 37 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 21 2 0 0 16 0 1
                                    2 0 0 69 0 1 2 0 0 0 0 1 2 0 0 6 0 27 2 0 0
                                    22 7 1 2 0 0 7 22 1 2 0 0 0 7 61 2 0 0 7 0
                                    20 2 0 0 70 0 1)))))
           '|lookupComplete|)) 
