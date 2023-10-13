
(/VERSIONCHECK 2) 

(DEFUN |SGCF;numberOfImproperPartitionsInternal| (|n| |m| |cm| $)
  (PROG (|s| #1=#:G138 |i|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (SPADCALL |m| |cm| (QREFELT $ 8)))
            ('T
             (SEQ
              (COND
               ((EQL |cm| 0)
                (COND ((SPADCALL |n| 0 (QREFELT $ 10)) (EXIT 0)))))
              (LETT |s| 0 . #2=(|SGCF;numberOfImproperPartitionsInternal|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (+ |s|
                              (|SGCF;numberOfImproperPartitionsInternal| |i|
                               |m| (- |cm| 1) $))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))))))) 

(DEFUN |SGCF;numberOfImproperPartitions;3I;2| (|n| |m| $)
  (PROG (|s| |i| #1=#:G141)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((OR (< |n| 0) (< |m| 1))
          (PROGN
           (LETT #1# 0 . #2=(|SGCF;numberOfImproperPartitions;3I;2|))
           (GO #1#))))
        (COND
         ((OR (EQL |m| 1) (EQL |n| 0)) (PROGN (LETT #1# 1 . #2#) (GO #1#))))
        (LETT |s| 0 . #2#)
        (SEQ (LETT |i| 0 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (LETT |s|
                     (+ |s| (SPADCALL (- |n| |i|) (- |m| 1) (QREFELT $ 11)))
                     . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT |s|)))
      #1# (EXIT #1#))))) 

(DEFUN |SGCF;unrankImproperPartitions0;3IL;3| (|n| |m| |k| $)
  (PROG (|l| #1=#:G143 |s| |sOld| |y| #2=#:G150 |t|)
    (RETURN
     (SEQ (LETT |l| NIL . #3=(|SGCF;unrankImproperPartitions0;3IL;3|))
          (EXIT
           (COND ((< |k| 0) (|error| "counting of partitions is started at 0"))
                 ((>= |k| (SPADCALL |n| |m| (QREFELT $ 11)))
                  (|error| "there are not so many partitions"))
                 ('T
                  (SEQ
                   (SEQ (LETT |t| 0 . #3#) (LETT #2# (- |m| 2) . #3#) G190
                        (COND ((|greater_SI| |t| #2#) (GO G191)))
                        (SEQ (LETT |s| 0 . #3#)
                             (SEQ
                              (EXIT
                               (SEQ (LETT |y| 0 . #3#) G190
                                    (COND ((|greater_SI| |y| |n|) (GO G191)))
                                    (SEQ (LETT |sOld| |s| . #3#)
                                         (LETT |s|
                                               (+ |s|
                                                  (SPADCALL (- |n| |y|)
                                                            (- (- |m| |t|) 1)
                                                            (QREFELT $ 11)))
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |s| |k| (QREFELT $ 10))
                                            (PROGN
                                             (LETT #1# |$NoValue| . #3#)
                                             (GO #1#))))))
                                    (LETT |y| (|inc_SI| |y|) . #3#) (GO G190)
                                    G191 (EXIT NIL)))
                              #1# (EXIT #1#))
                             (LETT |l|
                                   (APPEND |l| (SPADCALL |y| (QREFELT $ 13)))
                                   . #3#)
                             (LETT |k| (- |k| |sOld|) . #3#)
                             (EXIT (LETT |n| (- |n| |y|) . #3#)))
                        (LETT |t| (|inc_SI| |t|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |l| (APPEND |l| (SPADCALL |n| (QREFELT $ 13))) . #3#)
                   (EXIT |l|))))))))) 

(DEFUN |SGCF;unrankImproperPartitions1;3IL;4| (|n| |m| |k| $)
  (PROG (#1=#:G162 |i| |nonZeroPos| |nonZeros| #2=#:G154 |s| |sOld| |y| |cm|
         |partition| #3=#:G152)
    (RETURN
     (SEQ (LETT |nonZeros| NIL . #4=(|SGCF;unrankImproperPartitions1;3IL;4|))
          (LETT |partition|
                (MAKEARR1
                 (PROG1 (LETT #3# |m| . #4#)
                   (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                 0)
                . #4#)
          (EXIT
           (COND
            ((OR (< |k| 0) (>= |k| (SPADCALL |n| |m| (QREFELT $ 11))))
             |nonZeros|)
            ('T
             (SEQ (LETT |cm| |m| . #4#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |n| 0 (QREFELT $ 15))) (GO G191)))
                       (SEQ (LETT |s| 0 . #4#) (LETT |cm| (- |cm| 1) . #4#)
                            (SEQ
                             (EXIT
                              (SEQ (LETT |y| |n| . #4#) G190
                                   (COND ((< |y| 1) (GO G191)))
                                   (SEQ (LETT |sOld| |s| . #4#)
                                        (LETT |s|
                                              (+ |s|
                                                 (|SGCF;numberOfImproperPartitionsInternal|
                                                  (- |n| |y|) |m| |cm| $))
                                              . #4#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |s| |k| (QREFELT $ 10))
                                           (PROGN
                                            (LETT #2# |$NoValue| . #4#)
                                            (GO #2#))))))
                                   (LETT |y| (+ |y| -1) . #4#) (GO G190) G191
                                   (EXIT NIL)))
                             #2# (EXIT #2#))
                            (LETT |nonZeros|
                                  (APPEND |nonZeros|
                                          (SPADCALL |y| (QREFELT $ 13)))
                                  . #4#)
                            (LETT |k| (- |k| |sOld|) . #4#)
                            (EXIT (LETT |n| (- |n| |y|) . #4#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |nonZeroPos|
                        (REVERSE
                         (SPADCALL |m| (- |m| |cm|) |k| (QREFELT $ 16)))
                        . #4#)
                  (SEQ (LETT |i| 1 . #4#) (LETT #1# (- |m| |cm|) . #4#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |partition|
                                   (+ 1
                                      (SPADCALL |nonZeroPos| |i|
                                                (QREFELT $ 17)))
                                   (SPADCALL |nonZeros| |i| (QREFELT $ 17))
                                   (QREFELT $ 19))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (SPADCALL |partition| (QREFELT $ 20))))))))))) 

(DEFUN |SGCF;subSet;3IL;5| (|n| |m| |k| $)
  (PROG (|s| |mm| |l| #1=#:G164 #2=#:G172 |y| #3=#:G171 |t| |bin|)
    (RETURN
     (SEQ
      (COND
       ((OR (OR (OR (< |k| 0) (< |n| 0)) (< |m| 0))
            (SPADCALL |m| |n| (QREFELT $ 10)))
        (|error| "improper argument to subSet"))
       ('T
        (SEQ
         (LETT |bin| (SPADCALL |n| |m| (QREFELT $ 8))
               . #4=(|SGCF;subSet;3IL;5|))
         (EXIT
          (COND ((>= |k| |bin|) (|error| "there are not so many subsets"))
                (#5='T
                 (SEQ (LETT |l| NIL . #4#)
                      (EXIT
                       (COND ((EQL |n| 0) |l|)
                             (#5#
                              (SEQ (LETT |mm| |k| . #4#) (LETT |s| |m| . #4#)
                                   (SEQ (LETT |t| 0 . #4#)
                                        (LETT #3# (- |m| 1) . #4#) G190
                                        (COND
                                         ((|greater_SI| |t| #3#) (GO G191)))
                                        (SEQ
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |y| (- |s| 1) . #4#)
                                                (LETT #2# (+ |n| 1) . #4#) G190
                                                (COND ((> |y| #2#) (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL |y| |s|
                                                               (QREFELT $ 8))
                                                     |mm| (QREFELT $ 10))
                                                    (PROGN
                                                     (LETT #1# |$NoValue|
                                                           . #4#)
                                                     (GO #1#))))))
                                                (LETT |y| (+ |y| 1) . #4#)
                                                (GO G190) G191 (EXIT NIL)))
                                          #1# (EXIT #1#))
                                         (LETT |l|
                                               (APPEND |l|
                                                       (SPADCALL (- |y| 1)
                                                                 (QREFELT $
                                                                          13)))
                                               . #4#)
                                         (LETT |mm|
                                               (- |mm|
                                                  (SPADCALL (- |y| 1) |s|
                                                            (QREFELT $ 8)))
                                               . #4#)
                                         (EXIT (LETT |s| (- |s| 1) . #4#)))
                                        (LETT |t| (|inc_SI| |t|) . #4#)
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT |l|)))))))))))))))) 

(DEFUN |SGCF;nextLatticePermutation;2LBL;6|
       (|lambda| |lattP| |constructNotFirst| $)
  (PROG (#1=#:G202 |l| |i| |rightPosition| #2=#:G191 |j| |ready| |leftEntry|
         #3=#:G183 |rightEntry| #4=#:G201 #5=#:G182 |help| |n| #6=#:G181
         #7=#:G179 #8=#:G178 #9=#:G180 #10=#:G200 #11=#:G125 |rows| #12=#:G174
         |columns| #13=#:G173 |lprime|)
    (RETURN
     (SEQ
      (LETT |lprime| (SPADCALL |lambda| (QREFELT $ 23))
            . #14=(|SGCF;nextLatticePermutation;2LBL;6|))
      (LETT |columns|
            (PROG1 (LETT #13# (|SPADfirst| |lambda|) . #14#)
              (|check_subtype| (>= #13# 0) '(|NonNegativeInteger|) #13#))
            . #14#)
      (LETT |rows|
            (PROG1 (LETT #12# (|SPADfirst| |lprime|) . #14#)
              (|check_subtype| (>= #12# 0) '(|NonNegativeInteger|) #12#))
            . #14#)
      (LETT |n|
            (PROG1
                (LETT #6#
                      (PROGN
                       (LETT #7# NIL . #14#)
                       (SEQ (LETT #11# NIL . #14#) (LETT #10# |lambda| . #14#)
                            G190
                            (COND
                             ((OR (ATOM #10#)
                                  (PROGN (LETT #11# (CAR #10#) . #14#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #9# #11# . #14#)
                               (COND (#7# (LETT #8# (+ #8# #9#) . #14#))
                                     ('T
                                      (PROGN
                                       (LETT #8# #9# . #14#)
                                       (LETT #7# 'T . #14#)))))))
                            (LETT #10# (CDR #10#) . #14#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#7# #8#) (#15='T 0)))
                      . #14#)
              (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
            . #14#)
      (EXIT
       (COND
        (|constructNotFirst|
         (SEQ (LETT |help| (MAKEARR1 |columns| 0) . #14#)
              (LETT |rightPosition| |n| . #14#)
              (LETT |leftEntry|
                    (PROG1
                        (LETT #5#
                              (SPADCALL |lattP| |rightPosition| (QREFELT $ 17))
                              . #14#)
                      (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                    . #14#)
              (LETT |ready| 'NIL . #14#)
              (SEQ (LETT #4# NIL . #14#) G190 (COND (#4# (GO G191)))
                   (SEQ (LETT |rightEntry| |leftEntry| . #14#)
                        (LETT |leftEntry|
                              (PROG1
                                  (LETT #3#
                                        (SPADCALL |lattP| (- |rightPosition| 1)
                                                  (QREFELT $ 17))
                                        . #14#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              . #14#)
                        (SPADCALL |help| |rightEntry|
                                  (+
                                   (SPADCALL |help| |rightEntry|
                                             (QREFELT $ 24))
                                   1)
                                  (QREFELT $ 19))
                        (COND
                         ((SPADCALL |rightEntry| |leftEntry| (QREFELT $ 26))
                          (COND
                           ((SPADCALL
                             (- (SPADCALL |lprime| |leftEntry| (QREFELT $ 17))
                                (SPADCALL |help| |leftEntry| (QREFELT $ 24)))
                             (+
                              (-
                               (SPADCALL |lprime| |rightEntry| (QREFELT $ 17))
                               (SPADCALL |help| |rightEntry| (QREFELT $ 24)))
                              1)
                             (QREFELT $ 10))
                            (SEQ (LETT |ready| 'T . #14#)
                                 (LETT |j| (+ |leftEntry| 1) . #14#)
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
                                      (SEQ (EXIT (LETT |j| (+ |j| 1) . #14#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (SPADCALL |lattP| (- |rightPosition| 1) |j|
                                           (QREFELT $ 27))
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
                                  (SEQ (LETT |l| |rightPosition| . #14#) G190
                                       (COND ((> |l| |n|) (GO G191)))
                                       (SEQ (LETT |j| 0 . #14#)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (EQL
                                                     (SPADCALL |help| (+ 1 |j|)
                                                               (QREFELT $ 24))
                                                     0))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |j| (+ |j| 1)
                                                         . #14#)))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (SPADCALL |lattP| |l| (+ |j| 1)
                                                      (QREFELT $ 27))
                                            (EXIT
                                             (SPADCALL |help| (+ 1 |j|)
                                                       (-
                                                        (SPADCALL |help|
                                                                  (+ 1 |j|)
                                                                  (QREFELT $
                                                                           24))
                                                        1)
                                                       (QREFELT $ 19))))
                                       (LETT |l| (+ |l| 1) . #14#) (GO G190)
                                       G191 (EXIT NIL))))))))
                        (LETT |rightPosition|
                              (PROG1 (LETT #2# (- |rightPosition| 1) . #14#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              . #14#)
                        (EXIT
                         (COND
                          ((EQL |rightPosition| 1)
                           (LETT |constructNotFirst| 'NIL . #14#)))))
                   (LETT #4#
                         (COND ((OR |ready| (NULL |constructNotFirst|)) 'T)
                               ('T 'NIL))
                         . #14#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (COND (|constructNotFirst| |lattP|) (#15# NIL)))))
        (#15#
         (SEQ (LETT |lattP| NIL . #14#)
              (SEQ (LETT |i| |columns| . #14#) G190
                   (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| 1 . #14#)
                          (LETT #1# (SPADCALL |lprime| |i| (QREFELT $ 17))
                                . #14#)
                          G190 (COND ((|greater_SI| |l| #1#) (GO G191)))
                          (SEQ (EXIT (LETT |lattP| (CONS |i| |lattP|) . #14#)))
                          (LETT |l| (|inc_SI| |l|) . #14#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (+ |i| -1) . #14#) (GO G190) G191 (EXIT NIL))
              (EXIT |lattP|))))))))) 

(DEFUN |SGCF;makeYoungTableau;2LM;7| (|lambda| |gitter| $)
  (PROG (|i| |j| #1=#:G209 |l| |help| |ytab| |rows| #2=#:G204 |columns|
         #3=#:G203 |lprime|)
    (RETURN
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
      (LETT |ytab| (SPADCALL |rows| |columns| 0 (QREFELT $ 30)) . #4#)
      (LETT |help| (MAKEARR1 |columns| 1) . #4#) (LETT |i| -1 . #4#)
      (LETT |j| 0 . #4#)
      (SEQ (LETT |l| 1 . #4#)
           (LETT #1# (SPADCALL |gitter| (QREFELT $ 31)) . #4#) G190
           (COND ((|greater_SI| |l| #1#) (GO G191)))
           (SEQ (LETT |j| (SPADCALL |gitter| |l| (QREFELT $ 17)) . #4#)
                (LETT |i| (+ |i| 1) . #4#)
                (SPADCALL |ytab| (SPADCALL |help| |j| (QREFELT $ 24)) |j| |i|
                          (QREFELT $ 32))
                (EXIT
                 (SPADCALL |help| |j|
                           (+ (SPADCALL |help| |j| (QREFELT $ 24)) 1)
                           (QREFELT $ 19))))
           (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |ytab|))))) 

(DEFUN |SGCF;listYoungTableaus;LL;8| (|lambda| $)
  (PROG (|lattice| |younglist| |ytab| #1=#:G214)
    (RETURN
     (SEQ (LETT |younglist| NIL . #2=(|SGCF;listYoungTableaus;LL;8|))
          (LETT |lattice| (SPADCALL |lambda| |lattice| 'NIL (QREFELT $ 28))
                . #2#)
          (SEQ (LETT #1# NIL . #2#) G190 (COND (#1# (GO G191)))
               (SEQ
                (LETT |ytab| (SPADCALL |lambda| |lattice| (QREFELT $ 33))
                      . #2#)
                (LETT |younglist| (APPEND |younglist| (LIST |ytab|)) . #2#)
                (EXIT
                 (LETT |lattice|
                       (SPADCALL |lambda| |lattice| 'T (QREFELT $ 28)) . #2#)))
               (LETT #1# (NULL |lattice|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |younglist|))))) 

(DEFUN |SGCF;nextColeman;2L2M;9| (|alpha| |beta| C $)
  (PROG (|vrest| |coleman| |succ| #1=#:G229 |i| #2=#:G223 |j| #3=#:G216
         #4=#:G228 #5=#:G215 |cnull| |vzero| |vnull| |ncol| |nrow|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nrow| (LENGTH |beta|) . #6=(|SGCF;nextColeman;2L2M;9|))
            (LETT |ncol| (LENGTH |alpha|) . #6#)
            (LETT |vnull| (SPADCALL NIL (QREFELT $ 36)) . #6#)
            (LETT |vzero| (MAKEARR1 |ncol| 0) . #6#)
            (LETT |vrest| (MAKEARR1 |ncol| 0) . #6#)
            (LETT |cnull| (SPADCALL 1 1 0 (QREFELT $ 30)) . #6#)
            (LETT |coleman| (SPADCALL C (QREFELT $ 37)) . #6#)
            (COND
             ((SPADCALL |coleman| |cnull| (QREFELT $ 38))
              (SEQ
               (LETT |i|
                     (PROG1 (LETT #5# (- |nrow| 1) . #6#)
                       (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|)
                                        #5#))
                     . #6#)
               (LETT |vrest|
                     (SPADCALL (SPADCALL |coleman| |i| (QREFELT $ 39))
                               (SPADCALL |coleman| |nrow| (QREFELT $ 39))
                               (QREFELT $ 40))
                     . #6#)
               (LETT |succ|
                     (SPADCALL |vrest| (SPADCALL |coleman| |i| (QREFELT $ 39))
                               (SPADCALL |beta| |i| (QREFELT $ 17))
                               (QREFELT $ 41))
                     . #6#)
               (SEQ G190
                    (COND
                     ((NULL (SPADCALL |succ| |vnull| (QREFELT $ 42)))
                      (GO G191)))
                    (SEQ
                     (COND
                      ((EQL |i| 1) (PROGN (LETT #4# |cnull| . #6#) (GO #4#))))
                     (LETT |i|
                           (PROG1 (LETT #3# (- |i| 1) . #6#)
                             (|check_subtype| (>= #3# 0)
                                              '(|NonNegativeInteger|) #3#))
                           . #6#)
                     (LETT |vrest|
                           (SPADCALL |vrest|
                                     (SPADCALL |coleman| |i| (QREFELT $ 39))
                                     (QREFELT $ 40))
                           . #6#)
                     (EXIT
                      (LETT |succ|
                            (SPADCALL |vrest|
                                      (SPADCALL |coleman| |i| (QREFELT $ 39))
                                      (SPADCALL |beta| |i| (QREFELT $ 17))
                                      (QREFELT $ 41))
                            . #6#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (LETT |j| |i| . #6#)
               (LETT |coleman| (SPADCALL |coleman| |i| |succ| (QREFELT $ 43))
                     . #6#)
               (EXIT
                (LETT |vrest|
                      (SPADCALL |vrest| (SPADCALL |coleman| |i| (QREFELT $ 39))
                                (QREFELT $ 44))
                      . #6#))))
             ('T
              (SEQ (LETT |vrest| (SPADCALL |alpha| (QREFELT $ 36)) . #6#)
                   (LETT |coleman| (SPADCALL |nrow| |ncol| 0 (QREFELT $ 30))
                         . #6#)
                   (EXIT (LETT |j| 0 . #6#)))))
            (SEQ
             (LETT |i|
                   (PROG1 (LETT #2# (+ |j| 1) . #6#)
                     (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                   . #6#)
             (LETT #1# (- |nrow| 1) . #6#) G190 (COND ((> |i| #1#) (GO G191)))
             (SEQ
              (LETT |succ|
                    (SPADCALL |vrest| |vnull|
                              (SPADCALL |beta| |i| (QREFELT $ 17))
                              (QREFELT $ 41))
                    . #6#)
              (LETT |coleman| (SPADCALL |coleman| |i| |succ| (QREFELT $ 43))
                    . #6#)
              (EXIT
               (LETT |vrest| (SPADCALL |vrest| |succ| (QREFELT $ 44)) . #6#)))
             (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |coleman| |nrow| |vrest| (QREFELT $ 43)))))
      #4# (EXIT #4#))))) 

(DEFUN |SGCF;nextPartition;2VIV;10| (|gamma| |part| |number| $)
  (SPADCALL (SPADCALL |gamma| (QREFELT $ 20)) |part| |number| (QREFELT $ 46))) 

(DEFUN |SGCF;nextPartition;LVIV;11| (|gamma| |part| |number| $)
  (PROG (#1=#:G242 |k| |j| |sum| |i| #2=#:G241 |vnull| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (LENGTH |gamma|) . #3=(|SGCF;nextPartition;LVIV;11|))
            (LETT |vnull| (SPADCALL NIL (QREFELT $ 36)) . #3#)
            (COND
             ((SPADCALL |part| |vnull| (QREFELT $ 47))
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
                               (+ |sum| (SPADCALL |part| |i| (QREFELT $ 24)))
                               . #3#)
                         (LETT |i| (+ |i| 1) . #3#)
                         (EXIT
                          (COND
                           ((EQL |i| (+ 1 |n|))
                            (PROGN (LETT #2# |vnull| . #3#) (GO #2#))))))
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
                  (SPADCALL |part| |j| (SPADCALL |gamma| |j| (QREFELT $ 17))
                            (QREFELT $ 19))
                  (LETT |sum| (- |sum| (SPADCALL |gamma| |j| (QREFELT $ 17)))
                        . #3#)
                  (EXIT (LETT |j| (+ |j| 1) . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (SPADCALL |part| |j| |sum| (QREFELT $ 19))
            (SEQ (LETT |k| (+ |j| 1) . #3#) (LETT #1# (- |i| 1) . #3#) G190
                 (COND ((> |k| #1#) (GO G191)))
                 (SEQ (EXIT (SPADCALL |part| |k| 0 (QREFELT $ 19))))
                 (LETT |k| (+ |k| 1) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |part|)))
      #2# (EXIT #2#))))) 

(DEFUN |SGCF;inverseColeman;2LML;12| (|alpha| |beta| C $)
  (PROG (|pi| #1=#:G251 |k| |i| |j| |sum| |help| |ncol| |nrow|)
    (RETURN
     (SEQ (LETT |pi| NIL . #2=(|SGCF;inverseColeman;2LML;12|))
          (LETT |nrow| (LENGTH |beta|) . #2#)
          (LETT |ncol| (LENGTH |alpha|) . #2#)
          (LETT |help| (MAKEARR1 |nrow| 0) . #2#) (LETT |sum| 1 . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |nrow|) (GO G191)))
               (SEQ (SPADCALL |help| |i| |sum| (QREFELT $ 19))
                    (EXIT
                     (LETT |sum| (+ |sum| (SPADCALL |beta| |i| (QREFELT $ 17)))
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| 1 . #2#) G190
               (COND ((|greater_SI| |j| |ncol|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1 . #2#) G190
                      (COND ((|greater_SI| |i| |nrow|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k| 2 . #2#)
                             (LETT #1#
                                   (+ 1 (SPADCALL C |i| |j| (QREFELT $ 48)))
                                   . #2#)
                             G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (LETT |pi|
                                    (APPEND |pi|
                                            (SPADCALL
                                             (SPADCALL |help| |i|
                                                       (QREFELT $ 24))
                                             (QREFELT $ 13)))
                                    . #2#)
                              (EXIT
                               (SPADCALL |help| |i|
                                         (+
                                          (SPADCALL |help| |i| (QREFELT $ 24))
                                          1)
                                         (QREFELT $ 19))))
                             (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |pi|))))) 

(DEFUN |SGCF;coleman;3LM;13| (|alpha| |beta| |pi| $)
  (PROG (|j| |betasum| #1=#:G261 |help| #2=#:G259 |i| |temp| |alphasum|
         #3=#:G255 #4=#:G253 |colematrix| |ncol| |nrow|)
    (RETURN
     (SEQ (LETT |nrow| (LENGTH |beta|) . #5=(|SGCF;coleman;3LM;13|))
          (LETT |ncol| (LENGTH |alpha|) . #5#) (LETT |temp| NIL . #5#)
          (LETT |help| NIL . #5#)
          (LETT |colematrix| (SPADCALL |nrow| |ncol| 0 (QREFELT $ 30)) . #5#)
          (LETT |betasum| 0 . #5#) (LETT |alphasum| 0 . #5#)
          (SEQ (LETT |i| 1 . #5#) G190
               (COND ((|greater_SI| |i| |ncol|) (GO G191)))
               (SEQ (LETT |help| NIL . #5#)
                    (SEQ (LETT |j| (SPADCALL |alpha| |i| (QREFELT $ 17)) . #5#)
                         G190 (COND ((< |j| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |help|
                                 (CONS
                                  (SPADCALL |pi|
                                            (+
                                             (PROG1 (LETT #4# |j| . #5#)
                                               (|check_subtype| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                #4#))
                                             |alphasum|)
                                            (QREFELT $ 17))
                                  |help|)
                                 . #5#)))
                         (LETT |j| (+ |j| -1) . #5#) (GO G190) G191 (EXIT NIL))
                    (LETT |alphasum|
                          (PROG1
                              (LETT #3#
                                    (+ |alphasum|
                                       (SPADCALL |alpha| |i| (QREFELT $ 17)))
                                    . #5#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#))
                          . #5#)
                    (EXIT
                     (LETT |temp|
                           (APPEND |temp| (SPADCALL |help| (QREFELT $ 51)))
                           . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1 . #5#) G190
               (COND ((|greater_SI| |i| |nrow|) (GO G191)))
               (SEQ (LETT |help| NIL . #5#)
                    (SEQ (LETT |j| (SPADCALL |beta| |i| (QREFELT $ 17)) . #5#)
                         G190 (COND ((< |j| 1) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |help|
                                 (CONS
                                  (+
                                   (PROG1 (LETT #2# |j| . #5#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   |betasum|)
                                  |help|)
                                 . #5#)))
                         (LETT |j| (+ |j| -1) . #5#) (GO G190) G191 (EXIT NIL))
                    (LETT |betasum|
                          (PROG1
                              (LETT #1#
                                    (+ |betasum|
                                       (SPADCALL |beta| |i| (QREFELT $ 17)))
                                    . #5#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          . #5#)
                    (EXIT
                     (SEQ (LETT |j| 1 . #5#) G190
                          (COND ((|greater_SI| |j| |ncol|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |colematrix| |i| |j|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |help| (QREFELT $ 53))
                                        (SPADCALL
                                         (SPADCALL |temp| |j| (QREFELT $ 54))
                                         (QREFELT $ 53))
                                        (QREFELT $ 55))
                                       (QREFELT $ 56))
                                      (QREFELT $ 32))))
                          (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |colematrix|))))) 

(DEFUN |SymmetricGroupCombinatoricFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G268)
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
                    '|SymmetricGroupCombinatoricFunctions|))))))))))) 

(DEFUN |SymmetricGroupCombinatoricFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SymmetricGroupCombinatoricFunctions|)
            . #1=(|SymmetricGroupCombinatoricFunctions|))
      (LETT $ (GETREFV 58) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SymmetricGroupCombinatoricFunctions|
                  NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

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
              |SGCF;nextLatticePermutation;2LBL;6| (|Matrix| 6) (65 . |new|)
              (72 . |maxIndex|) (77 . |setelt|) |SGCF;makeYoungTableau;2LM;7|
              (|List| 29) |SGCF;listYoungTableaus;LL;8| (85 . |vector|)
              (90 . |copy|) (95 . ~=) (101 . |row|) (107 . +)
              |SGCF;nextPartition;2VIV;10| (113 . =) (119 . |setRow!|)
              (126 . -) |SGCF;nextColeman;2L2M;9| |SGCF;nextPartition;LVIV;11|
              (132 . ~=) (138 . |elt|) |SGCF;inverseColeman;2LML;12|
              (|List| 12) (145 . |list|) (|Set| 6) (150 . |brace|)
              (155 . |elt|) (161 . |intersect|) (167 . |#|)
              |SGCF;coleman;3LM;13|)
           '#(|unrankImproperPartitions1| 172 |unrankImproperPartitions0| 179
              |subSet| 186 |numberOfImproperPartitions| 193 |nextPartition| 199
              |nextLatticePermutation| 213 |nextColeman| 220 |makeYoungTableau|
              227 |listYoungTableaus| 233 |inverseColeman| 238 |coleman| 245)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(2 7 6 6 6 8 2 6 9 0 0 10 1
                                                   12 0 6 13 2 6 9 0 0 15 2 12
                                                   6 0 6 17 3 18 6 0 6 6 19 1
                                                   18 12 0 20 1 22 12 12 23 2
                                                   18 6 0 6 24 2 25 9 0 0 26 3
                                                   12 6 0 6 6 27 3 29 0 25 25 6
                                                   30 1 12 6 0 31 4 29 6 0 6 6
                                                   6 32 1 18 0 12 36 1 29 0 0
                                                   37 2 29 9 0 0 38 2 29 18 0 6
                                                   39 2 18 0 0 0 40 2 18 9 0 0
                                                   42 3 29 0 0 6 18 43 2 18 0 0
                                                   0 44 2 18 9 0 0 47 3 29 6 0
                                                   6 6 48 1 50 0 12 51 1 52 0
                                                   12 53 2 50 12 0 6 54 2 52 0
                                                   0 0 55 1 52 25 0 56 3 0 12 6
                                                   6 6 21 3 0 12 6 6 6 14 3 0
                                                   12 6 6 6 16 2 0 6 6 6 11 3 0
                                                   18 18 18 6 41 3 0 18 12 18 6
                                                   46 3 0 12 12 12 9 28 3 0 29
                                                   12 12 29 45 2 0 29 12 12 33
                                                   1 0 34 12 35 3 0 12 12 12 29
                                                   49 3 0 29 12 12 12 57)))))
           '|lookupComplete|)) 

(MAKEPROP '|SymmetricGroupCombinatoricFunctions| 'NILADIC T) 
