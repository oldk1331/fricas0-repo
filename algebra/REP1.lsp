
(SDEFUN |REP1;calcCoef|
        ((|beta| |List| (|Integer|)) (C |Matrix| (|Integer|)) ($ |Integer|))
        (SPROG ((|prod| (|Integer|)) (#1=#:G109 NIL) (|i| NIL))
               (SEQ (LETT |prod| 1 . #2=(|REP1;calcCoef|))
                    (SEQ (LETT |i| 1 . #2#)
                         (LETT #1# (SPADCALL |beta| (QREFELT $ 9)) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |prod|
                                 (* |prod|
                                    (SPADCALL
                                     (SPADCALL |beta| |i| (QREFELT $ 10))
                                     (SPADCALL (SPADCALL C |i| (QREFELT $ 13))
                                               (QREFELT $ 14))
                                     (QREFELT $ 16)))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |prod|)))) 

(SDEFUN |REP1;invContent|
        ((|alpha| |List| #1=(|Integer|)) ($ |Vector| (|Integer|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (|k| NIL) (|j| (|Integer|))
          (#2=#:G124 NIL) (|og| NIL) (|f| (|Vector| (|Integer|)))
          (|n| (|NonNegativeInteger|)) (#3=#:G116 NIL) (#4=#:G114 NIL)
          (#5=#:G113 #1#) (#6=#:G115 #1#) (#7=#:G123 NIL) (#8=#:G104 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #3#
                          (PROGN
                           (LETT #4# NIL . #9=(|REP1;invContent|))
                           (SEQ (LETT #8# NIL . #9#) (LETT #7# |alpha| . #9#)
                                G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT #8# (CAR #7#) . #9#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #6# #8# . #9#)
                                   (COND (#4# (LETT #5# (+ #5# #6#) . #9#))
                                         ('T
                                          (PROGN
                                           (LETT #5# #6# . #9#)
                                           (LETT #4# 'T . #9#)))))))
                                (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#4# #5#) ('T 0)))
                          . #9#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #9#)
          (LETT |f| (MAKEARR1 |n| 0) . #9#) (LETT |i| 1 . #9#)
          (LETT |j| -1 . #9#)
          (SEQ (LETT |og| NIL . #9#) (LETT #2# |alpha| . #9#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |og| (CAR #2#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |j| (+ |j| 1) . #9#)
                    (EXIT
                     (SEQ (LETT |k| 1 . #9#) G190
                          (COND ((|greater_SI| |k| |og|) (GO G191)))
                          (SEQ (SPADCALL |f| |i| |j| (QREFELT $ 19))
                               (EXIT (LETT |i| (+ |i| 1) . #9#)))
                          (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |f|)))) 

(SDEFUN |REP1;antisymmetricTensors;MPiM;3|
        ((|a| |Matrix| R) (|k| |PositiveInteger|) ($ |Matrix| R))
        (SPROG
         ((|tt| #1=(|Integer|)) (|rr| #1#) (|t| NIL) (|r| NIL)
          (|lt| #2=(|List| (|Integer|))) (|lr| #2#) (|c| #3=(|Matrix| R))
          (|j| NIL) (|i| NIL) (|b| #3#) (#4=#:G129 NIL) (#5=#:G128 NIL)
          (|il| (|List| (|List| (|Integer|)))) (#6=#:G140 NIL) (#7=#:G139 NIL)
          (|m| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS |a|) . #8=(|REP1;antisymmetricTensors;MPiM;3|))
              (EXIT
               (COND ((EQL |k| 1) |a|)
                     ((SPADCALL |k| |n| (QREFELT $ 22))
                      (|error|
                       "second parameter for antisymmetricTensors is too large"))
                     ('T
                      (SEQ (LETT |m| (SPADCALL |n| |k| (QREFELT $ 23)) . #8#)
                           (LETT |il|
                                 (PROGN
                                  (LETT #7# NIL . #8#)
                                  (SEQ (LETT |i| 0 . #8#)
                                       (LETT #6# (- |m| 1) . #8#) G190
                                       (COND
                                        ((|greater_SI| |i| #6#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #7#
                                               (CONS
                                                (SPADCALL |n| |k| |i|
                                                          (QREFELT $ 25))
                                                #7#)
                                               . #8#)))
                                       (LETT |i| (|inc_SI| |i|) . #8#)
                                       (GO G190) G191 (EXIT (NREVERSE #7#))))
                                 . #8#)
                           (LETT |b|
                                 (SPADCALL
                                  (PROG1 (LETT #5# |m| . #8#)
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  (PROG1 (LETT #4# |m| . #8#)
                                    (|check_subtype2| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#))
                                  (QREFELT $ 27))
                                 . #8#)
                           (SEQ (LETT |i| 1 . #8#) G190
                                (COND ((|greater_SI| |i| |m|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |j| 1 . #8#) G190
                                       (COND
                                        ((|greater_SI| |j| |m|) (GO G191)))
                                       (SEQ
                                        (LETT |c|
                                              (SPADCALL |k| |k| (QREFELT $ 27))
                                              . #8#)
                                        (LETT |lr|
                                              (SPADCALL |il| |i|
                                                        (QREFELT $ 29))
                                              . #8#)
                                        (LETT |lt|
                                              (SPADCALL |il| |j|
                                                        (QREFELT $ 29))
                                              . #8#)
                                        (SEQ (LETT |r| 1 . #8#) G190
                                             (COND
                                              ((|greater_SI| |r| |k|)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (SEQ (LETT |t| 1 . #8#) G190
                                                    (COND
                                                     ((|greater_SI| |t| |k|)
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |rr|
                                                           (SPADCALL |lr| |r|
                                                                     (QREFELT $
                                                                              10))
                                                           . #8#)
                                                     (LETT |tt|
                                                           (SPADCALL |lt| |t|
                                                                     (QREFELT $
                                                                              10))
                                                           . #8#)
                                                     (EXIT
                                                      (SPADCALL |c| |r| |t|
                                                                (SPADCALL |a|
                                                                          (+ 1
                                                                             |rr|)
                                                                          (+ 1
                                                                             |tt|)
                                                                          (QREFELT
                                                                           $
                                                                           30))
                                                                (QREFELT $
                                                                         31))))
                                                    (LETT |t| (|inc_SI| |t|)
                                                          . #8#)
                                                    (GO G190) G191
                                                    (EXIT NIL))))
                                             (LETT |r| (|inc_SI| |r|) . #8#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT
                                         (SPADCALL |b| |i| |j|
                                                   (SPADCALL |c|
                                                             (QREFELT $ 32))
                                                   (QREFELT $ 31))))
                                       (LETT |j| (|inc_SI| |j|) . #8#)
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |b|)))))))) 

(SDEFUN |REP1;antisymmetricTensors;LPiL;4|
        ((|la| |List| (|Matrix| R)) (|k| |PositiveInteger|)
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G144 NIL) (|ma| NIL) (#2=#:G143 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;antisymmetricTensors;LPiL;4|))
                 (SEQ (LETT |ma| NIL . #3#) (LETT #1# |la| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |ma| |k| (QREFELT $ 34)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;symmetricTensors;MPiM;5|
        ((|a| |Matrix| R) (|n| |PositiveInteger|) ($ |Matrix| R))
        (SPROG
         ((|colemanMatrix| (|Matrix| (|Integer|))) (|help| (R)) (#1=#:G147 NIL)
          (#2=#:G146 NIL) (|k| NIL) (|gamma| (|List| (|Integer|)))
          (|g| #3=(|Vector| (|Integer|))) (|beta| #4=(|List| (|Integer|)))
          (|j| NIL) (|f| #3#) (|alpha| #4#) (|i| NIL)
          (|nullMatrix| (|Matrix| (|Integer|))) (|c| (|Matrix| R))
          (|dim| (|NonNegativeInteger|)) (#5=#:G145 NIL)
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |a|) . #6=(|REP1;symmetricTensors;MPiM;5|))
              (EXIT
               (COND
                ((SPADCALL |m| (ANCOLS |a|) (QREFELT $ 37))
                 (|error| "Input to symmetricTensors is no square matrix"))
                ((EQL |n| 1) |a|)
                ('T
                 (SEQ
                  (LETT |dim|
                        (PROG1
                            (LETT #5#
                                  (SPADCALL (- (+ |m| |n|) 1) |n|
                                            (QREFELT $ 23))
                                  . #6#)
                          (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #5#))
                        . #6#)
                  (LETT |c| (MAKE_MATRIX1 |dim| |dim| (|spadConstant| $ 17))
                        . #6#)
                  (LETT |f| (MAKEARR1 |n| 0) . #6#)
                  (LETT |g| (MAKEARR1 |n| 0) . #6#)
                  (LETT |nullMatrix| (MAKE_MATRIX1 1 1 0) . #6#)
                  (SEQ (LETT |i| 1 . #6#) G190
                       (COND ((|greater_SI| |i| |dim|) (GO G191)))
                       (SEQ
                        (LETT |alpha|
                              (SPADCALL |n| |m| (- |i| 1) (QREFELT $ 38))
                              . #6#)
                        (LETT |f| (|REP1;invContent| |alpha| $) . #6#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #6#) G190
                              (COND ((|greater_SI| |j| |dim|) (GO G191)))
                              (SEQ
                               (LETT |beta|
                                     (SPADCALL |n| |m| (- |j| 1)
                                               (QREFELT $ 38))
                                     . #6#)
                               (LETT |g| (|REP1;invContent| |beta| $) . #6#)
                               (LETT |colemanMatrix|
                                     (SPADCALL |alpha| |beta| |nullMatrix|
                                               (QREFELT $ 39))
                                     . #6#)
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |colemanMatrix| |nullMatrix|
                                                  (QREFELT $ 40)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |gamma|
                                            (SPADCALL |alpha| |beta|
                                                      |colemanMatrix|
                                                      (QREFELT $ 41))
                                            . #6#)
                                      (LETT |help|
                                            (SPADCALL
                                             (|REP1;calcCoef| |beta|
                                              |colemanMatrix| $)
                                             (QREFELT $ 42))
                                            . #6#)
                                      (SEQ (LETT |k| 1 . #6#) G190
                                           (COND
                                            ((|greater_SI| |k| |n|) (GO G191)))
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
                                                                               43)))
                                                                            . #6#)
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
                                                                               43)))
                                                                            . #6#)
                                                                         (|check_subtype2|
                                                                          (>=
                                                                           #1#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          '(|Integer|)
                                                                          #1#))
                                                                       (QREFELT
                                                                        $ 30))
                                                             (QREFELT $ 44))
                                                   . #6#)))
                                           (LETT |k| (|inc_SI| |k|) . #6#)
                                           (GO G190) G191 (EXIT NIL))
                                      (SPADCALL |c| |i| |j|
                                                (SPADCALL
                                                 (SPADCALL |c| |i| |j|
                                                           (QREFELT $ 30))
                                                 |help| (QREFELT $ 45))
                                                (QREFELT $ 31))
                                      (EXIT
                                       (LETT |colemanMatrix|
                                             (SPADCALL |alpha| |beta|
                                                       |colemanMatrix|
                                                       (QREFELT $ 39))
                                             . #6#)))
                                     NIL (GO G190) G191 (EXIT NIL))))
                              (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |c|)))))))) 

(SDEFUN |REP1;symmetricTensors;LPiL;6|
        ((|la| |List| (|Matrix| R)) (|k| |PositiveInteger|)
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G161 NIL) (|ma| NIL) (#2=#:G160 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;symmetricTensors;LPiL;6|))
                 (SEQ (LETT |ma| NIL . #3#) (LETT #1# |la| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |ma| |k| (QREFELT $ 46)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;tensorProduct;3M;7|
        ((|a| |Matrix| R) (|b| |Matrix| R) ($ |Matrix| R))
        (SPADCALL |a| |b| (QREFELT $ 48))) 

(SDEFUN |REP1;tensorProduct;3L;8|
        ((|la| |List| (|Matrix| R)) (|lb| |List| (|Matrix| R))
         ($ |List| (|Matrix| R)))
        (SPROG ((#1=#:G166 NIL) (|i| NIL) (#2=#:G165 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;tensorProduct;3L;8|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (SPADCALL |la| (QREFELT $ 50)) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |la| |i| (QREFELT $ 51))
                                         (SPADCALL |lb| |i| (QREFELT $ 51))
                                         (QREFELT $ 49))
                               #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;tensorProduct;2M;9| ((|a| |Matrix| R) ($ |Matrix| R))
        (SPADCALL |a| |a| (QREFELT $ 49))) 

(SDEFUN |REP1;tensorProduct;2L;10|
        ((|la| |List| (|Matrix| R)) ($ |List| (|Matrix| R)))
        (SPADCALL |la| |la| (QREFELT $ 52))) 

(SDEFUN |REP1;permutationRepresentation;PIM;11|
        ((|p| |Permutation| (|Integer|)) (|n| |Integer|)
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((|i| NIL) (|a| (|Matrix| (|Integer|))) (#1=#:G172 NIL)
          (#2=#:G171 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROG1
                     (LETT #2# |n|
                           . #3=(|REP1;permutationRepresentation;PIM;11|))
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (PROG1 (LETT #1# |n| . #3#)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#))
                 (QREFELT $ 55))
                . #3#)
          (SEQ (LETT |i| 1 . #3#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 57)) |i| 1
                           (QREFELT $ 58))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |a|)))) 

(SDEFUN |REP1;permutationRepresentation;LM;12|
        ((|p| |List| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|i| NIL) (|a| (|Matrix| (|Integer|))) (#1=#:G179 NIL)
          (#2=#:G178 NIL) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (LENGTH |p|) . #3=(|REP1;permutationRepresentation;LM;12|))
          (LETT |a|
                (SPADCALL
                 (PROG1 (LETT #2# |n| . #3#)
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 (PROG1 (LETT #1# |n| . #3#)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#))
                 (QREFELT $ 55))
                . #3#)
          (SEQ (LETT |i| 1 . #3#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 10)) |i| 1
                           (QREFELT $ 58))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |a|)))) 

(SDEFUN |REP1;permutationRepresentation;LIL;13|
        ((|listperm| |List| (|Permutation| (|Integer|))) (|n| |Integer|)
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G186 NIL) (|perm| NIL) (#2=#:G185 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;permutationRepresentation;LIL;13|))
                 (SEQ (LETT |perm| NIL . #3#) (LETT #1# |listperm| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |perm| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |perm| |n| (QREFELT $ 59)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;permutationRepresentation;LL;14|
        ((|listperm| |List| (|List| (|Integer|)))
         ($ |List| (|Matrix| (|Integer|))))
        (SPROG ((#1=#:G190 NIL) (|perm| NIL) (#2=#:G189 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|REP1;permutationRepresentation;LL;14|))
                 (SEQ (LETT |perm| NIL . #3#) (LETT #1# |listperm| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |perm| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |perm| (QREFELT $ 60)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REP1;createGenericMatrix;NniM;15|
        ((|m| |NonNegativeInteger|) ($ |Matrix| (|Polynomial| R)))
        (SPROG
         ((|sy| (|Symbol|)) (|le| (|List| (|OutputForm|)))
          (|jof| #1=(|OutputForm|)) (|iof| #1#) (|j| NIL) (|i| NIL)
          (|res| (|Matrix| (|Polynomial| R))))
         (SEQ
          (LETT |res| (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 66))
                . #2=(|REP1;createGenericMatrix;NniM;15|))
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |m|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #2#) G190
                      (COND ((|greater_SI| |j| |m|) (GO G191)))
                      (SEQ (LETT |iof| (SPADCALL |i| (QREFELT $ 68)) . #2#)
                           (LETT |jof| (SPADCALL |j| (QREFELT $ 68)) . #2#)
                           (LETT |le|
                                 (CONS |iof| (SPADCALL |jof| (QREFELT $ 70)))
                                 . #2#)
                           (LETT |sy| (SPADCALL '|x| |le| (QREFELT $ 72))
                                 . #2#)
                           (EXIT
                            (SPADCALL |res| |i| |j|
                                      (SPADCALL |sy| (QREFELT $ 73))
                                      (QREFELT $ 75))))
                      (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |RepresentationPackage1;|)) 

(DEFUN |RepresentationPackage1| (#1=#:G196)
  (SPROG NIL
         (PROG (#2=#:G197)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RepresentationPackage1|)
                                               '|domainEqualList|)
                    . #3=(|RepresentationPackage1|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RepresentationPackage1;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RepresentationPackage1|)))))))))) 

(DEFUN |RepresentationPackage1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RepresentationPackage1|))
          (LETT |dv$| (LIST '|RepresentationPackage1| DV$1) . #1#)
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|RepresentationPackage1| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 34
                       (CONS
                        (|dispatchFunction| |REP1;antisymmetricTensors;MPiM;3|)
                        $))
             (QSETREFV $ 36
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
              (|Boolean|) (|NonNegativeInteger|) (43 . >) (49 . |binomial|)
              (|SymmetricGroupCombinatoricFunctions|) (55 . |subSet|)
              (|Matrix| 6) (62 . |zero|) (|List| 8) (68 . |elt|) (74 . |elt|)
              (81 . |setelt!|) (89 . |determinant|) (|PositiveInteger|)
              (94 . |antisymmetricTensors|) (|List| 26)
              (100 . |antisymmetricTensors|) (106 . ~=)
              (112 . |unrankImproperPartitions1|) (119 . |nextColeman|)
              (126 . ~=) (132 . |inverseColeman|) (139 . |coerce|)
              (144 . |elt|) (150 . *) (156 . +) |REP1;symmetricTensors;MPiM;5|
              |REP1;symmetricTensors;LPiL;6| (162 . |kroneckerProduct|)
              |REP1;tensorProduct;3M;7| (168 . |maxIndex|) (173 . |elt|)
              |REP1;tensorProduct;3L;8| |REP1;tensorProduct;2M;9|
              |REP1;tensorProduct;2L;10| (179 . |zero|) (|Permutation| 7)
              (185 . |eval|) (191 . |setelt!|)
              |REP1;permutationRepresentation;PIM;11|
              |REP1;permutationRepresentation;LM;12| (|List| 12) (|List| 56)
              |REP1;permutationRepresentation;LIL;13|
              |REP1;permutationRepresentation;LL;14| (|Polynomial| 6)
              (199 . |Zero|) (|OutputForm|) (203 . |coerce|) (|List| 67)
              (208 . |list|) (|Symbol|) (213 . |subscript|) (219 . |coerce|)
              (|Matrix| 65) (224 . |setelt!|)
              |REP1;createGenericMatrix;NniM;15|)
           '#(|tensorProduct| 232 |symmetricTensors| 254
              |permutationRepresentation| 266 |createGenericMatrix| 288
              |antisymmetricTensors| 293)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 8 7 0 9 2 8 7 0 7 10 2 12
                                                   11 0 7 13 1 11 8 0 14 2 15 7
                                                   7 8 16 0 6 0 17 0 6 0 18 3
                                                   11 7 0 7 7 19 2 21 20 0 0 22
                                                   2 15 7 7 7 23 3 24 8 7 7 7
                                                   25 2 26 0 21 21 27 2 28 8 0
                                                   7 29 3 26 6 0 7 7 30 4 26 6
                                                   0 7 7 6 31 1 26 6 0 32 2 0
                                                   26 26 33 34 2 0 35 35 33 36
                                                   2 21 20 0 0 37 3 24 8 7 7 7
                                                   38 3 24 12 8 8 12 39 2 12 20
                                                   0 0 40 3 24 8 8 8 12 41 1 6
                                                   0 7 42 2 11 7 0 7 43 2 6 0 0
                                                   0 44 2 6 0 0 0 45 2 26 0 0 0
                                                   48 1 35 7 0 50 2 35 26 0 7
                                                   51 2 12 0 21 21 55 2 56 7 0
                                                   7 57 4 12 7 0 7 7 7 58 0 65
                                                   0 66 1 7 67 0 68 1 69 0 67
                                                   70 2 71 0 0 69 72 1 65 0 71
                                                   73 4 74 65 0 7 7 65 75 2 0
                                                   26 26 26 49 2 0 35 35 35 52
                                                   1 0 35 35 54 1 0 26 26 53 2
                                                   0 26 26 33 46 2 0 35 35 33
                                                   47 1 0 12 8 60 2 0 12 56 7
                                                   59 1 0 61 28 64 2 0 61 62 7
                                                   63 1 0 74 21 76 2 1 26 26 33
                                                   34 2 1 35 35 33 36)))))
           '|lookupComplete|)) 
