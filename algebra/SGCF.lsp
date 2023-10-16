
(SDEFUN |SGCF;numberOfImproperPartitionsInternal|
        ((|n| |Integer|) (|m| |Integer|) (|cm| |Integer|) ($ |Integer|))
        (SPROG ((|s| (|Integer|)) (#1=#:G117 NIL) (|i| NIL))
               (SEQ
                (COND ((EQL |n| 0) (SPADCALL |m| |cm| (QREFELT $ 8)))
                      ('T
                       (SEQ
                        (COND
                         ((EQL |cm| 0)
                          (COND ((SPADCALL |n| 0 (QREFELT $ 10)) (EXIT 0)))))
                        (LETT |s| 0)
                        (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (+ |s|
                                        (|SGCF;numberOfImproperPartitionsInternal|
                                         |i| |m| (- |cm| 1) $)))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |SGCF;numberOfImproperPartitions;3I;2|
        ((|n| |Integer|) (|m| |Integer|) ($ |Integer|))
        (SPROG ((|s| (|Integer|)) (#1=#:G122 NIL) (|i| NIL) (#2=#:G121 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (< |n| 0) (< |m| 1))
                    (PROGN (LETT #2# 0) (GO #3=#:G120))))
                  (COND
                   ((OR (EQL |m| 1) (EQL |n| 0))
                    (PROGN (LETT #2# 1) (GO #3#))))
                  (LETT |s| 0)
                  (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |s|
                               (+ |s|
                                  (SPADCALL (- |n| |i|) (- |m| 1)
                                            (QREFELT $ 11))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |s|)))
                #3# (EXIT #2#)))) 

(SDEFUN |SGCF;unrankImproperPartitions0;3IL;3|
        ((|n| |Integer|) (|m| |Integer|) (|k| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((|l| (|List| (|Integer|))) (#1=#:G131 NIL) (|s| #2=(|Integer|))
          (|sOld| #2#) (#3=#:G133 NIL) (|y| NIL) (#4=#:G132 NIL) (|t| NIL))
         (SEQ (LETT |l| NIL)
              (EXIT
               (COND
                ((< |k| 0) (|error| "counting of partitions is started at 0"))
                ((>= |k| (SPADCALL |n| |m| (QREFELT $ 11)))
                 (|error| "there are not so many partitions"))
                ('T
                 (SEQ
                  (SEQ (LETT |t| 0) (LETT #4# (- |m| 2)) G190
                       (COND ((|greater_SI| |t| #4#) (GO G191)))
                       (SEQ (LETT |s| 0)
                            (SEQ
                             (EXIT
                              (SEQ (LETT |y| 0) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |y| #3#) (GO G191)))
                                   (SEQ (LETT |sOld| |s|)
                                        (LETT |s|
                                              (+ |s|
                                                 (SPADCALL (- |n| |y|)
                                                           (- (- |m| |t|) 1)
                                                           (QREFELT $ 11))))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |s| |k| (QREFELT $ 10))
                                           (PROGN
                                            (LETT #1# |$NoValue|)
                                            (GO #5=#:G124))))))
                                   (LETT |y| (|inc_SI| |y|)) (GO G190) G191
                                   (EXIT NIL)))
                             #5# (EXIT #1#))
                            (LETT |l|
                                  (SPADCALL |l| (SPADCALL |y| (QREFELT $ 13))
                                            (QREFELT $ 14)))
                            (LETT |k| (- |k| |sOld|))
                            (EXIT (LETT |n| (- |n| |y|))))
                       (LETT |t| (|inc_SI| |t|)) (GO G190) G191 (EXIT NIL))
                  (LETT |l|
                        (SPADCALL |l| (SPADCALL |n| (QREFELT $ 13))
                                  (QREFELT $ 14)))
                  (EXIT |l|)))))))) 

(SDEFUN |SGCF;unrankImproperPartitions1;3IL;4|
        ((|n| |Integer|) (|m| . #1=(|Integer|)) (|k| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G146 NIL) (|i| NIL) (|nonZeroPos| (|List| (|Integer|)))
          (|nonZeros| (|List| (|Integer|))) (#3=#:G145 NIL)
          (|s| #4=(|Integer|)) (|sOld| #4#) (|y| NIL) (|cm| #1#)
          (|partition| (|Vector| (|Integer|))) (#5=#:G135 NIL))
         (SEQ (LETT |nonZeros| NIL)
              (LETT |partition|
                    (MAKEARR1
                     (PROG1 (LETT #5# |m|)
                       (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #5#))
                     0))
              (EXIT
               (COND
                ((OR (< |k| 0) (>= |k| (SPADCALL |n| |m| (QREFELT $ 11))))
                 |nonZeros|)
                ('T
                 (SEQ (LETT |cm| |m|)
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |n| 0 (QREFELT $ 16))) (GO G191)))
                           (SEQ (LETT |s| 0) (LETT |cm| (- |cm| 1))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |y| |n|) G190
                                       (COND ((< |y| 1) (GO G191)))
                                       (SEQ (LETT |sOld| |s|)
                                            (LETT |s|
                                                  (+ |s|
                                                     (|SGCF;numberOfImproperPartitionsInternal|
                                                      (- |n| |y|) |m| |cm| $)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |s| |k|
                                                         (QREFELT $ 10))
                                               (PROGN
                                                (LETT #3# |$NoValue|)
                                                (GO #6=#:G137))))))
                                       (LETT |y| (+ |y| -1)) (GO G190) G191
                                       (EXIT NIL)))
                                 #6# (EXIT #3#))
                                (LETT |nonZeros|
                                      (SPADCALL |nonZeros|
                                                (SPADCALL |y| (QREFELT $ 13))
                                                (QREFELT $ 14)))
                                (LETT |k| (- |k| |sOld|))
                                (EXIT (LETT |n| (- |n| |y|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |nonZeroPos|
                            (REVERSE
                             (SPADCALL |m| (- |m| |cm|) |k| (QREFELT $ 17))))
                      (SEQ (LETT |i| 1) (LETT #2# (- |m| |cm|)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |partition|
                                       (+ 1
                                          (SPADCALL |nonZeroPos| |i|
                                                    (QREFELT $ 18)))
                                       (SPADCALL |nonZeros| |i| (QREFELT $ 18))
                                       (QREFELT $ 20))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |partition| (QREFELT $ 21)))))))))) 

(SDEFUN |SGCF;subSet;3IL;5|
        ((|n| |Integer|) (|m| . #1=(|Integer|)) (|k| . #2=(|Integer|))
         ($ |List| (|Integer|)))
        (SPROG
         ((|s| #1#) (|mm| #2#) (|l| (|List| (|Integer|))) (#3=#:G155 NIL)
          (#4=#:G157 NIL) (|y| NIL) (#5=#:G156 NIL) (|t| NIL)
          (|bin| (|Integer|)))
         (SEQ
          (COND
           ((OR (OR (OR (< |k| 0) (< |n| 0)) (< |m| 0))
                (SPADCALL |m| |n| (QREFELT $ 10)))
            (|error| "improper argument to subSet"))
           ('T
            (SEQ (LETT |bin| (SPADCALL |n| |m| (QREFELT $ 8)))
                 (EXIT
                  (COND
                   ((>= |k| |bin|) (|error| "there are not so many subsets"))
                   (#6='T
                    (SEQ (LETT |l| NIL)
                         (EXIT
                          (COND ((EQL |n| 0) |l|)
                                (#6#
                                 (SEQ (LETT |mm| |k|) (LETT |s| |m|)
                                      (SEQ (LETT |t| 0) (LETT #5# (- |m| 1))
                                           G190
                                           (COND
                                            ((|greater_SI| |t| #5#) (GO G191)))
                                           (SEQ
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |y| (- |s| 1))
                                                   (LETT #4# (+ |n| 1)) G190
                                                   (COND
                                                    ((> |y| #4#) (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL
                                                        (SPADCALL |y| |s|
                                                                  (QREFELT $
                                                                           8))
                                                        |mm| (QREFELT $ 10))
                                                       (PROGN
                                                        (LETT #3# |$NoValue|)
                                                        (GO #7=#:G148))))))
                                                   (LETT |y| (+ |y| 1))
                                                   (GO G190) G191 (EXIT NIL)))
                                             #7# (EXIT #3#))
                                            (LETT |l|
                                                  (SPADCALL |l|
                                                            (SPADCALL (- |y| 1)
                                                                      (QREFELT
                                                                       $ 13))
                                                            (QREFELT $ 14)))
                                            (LETT |mm|
                                                  (- |mm|
                                                     (SPADCALL (- |y| 1) |s|
                                                               (QREFELT $ 8))))
                                            (EXIT (LETT |s| (- |s| 1))))
                                           (LETT |t| (|inc_SI| |t|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT |l|))))))))))))))) 

(SDEFUN |SGCF;nextLatticePermutation;2LBL;6|
        ((|lambda| |List| #1=(|Integer|)) (|lattP| |List| (|Integer|))
         (|constructNotFirst| |Boolean|) ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G188 NIL) (|l| NIL) (|i| NIL)
          (|rightPosition| #3=(|NonNegativeInteger|)) (#4=#:G176 NIL)
          (|j| (|NonNegativeInteger|)) (#5=#:G187 NIL) (|ready| (|Boolean|))
          (|leftEntry| #6=(|NonNegativeInteger|)) (#7=#:G168 NIL)
          (|rightEntry| #6#) (#8=#:G186 NIL) (#9=#:G167 NIL)
          (|help| (|Vector| (|Integer|))) (|n| #3#) (#10=#:G166 NIL)
          (#11=#:G164 NIL) (#12=#:G163 #1#) (#13=#:G165 #1#) (#14=#:G185 NIL)
          (#15=#:G104 NIL) (|rows| (|NonNegativeInteger|)) (#16=#:G159 NIL)
          (|columns| (|NonNegativeInteger|)) (#17=#:G158 NIL)
          (|lprime| (|List| (|Integer|))))
         (SEQ (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 24)))
              (LETT |columns|
                    (PROG1 (LETT #17# (|SPADfirst| |lambda|))
                      (|check_subtype2| (>= #17# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #17#)))
              (LETT |rows|
                    (PROG1 (LETT #16# (|SPADfirst| |lprime|))
                      (|check_subtype2| (>= #16# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #16#)))
              (LETT |n|
                    (PROG1
                        (LETT #10#
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT #15# NIL) (LETT #14# |lambda|) G190
                                    (COND
                                     ((OR (ATOM #14#)
                                          (PROGN (LETT #15# (CAR #14#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #13# #15#)
                                       (COND (#11# (LETT #12# (+ #12# #13#)))
                                             ('T
                                              (PROGN
                                               (LETT #12# #13#)
                                               (LETT #11# 'T)))))))
                                    (LETT #14# (CDR #14#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#11# #12#) (#18='T 0))))
                      (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #10#)))
              (EXIT
               (COND
                (|constructNotFirst|
                 (SEQ (LETT |help| (MAKEARR1 |columns| 0))
                      (LETT |rightPosition| |n|)
                      (LETT |leftEntry|
                            (PROG1
                                (LETT #9#
                                      (SPADCALL |lattP| |rightPosition|
                                                (QREFELT $ 18)))
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#)))
                      (LETT |ready| NIL)
                      (SEQ (LETT #8# NIL) G190 (COND (#8# (GO G191)))
                           (SEQ (LETT |rightEntry| |leftEntry|)
                                (LETT |leftEntry|
                                      (PROG1
                                          (LETT #7#
                                                (SPADCALL |lattP|
                                                          (- |rightPosition| 1)
                                                          (QREFELT $ 18)))
                                        (|check_subtype2| (>= #7# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #7#)))
                                (SPADCALL |help| |rightEntry|
                                          (+
                                           (SPADCALL |help| |rightEntry|
                                                     (QREFELT $ 25))
                                           1)
                                          (QREFELT $ 20))
                                (COND
                                 ((SPADCALL |rightEntry| |leftEntry|
                                            (QREFELT $ 27))
                                  (COND
                                   ((SPADCALL
                                     (-
                                      (SPADCALL |lprime| |leftEntry|
                                                (QREFELT $ 18))
                                      (SPADCALL |help| |leftEntry|
                                                (QREFELT $ 25)))
                                     (+
                                      (-
                                       (SPADCALL |lprime| |rightEntry|
                                                 (QREFELT $ 18))
                                       (SPADCALL |help| |rightEntry|
                                                 (QREFELT $ 25)))
                                      1)
                                     (QREFELT $ 10))
                                    (SEQ (LETT |ready| 'T)
                                         (LETT |j| (+ |leftEntry| 1))
                                         (SEQ G190
                                              (COND
                                               ((NULL
                                                 (COND
                                                  ((EQL
                                                    (SPADCALL |help| |j|
                                                              (QREFELT $ 25))
                                                    0)
                                                   'T)
                                                  ('T
                                                   (<
                                                    (-
                                                     (SPADCALL |lprime|
                                                               |leftEntry|
                                                               (QREFELT $ 18))
                                                     (SPADCALL |lprime| |j|
                                                               (QREFELT $ 18)))
                                                    (+
                                                     (-
                                                      (SPADCALL |help|
                                                                |leftEntry|
                                                                (QREFELT $ 25))
                                                      (SPADCALL |help| |j|
                                                                (QREFELT $
                                                                         25)))
                                                     2)))))
                                                (GO G191)))
                                              (SEQ (EXIT (LETT |j| (+ |j| 1))))
                                              NIL (GO G190) G191 (EXIT NIL))
                                         (SPADCALL |lattP|
                                                   (- |rightPosition| 1) |j|
                                                   (QREFELT $ 28))
                                         (SPADCALL |help| |j|
                                                   (-
                                                    (SPADCALL |help| |j|
                                                              (QREFELT $ 25))
                                                    1)
                                                   (QREFELT $ 20))
                                         (SPADCALL |help| |leftEntry|
                                                   (+
                                                    (SPADCALL |help|
                                                              |leftEntry|
                                                              (QREFELT $ 25))
                                                    1)
                                                   (QREFELT $ 20))
                                         (EXIT
                                          (SEQ (LETT |l| |rightPosition|)
                                               (LETT #5# |n|) G190
                                               (COND ((> |l| #5#) (GO G191)))
                                               (SEQ (LETT |j| 0)
                                                    (SEQ G190
                                                         (COND
                                                          ((NULL
                                                            (EQL
                                                             (SPADCALL |help|
                                                                       (+ 1
                                                                          |j|)
                                                                       (QREFELT
                                                                        $ 25))
                                                             0))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT |j|
                                                                 (+ |j| 1))))
                                                         NIL (GO G190) G191
                                                         (EXIT NIL))
                                                    (SPADCALL |lattP| |l|
                                                              (+ |j| 1)
                                                              (QREFELT $ 28))
                                                    (EXIT
                                                     (SPADCALL |help| (+ 1 |j|)
                                                               (-
                                                                (SPADCALL
                                                                 |help|
                                                                 (+ 1 |j|)
                                                                 (QREFELT $
                                                                          25))
                                                                1)
                                                               (QREFELT $
                                                                        20))))
                                               (LETT |l| (+ |l| 1)) (GO G190)
                                               G191 (EXIT NIL))))))))
                                (LETT |rightPosition|
                                      (PROG1 (LETT #4# (- |rightPosition| 1))
                                        (|check_subtype2| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #4#)))
                                (EXIT
                                 (COND
                                  ((EQL |rightPosition| 1)
                                   (LETT |constructNotFirst| NIL)))))
                           (LETT #8#
                                 (COND
                                  ((OR |ready| (NULL |constructNotFirst|)) 'T)
                                  ('T NIL)))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (COND (|constructNotFirst| |lattP|) (#18# NIL)))))
                (#18#
                 (SEQ (LETT |lattP| NIL)
                      (SEQ (LETT |i| |columns|) G190
                           (COND ((< |i| 1) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |l| 1)
                                  (LETT #2#
                                        (SPADCALL |lprime| |i| (QREFELT $ 18)))
                                  G190
                                  (COND ((|greater_SI| |l| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT (LETT |lattP| (CONS |i| |lattP|))))
                                  (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                      (EXIT |lattP|)))))))) 

(SDEFUN |SGCF;makeYoungTableau;2LM;7|
        ((|lambda| |List| (|Integer|)) (|gitter| |List| (|Integer|))
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G195 NIL) (|l| NIL)
          (|help| (|Vector| (|Integer|))) (|ytab| (|Matrix| (|Integer|)))
          (|rows| (|NonNegativeInteger|)) (#2=#:G190 NIL)
          (|columns| (|NonNegativeInteger|)) (#3=#:G189 NIL)
          (|lprime| (|List| (|Integer|))))
         (SEQ (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 24)))
              (LETT |columns|
                    (PROG1 (LETT #3# (|SPADfirst| |lambda|))
                      (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #3#)))
              (LETT |rows|
                    (PROG1 (LETT #2# (|SPADfirst| |lprime|))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |ytab| (MAKE_MATRIX1 |rows| |columns| 0))
              (LETT |help| (MAKEARR1 |columns| 1)) (LETT |i| -1) (LETT |j| 0)
              (SEQ (LETT |l| 1) (LETT #1# (SPADCALL |gitter| (QREFELT $ 30)))
                   G190 (COND ((|greater_SI| |l| #1#) (GO G191)))
                   (SEQ (LETT |j| (SPADCALL |gitter| |l| (QREFELT $ 18)))
                        (LETT |i| (+ |i| 1))
                        (SPADCALL |ytab| (SPADCALL |help| |j| (QREFELT $ 25))
                                  |j| |i| (QREFELT $ 32))
                        (EXIT
                         (SPADCALL |help| |j|
                                   (+ (SPADCALL |help| |j| (QREFELT $ 25)) 1)
                                   (QREFELT $ 20))))
                   (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ytab|)))) 

(SDEFUN |SGCF;listYoungTableaus;LL;8|
        ((|lambda| |List| (|Integer|)) ($ |List| (|Matrix| (|Integer|))))
        (SPROG
         ((|lattice| (|List| (|Integer|)))
          (|younglist| (|List| (|Matrix| (|Integer|))))
          (|ytab| (|Matrix| (|Integer|))) (#1=#:G200 NIL))
         (SEQ (LETT |younglist| NIL)
              (LETT |lattice| (SPADCALL |lambda| |lattice| NIL (QREFELT $ 29)))
              (SEQ (LETT #1# NIL) G190 (COND (#1# (GO G191)))
                   (SEQ
                    (LETT |ytab| (SPADCALL |lambda| |lattice| (QREFELT $ 33)))
                    (LETT |younglist|
                          (SPADCALL |younglist| (LIST |ytab|) (QREFELT $ 35)))
                    (EXIT
                     (LETT |lattice|
                           (SPADCALL |lambda| |lattice| 'T (QREFELT $ 29)))))
                   (LETT #1# (NULL |lattice|)) (GO G190) G191 (EXIT NIL))
              (EXIT |younglist|)))) 

(SDEFUN |SGCF;nextColeman;2L2M;9|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (C |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|vrest| #1=(|Vector| (|Integer|)))
          (|coleman| (|Matrix| (|Integer|))) (|succ| (|Vector| (|Integer|)))
          (#2=#:G216 NIL) (|i| (|NonNegativeInteger|)) (#3=#:G209 NIL)
          (|j| (|Integer|)) (#4=#:G202 NIL) (#5=#:G215 NIL) (#6=#:G201 NIL)
          (|cnull| (|Matrix| (|Integer|))) (|vzero| #1#)
          (|vnull| (|Vector| (|Integer|))) (|ncol| #7=(|NonNegativeInteger|))
          (|nrow| #7#))
         (SEQ
          (EXIT
           (SEQ (LETT |nrow| (LENGTH |beta|)) (LETT |ncol| (LENGTH |alpha|))
                (LETT |vnull| (SPADCALL NIL (QREFELT $ 37)))
                (LETT |vzero| (MAKEARR1 |ncol| 0))
                (LETT |vrest| (MAKEARR1 |ncol| 0))
                (LETT |cnull| (MAKE_MATRIX1 1 1 0))
                (LETT |coleman| (SPADCALL C (QREFELT $ 38)))
                (COND
                 ((SPADCALL |coleman| |cnull| (QREFELT $ 39))
                  (SEQ
                   (LETT |i|
                         (PROG1 (LETT #6# (- |nrow| 1))
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#)))
                   (LETT |vrest|
                         (SPADCALL (SPADCALL |coleman| |i| (QREFELT $ 40))
                                   (SPADCALL |coleman| |nrow| (QREFELT $ 40))
                                   (QREFELT $ 41)))
                   (LETT |succ|
                         (SPADCALL |vrest|
                                   (SPADCALL |coleman| |i| (QREFELT $ 40))
                                   (SPADCALL |beta| |i| (QREFELT $ 18))
                                   (QREFELT $ 42)))
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |succ| |vnull| (QREFELT $ 43)))
                          (GO G191)))
                        (SEQ
                         (COND
                          ((EQL |i| 1)
                           (PROGN (LETT #5# |cnull|) (GO #8=#:G214))))
                         (LETT |i|
                               (PROG1 (LETT #4# (- |i| 1))
                                 (|check_subtype2| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #4#)))
                         (LETT |vrest|
                               (SPADCALL |vrest|
                                         (SPADCALL |coleman| |i|
                                                   (QREFELT $ 40))
                                         (QREFELT $ 41)))
                         (EXIT
                          (LETT |succ|
                                (SPADCALL |vrest|
                                          (SPADCALL |coleman| |i|
                                                    (QREFELT $ 40))
                                          (SPADCALL |beta| |i| (QREFELT $ 18))
                                          (QREFELT $ 42)))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |j| |i|)
                   (LETT |coleman|
                         (SPADCALL |coleman| |i| |succ| (QREFELT $ 44)))
                   (EXIT
                    (LETT |vrest|
                          (SPADCALL |vrest|
                                    (SPADCALL |coleman| |i| (QREFELT $ 40))
                                    (QREFELT $ 45))))))
                 ('T
                  (SEQ (LETT |vrest| (SPADCALL |alpha| (QREFELT $ 37)))
                       (LETT |coleman| (MAKE_MATRIX1 |nrow| |ncol| 0))
                       (EXIT (LETT |j| 0)))))
                (SEQ
                 (LETT |i|
                       (PROG1 (LETT #3# (+ |j| 1))
                         (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #3#)))
                 (LETT #2# (- |nrow| 1)) G190 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |succ|
                        (SPADCALL |vrest| |vnull|
                                  (SPADCALL |beta| |i| (QREFELT $ 18))
                                  (QREFELT $ 42)))
                  (LETT |coleman|
                        (SPADCALL |coleman| |i| |succ| (QREFELT $ 44)))
                  (EXIT
                   (LETT |vrest| (SPADCALL |vrest| |succ| (QREFELT $ 45)))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |coleman| |nrow| |vrest| (QREFELT $ 44)))))
          #8# (EXIT #5#)))) 

(SDEFUN |SGCF;nextPartition;2VIV;10|
        ((|gamma| |Vector| (|Integer|)) (|part| |Vector| (|Integer|))
         (|number| |Integer|) ($ |Vector| (|Integer|)))
        (SPADCALL (SPADCALL |gamma| (QREFELT $ 21)) |part| |number|
                  (QREFELT $ 47))) 

(SDEFUN |SGCF;nextPartition;LVIV;11|
        ((|gamma| |List| (|Integer|)) (|part| |Vector| (|Integer|))
         (|number| |Integer|) ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G230 NIL) (|k| NIL) (|j| (|NonNegativeInteger|))
          (|sum| (|Integer|)) (|i| (|NonNegativeInteger|)) (#2=#:G229 NIL)
          (|vnull| (|Vector| (|Integer|))) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |gamma|)) (LETT |vnull| (MAKE-ARRAY 0))
                (COND
                 ((SPADCALL |part| |vnull| (QREFELT $ 48))
                  (SEQ (LETT |i| 2)
                       (LETT |sum| (SPADCALL |part| 1 (QREFELT $ 25)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((EQL (SPADCALL |part| |i| (QREFELT $ 25))
                                      (SPADCALL |gamma| |i| (QREFELT $ 18)))
                                 'T)
                                ('T (EQL |sum| 0))))
                              (GO G191)))
                            (SEQ
                             (LETT |sum|
                                   (+ |sum|
                                      (SPADCALL |part| |i| (QREFELT $ 25))))
                             (LETT |i| (+ |i| 1))
                             (EXIT
                              (COND
                               ((EQL |i| (+ 1 |n|))
                                (PROGN (LETT #2# |vnull|) (GO #3=#:G228))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |sum| (- |sum| 1))
                       (EXIT
                        (SPADCALL |part| |i|
                                  (+ (SPADCALL |part| |i| (QREFELT $ 25)) 1)
                                  (QREFELT $ 20)))))
                 ('T
                  (SEQ (LETT |sum| |number|) (LETT |part| (MAKEARR1 |n| 0))
                       (EXIT (LETT |i| (+ 1 |n|))))))
                (LETT |j| 1)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |sum| (SPADCALL |gamma| |j| (QREFELT $ 18))
                                  (QREFELT $ 10)))
                       (GO G191)))
                     (SEQ
                      (SPADCALL |part| |j|
                                (SPADCALL |gamma| |j| (QREFELT $ 18))
                                (QREFELT $ 20))
                      (LETT |sum|
                            (- |sum| (SPADCALL |gamma| |j| (QREFELT $ 18))))
                      (EXIT (LETT |j| (+ |j| 1))))
                     NIL (GO G190) G191 (EXIT NIL))
                (SPADCALL |part| |j| |sum| (QREFELT $ 20))
                (SEQ (LETT |k| (+ |j| 1)) (LETT #1# (- |i| 1)) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ (EXIT (SPADCALL |part| |k| 0 (QREFELT $ 20))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT |part|)))
          #3# (EXIT #2#)))) 

(SDEFUN |SGCF;inverseColeman;2LML;12|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (C |Matrix| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG
         ((|pi| (|List| (|Integer|))) (#1=#:G242 NIL) (|k| NIL) (#2=#:G241 NIL)
          (|i| NIL) (#3=#:G240 NIL) (|j| NIL) (|sum| (|Integer|))
          (#4=#:G239 NIL) (|help| (|Vector| (|Integer|)))
          (|ncol| #5=(|NonNegativeInteger|)) (|nrow| #5#))
         (SEQ (LETT |pi| NIL) (LETT |nrow| (LENGTH |beta|))
              (LETT |ncol| (LENGTH |alpha|)) (LETT |help| (MAKEARR1 |nrow| 0))
              (LETT |sum| 1)
              (SEQ (LETT |i| 1) (LETT #4# |nrow|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (SPADCALL |help| |i| |sum| (QREFELT $ 20))
                        (EXIT
                         (LETT |sum|
                               (+ |sum|
                                  (SPADCALL |beta| |i| (QREFELT $ 18))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |j| 1) (LETT #3# |ncol|) G190
                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# |nrow|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 2)
                                 (LETT #1#
                                       (+ 1
                                          (SPADCALL C |i| |j| (QREFELT $ 49))))
                                 G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                 (SEQ
                                  (LETT |pi|
                                        (SPADCALL |pi|
                                                  (SPADCALL
                                                   (SPADCALL |help| |i|
                                                             (QREFELT $ 25))
                                                   (QREFELT $ 13))
                                                  (QREFELT $ 14)))
                                  (EXIT
                                   (SPADCALL |help| |i|
                                             (+
                                              (SPADCALL |help| |i|
                                                        (QREFELT $ 25))
                                              1)
                                             (QREFELT $ 20))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |pi|)))) 

(SDEFUN |SGCF;coleman;3LM;13|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (|pi| |List| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G260 NIL) (|j| NIL) (|betasum| #2=(|NonNegativeInteger|))
          (#3=#:G252 NIL) (|help| (|List| (|Integer|))) (#4=#:G250 NIL)
          (#5=#:G259 NIL) (|i| NIL) (|temp| (|List| (|List| (|Integer|))))
          (|alphasum| #2#) (#6=#:G246 NIL) (#7=#:G244 NIL) (#8=#:G258 NIL)
          (|colematrix| (|Matrix| (|Integer|)))
          (|ncol| #9=(|NonNegativeInteger|)) (|nrow| #9#))
         (SEQ (LETT |nrow| (LENGTH |beta|)) (LETT |ncol| (LENGTH |alpha|))
              (LETT |temp| NIL) (LETT |help| NIL)
              (LETT |colematrix| (MAKE_MATRIX1 |nrow| |ncol| 0))
              (LETT |betasum| 0) (LETT |alphasum| 0)
              (SEQ (LETT |i| 1) (LETT #8# |ncol|) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ (LETT |help| NIL)
                        (SEQ (LETT |j| (SPADCALL |alpha| |i| (QREFELT $ 18)))
                             G190 (COND ((< |j| 1) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |help|
                                     (CONS
                                      (SPADCALL |pi|
                                                (+
                                                 (PROG1 (LETT #7# |j|)
                                                   (|check_subtype2| (>= #7# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #7#))
                                                 |alphasum|)
                                                (QREFELT $ 18))
                                      |help|))))
                             (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                        (LETT |alphasum|
                              (PROG1
                                  (LETT #6#
                                        (+ |alphasum|
                                           (SPADCALL |alpha| |i|
                                                     (QREFELT $ 18))))
                                (|check_subtype2| (>= #6# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #6#)))
                        (EXIT
                         (LETT |temp|
                               (SPADCALL |temp|
                                         (SPADCALL |help| (QREFELT $ 52))
                                         (QREFELT $ 53)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #5# |nrow|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ (LETT |help| NIL)
                        (SEQ (LETT |j| (SPADCALL |beta| |i| (QREFELT $ 18)))
                             G190 (COND ((< |j| 1) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |help|
                                     (CONS
                                      (+
                                       (PROG1 (LETT #4# |j|)
                                         (|check_subtype2| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #4#))
                                       |betasum|)
                                      |help|))))
                             (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                        (LETT |betasum|
                              (PROG1
                                  (LETT #3#
                                        (+ |betasum|
                                           (SPADCALL |beta| |i|
                                                     (QREFELT $ 18))))
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#)))
                        (EXIT
                         (SEQ (LETT |j| 1) (LETT #1# |ncol|) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |colematrix| |i| |j|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |help| (QREFELT $ 55))
                                            (SPADCALL
                                             (SPADCALL |temp| |j|
                                                       (QREFELT $ 56))
                                             (QREFELT $ 55))
                                            (QREFELT $ 57))
                                           (QREFELT $ 58))
                                          (QREFELT $ 32))))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |colematrix|)))) 

(DECLAIM (NOTINLINE |SymmetricGroupCombinatoricFunctions;|)) 

(DEFUN |SymmetricGroupCombinatoricFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G262)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|SymmetricGroupCombinatoricFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|SymmetricGroupCombinatoricFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|SymmetricGroupCombinatoricFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SymmetricGroupCombinatoricFunctions|)))))))))) 

(DEFUN |SymmetricGroupCombinatoricFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SymmetricGroupCombinatoricFunctions|))
          (LETT $ (GETREFV 60))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|SymmetricGroupCombinatoricFunctions| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SymmetricGroupCombinatoricFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|)
              (|IntegerCombinatoricFunctions| 6) (0 . |binomial|) (|Boolean|)
              (6 . >) |SGCF;numberOfImproperPartitions;3I;2| (|List| 6)
              (12 . |list|) (17 . |append|)
              |SGCF;unrankImproperPartitions0;3IL;3| (23 . ~=)
              |SGCF;subSet;3IL;5| (29 . |elt|) (|Vector| 6) (35 . |setelt!|)
              (42 . |entries|) |SGCF;unrankImproperPartitions1;3IL;4|
              (|PartitionsAndPermutations|) (47 . |conjugate|) (52 . |elt|)
              (|NonNegativeInteger|) (58 . >) (64 . |setelt!|)
              |SGCF;nextLatticePermutation;2LBL;6| (71 . |maxIndex|)
              (|Matrix| 6) (76 . |setelt!|) |SGCF;makeYoungTableau;2LM;7|
              (|List| 31) (84 . |append|) |SGCF;listYoungTableaus;LL;8|
              (90 . |vector|) (95 . |copy|) (100 . ~=) (106 . |row|) (112 . +)
              |SGCF;nextPartition;2VIV;10| (118 . =) (124 . |setRow!|)
              (131 . -) |SGCF;nextColeman;2L2M;9| |SGCF;nextPartition;LVIV;11|
              (137 . ~=) (143 . |elt|) |SGCF;inverseColeman;2LML;12|
              (|List| 12) (150 . |list|) (155 . |append|) (|Set| 6)
              (161 . |set|) (166 . |elt|) (172 . |intersect|) (178 . |#|)
              |SGCF;coleman;3LM;13|)
           '#(|unrankImproperPartitions1| 183 |unrankImproperPartitions0| 190
              |subSet| 197 |numberOfImproperPartitions| 204 |nextPartition| 210
              |nextLatticePermutation| 224 |nextColeman| 231 |makeYoungTableau|
              238 |listYoungTableaus| 244 |inverseColeman| 249 |coleman| 256)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|coleman|
                                 ((|Matrix| (|Integer|)) (|List| (|Integer|))
                                  (|List| (|Integer|)) (|List| (|Integer|))))
                                T)
                              '((|inverseColeman|
                                 ((|List| (|Integer|)) (|List| (|Integer|))
                                  (|List| (|Integer|)) (|Matrix| (|Integer|))))
                                T)
                              '((|listYoungTableaus|
                                 ((|List| (|Matrix| (|Integer|)))
                                  (|List| (|Integer|))))
                                T)
                              '((|makeYoungTableau|
                                 ((|Matrix| (|Integer|)) (|List| (|Integer|))
                                  (|List| (|Integer|))))
                                T)
                              '((|nextColeman|
                                 ((|Matrix| (|Integer|)) (|List| (|Integer|))
                                  (|List| (|Integer|)) (|Matrix| (|Integer|))))
                                T)
                              '((|nextLatticePermutation|
                                 ((|List| (|Integer|)) (|List| (|Integer|))
                                  (|List| (|Integer|)) (|Boolean|)))
                                T)
                              '((|nextPartition|
                                 ((|Vector| (|Integer|)) (|Vector| (|Integer|))
                                  (|Vector| (|Integer|)) (|Integer|)))
                                T)
                              '((|nextPartition|
                                 ((|Vector| (|Integer|)) (|List| (|Integer|))
                                  (|Vector| (|Integer|)) (|Integer|)))
                                T)
                              '((|numberOfImproperPartitions|
                                 ((|Integer|) (|Integer|) (|Integer|)))
                                T)
                              '((|subSet|
                                 ((|List| (|Integer|)) (|Integer|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|unrankImproperPartitions0|
                                 ((|List| (|Integer|)) (|Integer|) (|Integer|)
                                  (|Integer|)))
                                T)
                              '((|unrankImproperPartitions1|
                                 ((|List| (|Integer|)) (|Integer|) (|Integer|)
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 59
                                            '(2 7 6 6 6 8 2 6 9 0 0 10 1 12 0 6
                                              13 2 12 0 0 0 14 2 6 9 0 0 16 2
                                              12 6 0 6 18 3 19 6 0 6 6 20 1 19
                                              12 0 21 1 23 12 12 24 2 19 6 0 6
                                              25 2 26 9 0 0 27 3 12 6 0 6 6 28
                                              1 12 6 0 30 4 31 6 0 6 6 6 32 2
                                              34 0 0 0 35 1 19 0 12 37 1 31 0 0
                                              38 2 31 9 0 0 39 2 31 19 0 6 40 2
                                              19 0 0 0 41 2 19 9 0 0 43 3 31 0
                                              0 6 19 44 2 19 0 0 0 45 2 19 9 0
                                              0 48 3 31 6 0 6 6 49 1 51 0 12 52
                                              2 51 0 0 0 53 1 54 0 12 55 2 51
                                              12 0 6 56 2 54 0 0 0 57 1 54 26 0
                                              58 3 0 12 6 6 6 22 3 0 12 6 6 6
                                              15 3 0 12 6 6 6 17 2 0 6 6 6 11 3
                                              0 19 19 19 6 42 3 0 19 12 19 6 47
                                              3 0 12 12 12 9 29 3 0 31 12 12 31
                                              46 2 0 31 12 12 33 1 0 34 12 36 3
                                              0 12 12 12 31 50 3 0 31 12 12 12
                                              59)))))
           '|lookupComplete|)) 

(MAKEPROP '|SymmetricGroupCombinatoricFunctions| 'NILADIC T) 
