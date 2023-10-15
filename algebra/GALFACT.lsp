
(SDEFUN |GALFACT;useEisensteinCriterion?;B;1| (($ |Boolean|)) (QREFELT $ 11)) 

(SDEFUN |GALFACT;useEisensteinCriterion;2B;2| ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|#G5| (|Boolean|)) (|#G4| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G4| |b| . #1=(|GALFACT;useEisensteinCriterion;2B;2|))
                 (LETT |#G5| (QREFELT $ 11) . #1#)
                 (SETELT $ 11 |#G4|)
                 (LETT |b| |#G5| . #1#))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;tryFunctionalDecomposition?;B;3| (($ |Boolean|))
        (QREFELT $ 10)) 

(SDEFUN |GALFACT;tryFunctionalDecomposition;2B;4|
        ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|#G8| (|Boolean|)) (|#G7| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G7| |b|
                       . #1=(|GALFACT;tryFunctionalDecomposition;2B;4|))
                 (LETT |#G8| (QREFELT $ 10) . #1#)
                 (SETELT $ 10 |#G7|)
                 (LETT |b| |#G8| . #1#))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;useSingleFactorBound?;B;5| (($ |Boolean|)) (QREFELT $ 9)) 

(SDEFUN |GALFACT;useSingleFactorBound;2B;6| ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|#G11| (|Boolean|)) (|#G10| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G10| |b| . #1=(|GALFACT;useSingleFactorBound;2B;6|))
                 (LETT |#G11| (QREFELT $ 9) . #1#)
                 (SETELT $ 9 |#G10|)
                 (LETT |b| |#G11| . #1#))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;stopMusserTrials;Pi;7| (($ |PositiveInteger|)) (QREFELT $ 8)) 

(SDEFUN |GALFACT;stopMusserTrials;2Pi;8|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|#G14| (|PositiveInteger|)) (|#G13| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G13| |n| . #1=(|GALFACT;stopMusserTrials;2Pi;8|))
                 (LETT |#G14| (QREFELT $ 8) . #1#)
                 (SETELT $ 8 |#G13|)
                 (LETT |n| |#G14| . #1#))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;musserTrials;Pi;9| (($ |PositiveInteger|)) (QREFELT $ 7)) 

(SDEFUN |GALFACT;musserTrials;2Pi;10|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|#G17| (|PositiveInteger|)) (|#G16| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G16| |n| . #1=(|GALFACT;musserTrials;2Pi;10|))
                 (LETT |#G17| (QREFELT $ 7) . #1#)
                 (SETELT $ 7 |#G16|)
                 (LETT |n| |#G17| . #1#))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;eisensteinIrreducible?;UPB;11| ((|f| UP) ($ |Boolean|))
        (SPROG
         ((#1=#:G193 NIL) (#2=#:G194 NIL) (|p| NIL) (|rf| (UP))
          (|tc| #3=(|Integer|)) (|lc| #3#) (|c| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rf| (SPADCALL |f| (QREFELT $ 24))
                  . #4=(|GALFACT;eisensteinIrreducible?;UPB;11|))
            (LETT |c| (SPADCALL |rf| (QREFELT $ 26)) . #4#)
            (EXIT
             (COND ((OR (ZEROP |c|) (SPADCALL |c| (QREFELT $ 27))) NIL)
                   ('T
                    (SEQ (LETT |lc| (SPADCALL |f| (QREFELT $ 28)) . #4#)
                         (LETT |tc| |lc| . #4#)
                         (SEQ G190
                              (COND
                               ((NULL (NULL (SPADCALL |rf| (QREFELT $ 29))))
                                (GO G191)))
                              (SEQ
                               (LETT |tc| (SPADCALL |rf| (QREFELT $ 28)) . #4#)
                               (EXIT
                                (LETT |rf| (SPADCALL |rf| (QREFELT $ 24))
                                      . #4#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (SEQ (LETT |p| NIL . #4#)
                              (LETT #2#
                                    (SPADCALL (SPADCALL |c| (QREFELT $ 31))
                                              (QREFELT $ 35))
                                    . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |p| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (QCDR |p|) 1)
                                  (COND
                                   ((NULL (ZEROP (REM |lc| (QCAR |p|))))
                                    (COND
                                     ((NULL
                                       (ZEROP (REM |tc| (EXPT (QCAR |p|) 2))))
                                      (PROGN
                                       (LETT #1# 'T . #4#)
                                       (GO #5=#:G192))))))))))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT NIL)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |GALFACT;numberOfFactors;LNni;12|
        ((|ddlist| |List|
          (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|))))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G196 NIL) (|d| (|Integer|))
          (#2=#:G203 NIL) (|dd| NIL))
         (SEQ (LETT |n| 0 . #3=(|GALFACT;numberOfFactors;LNni;12|))
              (LETT |d| 0 . #3#)
              (SEQ (LETT |dd| NIL . #3#) (LETT #2# |ddlist| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |dd| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |n|
                           (+ |n|
                              (COND
                               ((ZEROP
                                 (LETT |d|
                                       (SPADCALL (QCAR |dd|) (QREFELT $ 38))
                                       . #3#))
                                1)
                               ('T
                                (PROG1
                                    (LETT #1# (QUOTIENT2 |d| (QCDR |dd|))
                                          . #3#)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#)))))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |n|)))) 

(SDEFUN |GALFACT;shiftSet|
        ((|s| |Set| (|NonNegativeInteger|)) (|shift| |NonNegativeInteger|)
         ($ |Set| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G207 NIL) (|e| NIL) (#2=#:G206 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|GALFACT;shiftSet|))
                  (SEQ (LETT |e| NIL . #3#)
                       (LETT #1# (SPADCALL |s| (QREFELT $ 44)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (+ |e| |shift|) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 45))))) 

(SDEFUN |GALFACT;reductum| ((|n| |Integer|) ($ |Integer|))
        (- |n| (ASH 1 (- (INTEGER-LENGTH |n|) 1)))) 

(SDEFUN |GALFACT;seed| ((|level| |Integer|) ($ |Integer|))
        (- (ASH 1 |level|) 1)) 

(SDEFUN |GALFACT;nextRecNum|
        ((|levels| |NonNegativeInteger|) (|level| |Integer|) (|n| |Integer|)
         ($ |Union| "End of level" (|Integer|)))
        (SPROG
         ((|b| (|Integer|)) (|lr| #1=(|Integer|)) (#2=#:G218 NIL) (|l| #1#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |l| (INTEGER-LENGTH |n|) . #3=(|GALFACT;nextRecNum|))
                 (EXIT
                  (COND
                   ((< |l| |levels|)
                    (PROGN
                     (LETT #2# (CONS 1 (+ |n| (ASH 1 (- |l| 1)))) . #3#)
                     (GO #4=#:G217))))))
            (EXIT
             (COND
              ((EQL |n| (ASH (|GALFACT;seed| |level| $) (- |levels| |level|)))
               (CONS 0 "End of level"))
              ('T
               (SEQ (LETT |b| 1 . #3#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (EQL (- |l| |b|)
                                 (LETT |lr|
                                       (INTEGER-LENGTH
                                        (LETT |n| (|GALFACT;reductum| |n| $)
                                              . #3#))
                                       . #3#)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |b| (+ |b| 1) . #3#))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (EXIT
                     (CONS 1
                           (+ (|GALFACT;reductum| |n| $)
                              (ASH (|GALFACT;seed| (+ |b| 1) $) |lr|))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |GALFACT;fullSet|
        ((|n| |NonNegativeInteger|) ($ |Set| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G222 NIL) (|i| NIL) (#2=#:G221 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|GALFACT;fullSet|))
                  (SEQ (LETT |i| 0 . #3#) (LETT #1# |n| . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 45))))) 

(SDEFUN |GALFACT;modularFactor;UPR;18|
        ((|p| UP)
         ($ |Record| (|:| |prime| (|Integer|)) (|:| |factors| (|List| UP))))
        (SPROG
         ((|cprime| (|Integer|))
          (|choice|
           (|Record| (|:| |prime| (|Integer|))
                     (|:| |ddfactors|
                          (|List|
                           (|Record| (|:| |factor| UP)
                                     (|:| |degree| (|Integer|)))))))
          (|nfc| (|NonNegativeInteger|)) (|nf| (|NonNegativeInteger|))
          (#1=#:G250 NIL) (|t| NIL) (#2=#:G246 NIL)
          (|d| (|Set| (|NonNegativeInteger|)))
          (|trials|
           (|List|
            (|Record| (|:| |prime| (|Integer|))
                      (|:| |ddfactors|
                           (|List|
                            (|Record| (|:| |factor| UP)
                                      (|:| |degree| (|Integer|))))))))
          (|s| (|Set| (|NonNegativeInteger|))) (#3=#:G249 NIL) (|j| NIL)
          (|degfact| (|NonNegativeInteger|)) (#4=#:G230 NIL) (#5=#:G248 NIL)
          (|f| NIL)
          (|ddlist|
           (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
          (#6=#:G247 NIL) (|i| NIL) (|diffp| (UP))
          (|dirred| (|Set| (|NonNegativeInteger|)))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((NULL (EQL (ABS (SPADCALL |p| (QREFELT $ 26))) 1))
             (|error| "modularFactor: the polynomial is not primitive."))
            ('T
             (COND
              ((ZEROP
                (LETT |n| (SPADCALL |p| (QREFELT $ 38))
                      . #7=(|GALFACT;modularFactor;UPR;18|)))
               (CONS 0 (LIST |p|)))
              ('T
               (SEQ (LETT |cprime| 2 . #7#) (LETT |trials| NIL . #7#)
                    (LETT |d| (|GALFACT;fullSet| |n| $) . #7#)
                    (LETT |dirred| (SPADCALL (LIST 0 |n|) (QREFELT $ 45))
                          . #7#)
                    (LETT |s| (SPADCALL (QREFELT $ 48)) . #7#)
                    (LETT |ddlist| NIL . #7#) (LETT |degfact| 0 . #7#)
                    (LETT |nf| (+ (QREFELT $ 8) 1) . #7#)
                    (LETT |diffp| (SPADCALL |p| (QREFELT $ 49)) . #7#)
                    (SEQ (LETT |i| 1 . #7#) (LETT #6# (QREFELT $ 7) . #7#) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |nf| (QREFELT $ 8) (QREFELT $ 50))
                             (SEQ
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((ZEROP
                                         (REM (SPADCALL |p| (QREFELT $ 28))
                                              |cprime|))
                                        'T)
                                       ('T
                                        (NULL
                                         (ZEROP
                                          (SPADCALL
                                           (SPADCALL |p| |diffp| |cprime|
                                                     (QREFELT $ 52))
                                           (QREFELT $ 38)))))))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |cprime|
                                           (SPADCALL |cprime| (QREFELT $ 54))
                                           . #7#)))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |ddlist|
                                    (SPADCALL |p| |cprime| (QREFELT $ 55))
                                    . #7#)
                              (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 45))
                                    . #7#)
                              (SEQ (LETT |f| NIL . #7#)
                                   (LETT #5# |ddlist| . #7#) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |f| (CAR #5#) . #7#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |degfact|
                                          (PROG1 (LETT #4# (QCDR |f|) . #7#)
                                            (|check_subtype2| (>= #4# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #4#))
                                          . #7#)
                                    (EXIT
                                     (COND
                                      ((NULL (ZEROP |degfact|))
                                       (SEQ (LETT |j| 1 . #7#)
                                            (LETT #3#
                                                  (QUOTIENT2
                                                   (SPADCALL (QCAR |f|)
                                                             (QREFELT $ 38))
                                                   |degfact|)
                                                  . #7#)
                                            G190
                                            (COND
                                             ((|greater_SI| |j| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |s|
                                                    (SPADCALL |s|
                                                              (|GALFACT;shiftSet|
                                                               |s| |degfact| $)
                                                              (QREFELT $ 56))
                                                    . #7#)))
                                            (LETT |j| (|inc_SI| |j|) . #7#)
                                            (GO G190) G191 (EXIT NIL))))))
                                   (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |trials|
                                    (CONS (CONS |cprime| |ddlist|) |trials|)
                                    . #7#)
                              (LETT |d| (SPADCALL |d| |s| (QREFELT $ 57))
                                    . #7#)
                              (EXIT
                               (COND
                                ((SPADCALL |d| |dirred| (QREFELT $ 58))
                                 (PROGN
                                  (LETT #2# (CONS 0 (LIST |p|)) . #7#)
                                  (GO #8=#:G245)))
                                ('T
                                 (SEQ
                                  (LETT |cprime|
                                        (SPADCALL |cprime| (QREFELT $ 54))
                                        . #7#)
                                  (EXIT
                                   (LETT |nf|
                                         (SPADCALL |ddlist| (QREFELT $ 41))
                                         . #7#)))))))))))
                         (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |choice| (|SPADfirst| |trials|) . #7#)
                    (LETT |nfc| (SPADCALL (QCDR |choice|) (QREFELT $ 41))
                          . #7#)
                    (SEQ (LETT |t| NIL . #7#) (LETT #1# (CDR |trials|) . #7#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t| (CAR #1#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |nf| (SPADCALL (QCDR |t|) (QREFELT $ 41))
                                . #7#)
                          (EXIT
                           (COND
                            ((< |nf| |nfc|)
                             (SEQ (LETT |nfc| |nf| . #7#)
                                  (EXIT (LETT |choice| |t| . #7#))))
                            ((EQL |nf| |nfc|)
                             (COND
                              ((SPADCALL (QCAR |t|) (QCAR |choice|)
                                         (QREFELT $ 59))
                               (SEQ (LETT |nfc| |nf| . #7#)
                                    (EXIT (LETT |choice| |t| . #7#)))))))))
                         (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                    (LETT |cprime| (QCAR |choice|) . #7#)
                    (EXIT
                     (CONS |cprime|
                           (SPADCALL (QCDR |choice|) |cprime|
                                     (QREFELT $ 61))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |GALFACT;degreePartition;LM;19|
        ((|ddlist| |List|
          (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|))))
         ($ |Multiset| (|NonNegativeInteger|)))
        (SPROG
         ((|dp| (|Multiset| (|NonNegativeInteger|)))
          (|dd| #1=(|NonNegativeInteger|)) (#2=#:G252 NIL) (|d| #1#)
          (#3=#:G258 NIL) (|f| NIL))
         (SEQ
          (LETT |dp| (SPADCALL (QREFELT $ 65))
                . #4=(|GALFACT;degreePartition;LM;19|))
          (LETT |d| 0 . #4#) (LETT |dd| 0 . #4#)
          (SEQ (LETT |f| NIL . #4#) (LETT #3# |ddlist| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((ZEROP
                    (LETT |d| (SPADCALL (QCAR |f|) (QREFELT $ 38)) . #4#))
                   (LETT |dp| (SPADCALL 0 |dp| (QREFELT $ 66)) . #4#))
                  ('T
                   (SEQ
                    (LETT |dd|
                          (PROG1 (LETT #2# (QCDR |f|) . #4#)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))
                          . #4#)
                    (EXIT
                     (LETT |dp|
                           (SPADCALL |dd| |dp| (QUOTIENT2 |d| |dd|)
                                     (QREFELT $ 67))
                           . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |dp|)))) 

(SDEFUN |GALFACT;henselfact|
        ((|f| UP) (|pdecomp| |Boolean|) ($ . #1=(|List| UP)))
        (SPROG
         ((#2=#:G270 NIL) (#3=#:G269 #1#) (#4=#:G271 #1#) (#5=#:G276 NIL)
          (|g| NIL) (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|b| (|PositiveInteger|)) (#6=#:G266 NIL) (|cprime| #7=(|Integer|))
          (|m| (|Record| (|:| |prime| #7#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (#8=#:G275 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT $ 70))
              (PROGN
               (LETT #8# (LIST |f|) . #9=(|GALFACT;henselfact|))
               (GO #10=#:G274)))
             ((QREFELT $ 11)
              (COND
               ((SPADCALL |f| (QREFELT $ 36))
                (PROGN (LETT #8# (LIST |f|) . #9#) (GO #10#))))))
            (COND
             (|pdecomp|
              (COND
               ((QREFELT $ 10) (LETT |cf| (SPADCALL |f| (QREFELT $ 74)) . #9#))
               (#11='T (LETT |cf| (CONS 1 #12="failed") . #9#))))
             (#11# (LETT |cf| (CONS 1 #12#) . #9#)))
            (EXIT
             (COND
              ((QEQCAR |cf| 1)
               (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 63)) . #9#)
                    (EXIT
                     (COND
                      ((ZEROP (LETT |cprime| (QCAR |m|) . #9#)) (QCDR |m|))
                      (#11#
                       (SEQ
                        (LETT |b|
                              (PROG1
                                  (LETT #6#
                                        (*
                                         (SPADCALL 2
                                                   (SPADCALL |f|
                                                             (QREFELT $ 28))
                                                   (QREFELT $ 75))
                                         (SPADCALL |f| (QREFELT $ 77)))
                                        . #9#)
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #6#))
                              . #9#)
                        (EXIT
                         (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                   (QREFELT $ 79)))))))))
              (#11#
               (SEQ (LETT |lrf| (QCDR |cf|) . #9#)
                    (EXIT
                     (PROGN
                      (LETT #2# NIL . #9#)
                      (SEQ (LETT |g| NIL . #9#)
                           (LETT #5# (|GALFACT;henselfact| (QCAR |lrf|) 'T $)
                                 . #9#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |g| (CAR #5#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|GALFACT;henselfact|
                                     (SPADCALL |g| (QCDR |lrf|) (QREFELT $ 80))
                                     NIL $)
                                    . #9#)
                              (COND (#2# (LETT #3# (APPEND #3# #4#) . #9#))
                                    ('T
                                     (PROGN
                                      (LETT #3# #4# . #9#)
                                      (LETT #2# 'T . #9#)))))))
                           (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#2# #3#) (#11# NIL))))))))))
          #10# (EXIT #8#)))) 

(SDEFUN |GALFACT;completeFactor|
        ((|f| UP) (|lf| |List| UP) (|cprime| |Integer|)
         (|pk| |PositiveInteger|) (|r| |NonNegativeInteger|)
         (|d| |Set| (|NonNegativeInteger|)) ($ |List| UP))
        (SPROG
         ((|level| (|Integer|)) (|found?| (|Boolean|))
          (|levels| (|NonNegativeInteger|))
          (|ic| (|Union| (|Integer|) "End of level")) (#1=#:G324 NIL)
          (#2=#:G310 NIL)
          (|llg|
           (|Record| (|:| |plist| (|List| UP)) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#3=#:G309 NIL) (|ltrue| #4=(|List| UP))
          (|degf| #5=(|NonNegativeInteger|)) (#6=#:G306 NIL) (|lg| #4#)
          (|gpk| (|PositiveInteger|)) (#7=#:G301 NIL) (#8=#:G298 NIL)
          (#9=#:G297 NIL) (|rg| #5#) (#10=#:G296 NIL)
          (|dg| (|Set| (|NonNegativeInteger|))) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#11=#:G294 NIL) (#12=#:G293 NIL)
          (|nb| (|Integer|)) (#13=#:G327 NIL) (|j| NIL)
          (|f1| (|Union| UP "failed")) (|g| (UP)) (#14=#:G326 NIL)
          (|g0| (|Integer|)) (|degg| #5#) (#15=#:G325 NIL) (|i| (|Integer|))
          (#16=#:G212 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lc| (SPADCALL |f| (QREFELT $ 28))
                  . #17=(|GALFACT;completeFactor|))
            (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 81)) . #17#)
            (LETT |ltrue| NIL . #17#) (LETT |found?| 'T . #17#)
            (LETT |degf| 0 . #17#) (LETT |degg| 0 . #17#) (LETT |g0| 0 . #17#)
            (LETT |g| (|spadConstant| $ 47) . #17#) (LETT |rg| 0 . #17#)
            (LETT |nb| 0 . #17#) (LETT |lg| NIL . #17#) (LETT |b| 1 . #17#)
            (LETT |dg| (SPADCALL (QREFELT $ 48)) . #17#)
            (LETT |llg| (CONS NIL 0) . #17#)
            (LETT |levels| (LENGTH |lf|) . #17#) (LETT |level| 1 . #17#)
            (LETT |ic| (CONS 1 0) . #17#) (LETT |i| 0 . #17#)
            (SEQ G190 (COND ((NULL (< |level| |levels|)) (GO G191)))
                 (SEQ (LETT |ic| (CONS 1 (|GALFACT;seed| |level| $)) . #17#)
                      (SEQ G190
                           (COND
                            ((NULL (COND (|found?| NIL) ('T (QEQCAR |ic| 1))))
                             (GO G191)))
                           (SEQ
                            (LETT |i|
                                  (PROG2 (LETT #16# |ic| . #17#)
                                      (QCDR #16#)
                                    (|check_union2| (QEQCAR #16# 1) (|Integer|)
                                                    (|Union| "End of level"
                                                             (|Integer|))
                                                    #16#))
                                  . #17#)
                            (LETT |degg| 0 . #17#) (LETT |g0| 1 . #17#)
                            (SEQ (LETT |j| 1 . #17#)
                                 (LETT #15# |levels| . #17#) G190
                                 (COND ((|greater_SI| |j| #15#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |i| (- |j| 1) (QREFELT $ 82))
                                     (SEQ
                                      (LETT |degg|
                                            (+ |degg|
                                               (SPADCALL
                                                (SPADCALL |lf| |j|
                                                          (QREFELT $ 83))
                                                (QREFELT $ 38)))
                                            . #17#)
                                      (EXIT
                                       (LETT |g0|
                                             (* |g0|
                                                (SPADCALL
                                                 (SPADCALL |lf| |j|
                                                           (QREFELT $ 83))
                                                 0 (QREFELT $ 81)))
                                             . #17#)))))))
                                 (LETT |j| (|inc_SI| |j|) . #17#) (GO G190)
                                 G191 (EXIT NIL))
                            (LETT |g0|
                                  (SPADCALL (* |lc| |g0|) |pk| (QREFELT $ 84))
                                  . #17#)
                            (COND
                             ((SPADCALL |degg| |d| (QREFELT $ 85))
                              (COND
                               ((QEQCAR
                                 (SPADCALL (* |lc| |f0|) |g0| (QREFELT $ 87))
                                 0)
                                (SEQ
                                 (LETT |g| (SPADCALL |lc| (QREFELT $ 88))
                                       . #17#)
                                 (SEQ (LETT |j| 1 . #17#)
                                      (LETT #14# |levels| . #17#) G190
                                      (COND
                                       ((|greater_SI| |j| #14#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL |i| (- |j| 1)
                                                    (QREFELT $ 82))
                                          (LETT |g|
                                                (SPADCALL |g|
                                                          (SPADCALL |lf| |j|
                                                                    (QREFELT $
                                                                             83))
                                                          (QREFELT $ 89))
                                                . #17#)))))
                                      (LETT |j| (|inc_SI| |j|) . #17#)
                                      (GO G190) G191 (EXIT NIL))
                                 (LETT |g|
                                       (SPADCALL
                                        (SPADCALL |g| |pk| (QREFELT $ 90))
                                        (QREFELT $ 91))
                                       . #17#)
                                 (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 92))
                                       . #17#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |f1| 0)
                                    (SEQ (LETT |found?| 'T . #17#)
                                         (LETT |nb| 1 . #17#)
                                         (SEQ (LETT |j| 1 . #17#)
                                              (LETT #13# |levels| . #17#) G190
                                              (COND
                                               ((|greater_SI| |j| #13#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |i| (- |j| 1)
                                                            (QREFELT $ 82))
                                                  (SEQ
                                                   (SPADCALL |lf| |j| |nb|
                                                             (QREFELT $ 94))
                                                   (EXIT
                                                    (LETT |nb| (+ |nb| 1)
                                                          . #17#)))))))
                                              (LETT |j| (|inc_SI| |j|) . #17#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |lg| |lf| . #17#)
                                         (LETT |lf|
                                               (SPADCALL |lf|
                                                         (PROG1
                                                             (LETT #12# |level|
                                                                   . #17#)
                                                           (|check_subtype2|
                                                            (>= #12# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #12#))
                                                         (QREFELT $ 95))
                                               . #17#)
                                         (SPADCALL
                                          (SPADCALL |lg|
                                                    (PROG1
                                                        (LETT #11#
                                                              (- |level| 1)
                                                              . #17#)
                                                      (|check_subtype2|
                                                       (>= #11# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #11#))
                                                    (QREFELT $ 95))
                                          NIL (QREFELT $ 96))
                                         (LETT |f| (QCDR |f1|) . #17#)
                                         (LETT |lc|
                                               (SPADCALL |f| (QREFELT $ 28))
                                               . #17#)
                                         (LETT |f0|
                                               (SPADCALL |f| 0 (QREFELT $ 81))
                                               . #17#)
                                         (LETT |dg|
                                               (SPADCALL
                                                (CONS
                                                 #'|GALFACT;completeFactor!0|
                                                 (VECTOR $ |degg|))
                                                |d| (QREFELT $ 99))
                                               . #17#)
                                         (COND
                                          ((SPADCALL |dg|
                                                     (SPADCALL (LIST 0 |degg|)
                                                               (QREFELT $ 45))
                                                     (QREFELT $ 58))
                                           (LETT |lg| (LIST |g|) . #17#))
                                          ('T
                                           (SEQ
                                            (LETT |rg|
                                                  (PROG1
                                                      (LETT #10#
                                                            (MAX 2
                                                                 (-
                                                                  (+ |r|
                                                                     |level|)
                                                                  |levels|))
                                                            . #17#)
                                                    (|check_subtype2|
                                                     (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                                  . #17#)
                                            (LETT |b|
                                                  (PROG1
                                                      (LETT #9#
                                                            (*
                                                             (SPADCALL 2
                                                                       (SPADCALL
                                                                        |g|
                                                                        (QREFELT
                                                                         $ 28))
                                                                       (QREFELT
                                                                        $ 75))
                                                             (SPADCALL |g| |rg|
                                                                       (QREFELT
                                                                        $
                                                                        100)))
                                                            . #17#)
                                                    (|check_subtype2| (> #9# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|Integer|)
                                                                      #9#))
                                                  . #17#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |b| |pk|
                                                         (QREFELT $ 101))
                                               (COND
                                                ((SPADCALL |g| (QREFELT $ 70))
                                                 (LETT |lg| (LIST |g|) . #17#))
                                                ((QREFELT $ 11)
                                                 (COND
                                                  ((SPADCALL |g|
                                                             (QREFELT $ 36))
                                                   (LETT |lg| (LIST |g|)
                                                         . #17#))
                                                  ('T
                                                   (SEQ
                                                    (LETT |llg|
                                                          (SPADCALL |g| |lg|
                                                                    |cprime|
                                                                    |b|
                                                                    (QREFELT $
                                                                             103))
                                                          . #17#)
                                                    (LETT |gpk|
                                                          (PROG1
                                                              (LETT #8#
                                                                    (QCDR
                                                                     |llg|)
                                                                    . #17#)
                                                            (|check_subtype2|
                                                             (> #8# 0)
                                                             '(|PositiveInteger|)
                                                             '(|Integer|) #8#))
                                                          . #17#)
                                                    (EXIT
                                                     (COND
                                                      ((< |gpk| |b|)
                                                       (LETT |lg| (QCAR |llg|)
                                                             . #17#))
                                                      ('T
                                                       (LETT |lg|
                                                             (|GALFACT;completeFactor|
                                                              |g| (QCAR |llg|)
                                                              |cprime| |gpk|
                                                              |rg| |dg| $)
                                                             . #17#))))))))
                                                ('T
                                                 (SEQ
                                                  (LETT |llg|
                                                        (SPADCALL |g| |lg|
                                                                  |cprime| |b|
                                                                  (QREFELT $
                                                                           103))
                                                        . #17#)
                                                  (LETT |gpk|
                                                        (PROG1
                                                            (LETT #7#
                                                                  (QCDR |llg|)
                                                                  . #17#)
                                                          (|check_subtype2|
                                                           (> #7# 0)
                                                           '(|PositiveInteger|)
                                                           '(|Integer|) #7#))
                                                        . #17#)
                                                  (EXIT
                                                   (COND
                                                    ((< |gpk| |b|)
                                                     (LETT |lg| (QCAR |llg|)
                                                           . #17#))
                                                    ('T
                                                     (LETT |lg|
                                                           (|GALFACT;completeFactor|
                                                            |g| (QCAR |llg|)
                                                            |cprime| |gpk| |rg|
                                                            |dg| $)
                                                           . #17#))))))))
                                              ('T
                                               (LETT |lg| (LIST |g|)
                                                     . #17#)))))))
                                         (LETT |ltrue| (APPEND |ltrue| |lg|)
                                               . #17#)
                                         (LETT |r|
                                               (PROG1
                                                   (LETT #6#
                                                         (MAX 2
                                                              (- |r|
                                                                 (LENGTH
                                                                  |lg|)))
                                                         . #17#)
                                                 (|check_subtype2| (>= #6# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #6#))
                                               . #17#)
                                         (LETT |degf|
                                               (SPADCALL |f| (QREFELT $ 38))
                                               . #17#)
                                         (LETT |d|
                                               (SPADCALL
                                                (CONS
                                                 #'|GALFACT;completeFactor!1|
                                                 (VECTOR $ |degf|))
                                                |d| (QREFELT $ 99))
                                               . #17#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |degf| 1 (QREFELT $ 97))
                                            (SEQ
                                             (COND
                                              ((EQL |degf| 1)
                                               (LETT |ltrue| (CONS |f| |ltrue|)
                                                     . #17#)))
                                             (EXIT
                                              (PROGN
                                               (LETT #1# |ltrue| . #17#)
                                               (GO #18=#:G323)))))
                                           ('T
                                            (SEQ
                                             (LETT |b|
                                                   (PROG1
                                                       (LETT #3#
                                                             (*
                                                              (SPADCALL 2 |lc|
                                                                        (QREFELT
                                                                         $ 75))
                                                              (SPADCALL |f| |r|
                                                                        (QREFELT
                                                                         $
                                                                         100)))
                                                             . #17#)
                                                     (|check_subtype2|
                                                      (> #3# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #3#))
                                                   . #17#)
                                             (EXIT
                                              (COND
                                               ((SPADCALL |b| |pk|
                                                          (QREFELT $ 101))
                                                (SEQ
                                                 (LETT |llg|
                                                       (SPADCALL |f| |lf|
                                                                 |cprime| |b|
                                                                 (QREFELT $
                                                                          103))
                                                       . #17#)
                                                 (LETT |lf| (QCAR |llg|)
                                                       . #17#)
                                                 (LETT |pk|
                                                       (PROG1
                                                           (LETT #2#
                                                                 (QCDR |llg|)
                                                                 . #17#)
                                                         (|check_subtype2|
                                                          (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #2#))
                                                       . #17#)
                                                 (COND
                                                  ((< |pk| |b|)
                                                   (PROGN
                                                    (LETT #1#
                                                          (APPEND |lf| |ltrue|)
                                                          . #17#)
                                                    (GO #18#))))
                                                 (EXIT
                                                  (LETT |level| 1
                                                        . #17#)))))))))))))))))))
                            (EXIT
                             (LETT |ic|
                                   (|GALFACT;nextRecNum| |levels| |level| |i|
                                    $)
                                   . #17#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (COND
                       (|found?|
                        (SEQ (LETT |levels| (LENGTH |lf|) . #17#)
                             (EXIT (LETT |found?| NIL . #17#)))))
                      (EXIT
                       (COND
                        ((NULL (QEQCAR |ic| 1))
                         (LETT |level| (+ |level| 1) . #17#)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS |f| |ltrue|))))
          #18# (EXIT #1#)))) 

(SDEFUN |GALFACT;completeFactor!1| ((|x| NIL) ($$ NIL))
        (PROG (|degf| $)
          (LETT |degf| (QREFELT $$ 1) . #1=(|GALFACT;completeFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |degf| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;completeFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|degg| $)
          (LETT |degg| (QREFELT $$ 1) . #1=(|GALFACT;completeFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |degg| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;divideSet|
        ((|s| |Set| (|NonNegativeInteger|)) (|n| |NonNegativeInteger|)
         ($ |Set| (|NonNegativeInteger|)))
        (SPROG
         ((|l| (|List| (|NonNegativeInteger|)))
          (|ee| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G335 NIL)
          (|e| NIL))
         (SEQ (LETT |l| (LIST 0) . #2=(|GALFACT;divideSet|))
              (SEQ (LETT |e| NIL . #2#)
                   (LETT #1# (SPADCALL |s| (QREFELT $ 44)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ee| (SPADCALL |e| |n| (QREFELT $ 104)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |ee| 0)
                           (LETT |l| (CONS (QCDR |ee|) |l|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT $ 45)))))) 

(SDEFUN |GALFACT;btwFactor|
        ((|f| UP) (|d| |Set| (|NonNegativeInteger|)) (|r| |NonNegativeInteger|)
         (|pdecomp| |Boolean|) ($ . #1=(|List| UP)))
        (SPROG
         ((#2=#:G374 NIL) (|i| NIL) (|lf| #3=(|List| UP)) (#4=#:G373 NIL)
          (|fact| NIL) (#5=#:G372 NIL) (#6=#:G360 NIL) (|lfg| #1#)
          (#7=#:G359 NIL) (|df| #8=(|NonNegativeInteger|)) (#9=#:G356 NIL)
          (|dgh| (|NonNegativeInteger|)) (|g| (UP)) (#10=#:G371 NIL) (|lg| #1#)
          (|dh| #8#) (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|pk| (|PositiveInteger|)) (#11=#:G351 NIL)
          (|lm| (|Record| (|:| |plist| #3#) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#12=#:G349 NIL) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#13=#:G370 NIL) (|cprime| #14=(|Integer|))
          (|m| (|Record| (|:| |prime| #14#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|negativelc?| #15=(|Boolean|)) (|reverse?| #15#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |df| (SPADCALL |f| (QREFELT $ 38))
                  . #16=(|GALFACT;btwFactor|))
            (COND
             ((NULL (EQL (SPADCALL |d| (QREFELT $ 105)) |df|))
              (EXIT (|error| "btwFact: Bad arguments"))))
            (LETT |reverse?| NIL . #16#) (LETT |negativelc?| NIL . #16#)
            (EXIT
             (COND
              ((SPADCALL |d| (SPADCALL (LIST 0 |df|) (QREFELT $ 45))
                         (QREFELT $ 58))
               (LIST |f|))
              (#17='T
               (SEQ
                (COND
                 ((< (ABS (SPADCALL |f| 0 (QREFELT $ 81)))
                     (ABS (SPADCALL |f| (QREFELT $ 28))))
                  (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 107)) . #16#)
                       (EXIT (LETT |reverse?| 'T . #16#)))))
                (COND
                 ((SPADCALL |f| (QREFELT $ 70))
                  (EXIT
                   (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 107))))
                         (#17# (LIST |f|)))))
                 ((QREFELT $ 11)
                  (COND
                   ((SPADCALL |f| (QREFELT $ 36))
                    (EXIT
                     (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 107))))
                           (#17# (LIST |f|))))))))
                (COND
                 ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                  (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 108)) . #16#)
                       (EXIT (LETT |negativelc?| 'T . #16#)))))
                (COND
                 (|pdecomp|
                  (COND
                   ((QREFELT $ 10)
                    (LETT |cf| (SPADCALL |f| (QREFELT $ 74)) . #16#))
                   (#17# (LETT |cf| (CONS 1 #18="failed") . #16#))))
                 (#17# (LETT |cf| (CONS 1 #18#) . #16#)))
                (COND
                 ((QEQCAR |cf| 1)
                  (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 63)) . #16#)
                       (EXIT
                        (COND
                         ((ZEROP (LETT |cprime| (QCAR |m|) . #16#))
                          (COND
                           (|reverse?|
                            (COND
                             (|negativelc?|
                              (PROGN
                               (LETT #13#
                                     (LIST
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 107))
                                                (QREFELT $ 108)))
                                     . #16#)
                               (GO #19=#:G369)))
                             (#17#
                              (PROGN
                               (LETT #13# (LIST (SPADCALL |f| (QREFELT $ 107)))
                                     . #16#)
                               (GO #19#)))))
                           (|negativelc?|
                            (PROGN
                             (LETT #13# (LIST (SPADCALL |f| (QREFELT $ 108)))
                                   . #16#)
                             (GO #19#)))
                           (#17#
                            (PROGN (LETT #13# (LIST |f|) . #16#) (GO #19#)))))
                         (#17#
                          (SEQ
                           (COND
                            ((SPADCALL |f| (QREFELT $ 109))
                             (LETT |d| (SPADCALL 1 |d| (QREFELT $ 110))
                                   . #16#)))
                           (LETT |lc| (SPADCALL |f| (QREFELT $ 28)) . #16#)
                           (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 81)) . #16#)
                           (LETT |b|
                                 (PROG1
                                     (LETT #12#
                                           (* (SPADCALL 2 |lc| (QREFELT $ 75))
                                              (SPADCALL |f| |r|
                                                        (QREFELT $ 100)))
                                           . #16#)
                                   (|check_subtype2| (> #12# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #12#))
                                 . #16#)
                           (LETT |lm|
                                 (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                           (QREFELT $ 103))
                                 . #16#)
                           (LETT |lf| (QCAR |lm|) . #16#)
                           (LETT |pk|
                                 (PROG1 (LETT #11# (QCDR |lm|) . #16#)
                                   (|check_subtype2| (> #11# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #11#))
                                 . #16#)
                           (COND
                            ((SPADCALL (|SPADfirst| |lf|) (QREFELT $ 111))
                             (LETT |lf| (CDR |lf|) . #16#)))
                           (EXIT
                            (COND
                             ((NULL (< |pk| |b|))
                              (LETT |lf|
                                    (|GALFACT;completeFactor| |f| |lf| |cprime|
                                     |pk| |r| |d| $)
                                    . #16#))))))))))
                 (#17#
                  (SEQ (LETT |lrf| (QCDR |cf|) . #16#)
                       (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT $ 38))
                             . #16#)
                       (LETT |lg|
                             (|GALFACT;btwFactor| (QCAR |lrf|)
                              (|GALFACT;divideSet| |d| |dh| $) 2 'T $)
                             . #16#)
                       (LETT |lf| NIL . #16#)
                       (EXIT
                        (SEQ (LETT |i| 1 . #16#)
                             (LETT #10# (LENGTH |lg|) . #16#) G190
                             (COND ((|greater_SI| |i| #10#) (GO G191)))
                             (SEQ
                              (LETT |g| (SPADCALL |lg| |i| (QREFELT $ 83))
                                    . #16#)
                              (LETT |dgh|
                                    (* (SPADCALL |g| (QREFELT $ 38)) |dh|)
                                    . #16#)
                              (LETT |df|
                                    (PROG2
                                        (LETT #9#
                                              (SPADCALL |df| |dgh|
                                                        (QREFELT $ 112))
                                              . #16#)
                                        (QCDR #9#)
                                      (|check_union2| (QEQCAR #9# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       "failed")
                                                      #9#))
                                    . #16#)
                              (LETT |lfg|
                                    (|GALFACT;btwFactor|
                                     (SPADCALL |g| (QCDR |lrf|) (QREFELT $ 80))
                                     (SPADCALL
                                      (CONS #'|GALFACT;btwFactor!0|
                                            (VECTOR $ |dgh|))
                                      |d| (QREFELT $ 99))
                                     (PROG1
                                         (LETT #7# (MAX 2 (- |r| |df|)) . #16#)
                                       (|check_subtype2| (>= #7# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #7#))
                                     NIL $)
                                    . #16#)
                              (LETT |lf| (APPEND |lf| |lfg|) . #16#)
                              (EXIT
                               (LETT |r|
                                     (PROG1
                                         (LETT #6#
                                               (MAX 2 (- |r| (LENGTH |lfg|)))
                                               . #16#)
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #6#))
                                     . #16#)))
                             (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191
                             (EXIT NIL))))))
                (COND
                 (|reverse?|
                  (LETT |lf|
                        (PROGN
                         (LETT #5# NIL . #16#)
                         (SEQ (LETT |fact| NIL . #16#) (LETT #4# |lf| . #16#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |fact| (CAR #4#) . #16#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS (SPADCALL |fact| (QREFELT $ 107))
                                            #5#)
                                      . #16#)))
                              (LETT #4# (CDR #4#) . #16#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        . #16#)))
                (SEQ (LETT |i| 1 . #16#) (LETT #2# (LENGTH |lf|) . #16#) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((<
                          (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 83))
                                    (QREFELT $ 28))
                          0)
                         (SPADCALL |lf| |i|
                                   (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 83))
                                             (QREFELT $ 108))
                                   (QREFELT $ 113))))))
                     (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191
                     (EXIT NIL))
                (EXIT |lf|)))))))
          #19# (EXIT #13#)))) 

(SDEFUN |GALFACT;btwFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|dgh| $)
          (LETT |dgh| (QREFELT $$ 1) . #1=(|GALFACT;btwFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |dgh| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;makeFR;RF;24|
        ((|flist| |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List| (|Record| (|:| |irr| UP) (|:| |pow| (|Integer|))))))
         ($ |Factored| UP))
        (SPROG
         ((|fflist|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| UP) (|:| |xpnt| (|Integer|)))))
          (#1=#:G391 NIL) (|fc| NIL) (#2=#:G390 NIL) (|ff| NIL)
          (|ctp| (|Factored| (|Integer|))))
         (SEQ
          (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT $ 31))
                . #3=(|GALFACT;makeFR;RF;24|))
          (LETT |fflist| NIL . #3#)
          (SEQ (LETT |ff| NIL . #3#) (LETT #2# (QCDR |flist|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ff| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |fflist|
                       (CONS (VECTOR (CONS 3 "prime") (QCAR |ff|) (QCDR |ff|))
                             |fflist|)
                       . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |fc| NIL . #3#)
               (LETT #1# (SPADCALL |ctp| (QREFELT $ 117)) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |fc| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |fflist|
                       (CONS
                        (VECTOR (QVELT |fc| 0)
                                (SPADCALL (QVELT |fc| 1) (QREFELT $ 88))
                                (QVELT |fc| 2))
                        |fflist|)
                       . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |ctp| (QREFELT $ 118)) (QREFELT $ 88))
                     |fflist| (QREFELT $ 122)))))) 

(SDEFUN |GALFACT;quadratic| ((|p| UP) ($ |List| UP))
        (SPROG
         ((#1=#:G397 NIL) (|f| (UP)) (|b| (|Integer|)) (|a| (|Integer|))
          (|d| (|Integer|)) (|r| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |a| (SPADCALL |p| (QREFELT $ 28)) . #2=(|GALFACT;quadratic|))
          (LETT |b| (SPADCALL |p| 1 (QREFELT $ 81)) . #2#)
          (LETT |d|
                (- (SPADCALL |b| 2 (QREFELT $ 126))
                   (* (SPADCALL 4 |a| (QREFELT $ 75))
                      (SPADCALL |p| 0 (QREFELT $ 81))))
                . #2#)
          (LETT |r| (SPADCALL |d| (QREFELT $ 129)) . #2#)
          (EXIT
           (COND ((QEQCAR |r| 1) (LIST |p|))
                 ('T
                  (SEQ (LETT |b| (+ |b| (QCDR |r|)) . #2#)
                       (LETT |a| (SPADCALL 2 |a| (QREFELT $ 75)) . #2#)
                       (LETT |d| (GCD |a| |b|) . #2#)
                       (COND
                        ((NULL (EQL |d| 1))
                         (SEQ (LETT |a| (QUOTIENT2 |a| |d|) . #2#)
                              (EXIT (LETT |b| (QUOTIENT2 |b| |d|) . #2#)))))
                       (LETT |f|
                             (SPADCALL (SPADCALL |a| 1 (QREFELT $ 130))
                                       (SPADCALL |b| 0 (QREFELT $ 130))
                                       (QREFELT $ 131))
                             . #2#)
                       (EXIT
                        (CONS |f|
                              (LIST
                               (PROG2
                                   (LETT #1# (SPADCALL |p| |f| (QREFELT $ 92))
                                         . #2#)
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                                 (|Union| (QREFELT $ 6)
                                                          "failed")
                                                 #1#)))))))))))) 

(SDEFUN |GALFACT;isPowerOf2| ((|n| |Integer|) ($ |Boolean|))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((EQL |n| 1) 'T)
                (#1='T
                 (SEQ (LETT |qr| (DIVIDE2 |n| 2) |GALFACT;isPowerOf2|)
                      (EXIT
                       (COND ((EQL (QCDR |qr|) 1) NIL)
                             (#1# (|GALFACT;isPowerOf2| (QCAR |qr|) $)))))))))) 

(SDEFUN |GALFACT;subMinusX|
        ((|supPol| |SparseUnivariatePolynomial| (|Integer|)) ($ UP))
        (SPROG ((|minusX| (|SparseUnivariatePolynomial| (|Integer|))))
               (SEQ
                (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 133))
                      |GALFACT;subMinusX|)
                (EXIT
                 (SPADCALL (SPADCALL |supPol| |minusX| (QREFELT $ 134))
                           (QREFELT $ 135)))))) 

(SDEFUN |GALFACT;henselFact;UPBR;28|
        ((|f| UP) (|sqf| |Boolean|)
         ($ |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List| (|Record| (|:| |irr| UP) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|factorlist|
           (|List| (|Record| (|:| |irr| UP) (|:| |pow| (|Integer|)))))
          (#1=#:G447 NIL) (|pf| NIL) (#2=#:G446 NIL) (#3=#:G445 NIL)
          (#4=#:G444 NIL) (|d| (|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #5=(|Integer|)) (#6=#:G443 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| #5#))))
          (#7=#:G442 NIL) (#8=#:G441 NIL) (|fac| (UP)) (#9=#:G440 NIL)
          (|sfac| NIL) (#10=#:G439 NIL) (|lcPol| (UP)) (|c| (|Integer|))
          (#11=#:G410 NIL))
         (SEQ (LETT |factorlist| NIL . #12=(|GALFACT;henselFact;UPBR;28|))
              (LETT |c| (SPADCALL |f| (QREFELT $ 26)) . #12#)
              (LETT |f|
                    (PROG2
                        (LETT #11# (SPADCALL |f| |c| (QREFELT $ 136)) . #12#)
                        (QCDR #11#)
                      (|check_union2| (QEQCAR #11# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) "failed") #11#))
                    . #12#)
              (COND
               ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                (SEQ (LETT |c| (- |c|) . #12#)
                     (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 108)) . #12#)))))
              (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 137)) . #12#)
                   (EXIT
                    (COND
                     ((SPADCALL |d| 0 (QREFELT $ 50))
                      (SEQ
                       (LETT |f|
                             (QCAR
                              (SPADCALL |f| (SPADCALL 1 |d| (QREFELT $ 130))
                                        (QREFELT $ 139)))
                             . #12#)
                       (EXIT
                        (LETT |factorlist|
                              (LIST (CONS (SPADCALL 1 1 (QREFELT $ 130)) |d|))
                              . #12#)))))))
              (LETT |d| (SPADCALL |f| (QREFELT $ 38)) . #12#)
              (EXIT
               (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                     ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                     (#13='T
                      (SEQ
                       (LETT |lcPol|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                       (QREFELT $ 88))
                             . #12#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 108))
                                    (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 140))
                          (SEQ
                           (SEQ (LETT |fac| NIL . #12#)
                                (LETT #10#
                                      (SPADCALL (ELT $ 135)
                                                (SPADCALL |d| (QREFELT $ 143))
                                                (QREFELT $ 146))
                                      . #12#)
                                G190
                                (COND
                                 ((OR (ATOM #10#)
                                      (PROGN
                                       (LETT |fac| (CAR #10#) . #12#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |factorlist|
                                        (CONS (CONS |fac| 1) |factorlist|)
                                        . #12#)))
                                (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))
                         (#13#
                          (SEQ
                           (COND
                            ((ODDP |d|)
                             (COND
                              ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 140))
                               (EXIT
                                (SEQ
                                 (SEQ (LETT |sfac| NIL . #12#)
                                      (LETT #9# (SPADCALL |d| (QREFELT $ 143))
                                            . #12#)
                                      G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |sfac| (CAR #9#) . #12#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |fac|
                                             (|GALFACT;subMinusX| |sfac| $)
                                             . #12#)
                                       (COND
                                        ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                         (LETT |fac|
                                               (SPADCALL |fac| (QREFELT $ 108))
                                               . #12#)))
                                       (EXIT
                                        (LETT |factorlist|
                                              (CONS (CONS |fac| 1)
                                                    |factorlist|)
                                              . #12#)))
                                      (LETT #9# (CDR #9#) . #12#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (COND
                            ((|GALFACT;isPowerOf2| |d| $)
                             (COND
                              ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 140))
                               (EXIT
                                (SEQ
                                 (LETT |factorlist|
                                       (CONS (CONS |f| 1) |factorlist|) . #12#)
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (EXIT
                            (COND
                             (|sqf|
                              (CONS |c|
                                    (APPEND
                                     (PROGN
                                      (LETT #8# NIL . #12#)
                                      (SEQ (LETT |pf| NIL . #12#)
                                           (LETT #7#
                                                 (|GALFACT;henselfact| |f| 'T
                                                  $)
                                                 . #12#)
                                           G190
                                           (COND
                                            ((OR (ATOM #7#)
                                                 (PROGN
                                                  (LETT |pf| (CAR #7#) . #12#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #8# (CONS (CONS |pf| 1) #8#)
                                                   . #12#)))
                                           (LETT #7# (CDR #7#) . #12#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #8#))))
                                     |factorlist|)))
                             (#13#
                              (SEQ
                               (LETT |sqfflist|
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 147))
                                               (QREFELT $ 150))
                                     . #12#)
                               (SEQ (LETT |sqfr| NIL . #12#)
                                    (LETT #6# |sqfflist| . #12#) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |sqfr| (CAR #6#) . #12#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ (LETT |mult| (QCDR |sqfr|) . #12#)
                                         (LETT |sqff| (QCAR |sqfr|) . #12#)
                                         (LETT |d|
                                               (SPADCALL |sqff| (QREFELT $ 38))
                                               . #12#)
                                         (EXIT
                                          (COND
                                           ((EQL |d| 1)
                                            (LETT |factorlist|
                                                  (CONS (CONS |sqff| |mult|)
                                                        |factorlist|)
                                                  . #12#))
                                           ((EQL |d| 2)
                                            (LETT |factorlist|
                                                  (APPEND
                                                   (PROGN
                                                    (LETT #4# NIL . #12#)
                                                    (SEQ (LETT |pf| NIL . #12#)
                                                         (LETT #3#
                                                               (|GALFACT;quadratic|
                                                                |sqff| $)
                                                               . #12#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #3#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR #3#)
                                                                      . #12#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #4#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |mult|)
                                                                  #4#)
                                                                 . #12#)))
                                                         (LETT #3# (CDR #3#)
                                                               . #12#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #4#))))
                                                   |factorlist|)
                                                  . #12#))
                                           ('T
                                            (LETT |factorlist|
                                                  (APPEND
                                                   (PROGN
                                                    (LETT #2# NIL . #12#)
                                                    (SEQ (LETT |pf| NIL . #12#)
                                                         (LETT #1#
                                                               (|GALFACT;henselfact|
                                                                |sqff| 'T $)
                                                               . #12#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #1#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR #1#)
                                                                      . #12#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #2#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |mult|)
                                                                  #2#)
                                                                 . #12#)))
                                                         (LETT #1# (CDR #1#)
                                                               . #12#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #2#))))
                                                   |factorlist|)
                                                  . #12#)))))
                                    (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS |c| |factorlist|))))))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;29|
        ((|f| UP) (|sqf| |Boolean|) (|fd| |Set| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|)
         ($ |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List| (|Record| (|:| |irr| UP) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|maxd| (|NonNegativeInteger|)) (#1=#:G489 NIL)
          (|factorlist|
           (|List| (|Record| (|:| |irr| UP) (|:| |pow| (|Integer|)))))
          (#2=#:G507 NIL) (|pf| NIL) (#3=#:G506 NIL) (#4=#:G484 NIL)
          (#5=#:G505 NIL) (#6=#:G504 NIL) (#7=#:G480 NIL)
          (|d| (|NonNegativeInteger|)) (|sqff| (UP)) (|mult| #8=(|Integer|))
          (#9=#:G503 NIL) (|sqfr| NIL) (#10=#:G478 NIL)
          (|sqfflist|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| #8#))))
          (#11=#:G502 NIL) (#12=#:G501 NIL) (|fac| (UP)) (#13=#:G500 NIL)
          (|sfac| NIL) (#14=#:G499 NIL) (|lcPol| (UP)) (#15=#:G459 NIL)
          (#16=#:G457 NIL) (|c| (|Integer|)) (#17=#:G452 NIL))
         (SEQ
          (LETT |d| (SPADCALL |f| (QREFELT $ 38))
                . #18=(|GALFACT;btwFact;UPBSNniR;29|))
          (COND
           ((NULL (EQL (SPADCALL |fd| (QREFELT $ 105)) |d|))
            (EXIT (|error| "btwFact: Bad arguments"))))
          (LETT |factorlist| NIL . #18#)
          (LETT |c| (SPADCALL |f| (QREFELT $ 26)) . #18#)
          (LETT |f|
                (PROG2 (LETT #17# (SPADCALL |f| |c| (QREFELT $ 136)) . #18#)
                    (QCDR #17#)
                  (|check_union2| (QEQCAR #17# 0) (QREFELT $ 6)
                                  (|Union| (QREFELT $ 6) "failed") #17#))
                . #18#)
          (COND
           ((< (SPADCALL |f| (QREFELT $ 28)) 0)
            (SEQ (LETT |c| (- |c|) . #18#)
                 (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 108)) . #18#)))))
          (SEQ (LETT |maxd| (SPADCALL |f| (QREFELT $ 137)) . #18#)
               (EXIT
                (COND
                 ((SPADCALL |maxd| 0 (QREFELT $ 50))
                  (SEQ
                   (LETT |f|
                         (QCAR
                          (SPADCALL |f| (SPADCALL 1 |maxd| (QREFELT $ 130))
                                    (QREFELT $ 139)))
                         . #18#)
                   (LETT |factorlist|
                         (LIST (CONS (SPADCALL 1 1 (QREFELT $ 130)) |maxd|))
                         . #18#)
                   (LETT |r|
                         (PROG1 (LETT #16# (MAX 2 (- |r| |maxd|)) . #18#)
                           (|check_subtype2| (>= #16# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #16#))
                         . #18#)
                   (LETT |d|
                         (PROG2
                             (LETT #15# (SPADCALL |d| |maxd| (QREFELT $ 112))
                                   . #18#)
                             (QCDR #15#)
                           (|check_union2| (QEQCAR #15# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #15#))
                         . #18#)
                   (EXIT
                    (LETT |fd|
                          (SPADCALL
                           (CONS #'|GALFACT;btwFact;UPBSNniR;29!0|
                                 (VECTOR $ |d|))
                           |fd| (QREFELT $ 99))
                          . #18#)))))))
          (EXIT
           (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                 ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                 (#19='T
                  (SEQ
                   (LETT |lcPol|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                   (QREFELT $ 88))
                         . #18#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 108))
                                (SPADCALL |f| (QREFELT $ 24)) (QREFELT $ 140))
                      (SEQ
                       (SEQ (LETT |fac| NIL . #18#)
                            (LETT #14#
                                  (SPADCALL (ELT $ 135)
                                            (SPADCALL |d| (QREFELT $ 143))
                                            (QREFELT $ 146))
                                  . #18#)
                            G190
                            (COND
                             ((OR (ATOM #14#)
                                  (PROGN (LETT |fac| (CAR #14#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |factorlist|
                                    (CONS (CONS |fac| 1) |factorlist|)
                                    . #18#)))
                            (LETT #14# (CDR #14#) . #18#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (CONS |c| |factorlist|))))
                     (#19#
                      (SEQ
                       (COND
                        ((ODDP |d|)
                         (COND
                          ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 140))
                           (EXIT
                            (SEQ
                             (SEQ (LETT |sfac| NIL . #18#)
                                  (LETT #13# (SPADCALL |d| (QREFELT $ 143))
                                        . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #13#)
                                        (PROGN
                                         (LETT |sfac| (CAR #13#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |fac| (|GALFACT;subMinusX| |sfac| $)
                                         . #18#)
                                   (COND
                                    ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                     (LETT |fac|
                                           (SPADCALL |fac| (QREFELT $ 108))
                                           . #18#)))
                                   (EXIT
                                    (LETT |factorlist|
                                          (CONS (CONS |fac| 1) |factorlist|)
                                          . #18#)))
                                  (LETT #13# (CDR #13#) . #18#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS |c| |factorlist|))))))))
                       (COND
                        ((|GALFACT;isPowerOf2| |d| $)
                         (COND
                          ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 140))
                           (EXIT
                            (SEQ
                             (LETT |factorlist|
                                   (CONS (CONS |f| 1) |factorlist|) . #18#)
                             (EXIT (CONS |c| |factorlist|))))))))
                       (EXIT
                        (COND
                         (|sqf|
                          (CONS |c|
                                (APPEND
                                 (PROGN
                                  (LETT #12# NIL . #18#)
                                  (SEQ (LETT |pf| NIL . #18#)
                                       (LETT #11#
                                             (|GALFACT;btwFactor| |f| |fd| |r|
                                              'T $)
                                             . #18#)
                                       G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |pf| (CAR #11#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #12# (CONS (CONS |pf| 1) #12#)
                                               . #18#)))
                                       (LETT #11# (CDR #11#) . #18#) (GO G190)
                                       G191 (EXIT (NREVERSE #12#))))
                                 |factorlist|)))
                         (#19#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 147))
                                           (QREFELT $ 150))
                                 . #18#)
                           (COND
                            ((EQL (LENGTH |sqfflist|) 1)
                             (LETT |r|
                                   (PROG1
                                       (LETT #10#
                                             (MAX
                                              (QUOTIENT2 |r|
                                                         (QCDR
                                                          (|SPADfirst|
                                                           |sqfflist|)))
                                              2)
                                             . #18#)
                                     (|check_subtype2| (>= #10# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #10#))
                                   . #18#))
                            (#19# (LETT |r| 2 . #18#)))
                           (SEQ (LETT |sqfr| NIL . #18#)
                                (LETT #9# |sqfflist| . #18#) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN
                                       (LETT |sqfr| (CAR #9#) . #18#)
                                       NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QCDR |sqfr|) . #18#)
                                     (LETT |sqff| (QCAR |sqfr|) . #18#)
                                     (LETT |d| (SPADCALL |sqff| (QREFELT $ 38))
                                           . #18#)
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (SEQ
                                         (LETT |factorlist|
                                               (CONS (CONS |sqff| |mult|)
                                                     |factorlist|)
                                               . #18#)
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #7#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             105))
                                                          |mult|)
                                                         . #18#)
                                                 (|check_subtype2| (>= #7# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #7#))
                                               . #18#)
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;29!1|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 99))
                                                . #18#))))
                                       ((EQL |d| 2)
                                        (SEQ
                                         (LETT |factorlist|
                                               (APPEND
                                                (PROGN
                                                 (LETT #6# NIL . #18#)
                                                 (SEQ (LETT |pf| NIL . #18#)
                                                      (LETT #5#
                                                            (|GALFACT;quadratic|
                                                             |sqff| $)
                                                            . #18#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #5#)
                                                            (PROGN
                                                             (LETT |pf|
                                                                   (CAR #5#)
                                                                   . #18#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #6#
                                                              (CONS
                                                               (CONS |pf|
                                                                     |mult|)
                                                               #6#)
                                                              . #18#)))
                                                      (LETT #5# (CDR #5#)
                                                            . #18#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #6#))))
                                                |factorlist|)
                                               . #18#)
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #4#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             105))
                                                          (SPADCALL 2 |mult|
                                                                    (QREFELT $
                                                                             75)))
                                                         . #18#)
                                                 (|check_subtype2| (>= #4# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #4#))
                                               . #18#)
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;29!2|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 99))
                                                . #18#))))
                                       ('T
                                        (SEQ
                                         (LETT |factorlist|
                                               (APPEND
                                                (PROGN
                                                 (LETT #3# NIL . #18#)
                                                 (SEQ (LETT |pf| NIL . #18#)
                                                      (LETT #2#
                                                            (|GALFACT;btwFactor|
                                                             |sqff|
                                                             (SPADCALL
                                                              (CONS
                                                               #'|GALFACT;btwFact;UPBSNniR;29!3|
                                                               (VECTOR $ |d|))
                                                              |fd|
                                                              (QREFELT $ 99))
                                                             |r| 'T $)
                                                            . #18#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #2#)
                                                            (PROGN
                                                             (LETT |pf|
                                                                   (CAR #2#)
                                                                   . #18#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #3#
                                                              (CONS
                                                               (CONS |pf|
                                                                     |mult|)
                                                               #3#)
                                                              . #18#)))
                                                      (LETT #2# (CDR #2#)
                                                            . #18#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #3#))))
                                                |factorlist|)
                                               . #18#)
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #1#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             105))
                                                          (SPADCALL |d| |mult|
                                                                    (QREFELT $
                                                                             152)))
                                                         . #18#)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               . #18#)
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;29!4|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 99))
                                                . #18#)))))))
                                (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;29!4| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;29!3| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;29!2| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;29!1| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;29!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 97)))))) 

(SDEFUN |GALFACT;factor;UPF;30| ((|f| UP) ($ |Factored| UP))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| NIL
                     (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $) 2
                     (QREFELT $ 153)))
          ('T (SPADCALL |f| NIL (QREFELT $ 151))))
         (QREFELT $ 125))) 

(SDEFUN |GALFACT;errorsum?|
        ((|d| |NonNegativeInteger|) (|ld| |List| #1=(|NonNegativeInteger|))
         ($ |Boolean|))
        (SPROG
         ((#2=#:G511 NIL) (#3=#:G510 #1#) (#4=#:G512 #1#) (#5=#:G515 NIL)
          (#6=#:G104 NIL))
         (SEQ
          (NULL
           (EQL |d|
                (PROGN
                 (LETT #2# NIL . #7=(|GALFACT;errorsum?|))
                 (SEQ (LETT #6# NIL . #7#) (LETT #5# |ld| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# #6# . #7#)
                         (COND (#2# (LETT #3# (+ #3# #4#) . #7#))
                               ('T
                                (PROGN
                                 (LETT #3# #4# . #7#)
                                 (LETT #2# 'T . #7#)))))))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T 0)))))))) 

(SDEFUN |GALFACT;makeSet|
        ((|ld| |List| (|NonNegativeInteger|)) ($ |Set| (|NonNegativeInteger|)))
        (SPROG ((|s| (|Set| (|NonNegativeInteger|))) (#1=#:G519 NIL) (|d| NIL))
               (SEQ
                (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 45))
                      . #2=(|GALFACT;makeSet|))
                (SEQ (LETT |d| NIL . #2#) (LETT #1# |ld| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL |s| (|GALFACT;shiftSet| |s| |d| $)
                                       (QREFELT $ 56))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |GALFACT;factor;UPLNniF;33|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 38)) |ld| $)
          (|error| "factor: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| NIL (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 153))
           (QREFELT $ 125))))) 

(SDEFUN |GALFACT;factor;UPNniF;34|
        ((|f| UP) (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (SPADCALL
         (SPADCALL |f| NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $)
                   |r| (QREFELT $ 153))
         (QREFELT $ 125))) 

(SDEFUN |GALFACT;factor;UPLF;35|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|)) ($ |Factored| UP))
        (SPADCALL |f| |ld| 2 (QREFELT $ 155))) 

(SDEFUN |GALFACT;factor;UP2NniF;36|
        ((|f| UP) (|d| |NonNegativeInteger|) (|r| |NonNegativeInteger|)
         ($ |Factored| UP))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 38)) |d|
                                (QREFELT $ 104))
                      |GALFACT;factor;UP2NniF;36|)
                (EXIT
                 (COND ((QEQCAR |n| 1) (|error| "factor: Bad arguments"))
                       ('T
                        (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 158))
                                  |r| (QREFELT $ 155)))))))) 

(SDEFUN |GALFACT;factorSquareFree;UPF;37| ((|f| UP) ($ |Factored| UP))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $)
                     2 (QREFELT $ 153)))
          ('T (SPADCALL |f| 'T (QREFELT $ 151))))
         (QREFELT $ 125))) 

(SDEFUN |GALFACT;factorSquareFree;UPLNniF;38|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 38)) |ld| $)
          (|error| "factorSquareFree: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| 'T (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 153))
           (QREFELT $ 125))))) 

(SDEFUN |GALFACT;factorSquareFree;UPNniF;39|
        ((|f| UP) (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (SPADCALL
         (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 38)) $)
                   |r| (QREFELT $ 153))
         (QREFELT $ 125))) 

(SDEFUN |GALFACT;factorSquareFree;UPLF;40|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|)) ($ |Factored| UP))
        (SPADCALL |f| |ld| 2 (QREFELT $ 161))) 

(SDEFUN |GALFACT;factorSquareFree;UP2NniF;41|
        ((|f| UP) (|d| |NonNegativeInteger|) (|r| |NonNegativeInteger|)
         ($ |Factored| UP))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 38)) |d|
                                (QREFELT $ 104))
                      |GALFACT;factorSquareFree;UP2NniF;41|)
                (EXIT
                 (COND
                  ((QEQCAR |n| 1) (|error| "factorSquareFree: Bad arguments"))
                  ('T
                   (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 158)) |r|
                             (QREFELT $ 161)))))))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniBU;42|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) (|sqf| |Boolean|) ($ |Union| UP "failed"))
        (SPROG
         ((#1=#:G558 NIL) (#2=#:G559 NIL) (#3=#:G560 NIL) (|f| NIL)
          (|lf| (|List| (|Record| (|:| |irr| UP) (|:| |pow| (|Integer|)))))
          (|dp| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dp| (SPADCALL |p| (QREFELT $ 38))
                  . #4=(|GALFACT;factorOfDegree;PiUPLNniBU;42|))
            (EXIT
             (COND
              ((|GALFACT;errorsum?| |dp| |ld| $)
               (|error| "factorOfDegree: Bad arguments"))
              ('T
               (SEQ
                (COND
                 ((EQL |d| 1)
                  (COND
                   ((SPADCALL |p| (QREFELT $ 109)) (EXIT (CONS 1 "failed"))))))
                (LETT |lf|
                      (QCDR
                       (SPADCALL |p| |sqf| (|GALFACT;makeSet| |ld| $) |r|
                                 (QREFELT $ 153)))
                      . #4#)
                (SEQ
                 (EXIT
                  (SEQ (LETT |f| NIL . #4#) (LETT #3# |lf| . #4#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 38)) |d|)
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (CONS 0 (QCAR |f|)) . #4#)
                                   (GO #5=#:G557))
                                  . #4#)
                            (GO #6=#:G551))))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                 #6# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniU;43|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Union| UP "failed"))
        (SPADCALL |d| |p| |ld| |r| NIL (QREFELT $ 166))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPNniU;44|
        ((|d| |PositiveInteger|) (|p| UP) (|r| |NonNegativeInteger|)
         ($ |Union| UP "failed"))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 38)) 1 (QREFELT $ 158))
                  |r| NIL (QREFELT $ 166))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLU;45|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         ($ |Union| UP "failed"))
        (SPADCALL |d| |p| |ld| 2 NIL (QREFELT $ 166))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPU;46|
        ((|d| |PositiveInteger|) (|p| UP) ($ |Union| UP "failed"))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 38)) 1 (QREFELT $ 158)) 2
                  NIL (QREFELT $ 166))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizer;|)) 

(DEFUN |GaloisGroupFactorizer| (#1=#:G577)
  (SPROG NIL
         (PROG (#2=#:G578)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupFactorizer|)
                                               '|domainEqualList|)
                    . #3=(|GaloisGroupFactorizer|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GaloisGroupFactorizer;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GaloisGroupFactorizer|)))))))))) 

(DEFUN |GaloisGroupFactorizer;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GaloisGroupFactorizer|))
          (LETT |dv$| (LIST '|GaloisGroupFactorizer| DV$1) . #1#)
          (LETT $ (GETREFV 171) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GaloisGroupFactorizer| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 5)
          (QSETREFV $ 8 8)
          (QSETREFV $ 9 'T)
          (QSETREFV $ 10 'T)
          (QSETREFV $ 11 'T)
          $))) 

(MAKEPROP '|GaloisGroupFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|mussertrials|
              '|stopmussertrials| '|usesinglefactorbound|
              '|tryfunctionaldecomposition| '|useeisensteincriterion|
              (|Boolean|) |GALFACT;useEisensteinCriterion?;B;1|
              |GALFACT;useEisensteinCriterion;2B;2|
              |GALFACT;tryFunctionalDecomposition?;B;3|
              |GALFACT;tryFunctionalDecomposition;2B;4|
              |GALFACT;useSingleFactorBound?;B;5|
              |GALFACT;useSingleFactorBound;2B;6| (|PositiveInteger|)
              |GALFACT;stopMusserTrials;Pi;7| |GALFACT;stopMusserTrials;2Pi;8|
              |GALFACT;musserTrials;Pi;9| |GALFACT;musserTrials;2Pi;10|
              (0 . |reductum|) (|Integer|) (5 . |content|) (10 . |unit?|)
              (15 . |leadingCoefficient|) (20 . |zero?|) (|Factored| $)
              (25 . |factor|) (|Record| (|:| |factor| 25) (|:| |exponent| 25))
              (|List| 32) (|Factored| 25) (30 . |factors|)
              |GALFACT;eisensteinIrreducible?;UPB;11| (|NonNegativeInteger|)
              (35 . |degree|) (|Record| (|:| |factor| 6) (|:| |degree| 25))
              (|List| 39) |GALFACT;numberOfFactors;LNni;12| (|List| 37)
              (|Set| 37) (40 . |parts|) (45 . |set|) (50 . |One|) (54 . |Zero|)
              (58 . |empty|) (62 . |differentiate|) (67 . >)
              (|ModularDistinctDegreeFactorizer| 6) (73 . |gcd|)
              (|IntegerPrimesPackage| 25) (80 . |nextPrime|) (85 . |ddFact|)
              (91 . |union|) (97 . |intersect|) (103 . =) (109 . >) (|List| 6)
              (115 . |separateFactors|)
              (|Record| (|:| |prime| 25) (|:| |factors| 60))
              |GALFACT;modularFactor;UPR;18| (|Multiset| 37) (121 . |empty|)
              (125 . |insert!|) (131 . |insert!|)
              |GALFACT;degreePartition;LM;19| (|BrillhartTests| 6)
              (138 . |brillhartIrreducible?|)
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 71 '"failed")
              (|UnivariatePolynomialDecompositionPackage| 25 6)
              (143 . |monicDecomposeIfCan|) (148 . *)
              (|GaloisGroupFactorizationUtilities| 25 6 (|Float|))
              (154 . |beauzamyBound|) (|GeneralHenselPackage| 25 6)
              (159 . |completeHensel|) (167 . |elt|) (173 . |coefficient|)
              (179 . |bit?|) (185 . |elt|) (191 . |symmetricRemainder|)
              (197 . |member?|) (|Union| $ '"failed") (203 . |exquo|)
              (209 . |coerce|) (214 . *) (220 . |reduction|)
              (226 . |primitivePart|) (231 . |exquo|) (|Void|) (237 . |swap!|)
              (244 . |rest|) (250 . |setrest!|) (256 . <=) (|Mapping| 12 37)
              (262 . |select|) (268 . |singleFactorBound|) (274 . >)
              (|Record| (|:| |plist| 60) (|:| |modulo| 25))
              (280 . |HenselLift|) (288 . |exquo|) (294 . |max|)
              (|GaloisGroupPolynomialUtilities| 25 6) (299 . |reverse|)
              (304 . -) (309 . |noLinearFactor?|) (314 . |remove|)
              (320 . |ground?|) (325 . |subtractIfCan|) (331 . |setelt!|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 114) (|:| |fctr| 25) (|:| |xpnt| 25))
              (|List| 115) (338 . |factorList|) (343 . |unit|)
              (|Record| (|:| |flg| 114) (|:| |fctr| 6) (|:| |xpnt| 25))
              (|List| 119) (|Factored| 6) (348 . |makeFR|)
              (|Record| (|:| |irr| 6) (|:| |pow| 25))
              (|Record| (|:| |contp| 25) (|:| |factors| (|List| 123)))
              |GALFACT;makeFR;RF;24| (354 . ^) (|Union| 25 '"failed")
              (|IntegerRoots| 25) (360 . |perfectSqrt|) (365 . |monomial|)
              (371 . +) (|SparseUnivariatePolynomial| 25) (377 . |monomial|)
              (383 . |elt|) (389 . |unmakeSUP|) (394 . |exquo|)
              (400 . |minimumDegree|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (405 . |monicDivide|) (411 . =) (|List| 132)
              (|CyclotomicPolynomialPackage|) (417 . |cyclotomicDecomposition|)
              (|Mapping| 6 132) (|ListFunctions2| 132 6) (422 . |map|)
              (428 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 25)) (|List| 148)
              (433 . |factors|) |GALFACT;henselFact;UPBR;28| (438 . *)
              |GALFACT;btwFact;UPBSNniR;29| |GALFACT;factor;UPF;30|
              |GALFACT;factor;UPLNniF;33| |GALFACT;factor;UPNniF;34|
              |GALFACT;factor;UPLF;35| (444 . |new|)
              |GALFACT;factor;UP2NniF;36| |GALFACT;factorSquareFree;UPF;37|
              |GALFACT;factorSquareFree;UPLNniF;38|
              |GALFACT;factorSquareFree;UPNniF;39|
              |GALFACT;factorSquareFree;UPLF;40|
              |GALFACT;factorSquareFree;UP2NniF;41| (|Union| 6 '"failed")
              |GALFACT;factorOfDegree;PiUPLNniBU;42|
              |GALFACT;factorOfDegree;PiUPLNniU;43|
              |GALFACT;factorOfDegree;PiUPNniU;44|
              |GALFACT;factorOfDegree;PiUPLU;45|
              |GALFACT;factorOfDegree;PiUPU;46|)
           '#(|useSingleFactorBound?| 450 |useSingleFactorBound| 454
              |useEisensteinCriterion?| 459 |useEisensteinCriterion| 463
              |tryFunctionalDecomposition?| 468 |tryFunctionalDecomposition|
              472 |stopMusserTrials| 477 |numberOfFactors| 486 |musserTrials|
              491 |modularFactor| 500 |makeFR| 505 |henselFact| 510
              |factorSquareFree| 516 |factorOfDegree| 547 |factor| 584
              |eisensteinIrreducible?| 615 |degreePartition| 620 |btwFact| 625)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 170
                                                 '(1 6 0 0 24 1 6 25 0 26 1 25
                                                   12 0 27 1 6 25 0 28 1 6 12 0
                                                   29 1 25 30 0 31 1 34 33 0 35
                                                   1 6 37 0 38 1 43 42 0 44 1
                                                   43 0 42 45 0 6 0 46 0 6 0 47
                                                   0 43 0 48 1 6 0 0 49 2 37 12
                                                   0 0 50 3 51 6 6 6 25 52 1 53
                                                   25 25 54 2 51 40 6 25 55 2
                                                   43 0 0 0 56 2 43 0 0 0 57 2
                                                   43 12 0 0 58 2 25 12 0 0 59
                                                   2 51 60 40 25 61 0 64 0 65 2
                                                   64 0 37 0 66 3 64 0 37 0 37
                                                   67 1 69 12 6 70 1 73 72 6 74
                                                   2 25 0 19 0 75 1 76 25 6 77
                                                   4 78 60 6 60 25 19 79 2 6 0
                                                   0 0 80 2 6 25 0 37 81 2 25
                                                   12 0 0 82 2 60 6 0 25 83 2
                                                   25 0 0 0 84 2 43 12 37 0 85
                                                   2 25 86 0 0 87 1 6 0 25 88 2
                                                   6 0 0 0 89 2 78 6 6 25 90 1
                                                   6 0 0 91 2 6 86 0 0 92 3 60
                                                   93 0 25 25 94 2 60 0 0 37 95
                                                   2 60 0 0 0 96 2 37 12 0 0 97
                                                   2 43 0 98 0 99 2 76 25 6 37
                                                   100 2 19 12 0 0 101 4 78 102
                                                   6 60 25 19 103 2 37 86 0 0
                                                   104 1 43 37 0 105 1 106 6 6
                                                   107 1 6 0 0 108 1 69 12 6
                                                   109 2 43 0 37 0 110 1 6 12 0
                                                   111 2 37 86 0 0 112 3 60 6 0
                                                   25 6 113 1 34 116 0 117 1 34
                                                   25 0 118 2 121 0 6 120 122 2
                                                   25 0 0 19 126 1 128 127 25
                                                   129 2 6 0 25 37 130 2 6 0 0
                                                   0 131 2 132 0 25 37 133 2
                                                   132 0 0 0 134 1 6 0 132 135
                                                   2 6 86 0 25 136 1 6 37 0 137
                                                   2 6 138 0 0 139 2 6 12 0 0
                                                   140 1 142 141 25 143 2 145
                                                   60 144 141 146 1 6 30 0 147
                                                   1 121 149 0 150 2 25 0 37 0
                                                   152 2 42 0 37 37 158 0 0 12
                                                   17 1 0 12 12 18 0 0 12 13 1
                                                   0 12 12 14 0 0 12 15 1 0 12
                                                   12 16 1 0 19 19 21 0 0 19 20
                                                   1 0 37 40 41 1 0 19 19 23 0
                                                   0 19 22 1 0 62 6 63 1 0 121
                                                   124 125 2 0 124 6 12 151 2 0
                                                   121 6 37 162 1 0 121 6 160 3
                                                   0 121 6 42 37 161 2 0 121 6
                                                   42 163 3 0 121 6 37 37 164 2
                                                   0 165 19 6 170 3 0 165 19 6
                                                   42 169 3 0 165 19 6 37 168 5
                                                   0 165 19 6 42 37 12 166 4 0
                                                   165 19 6 42 37 167 1 0 121 6
                                                   154 2 0 121 6 42 157 2 0 121
                                                   6 37 156 3 0 121 6 37 37 159
                                                   3 0 121 6 42 37 155 1 0 12 6
                                                   36 1 0 64 40 68 4 0 124 6 12
                                                   43 37 153)))))
           '|lookupComplete|)) 
