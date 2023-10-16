
(SDEFUN |REP1;calcCoef|
        ((|beta| |List| (|Integer|)) (C |Matrix| (|Integer|)) ($ |Integer|))
        (SPROG ((|prod| (|Integer|)) (#1=#:G109 NIL) (|i| NIL))
               (SEQ (LETT |prod| 1)
                    (SEQ (LETT |i| 1)
                         (LETT #1# (SPADCALL |beta| (QREFELT $ 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |prod|
                                 (* |prod|
                                    (SPADCALL
                                     (SPADCALL |beta| |i| (QREFELT $ 10))
                                     (SPADCALL (SPADCALL C |i| (QREFELT $ 13))
                                               (QREFELT $ 14))
                                     (QREFELT $ 16))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |prod|)))) 

(SDEFUN |REP1;invContent|
        ((|alpha| |List| #1=(|Integer|)) ($ |Vector| (|Integer|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#2=#:G125 NIL) (|k| NIL)
          (|j| (|Integer|)) (#3=#:G124 NIL) (|og| NIL)
          (|f| (|Vector| (|Integer|))) (|n| (|NonNegativeInteger|))
          (#4=#:G116 NIL) (#5=#:G114 NIL) (#6=#:G113 #1#) (#7=#:G115 #1#)
          (#8=#:G123 NIL) (#9=#:G104 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #4#
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT #9# NIL) (LETT #8# |alpha|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT #9# (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7# #9#)
                                   (COND (#5# (LETT #6# (+ #6# #7#)))
                                         ('T
                                          (PROGN
                                           (LETT #6# #7#)
                                           (LETT #5# 'T)))))))
                                (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                           (COND (#5# #6#) ('T 0))))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (LETT |f| (MAKEARR1 |n| 0)) (LETT |i| 1) (LETT |j| -1)
          (SEQ (LETT |og| NIL) (LETT #3# |alpha|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |og| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |j| (+ |j| 1))
                    (EXIT
                     (SEQ (LETT |k| 1) (LETT #2# |og|) G190
                          (COND ((|greater_SI| |k| #2#) (GO G191)))
                          (SEQ (SPADCALL |f| |i| |j| (QREFELT $ 19))
                               (EXIT (LETT |i| (+ |i| 1))))
                          (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                          (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT |f|)))) 

(SDEFUN |REP1;antisymmetricTensors;MPiM;3|
        ((|a| |Matrix| R) (|k| |PositiveInteger|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G151 NIL) (|t| NIL) (#2=#:G152 NIL) (|tt| NIL) (#3=#:G149 NIL)
          (|r| NIL) (#4=#:G150 NIL) (|rr| NIL) (|c| #5=(|Matrix| R))
          (#6=#:G147 NIL) (|j| NIL) (#7=#:G148 NIL) (|lt| NIL) (#8=#:G145 NIL)
          (|i| NIL) (#9=#:G146 NIL) (|lr| NIL) (|b| #5#) (#10=#:G131 NIL)
          (#11=#:G130 NIL) (|ilc| (|List| (|List| (|Integer|))))
          (#12=#:G144 NIL) (#13=#:G143 NIL)
          (|ilr| (|List| (|List| (|Integer|)))) (#14=#:G142 NIL)
          (#15=#:G141 NIL) (|mc| #16=(|Integer|)) (|mr| #16#)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|)))
         (SEQ (LETT |nr| (ANROWS |a|)) (LETT |nc| (ANCOLS |a|))
              (EXIT
               (COND ((EQL |k| 1) |a|)
                     ((> |k| (MIN |nr| |nc|))
                      (|error|
                       "second parameter for antisymmetricTensors is too large"))
                     ('T
                      (SEQ (LETT |mr| (SPADCALL |nr| |k| (QREFELT $ 20)))
                           (LETT |mc| (SPADCALL |nc| |k| (QREFELT $ 20)))
                           (LETT |ilr|
                                 (PROGN
                                  (LETT #15# NIL)
                                  (SEQ (LETT |i| 0) (LETT #14# (- |mr| 1)) G190
                                       (COND
                                        ((|greater_SI| |i| #14#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #15#
                                               (CONS
                                                (SPADCALL |nr| |k| |i|
                                                          (QREFELT $ 22))
                                                #15#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #15#)))))
                           (LETT |ilc|
                                 (PROGN
                                  (LETT #13# NIL)
                                  (SEQ (LETT |i| 0) (LETT #12# (- |mc| 1)) G190
                                       (COND
                                        ((|greater_SI| |i| #12#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #13#
                                               (CONS
                                                (SPADCALL |nc| |k| |i|
                                                          (QREFELT $ 22))
                                                #13#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #13#)))))
                           (LETT |b|
                                 (SPADCALL
                                  (PROG1 (LETT #11# |mr|)
                                    (|check_subtype2| (>= #11# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #11#))
                                  (PROG1 (LETT #10# |mc|)
                                    (|check_subtype2| (>= #10# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #10#))
                                  (QREFELT $ 25)))
                           (SEQ (LETT |lr| NIL) (LETT #9# |ilr|) (LETT |i| 1)
                                (LETT #8# |mr|) G190
                                (COND
                                 ((OR (|greater_SI| |i| #8#) (ATOM #9#)
                                      (PROGN (LETT |lr| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |lt| NIL) (LETT #7# |ilc|)
                                       (LETT |j| 1) (LETT #6# |mc|) G190
                                       (COND
                                        ((OR (|greater_SI| |j| #6#) (ATOM #7#)
                                             (PROGN (LETT |lt| (CAR #7#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |c|
                                              (SPADCALL |k| |k|
                                                        (QREFELT $ 25)))
                                        (SEQ (LETT |rr| NIL) (LETT #4# |lr|)
                                             (LETT |r| 1) (LETT #3# |k|) G190
                                             (COND
                                              ((OR (|greater_SI| |r| #3#)
                                                   (ATOM #4#)
                                                   (PROGN
                                                    (LETT |rr| (CAR #4#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (SEQ (LETT |tt| NIL)
                                                    (LETT #2# |lt|)
                                                    (LETT |t| 1) (LETT #1# |k|)
                                                    G190
                                                    (COND
                                                     ((OR
                                                       (|greater_SI| |t| #1#)
                                                       (ATOM #2#)
                                                       (PROGN
                                                        (LETT |tt| (CAR #2#))
                                                        NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SPADCALL |c| |r| |t|
                                                                (SPADCALL |a|
                                                                          (+ 1
                                                                             |rr|)
                                                                          (+ 1
                                                                             |tt|)
                                                                          (QREFELT
                                                                           $
                                                                           26))
                                                                (QREFELT $
                                                                         27))))
                                                    (LETT |t|
                                                          (PROG1 (|inc_SI| |t|)
                                                            (LETT #2#
                                                                  (CDR #2#))))
                                                    (GO G190) G191
                                                    (EXIT NIL))))
                                             (LETT |r|
                                                   (PROG1 (|inc_SI| |r|)
                                                     (LETT #4# (CDR #4#))))
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT
                                         (SPADCALL |b| |i| |j|
                                                   (SPADCALL |c|
                                                             (QREFELT $ 28))
                                                   (QREFELT $ 27))))
                                       (LETT |j|
                                             (PROG1 (|inc_SI| |j|)
                                               (LETT #7# (CDR #7#))))
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT |i|
                                      (PROG1 (|inc_SI| |i|)
                                        (LETT #9# (CDR #9#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |b|)))))))) 

(SDEFUN |REP1;antisymmetricTensors;LPiL;4|
        ((|la| |List| (|Matrix| R)) (|k| |PositiveInteger|)
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G156 NIL) (|ma| NIL) (#2=#:G155 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |ma| NIL) (LETT #1# |la|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |ma| |k| (QREFELT $ 30)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;symmetricTensors;MPiM;5|
        ((|a| |Matrix| R) (|n| |PositiveInteger|) ($ |Matrix| R))
        (SPROG
         ((|colemanMatrix| (|Matrix| (|Integer|))) (|help| (R)) (#1=#:G160 NIL)
          (#2=#:G159 NIL) (#3=#:G173 NIL) (|k| NIL)
          (|gamma| (|List| (|Integer|))) (|g| #4=(|Vector| (|Integer|)))
          (|beta| #5=(|List| (|Integer|))) (#6=#:G172 NIL) (|j| NIL) (|f| #4#)
          (|alpha| #5#) (#7=#:G171 NIL) (|i| NIL)
          (|nullMatrix| (|Matrix| (|Integer|))) (|c| (|Matrix| R))
          (|dimc| (|NonNegativeInteger|)) (#8=#:G158 NIL)
          (|dimr| (|NonNegativeInteger|)) (#9=#:G157 NIL)
          (|mc| (|NonNegativeInteger|)) (|mr| (|NonNegativeInteger|)))
         (SEQ (LETT |mr| (ANROWS |a|)) (LETT |mc| (ANCOLS |a|))
              (EXIT
               (COND ((EQL |n| 1) |a|)
                     ('T
                      (SEQ
                       (LETT |dimr|
                             (PROG1
                                 (LETT #9#
                                       (SPADCALL (- (+ |mr| |n|) 1) |n|
                                                 (QREFELT $ 20)))
                               (|check_subtype2| (>= #9# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #9#)))
                       (LETT |dimc|
                             (PROG1
                                 (LETT #8#
                                       (SPADCALL (- (+ |mc| |n|) 1) |n|
                                                 (QREFELT $ 20)))
                               (|check_subtype2| (>= #8# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #8#)))
                       (LETT |c|
                             (MAKE_MATRIX1 |dimr| |dimc|
                                           (|spadConstant| $ 17)))
                       (LETT |f| (MAKEARR1 |n| 0)) (LETT |g| (MAKEARR1 |n| 0))
                       (LETT |nullMatrix| (MAKE_MATRIX1 1 1 0))
                       (SEQ (LETT |i| 1) (LETT #7# |dimr|) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ
                             (LETT |alpha|
                                   (SPADCALL |n| |mr| (- |i| 1)
                                             (QREFELT $ 33)))
                             (LETT |f| (|REP1;invContent| |alpha| $))
                             (EXIT
                              (SEQ (LETT |j| 1) (LETT #6# |dimc|) G190
                                   (COND ((|greater_SI| |j| #6#) (GO G191)))
                                   (SEQ
                                    (LETT |beta|
                                          (SPADCALL |n| |mc| (- |j| 1)
                                                    (QREFELT $ 33)))
                                    (LETT |g| (|REP1;invContent| |beta| $))
                                    (LETT |colemanMatrix|
                                          (SPADCALL |alpha| |beta| |nullMatrix|
                                                    (QREFELT $ 34)))
                                    (EXIT
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (SPADCALL |colemanMatrix|
                                                       |nullMatrix|
                                                       (QREFELT $ 36)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |gamma|
                                                 (SPADCALL |alpha| |beta|
                                                           |colemanMatrix|
                                                           (QREFELT $ 37)))
                                           (LETT |help|
                                                 (SPADCALL
                                                  (|REP1;calcCoef| |beta|
                                                   |colemanMatrix| $)
                                                  (QREFELT $ 38)))
                                           (SEQ (LETT |k| 1) (LETT #3# |n|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |k| #3#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |help|
                                                        (SPADCALL |help|
                                                                  (SPADCALL |a|
                                                                            (PROG1
                                                                                (LETT
                                                                                 #2#
                                                                                 (+
                                                                                  1
                                                                                  (SPADCALL
                                                                                   |f|
                                                                                   |k|
                                                                                   (QREFELT
                                                                                    $
                                                                                    39))))
                                                                              (|check_subtype2|
                                                                               (>=
                                                                                #2#
                                                                                0)
                                                                               '(|NonNegativeInteger|)
                                                                               '(|Integer|)
                                                                               #2#))
                                                                            (PROG1
                                                                                (LETT
                                                                                 #1#
                                                                                 (+
                                                                                  1
                                                                                  (SPADCALL
                                                                                   |g|
                                                                                   (SPADCALL
                                                                                    |gamma|
                                                                                    |k|
                                                                                    (QREFELT
                                                                                     $
                                                                                     10))
                                                                                   (QREFELT
                                                                                    $
                                                                                    39))))
                                                                              (|check_subtype2|
                                                                               (>=
                                                                                #1#
                                                                                0)
                                                                               '(|NonNegativeInteger|)
                                                                               '(|Integer|)
                                                                               #1#))
                                                                            (QREFELT
                                                                             $
                                                                             26))
                                                                  (QREFELT $
                                                                           40)))))
                                                (LETT |k| (|inc_SI| |k|))
                                                (GO G190) G191 (EXIT NIL))
                                           (SPADCALL |c| |i| |j|
                                                     (SPADCALL
                                                      (SPADCALL |c| |i| |j|
                                                                (QREFELT $ 26))
                                                      |help| (QREFELT $ 41))
                                                     (QREFELT $ 27))
                                           (EXIT
                                            (LETT |colemanMatrix|
                                                  (SPADCALL |alpha| |beta|
                                                            |colemanMatrix|
                                                            (QREFELT $ 34)))))
                                          NIL (GO G190) G191 (EXIT NIL))))
                                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |c|)))))))) 

(SDEFUN |REP1;symmetricTensors;LPiL;6|
        ((|la| |List| (|Matrix| R)) (|k| |PositiveInteger|)
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G177 NIL) (|ma| NIL) (#2=#:G176 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |ma| NIL) (LETT #1# |la|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |ma| |k| (QREFELT $ 42)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;tensorProduct;3M;7|
        ((|a| |Matrix| R) (|b| |Matrix| R) ($ |Matrix| R))
        (SPADCALL |a| |b| (QREFELT $ 44))) 

(SDEFUN |REP1;tensorProduct;3L;8|
        ((|la| |List| (|Matrix| R)) (|lb| |List| (|Matrix| R))
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G182 NIL) (|i| NIL) (#2=#:G181 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |la| (QREFELT $ 46)))
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |la| |i| (QREFELT $ 47))
                                         (SPADCALL |lb| |i| (QREFELT $ 47))
                                         (QREFELT $ 45))
                               #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;tensorProduct;2M;9| ((|a| |Matrix| R) ($ |Matrix| R))
        (SPADCALL |a| |a| (QREFELT $ 45))) 

(SDEFUN |REP1;tensorProduct;2L;10|
        ((|la| |List| (|Matrix| R)) ($ |List| (|Matrix| R)))
        (SPADCALL |la| |la| (QREFELT $ 48))) 

(SDEFUN |REP1;permutationRepresentation;PIM;11|
        ((|p| |Permutation| (|Integer|)) (|n| |Integer|)
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G192 NIL) (|i| NIL) (|a| (|Matrix| (|Integer|)))
          (#2=#:G188 NIL) (#3=#:G187 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROG1 (LETT #3# |n|)
                   (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #3#))
                 (PROG1 (LETT #2# |n|)
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (QREFELT $ 51)))
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 53)) |i| 1
                           (QREFELT $ 54))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |a|)))) 

(SDEFUN |REP1;permutationRepresentation;LM;12|
        ((|p| |List| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G200 NIL) (|i| NIL) (|a| (|Matrix| (|Integer|)))
          (#2=#:G196 NIL) (#3=#:G195 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (LENGTH |p|))
              (LETT |a|
                    (SPADCALL
                     (PROG1 (LETT #3# |n|)
                       (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #3#))
                     (PROG1 (LETT #2# |n|)
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     (QREFELT $ 51)))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 10)) |i| 1
                               (QREFELT $ 54))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |a|)))) 

(SDEFUN |REP1;permutationRepresentation;LIL;13|
        ((|listperm| |List| (|Permutation| (|Integer|))) (|n| |Integer|)
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G204 NIL) (|perm| NIL) (#2=#:G203 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |perm| NIL) (LETT #1# |listperm|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |perm| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |perm| |n| (QREFELT $ 55))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;permutationRepresentation;LL;14|
        ((|listperm| |List| (|List| (|Integer|)))
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G208 NIL) (|perm| NIL) (#2=#:G207 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |perm| NIL) (LETT #1# |listperm|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |perm| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |perm| (QREFELT $ 56)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;createGenericMatrix;NniM;15|
        ((|m| |NonNegativeInteger|) ($ |Matrix| (|Polynomial| R)))
        (SPROG
         ((|sy| (|Symbol|)) (|le| (|List| (|OutputForm|)))
          (|jof| #1=(|OutputForm|)) (|iof| #1#) (#2=#:G215 NIL) (|j| NIL)
          (#3=#:G214 NIL) (|i| NIL) (|res| (|Matrix| (|Polynomial| R))))
         (SEQ (LETT |res| (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 63)))
              (SEQ (LETT |i| 1) (LETT #3# |m|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |m|) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ (LETT |iof| (SPADCALL |i| (QREFELT $ 65)))
                               (LETT |jof| (SPADCALL |j| (QREFELT $ 65)))
                               (LETT |le|
                                     (CONS |iof|
                                           (SPADCALL |jof| (QREFELT $ 67))))
                               (LETT |sy| (SPADCALL '|x| |le| (QREFELT $ 69)))
                               (EXIT
                                (SPADCALL |res| |i| |j|
                                          (SPADCALL |sy| (QREFELT $ 70))
                                          (QREFELT $ 72))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(DECLAIM (NOTINLINE |RepresentationPackage1;|)) 

(DEFUN |RepresentationPackage1| (#1=#:G216)
  (SPROG NIL
         (PROG (#2=#:G217)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RepresentationPackage1|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RepresentationPackage1;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RepresentationPackage1|)))))))))) 

(DEFUN |RepresentationPackage1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|RepresentationPackage1| DV$1))
          (LETT $ (GETREFV 74))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))))))
          (|haddProp| |$ConstructorCache| '|RepresentationPackage1| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 30
                       (CONS
                        (|dispatchFunction| |REP1;antisymmetricTensors;MPiM;3|)
                        $))
             (QSETREFV $ 32
                       (CONS
                        (|dispatchFunction| |REP1;antisymmetricTensors;LPiL;4|)
                        $)))))
          $))) 

(MAKEPROP '|RepresentationPackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|List| 7)
              (0 . |maxIndex|) (5 . |elt|) (|Vector| 7) (|Matrix| 7)
              (11 . |row|) (17 . |entries|) (|IntegerCombinatoricFunctions| 7)
              (22 . |multinomial|) (28 . |Zero|) (32 . |One|) (36 . |setelt!|)
              (43 . |binomial|) (|SymmetricGroupCombinatoricFunctions|)
              (49 . |subSet|) (|NonNegativeInteger|) (|Matrix| 6) (56 . |zero|)
              (62 . |elt|) (69 . |setelt!|) (77 . |determinant|)
              (|PositiveInteger|) (82 . |antisymmetricTensors|) (|List| 24)
              (88 . |antisymmetricTensors|) (94 . |unrankImproperPartitions1|)
              (101 . |nextColeman|) (|Boolean|) (108 . ~=)
              (114 . |inverseColeman|) (121 . |coerce|) (126 . |elt|) (132 . *)
              (138 . +) |REP1;symmetricTensors;MPiM;5|
              |REP1;symmetricTensors;LPiL;6| (144 . |kroneckerProduct|)
              |REP1;tensorProduct;3M;7| (150 . |maxIndex|) (155 . |elt|)
              |REP1;tensorProduct;3L;8| |REP1;tensorProduct;2M;9|
              |REP1;tensorProduct;2L;10| (161 . |zero|) (|Permutation| 7)
              (167 . |eval|) (173 . |setelt!|)
              |REP1;permutationRepresentation;PIM;11|
              |REP1;permutationRepresentation;LM;12| (|List| 12) (|List| 52)
              |REP1;permutationRepresentation;LIL;13| (|List| 8)
              |REP1;permutationRepresentation;LL;14| (|Polynomial| 6)
              (181 . |Zero|) (|OutputForm|) (185 . |coerce|) (|List| 64)
              (190 . |list|) (|Symbol|) (195 . |subscript|) (201 . |coerce|)
              (|Matrix| 62) (206 . |setelt!|)
              |REP1;createGenericMatrix;NniM;15|)
           '#(|tensorProduct| 214 |symmetricTensors| 236
              |permutationRepresentation| 248 |createGenericMatrix| 270
              |antisymmetricTensors| 275)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|antisymmetricTensors|
                                 ((|Matrix| |#1|) (|Matrix| |#1|)
                                  (|PositiveInteger|)))
                                (|has| 6 (|CommutativeRing|)))
                              '((|antisymmetricTensors|
                                 ((|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))
                                  (|PositiveInteger|)))
                                (|has| 6 (|CommutativeRing|)))
                              '((|createGenericMatrix|
                                 ((|Matrix| (|Polynomial| |#1|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|symmetricTensors|
                                 ((|Matrix| |#1|) (|Matrix| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|symmetricTensors|
                                 ((|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))
                                  (|PositiveInteger|)))
                                T)
                              '((|tensorProduct|
                                 ((|Matrix| |#1|) (|Matrix| |#1|)
                                  (|Matrix| |#1|)))
                                T)
                              '((|tensorProduct|
                                 ((|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))))
                                T)
                              '((|tensorProduct|
                                 ((|Matrix| |#1|) (|Matrix| |#1|)))
                                T)
                              '((|tensorProduct|
                                 ((|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))))
                                T)
                              '((|permutationRepresentation|
                                 ((|Matrix| (|Integer|))
                                  (|Permutation| (|Integer|)) (|Integer|)))
                                T)
                              '((|permutationRepresentation|
                                 ((|Matrix| (|Integer|)) (|List| (|Integer|))))
                                T)
                              '((|permutationRepresentation|
                                 ((|List| (|Matrix| (|Integer|)))
                                  (|List| (|Permutation| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|permutationRepresentation|
                                 ((|List| (|Matrix| (|Integer|)))
                                  (|List| (|List| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 73
                                            '(1 8 7 0 9 2 8 7 0 7 10 2 12 11 0
                                              7 13 1 11 8 0 14 2 15 7 7 8 16 0
                                              6 0 17 0 6 0 18 3 11 7 0 7 7 19 2
                                              15 7 7 7 20 3 21 8 7 7 7 22 2 24
                                              0 23 23 25 3 24 6 0 7 7 26 4 24 6
                                              0 7 7 6 27 1 24 6 0 28 2 0 24 24
                                              29 30 2 0 31 31 29 32 3 21 8 7 7
                                              7 33 3 21 12 8 8 12 34 2 12 35 0
                                              0 36 3 21 8 8 8 12 37 1 6 0 7 38
                                              2 11 7 0 7 39 2 6 0 0 0 40 2 6 0
                                              0 0 41 2 24 0 0 0 44 1 31 7 0 46
                                              2 31 24 0 7 47 2 12 0 23 23 51 2
                                              52 7 0 7 53 4 12 7 0 7 7 7 54 0
                                              62 0 63 1 7 64 0 65 1 66 0 64 67
                                              2 68 0 0 66 69 1 62 0 68 70 4 71
                                              62 0 7 7 62 72 2 0 24 24 24 45 2
                                              0 31 31 31 48 1 0 31 31 50 1 0 24
                                              24 49 2 0 24 24 29 42 2 0 31 31
                                              29 43 1 0 12 8 56 2 0 12 52 7 55
                                              1 0 57 60 61 2 0 57 58 7 59 1 0
                                              71 23 73 2 1 24 24 29 30 2 1 31
                                              31 29 32)))))
           '|lookupComplete|)) 
