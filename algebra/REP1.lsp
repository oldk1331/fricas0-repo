
(/VERSIONCHECK 2) 

(DEFUN |REP1;calcCoef| (|beta| C $)
  (PROG (|prod| #1=#:G132 |i|)
    (RETURN
     (SEQ (LETT |prod| 1 . #2=(|REP1;calcCoef|))
          (SEQ (LETT |i| 1 . #2#)
               (LETT #1# (SPADCALL |beta| (QREFELT $ 9)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |prod|
                       (* |prod|
                          (SPADCALL (SPADCALL |beta| |i| (QREFELT $ 10))
                                    (SPADCALL (SPADCALL C |i| (QREFELT $ 13))
                                              (QREFELT $ 14))
                                    (QREFELT $ 16)))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |prod|))))) 

(DEFUN |REP1;invContent| (|alpha| $)
  (PROG (|i| |k| |j| #1=#:G147 |og| |f| |n| #2=#:G139 #3=#:G137 #4=#:G136
         #5=#:G138 #6=#:G146 #7=#:G127)
    (RETURN
     (SEQ
      (LETT |n|
            (PROG1
                (LETT #2#
                      (PROGN
                       (LETT #3# NIL . #8=(|REP1;invContent|))
                       (SEQ (LETT #7# NIL . #8#) (LETT #6# |alpha| . #8#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT #7# (CAR #6#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #5# #7# . #8#)
                               (COND (#3# (LETT #4# (+ #4# #5#) . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #4# #5# . #8#)
                                       (LETT #3# 'T . #8#)))))))
                            (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#3# #4#) ('T 0)))
                      . #8#)
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #8#)
      (LETT |f| (MAKEARR1 |n| 0) . #8#) (LETT |i| 1 . #8#) (LETT |j| -1 . #8#)
      (SEQ (LETT |og| NIL . #8#) (LETT #1# |alpha| . #8#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |og| (CAR #1#) . #8#) NIL))
             (GO G191)))
           (SEQ (LETT |j| (+ |j| 1) . #8#)
                (EXIT
                 (SEQ (LETT |k| 1 . #8#) G190
                      (COND ((|greater_SI| |k| |og|) (GO G191)))
                      (SEQ (SPADCALL |f| |i| |j| (QREFELT $ 19))
                           (EXIT (LETT |i| (+ |i| 1) . #8#)))
                      (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191
                      (EXIT NIL))))
           (LETT #1# (CDR #1#) . #8#) (GO G190) G191 (EXIT NIL))
      (EXIT |f|))))) 

(DEFUN |REP1;antisymmetricTensors;MPiM;3| (|a| |k| $)
  (PROG (|tt| |rr| |t| |r| |lt| |lr| |c| |j| |i| |b| #1=#:G152 #2=#:G151 |il|
         #3=#:G163 #4=#:G162 |m| |n|)
    (RETURN
     (SEQ (LETT |n| (ANROWS |a|) . #5=(|REP1;antisymmetricTensors;MPiM;3|))
          (EXIT
           (COND ((EQL |k| 1) |a|)
                 ((SPADCALL |k| |n| (QREFELT $ 22))
                  (|error|
                   "second parameter for antisymmetricTensors is too large"))
                 ('T
                  (SEQ (LETT |m| (SPADCALL |n| |k| (QREFELT $ 23)) . #5#)
                       (LETT |il|
                             (PROGN
                              (LETT #4# NIL . #5#)
                              (SEQ (LETT |i| 0 . #5#)
                                   (LETT #3# (- |m| 1) . #5#) G190
                                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL |n| |k| |i|
                                                      (QREFELT $ 25))
                                            #4#)
                                           . #5#)))
                                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190)
                                   G191 (EXIT (NREVERSE #4#))))
                             . #5#)
                       (LETT |b|
                             (SPADCALL
                              (PROG1 (LETT #2# |m| . #5#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              (PROG1 (LETT #1# |m| . #5#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 27))
                             . #5#)
                       (SEQ (LETT |i| 1 . #5#) G190
                            (COND ((|greater_SI| |i| |m|) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |j| 1 . #5#) G190
                                   (COND ((|greater_SI| |j| |m|) (GO G191)))
                                   (SEQ
                                    (LETT |c| (SPADCALL |k| |k| (QREFELT $ 27))
                                          . #5#)
                                    (LETT |lr|
                                          (SPADCALL |il| |i| (QREFELT $ 29))
                                          . #5#)
                                    (LETT |lt|
                                          (SPADCALL |il| |j| (QREFELT $ 29))
                                          . #5#)
                                    (SEQ (LETT |r| 1 . #5#) G190
                                         (COND
                                          ((|greater_SI| |r| |k|) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |t| 1 . #5#) G190
                                                (COND
                                                 ((|greater_SI| |t| |k|)
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |rr|
                                                       (SPADCALL |lr| |r|
                                                                 (QREFELT $
                                                                          10))
                                                       . #5#)
                                                 (LETT |tt|
                                                       (SPADCALL |lt| |t|
                                                                 (QREFELT $
                                                                          10))
                                                       . #5#)
                                                 (EXIT
                                                  (SPADCALL |c| |r| |t|
                                                            (SPADCALL |a|
                                                                      (+ 1
                                                                         |rr|)
                                                                      (+ 1
                                                                         |tt|)
                                                                      (QREFELT
                                                                       $ 30))
                                                            (QREFELT $ 31))))
                                                (LETT |t| (|inc_SI| |t|) . #5#)
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT |r| (|inc_SI| |r|) . #5#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (SPADCALL |b| |i| |j|
                                               (SPADCALL |c| (QREFELT $ 32))
                                               (QREFELT $ 31))))
                                   (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                   G191 (EXIT NIL))))
                            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |b|))))))))) 

(DEFUN |REP1;antisymmetricTensors;LPiL;4| (|la| |k| $)
  (PROG (#1=#:G167 |ma| #2=#:G166)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|REP1;antisymmetricTensors;LPiL;4|))
       (SEQ (LETT |ma| NIL . #3#) (LETT #1# |la| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |ma| |k| (QREFELT $ 34)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |REP1;symmetricTensors;MPiM;5| (|a| |n| $)
  (PROG (|colemanMatrix| |help| #1=#:G170 #2=#:G169 |k| |gamma| |g| |beta| |j|
         |f| |alpha| |i| |nullMatrix| |c| |dim| #3=#:G168 |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #4=(|REP1;symmetricTensors;MPiM;5|))
          (EXIT
           (COND
            ((SPADCALL |m| (ANCOLS |a|) (QREFELT $ 37))
             (|error| "Input to symmetricTensors is no square matrix"))
            ((EQL |n| 1) |a|)
            ('T
             (SEQ
              (LETT |dim|
                    (PROG1
                        (LETT #3#
                              (SPADCALL (- (+ |m| |n|) 1) |n| (QREFELT $ 23))
                              . #4#)
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    . #4#)
              (LETT |c| (MAKE_MATRIX1 |dim| |dim| (|spadConstant| $ 17)) . #4#)
              (LETT |f| (MAKEARR1 |n| 0) . #4#)
              (LETT |g| (MAKEARR1 |n| 0) . #4#)
              (LETT |nullMatrix| (MAKE_MATRIX1 1 1 0) . #4#)
              (SEQ (LETT |i| 1 . #4#) G190
                   (COND ((|greater_SI| |i| |dim|) (GO G191)))
                   (SEQ
                    (LETT |alpha| (SPADCALL |n| |m| (- |i| 1) (QREFELT $ 38))
                          . #4#)
                    (LETT |f| (|REP1;invContent| |alpha| $) . #4#)
                    (EXIT
                     (SEQ (LETT |j| 1 . #4#) G190
                          (COND ((|greater_SI| |j| |dim|) (GO G191)))
                          (SEQ
                           (LETT |beta|
                                 (SPADCALL |n| |m| (- |j| 1) (QREFELT $ 38))
                                 . #4#)
                           (LETT |g| (|REP1;invContent| |beta| $) . #4#)
                           (LETT |colemanMatrix|
                                 (SPADCALL |alpha| |beta| |nullMatrix|
                                           (QREFELT $ 39))
                                 . #4#)
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
                                        . #4#)
                                  (LETT |help|
                                        (SPADCALL
                                         (|REP1;calcCoef| |beta|
                                          |colemanMatrix| $)
                                         (QREFELT $ 42))
                                        . #4#)
                                  (SEQ (LETT |k| 1 . #4#) G190
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
                                                                        (+ 1
                                                                           (SPADCALL
                                                                            |f|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             43)))
                                                                        . #4#)
                                                                     (|check_subtype|
                                                                      (>= #2#
                                                                          0)
                                                                      '(|NonNegativeInteger|)
                                                                      #2#))
                                                                   (PROG1
                                                                       (LETT
                                                                        #1#
                                                                        (+ 1
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
                                                                        . #4#)
                                                                     (|check_subtype|
                                                                      (>= #1#
                                                                          0)
                                                                      '(|NonNegativeInteger|)
                                                                      #1#))
                                                                   (QREFELT $
                                                                            30))
                                                         (QREFELT $ 44))
                                               . #4#)))
                                       (LETT |k| (|inc_SI| |k|) . #4#)
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
                                         . #4#)))
                                 NIL (GO G190) G191 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |c|))))))))) 

(DEFUN |REP1;symmetricTensors;LPiL;6| (|la| |k| $)
  (PROG (#1=#:G184 |ma| #2=#:G183)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|REP1;symmetricTensors;LPiL;6|))
       (SEQ (LETT |ma| NIL . #3#) (LETT #1# |la| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |ma| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |ma| |k| (QREFELT $ 46)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |REP1;tensorProduct;3M;7| (|a| |b| $) (SPADCALL |a| |b| (QREFELT $ 48))) 

(DEFUN |REP1;tensorProduct;3L;8| (|la| |lb| $)
  (PROG (#1=#:G189 |i| #2=#:G188)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|REP1;tensorProduct;3L;8|))
       (SEQ (LETT |i| 1 . #3#) (LETT #1# (SPADCALL |la| (QREFELT $ 50)) . #3#)
            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
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
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |REP1;tensorProduct;2M;9| (|a| $) (SPADCALL |a| |a| (QREFELT $ 49))) 

(DEFUN |REP1;tensorProduct;2L;10| (|la| $) (SPADCALL |la| |la| (QREFELT $ 52))) 

(DEFUN |REP1;permutationRepresentation;PIM;11| (|p| |n| $)
  (PROG (|i| |a| #1=#:G195 #2=#:G194)
    (RETURN
     (SEQ
      (LETT |a|
            (SPADCALL
             (PROG1
                 (LETT #2# |n| . #3=(|REP1;permutationRepresentation;PIM;11|))
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (PROG1 (LETT #1# |n| . #3#)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
             (QREFELT $ 55))
            . #3#)
      (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 57)) |i| 1
                       (QREFELT $ 58))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |a|))))) 

(DEFUN |REP1;permutationRepresentation;LM;12| (|p| $)
  (PROG (|i| |a| #1=#:G202 #2=#:G201 |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |p|) . #3=(|REP1;permutationRepresentation;LM;12|))
          (LETT |a|
                (SPADCALL
                 (PROG1 (LETT #2# |n| . #3#)
                   (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                 (PROG1 (LETT #1# |n| . #3#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                 (QREFELT $ 55))
                . #3#)
          (SEQ (LETT |i| 1 . #3#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |a| (SPADCALL |p| |i| (QREFELT $ 10)) |i| 1
                           (QREFELT $ 58))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |a|))))) 

(DEFUN |REP1;permutationRepresentation;LIL;13| (|listperm| |n| $)
  (PROG (#1=#:G209 |perm| #2=#:G208)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|REP1;permutationRepresentation;LIL;13|))
       (SEQ (LETT |perm| NIL . #3#) (LETT #1# |listperm| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |perm| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |perm| |n| (QREFELT $ 59)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |REP1;permutationRepresentation;LL;14| (|listperm| $)
  (PROG (#1=#:G213 |perm| #2=#:G212)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|REP1;permutationRepresentation;LL;14|))
       (SEQ (LETT |perm| NIL . #3#) (LETT #1# |listperm| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |perm| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |perm| (QREFELT $ 60)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |REP1;createGenericMatrix;NniM;15| (|m| $)
  (PROG (|sy| |le| |jof| |iof| |j| |i| |res|)
    (RETURN
     (SEQ
      (LETT |res| (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 66))
            . #1=(|REP1;createGenericMatrix;NniM;15|))
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #1#) G190
                  (COND ((|greater_SI| |j| |m|) (GO G191)))
                  (SEQ (LETT |iof| (SPADCALL |i| (QREFELT $ 68)) . #1#)
                       (LETT |jof| (SPADCALL |j| (QREFELT $ 68)) . #1#)
                       (LETT |le| (CONS |iof| (SPADCALL |jof| (QREFELT $ 70)))
                             . #1#)
                       (LETT |sy| (SPADCALL '|x| |le| (QREFELT $ 72)) . #1#)
                       (EXIT
                        (SPADCALL |res| |i| |j| (SPADCALL |sy| (QREFELT $ 73))
                                  (QREFELT $ 75))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DECLAIM (NOTINLINE |RepresentationPackage1;|)) 

(DEFUN |RepresentationPackage1| (#1=#:G219)
  (PROG ()
    (RETURN
     (PROG (#2=#:G220)
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
              (HREM |$ConstructorCache| '|RepresentationPackage1|))))))))))) 

(DEFUN |RepresentationPackage1;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
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
                    (|dispatchFunction| |REP1;antisymmetricTensors;MPiM;3|) $))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction| |REP1;antisymmetricTensors;LPiL;4|)
                    $)))))
      $)))) 

(MAKEPROP '|RepresentationPackage1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|List| 7)
              (0 . |maxIndex|) (5 . |elt|) (|Vector| 7) (|Matrix| 7)
              (11 . |row|) (17 . |entries|) (|IntegerCombinatoricFunctions| 7)
              (22 . |multinomial|) (28 . |Zero|) (32 . |One|) (36 . |setelt|)
              (|Boolean|) (|NonNegativeInteger|) (43 . >) (49 . |binomial|)
              (|SymmetricGroupCombinatoricFunctions|) (55 . |subSet|)
              (|Matrix| 6) (62 . |zero|) (|List| 8) (68 . |elt|) (74 . |elt|)
              (81 . |setelt|) (89 . |determinant|) (|PositiveInteger|)
              (94 . |antisymmetricTensors|) (|List| 26)
              (100 . |antisymmetricTensors|) (106 . ~=)
              (112 . |unrankImproperPartitions1|) (119 . |nextColeman|)
              (126 . ~=) (132 . |inverseColeman|) (139 . |coerce|)
              (144 . |elt|) (150 . *) (156 . +) |REP1;symmetricTensors;MPiM;5|
              |REP1;symmetricTensors;LPiL;6| (162 . |kroneckerProduct|)
              |REP1;tensorProduct;3M;7| (168 . |maxIndex|) (173 . |elt|)
              |REP1;tensorProduct;3L;8| |REP1;tensorProduct;2M;9|
              |REP1;tensorProduct;2L;10| (179 . |zero|) (|Permutation| 7)
              (185 . |eval|) (191 . |setelt|)
              |REP1;permutationRepresentation;PIM;11|
              |REP1;permutationRepresentation;LM;12| (|List| 12) (|List| 56)
              |REP1;permutationRepresentation;LIL;13|
              |REP1;permutationRepresentation;LL;14| (|Polynomial| 6)
              (199 . |Zero|) (|OutputForm|) (203 . |coerce|) (|List| 67)
              (208 . |list|) (|Symbol|) (213 . |subscript|) (219 . |coerce|)
              (|Matrix| 65) (224 . |setelt|)
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
