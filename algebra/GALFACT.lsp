
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
                                              (QREFELT $ 36))
                                    . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |p| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (QVELT |p| 2) 1)
                                  (COND
                                   ((NULL (ZEROP (REM |lc| (QVELT |p| 1))))
                                    (COND
                                     ((NULL
                                       (ZEROP
                                        (REM |tc| (EXPT (QVELT |p| 1) 2))))
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
                                       (SPADCALL (QCAR |dd|) (QREFELT $ 39))
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
                       (LETT #1# (SPADCALL |s| (QREFELT $ 45)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (+ |e| |shift|) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 46))))) 

(SDEFUN |GALFACT;reductum| ((|n| |Integer|) ($ |Integer|))
        (- |n| (ASH 1 (- (INTEGER-LENGTH |n|) 1)))) 

(SDEFUN |GALFACT;seed| ((|level| |Integer|) ($ |Integer|))
        (- (ASH 1 |level|) 1)) 

(SDEFUN |GALFACT;nextRecNum|
        ((|levels| |NonNegativeInteger|) (|level| |Integer|) (|n| |Integer|)
         ($ |Union| (|Integer|) "End of level"))
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
                     (LETT #2# (CONS 0 (+ |n| (ASH 1 (- |l| 1)))) . #3#)
                     (GO #4=#:G217))))))
            (EXIT
             (COND
              ((EQL |n| (ASH (|GALFACT;seed| |level| $) (- |levels| |level|)))
               (CONS 1 "End of level"))
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
                     (CONS 0
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
                 (QREFELT $ 46))))) 

(SDEFUN |GALFACT;is_mod_coprime?|
        ((|pol1| UP) (|pol2| UP) (|p| |Integer|) (|small| |Boolean|)
         ($ |Boolean|))
        (SPROG ((|vg| (|U32Vector|)) (|v2| #1=(|U32Vector|)) (|v1| #1#))
               (SEQ
                (COND
                 (|small|
                  (SEQ
                   (LETT |v1|
                         (SPADCALL (SPADCALL |pol1| (QREFELT $ 49)) |p|
                                   (QREFELT $ 52))
                         . #2=(|GALFACT;is_mod_coprime?|))
                   (LETT |v2|
                         (SPADCALL (SPADCALL |pol2| (QREFELT $ 49)) |p|
                                   (QREFELT $ 52))
                         . #2#)
                   (LETT |vg| (SPADCALL |v1| |v2| |p| (QREFELT $ 53)) . #2#)
                   (EXIT
                    (SPADCALL (SPADCALL |vg| (QREFELT $ 54)) 0
                              (QREFELT $ 55)))))
                 ('T
                  (ZEROP
                   (SPADCALL (SPADCALL |pol1| |pol2| |p| (QREFELT $ 57))
                             (QREFELT $ 39)))))))) 

(SDEFUN |GALFACT;add_degs|
        ((|deg1| |NonNegativeInteger|) (|deg2| |NonNegativeInteger|)
         (|res| |List| (|NonNegativeInteger|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G228 NIL) (|i| NIL))
               (SEQ
                (COND ((EQL |deg2| 0) |res|)
                      ('T
                       (SEQ
                        (SEQ (LETT |i| 1 . #2=(|GALFACT;add_degs|))
                             (LETT #1# (QUOTIENT2 |deg1| |deg2|) . #2#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT (LETT |res| (CONS |deg2| |res|) . #2#)))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |GALFACT;do_separate|
        ((|sfl| |List| (|Mapping| #1=(|List| (|U32Vector|)))) (|c| |Integer|)
         ($ |List| UP))
        (SPROG
         ((|res| (|List| UP)) (#2=#:G235 NIL) (|v| NIL) (|vl| #1#)
          (#3=#:G234 NIL) (|sf| NIL))
         (SEQ (LETT |res| NIL . #4=(|GALFACT;do_separate|))
              (SEQ (LETT |sf| NIL . #4#) (LETT #3# |sfl| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |sf| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |vl| (SPADCALL |sf|) . #4#)
                        (EXIT
                         (SEQ (LETT |v| NIL . #4#) (LETT #2# |vl| . #4#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |v| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (SPADCALL (SPADCALL |v| (QREFELT $ 59))
                                                 (QREFELT $ 60))
                                       |res|)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL |c| (QREFELT $ 61)) |res|))))) 

(SDEFUN |GALFACT;do_ddfact|
        ((|pol| UP) (|p| |Integer|) (|small| |Boolean|)
         ($ |Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
          (|:| |separate_factors| (|Mapping| (|List| UP)))))
        (SPROG
         ((|degs| (|List| (|NonNegativeInteger|))) (#1=#:G246 NIL)
          (#2=#:G253 NIL) (|rl| NIL)
          (|res1|
           (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
          (|sfl| (|List| (|Mapping| (|List| (|U32Vector|))))) (#3=#:G240 NIL)
          (#4=#:G252 NIL) (|fr| NIL)
          (|ul1|
           (|List|
            (|Record| (|:| |poly| (|U32Vector|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|U32Vector|)))))))
          (|ci| (|Integer|)) (|c| (|Integer|)) (|dpol| (|Integer|))
          (|v| (|U32Vector|)))
         (SEQ (LETT |degs| NIL . #5=(|GALFACT;do_ddfact|))
              (EXIT
               (COND
                (|small|
                 (SEQ
                  (LETT |v|
                        (SPADCALL (SPADCALL |pol| (QREFELT $ 49)) |p|
                                  (QREFELT $ 52))
                        . #5#)
                  (LETT |dpol| (SPADCALL |v| (QREFELT $ 54)) . #5#)
                  (LETT |c| (ELT_U32 |v| |dpol|) . #5#)
                  (COND
                   ((SPADCALL |c| 1 (QREFELT $ 62))
                    (SEQ (LETT |ci| (SPADCALL |c| |p| (QREFELT $ 63)) . #5#)
                         (EXIT
                          (SPADCALL |v| |dpol| |ci| |p| (QREFELT $ 65))))))
                  (LETT |ul1| (SPADCALL |v| |p| (QREFELT $ 70)) . #5#)
                  (LETT |sfl| NIL . #5#)
                  (SEQ (LETT |fr| NIL . #5#) (LETT #4# |ul1| . #5#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |fr| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |degs|
                              (|GALFACT;add_degs|
                               (PROG1
                                   (LETT #3#
                                         (SPADCALL (QVELT |fr| 0)
                                                   (QREFELT $ 54))
                                         . #5#)
                                 (|check_subtype2| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #3#))
                               (QVELT |fr| 1) |degs| $)
                              . #5#)
                        (EXIT (LETT |sfl| (CONS (QVELT |fr| 2) |sfl|) . #5#)))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |degs|
                         (CONS #'|GALFACT;do_ddfact!0|
                               (VECTOR $ |c| |sfl|))))))
                ('T
                 (SEQ (LETT |res1| (SPADCALL |pol| |p| (QREFELT $ 71)) . #5#)
                      (SEQ (LETT |rl| NIL . #5#) (LETT #2# |res1| . #5#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |rl| (CAR #2#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |degs|
                                   (|GALFACT;add_degs|
                                    (SPADCALL (QCAR |rl|) (QREFELT $ 39))
                                    (PROG1 (LETT #1# (QCDR |rl|) . #5#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    |degs| $)
                                   . #5#)))
                           (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (CONS |degs|
                             (CONS #'|GALFACT;do_ddfact!1|
                                   (VECTOR $ |p| |res1|))))))))))) 

(SDEFUN |GALFACT;do_ddfact!1| (($$ NIL))
        (PROG (|res1| |p| $)
          (LETT |res1| (QREFELT $$ 2) . #1=(|GALFACT;do_ddfact|))
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |res1| |p| (QREFELT $ 73)))))) 

(SDEFUN |GALFACT;do_ddfact!0| (($$ NIL))
        (PROG (|sfl| |c| $)
          (LETT |sfl| (QREFELT $$ 2) . #1=(|GALFACT;do_ddfact|))
          (LETT |c| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GALFACT;do_separate| |sfl| |c| $))))) 

(SDEFUN |GALFACT;modularFactor;UPR;22|
        ((|p| UP)
         ($ |Record| (|:| |prime| (|Integer|)) (|:| |factors| (|List| UP))))
        (SPROG
         ((|fl| (|List| UP)) (|cprime| (|Integer|)) (|res_prime| (|Integer|))
          (|dd_res|
           #1=(|Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
                        (|:| |separate_factors| (|Mapping| (|List| UP)))))
          (|nf| (|NonNegativeInteger|)) (|nf1| (|NonNegativeInteger|))
          (#2=#:G270 NIL) (|d| (|Set| (|NonNegativeInteger|)))
          (|s| (|Set| (|NonNegativeInteger|))) (#3=#:G272 NIL)
          (|degfact| (|NonNegativeInteger|))
          (|ddlist| (|List| (|NonNegativeInteger|))) (|dd_res1| #1#)
          (|small| (|Boolean|)) (#4=#:G271 NIL) (|i| NIL) (|diffp| (UP))
          (|degp| #5=(|NonNegativeInteger|))
          (|dirred| (|Set| (|NonNegativeInteger|))) (|n| #5#))
         (SEQ
          (EXIT
           (COND
            ((NULL (EQL (ABS (SPADCALL |p| (QREFELT $ 26))) 1))
             (|error| "modularFactor: the polynomial is not primitive."))
            ('T
             (COND
              ((ZEROP
                (LETT |n| (SPADCALL |p| (QREFELT $ 39))
                      . #6=(|GALFACT;modularFactor;UPR;22|)))
               (CONS 0 (LIST |p|)))
              ('T
               (SEQ (LETT |cprime| 2 . #6#)
                    (LETT |d| (|GALFACT;fullSet| |n| $) . #6#)
                    (LETT |dirred| (SPADCALL (LIST 0 |n|) (QREFELT $ 46))
                          . #6#)
                    (LETT |s| (SPADCALL (QREFELT $ 74)) . #6#)
                    (LETT |ddlist| NIL . #6#) (LETT |degfact| 0 . #6#)
                    (LETT |degp| (SPADCALL |p| (QREFELT $ 39)) . #6#)
                    (LETT |nf| (+ (+ |degp| (QREFELT $ 8)) 1) . #6#)
                    (LETT |diffp| (SPADCALL |p| (QREFELT $ 75)) . #6#)
                    (LETT |small| 'T . #6#)
                    (SEQ (LETT |i| 1 . #6#) (LETT #4# (QREFELT $ 7) . #6#) G190
                         (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |nf| (QREFELT $ 8) (QREFELT $ 76))
                             (SEQ
                              (COND
                               (|small|
                                (COND
                                 ((NULL
                                   (<
                                    (*
                                     (SPADCALL |degp| |cprime| (QREFELT $ 77))
                                     |cprime|)
                                    18446744073709551616))
                                  (LETT |small| NIL . #6#)))))
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
                                         (|GALFACT;is_mod_coprime?| |p| |diffp|
                                          |cprime| |small| $)))))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |cprime|
                                           (SPADCALL |cprime| (QREFELT $ 79))
                                           . #6#)))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |dd_res1|
                                    (|GALFACT;do_ddfact| |p| |cprime| |small|
                                     $)
                                    . #6#)
                              (LETT |ddlist| (QCAR |dd_res1|) . #6#)
                              (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 46))
                                    . #6#)
                              (SEQ (LETT |degfact| NIL . #6#)
                                   (LETT #3# |ddlist| . #6#) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |degfact| (CAR #3#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL |s|
                                                     (|GALFACT;shiftSet| |s|
                                                      |degfact| $)
                                                     (QREFELT $ 80))
                                           . #6#)))
                                   (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |d| (SPADCALL |d| |s| (QREFELT $ 81))
                                    . #6#)
                              (EXIT
                               (COND
                                ((SPADCALL |d| |dirred| (QREFELT $ 82))
                                 (PROGN
                                  (LETT #2# (CONS 0 (LIST |p|)) . #6#)
                                  (GO #7=#:G269)))
                                ('T
                                 (SEQ
                                  (LETT |nf1|
                                        (SPADCALL |ddlist| (QREFELT $ 83))
                                        . #6#)
                                  (COND
                                   ((< |nf1| |nf|)
                                    (SEQ (LETT |nf| |nf1| . #6#)
                                         (LETT |dd_res| |dd_res1| . #6#)
                                         (EXIT
                                          (LETT |res_prime| |cprime| . #6#))))
                                   ((EQL |nf1| |nf|)
                                    (COND
                                     ((SPADCALL |cprime| |res_prime|
                                                (QREFELT $ 84))
                                      (SEQ (LETT |nf| |nf1| . #6#)
                                           (LETT |dd_res| |dd_res1| . #6#)
                                           (EXIT
                                            (LETT |res_prime| |cprime|
                                                  . #6#)))))))
                                  (EXIT
                                   (LETT |cprime|
                                         (SPADCALL |cprime| (QREFELT $ 79))
                                         . #6#)))))))))))
                         (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |fl| (SPADCALL (QCDR |dd_res|)) . #6#)
                    (EXIT (CONS |res_prime| |fl|))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |GALFACT;degreePartition;LM;23|
        ((|ddlist| |List|
          (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|))))
         ($ |Multiset| (|NonNegativeInteger|)))
        (SPROG
         ((|dp| (|Multiset| (|NonNegativeInteger|)))
          (|dd| #1=(|NonNegativeInteger|)) (#2=#:G274 NIL) (|d| #1#)
          (#3=#:G280 NIL) (|f| NIL))
         (SEQ
          (LETT |dp| (SPADCALL (QREFELT $ 88))
                . #4=(|GALFACT;degreePartition;LM;23|))
          (LETT |d| 0 . #4#) (LETT |dd| 0 . #4#)
          (SEQ (LETT |f| NIL . #4#) (LETT #3# |ddlist| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((ZEROP
                    (LETT |d| (SPADCALL (QCAR |f|) (QREFELT $ 39)) . #4#))
                   (LETT |dp| (SPADCALL 0 |dp| (QREFELT $ 89)) . #4#))
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
                                     (QREFELT $ 90))
                           . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |dp|)))) 

(SDEFUN |GALFACT;henselfact|
        ((|f| UP) (|pdecomp| |Boolean|) ($ . #1=(|List| UP)))
        (SPROG
         ((#2=#:G292 NIL) (#3=#:G291 #1#) (#4=#:G293 #1#) (#5=#:G298 NIL)
          (|g| NIL) (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|b| (|PositiveInteger|)) (#6=#:G288 NIL) (|cprime| #7=(|Integer|))
          (|m| (|Record| (|:| |prime| #7#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (#8=#:G297 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT $ 93))
              (PROGN
               (LETT #8# (LIST |f|) . #9=(|GALFACT;henselfact|))
               (GO #10=#:G296)))
             ((QREFELT $ 11)
              (COND
               ((SPADCALL |f| (QREFELT $ 37))
                (PROGN (LETT #8# (LIST |f|) . #9#) (GO #10#))))))
            (COND
             (|pdecomp|
              (COND
               ((QREFELT $ 10) (LETT |cf| (SPADCALL |f| (QREFELT $ 97)) . #9#))
               (#11='T (LETT |cf| (CONS 1 #12="failed") . #9#))))
             (#11# (LETT |cf| (CONS 1 #12#) . #9#)))
            (EXIT
             (COND
              ((QEQCAR |cf| 1)
               (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 86)) . #9#)
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
                                                   (QREFELT $ 98))
                                         (SPADCALL |f| (QREFELT $ 100)))
                                        . #9#)
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #6#))
                              . #9#)
                        (EXIT
                         (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                   (QREFELT $ 102)))))))))
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
                                     (SPADCALL |g| (QCDR |lrf|)
                                               (QREFELT $ 103))
                                     NIL $)
                                    . #9#)
                              (COND
                               (#2#
                                (LETT #3# (SPADCALL #3# #4# (QREFELT $ 104))
                                      . #9#))
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
          (|ic| (|Union| (|Integer|) "End of level")) (#1=#:G347 NIL)
          (#2=#:G333 NIL)
          (|llg|
           (|Record| (|:| |plist| (|List| UP)) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#3=#:G332 NIL) (|ltrue| #4=(|List| UP))
          (|degf| #5=(|NonNegativeInteger|)) (#6=#:G329 NIL) (|lg| #4#)
          (|gpk| (|PositiveInteger|)) (#7=#:G324 NIL) (#8=#:G321 NIL)
          (#9=#:G320 NIL) (|rg| #5#) (#10=#:G319 NIL)
          (|dg| (|Set| (|NonNegativeInteger|))) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#11=#:G317 NIL) (#12=#:G315 NIL)
          (|nb| (|Integer|)) (#13=#:G350 NIL) (|j| NIL)
          (|f1| (|Union| UP "failed")) (|g| (UP)) (#14=#:G349 NIL)
          (|g0| (|Integer|)) (|degg| #5#) (#15=#:G348 NIL) (|i| (|Integer|))
          (#16=#:G211 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lc| (SPADCALL |f| (QREFELT $ 28))
                  . #17=(|GALFACT;completeFactor|))
            (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 105)) . #17#)
            (LETT |ltrue| NIL . #17#) (LETT |found?| 'T . #17#)
            (LETT |degf| 0 . #17#) (LETT |degg| 0 . #17#) (LETT |g0| 0 . #17#)
            (LETT |g| (|spadConstant| $ 58) . #17#) (LETT |rg| 0 . #17#)
            (LETT |nb| 0 . #17#) (LETT |lg| NIL . #17#) (LETT |b| 1 . #17#)
            (LETT |dg| (SPADCALL (QREFELT $ 74)) . #17#)
            (LETT |llg| (CONS NIL 0) . #17#)
            (LETT |levels| (LENGTH |lf|) . #17#) (LETT |level| 1 . #17#)
            (LETT |ic| (CONS 0 0) . #17#) (LETT |i| 0 . #17#)
            (SEQ G190 (COND ((NULL (< |level| |levels|)) (GO G191)))
                 (SEQ (LETT |ic| (CONS 0 (|GALFACT;seed| |level| $)) . #17#)
                      (SEQ G190
                           (COND
                            ((NULL (COND (|found?| NIL) ('T (QEQCAR |ic| 0))))
                             (GO G191)))
                           (SEQ
                            (LETT |i|
                                  (PROG2 (LETT #16# |ic| . #17#)
                                      (QCDR #16#)
                                    (|check_union2| (QEQCAR #16# 0) (|Integer|)
                                                    (|Union| (|Integer|)
                                                             "End of level")
                                                    #16#))
                                  . #17#)
                            (LETT |degg| 0 . #17#) (LETT |g0| 1 . #17#)
                            (SEQ (LETT |j| 1 . #17#)
                                 (LETT #15# |levels| . #17#) G190
                                 (COND ((|greater_SI| |j| #15#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |i| (- |j| 1) (QREFELT $ 106))
                                     (SEQ
                                      (LETT |degg|
                                            (+ |degg|
                                               (SPADCALL
                                                (SPADCALL |lf| |j|
                                                          (QREFELT $ 107))
                                                (QREFELT $ 39)))
                                            . #17#)
                                      (EXIT
                                       (LETT |g0|
                                             (* |g0|
                                                (SPADCALL
                                                 (SPADCALL |lf| |j|
                                                           (QREFELT $ 107))
                                                 0 (QREFELT $ 105)))
                                             . #17#)))))))
                                 (LETT |j| (|inc_SI| |j|) . #17#) (GO G190)
                                 G191 (EXIT NIL))
                            (LETT |g0|
                                  (SPADCALL (* |lc| |g0|) |pk| (QREFELT $ 108))
                                  . #17#)
                            (COND
                             ((SPADCALL |degg| |d| (QREFELT $ 109))
                              (COND
                               ((QEQCAR
                                 (SPADCALL (* |lc| |f0|) |g0| (QREFELT $ 111))
                                 0)
                                (SEQ
                                 (LETT |g| (SPADCALL |lc| (QREFELT $ 61))
                                       . #17#)
                                 (SEQ (LETT |j| 1 . #17#)
                                      (LETT #14# |levels| . #17#) G190
                                      (COND
                                       ((|greater_SI| |j| #14#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL |i| (- |j| 1)
                                                    (QREFELT $ 106))
                                          (LETT |g|
                                                (SPADCALL |g|
                                                          (SPADCALL |lf| |j|
                                                                    (QREFELT $
                                                                             107))
                                                          (QREFELT $ 112))
                                                . #17#)))))
                                      (LETT |j| (|inc_SI| |j|) . #17#)
                                      (GO G190) G191 (EXIT NIL))
                                 (LETT |g|
                                       (SPADCALL
                                        (SPADCALL |g| |pk| (QREFELT $ 113))
                                        (QREFELT $ 114))
                                       . #17#)
                                 (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 115))
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
                                                            (QREFELT $ 106))
                                                  (SEQ
                                                   (SPADCALL |lf| |j| |nb|
                                                             (QREFELT $ 116))
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
                                                         (QREFELT $ 117))
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
                                                    (QREFELT $ 117))
                                          NIL (QREFELT $ 118))
                                         (LETT |f| (QCDR |f1|) . #17#)
                                         (LETT |lc|
                                               (SPADCALL |f| (QREFELT $ 28))
                                               . #17#)
                                         (LETT |f0|
                                               (SPADCALL |f| 0 (QREFELT $ 105))
                                               . #17#)
                                         (LETT |dg|
                                               (SPADCALL
                                                (CONS
                                                 #'|GALFACT;completeFactor!0|
                                                 (VECTOR $ |degg|))
                                                |d| (QREFELT $ 121))
                                               . #17#)
                                         (COND
                                          ((SPADCALL |dg|
                                                     (SPADCALL (LIST 0 |degg|)
                                                               (QREFELT $ 46))
                                                     (QREFELT $ 82))
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
                                                                        $ 98))
                                                             (SPADCALL |g| |rg|
                                                                       (QREFELT
                                                                        $
                                                                        122)))
                                                            . #17#)
                                                    (|check_subtype2| (> #9# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|Integer|)
                                                                      #9#))
                                                  . #17#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |b| |pk|
                                                         (QREFELT $ 123))
                                               (COND
                                                ((SPADCALL |g| (QREFELT $ 93))
                                                 (LETT |lg| (LIST |g|) . #17#))
                                                ((QREFELT $ 11)
                                                 (COND
                                                  ((SPADCALL |g|
                                                             (QREFELT $ 37))
                                                   (LETT |lg| (LIST |g|)
                                                         . #17#))
                                                  ('T
                                                   (SEQ
                                                    (LETT |llg|
                                                          (SPADCALL |g| |lg|
                                                                    |cprime|
                                                                    |b|
                                                                    (QREFELT $
                                                                             125))
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
                                                                           125))
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
                                         (LETT |ltrue|
                                               (SPADCALL |ltrue| |lg|
                                                         (QREFELT $ 104))
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
                                               (SPADCALL |f| (QREFELT $ 39))
                                               . #17#)
                                         (LETT |d|
                                               (SPADCALL
                                                (CONS
                                                 #'|GALFACT;completeFactor!1|
                                                 (VECTOR $ |degf|))
                                                |d| (QREFELT $ 121))
                                               . #17#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |degf| 1 (QREFELT $ 119))
                                            (SEQ
                                             (COND
                                              ((EQL |degf| 1)
                                               (LETT |ltrue| (CONS |f| |ltrue|)
                                                     . #17#)))
                                             (EXIT
                                              (PROGN
                                               (LETT #1# |ltrue| . #17#)
                                               (GO #18=#:G346)))))
                                           ('T
                                            (SEQ
                                             (LETT |b|
                                                   (PROG1
                                                       (LETT #3#
                                                             (*
                                                              (SPADCALL 2 |lc|
                                                                        (QREFELT
                                                                         $ 98))
                                                              (SPADCALL |f| |r|
                                                                        (QREFELT
                                                                         $
                                                                         122)))
                                                             . #17#)
                                                     (|check_subtype2|
                                                      (> #3# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #3#))
                                                   . #17#)
                                             (EXIT
                                              (COND
                                               ((SPADCALL |b| |pk|
                                                          (QREFELT $ 123))
                                                (SEQ
                                                 (LETT |llg|
                                                       (SPADCALL |f| |lf|
                                                                 |cprime| |b|
                                                                 (QREFELT $
                                                                          125))
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
                                                          (SPADCALL |lf|
                                                                    |ltrue|
                                                                    (QREFELT $
                                                                             104))
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
                        ((NULL (QEQCAR |ic| 0))
                         (LETT |level| (+ |level| 1) . #17#)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS |f| |ltrue|))))
          #18# (EXIT #1#)))) 

(SDEFUN |GALFACT;completeFactor!1| ((|x| NIL) ($$ NIL))
        (PROG (|degf| $)
          (LETT |degf| (QREFELT $$ 1) . #1=(|GALFACT;completeFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |degf| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;completeFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|degg| $)
          (LETT |degg| (QREFELT $$ 1) . #1=(|GALFACT;completeFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |degg| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;divideSet|
        ((|s| |Set| (|NonNegativeInteger|)) (|n| |NonNegativeInteger|)
         ($ |Set| (|NonNegativeInteger|)))
        (SPROG
         ((|l| (|List| (|NonNegativeInteger|)))
          (|ee| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G358 NIL)
          (|e| NIL))
         (SEQ (LETT |l| (LIST 0) . #2=(|GALFACT;divideSet|))
              (SEQ (LETT |e| NIL . #2#)
                   (LETT #1# (SPADCALL |s| (QREFELT $ 45)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ee| (SPADCALL |e| |n| (QREFELT $ 126)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |ee| 0)
                           (LETT |l| (CONS (QCDR |ee|) |l|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT $ 46)))))) 

(SDEFUN |GALFACT;btwFactor|
        ((|f| UP) (|d| |Set| (|NonNegativeInteger|)) (|r| |NonNegativeInteger|)
         (|pdecomp| |Boolean|) ($ . #1=(|List| UP)))
        (SPROG
         ((#2=#:G397 NIL) (|i| NIL) (|lf| #3=(|List| UP)) (#4=#:G396 NIL)
          (|fact| NIL) (#5=#:G395 NIL) (#6=#:G383 NIL) (|lfg| #1#)
          (#7=#:G382 NIL) (|df| #8=(|NonNegativeInteger|)) (#9=#:G379 NIL)
          (|dgh| (|NonNegativeInteger|)) (|g| (UP)) (#10=#:G394 NIL) (|lg| #1#)
          (|dh| #8#) (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|pk| (|PositiveInteger|)) (#11=#:G374 NIL)
          (|lm| (|Record| (|:| |plist| #3#) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#12=#:G372 NIL) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#13=#:G393 NIL) (|cprime| #14=(|Integer|))
          (|m| (|Record| (|:| |prime| #14#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|negativelc?| #15=(|Boolean|)) (|reverse?| #15#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |df| (SPADCALL |f| (QREFELT $ 39))
                  . #16=(|GALFACT;btwFactor|))
            (COND
             ((NULL (EQL (SPADCALL |d| (QREFELT $ 127)) |df|))
              (EXIT (|error| "btwFact: Bad arguments"))))
            (LETT |reverse?| NIL . #16#) (LETT |negativelc?| NIL . #16#)
            (EXIT
             (COND
              ((SPADCALL |d| (SPADCALL (LIST 0 |df|) (QREFELT $ 46))
                         (QREFELT $ 82))
               (LIST |f|))
              (#17='T
               (SEQ
                (COND
                 ((< (ABS (SPADCALL |f| 0 (QREFELT $ 105)))
                     (ABS (SPADCALL |f| (QREFELT $ 28))))
                  (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 129)) . #16#)
                       (EXIT (LETT |reverse?| 'T . #16#)))))
                (COND
                 ((SPADCALL |f| (QREFELT $ 93))
                  (EXIT
                   (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 129))))
                         (#17# (LIST |f|)))))
                 ((QREFELT $ 11)
                  (COND
                   ((SPADCALL |f| (QREFELT $ 37))
                    (EXIT
                     (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 129))))
                           (#17# (LIST |f|))))))))
                (COND
                 ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                  (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 130)) . #16#)
                       (EXIT (LETT |negativelc?| 'T . #16#)))))
                (COND
                 (|pdecomp|
                  (COND
                   ((QREFELT $ 10)
                    (LETT |cf| (SPADCALL |f| (QREFELT $ 97)) . #16#))
                   (#17# (LETT |cf| (CONS 1 #18="failed") . #16#))))
                 (#17# (LETT |cf| (CONS 1 #18#) . #16#)))
                (COND
                 ((QEQCAR |cf| 1)
                  (SEQ (LETT |m| (SPADCALL |f| (QREFELT $ 86)) . #16#)
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
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 129))
                                                (QREFELT $ 130)))
                                     . #16#)
                               (GO #19=#:G392)))
                             (#17#
                              (PROGN
                               (LETT #13# (LIST (SPADCALL |f| (QREFELT $ 129)))
                                     . #16#)
                               (GO #19#)))))
                           (|negativelc?|
                            (PROGN
                             (LETT #13# (LIST (SPADCALL |f| (QREFELT $ 130)))
                                   . #16#)
                             (GO #19#)))
                           (#17#
                            (PROGN (LETT #13# (LIST |f|) . #16#) (GO #19#)))))
                         (#17#
                          (SEQ
                           (COND
                            ((SPADCALL |f| (QREFELT $ 131))
                             (LETT |d| (SPADCALL 1 |d| (QREFELT $ 132))
                                   . #16#)))
                           (LETT |lc| (SPADCALL |f| (QREFELT $ 28)) . #16#)
                           (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 105)) . #16#)
                           (LETT |b|
                                 (PROG1
                                     (LETT #12#
                                           (* (SPADCALL 2 |lc| (QREFELT $ 98))
                                              (SPADCALL |f| |r|
                                                        (QREFELT $ 122)))
                                           . #16#)
                                   (|check_subtype2| (> #12# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #12#))
                                 . #16#)
                           (LETT |lm|
                                 (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                           (QREFELT $ 125))
                                 . #16#)
                           (LETT |lf| (QCAR |lm|) . #16#)
                           (LETT |pk|
                                 (PROG1 (LETT #11# (QCDR |lm|) . #16#)
                                   (|check_subtype2| (> #11# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #11#))
                                 . #16#)
                           (COND
                            ((SPADCALL (|SPADfirst| |lf|) (QREFELT $ 133))
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
                       (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT $ 39))
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
                              (LETT |g| (SPADCALL |lg| |i| (QREFELT $ 107))
                                    . #16#)
                              (LETT |dgh|
                                    (* (SPADCALL |g| (QREFELT $ 39)) |dh|)
                                    . #16#)
                              (LETT |df|
                                    (PROG2
                                        (LETT #9#
                                              (SPADCALL |df| |dgh|
                                                        (QREFELT $ 134))
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
                                     (SPADCALL |g| (QCDR |lrf|)
                                               (QREFELT $ 103))
                                     (SPADCALL
                                      (CONS #'|GALFACT;btwFactor!0|
                                            (VECTOR $ |dgh|))
                                      |d| (QREFELT $ 121))
                                     (PROG1
                                         (LETT #7# (MAX 2 (- |r| |df|)) . #16#)
                                       (|check_subtype2| (>= #7# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #7#))
                                     NIL $)
                                    . #16#)
                              (LETT |lf| (SPADCALL |lf| |lfg| (QREFELT $ 104))
                                    . #16#)
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
                                      (CONS (SPADCALL |fact| (QREFELT $ 129))
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
                          (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 107))
                                    (QREFELT $ 28))
                          0)
                         (SPADCALL |lf| |i|
                                   (SPADCALL
                                    (SPADCALL |lf| |i| (QREFELT $ 107))
                                    (QREFELT $ 130))
                                   (QREFELT $ 135))))))
                     (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191
                     (EXIT NIL))
                (EXIT |lf|)))))))
          #19# (EXIT #13#)))) 

(SDEFUN |GALFACT;btwFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|dgh| $)
          (LETT |dgh| (QREFELT $$ 1) . #1=(|GALFACT;btwFactor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |dgh| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;makeFR;RF;28|
        ((|flist| |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|))))))
         ($ |Factored| UP))
        (SPROG
         ((|fflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G414 NIL) (|fc| NIL) (#2=#:G413 NIL) (|ff| NIL)
          (|ctp| (|Factored| (|Integer|))))
         (SEQ
          (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT $ 31))
                . #3=(|GALFACT;makeFR;RF;28|))
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
               (LETT #1# (SPADCALL |ctp| (QREFELT $ 36)) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |fc| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |fflist|
                       (CONS
                        (VECTOR (QVELT |fc| 0)
                                (SPADCALL (QVELT |fc| 1) (QREFELT $ 61))
                                (QVELT |fc| 2))
                        |fflist|)
                       . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |ctp| (QREFELT $ 136)) (QREFELT $ 61))
                     |fflist| (QREFELT $ 140)))))) 

(SDEFUN |GALFACT;quadratic| ((|p| UP) ($ |List| UP))
        (SPROG
         ((#1=#:G420 NIL) (|f| (UP)) (|b| (|Integer|)) (|a| (|Integer|))
          (|d| (|Integer|)) (|r| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |a| (SPADCALL |p| (QREFELT $ 28)) . #2=(|GALFACT;quadratic|))
          (LETT |b| (SPADCALL |p| 1 (QREFELT $ 105)) . #2#)
          (LETT |d|
                (- (SPADCALL |b| 2 (QREFELT $ 144))
                   (* (SPADCALL 4 |a| (QREFELT $ 98))
                      (SPADCALL |p| 0 (QREFELT $ 105))))
                . #2#)
          (LETT |r| (SPADCALL |d| (QREFELT $ 147)) . #2#)
          (EXIT
           (COND ((QEQCAR |r| 1) (LIST |p|))
                 ('T
                  (SEQ (LETT |b| (+ |b| (QCDR |r|)) . #2#)
                       (LETT |a| (SPADCALL 2 |a| (QREFELT $ 98)) . #2#)
                       (LETT |d| (GCD |a| |b|) . #2#)
                       (COND
                        ((NULL (EQL |d| 1))
                         (SEQ (LETT |a| (QUOTIENT2 |a| |d|) . #2#)
                              (EXIT (LETT |b| (QUOTIENT2 |b| |d|) . #2#)))))
                       (LETT |f|
                             (SPADCALL (SPADCALL |a| 1 (QREFELT $ 148))
                                       (SPADCALL |b| 0 (QREFELT $ 148))
                                       (QREFELT $ 149))
                             . #2#)
                       (EXIT
                        (CONS |f|
                              (LIST
                               (PROG2
                                   (LETT #1# (SPADCALL |p| |f| (QREFELT $ 115))
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
                (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 150))
                      |GALFACT;subMinusX|)
                (EXIT
                 (SPADCALL (SPADCALL |supPol| |minusX| (QREFELT $ 151))
                           (QREFELT $ 60)))))) 

(SDEFUN |GALFACT;henselFact;UPBR;32|
        ((|f| UP) (|sqf| |Boolean|)
         ($ |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| UP)
                          (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#1=#:G471 NIL) (|pf| NIL) (#2=#:G470 NIL) (#3=#:G469 NIL)
          (#4=#:G468 NIL) (|d| (|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #5=(|NonNegativeInteger|)) (#6=#:G467 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP) (|:| |exponent| #5#))))
          (#7=#:G466 NIL) (#8=#:G465 NIL) (|fac| (UP)) (#9=#:G464 NIL)
          (|sfac| NIL) (#10=#:G463 NIL) (|lcPol| (UP)) (|c| (|Integer|))
          (#11=#:G433 NIL))
         (SEQ (LETT |factorlist| NIL . #12=(|GALFACT;henselFact;UPBR;32|))
              (LETT |c| (SPADCALL |f| (QREFELT $ 26)) . #12#)
              (LETT |f|
                    (PROG2
                        (LETT #11# (SPADCALL |f| |c| (QREFELT $ 152)) . #12#)
                        (QCDR #11#)
                      (|check_union2| (QEQCAR #11# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) "failed") #11#))
                    . #12#)
              (COND
               ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                (SEQ (LETT |c| (- |c|) . #12#)
                     (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 130)) . #12#)))))
              (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 153)) . #12#)
                   (EXIT
                    (COND
                     ((SPADCALL |d| 0 (QREFELT $ 76))
                      (SEQ
                       (LETT |f|
                             (QCAR
                              (SPADCALL |f| (SPADCALL 1 |d| (QREFELT $ 148))
                                        (QREFELT $ 155)))
                             . #12#)
                       (EXIT
                        (LETT |factorlist|
                              (LIST (CONS (SPADCALL 1 1 (QREFELT $ 148)) |d|))
                              . #12#)))))))
              (LETT |d| (SPADCALL |f| (QREFELT $ 39)) . #12#)
              (EXIT
               (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                     ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                     (#13='T
                      (SEQ
                       (LETT |lcPol|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                       (QREFELT $ 61))
                             . #12#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 130))
                                    (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 156))
                          (SEQ
                           (SEQ (LETT |fac| NIL . #12#)
                                (LETT #10#
                                      (SPADCALL (ELT $ 60)
                                                (SPADCALL |d| (QREFELT $ 159))
                                                (QREFELT $ 162))
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
                                         (QREFELT $ 156))
                               (EXIT
                                (SEQ
                                 (SEQ (LETT |sfac| NIL . #12#)
                                      (LETT #9# (SPADCALL |d| (QREFELT $ 159))
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
                                               (SPADCALL |fac| (QREFELT $ 130))
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
                                         (QREFELT $ 156))
                               (EXIT
                                (SEQ
                                 (LETT |factorlist|
                                       (CONS (CONS |f| 1) |factorlist|) . #12#)
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (EXIT
                            (COND
                             (|sqf|
                              (CONS |c|
                                    (SPADCALL
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
                                     |factorlist| (QREFELT $ 164))))
                             (#13#
                              (SEQ
                               (LETT |sqfflist|
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 165))
                                               (QREFELT $ 166))
                                     . #12#)
                               (SEQ (LETT |sqfr| NIL . #12#)
                                    (LETT #6# |sqfflist| . #12#) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |sqfr| (CAR #6#) . #12#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ (LETT |mult| (QVELT |sqfr| 2) . #12#)
                                         (LETT |sqff| (QVELT |sqfr| 1) . #12#)
                                         (LETT |d|
                                               (SPADCALL |sqff| (QREFELT $ 39))
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
                                                  (SPADCALL
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
                                                   |factorlist|
                                                   (QREFELT $ 164))
                                                  . #12#))
                                           ('T
                                            (LETT |factorlist|
                                                  (SPADCALL
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
                                                   |factorlist|
                                                   (QREFELT $ 164))
                                                  . #12#)))))
                                    (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS |c| |factorlist|))))))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;33|
        ((|f| UP) (|sqf| |Boolean|) (|fd| |Set| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|)
         ($ |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| UP)
                          (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((|maxd| (|NonNegativeInteger|)) (#1=#:G512 NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#2=#:G530 NIL) (|pf| NIL) (#3=#:G529 NIL) (#4=#:G507 NIL)
          (#5=#:G528 NIL) (#6=#:G527 NIL) (#7=#:G503 NIL)
          (|d| (|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #8=(|NonNegativeInteger|)) (#9=#:G526 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP) (|:| |exponent| #8#))))
          (#10=#:G525 NIL) (#11=#:G524 NIL) (|fac| (UP)) (#12=#:G523 NIL)
          (|sfac| NIL) (#13=#:G522 NIL) (|lcPol| (UP)) (#14=#:G483 NIL)
          (#15=#:G481 NIL) (|c| (|Integer|)) (#16=#:G476 NIL))
         (SEQ
          (LETT |d| (SPADCALL |f| (QREFELT $ 39))
                . #17=(|GALFACT;btwFact;UPBSNniR;33|))
          (COND
           ((NULL (EQL (SPADCALL |fd| (QREFELT $ 127)) |d|))
            (EXIT (|error| "btwFact: Bad arguments"))))
          (LETT |factorlist| NIL . #17#)
          (LETT |c| (SPADCALL |f| (QREFELT $ 26)) . #17#)
          (LETT |f|
                (PROG2 (LETT #16# (SPADCALL |f| |c| (QREFELT $ 152)) . #17#)
                    (QCDR #16#)
                  (|check_union2| (QEQCAR #16# 0) (QREFELT $ 6)
                                  (|Union| (QREFELT $ 6) "failed") #16#))
                . #17#)
          (COND
           ((< (SPADCALL |f| (QREFELT $ 28)) 0)
            (SEQ (LETT |c| (- |c|) . #17#)
                 (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 130)) . #17#)))))
          (SEQ (LETT |maxd| (SPADCALL |f| (QREFELT $ 153)) . #17#)
               (EXIT
                (COND
                 ((SPADCALL |maxd| 0 (QREFELT $ 76))
                  (SEQ
                   (LETT |f|
                         (QCAR
                          (SPADCALL |f| (SPADCALL 1 |maxd| (QREFELT $ 148))
                                    (QREFELT $ 155)))
                         . #17#)
                   (LETT |factorlist|
                         (LIST (CONS (SPADCALL 1 1 (QREFELT $ 148)) |maxd|))
                         . #17#)
                   (LETT |r|
                         (PROG1 (LETT #15# (MAX 2 (- |r| |maxd|)) . #17#)
                           (|check_subtype2| (>= #15# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #15#))
                         . #17#)
                   (LETT |d|
                         (PROG2
                             (LETT #14# (SPADCALL |d| |maxd| (QREFELT $ 134))
                                   . #17#)
                             (QCDR #14#)
                           (|check_union2| (QEQCAR #14# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #14#))
                         . #17#)
                   (EXIT
                    (LETT |fd|
                          (SPADCALL
                           (CONS #'|GALFACT;btwFact;UPBSNniR;33!0|
                                 (VECTOR $ |d|))
                           |fd| (QREFELT $ 121))
                          . #17#)))))))
          (EXIT
           (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                 ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                 (#18='T
                  (SEQ
                   (LETT |lcPol|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                   (QREFELT $ 61))
                         . #17#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 130))
                                (SPADCALL |f| (QREFELT $ 24)) (QREFELT $ 156))
                      (SEQ
                       (SEQ (LETT |fac| NIL . #17#)
                            (LETT #13#
                                  (SPADCALL (ELT $ 60)
                                            (SPADCALL |d| (QREFELT $ 159))
                                            (QREFELT $ 162))
                                  . #17#)
                            G190
                            (COND
                             ((OR (ATOM #13#)
                                  (PROGN (LETT |fac| (CAR #13#) . #17#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |factorlist|
                                    (CONS (CONS |fac| 1) |factorlist|)
                                    . #17#)))
                            (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (CONS |c| |factorlist|))))
                     (#18#
                      (SEQ
                       (COND
                        ((ODDP |d|)
                         (COND
                          ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 156))
                           (EXIT
                            (SEQ
                             (SEQ (LETT |sfac| NIL . #17#)
                                  (LETT #12# (SPADCALL |d| (QREFELT $ 159))
                                        . #17#)
                                  G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |sfac| (CAR #12#) . #17#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |fac| (|GALFACT;subMinusX| |sfac| $)
                                         . #17#)
                                   (COND
                                    ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                     (LETT |fac|
                                           (SPADCALL |fac| (QREFELT $ 130))
                                           . #17#)))
                                   (EXIT
                                    (LETT |factorlist|
                                          (CONS (CONS |fac| 1) |factorlist|)
                                          . #17#)))
                                  (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS |c| |factorlist|))))))))
                       (COND
                        ((|GALFACT;isPowerOf2| |d| $)
                         (COND
                          ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 156))
                           (EXIT
                            (SEQ
                             (LETT |factorlist|
                                   (CONS (CONS |f| 1) |factorlist|) . #17#)
                             (EXIT (CONS |c| |factorlist|))))))))
                       (EXIT
                        (COND
                         (|sqf|
                          (CONS |c|
                                (SPADCALL
                                 (PROGN
                                  (LETT #11# NIL . #17#)
                                  (SEQ (LETT |pf| NIL . #17#)
                                       (LETT #10#
                                             (|GALFACT;btwFactor| |f| |fd| |r|
                                              'T $)
                                             . #17#)
                                       G190
                                       (COND
                                        ((OR (ATOM #10#)
                                             (PROGN
                                              (LETT |pf| (CAR #10#) . #17#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #11# (CONS (CONS |pf| 1) #11#)
                                               . #17#)))
                                       (LETT #10# (CDR #10#) . #17#) (GO G190)
                                       G191 (EXIT (NREVERSE #11#))))
                                 |factorlist| (QREFELT $ 164))))
                         (#18#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 165))
                                           (QREFELT $ 166))
                                 . #17#)
                           (COND
                            ((EQL (LENGTH |sqfflist|) 1)
                             (LETT |r|
                                   (MAX
                                    (QUOTIENT2 |r|
                                               (QVELT (|SPADfirst| |sqfflist|)
                                                      2))
                                    2)
                                   . #17#))
                            (#18# (LETT |r| 2 . #17#)))
                           (SEQ (LETT |sqfr| NIL . #17#)
                                (LETT #9# |sqfflist| . #17#) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN
                                       (LETT |sqfr| (CAR #9#) . #17#)
                                       NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QVELT |sqfr| 2) . #17#)
                                     (LETT |sqff| (QVELT |sqfr| 1) . #17#)
                                     (LETT |d| (SPADCALL |sqff| (QREFELT $ 39))
                                           . #17#)
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (SEQ
                                         (LETT |factorlist|
                                               (CONS (CONS |sqff| |mult|)
                                                     |factorlist|)
                                               . #17#)
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #7#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             127))
                                                          |mult|)
                                                         . #17#)
                                                 (|check_subtype2| (>= #7# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #7#))
                                               . #17#)
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;33!1|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 121))
                                                . #17#))))
                                       ((EQL |d| 2)
                                        (SEQ
                                         (LETT |factorlist|
                                               (SPADCALL
                                                (PROGN
                                                 (LETT #6# NIL . #17#)
                                                 (SEQ (LETT |pf| NIL . #17#)
                                                      (LETT #5#
                                                            (|GALFACT;quadratic|
                                                             |sqff| $)
                                                            . #17#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #5#)
                                                            (PROGN
                                                             (LETT |pf|
                                                                   (CAR #5#)
                                                                   . #17#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #6#
                                                              (CONS
                                                               (CONS |pf|
                                                                     |mult|)
                                                               #6#)
                                                              . #17#)))
                                                      (LETT #5# (CDR #5#)
                                                            . #17#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #6#))))
                                                |factorlist| (QREFELT $ 164))
                                               . #17#)
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #4#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             127))
                                                          (SPADCALL 2 |mult|
                                                                    (QREFELT $
                                                                             168)))
                                                         . #17#)
                                                 (|check_subtype2| (>= #4# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #4#))
                                               . #17#)
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;33!2|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 121))
                                                . #17#))))
                                       ('T
                                        (SEQ
                                         (LETT |factorlist|
                                               (SPADCALL
                                                (PROGN
                                                 (LETT #3# NIL . #17#)
                                                 (SEQ (LETT |pf| NIL . #17#)
                                                      (LETT #2#
                                                            (|GALFACT;btwFactor|
                                                             |sqff|
                                                             (SPADCALL
                                                              (CONS
                                                               #'|GALFACT;btwFact;UPBSNniR;33!3|
                                                               (VECTOR $ |d|))
                                                              |fd|
                                                              (QREFELT $ 121))
                                                             |r| 'T $)
                                                            . #17#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #2#)
                                                            (PROGN
                                                             (LETT |pf|
                                                                   (CAR #2#)
                                                                   . #17#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #3#
                                                              (CONS
                                                               (CONS |pf|
                                                                     |mult|)
                                                               #3#)
                                                              . #17#)))
                                                      (LETT #2# (CDR #2#)
                                                            . #17#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #3#))))
                                                |factorlist| (QREFELT $ 164))
                                               . #17#)
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #1#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             127))
                                                          (* |d| |mult|))
                                                         . #17#)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               . #17#)
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;33!4|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 121))
                                                . #17#)))))))
                                (LETT #9# (CDR #9#) . #17#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;33!4| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;33!3| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;33!2| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;33!1| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;33!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|GALFACT;btwFact;UPBSNniR;33|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 119)))))) 

(SDEFUN |GALFACT;factor;UPF;34| ((|f| UP) ($ |Factored| UP))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| NIL
                     (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $) 2
                     (QREFELT $ 169)))
          ('T (SPADCALL |f| NIL (QREFELT $ 167))))
         (QREFELT $ 143))) 

(SDEFUN |GALFACT;errorsum?|
        ((|d| |NonNegativeInteger|) (|ld| |List| #1=(|NonNegativeInteger|))
         ($ |Boolean|))
        (SPROG
         ((#2=#:G534 NIL) (#3=#:G533 #1#) (#4=#:G535 #1#) (#5=#:G538 NIL)
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
        (SPROG ((|s| (|Set| (|NonNegativeInteger|))) (#1=#:G542 NIL) (|d| NIL))
               (SEQ
                (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 46))
                      . #2=(|GALFACT;makeSet|))
                (SEQ (LETT |d| NIL . #2#) (LETT #1# |ld| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL |s| (|GALFACT;shiftSet| |s| |d| $)
                                       (QREFELT $ 80))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(SDEFUN |GALFACT;factor;UPLNniF;37|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 39)) |ld| $)
          (|error| "factor: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| NIL (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 169))
           (QREFELT $ 143))))) 

(SDEFUN |GALFACT;factor;UPNniF;38|
        ((|f| UP) (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (SPADCALL
         (SPADCALL |f| NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                   |r| (QREFELT $ 169))
         (QREFELT $ 143))) 

(SDEFUN |GALFACT;factor;UPLF;39|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|)) ($ |Factored| UP))
        (SPADCALL |f| |ld| 2 (QREFELT $ 171))) 

(SDEFUN |GALFACT;factor;UP2NniF;40|
        ((|f| UP) (|d| |NonNegativeInteger|) (|r| |NonNegativeInteger|)
         ($ |Factored| UP))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 39)) |d|
                                (QREFELT $ 126))
                      |GALFACT;factor;UP2NniF;40|)
                (EXIT
                 (COND ((QEQCAR |n| 1) (|error| "factor: Bad arguments"))
                       ('T
                        (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 174))
                                  |r| (QREFELT $ 171)))))))) 

(SDEFUN |GALFACT;factorSquareFree;UPF;41| ((|f| UP) ($ |Factored| UP))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                     2 (QREFELT $ 169)))
          ('T (SPADCALL |f| 'T (QREFELT $ 167))))
         (QREFELT $ 143))) 

(SDEFUN |GALFACT;factorSquareFree;UPLNniF;42|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 39)) |ld| $)
          (|error| "factorSquareFree: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| 'T (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 169))
           (QREFELT $ 143))))) 

(SDEFUN |GALFACT;factorSquareFree;UPNniF;43|
        ((|f| UP) (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (SPADCALL
         (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                   |r| (QREFELT $ 169))
         (QREFELT $ 143))) 

(SDEFUN |GALFACT;factorSquareFree;UPLF;44|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|)) ($ |Factored| UP))
        (SPADCALL |f| |ld| 2 (QREFELT $ 177))) 

(SDEFUN |GALFACT;factorSquareFree;UP2NniF;45|
        ((|f| UP) (|d| |NonNegativeInteger|) (|r| |NonNegativeInteger|)
         ($ |Factored| UP))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 39)) |d|
                                (QREFELT $ 126))
                      |GALFACT;factorSquareFree;UP2NniF;45|)
                (EXIT
                 (COND
                  ((QEQCAR |n| 1) (|error| "factorSquareFree: Bad arguments"))
                  ('T
                   (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 174)) |r|
                             (QREFELT $ 177)))))))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniBU;46|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) (|sqf| |Boolean|) ($ |Union| UP "failed"))
        (SPROG
         ((#1=#:G581 NIL) (#2=#:G582 NIL) (#3=#:G583 NIL) (|f| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (|dp| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dp| (SPADCALL |p| (QREFELT $ 39))
                  . #4=(|GALFACT;factorOfDegree;PiUPLNniBU;46|))
            (EXIT
             (COND
              ((|GALFACT;errorsum?| |dp| |ld| $)
               (|error| "factorOfDegree: Bad arguments"))
              ('T
               (SEQ
                (COND
                 ((EQL |d| 1)
                  (COND
                   ((SPADCALL |p| (QREFELT $ 131)) (EXIT (CONS 1 "failed"))))))
                (LETT |lf|
                      (QCDR
                       (SPADCALL |p| |sqf| (|GALFACT;makeSet| |ld| $) |r|
                                 (QREFELT $ 169)))
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
                          ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 39)) |d|)
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (CONS 0 (QCAR |f|)) . #4#)
                                   (GO #5=#:G580))
                                  . #4#)
                            (GO #6=#:G574))))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                 #6# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniU;47|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Union| UP "failed"))
        (SPADCALL |d| |p| |ld| |r| NIL (QREFELT $ 182))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPNniU;48|
        ((|d| |PositiveInteger|) (|p| UP) (|r| |NonNegativeInteger|)
         ($ |Union| UP "failed"))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 39)) 1 (QREFELT $ 174))
                  |r| NIL (QREFELT $ 182))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLU;49|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         ($ |Union| UP "failed"))
        (SPADCALL |d| |p| |ld| 2 NIL (QREFELT $ 182))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPU;50|
        ((|d| |PositiveInteger|) (|p| UP) ($ |Union| UP "failed"))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 39)) 1 (QREFELT $ 174)) 2
                  NIL (QREFELT $ 182))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizer;|)) 

(DEFUN |GaloisGroupFactorizer| (#1=#:G600)
  (SPROG NIL
         (PROG (#2=#:G601)
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
          (LETT $ (GETREFV 187) . #1#)
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
              (25 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 32) (|:| |factor| 25) (|:| |exponent| 38))
              (|List| 33) (|Factored| 25) (30 . |factorList|)
              |GALFACT;eisensteinIrreducible?;UPB;11| (|NonNegativeInteger|)
              (35 . |degree|) (|Record| (|:| |factor| 6) (|:| |degree| 25))
              (|List| 40) |GALFACT;numberOfFactors;LNni;12| (|List| 38)
              (|Set| 38) (40 . |parts|) (45 . |set|) (50 . |One|)
              (|SparseUnivariatePolynomial| 25) (54 . |makeSUP|) (|U32Vector|)
              (|U32VectorPolynomialOperations|) (59 . |to_mod_pa|) (65 . |gcd|)
              (72 . |degree|) (77 . <=) (|ModularDistinctDegreeFactorizer| 6)
              (83 . |gcd|) (90 . |Zero|) (94 . |pa_to_sup|) (99 . |unmakeSUP|)
              (104 . |coerce|) (109 . ~=) (115 . |invmod|) (|Void|)
              (121 . |mul_by_scalar|) (|Mapping| (|List| 50))
              (|Record| (|:| |poly| 50) (|:| |degree| 38)
                        (|:| |separate_factors| 66))
              (|List| 67) (|ModularFactorization|) (129 . |ddfact|)
              (135 . |ddFact|) (|List| 6) (141 . |separateFactors|)
              (147 . |empty|) (151 . |differentiate|) (156 . >) (162 . *)
              (|IntegerPrimesPackage| 25) (168 . |nextPrime|) (173 . |union|)
              (179 . |intersect|) (185 . =) (191 . |#|) (196 . >)
              (|Record| (|:| |prime| 25) (|:| |factors| 72))
              |GALFACT;modularFactor;UPR;22| (|Multiset| 38) (202 . |empty|)
              (206 . |insert!|) (212 . |insert!|)
              |GALFACT;degreePartition;LM;23| (|BrillhartTests| 6)
              (219 . |brillhartIrreducible?|)
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 94 '"failed")
              (|UnivariatePolynomialDecompositionPackage| 25 6)
              (224 . |monicDecomposeIfCan|) (229 . *)
              (|GaloisGroupFactorizationUtilities| 25 6 (|Float|))
              (235 . |beauzamyBound|) (|GeneralHenselPackage| 25 6)
              (240 . |completeHensel|) (248 . |elt|) (254 . |append|)
              (260 . |coefficient|) (266 . |bit?|) (272 . |elt|)
              (278 . |symmetricRemainder|) (284 . |member?|)
              (|Union| $ '"failed") (290 . |exquo|) (296 . *)
              (302 . |reduction|) (308 . |primitivePart|) (313 . |exquo|)
              (319 . |swap!|) (326 . |rest|) (332 . |setrest!|) (338 . <=)
              (|Mapping| 12 38) (344 . |select|) (350 . |singleFactorBound|)
              (356 . >) (|Record| (|:| |plist| 72) (|:| |modulo| 25))
              (362 . |HenselLift|) (370 . |exquo|) (376 . |max|)
              (|GaloisGroupPolynomialUtilities| 25 6) (381 . |reverse|)
              (386 . -) (391 . |noLinearFactor?|) (396 . |remove|)
              (402 . |ground?|) (407 . |subtractIfCan|) (413 . |setelt!|)
              (420 . |unit|)
              (|Record| (|:| |flag| 32) (|:| |factor| 6) (|:| |exponent| 38))
              (|List| 137) (|Factored| 6) (425 . |makeFR|)
              (|Record| (|:| |irr| 6) (|:| |pow| 38))
              (|Record| (|:| |contp| 25) (|:| |factors| 163))
              |GALFACT;makeFR;RF;28| (431 . ^) (|Union| 25 '"failed")
              (|IntegerRoots| 25) (437 . |perfectSqrt|) (442 . |monomial|)
              (448 . +) (454 . |monomial|) (460 . |elt|) (466 . |exquo|)
              (472 . |minimumDegree|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (477 . |monicDivide|) (483 . =) (|List| 48)
              (|CyclotomicPolynomialPackage|) (489 . |cyclotomicDecomposition|)
              (|Mapping| 6 48) (|ListFunctions2| 48 6) (494 . |map|)
              (|List| 141) (500 . |append|) (506 . |squareFree|)
              (511 . |factorList|) |GALFACT;henselFact;UPBR;32| (516 . *)
              |GALFACT;btwFact;UPBSNniR;33| |GALFACT;factor;UPF;34|
              |GALFACT;factor;UPLNniF;37| |GALFACT;factor;UPNniF;38|
              |GALFACT;factor;UPLF;39| (522 . |new|)
              |GALFACT;factor;UP2NniF;40| |GALFACT;factorSquareFree;UPF;41|
              |GALFACT;factorSquareFree;UPLNniF;42|
              |GALFACT;factorSquareFree;UPNniF;43|
              |GALFACT;factorSquareFree;UPLF;44|
              |GALFACT;factorSquareFree;UP2NniF;45| (|Union| 6 '"failed")
              |GALFACT;factorOfDegree;PiUPLNniBU;46|
              |GALFACT;factorOfDegree;PiUPLNniU;47|
              |GALFACT;factorOfDegree;PiUPNniU;48|
              |GALFACT;factorOfDegree;PiUPLU;49|
              |GALFACT;factorOfDegree;PiUPU;50|)
           '#(|useSingleFactorBound?| 528 |useSingleFactorBound| 532
              |useEisensteinCriterion?| 537 |useEisensteinCriterion| 541
              |tryFunctionalDecomposition?| 546 |tryFunctionalDecomposition|
              550 |stopMusserTrials| 555 |numberOfFactors| 564 |musserTrials|
              569 |modularFactor| 578 |makeFR| 583 |henselFact| 588
              |factorSquareFree| 594 |factorOfDegree| 625 |factor| 662
              |eisensteinIrreducible?| 693 |degreePartition| 698 |btwFact| 703)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 186
                                                 '(1 6 0 0 24 1 6 25 0 26 1 25
                                                   12 0 27 1 6 25 0 28 1 6 12 0
                                                   29 1 25 30 0 31 1 35 34 0 36
                                                   1 6 38 0 39 1 44 43 0 45 1
                                                   44 0 43 46 0 6 0 47 1 6 48 0
                                                   49 2 51 50 48 25 52 3 51 50
                                                   50 50 25 53 1 51 25 50 54 2
                                                   25 12 0 0 55 3 56 6 6 6 25
                                                   57 0 6 0 58 1 51 48 50 59 1
                                                   6 0 48 60 1 6 0 25 61 2 25
                                                   12 0 0 62 2 25 0 0 0 63 4 51
                                                   64 50 25 25 25 65 2 69 68 50
                                                   25 70 2 56 41 6 25 71 2 56
                                                   72 41 25 73 0 44 0 74 1 6 0
                                                   0 75 2 38 12 0 0 76 2 25 0
                                                   38 0 77 1 78 25 25 79 2 44 0
                                                   0 0 80 2 44 0 0 0 81 2 44 12
                                                   0 0 82 1 43 38 0 83 2 25 12
                                                   0 0 84 0 87 0 88 2 87 0 38 0
                                                   89 3 87 0 38 0 38 90 1 92 12
                                                   6 93 1 96 95 6 97 2 25 0 19
                                                   0 98 1 99 25 6 100 4 101 72
                                                   6 72 25 19 102 2 6 0 0 0 103
                                                   2 72 0 0 0 104 2 6 25 0 38
                                                   105 2 25 12 0 0 106 2 72 6 0
                                                   25 107 2 25 0 0 0 108 2 44
                                                   12 38 0 109 2 25 110 0 0 111
                                                   2 6 0 0 0 112 2 101 6 6 25
                                                   113 1 6 0 0 114 2 6 110 0 0
                                                   115 3 72 64 0 25 25 116 2 72
                                                   0 0 38 117 2 72 0 0 0 118 2
                                                   38 12 0 0 119 2 44 0 120 0
                                                   121 2 99 25 6 38 122 2 19 12
                                                   0 0 123 4 101 124 6 72 25 19
                                                   125 2 38 110 0 0 126 1 44 38
                                                   0 127 1 128 6 6 129 1 6 0 0
                                                   130 1 92 12 6 131 2 44 0 38
                                                   0 132 1 6 12 0 133 2 38 110
                                                   0 0 134 3 72 6 0 25 6 135 1
                                                   35 25 0 136 2 139 0 6 138
                                                   140 2 25 0 0 19 144 1 146
                                                   145 25 147 2 6 0 25 38 148 2
                                                   6 0 0 0 149 2 48 0 25 38 150
                                                   2 48 0 0 0 151 2 6 110 0 25
                                                   152 1 6 38 0 153 2 6 154 0 0
                                                   155 2 6 12 0 0 156 1 158 157
                                                   25 159 2 161 72 160 157 162
                                                   2 163 0 0 0 164 1 6 30 0 165
                                                   1 139 138 0 166 2 38 0 19 0
                                                   168 2 43 0 38 38 174 0 0 12
                                                   17 1 0 12 12 18 0 0 12 13 1
                                                   0 12 12 14 0 0 12 15 1 0 12
                                                   12 16 1 0 19 19 21 0 0 19 20
                                                   1 0 38 41 42 1 0 19 19 23 0
                                                   0 19 22 1 0 85 6 86 1 0 139
                                                   142 143 2 0 142 6 12 167 2 0
                                                   139 6 38 178 1 0 139 6 176 3
                                                   0 139 6 43 38 177 2 0 139 6
                                                   43 179 3 0 139 6 38 38 180 2
                                                   0 181 19 6 186 3 0 181 19 6
                                                   43 185 3 0 181 19 6 38 184 5
                                                   0 181 19 6 43 38 12 182 4 0
                                                   181 19 6 43 38 183 1 0 139 6
                                                   170 2 0 139 6 43 173 2 0 139
                                                   6 38 172 3 0 139 6 38 38 175
                                                   3 0 139 6 43 38 171 1 0 12 6
                                                   37 1 0 87 41 91 4 0 142 6 12
                                                   44 38 169)))))
           '|lookupComplete|)) 
