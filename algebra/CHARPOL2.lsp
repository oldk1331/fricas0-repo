
(SDEFUN |CHARPOL2;danilewski;MR;1|
        ((|m| |Matrix| F)
         ($ |Record| (|:| |matrix| (|Matrix| F))
          (|:| |block_list| (|List| (|Integer|)))))
        (SPROG
         ((#1=#:G140 NIL) (|j| NIL) (#2=#:G139 NIL) (|i| NIL) (|s| (F))
          (#3=#:G138 NIL) (#4=#:G137 NIL) (|val| (F)) (#5=#:G136 NIL)
          (|cc| (F)) (#6=#:G135 NIL) (|piv| (F))
          (|blocks| (|List| (|Integer|))) (|nn| (|Integer|)) (#7=#:G132 NIL)
          (|has_block| (|Boolean|)) (#8=#:G134 NIL) (|kk| NIL)
          (|k1| (|Integer|)) (|n1| (|Integer|)) (#9=#:G133 NIL) (|nc| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANCOLS |m|) . #10=(|CHARPOL2;danilewski;MR;1|))
              (EXIT
               (COND
                ((SPADCALL |n| (ANROWS |m|) (QREFELT $ 9))
                 (|error| "need square matrix"))
                ('T
                 (SEQ (LETT |n1| |n| . #10#) (LETT |nn| |n| . #10#)
                      (LETT |blocks| NIL . #10#)
                      (SEQ (LETT |nc| 1 . #10#) (LETT #9# (- |n| 1) . #10#)
                           G190 (COND ((|greater_SI| |nc| #9#) (GO G191)))
                           (SEQ (LETT |n1| (+ (- |n| |nc|) 1) . #10#)
                                (LETT |k1| (- |n1| 1) . #10#)
                                (LETT |has_block| NIL . #10#)
                                (SEQ
                                 (LETT |piv| (QAREF2O |m| |n1| |k1| 1 1)
                                       . #10#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |piv| (|spadConstant| $ 11)
                                              (QREFELT $ 12))
                                    (SEQ (LETT |has_block| 'T . #10#)
                                         (EXIT
                                          (SEQ
                                           (EXIT
                                            (SEQ (LETT |kk| 1 . #10#)
                                                 (LETT #8# (- |k1| 1) . #10#)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |kk| #8#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL
                                                      (LETT |piv|
                                                            (QAREF2O |m| |n1|
                                                                     |kk| 1 1)
                                                            . #10#)
                                                      (|spadConstant| $ 11)
                                                      (QREFELT $ 13))
                                                     (SEQ
                                                      (LETT |m|
                                                            (SPADCALL |m| |kk|
                                                                      |k1|
                                                                      (QREFELT
                                                                       $ 16))
                                                            . #10#)
                                                      (LETT |m|
                                                            (SPADCALL |m| |kk|
                                                                      |k1|
                                                                      (QREFELT
                                                                       $ 17))
                                                            . #10#)
                                                      (LETT |has_block| NIL
                                                            . #10#)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #7# |$NoValue|
                                                              . #10#)
                                                        (GO #11=#:G112))))))))
                                                 (LETT |kk| (|inc_SI| |kk|)
                                                       . #10#)
                                                 (GO G190) G191 (EXIT NIL)))
                                           #11# (EXIT #7#))))))))
                                (EXIT
                                 (COND
                                  (|has_block|
                                   (SEQ (LETT |nn| |k1| . #10#)
                                        (LETT |blocks| (CONS |n1| |blocks|)
                                              . #10#)
                                        (EXIT "iterate")))
                                  ('T
                                   (SEQ
                                    (LETT |piv|
                                          (SPADCALL (|spadConstant| $ 10) |piv|
                                                    (QREFELT $ 18))
                                          . #10#)
                                    (SEQ (LETT |i| 1 . #10#)
                                         (LETT #6# |k1| . #10#) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (LETT |cc|
                                                (SPADCALL |piv|
                                                          (QAREF2O |m| |i| |k1|
                                                                   1 1)
                                                          (QREFELT $ 19))
                                                . #10#)
                                          (EXIT
                                           (SEQ (LETT |j| 1 . #10#)
                                                (LETT #5# |nn| . #10#) G190
                                                (COND
                                                 ((|greater_SI| |j| #5#)
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |val|
                                                       (COND
                                                        ((EQL |j| |k1|) |cc|)
                                                        ('T
                                                         (SPADCALL
                                                          (QAREF2O |m| |i| |j|
                                                                   1 1)
                                                          (SPADCALL |cc|
                                                                    (QAREF2O
                                                                     |m| |n1|
                                                                     |j| 1 1)
                                                                    (QREFELT $
                                                                             19))
                                                          (QREFELT $ 20))))
                                                       . #10#)
                                                 (EXIT
                                                  (QSETAREF2O |m| |i| |j| |val|
                                                              1 1)))
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #10#)
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT |i| (|inc_SI| |i|) . #10#)
                                         (GO G190) G191 (EXIT NIL))
                                    (SEQ (LETT |j| 1 . #10#)
                                         (LETT #4# |nn| . #10#) G190
                                         (COND
                                          ((|greater_SI| |j| #4#) (GO G191)))
                                         (SEQ
                                          (LETT |s| (|spadConstant| $ 11)
                                                . #10#)
                                          (SEQ (LETT |i| 1 . #10#)
                                               (LETT #3# |k1| . #10#) G190
                                               (COND
                                                ((|greater_SI| |i| #3#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |s|
                                                       (SPADCALL |s|
                                                                 (SPADCALL
                                                                  (QAREF2O |m|
                                                                           |n1|
                                                                           |i|
                                                                           1 1)
                                                                  (QAREF2O |m|
                                                                           |i|
                                                                           |j|
                                                                           1 1)
                                                                  (QREFELT $
                                                                           19))
                                                                 (QREFELT $
                                                                          21))
                                                       . #10#)))
                                               (LETT |i| (|inc_SI| |i|) . #10#)
                                               (GO G190) G191 (EXIT NIL))
                                          (EXIT
                                           (QSETAREF2O |m| |k1| |j| |s| 1 1)))
                                         (LETT |j| (|inc_SI| |j|) . #10#)
                                         (GO G190) G191 (EXIT NIL))
                                    (SEQ (LETT |i| 0 . #10#)
                                         (LETT #2# (- |nn| |n1|) . #10#) G190
                                         (COND
                                          ((|greater_SI| |i| #2#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (QSETAREF2O |m| |k1| (+ |k1| |i|)
                                                       (SPADCALL
                                                        (QAREF2O |m| |k1|
                                                                 (+ |k1| |i|) 1
                                                                 1)
                                                        (QAREF2O |m| |n1|
                                                                 (+ |n1| |i|) 1
                                                                 1)
                                                        (QREFELT $ 21))
                                                       1 1)))
                                         (LETT |i| (|inc_SI| |i|) . #10#)
                                         (GO G190) G191 (EXIT NIL))
                                    (SEQ (LETT |j| 1 . #10#)
                                         (LETT #1# |nn| . #10#) G190
                                         (COND
                                          ((|greater_SI| |j| #1#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (QSETAREF2O |m| |n1| |j|
                                                       (|spadConstant| $ 11) 1
                                                       1)))
                                         (LETT |j| (|inc_SI| |j|) . #10#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (QSETAREF2O |m| |n1| |k1|
                                                 (|spadConstant| $ 10) 1
                                                 1)))))))
                           (LETT |nc| (|inc_SI| |nc|) . #10#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS |m| (CONS 1 |blocks|)))))))))) 

(SDEFUN |CHARPOL2;char_pol;MSup;2|
        ((|m| |Matrix| F) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| F))
          (|res1| (|SparseUnivariatePolynomial| F)) (#1=#:G146 NIL)
          (#2=#:G144 NIL) (#3=#:G152 NIL) (|i| NIL) (|i1| (|Integer|))
          (|blocks| #4=(|List| (|Integer|))) (|i0| (|Integer|))
          (|mp| #5=(|Matrix| F)) (|n| (|NonNegativeInteger|))
          (|pp| (|Record| (|:| |matrix| #5#) (|:| |block_list| #4#))))
         (SEQ
          (LETT |pp| (SPADCALL (SPADCALL |m| (QREFELT $ 24)) (QREFELT $ 23))
                . #6=(|CHARPOL2;char_pol;MSup;2|))
          (LETT |n| (ANCOLS |m|) . #6#) (LETT |blocks| (QCDR |pp|) . #6#)
          (LETT |mp| (QCAR |pp|) . #6#)
          (LETT |res| (|spadConstant| $ 26) . #6#)
          (SEQ G190 (COND ((NULL (NULL (NULL |blocks|))) (GO G191)))
               (SEQ (LETT |i0| (|SPADfirst| |blocks|) . #6#)
                    (LETT |blocks| (CDR |blocks|) . #6#)
                    (LETT |i1|
                          (COND ((NULL |blocks|) (+ |n| 1))
                                ('T (|SPADfirst| |blocks|)))
                          . #6#)
                    (LETT |res1| (|spadConstant| $ 27) . #6#)
                    (SEQ (LETT |i| 0 . #6#)
                         (LETT #3# (- (- |i1| |i0|) 1) . #6#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res1|
                                 (SPADCALL |res1|
                                           (SPADCALL
                                            (SPADCALL |mp| |i0|
                                                      (PROG1
                                                          (LETT #2#
                                                                (- (- |i1| |i|)
                                                                   1)
                                                                . #6#)
                                                        (|check_subtype2|
                                                         (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                                      (QREFELT $ 28))
                                            |i| (QREFELT $ 29))
                                           (QREFELT $ 30))
                                 . #6#)))
                         (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |res1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 10) (QREFELT $ 31))
                            (PROG1 (LETT #1# (- |i1| |i0|) . #6#)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 29))
                           |res1| (QREFELT $ 30))
                          . #6#)
                    (COND
                     ((SPADCALL (- |i1| |i0|) (QREFELT $ 32))
                      (LETT |res1| (SPADCALL |res1| (QREFELT $ 33)) . #6#)))
                    (EXIT
                     (LETT |res| (SPADCALL |res| |res1| (QREFELT $ 34))
                           . #6#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomial2;|)) 

(DEFUN |CharacteristicPolynomial2| (#1=#:G153)
  (SPROG NIL
         (PROG (#2=#:G154)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomial2|)
                                               '|domainEqualList|)
                    . #3=(|CharacteristicPolynomial2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomial2;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomial2|)))))))))) 

(DEFUN |CharacteristicPolynomial2;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CharacteristicPolynomial2|))
          (LETT |dv$| (LIST '|CharacteristicPolynomial2| DV$1) . #1#)
          (LETT $ (GETREFV 36) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomial2|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CharacteristicPolynomial2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (6 . |One|) (10 . |Zero|)
              (14 . =) (20 . ~=) (|Integer|) (|Matrix| 6) (26 . |swapRows!|)
              (33 . |swapColumns!|) (40 . /) (46 . *) (52 . -) (58 . +)
              (|Record| (|:| |matrix| 15) (|:| |block_list| (|List| 14)))
              |CHARPOL2;danilewski;MR;1| (64 . |copy|)
              (|SparseUnivariatePolynomial| 6) (69 . |One|) (73 . |Zero|)
              (77 . |elt|) (84 . |monomial|) (90 . +) (96 . -) (101 . |even?|)
              (106 . -) (111 . *) |CHARPOL2;char_pol;MSup;2|)
           '#(|danilewski| 117 |char_pol| 122) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(2 8 7 0 0 9 0 6 0 10 0 6 0
                                                   11 2 6 7 0 0 12 2 6 7 0 0 13
                                                   3 15 0 0 14 14 16 3 15 0 0
                                                   14 14 17 2 6 0 0 0 18 2 6 0
                                                   0 0 19 2 6 0 0 0 20 2 6 0 0
                                                   0 21 1 15 0 0 24 0 25 0 26 0
                                                   25 0 27 3 15 6 0 14 14 28 2
                                                   25 0 6 8 29 2 25 0 0 0 30 1
                                                   6 0 0 31 1 14 7 0 32 1 25 0
                                                   0 33 2 25 0 0 0 34 1 0 22 15
                                                   23 1 0 25 15 35)))))
           '|lookupComplete|)) 
