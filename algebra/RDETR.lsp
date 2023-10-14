
(SDEFUN |RDETR;SPDEnocancel1;2UPIMR;1|
        ((|bb| UP) (|cc| UP) (|d| |Integer|) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
        (SPROG
         ((|q| (UP)) (|r| (UP)) (#1=#:G106 NIL) (#2=#:G113 NIL) (#3=#:G114 NIL)
          (|n| (|Integer|)) (|lb| (F)) (|db| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q| (|spadConstant| $ 8)
                  . #4=(|RDETR;SPDEnocancel1;2UPIMR;1|))
            (LETT |db| (SPADCALL |bb| (QREFELT $ 10)) . #4#)
            (LETT |lb| (SPADCALL |bb| (QREFELT $ 11)) . #4#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |cc| (|spadConstant| $ 8) (QREFELT $ 14)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((< |d| 0)
                      (EXIT
                       (PROGN (LETT #3# (CONS |q| 'T) . #4#) (GO #5=#:G112))))
                     ('T
                      (SEQ
                       (LETT |n| (- (SPADCALL |cc| (QREFELT $ 10)) |db|) . #4#)
                       (EXIT
                        (COND
                         ((OR (< |n| 0) (SPADCALL |n| |d| (QREFELT $ 16)))
                          (PROGN
                           (LETT #2#
                                 (PROGN
                                  (LETT #3# (CONS |q| 'T) . #4#)
                                  (GO #5#))
                                 . #4#)
                           (GO #6=#:G107))))))))
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL (SPADCALL |cc| (QREFELT $ 11)) |lb|
                                     (QREFELT $ 17))
                           (PROG1 (LETT #1# |n| . #4#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 18))
                          . #4#)
                    (LETT |cc|
                          (SPADCALL
                           (SPADCALL |cc| (SPADCALL |bb| |r| (QREFELT $ 19))
                                     (QREFELT $ 20))
                           (SPADCALL |r| |derivation|) (QREFELT $ 20))
                          . #4#)
                    (LETT |d| (- |n| 1) . #4#)
                    (EXIT (LETT |q| (SPADCALL |q| |r| (QREFELT $ 23)) . #4#))))
                  #6# (EXIT #2#))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS |q| 'NIL))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |TranscendentalRischDE;|)) 

(DEFUN |TranscendentalRischDE| (&REST #1=#:G115)
  (SPROG NIL
         (PROG (#2=#:G116)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalRischDE|)
                                               '|domainEqualList|)
                    . #3=(|TranscendentalRischDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TranscendentalRischDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TranscendentalRischDE|)))))))))) 

(DEFUN |TranscendentalRischDE;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalRischDE|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalRischDE| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 27) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TranscendentalRischDE|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TranscendentalRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (|NonNegativeInteger|) (4 . |degree|)
              (9 . |leadingCoefficient|) (14 . |Zero|) (|Boolean|) (18 . ~=)
              (|Integer|) (24 . >) (30 . /) (36 . |monomial|) (42 . *) (48 . -)
              (54 . |One|) (58 . |One|) (62 . +)
              (|Record| (|:| |ans| 7) (|:| |nosol| 13)) (|Mapping| 7 7)
              |RDETR;SPDEnocancel1;2UPIMR;1|)
           '#(|SPDEnocancel1| 68) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(0 7 0 8 1 7 9 0 10 1 7 6 0
                                                   11 0 6 0 12 2 7 13 0 0 14 2
                                                   15 13 0 0 16 2 6 0 0 0 17 2
                                                   7 0 6 9 18 2 7 0 0 0 19 2 7
                                                   0 0 0 20 0 6 0 21 0 7 0 22 2
                                                   7 0 0 0 23 4 0 24 7 7 15 25
                                                   26)))))
           '|lookupComplete|)) 
