
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
                        (LETT |s| 0
                              . #2=(|SGCF;numberOfImproperPartitionsInternal|))
                        (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (+ |s|
                                        (|SGCF;numberOfImproperPartitionsInternal|
                                         |i| |m| (- |cm| 1) $))
                                     . #2#)))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |SGCF;numberOfImproperPartitions;3I;2|
        ((|n| |Integer|) (|m| |Integer|) ($ |Integer|))
        (SPROG ((|s| (|Integer|)) (|i| NIL) (#1=#:G121 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR (< |n| 0) (< |m| 1))
                    (PROGN
                     (LETT #1# 0 . #2=(|SGCF;numberOfImproperPartitions;3I;2|))
                     (GO #3=#:G120))))
                  (COND
                   ((OR (EQL |m| 1) (EQL |n| 0))
                    (PROGN (LETT #1# 1 . #2#) (GO #3#))))
                  (LETT |s| 0 . #2#)
                  (SEQ (LETT |i| 0 . #2#) G190
                       (COND ((|greater_SI| |i| |n|) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |s|
                               (+ |s|
                                  (SPADCALL (- |n| |i|) (- |m| 1)
                                            (QREFELT $ 11)))
                               . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |s|)))
                #3# (EXIT #1#)))) 

(SDEFUN |SGCF;unrankImproperPartitions0;3IL;3|
        ((|n| |Integer|) (|m| |Integer|) (|k| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((|l| (|List| (|Integer|))) (#1=#:G130 NIL) (|s| #2=(|Integer|))
          (|sOld| #2#) (|y| NIL) (#3=#:G131 NIL) (|t| NIL))
         (SEQ (LETT |l| NIL . #4=(|SGCF;unrankImproperPartitions0;3IL;3|))
              (EXIT
               (COND
                ((< |k| 0) (|error| "counting of partitions is started at 0"))
                ((>= |k| (SPADCALL |n| |m| (QREFELT $ 11)))
                 (|error| "there are not so many partitions"))
                ('T
                 (SEQ
                  (SEQ (LETT |t| 0 . #4#) (LETT #3# (- |m| 2) . #4#) G190
                       (COND ((|greater_SI| |t| #3#) (GO G191)))
                       (SEQ (LETT |s| 0 . #4#)
                            (SEQ
                             (EXIT
                              (SEQ (LETT |y| 0 . #4#) G190
                                   (COND ((|greater_SI| |y| |n|) (GO G191)))
                                   (SEQ (LETT |sOld| |s| . #4#)
                                        (LETT |s|
                                              (+ |s|
                                                 (SPADCALL (- |n| |y|)
                                                           (- (- |m| |t|) 1)
                                                           (QREFELT $ 11)))
                                              . #4#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |s| |k| (QREFELT $ 10))
                                           (PROGN
                                            (LETT #1# |$NoValue| . #4#)
                                            (GO #5=#:G123))))))
                                   (LETT |y| (|inc_SI| |y|) . #4#) (GO G190)
                                   G191 (EXIT NIL)))
                             #5# (EXIT #1#))
                            (LETT |l|
                                  (APPEND |l| (SPADCALL |y| (QREFELT $ 13)))
                                  . #4#)
                            (LETT |k| (- |k| |sOld|) . #4#)
                            (EXIT (LETT |n| (- |n| |y|) . #4#)))
                       (LETT |t| (|inc_SI| |t|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |l| (APPEND |l| (SPADCALL |n| (QREFELT $ 13))) . #4#)
                  (EXIT |l|)))))))) 

(SDEFUN |SGCF;unrankImproperPartitions1;3IL;4|
        ((|n| |Integer|) (|m| . #1=(|Integer|)) (|k| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G144 NIL) (|i| NIL) (|nonZeroPos| (|List| (|Integer|)))
          (|nonZeros| (|List| (|Integer|))) (#3=#:G143 NIL)
          (|s| #4=(|Integer|)) (|sOld| #4#) (|y| NIL) (|cm| #1#)
          (|partition| (|Vector| (|Integer|))) (#5=#:G133 NIL))
         (SEQ
          (LETT |nonZeros| NIL . #6=(|SGCF;unrankImproperPartitions1;3IL;4|))
          (LETT |partition|
                (MAKEARR1
                 (PROG1 (LETT #5# |m| . #6#)
                   (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                 0)
                . #6#)
          (EXIT
           (COND
            ((OR (< |k| 0) (>= |k| (SPADCALL |n| |m| (QREFELT $ 11))))
             |nonZeros|)
            ('T
             (SEQ (LETT |cm| |m| . #6#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |n| 0 (QREFELT $ 15))) (GO G191)))
                       (SEQ (LETT |s| 0 . #6#) (LETT |cm| (- |cm| 1) . #6#)
                            (SEQ
                             (EXIT
                              (SEQ (LETT |y| |n| . #6#) G190
                                   (COND ((< |y| 1) (GO G191)))
                                   (SEQ (LETT |sOld| |s| . #6#)
                                        (LETT |s|
                                              (+ |s|
                                                 (|SGCF;numberOfImproperPartitionsInternal|
                                                  (- |n| |y|) |m| |cm| $))
                                              . #6#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |s| |k| (QREFELT $ 10))
                                           (PROGN
                                            (LETT #3# |$NoValue| . #6#)
                                            (GO #7=#:G135))))))
                                   (LETT |y| (+ |y| -1) . #6#) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #3#))
                            (LETT |nonZeros|
                                  (APPEND |nonZeros|
                                          (SPADCALL |y| (QREFELT $ 13)))
                                  . #6#)
                            (LETT |k| (- |k| |sOld|) . #6#)
                            (EXIT (LETT |n| (- |n| |y|) . #6#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |nonZeroPos|
                        (REVERSE
                         (SPADCALL |m| (- |m| |cm|) |k| (QREFELT $ 16)))
                        . #6#)
                  (SEQ (LETT |i| 1 . #6#) (LETT #2# (- |m| |cm|) . #6#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |partition|
                                   (+ 1
                                      (SPADCALL |nonZeroPos| |i|
                                                (QREFELT $ 17)))
                                   (SPADCALL |nonZeros| |i| (QREFELT $ 17))
                                   (QREFELT $ 19))))
                       (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (SPADCALL |partition| (QREFELT $ 20)))))))))) 

(SDEFUN |SGCF;subSet;3IL;5|
        ((|n| |Integer|) (|m| . #1=(|Integer|)) (|k| . #2=(|Integer|))
         ($ |List| (|Integer|)))
        (SPROG
         ((|s| #1#) (|mm| #2#) (|l| (|List| (|Integer|))) (#3=#:G153 NIL)
          (#4=#:G155 NIL) (|y| NIL) (#5=#:G154 NIL) (|t| NIL)
          (|bin| (|Integer|)))
         (SEQ
          (COND
           ((OR (OR (OR (< |k| 0) (< |n| 0)) (< |m| 0))
                (SPADCALL |m| |n| (QREFELT $ 10)))
            (|error| "improper argument to subSet"))
           ('T
            (SEQ
             (LETT |bin| (SPADCALL |n| |m| (QREFELT $ 8))
                   . #6=(|SGCF;subSet;3IL;5|))
             (EXIT
              (COND ((>= |k| |bin|) (|error| "there are not so many subsets"))
                    (#7='T
                     (SEQ (LETT |l| NIL . #6#)
                          (EXIT
                           (COND ((EQL |n| 0) |l|)
                                 (#7#
                                  (SEQ (LETT |mm| |k| . #6#)
                                       (LETT |s| |m| . #6#)
                                       (SEQ (LETT |t| 0 . #6#)
                                            (LETT #5# (- |m| 1) . #6#) G190
                                            (COND
                                             ((|greater_SI| |t| #5#)
                                              (GO G191)))
                                            (SEQ
                                             (SEQ
                                              (EXIT
                                               (SEQ (LETT |y| (- |s| 1) . #6#)
                                                    (LETT #4# (+ |n| 1) . #6#)
                                                    G190
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
                                                         (LETT #3# |$NoValue|
                                                               . #6#)
                                                         (GO #8=#:G146))))))
                                                    (LETT |y| (+ |y| 1) . #6#)
                                                    (GO G190) G191 (EXIT NIL)))
                                              #8# (EXIT #3#))
                                             (LETT |l|
                                                   (APPEND |l|
                                                           (SPADCALL (- |y| 1)
                                                                     (QREFELT $
                                                                              13)))
                                                   . #6#)
                                             (LETT |mm|
                                                   (- |mm|
                                                      (SPADCALL (- |y| 1) |s|
                                                                (QREFELT $ 8)))
                                                   . #6#)
                                             (EXIT (LETT |s| (- |s| 1) . #6#)))
                                            (LETT |t| (|inc_SI| |t|) . #6#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT |l|))))))))))))))) 

(SDEFUN |SGCF;nextLatticePermutation;2LBL;6|
        ((|lambda| |List| #1=(|Integer|)) (|lattP| |List| (|Integer|))
         (|constructNotFirst| |Boolean|) ($ |List| (|Integer|)))
        (SPROG
         ((#2=#:G185 NIL) (|l| NIL) (|i| NIL)
          (|rightPosition| #3=(|NonNegativeInteger|)) (#4=#:G174 NIL)
          (|j| (|NonNegativeInteger|)) (|ready| (|Boolean|))
          (|leftEntry| #5=(|NonNegativeInteger|)) (#6=#:G166 NIL)
          (|rightEntry| #5#) (#7=#:G184 NIL) (#8=#:G165 NIL)
          (|help| (|Vector| (|Integer|))) (|n| #3#) (#9=#:G164 NIL)
          (#10=#:G162 NIL) (#11=#:G161 #1#) (#12=#:G163 #1#) (#13=#:G183 NIL)
          (#14=#:G104 NIL) (|rows| (|NonNegativeInteger|)) (#15=#:G157 NIL)
          (|columns| (|NonNegativeInteger|)) (#16=#:G156 NIL)
          (|lprime| (|List| (|Integer|))))
         (SEQ
          (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 23))
                . #17=(|SGCF;nextLatticePermutation;2LBL;6|))
          (LETT |columns|
                (PROG1 (LETT #16# (|SPADfirst| |lambda|) . #17#)
                  (|check_subtype| (>= #16# 0) '(|NonNegativeInteger|) #16#))
                . #17#)
          (LETT |rows|
                (PROG1 (LETT #15# (|SPADfirst| |lprime|) . #17#)
                  (|check_subtype| (>= #15# 0) '(|NonNegativeInteger|) #15#))
                . #17#)
          (LETT |n|
                (PROG1
                    (LETT #9#
                          (PROGN
                           (LETT #10# NIL . #17#)
                           (SEQ (LETT #14# NIL . #17#)
                                (LETT #13# |lambda| . #17#) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN
                                       (LETT #14# (CAR #13#) . #17#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #12# #14# . #17#)
                                   (COND
                                    (#10# (LETT #11# (+ #11# #12#) . #17#))
                                    ('T
                                     (PROGN
                                      (LETT #11# #12# . #17#)
                                      (LETT #10# 'T . #17#)))))))
                                (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#10# #11#) (#18='T 0)))
                          . #17#)
                  (|check_subtype| (>= #9# 0) '(|NonNegativeInteger|) #9#))
                . #17#)
          (EXIT
           (COND
            (|constructNotFirst|
             (SEQ (LETT |help| (MAKEARR1 |columns| 0) . #17#)
                  (LETT |rightPosition| |n| . #17#)
                  (LETT |leftEntry|
                        (PROG1
                            (LETT #8#
                                  (SPADCALL |lattP| |rightPosition|
                                            (QREFELT $ 17))
                                  . #17#)
                          (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|)
                                           #8#))
                        . #17#)
                  (LETT |ready| 'NIL . #17#)
                  (SEQ (LETT #7# NIL . #17#) G190 (COND (#7# (GO G191)))
                       (SEQ (LETT |rightEntry| |leftEntry| . #17#)
                            (LETT |leftEntry|
                                  (PROG1
                                      (LETT #6#
                                            (SPADCALL |lattP|
                                                      (- |rightPosition| 1)
                                                      (QREFELT $ 17))
                                            . #17#)
                                    (|check_subtype| (>= #6# 0)
                                                     '(|NonNegativeInteger|)
                                                     #6#))
                                  . #17#)
                            (SPADCALL |help| |rightEntry|
                                      (+
                                       (SPADCALL |help| |rightEntry|
                                                 (QREFELT $ 24))
                                       1)
                                      (QREFELT $ 19))
                            (COND
                             ((SPADCALL |rightEntry| |leftEntry|
                                        (QREFELT $ 26))
                              (COND
                               ((SPADCALL
                                 (-
                                  (SPADCALL |lprime| |leftEntry|
                                            (QREFELT $ 17))
                                  (SPADCALL |help| |leftEntry| (QREFELT $ 24)))
                                 (+
                                  (-
                                   (SPADCALL |lprime| |rightEntry|
                                             (QREFELT $ 17))
                                   (SPADCALL |help| |rightEntry|
                                             (QREFELT $ 24)))
                                  1)
                                 (QREFELT $ 10))
                                (SEQ (LETT |ready| 'T . #17#)
                                     (LETT |j| (+ |leftEntry| 1) . #17#)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (COND
                                              ((EQL
                                                (SPADCALL |help| |j|
                                                          (QREFELT $ 24))
                                                0)
                                               'T)
                                              ('T
                                               (<
                                                (-
                                                 (SPADCALL |lprime| |leftEntry|
                                                           (QREFELT $ 17))
                                                 (SPADCALL |lprime| |j|
                                                           (QREFELT $ 17)))
                                                (+
                                                 (-
                                                  (SPADCALL |help| |leftEntry|
                                                            (QREFELT $ 24))
                                                  (SPADCALL |help| |j|
                                                            (QREFELT $ 24)))
                                                 2)))))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT (LETT |j| (+ |j| 1) . #17#)))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (SPADCALL |lattP| (- |rightPosition| 1)
                                               |j| (QREFELT $ 27))
                                     (SPADCALL |help| |j|
                                               (-
                                                (SPADCALL |help| |j|
                                                          (QREFELT $ 24))
                                                1)
                                               (QREFELT $ 19))
                                     (SPADCALL |help| |leftEntry|
                                               (+
                                                (SPADCALL |help| |leftEntry|
                                                          (QREFELT $ 24))
                                                1)
                                               (QREFELT $ 19))
                                     (EXIT
                                      (SEQ (LETT |l| |rightPosition| . #17#)
                                           G190 (COND ((> |l| |n|) (GO G191)))
                                           (SEQ (LETT |j| 0 . #17#)
                                                (SEQ G190
                                                     (COND
                                                      ((NULL
                                                        (EQL
                                                         (SPADCALL |help|
                                                                   (+ 1 |j|)
                                                                   (QREFELT $
                                                                            24))
                                                         0))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |j| (+ |j| 1)
                                                             . #17#)))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL))
                                                (SPADCALL |lattP| |l| (+ |j| 1)
                                                          (QREFELT $ 27))
                                                (EXIT
                                                 (SPADCALL |help| (+ 1 |j|)
                                                           (-
                                                            (SPADCALL |help|
                                                                      (+ 1 |j|)
                                                                      (QREFELT
                                                                       $ 24))
                                                            1)
                                                           (QREFELT $ 19))))
                                           (LETT |l| (+ |l| 1) . #17#)
                                           (GO G190) G191 (EXIT NIL))))))))
                            (LETT |rightPosition|
                                  (PROG1
                                      (LETT #4# (- |rightPosition| 1) . #17#)
                                    (|check_subtype| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     #4#))
                                  . #17#)
                            (EXIT
                             (COND
                              ((EQL |rightPosition| 1)
                               (LETT |constructNotFirst| 'NIL . #17#)))))
                       (LETT #7#
                             (COND ((OR |ready| (NULL |constructNotFirst|)) 'T)
                                   ('T 'NIL))
                             . #17#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (COND (|constructNotFirst| |lattP|) (#18# NIL)))))
            (#18#
             (SEQ (LETT |lattP| NIL . #17#)
                  (SEQ (LETT |i| |columns| . #17#) G190
                       (COND ((< |i| 1) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |l| 1 . #17#)
                              (LETT #2# (SPADCALL |lprime| |i| (QREFELT $ 17))
                                    . #17#)
                              G190 (COND ((|greater_SI| |l| #2#) (GO G191)))
                              (SEQ
                               (EXIT (LETT |lattP| (CONS |i| |lattP|) . #17#)))
                              (LETT |l| (|inc_SI| |l|) . #17#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (+ |i| -1) . #17#) (GO G190) G191 (EXIT NIL))
                  (EXIT |lattP|)))))))) 

(SDEFUN |SGCF;makeYoungTableau;2LM;7|
        ((|lambda| |List| (|Integer|)) (|gitter| |List| (|Integer|))
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G192 NIL) (|l| NIL)
          (|help| (|Vector| (|Integer|))) (|ytab| (|Matrix| (|Integer|)))
          (|rows| (|NonNegativeInteger|)) (#2=#:G187 NIL)
          (|columns| (|NonNegativeInteger|)) (#3=#:G186 NIL)
          (|lprime| (|List| (|Integer|))))
         (SEQ
          (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 23))
                . #4=(|SGCF;makeYoungTableau;2LM;7|))
          (LETT |columns|
                (PROG1 (LETT #3# (|SPADfirst| |lambda|) . #4#)
                  (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                . #4#)
          (LETT |rows|
                (PROG1 (LETT #2# (|SPADfirst| |lprime|) . #4#)
                  (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                . #4#)
          (LETT |ytab| (MAKE_MATRIX1 |rows| |columns| 0) . #4#)
          (LETT |help| (MAKEARR1 |columns| 1) . #4#) (LETT |i| -1 . #4#)
          (LETT |j| 0 . #4#)
          (SEQ (LETT |l| 1 . #4#)
               (LETT #1# (SPADCALL |gitter| (QREFELT $ 29)) . #4#) G190
               (COND ((|greater_SI| |l| #1#) (GO G191)))
               (SEQ (LETT |j| (SPADCALL |gitter| |l| (QREFELT $ 17)) . #4#)
                    (LETT |i| (+ |i| 1) . #4#)
                    (SPADCALL |ytab| (SPADCALL |help| |j| (QREFELT $ 24)) |j|
                              |i| (QREFELT $ 31))
                    (EXIT
                     (SPADCALL |help| |j|
                               (+ (SPADCALL |help| |j| (QREFELT $ 24)) 1)
                               (QREFELT $ 19))))
               (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |ytab|)))) 

(SDEFUN |SGCF;listYoungTableaus;LL;8|
        ((|lambda| |List| (|Integer|)) ($ |List| (|Matrix| (|Integer|))))
        (SPROG
         ((|lattice| (|List| (|Integer|)))
          (|younglist| (|List| (|Matrix| (|Integer|))))
          (|ytab| (|Matrix| (|Integer|))) (#1=#:G197 NIL))
         (SEQ (LETT |younglist| NIL . #2=(|SGCF;listYoungTableaus;LL;8|))
              (LETT |lattice| (SPADCALL |lambda| |lattice| 'NIL (QREFELT $ 28))
                    . #2#)
              (SEQ (LETT #1# NIL . #2#) G190 (COND (#1# (GO G191)))
                   (SEQ
                    (LETT |ytab| (SPADCALL |lambda| |lattice| (QREFELT $ 32))
                          . #2#)
                    (LETT |younglist| (APPEND |younglist| (LIST |ytab|)) . #2#)
                    (EXIT
                     (LETT |lattice|
                           (SPADCALL |lambda| |lattice| 'T (QREFELT $ 28))
                           . #2#)))
                   (LETT #1# (NULL |lattice|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |younglist|)))) 

(SDEFUN |SGCF;nextColeman;2L2M;9|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (C |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|vrest| #1=(|Vector| (|Integer|)))
          (|coleman| (|Matrix| (|Integer|))) (|succ| (|Vector| (|Integer|)))
          (#2=#:G213 NIL) (|i| (|NonNegativeInteger|)) (#3=#:G206 NIL)
          (|j| (|Integer|)) (#4=#:G199 NIL) (#5=#:G212 NIL) (#6=#:G198 NIL)
          (|cnull| (|Matrix| (|Integer|))) (|vzero| #1#)
          (|vnull| (|Vector| (|Integer|))) (|ncol| #7=(|NonNegativeInteger|))
          (|nrow| #7#))
         (SEQ
          (EXIT
           (SEQ (LETT |nrow| (LENGTH |beta|) . #8=(|SGCF;nextColeman;2L2M;9|))
                (LETT |ncol| (LENGTH |alpha|) . #8#)
                (LETT |vnull| (SPADCALL NIL (QREFELT $ 35)) . #8#)
                (LETT |vzero| (MAKEARR1 |ncol| 0) . #8#)
                (LETT |vrest| (MAKEARR1 |ncol| 0) . #8#)
                (LETT |cnull| (MAKE_MATRIX1 1 1 0) . #8#)
                (LETT |coleman| (SPADCALL C (QREFELT $ 36)) . #8#)
                (COND
                 ((SPADCALL |coleman| |cnull| (QREFELT $ 37))
                  (SEQ
                   (LETT |i|
                         (PROG1 (LETT #6# (- |nrow| 1) . #8#)
                           (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                            #6#))
                         . #8#)
                   (LETT |vrest|
                         (SPADCALL (SPADCALL |coleman| |i| (QREFELT $ 38))
                                   (SPADCALL |coleman| |nrow| (QREFELT $ 38))
                                   (QREFELT $ 39))
                         . #8#)
                   (LETT |succ|
                         (SPADCALL |vrest|
                                   (SPADCALL |coleman| |i| (QREFELT $ 38))
                                   (SPADCALL |beta| |i| (QREFELT $ 17))
                                   (QREFELT $ 40))
                         . #8#)
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |succ| |vnull| (QREFELT $ 41)))
                          (GO G191)))
                        (SEQ
                         (COND
                          ((EQL |i| 1)
                           (PROGN (LETT #5# |cnull| . #8#) (GO #9=#:G211))))
                         (LETT |i|
                               (PROG1 (LETT #4# (- |i| 1) . #8#)
                                 (|check_subtype| (>= #4# 0)
                                                  '(|NonNegativeInteger|) #4#))
                               . #8#)
                         (LETT |vrest|
                               (SPADCALL |vrest|
                                         (SPADCALL |coleman| |i|
                                                   (QREFELT $ 38))
                                         (QREFELT $ 39))
                               . #8#)
                         (EXIT
                          (LETT |succ|
                                (SPADCALL |vrest|
                                          (SPADCALL |coleman| |i|
                                                    (QREFELT $ 38))
                                          (SPADCALL |beta| |i| (QREFELT $ 17))
                                          (QREFELT $ 40))
                                . #8#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |j| |i| . #8#)
                   (LETT |coleman|
                         (SPADCALL |coleman| |i| |succ| (QREFELT $ 42)) . #8#)
                   (EXIT
                    (LETT |vrest|
                          (SPADCALL |vrest|
                                    (SPADCALL |coleman| |i| (QREFELT $ 38))
                                    (QREFELT $ 43))
                          . #8#))))
                 ('T
                  (SEQ (LETT |vrest| (SPADCALL |alpha| (QREFELT $ 35)) . #8#)
                       (LETT |coleman| (MAKE_MATRIX1 |nrow| |ncol| 0) . #8#)
                       (EXIT (LETT |j| 0 . #8#)))))
                (SEQ
                 (LETT |i|
                       (PROG1 (LETT #3# (+ |j| 1) . #8#)
                         (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                          #3#))
                       . #8#)
                 (LETT #2# (- |nrow| 1) . #8#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |succ|
                        (SPADCALL |vrest| |vnull|
                                  (SPADCALL |beta| |i| (QREFELT $ 17))
                                  (QREFELT $ 40))
                        . #8#)
                  (LETT |coleman|
                        (SPADCALL |coleman| |i| |succ| (QREFELT $ 42)) . #8#)
                  (EXIT
                   (LETT |vrest| (SPADCALL |vrest| |succ| (QREFELT $ 43))
                         . #8#)))
                 (LETT |i| (+ |i| 1) . #8#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |coleman| |nrow| |vrest| (QREFELT $ 42)))))
          #9# (EXIT #5#)))) 

(SDEFUN |SGCF;nextPartition;2VIV;10|
        ((|gamma| |Vector| (|Integer|)) (|part| |Vector| (|Integer|))
         (|number| |Integer|) ($ |Vector| (|Integer|)))
        (SPADCALL (SPADCALL |gamma| (QREFELT $ 20)) |part| |number|
                  (QREFELT $ 45))) 

(SDEFUN |SGCF;nextPartition;LVIV;11|
        ((|gamma| |List| (|Integer|)) (|part| |Vector| (|Integer|))
         (|number| |Integer|) ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G227 NIL) (|k| NIL) (|j| (|NonNegativeInteger|))
          (|sum| (|Integer|)) (|i| (|NonNegativeInteger|)) (#2=#:G226 NIL)
          (|vnull| (|Vector| (|Integer|))) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |gamma|) . #3=(|SGCF;nextPartition;LVIV;11|))
                (LETT |vnull| (SPADCALL NIL (QREFELT $ 35)) . #3#)
                (COND
                 ((SPADCALL |part| |vnull| (QREFELT $ 46))
                  (SEQ (LETT |i| 2 . #3#)
                       (LETT |sum| (SPADCALL |part| 1 (QREFELT $ 24)) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((EQL (SPADCALL |part| |i| (QREFELT $ 24))
                                      (SPADCALL |gamma| |i| (QREFELT $ 17)))
                                 'T)
                                ('T (EQL |sum| 0))))
                              (GO G191)))
                            (SEQ
                             (LETT |sum|
                                   (+ |sum|
                                      (SPADCALL |part| |i| (QREFELT $ 24)))
                                   . #3#)
                             (LETT |i| (+ |i| 1) . #3#)
                             (EXIT
                              (COND
                               ((EQL |i| (+ 1 |n|))
                                (PROGN
                                 (LETT #2# |vnull| . #3#)
                                 (GO #4=#:G225))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |sum| (- |sum| 1) . #3#)
                       (EXIT
                        (SPADCALL |part| |i|
                                  (+ (SPADCALL |part| |i| (QREFELT $ 24)) 1)
                                  (QREFELT $ 19)))))
                 ('T
                  (SEQ (LETT |sum| |number| . #3#)
                       (LETT |part| (MAKEARR1 |n| 0) . #3#)
                       (EXIT (LETT |i| (+ 1 |n|) . #3#)))))
                (LETT |j| 1 . #3#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |sum| (SPADCALL |gamma| |j| (QREFELT $ 17))
                                  (QREFELT $ 10)))
                       (GO G191)))
                     (SEQ
                      (SPADCALL |part| |j|
                                (SPADCALL |gamma| |j| (QREFELT $ 17))
                                (QREFELT $ 19))
                      (LETT |sum|
                            (- |sum| (SPADCALL |gamma| |j| (QREFELT $ 17)))
                            . #3#)
                      (EXIT (LETT |j| (+ |j| 1) . #3#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (SPADCALL |part| |j| |sum| (QREFELT $ 19))
                (SEQ (LETT |k| (+ |j| 1) . #3#) (LETT #1# (- |i| 1) . #3#) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ (EXIT (SPADCALL |part| |k| 0 (QREFELT $ 19))))
                     (LETT |k| (+ |k| 1) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |part|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SGCF;inverseColeman;2LML;12|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (C |Matrix| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG
         ((|pi| (|List| (|Integer|))) (#1=#:G236 NIL) (|k| NIL) (|i| NIL)
          (|j| NIL) (|sum| (|Integer|)) (|help| (|Vector| (|Integer|)))
          (|ncol| #2=(|NonNegativeInteger|)) (|nrow| #2#))
         (SEQ (LETT |pi| NIL . #3=(|SGCF;inverseColeman;2LML;12|))
              (LETT |nrow| (LENGTH |beta|) . #3#)
              (LETT |ncol| (LENGTH |alpha|) . #3#)
              (LETT |help| (MAKEARR1 |nrow| 0) . #3#) (LETT |sum| 1 . #3#)
              (SEQ (LETT |i| 1 . #3#) G190
                   (COND ((|greater_SI| |i| |nrow|) (GO G191)))
                   (SEQ (SPADCALL |help| |i| |sum| (QREFELT $ 19))
                        (EXIT
                         (LETT |sum|
                               (+ |sum| (SPADCALL |beta| |i| (QREFELT $ 17)))
                               . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |j| 1 . #3#) G190
                   (COND ((|greater_SI| |j| |ncol|) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1 . #3#) G190
                          (COND ((|greater_SI| |i| |nrow|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 2 . #3#)
                                 (LETT #1#
                                       (+ 1
                                          (SPADCALL C |i| |j| (QREFELT $ 47)))
                                       . #3#)
                                 G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                 (SEQ
                                  (LETT |pi|
                                        (APPEND |pi|
                                                (SPADCALL
                                                 (SPADCALL |help| |i|
                                                           (QREFELT $ 24))
                                                 (QREFELT $ 13)))
                                        . #3#)
                                  (EXIT
                                   (SPADCALL |help| |i|
                                             (+
                                              (SPADCALL |help| |i|
                                                        (QREFELT $ 24))
                                              1)
                                             (QREFELT $ 19))))
                                 (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |pi|)))) 

(SDEFUN |SGCF;coleman;3LM;13|
        ((|alpha| |List| (|Integer|)) (|beta| |List| (|Integer|))
         (|pi| |List| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|j| NIL) (|betasum| #1=(|NonNegativeInteger|)) (#2=#:G246 NIL)
          (|help| (|List| (|Integer|))) (#3=#:G244 NIL) (|i| NIL)
          (|temp| (|List| (|List| (|Integer|)))) (|alphasum| #1#)
          (#4=#:G240 NIL) (#5=#:G238 NIL) (|colematrix| (|Matrix| (|Integer|)))
          (|ncol| #6=(|NonNegativeInteger|)) (|nrow| #6#))
         (SEQ (LETT |nrow| (LENGTH |beta|) . #7=(|SGCF;coleman;3LM;13|))
              (LETT |ncol| (LENGTH |alpha|) . #7#) (LETT |temp| NIL . #7#)
              (LETT |help| NIL . #7#)
              (LETT |colematrix| (MAKE_MATRIX1 |nrow| |ncol| 0) . #7#)
              (LETT |betasum| 0 . #7#) (LETT |alphasum| 0 . #7#)
              (SEQ (LETT |i| 1 . #7#) G190
                   (COND ((|greater_SI| |i| |ncol|) (GO G191)))
                   (SEQ (LETT |help| NIL . #7#)
                        (SEQ
                         (LETT |j| (SPADCALL |alpha| |i| (QREFELT $ 17)) . #7#)
                         G190 (COND ((< |j| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |help|
                                 (CONS
                                  (SPADCALL |pi|
                                            (+
                                             (PROG1 (LETT #5# |j| . #7#)
                                               (|check_subtype| (>= #5# 0)
                                                                '(|NonNegativeInteger|)
                                                                #5#))
                                             |alphasum|)
                                            (QREFELT $ 17))
                                  |help|)
                                 . #7#)))
                         (LETT |j| (+ |j| -1) . #7#) (GO G190) G191 (EXIT NIL))
                        (LETT |alphasum|
                              (PROG1
                                  (LETT #4#
                                        (+ |alphasum|
                                           (SPADCALL |alpha| |i|
                                                     (QREFELT $ 17)))
                                        . #7#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#))
                              . #7#)
                        (EXIT
                         (LETT |temp|
                               (APPEND |temp| (SPADCALL |help| (QREFELT $ 50)))
                               . #7#)))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1 . #7#) G190
                   (COND ((|greater_SI| |i| |nrow|) (GO G191)))
                   (SEQ (LETT |help| NIL . #7#)
                        (SEQ
                         (LETT |j| (SPADCALL |beta| |i| (QREFELT $ 17)) . #7#)
                         G190 (COND ((< |j| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |help|
                                 (CONS
                                  (+
                                   (PROG1 (LETT #3# |j| . #7#)
                                     (|check_subtype| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      #3#))
                                   |betasum|)
                                  |help|)
                                 . #7#)))
                         (LETT |j| (+ |j| -1) . #7#) (GO G190) G191 (EXIT NIL))
                        (LETT |betasum|
                              (PROG1
                                  (LETT #2#
                                        (+ |betasum|
                                           (SPADCALL |beta| |i|
                                                     (QREFELT $ 17)))
                                        . #7#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              . #7#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #7#) G190
                              (COND ((|greater_SI| |j| |ncol|) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |colematrix| |i| |j|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |help| (QREFELT $ 52))
                                            (SPADCALL
                                             (SPADCALL |temp| |j|
                                                       (QREFELT $ 53))
                                             (QREFELT $ 52))
                                            (QREFELT $ 54))
                                           (QREFELT $ 55))
                                          (QREFELT $ 31))))
                              (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |colematrix|)))) 

(DECLAIM (NOTINLINE |SymmetricGroupCombinatoricFunctions;|)) 

(DEFUN |SymmetricGroupCombinatoricFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G253)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|SymmetricGroupCombinatoricFunctions|)
                    . #2=(|SymmetricGroupCombinatoricFunctions|))
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
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SymmetricGroupCombinatoricFunctions|)))))))))) 

(DEFUN |SymmetricGroupCombinatoricFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SymmetricGroupCombinatoricFunctions|)
                . #1=(|SymmetricGroupCombinatoricFunctions|))
          (LETT $ (GETREFV 57) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (12 . |list|) |SGCF;unrankImproperPartitions0;3IL;3| (17 . ~=)
              |SGCF;subSet;3IL;5| (23 . |elt|) (|Vector| 6) (29 . |setelt|)
              (36 . |entries|) |SGCF;unrankImproperPartitions1;3IL;4|
              (|PartitionsAndPermutations|) (41 . |conjugate|) (46 . |elt|)
              (|NonNegativeInteger|) (52 . >) (58 . |setelt|)
              |SGCF;nextLatticePermutation;2LBL;6| (65 . |maxIndex|)
              (|Matrix| 6) (70 . |setelt|) |SGCF;makeYoungTableau;2LM;7|
              (|List| 30) |SGCF;listYoungTableaus;LL;8| (78 . |vector|)
              (83 . |copy|) (88 . ~=) (94 . |row|) (100 . +)
              |SGCF;nextPartition;2VIV;10| (106 . =) (112 . |setRow!|)
              (119 . -) |SGCF;nextColeman;2L2M;9| |SGCF;nextPartition;LVIV;11|
              (125 . ~=) (131 . |elt|) |SGCF;inverseColeman;2LML;12|
              (|List| 12) (138 . |list|) (|Set| 6) (143 . |brace|)
              (148 . |elt|) (154 . |intersect|) (160 . |#|)
              |SGCF;coleman;3LM;13|)
           '#(|unrankImproperPartitions1| 165 |unrankImproperPartitions0| 172
              |subSet| 179 |numberOfImproperPartitions| 186 |nextPartition| 192
              |nextLatticePermutation| 206 |nextColeman| 213 |makeYoungTableau|
              220 |listYoungTableaus| 226 |inverseColeman| 231 |coleman| 238)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 56
                                                 '(2 7 6 6 6 8 2 6 9 0 0 10 1
                                                   12 0 6 13 2 6 9 0 0 15 2 12
                                                   6 0 6 17 3 18 6 0 6 6 19 1
                                                   18 12 0 20 1 22 12 12 23 2
                                                   18 6 0 6 24 2 25 9 0 0 26 3
                                                   12 6 0 6 6 27 1 12 6 0 29 4
                                                   30 6 0 6 6 6 31 1 18 0 12 35
                                                   1 30 0 0 36 2 30 9 0 0 37 2
                                                   30 18 0 6 38 2 18 0 0 0 39 2
                                                   18 9 0 0 41 3 30 0 0 6 18 42
                                                   2 18 0 0 0 43 2 18 9 0 0 46
                                                   3 30 6 0 6 6 47 1 49 0 12 50
                                                   1 51 0 12 52 2 49 12 0 6 53
                                                   2 51 0 0 0 54 1 51 25 0 55 3
                                                   0 12 6 6 6 21 3 0 12 6 6 6
                                                   14 3 0 12 6 6 6 16 2 0 6 6 6
                                                   11 3 0 18 18 18 6 40 3 0 18
                                                   12 18 6 45 3 0 12 12 12 9 28
                                                   3 0 30 12 12 30 44 2 0 30 12
                                                   12 32 1 0 33 12 34 3 0 12 12
                                                   12 30 48 3 0 30 12 12 12
                                                   56)))))
           '|lookupComplete|)) 

(MAKEPROP '|SymmetricGroupCombinatoricFunctions| 'NILADIC T) 
