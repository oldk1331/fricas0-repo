
(/VERSIONCHECK 2) 

(DEFUN |PMDOWN;fixPredicate;MM;1| (|f| $)
  (PROG () (RETURN (CONS #'|PMDOWN;fixPredicate;MM;1!0| (VECTOR |f| $))))) 

(DEFUN |PMDOWN;fixPredicate;MM;1!0| (|a1| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|PMDOWN;fixPredicate;MM;1|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |a1| (QREFELT $ 9)) |f|))))) 

(DEFUN |PMDOWN;patternMatch;AP2Pmr;2| (|a| |p| |l| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (|PMDOWN;fixPredicates| |p| |l| (SPADCALL (QREFELT $ 14)) $)
            |PMDOWN;patternMatch;AP2Pmr;2|)
      (EXIT
       (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT $ 16)))
             ('T
              (SPADCALL |l|
                        (SPADCALL (ELT $ 9)
                                  (SPADCALL |a| (QCAR (QCDR |u|))
                                            (QCDR (QCDR |u|)) (QREFELT $ 19))
                                  (QREFELT $ 22))
                        (QREFELT $ 23))))))))) 

(DEFUN |PMDOWN;inA| (|p| |l| $)
  (PROG (|r| |u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |p| |l| (QREFELT $ 26)) . #1=(|PMDOWN;inA|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 0 NIL))
                 (#2='T
                  (SEQ (LETT |r| (SPADCALL (QCDR |u|) (QREFELT $ 28)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 0) (CONS 0 (LIST (QCDR |r|))))
                              (#2# (CONS 1 "failed")))))))))))) 

(DEFUN |PMDOWN;fixList| (|fn| |l| |lb| |la| $)
  (PROG (|ll| #1=#:G136 |f| #2=#:G137 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ll| NIL . #3=(|PMDOWN;fixList|))
            (SEQ (LETT |x| NIL . #3#) (LETT #2# |l| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |f| (|PMDOWN;fixPredicates| |x| |lb| |la| $) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |f| 1)
                         (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                        ('T
                         (SEQ (LETT |ll| (CONS (QCAR (QCDR |f|)) |ll|) . #3#)
                              (EXIT (LETT |la| (QCDR (QCDR |f|)) . #3#)))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (CONS (SPADCALL |ll| |fn|) |la|)))))
      #1# (EXIT #1#))))) 

(DEFUN |PMDOWN;fixPred| (|f| $)
  (PROG (|g| |u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |f| (QREFELT $ 32)) . #1=(|PMDOWN;fixPred|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |g| (SPADCALL (QCDR |u|) (QREFELT $ 12)) . #1#)
                       (EXIT (CONS 0 (SPADCALL |g| (QREFELT $ 34)))))))))))) 

(DEFUN |PMDOWN;fixPredicates| (|p| |lb| |la| $)
  (PROG (|q| |lp| #1=#:G212 |h| #2=#:G214 |g| #3=#:G213 |ua| |fe| |fv| |uur|
         |uu| |f| |wr| |w| |fd| |fn| |vr| |v| |us| |ur| |u| #4=#:G211 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (SEQ
           (LETT |r| (SPADCALL |p| (QREFELT $ 36))
                 . #5=(|PMDOWN;fixPredicates|))
           (EXIT
            (COND
             ((OR (QEQCAR |r| 0) (SPADCALL |p| (QREFELT $ 38)))
              (PROGN (LETT #4# (CONS 0 (CONS |p| |la|)) . #5#) (GO #4#))))))
          (LETT |u| (SPADCALL |p| (QREFELT $ 41)) . #5#)
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SEQ (LETT |ur| (QCDR |u|) . #5#)
                  (EXIT
                   (|PMDOWN;fixList|
                    (CONS #'|PMDOWN;fixPredicates!0| (VECTOR $ |ur|))
                    (QCDR |ur|) |lb| |la| $))))
            (#6='T
             (SEQ (LETT |us| (SPADCALL |p| (QREFELT $ 46)) . #5#)
                  (EXIT
                   (COND
                    ((QEQCAR |us| 0)
                     (|PMDOWN;fixList| (CONS #'|PMDOWN;fixPredicates!1| $)
                      (QCDR |us|) |lb| |la| $))
                    (#6#
                     (SEQ (LETT |us| (SPADCALL |p| (QREFELT $ 51)) . #5#)
                          (EXIT
                           (COND
                            ((QEQCAR |us| 0)
                             (|PMDOWN;fixList|
                              (CONS #'|PMDOWN;fixPredicates!2| $) (QCDR |us|)
                              |lb| |la| $))
                            (#6#
                             (SEQ
                              (LETT |v| (SPADCALL |p| (QREFELT $ 55)) . #5#)
                              (EXIT
                               (COND
                                ((QEQCAR |v| 0)
                                 (SEQ (LETT |vr| (QCDR |v|) . #5#)
                                      (LETT |fn|
                                            (|PMDOWN;fixPredicates| (QCAR |vr|)
                                             |lb| |la| $)
                                            . #5#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |fn| 1) (CONS 1 "failed"))
                                        (#6#
                                         (SEQ
                                          (LETT |la| (QCDR (QCDR |fn|)) . #5#)
                                          (LETT |fd|
                                                (|PMDOWN;fixPredicates|
                                                 (QCDR |vr|) |lb| |la| $)
                                                . #5#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |fd| 1) (CONS 1 "failed"))
                                            (#6#
                                             (CONS 0
                                                   (CONS
                                                    (SPADCALL
                                                     (QCAR (QCDR |fn|))
                                                     (QCAR (QCDR |fd|))
                                                     (QREFELT $ 56))
                                                    (QCDR
                                                     (QCDR |fd|)))))))))))))
                                (#6#
                                 (SEQ
                                  (LETT |w| (SPADCALL |p| (QREFELT $ 59))
                                        . #5#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |w| 0)
                                     (SEQ (LETT |wr| (QCDR |w|) . #5#)
                                          (LETT |f|
                                                (|PMDOWN;fixPredicates|
                                                 (QCAR |wr|) |lb| |la| $)
                                                . #5#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |f| 1) (CONS 1 "failed"))
                                            (#6#
                                             (CONS 0
                                                   (CONS
                                                    (SPADCALL (QCAR (QCDR |f|))
                                                              (QCDR |wr|)
                                                              (QREFELT $ 61))
                                                    (QCDR (QCDR |f|)))))))))
                                    (#6#
                                     (SEQ
                                      (LETT |uu| (SPADCALL |p| (QREFELT $ 64))
                                            . #5#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |uu| 0)
                                         (SEQ (LETT |uur| (QCDR |uu|) . #5#)
                                              (LETT |fv|
                                                    (|PMDOWN;fixPredicates|
                                                     (QCAR |uur|) |lb| |la| $)
                                                    . #5#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |fv| 1)
                                                 (CONS 1 "failed"))
                                                (#6#
                                                 (SEQ
                                                  (LETT |la| (QCDR (QCDR |fv|))
                                                        . #5#)
                                                  (LETT |fe|
                                                        (|PMDOWN;fixPredicates|
                                                         (QCDR |uur|) |lb| |la|
                                                         $)
                                                        . #5#)
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |fe| 1)
                                                     (CONS 1 "failed"))
                                                    (#6#
                                                     (CONS 0
                                                           (CONS
                                                            (SPADCALL
                                                             (QCAR (QCDR |fv|))
                                                             (QCAR (QCDR |fe|))
                                                             (QREFELT $ 65))
                                                            (QCDR
                                                             (QCDR
                                                              |fe|)))))))))))))
                                        ((SPADCALL |p| (QREFELT $ 66))
                                         (SEQ
                                          (LETT |ua| (|PMDOWN;inA| |p| |lb| $)
                                                . #5#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |ua| 1) (CONS 1 "failed"))
                                            (#6#
                                             (SEQ
                                              (LETT |lp|
                                                    (PROGN
                                                     (LETT #3# NIL . #5#)
                                                     (SEQ (LETT |g| NIL . #5#)
                                                          (LETT #2#
                                                                (SPADCALL |p|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                . #5#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #2#)
                                                                (PROGN
                                                                 (LETT |g|
                                                                       (CAR
                                                                        #2#)
                                                                       . #5#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #3#
                                                                  (CONS
                                                                   (SEQ
                                                                    (LETT |h|
                                                                          (|PMDOWN;fixPred|
                                                                           |g|
                                                                           $)
                                                                          . #5#)
                                                                    (EXIT
                                                                     (COND
                                                                      ((QEQCAR
                                                                        |h| 0)
                                                                       (QCDR
                                                                        |h|))
                                                                      ('T
                                                                       (PROGN
                                                                        (LETT
                                                                         #1#
                                                                         (CONS
                                                                          1
                                                                          "failed")
                                                                         . #5#)
                                                                        (GO
                                                                         #1#))))))
                                                                   #3#)
                                                                  . #5#)))
                                                          (LETT #2# (CDR #2#)
                                                                . #5#)
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #3#))))
                                                    . #5#)
                                              (LETT |q|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |p|
                                                                (QREFELT $ 70))
                                                      (SPADCALL |p|
                                                                (QREFELT $ 71))
                                                      (SPADCALL |p|
                                                                (QREFELT $ 72))
                                                      (SPADCALL |p|
                                                                (QREFELT $ 73))
                                                      (QREFELT $ 74))
                                                     |lp| (QREFELT $ 75))
                                                    . #5#)
                                              (EXIT
                                               (CONS 0
                                                     (CONS |q|
                                                           (COND
                                                            ((NULL (QCDR |ua|))
                                                             |la|)
                                                            (#6#
                                                             (SPADCALL |q|
                                                                       (|SPADfirst|
                                                                        (QCDR
                                                                         |ua|))
                                                                       |la|
                                                                       (QREFELT
                                                                        $
                                                                        76)))))))))))))
                                        (#6#
                                         (|error|
                                          "Should not happen"))))))))))))))))))))))))))
        #4# (EXIT #4#)))
      #1# (EXIT #1#))))) 

(DEFUN |PMDOWN;fixPredicates!2| (|l1| $)
  (SPADCALL (ELT $ 52) |l1| (QREFELT $ 50))) 

(DEFUN |PMDOWN;fixPredicates!1| (|l1| $)
  (SPADCALL (ELT $ 47) |l1| (QREFELT $ 50))) 

(DEFUN |PMDOWN;fixPredicates!0| (|l1| $$)
  (PROG (|ur| $)
    (LETT |ur| (QREFELT $$ 1) . #1=(|PMDOWN;fixPredicates|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (QCAR |ur|) |l1| (QREFELT $ 44)))))) 

(DECLAIM (NOTINLINE |PatternMatchPushDown;|)) 

(DEFUN |PatternMatchPushDown| (&REST #1=#:G215)
  (PROG ()
    (RETURN
     (PROG (#2=#:G216)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchPushDown|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchPushDown|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternMatchPushDown;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternMatchPushDown|))))))))))) 

(DEFUN |PatternMatchPushDown;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchPushDown|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|PatternMatchPushDown| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 77) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchPushDown|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternMatchPushDown| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |coerce|) (|Mapping| 37 7) (|Mapping| 37 8)
              |PMDOWN;fixPredicate;MM;1| (|PatternMatchResult| 6 7) (5 . |new|)
              (|PatternMatchResult| 6 8) (9 . |failed|)
              (|PatternMatchResult| 6 $) (|Pattern| 6) (13 . |patternMatch|)
              (|Mapping| 8 7) (|PatternMatchResultFunctions2| 6 7 8)
              (20 . |map|) (26 . |union|) |PMDOWN;patternMatch;AP2Pmr;2|
              (|Union| 8 '"failed") (32 . |getMatch|) (|Union| 7 '"failed")
              (38 . |retractIfCan|) (|Union| 11 '"failed") (|Any|)
              (|AnyFunctions1| 11) (43 . |retractIfCan|) (|AnyFunctions1| 10)
              (48 . |coerce|) (|Union| 6 '"failed") (53 . |retractIfCan|)
              (|Boolean|) (58 . |quoted?|)
              (|Record| (|:| |op| 42) (|:| |arg| 43)) (|Union| 39 '"failed")
              (63 . |isOp|) (|BasicOperator|) (|List| $) (68 . |elt|)
              (|Union| 43 '"failed") (74 . |isPlus|) (79 . +)
              (|Mapping| 18 18 18) (|List| 18) (85 . |reduce|) (91 . |isTimes|)
              (96 . *) (|Record| (|:| |num| $) (|:| |den| $))
              (|Union| 53 '"failed") (102 . |isQuotient|) (107 . /)
              (|Record| (|:| |val| $) (|:| |exponent| 60))
              (|Union| 57 '"failed") (113 . |isExpt|) (|NonNegativeInteger|)
              (118 . ^) (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 62 '"failed") (124 . |isPower|) (129 . ^)
              (135 . |generic?|) (|List| 30) (140 . |predicates|) (|Symbol|)
              (145 . |retract|) (150 . |constant?|) (155 . |optional?|)
              (160 . |multiple?|) (165 . |patternVariable|)
              (173 . |setPredicates|) (179 . |insertMatch|))
           '#(|patternMatch| 186 |fixPredicate| 193) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 8 0 7 9 0 13 0 14 0 15 0
                                                   16 3 7 17 0 18 17 19 2 21 15
                                                   20 13 22 2 15 0 0 0 23 2 15
                                                   25 18 0 26 1 8 27 0 28 1 31
                                                   29 30 32 1 33 30 10 34 1 18
                                                   35 0 36 1 18 37 0 38 1 18 40
                                                   0 41 2 18 0 42 43 44 1 18 45
                                                   0 46 2 18 0 0 0 47 2 49 18
                                                   48 0 50 1 18 45 0 51 2 18 0
                                                   0 0 52 1 18 54 0 55 2 18 0 0
                                                   0 56 1 18 58 0 59 2 18 0 0
                                                   60 61 1 18 63 0 64 2 18 0 0
                                                   0 65 1 18 37 0 66 1 18 67 0
                                                   68 1 18 69 0 70 1 18 37 0 71
                                                   1 18 37 0 72 1 18 37 0 73 4
                                                   18 0 69 37 37 37 74 2 18 0 0
                                                   67 75 3 13 0 18 7 0 76 3 0
                                                   15 7 18 15 24 1 0 10 11
                                                   12)))))
           '|lookupComplete|)) 
