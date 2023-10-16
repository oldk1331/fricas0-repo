
(PUT '|COCHNC;coChainComplex;L$;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |COCHNC;coChainComplex;L$;1|
        ((|v| |List| (|Matrix| (|Integer|))) ($ $)) |v|) 

(SDEFUN |COCHNC;coChainComplex;Cc$;2| ((|s| |ChainComplex|) ($ $))
        (SPROG ((|tm| ($)))
               (SEQ
                (LETT |tm| (SPADCALL |s| (QREFELT $ 11))
                      . #1=(|COCHNC;coChainComplex;Cc$;2|))
                (LETT |tm| (NREVERSE |tm|) . #1#)
                (EXIT (SPADCALL (ELT $ 13) |tm| (QREFELT $ 15)))))) 

(SDEFUN |COCHNC;validate;$B;3| ((|a| $) ($ |Boolean|))
        (SPROG
         ((|last| #1=(|Matrix| (|Integer|))) (#2=#:G119 NIL)
          (|prod| (|Matrix| (|Integer|))) (|m| #1#) (#3=#:G120 NIL) (|x| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|) . #4=(|COCHNC;validate;$B;3|))
                (COND ((< |len| 2) (PROGN (LETT #2# 'T . #4#) (GO #5=#:G118))))
                (LETT |last| (SPADCALL |a| 1 (QREFELT $ 18)) . #4#)
                (SEQ (LETT |x| 2 . #4#) (LETT #3# |len| . #4#) G190
                     (COND ((|greater_SI| |x| #3#) (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |a| |x| (QREFELT $ 18)) . #4#)
                          (COND
                           ((SPADCALL (SPADCALL |m| (QREFELT $ 19))
                                      (SPADCALL |last| (QREFELT $ 20))
                                      (QREFELT $ 22))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL "validate failed nRows="
                                           (QREFELT $ 25))
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 19))
                                           (QREFELT $ 26))
                                 (QREFELT $ 27))
                                (SPADCALL " not equal to nCols "
                                          (QREFELT $ 25))
                                (QREFELT $ 27))
                               (SPADCALL (SPADCALL |last| (QREFELT $ 20))
                                         (QREFELT $ 26))
                               (QREFELT $ 27))
                              (QREFELT $ 29))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (LETT |prod| (SPADCALL |last| |m| (QREFELT $ 30))
                                . #4#)
                          (COND
                           ((NULL (SPADCALL |prod| (QREFELT $ 31)))
                            (SEQ
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    "validate failed: product of adjacent maps should be zero"
                                    (QREFELT $ 25))
                                   (SPADCALL |last| (QREFELT $ 32))
                                   (QREFELT $ 27))
                                  (SPADCALL " * " (QREFELT $ 25))
                                  (QREFELT $ 27))
                                 (SPADCALL |m| (QREFELT $ 32)) (QREFELT $ 27))
                                (SPADCALL " = " (QREFELT $ 25)) (QREFELT $ 27))
                               (SPADCALL |prod| (QREFELT $ 32)) (QREFELT $ 27))
                              (QREFELT $ 29))
                             (EXIT (PROGN (LETT #2# NIL . #4#) (GO #5#))))))
                          (EXIT (LETT |last| |m| . #4#)))
                     (LETT |x| (|inc_SI| |x|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |COCHNC;coboundary;$Nni2L;4|
        ((|a| $) (|n| |NonNegativeInteger|) (|inp| |List| VS) ($ |List| VS))
        (SPROG
         ((|res| (|List| VS)) (#1=#:G134 NIL) (|i| NIL) (#2=#:G133 NIL)
          (|res1| (|List| VS)) (|val| (VS)) (#3=#:G132 NIL) (|v| NIL)
          (|fst| (|Boolean|)) (|vs| (|Vector| (|Integer|)))
          (|m| (|Matrix| (|Integer|))) (|b| (|Vector| (|Integer|)))
          (|base| (|List| (|Integer|))) (#4=#:G131 NIL) (|x| NIL)
          (#5=#:G130 NIL) (#6=#:G129 NIL) (|p| NIL)
          (|inpn| (|NonNegativeInteger|))
          (|maps| (|List| (|Matrix| (|Integer|)))))
         (SEQ (LETT |maps| (REVERSE |a|) . #7=(|COCHNC;coboundary;$Nni2L;4|))
              (LETT |res| NIL . #7#) (LETT |inpn| (LENGTH |inp|) . #7#)
              (SEQ (LETT |p| 1 . #7#) (LETT #6# |inpn| . #7#) G190
                   (COND ((|greater_SI| |p| #6#) (GO G191)))
                   (SEQ
                    (LETT |base|
                          (PROGN
                           (LETT #5# NIL . #7#)
                           (SEQ (LETT |x| 1 . #7#) (LETT #4# |inpn| . #7#) G190
                                (COND ((|greater_SI| |x| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (COND ((EQL |x| |p|) 1) ('T 0))
                                              #5#)
                                        . #7#)))
                                (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #7#)
                    (LETT |b| (SPADCALL |base| (QREFELT $ 36)) . #7#)
                    (LETT |m|
                          (SPADCALL (SPADCALL |maps| |n| (QREFELT $ 18))
                                    (QREFELT $ 13))
                          . #7#)
                    (LETT |vs| (SPADCALL |b| |m| (QREFELT $ 37)) . #7#)
                    (LETT |fst| 'T . #7#) (LETT |res1| NIL . #7#)
                    (SEQ (LETT |v| NIL . #7#)
                         (LETT #3# (SPADCALL |vs| (QREFELT $ 38)) . #7#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |v| (CAR #3#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |val| (SPADCALL |inp| |p| (QREFELT $ 40))
                                . #7#)
                          (COND
                           ((EQL |v| 0)
                            (LETT |res1|
                                  (SPADCALL |res1| (|spadConstant| $ 41)
                                            (QREFELT $ 42))
                                  . #7#)))
                          (COND
                           ((SPADCALL |v| 0 (QREFELT $ 43))
                            (LETT |res1|
                                  (SPADCALL |res1|
                                            (SPADCALL |val| (QREFELT $ 44))
                                            (QREFELT $ 42))
                                  . #7#)))
                          (EXIT
                           (COND
                            ((< |v| 0)
                             (LETT |res1|
                                   (SPADCALL |res1| |val| (QREFELT $ 42))
                                   . #7#)))))
                         (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((NULL |res|) (LETT |res| |res1| . #7#))
                           ('T
                            (LETT |res|
                                  (PROGN
                                   (LETT #2# NIL . #7#)
                                   (SEQ (LETT |i| 1 . #7#)
                                        (LETT #1# (LENGTH |res1|) . #7#) G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |res| |i|
                                                            (QREFELT $ 40))
                                                  (SPADCALL |res1| |i|
                                                            (QREFELT $ 40))
                                                  (QREFELT $ 45))
                                                 #2#)
                                                . #7#)))
                                        (LETT |i| (|inc_SI| |i|) . #7#)
                                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                                  . #7#)))))
                   (LETT |p| (|inc_SI| |p|) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coHomology;$L;5| ((|a| $) ($ |List| (|Homology|)))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G140 NIL)
          (|m1| NIL))
         (SEQ (LETT |res| NIL . #2=(|COCHNC;coHomology;$L;5|))
              (LETT |prev| (MAKE_MATRIX 0 0) . #2#) (LETT |notFirst| NIL . #2#)
              (SEQ (LETT |m1| NIL . #2#) (LETT #1# |a| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m1| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|notFirst|
                      (SEQ
                       (LETT |m2| (SPADCALL |m1| |prev| (QREFELT $ 49)) . #2#)
                       (EXIT
                        (LETT |res| (SPADCALL |res| |m2| (QREFELT $ 51))
                              . #2#)))))
                    (LETT |notFirst| 'T . #2#) (EXIT (LETT |prev| |m1| . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coerce;$Of;6| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G145 NIL) (|x| NIL)
          (#2=#:G144 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #2# NIL . #3=(|COCHNC;coerce;$Of;6|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |s| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 32)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |lst| (QREFELT $ 54)))))) 

(DECLAIM (NOTINLINE |CoChainComplex;|)) 

(DEFUN |CoChainComplex| (#1=#:G146)
  (SPROG NIL
         (PROG (#2=#:G147)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CoChainComplex|)
                                               '|domainEqualList|)
                    . #3=(|CoChainComplex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CoChainComplex;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CoChainComplex|)))))))))) 

(DEFUN |CoChainComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CoChainComplex|))
          (LETT |dv$| (LIST '|CoChainComplex| DV$1) . #1#)
          (LETT $ (GETREFV 58) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CoChainComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|List| (|Matrix| (|Integer|))))
          $))) 

(MAKEPROP '|CoChainComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 12)
              |COCHNC;coChainComplex;L$;1| (|ChainComplex|)
              (0 . |transition_matrices|) (|Matrix| 17) (5 . |transpose|)
              (|Mapping| 12 12) (10 . |map|) |COCHNC;coChainComplex;Cc$;2|
              (|Integer|) (16 . |elt|) (22 . |maxRowIndex|)
              (27 . |maxColIndex|) (|Boolean|) (32 . ~=) (|String|)
              (|OutputForm|) (38 . |message|) (43 . |coerce|) (48 . |hconcat|)
              (|Void|) (54 . |print|) (59 . *) (65 . |zero?|) (70 . |coerce|)
              |COCHNC;validate;$B;3| (|List| 17) (|Vector| 17) (75 . |vector|)
              (80 . *) (86 . |entries|) (|List| 6) (91 . |elt|) (97 . |Zero|)
              (101 . |concat|) (107 . >) (113 . -) (118 . +)
              (|NonNegativeInteger|) |COCHNC;coboundary;$Nni2L;4| (|Homology|)
              (124 . |homologyGroup|) (|List| 48) (130 . |concat|)
              |COCHNC;coHomology;$L;5| (|List| $) (136 . |commaSeparate|)
              |COCHNC;coerce;$Of;6| (|SingleInteger|) (|HashState|))
           '#(~= 141 |validate| 147 |latex| 152 |hashUpdate!| 157 |hash| 163
              |coerce| 168 |coboundary| 173 |coHomology| 180 |coChainComplex|
              185 = 195)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 24))
                        (|makeByteWordVec2| 57
                                            '(1 10 8 0 11 1 12 0 0 13 2 7 0 14
                                              0 15 2 7 12 0 17 18 1 12 17 0 19
                                              1 12 17 0 20 2 17 21 0 0 22 1 24
                                              0 23 25 1 17 24 0 26 2 24 0 0 0
                                              27 1 24 28 0 29 2 12 0 0 0 30 1
                                              12 21 0 31 1 12 24 0 32 1 35 0 34
                                              36 2 12 35 35 0 37 1 35 34 0 38 2
                                              39 6 0 17 40 0 6 0 41 2 39 0 0 6
                                              42 2 17 21 0 0 43 1 6 0 0 44 2 6
                                              0 0 0 45 2 48 0 12 12 49 2 50 0 0
                                              48 51 1 24 0 53 54 2 0 21 0 0 1 1
                                              0 21 0 33 1 0 23 0 1 2 0 57 57 0
                                              1 1 0 56 0 1 1 0 24 0 55 3 0 39 0
                                              46 39 47 1 0 50 0 52 1 0 0 8 9 1
                                              0 0 10 16 2 0 21 0 0 1)))))
           '|lookupComplete|)) 
