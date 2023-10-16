
(SDEFUN |GROUPPF1;convert;LLGp;1|
        ((|lg| |List| S) (|lr| |List| (|FreeGroup| S)) ($ |GroupPresentation|))
        (SPROG
         ((#1=#:G119 NIL) (|l| NIL) (#2=#:G118 NIL)
          (|nlr| (|List| (|List| (|Integer|)))) (|nr| (|List| (|Integer|)))
          (#3=#:G117 NIL) (|m| #4=(|Integer|)) (|k| (|Integer|))
          (#5=#:G116 NIL) (|t| NIL)
          (|fr| (|List| (|Record| (|:| |gen| S) (|:| |exp| #4#))))
          (#6=#:G115 NIL) (|r| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lg|) . #7=(|GROUPPF1;convert;LLGp;1|))
              (LETT |nlr| NIL . #7#)
              (SEQ (LETT |r| NIL . #7#) (LETT #6# |lr| . #7#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |r| (CAR #6#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |nr| NIL . #7#)
                        (LETT |fr| (SPADCALL |r| (QREFELT $ 10)) . #7#)
                        (SEQ (LETT |t| NIL . #7#) (LETT #5# |fr| . #7#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |k|
                                    (SPADCALL (QCAR |t|) |lg| (QREFELT $ 13))
                                    . #7#)
                              (EXIT
                               (COND
                                ((< |k| 1)
                                 (|error|
                                  (SPADCALL
                                   "convert: relation contains generator"
                                   "not in list of generators"
                                   (QREFELT $ 16))))
                                ('T
                                 (SEQ (LETT |m| (QCDR |t|) . #7#)
                                      (LETT |k|
                                            (COND ((< |m| 0) (- |k|)) ('T |k|))
                                            . #7#)
                                      (LETT |m| (ABS |m|) . #7#)
                                      (EXIT
                                       (SEQ (LETT |l| 1 . #7#)
                                            (LETT #3# |m| . #7#) G190
                                            (COND
                                             ((|greater_SI| |l| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |nr| (CONS |k| |nr|)
                                                    . #7#)))
                                            (LETT |l| (|inc_SI| |l|) . #7#)
                                            (GO G190) G191 (EXIT NIL))))))))
                             (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |nlr| (CONS (NREVERSE |nr|) |nlr|) . #7#)))
                   (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #2# NIL . #7#)
                 (SEQ (LETT |l| 1 . #7#) (LETT #1# |n| . #7#) G190
                      (COND ((|greater_SI| |l| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |l| #2#) . #7#)))
                      (LETT |l| (|inc_SI| |l|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (NREVERSE |nlr|) (QREFELT $ 20)))))) 

(DECLAIM (NOTINLINE |GroupPresentationFunctions1;|)) 

(DEFUN |GroupPresentationFunctions1| (#1=#:G120)
  (SPROG NIL
         (PROG (#2=#:G121)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GroupPresentationFunctions1|)
                                               '|domainEqualList|)
                    . #3=(|GroupPresentationFunctions1|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GroupPresentationFunctions1;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GroupPresentationFunctions1|)))))))))) 

(DEFUN |GroupPresentationFunctions1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GroupPresentationFunctions1|))
          (LETT |dv$| (LIST '|GroupPresentationFunctions1| DV$1) . #1#)
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GroupPresentationFunctions1|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GroupPresentationFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |gen| 6) (|:| |exp| 11)) (|List| 7)
              (|FreeGroup| 6) (0 . |factors|) (|Integer|) (|List| 6)
              (5 . |position|) (11 . |One|) (|String|) (15 . |elt|)
              (|List| (|NonNegativeInteger|)) (|List| (|List| 11))
              (|GroupPresentation|) (21 . |groupPresentation|) (|List| 9)
              |GROUPPF1;convert;LLGp;1|)
           '#(|convert| 27) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(1 9 8 0 10 2 12 11 6 0 13 0
                                                   9 0 14 2 15 0 0 0 16 2 19 0
                                                   17 18 20 2 0 19 12 21
                                                   22)))))
           '|lookupComplete|)) 
