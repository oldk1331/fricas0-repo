
(SDEFUN |PATRES;new;$;1| (($ $)) (CONS 0 (SPADCALL (QREFELT $ 10)))) 

(PUT '|PATRES;failed;$;2| '|SPADreplace| '(XLAM NIL (CONS 1 "failed"))) 

(SDEFUN |PATRES;failed;$;2| (($ $)) (CONS 1 "failed")) 

(PUT '|PATRES;failed?;$B;3| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 1))) 

(SDEFUN |PATRES;failed?;$B;3| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 1)) 

(SDEFUN |PATRES;insertMatch;PS2$;4| ((|p| |Pattern| R) (|x| S) (|l| $) ($ $))
        (CONS 0
              (SPADCALL (CONS (SPADCALL |p| (QREFELT $ 17)) |x|) (QCDR |l|)
                        (QREFELT $ 19)))) 

(SDEFUN |PATRES;construct;L$;5|
        ((|l| |List| (|Record| (|:| |key| (|Symbol|)) (|:| |entry| S))) ($ $))
        (CONS 0 (SPADCALL |l| (QREFELT $ 22)))) 

(SDEFUN |PATRES;destruct;$L;6|
        ((|l| $) ($ |List| (|Record| (|:| |key| (|Symbol|)) (|:| |entry| S))))
        (SPADCALL (QCDR |l|) (QREFELT $ 24))) 

(SDEFUN |PATRES;satisfy?;$PU;7|
        ((|r| $) (|p| |Pattern| R) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|lv| (|List| S)) (#1=#:G150 NIL) (|u| (|Union| S "failed"))
          (#2=#:G152 NIL) (|v| NIL) (#3=#:G151 NIL)
          (|lr| (|AssociationList| (|Symbol|) S)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |r| (QREFELT $ 14)) (CONS 0 'NIL))
                 ('T
                  (SEQ (LETT |lr| (QCDR |r|) . #4=(|PATRES;satisfy?;$PU;7|))
                       (LETT |lv|
                             (PROGN
                              (LETT #3# NIL . #4#)
                              (SEQ (LETT |v| NIL . #4#)
                                   (LETT #2#
                                         (QCAR (SPADCALL |p| (QREFELT $ 27)))
                                         . #4#)
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |v| (CAR #2#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (SEQ
                                             (LETT |u|
                                                   (SPADCALL |v| |lr|
                                                             (QREFELT $ 29))
                                                   . #4#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |u| 1)
                                                (PROGN
                                                 (LETT #1# (CONS 1 "failed")
                                                       . #4#)
                                                 (GO #5=#:G149)))
                                               ('T (QCDR |u|)))))
                                            #3#)
                                           . #4#)))
                                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             . #4#)
                       (EXIT (CONS 0 (SPADCALL |lv| |p| (QREFELT $ 32))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PATRES;union;3$;8| ((|x| $) (|y| $) ($ $))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 14)) (SPADCALL |y| (QREFELT $ 14)))
          (SPADCALL (QREFELT $ 12)))
         ('T
          (CONS 0
                (SPADCALL (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 35))
                          (QREFELT $ 36)))))) 

(SDEFUN |PATRES;=;2$B;9| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 14)) (SPADCALL |y| (QREFELT $ 14)))
              ((SPADCALL |y| (QREFELT $ 14)) 'NIL)
              ('T (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 38))))) 

(SDEFUN |PATRES;coerce;$Of;10| ((|x| $) ($ |OutputForm|))
        (COND ((SPADCALL |x| (QREFELT $ 14)) "Does not match")
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 41))))) 

(SDEFUN |PATRES;addMatchRestricted;PS$S$;11|
        ((|p| |Pattern| R) (|x| S) (|l| $) (|ident| S) ($ $))
        (SEQ
         (COND
          ((NULL (SPADCALL |p| (QREFELT $ 43)))
           (COND
            ((SPADCALL |x| |ident| (QREFELT $ 44))
             (EXIT (SPADCALL (QREFELT $ 12)))))))
         (EXIT (SPADCALL |p| |x| |l| (QREFELT $ 45))))) 

(SDEFUN |PATRES;addMatch;PS2$;12| ((|p| |Pattern| R) (|x| S) (|l| $) ($ $))
        (SPROG
         ((|r| (|Union| S "failed")) (|sy| (|Symbol|))
          (|al| (|AssociationList| (|Symbol|) S)))
         (SEQ
          (COND
           ((OR (SPADCALL |l| (QREFELT $ 14))
                (NULL (SPADCALL |x| |p| (QREFELT $ 47))))
            (SPADCALL (QREFELT $ 12)))
           ('T
            (SEQ (LETT |al| (QCDR |l|) . #1=(|PATRES;addMatch;PS2$;12|))
                 (LETT |sy| (SPADCALL |p| (QREFELT $ 17)) . #1#)
                 (LETT |r| (SPADCALL |sy| |al| (QREFELT $ 29)) . #1#)
                 (EXIT
                  (COND ((QEQCAR |r| 1) (SPADCALL |p| |x| |l| (QREFELT $ 20)))
                        ((SPADCALL (QCDR |r|) |x| (QREFELT $ 44)) |l|)
                        ('T (SPADCALL (QREFELT $ 12))))))))))) 

(SDEFUN |PATRES;getMatch;P$U;13|
        ((|p| |Pattern| R) (|l| $) ($ |Union| S "failed"))
        (COND ((SPADCALL |l| (QREFELT $ 14)) (CONS 1 "failed"))
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT $ 17)) (QCDR |l|)
                         (QREFELT $ 29))))) 

(DECLAIM (NOTINLINE |PatternMatchResult;|)) 

(DEFUN |PatternMatchResult| (&REST #1=#:G179)
  (SPROG NIL
         (PROG (#2=#:G180)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PatternMatchResult|)
                                               '|domainEqualList|)
                    . #3=(|PatternMatchResult|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PatternMatchResult;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PatternMatchResult|)))))))))) 

(DEFUN |PatternMatchResult;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchResult|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PatternMatchResult| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PatternMatchResult|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|Union| (|AssociationList| (|Symbol|) |#2|) "failed"))
          $))) 

(MAKEPROP '|PatternMatchResult| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|AssociationList| 15 7) (0 . |empty|) |PATRES;new;$;1|
              |PATRES;failed;$;2| (|Boolean|) |PATRES;failed?;$B;3| (|Symbol|)
              (|Pattern| 6) (4 . |retract|)
              (|Record| (|:| |key| 15) (|:| |entry| 7)) (9 . |concat|)
              |PATRES;insertMatch;PS2$;4| (|List| 18) (15 . |construct|)
              |PATRES;construct;L$;5| (20 . |entries|) |PATRES;destruct;$L;6|
              (|Record| (|:| |var| (|List| 15)) (|:| |pred| (|Any|)))
              (25 . |topPredicate|) (|Union| 7 '"failed") (30 . |search|)
              (|List| 7) (|PatternFunctions1| 6 7) (36 . |satisfy?|)
              (|Union| 13 '"failed") |PATRES;satisfy?;$PU;7| (42 . |concat|)
              (48 . |removeDuplicates|) |PATRES;union;3$;8| (53 . =)
              |PATRES;=;2$B;9| (|OutputForm|) (59 . |coerce|)
              |PATRES;coerce;$Of;10| (64 . |optional?|) (69 . =)
              |PATRES;addMatch;PS2$;12| |PATRES;addMatchRestricted;PS$S$;11|
              (75 . |satisfy?|) |PATRES;getMatch;P$U;13| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 81 |union| 87 |satisfy?| 93 |new| 99 |latex| 103 |insertMatch|
              108 |hashUpdate!| 115 |hash| 121 |getMatch| 126 |failed?| 132
              |failed| 137 |destruct| 141 |construct| 146 |coerce| 151
              |addMatchRestricted| 156 |addMatch| 164 = 171)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 40))
                        (|makeByteWordVec2| 51
                                            '(0 9 0 10 1 16 15 0 17 2 9 0 18 0
                                              19 1 9 0 21 22 1 9 21 0 24 1 16
                                              26 0 27 2 9 28 15 0 29 2 31 13 30
                                              16 32 2 9 0 0 0 35 1 9 0 0 36 2 9
                                              13 0 0 38 1 21 40 0 41 1 16 13 0
                                              43 2 7 13 0 0 44 2 31 13 7 16 47
                                              2 0 13 0 0 1 2 0 0 0 0 37 2 0 33
                                              0 16 34 0 0 0 11 1 0 49 0 1 3 0 0
                                              16 7 0 20 2 0 51 51 0 1 1 0 50 0
                                              1 2 0 28 16 0 48 1 0 13 0 14 0 0
                                              0 12 1 0 21 0 25 1 0 0 21 23 1 0
                                              40 0 42 4 0 0 16 7 0 7 46 3 0 0
                                              16 7 0 45 2 0 13 0 0 39)))))
           '|lookupComplete|)) 
