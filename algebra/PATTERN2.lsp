
(/VERSIONCHECK 2) 

(DEFUN |PATTERN2;map;MPP;1| (|f| |p| $)
  (PROG (|sy| |wr| |w| |xr| |x| #1=#:G183 #2=#:G182 |l| #3=#:G181 #4=#:G180
         |vr| |v| #5=#:G179 #6=#:G178 |ur| |u| |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 10)) . #7=(|PATTERN2;map;MPP;1|))
          (EXIT
           (COND
            ((QEQCAR |r| 0)
             (SPADCALL (SPADCALL (QCDR |r|) |f|) (QREFELT $ 12)))
            (#8='T
             (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 15)) . #7#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 0)
                     (SEQ (LETT |ur| (QCDR |u|) . #7#)
                          (EXIT
                           (SPADCALL (QCAR |ur|)
                                     (PROGN
                                      (LETT #6# NIL . #7#)
                                      (SEQ (LETT |x| NIL . #7#)
                                           (LETT #5# (QCDR |ur|) . #7#) G190
                                           (COND
                                            ((OR (ATOM #5#)
                                                 (PROGN
                                                  (LETT |x| (CAR #5#) . #7#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS
                                                    (SPADCALL |f| |x|
                                                              (QREFELT $ 17))
                                                    #6#)
                                                   . #7#)))
                                           (LETT #5# (CDR #5#) . #7#) (GO G190)
                                           G191 (EXIT (NREVERSE #6#))))
                                     (QREFELT $ 20)))))
                    (#8#
                     (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 23)) . #7#)
                          (EXIT
                           (COND
                            ((QEQCAR |v| 0)
                             (SEQ (LETT |vr| (QCDR |v|) . #7#)
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL |f| (QCAR |vr|) (QREFELT $ 17))
                                    (SPADCALL |f| (QCDR |vr|) (QREFELT $ 17))
                                    (QREFELT $ 24)))))
                            (#8#
                             (SEQ
                              (LETT |l| (SPADCALL |p| (QREFELT $ 26)) . #7#)
                              (EXIT
                               (COND
                                ((QEQCAR |l| 0)
                                 (SPADCALL (ELT $ 27)
                                           (PROGN
                                            (LETT #4# NIL . #7#)
                                            (SEQ (LETT |x| NIL . #7#)
                                                 (LETT #3# (QCDR |l|) . #7#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |x| (CAR #3#)
                                                              . #7#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #4#
                                                         (CONS
                                                          (SPADCALL |f| |x|
                                                                    (QREFELT $
                                                                             17))
                                                          #4#)
                                                         . #7#)))
                                                 (LETT #3# (CDR #3#) . #7#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #4#))))
                                           (QREFELT $ 30)))
                                (#8#
                                 (SEQ
                                  (LETT |l| (SPADCALL |p| (QREFELT $ 31))
                                        . #7#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |l| 0)
                                     (SPADCALL (ELT $ 32)
                                               (PROGN
                                                (LETT #2# NIL . #7#)
                                                (SEQ (LETT |x| NIL . #7#)
                                                     (LETT #1# (QCDR |l|)
                                                           . #7#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |x| (CAR #1#)
                                                                  . #7#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #2#
                                                             (CONS
                                                              (SPADCALL |f| |x|
                                                                        (QREFELT
                                                                         $ 17))
                                                              #2#)
                                                             . #7#)))
                                                     (LETT #1# (CDR #1#) . #7#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #2#))))
                                               (QREFELT $ 30)))
                                    (#8#
                                     (SEQ
                                      (LETT |x| (SPADCALL |p| (QREFELT $ 35))
                                            . #7#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |x| 0)
                                         (SEQ (LETT |xr| (QCDR |x|) . #7#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |f| (QCAR |xr|)
                                                          (QREFELT $ 17))
                                                (SPADCALL |f| (QCDR |xr|)
                                                          (QREFELT $ 17))
                                                (QREFELT $ 36)))))
                                        (#8#
                                         (SEQ
                                          (LETT |w|
                                                (SPADCALL |p| (QREFELT $ 39))
                                                . #7#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |w| 0)
                                             (SEQ (LETT |wr| (QCDR |w|) . #7#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL |f| (QCAR |wr|)
                                                              (QREFELT $ 17))
                                                    (QCDR |wr|)
                                                    (QREFELT $ 41)))))
                                            (#8#
                                             (SEQ
                                              (LETT |sy|
                                                    (SPADCALL |p|
                                                              (QREFELT $ 43))
                                                    . #7#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |sy| (QREFELT $ 44))
                                                (SPADCALL
                                                 (SPADCALL |p| (QREFELT $ 46))
                                                 (QREFELT $ 47))
                                                (QREFELT $
                                                         48))))))))))))))))))))))))))))))))))) 

(DECLAIM (NOTINLINE |PatternFunctions2;|)) 

(DEFUN |PatternFunctions2| (&REST #1=#:G184)
  (PROG ()
    (RETURN
     (PROG (#2=#:G185)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternFunctions2|)
                                           '|domainEqualList|)
                . #3=(|PatternFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternFunctions2|))))))))))) 

(DEFUN |PatternFunctions2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PatternFunctions2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 49) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternFunctions2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| 6 '"failed") (|Pattern| 6) (0 . |retractIfCan|)
              (|Pattern| 7) (5 . |coerce|)
              (|Record| (|:| |op| 18) (|:| |arg| 19)) (|Union| 13 '"failed")
              (10 . |isOp|) (|Mapping| 7 6) |PATTERN2;map;MPP;1|
              (|BasicOperator|) (|List| $) (15 . |elt|)
              (|Record| (|:| |num| $) (|:| |den| $)) (|Union| 21 '"failed")
              (21 . |isQuotient|) (26 . /) (|Union| 19 '"failed")
              (32 . |isPlus|) (37 . +) (|Mapping| 11 11 11) (|List| 11)
              (43 . |reduce|) (49 . |isTimes|) (54 . *)
              (|Record| (|:| |val| $) (|:| |exponent| $))
              (|Union| 33 '"failed") (60 . |isPower|) (65 . ^)
              (|Record| (|:| |val| $) (|:| |exponent| 40))
              (|Union| 37 '"failed") (71 . |isExpt|) (|NonNegativeInteger|)
              (76 . ^) (|Symbol|) (82 . |retract|) (87 . |coerce|)
              (|List| (|Any|)) (92 . |predicates|) (97 . |copy|)
              (102 . |setPredicates|))
           '#(|map| 108) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 9 8 0 10 1 11 0 7 12 1 9
                                                   14 0 15 2 11 0 18 19 20 1 9
                                                   22 0 23 2 11 0 0 0 24 1 9 25
                                                   0 26 2 11 0 0 0 27 2 29 11
                                                   28 0 30 1 9 25 0 31 2 11 0 0
                                                   0 32 1 9 34 0 35 2 11 0 0 0
                                                   36 1 9 38 0 39 2 11 0 0 40
                                                   41 1 9 42 0 43 1 11 0 42 44
                                                   1 9 45 0 46 1 45 0 0 47 2 11
                                                   0 0 45 48 2 0 11 16 9
                                                   17)))))
           '|lookupComplete|)) 
