
(SDEFUN |LLLRED;gram_step|
        ((|k| |Integer|) (N |Integer|) (|bm| |Matrix| (|Integer|))
         (|bsm| |Matrix| (|Float|)) (|mu| |Matrix| (|Float|))
         (|nbs| |Vector| (|Float|)) (|v1| |Vector| (|Float|)) ($ |Void|))
        (SPROG
         ((#1=#:G116 NIL) (|i| NIL) (#2=#:G115 NIL) (|v2| (|Vector| (|Float|)))
          (#3=#:G114 NIL) (|j| NIL) (#4=#:G113 NIL))
         (SEQ (SPADCALL |mu| |k| |k| (|spadConstant| $ 7) (QREFELT $ 10))
              (SEQ (LETT |i| 1 . #5=(|LLLRED;gram_step|)) (LETT #4# N . #5#)
                   G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |v1| |i|
                               (SPADCALL (SPADCALL |bm| |k| |i| (QREFELT $ 12))
                                         (QREFELT $ 13))
                               (QREFELT $ 15))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |j| 1 . #5#) (LETT #3# (- |k| 1) . #5#) G190
                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                   (SEQ (LETT |v2| (SPADCALL |bsm| |j| (QREFELT $ 16)) . #5#)
                        (SPADCALL |mu| |k| |j|
                                  (SPADCALL (SPADCALL |v1| |v2| (QREFELT $ 17))
                                            (SPADCALL |nbs| |j| (QREFELT $ 18))
                                            (QREFELT $ 19))
                                  (QREFELT $ 10))
                        (EXIT
                         (SEQ (LETT |i| 1 . #5#) (LETT #2# N . #5#) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |v1| |i|
                                          (SPADCALL
                                           (SPADCALL |v1| |i| (QREFELT $ 18))
                                           (SPADCALL
                                            (SPADCALL |mu| |k| |j|
                                                      (QREFELT $ 20))
                                            (SPADCALL |v2| |i| (QREFELT $ 18))
                                            (QREFELT $ 21))
                                           (QREFELT $ 22))
                                          (QREFELT $ 15))))
                              (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #5#) (LETT #1# N . #5#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bsm| |k| |i| (SPADCALL |v1| |i| (QREFELT $ 18))
                               (QREFELT $ 10))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |nbs| |k| (SPADCALL |v1| |v1| (QREFELT $ 17))
                         (QREFELT $ 15)))))) 

(SDEFUN |LLLRED;LLL;2M;2| ((L |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (|tmp| (|Float|)) (#1=#:G140 NIL)
          (|i| NIL) (#2=#:G139 NIL) (|bs2| #3=(|Vector| (|Float|))) (|bs1| #3#)
          (|v2i| #4=(|Float|)) (|v1i| #5=(|Float|)) (|tmpi| (|Integer|))
          (#6=#:G138 NIL) (|m| #7=(|Float|)) (|nv2| #7#) (|nv1| #5#)
          (|k1| (|Integer|)) (|del1| #4#) (#8=#:G137 NIL) (#9=#:G136 NIL)
          (|q| (|Integer|)) (|j| NIL) (|kmax| (|Integer|))
          (|iters| (|Integer|)) (#10=#:G135 NIL)
          (|v1| #11=(|Vector| (|Float|))) (|delta| (|Float|))
          (|bm| (|Matrix| (|Integer|))) (|mu| #12=(|Matrix| (|Float|)))
          (|nbs| #11#) (|bsm| #12#) (N (|NonNegativeInteger|))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS L) . #13=(|LLLRED;LLL;2M;2|))
              (LETT N (ANCOLS L) . #13#)
              (LETT |bsm| (MAKE_MATRIX1 |n| N (|spadConstant| $ 23)) . #13#)
              (LETT |nbs| (MAKEARR1 |n| (|spadConstant| $ 23)) . #13#)
              (LETT |mu| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 23)) . #13#)
              (LETT |bm| (SPADCALL L (QREFELT $ 24)) . #13#)
              (LETT |delta| (SPADCALL 8 -1 10 (QREFELT $ 26)) . #13#)
              (LETT |v1| (MAKEARR1 N (|spadConstant| $ 23)) . #13#)
              (SEQ (LETT |k| 1 . #13#) (LETT #10# |n| . #13#) G190
                   (COND ((|greater_SI| |k| #10#) (GO G191)))
                   (SEQ
                    (EXIT
                     (|LLLRED;gram_step| |k| N |bm| |bsm| |mu| |nbs| |v1| $)))
                   (LETT |k| (|inc_SI| |k|) . #13#) (GO G190) G191 (EXIT NIL))
              (LETT |kmax| |n| . #13#) (LETT |k| 2 . #13#)
              (LETT |iters| 0 . #13#)
              (SEQ G190
                   (COND ((NULL (SPADCALL |k| |n| (QREFELT $ 29))) (GO G191)))
                   (SEQ (LETT |iters| (+ |iters| 1) . #13#)
                        (COND
                         ((SPADCALL |k| |kmax| (QREFELT $ 30))
                          (SEQ
                           (|LLLRED;gram_step| |k| N |bm| |bsm| |mu| |nbs| |v1|
                            $)
                           (EXIT (LETT |kmax| |k| . #13#)))))
                        (SEQ (LETT |j| (- |k| 1) . #13#) G190
                             (COND ((< |j| 1) (GO G191)))
                             (SEQ
                              (LETT |q|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |mu| |k| |j| (QREFELT $ 20))
                                      (QREFELT $ 31))
                                     (QREFELT $ 32))
                                    . #13#)
                              (EXIT
                               (COND
                                ((SPADCALL |q| 0 (QREFELT $ 33))
                                 (SEQ
                                  (SEQ (LETT |i| 1 . #13#) (LETT #9# N . #13#)
                                       G190
                                       (COND
                                        ((|greater_SI| |i| #9#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |bm| |k| |i|
                                                   (-
                                                    (SPADCALL |bm| |k| |i|
                                                              (QREFELT $ 12))
                                                    (* |q|
                                                       (SPADCALL |bm| |j| |i|
                                                                 (QREFELT $
                                                                          12))))
                                                   (QREFELT $ 34))))
                                       (LETT |i| (|inc_SI| |i|) . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SEQ (LETT |i| 1 . #13#)
                                        (LETT #8# |j| . #13#) G190
                                        (COND
                                         ((|greater_SI| |i| #8#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |mu| |k| |i|
                                                    (SPADCALL
                                                     (SPADCALL |mu| |k| |i|
                                                               (QREFELT $ 20))
                                                     (SPADCALL |q|
                                                               (SPADCALL |mu|
                                                                         |j|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          20))
                                                               (QREFELT $ 35))
                                                     (QREFELT $ 22))
                                                    (QREFELT $ 10))))
                                        (LETT |i| (|inc_SI| |i|) . #13#)
                                        (GO G190) G191 (EXIT NIL))))))))
                             (LETT |j| (+ |j| -1) . #13#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |del1|
                              (SPADCALL |delta|
                                        (SPADCALL
                                         (SPADCALL |mu| |k| (- |k| 1)
                                                   (QREFELT $ 20))
                                         2 (QREFELT $ 36))
                                        (QREFELT $ 22))
                              . #13#)
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL |del1|
                                      (SPADCALL |nbs| (- |k| 1) (QREFELT $ 18))
                                      (QREFELT $ 21))
                            (SPADCALL |nbs| |k| (QREFELT $ 18)) (QREFELT $ 37))
                           (LETT |k| (+ |k| 1) . #13#))
                          ('T
                           (SEQ (LETT |k1| (- |k| 1) . #13#)
                                (LETT |nv1|
                                      (SPADCALL
                                       (SPADCALL |nbs| |k| (QREFELT $ 18))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |mu| |k| |k1|
                                                   (QREFELT $ 20))
                                         2 (QREFELT $ 36))
                                        (SPADCALL |nbs| |k1| (QREFELT $ 18))
                                        (QREFELT $ 21))
                                       (QREFELT $ 38))
                                      . #13#)
                                (LETT |nv2|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nbs| |k| (QREFELT $ 18))
                                        (SPADCALL |nbs| |k1| (QREFELT $ 18))
                                        (QREFELT $ 21))
                                       |nv1| (QREFELT $ 19))
                                      . #13#)
                                (LETT |m|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |mu| |k| |k1| (QREFELT $ 20))
                                        (SPADCALL |nbs| |k1| (QREFELT $ 18))
                                        (QREFELT $ 21))
                                       |nv1| (QREFELT $ 19))
                                      . #13#)
                                (SEQ (LETT |i| 1 . #13#) (LETT #6# N . #13#)
                                     G190
                                     (COND ((|greater_SI| |i| #6#) (GO G191)))
                                     (SEQ
                                      (LETT |tmpi|
                                            (SPADCALL |bm| |k| |i|
                                                      (QREFELT $ 12))
                                            . #13#)
                                      (SPADCALL |bm| |k| |i|
                                                (SPADCALL |bm| |k1| |i|
                                                          (QREFELT $ 12))
                                                (QREFELT $ 34))
                                      (SPADCALL |bm| |k1| |i| |tmpi|
                                                (QREFELT $ 34))
                                      (LETT |v1i|
                                            (SPADCALL
                                             (SPADCALL |bsm| |k| |i|
                                                       (QREFELT $ 20))
                                             (SPADCALL
                                              (SPADCALL |mu| |k| |k1|
                                                        (QREFELT $ 20))
                                              (SPADCALL |bsm| |k1| |i|
                                                        (QREFELT $ 20))
                                              (QREFELT $ 21))
                                             (QREFELT $ 38))
                                            . #13#)
                                      (LETT |v2i|
                                            (SPADCALL
                                             (SPADCALL |bsm| |k1| |i|
                                                       (QREFELT $ 20))
                                             (SPADCALL |m| |v1i|
                                                       (QREFELT $ 21))
                                             (QREFELT $ 22))
                                            . #13#)
                                      (SPADCALL |bsm| |k1| |i| |v1i|
                                                (QREFELT $ 10))
                                      (EXIT
                                       (SPADCALL |bsm| |k| |i| |v2i|
                                                 (QREFELT $ 10))))
                                     (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |bs1|
                                      (SPADCALL |bsm| |k1| (QREFELT $ 16))
                                      . #13#)
                                (LETT |bs2| (SPADCALL |bsm| |k| (QREFELT $ 16))
                                      . #13#)
                                (SEQ (LETT |i| 1 . #13#)
                                     (LETT #2# (- |k1| 1) . #13#) G190
                                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                                     (SEQ
                                      (LETT |tmp|
                                            (SPADCALL |mu| |k| |i|
                                                      (QREFELT $ 20))
                                            . #13#)
                                      (SPADCALL |mu| |k| |i|
                                                (SPADCALL |mu| |k1| |i|
                                                          (QREFELT $ 20))
                                                (QREFELT $ 10))
                                      (EXIT
                                       (SPADCALL |mu| |k1| |i| |tmp|
                                                 (QREFELT $ 10))))
                                     (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                     G191 (EXIT NIL))
                                (SEQ (LETT |i| (+ |k| 1) . #13#)
                                     (LETT #1# |kmax| . #13#) G190
                                     (COND ((> |i| #1#) (GO G191)))
                                     (SEQ
                                      (LETT |tmp|
                                            (SPADCALL |mu| |i| |k|
                                                      (QREFELT $ 20))
                                            . #13#)
                                      (SPADCALL |mu| |i| |k|
                                                (SPADCALL
                                                 (SPADCALL |mu| |i| |k1|
                                                           (QREFELT $ 20))
                                                 (SPADCALL
                                                  (SPADCALL |mu| |k| |k1|
                                                            (QREFELT $ 20))
                                                  (SPADCALL |mu| |i| |k|
                                                            (QREFELT $ 20))
                                                  (QREFELT $ 21))
                                                 (QREFELT $ 22))
                                                (QREFELT $ 10))
                                      (EXIT
                                       (SPADCALL |mu| |i| |k1|
                                                 (SPADCALL |tmp|
                                                           (SPADCALL |m|
                                                                     (SPADCALL
                                                                      |mu| |i|
                                                                      |k|
                                                                      (QREFELT
                                                                       $ 20))
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 38))
                                                 (QREFELT $ 10))))
                                     (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                                     (EXIT NIL))
                                (SPADCALL |mu| |k| |k1| |m| (QREFELT $ 10))
                                (SPADCALL |nbs| |k1| |nv1| (QREFELT $ 15))
                                (SPADCALL |nbs| |k| |nv2| (QREFELT $ 15))
                                (EXIT (LETT |k| (MAX 2 |k1|) . #13#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |bm|)))) 

(SDEFUN |LLLRED;find_relation;LNniL;3|
        ((|la| |List| (|Float|)) (|k| |NonNegativeInteger|)
         ($ |List| (|Integer|)))
        (SPROG
         ((#1=#:G149 NIL) (|i| NIL) (#2=#:G148 NIL)
          (|res| (|Matrix| (|Integer|))) (#3=#:G146 NIL) (#4=#:G147 NIL)
          (|a| NIL) (|tenk| (|NonNegativeInteger|))
          (|m| (|Matrix| (|Integer|))) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |la|) . #5=(|LLLRED;find_relation;LNniL;3|))
              (LETT |m| (MAKE_MATRIX1 |n| (+ |n| 1) 0) . #5#)
              (LETT |tenk| (EXPT 10 |k|) . #5#)
              (SEQ (LETT |a| NIL . #5#) (LETT #4# |la| . #5#)
                   (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                         (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (SPADCALL |m| |i| |i| 1 (QREFELT $ 34))
                        (EXIT
                         (SPADCALL |m| |i| (+ |n| 1)
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |tenk| |a| (QREFELT $ 40))
                                     (QREFELT $ 31))
                                    (QREFELT $ 32))
                                   (QREFELT $ 34))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |m| (QREFELT $ 39)) . #5#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |i| 1 . #5#) (LETT #1# |n| . #5#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS (SPADCALL |res| 1 |i| (QREFELT $ 12)) #2#)
                             . #5#)))
                     (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |LLLReduction;|)) 

(DEFUN |LLLReduction| ()
  (SPROG NIL
         (PROG (#1=#:G151)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LLLReduction|)
                    . #2=(|LLLReduction|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LLLReduction|
                             (LIST (CONS NIL (CONS 1 (|LLLReduction;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|LLLReduction|)))))))))) 

(DEFUN |LLLReduction;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LLLReduction|) . #1=(|LLLReduction|))
          (LETT $ (GETREFV 44) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LLLReduction| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LLLReduction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |One|) (|Integer|)
              (|Matrix| 6) (4 . |setelt!|) (|Matrix| 8) (12 . |elt|)
              (19 . |coerce|) (|Vector| 6) (24 . |setelt!|) (31 . |row|)
              (37 . |dot|) (43 . |elt|) (49 . /) (55 . |elt|) (62 . *) (68 . -)
              (74 . |Zero|) (78 . |copy|) (|PositiveInteger|) (83 . |float|)
              (|Boolean|) (|NonNegativeInteger|) (90 . <=) (96 . >)
              (102 . |round|) (107 . |retract|) (112 . ~=) (118 . |setelt!|)
              (126 . *) (132 . ^) (138 . <=) (144 . +) |LLLRED;LLL;2M;2|
              (150 . *) (|List| 8) (|List| 6) |LLLRED;find_relation;LNniL;3|)
           '#(|find_relation| 156 LLL 162) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(0 6 0 7 4 9 6 0 8 8 6 10 3
                                                   11 8 0 8 8 12 1 6 0 8 13 3
                                                   14 6 0 8 6 15 2 9 14 0 8 16
                                                   2 14 6 0 0 17 2 14 6 0 8 18
                                                   2 6 0 0 0 19 3 9 6 0 8 8 20
                                                   2 6 0 0 0 21 2 6 0 0 0 22 0
                                                   6 0 23 1 11 0 0 24 3 6 0 8 8
                                                   25 26 2 28 27 0 0 29 2 8 27
                                                   0 0 30 1 6 0 0 31 1 6 8 0 32
                                                   2 8 27 0 0 33 4 11 8 0 8 8 8
                                                   34 2 6 0 8 0 35 2 6 0 0 8 36
                                                   2 6 27 0 0 37 2 6 0 0 0 38 2
                                                   6 0 28 0 40 2 0 41 42 28 43
                                                   1 0 11 11 39)))))
           '|lookupComplete|)) 

(MAKEPROP '|LLLReduction| 'NILADIC T) 
