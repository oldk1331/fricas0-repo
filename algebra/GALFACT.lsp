
(SDEFUN |GALFACT;useEisensteinCriterion?;B;1| (($ |Boolean|)) (QREFELT $ 11)) 

(SDEFUN |GALFACT;useEisensteinCriterion;2B;2| ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|#G5| (|Boolean|)) (|#G4| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G4| |b|)
                 (LETT |#G5| (QREFELT $ 11))
                 (SETELT $ 11 |#G4|)
                 (LETT |b| |#G5|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;tryFunctionalDecomposition?;B;3| (($ |Boolean|))
        (QREFELT $ 10)) 

(SDEFUN |GALFACT;tryFunctionalDecomposition;2B;4|
        ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|#G8| (|Boolean|)) (|#G7| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G7| |b|)
                 (LETT |#G8| (QREFELT $ 10))
                 (SETELT $ 10 |#G7|)
                 (LETT |b| |#G8|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;useSingleFactorBound?;B;5| (($ |Boolean|)) (QREFELT $ 9)) 

(SDEFUN |GALFACT;useSingleFactorBound;2B;6| ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|#G11| (|Boolean|)) (|#G10| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G10| |b|)
                 (LETT |#G11| (QREFELT $ 9))
                 (SETELT $ 9 |#G10|)
                 (LETT |b| |#G11|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;stopMusserTrials;Pi;7| (($ |PositiveInteger|)) (QREFELT $ 8)) 

(SDEFUN |GALFACT;stopMusserTrials;2Pi;8|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|#G14| (|PositiveInteger|)) (|#G13| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G13| |n|)
                 (LETT |#G14| (QREFELT $ 8))
                 (SETELT $ 8 |#G13|)
                 (LETT |n| |#G14|))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;musserTrials;Pi;9| (($ |PositiveInteger|)) (QREFELT $ 7)) 

(SDEFUN |GALFACT;musserTrials;2Pi;10|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|#G17| (|PositiveInteger|)) (|#G16| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G16| |n|)
                 (LETT |#G17| (QREFELT $ 7))
                 (SETELT $ 7 |#G16|)
                 (LETT |n| |#G17|))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;eisensteinIrreducible?;UPB;11| ((|f| UP) ($ |Boolean|))
        (SPROG
         ((#1=#:G193 NIL) (#2=#:G194 NIL) (|p| NIL) (|rf| (UP))
          (|tc| #3=(|Integer|)) (|lc| #3#) (|c| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |rf| (SPADCALL |f| (QREFELT $ 24)))
                (LETT |c| (SPADCALL |rf| (QREFELT $ 26)))
                (EXIT
                 (COND ((OR (ZEROP |c|) (SPADCALL |c| (QREFELT $ 27))) NIL)
                       ('T
                        (SEQ (LETT |lc| (SPADCALL |f| (QREFELT $ 28)))
                             (LETT |tc| |lc|)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (NULL (SPADCALL |rf| (QREFELT $ 29))))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |tc| (SPADCALL |rf| (QREFELT $ 28)))
                                   (EXIT
                                    (LETT |rf|
                                          (SPADCALL |rf| (QREFELT $ 24)))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |p| NIL)
                                  (LETT #2#
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 31))
                                                  (QREFELT $ 36)))
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |p| (CAR #2#)) NIL))
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
                                           (LETT #1# 'T)
                                           (GO #4=#:G192))))))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT NIL)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |GALFACT;numberOfFactors;LNni;12|
        ((|ddlist| |List|
          (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|))))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G196 NIL) (|d| (|Integer|))
          (#2=#:G203 NIL) (|dd| NIL))
         (SEQ (LETT |n| 0) (LETT |d| 0)
              (SEQ (LETT |dd| NIL) (LETT #2# |ddlist|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |dd| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |n|
                           (+ |n|
                              (COND
                               ((ZEROP
                                 (LETT |d|
                                       (SPADCALL (QCAR |dd|) (QREFELT $ 39))))
                                1)
                               ('T
                                (PROG1 (LETT #1# (QUOTIENT2 |d| (QCDR |dd|)))
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |n|)))) 

(SDEFUN |GALFACT;shiftSet|
        ((|s| |Set| (|NonNegativeInteger|)) (|shift| |NonNegativeInteger|)
         ($ |Set| (|NonNegativeInteger|)))
        (SPROG NIL
               (SPADCALL (CONS #'|GALFACT;shiftSet!0| (VECTOR $ |shift|)) |s|
                         (QREFELT $ 46)))) 

(SDEFUN |GALFACT;shiftSet!0| ((|e| NIL) ($$ NIL))
        (PROG (|shift| $)
          (LETT |shift| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |shift| (QREFELT $ 43)))))) 

(SDEFUN |GALFACT;reductum| ((|n| |Integer|) ($ |Integer|))
        (- |n| (ASH 1 (- (INTEGER-LENGTH |n|) 1)))) 

(SDEFUN |GALFACT;seed| ((|level| |Integer|) ($ |Integer|))
        (- (ASH 1 |level|) 1)) 

(SDEFUN |GALFACT;nextRecNum|
        ((|levels| |NonNegativeInteger|) (|level| |Integer|) (|n| |Integer|)
         ($ |Union| (|Integer|) "End of level"))
        (SPROG
         ((|b| (|Integer|)) (|lr| #1=(|Integer|)) (#2=#:G216 NIL) (|l| #1#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |l| (INTEGER-LENGTH |n|))
                 (EXIT
                  (COND
                   ((< |l| |levels|)
                    (PROGN
                     (LETT #2# (CONS 0 (+ |n| (ASH 1 (- |l| 1)))))
                     (GO #3=#:G215))))))
            (EXIT
             (COND
              ((EQL |n| (ASH (|GALFACT;seed| |level| $) (- |levels| |level|)))
               (CONS 1 "End of level"))
              ('T
               (SEQ (LETT |b| 1)
                    (SEQ G190
                         (COND
                          ((NULL
                            (EQL (- |l| |b|)
                                 (LETT |lr|
                                       (INTEGER-LENGTH
                                        (LETT |n|
                                              (|GALFACT;reductum| |n| $))))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |b| (+ |b| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (+ (|GALFACT;reductum| |n| $)
                              (ASH (|GALFACT;seed| (+ |b| 1) $) |lr|))))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |GALFACT;fullSet|
        ((|n| |NonNegativeInteger|) ($ |Set| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G220 NIL) (|i| NIL) (#2=#:G219 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |i| #2#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 49))))) 

(SDEFUN |GALFACT;is_mod_coprime?|
        ((|pol1| UP) (|pol2| UP) (|p| |Integer|) (|small| |Boolean|)
         ($ |Boolean|))
        (SPROG ((|vg| (|U32Vector|)) (|v2| #1=(|U32Vector|)) (|v1| #1#))
               (SEQ
                (COND
                 (|small|
                  (SEQ
                   (LETT |v1|
                         (SPADCALL (SPADCALL |pol1| (QREFELT $ 51)) |p|
                                   (QREFELT $ 54)))
                   (LETT |v2|
                         (SPADCALL (SPADCALL |pol2| (QREFELT $ 51)) |p|
                                   (QREFELT $ 54)))
                   (LETT |vg| (SPADCALL |v1| |v2| |p| (QREFELT $ 55)))
                   (EXIT
                    (SPADCALL (SPADCALL |vg| (QREFELT $ 56)) 0
                              (QREFELT $ 57)))))
                 ('T
                  (ZEROP
                   (SPADCALL (SPADCALL |pol1| |pol2| |p| (QREFELT $ 59))
                             (QREFELT $ 39)))))))) 

(SDEFUN |GALFACT;add_degs|
        ((|deg1| |NonNegativeInteger|) (|deg2| |NonNegativeInteger|)
         (|res| |List| (|NonNegativeInteger|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G226 NIL) (|i| NIL))
               (SEQ
                (COND ((EQL |deg2| 0) |res|)
                      ('T
                       (SEQ
                        (SEQ (LETT |i| 1) (LETT #1# (QUOTIENT2 |deg1| |deg2|))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ (EXIT (LETT |res| (CONS |deg2| |res|))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |GALFACT;do_separate|
        ((|sfl| |List| (|Mapping| #1=(|List| (|U32Vector|)))) (|c| |Integer|)
         ($ |List| UP))
        (SPROG
         ((|res| (|List| UP)) (#2=#:G233 NIL) (|v| NIL) (|vl| #1#)
          (#3=#:G232 NIL) (|sf| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |sf| NIL) (LETT #3# |sfl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |sf| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |vl| (SPADCALL |sf|))
                        (EXIT
                         (SEQ (LETT |v| NIL) (LETT #2# |vl|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |v| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (SPADCALL (SPADCALL |v| (QREFELT $ 61))
                                                 (QREFELT $ 62))
                                       |res|))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL |c| (QREFELT $ 63)) |res|))))) 

(SDEFUN |GALFACT;do_ddfact|
        ((|pol| UP) (|p| |Integer|) (|small| |Boolean|)
         ($ |Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
          (|:| |separate_factors| (|Mapping| (|List| UP)))))
        (SPROG
         ((|degs| (|List| (|NonNegativeInteger|))) (#1=#:G244 NIL)
          (#2=#:G251 NIL) (|rl| NIL)
          (|res1|
           (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
          (|sfl| (|List| (|Mapping| (|List| (|U32Vector|))))) (#3=#:G238 NIL)
          (#4=#:G250 NIL) (|fr| NIL)
          (|ul1|
           (|List|
            (|Record| (|:| |poly| (|U32Vector|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|U32Vector|)))))))
          (|ci| (|Integer|)) (|c| (|Integer|)) (|dpol| (|Integer|))
          (|v| (|U32Vector|)))
         (SEQ (LETT |degs| NIL)
              (EXIT
               (COND
                (|small|
                 (SEQ
                  (LETT |v|
                        (SPADCALL (SPADCALL |pol| (QREFELT $ 51)) |p|
                                  (QREFELT $ 54)))
                  (LETT |dpol| (SPADCALL |v| (QREFELT $ 56)))
                  (LETT |c| (ELT_U32 |v| |dpol|))
                  (COND
                   ((SPADCALL |c| 1 (QREFELT $ 64))
                    (SEQ (LETT |ci| (SPADCALL |c| |p| (QREFELT $ 65)))
                         (EXIT
                          (SPADCALL |v| |dpol| |ci| |p| (QREFELT $ 67))))))
                  (LETT |ul1| (SPADCALL |v| |p| (QREFELT $ 72)))
                  (LETT |sfl| NIL)
                  (SEQ (LETT |fr| NIL) (LETT #4# |ul1|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |fr| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |degs|
                              (|GALFACT;add_degs|
                               (PROG1
                                   (LETT #3#
                                         (SPADCALL (QVELT |fr| 0)
                                                   (QREFELT $ 56)))
                                 (|check_subtype2| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #3#))
                               (QVELT |fr| 1) |degs| $))
                        (EXIT (LETT |sfl| (CONS (QVELT |fr| 2) |sfl|))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |degs|
                         (CONS #'|GALFACT;do_ddfact!0|
                               (VECTOR $ |c| |sfl|))))))
                ('T
                 (SEQ (LETT |res1| (SPADCALL |pol| |p| (QREFELT $ 73)))
                      (SEQ (LETT |rl| NIL) (LETT #2# |res1|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |rl| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |degs|
                                   (|GALFACT;add_degs|
                                    (SPADCALL (QCAR |rl|) (QREFELT $ 39))
                                    (PROG1 (LETT #1# (QCDR |rl|))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    |degs| $))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS |degs|
                             (CONS #'|GALFACT;do_ddfact!1|
                                   (VECTOR $ |p| |res1|))))))))))) 

(SDEFUN |GALFACT;do_ddfact!1| (($$ NIL))
        (PROG (|res1| |p| $)
          (LETT |res1| (QREFELT $$ 2))
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |res1| |p| (QREFELT $ 75)))))) 

(SDEFUN |GALFACT;do_ddfact!0| (($$ NIL))
        (PROG (|sfl| |c| $)
          (LETT |sfl| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GALFACT;do_separate| |sfl| |c| $))))) 

(SDEFUN |GALFACT;modularFactor;UPSR;22|
        ((|p| UP) (|d| |Set| (|NonNegativeInteger|))
         ($ |Record| (|:| |prime| (|Integer|)) (|:| |factors| (|List| UP))))
        (SPROG
         ((|fl| (|List| UP)) (|cprime| (|Integer|)) (|res_prime| (|Integer|))
          (|dd_res|
           #1=(|Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
                        (|:| |separate_factors| (|Mapping| (|List| UP)))))
          (|nf| (|NonNegativeInteger|)) (|nf1| (|NonNegativeInteger|))
          (#2=#:G268 NIL) (|s| (|Set| (|NonNegativeInteger|))) (#3=#:G270 NIL)
          (|degfact| (|NonNegativeInteger|))
          (|ddlist| (|List| (|NonNegativeInteger|))) (|dd_res1| #1#)
          (|small| (|Boolean|)) (#4=#:G269 NIL) (|i| NIL) (|diffp| (UP))
          (|degp| #5=(|NonNegativeInteger|))
          (|dirred| (|Set| (|NonNegativeInteger|))) (|n| #5#))
         (SEQ
          (EXIT
           (COND
            ((NULL (EQL (ABS (SPADCALL |p| (QREFELT $ 26))) 1))
             (|error| "modularFactor: the polynomial is not primitive."))
            ('T
             (COND
              ((ZEROP (LETT |n| (SPADCALL |p| (QREFELT $ 39))))
               (CONS 0 (LIST |p|)))
              ('T
               (SEQ (LETT |cprime| 2)
                    (LETT |dirred| (SPADCALL (LIST 0 |n|) (QREFELT $ 49)))
                    (LETT |s| (SPADCALL (QREFELT $ 76))) (LETT |ddlist| NIL)
                    (LETT |degfact| 0)
                    (LETT |degp| (SPADCALL |p| (QREFELT $ 39)))
                    (LETT |nf| (+ (+ |degp| (QREFELT $ 8)) 1))
                    (LETT |diffp| (SPADCALL |p| (QREFELT $ 77)))
                    (LETT |small| 'T)
                    (SEQ (LETT |i| 1) (LETT #4# (QREFELT $ 7)) G190
                         (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |nf| (QREFELT $ 8) (QREFELT $ 78))
                             (SEQ
                              (COND
                               (|small|
                                (COND
                                 ((NULL
                                   (<
                                    (*
                                     (SPADCALL |degp| |cprime| (QREFELT $ 79))
                                     |cprime|)
                                    18446744073709551616))
                                  (LETT |small| NIL)))))
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
                                           (SPADCALL |cprime|
                                                     (QREFELT $ 81)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |dd_res1|
                                    (|GALFACT;do_ddfact| |p| |cprime| |small|
                                     $))
                              (LETT |ddlist| (QCAR |dd_res1|))
                              (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 49)))
                              (SEQ (LETT |degfact| NIL) (LETT #3# |ddlist|)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |degfact| (CAR #3#))
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL |s|
                                                     (|GALFACT;shiftSet| |s|
                                                      |degfact| $)
                                                     (QREFELT $ 82)))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |d| (SPADCALL |d| |s| (QREFELT $ 83)))
                              (EXIT
                               (COND
                                ((SPADCALL |d| |dirred| (QREFELT $ 84))
                                 (PROGN
                                  (LETT #2# (CONS 0 (LIST |p|)))
                                  (GO #6=#:G267)))
                                ('T
                                 (SEQ
                                  (LETT |nf1|
                                        (SPADCALL |ddlist| (QREFELT $ 85)))
                                  (COND
                                   ((< |nf1| |nf|)
                                    (SEQ (LETT |nf| |nf1|)
                                         (LETT |dd_res| |dd_res1|)
                                         (EXIT (LETT |res_prime| |cprime|))))
                                   ((EQL |nf1| |nf|)
                                    (COND
                                     ((SPADCALL |cprime| |res_prime|
                                                (QREFELT $ 86))
                                      (SEQ (LETT |nf| |nf1|)
                                           (LETT |dd_res| |dd_res1|)
                                           (EXIT
                                            (LETT |res_prime| |cprime|)))))))
                                  (EXIT
                                   (LETT |cprime|
                                         (SPADCALL |cprime|
                                                   (QREFELT $ 81)))))))))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |fl| (SPADCALL (QCDR |dd_res|)))
                    (EXIT (CONS |res_prime| |fl|))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |GALFACT;degreePartition;LM;23|
        ((|ddlist| |List|
          (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|))))
         ($ |Multiset| (|NonNegativeInteger|)))
        (SPROG
         ((|dp| (|Multiset| (|NonNegativeInteger|)))
          (|dd| #1=(|NonNegativeInteger|)) (#2=#:G272 NIL) (|d| #1#)
          (#3=#:G278 NIL) (|f| NIL))
         (SEQ (LETT |dp| (SPADCALL (QREFELT $ 90))) (LETT |d| 0) (LETT |dd| 0)
              (SEQ (LETT |f| NIL) (LETT #3# |ddlist|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((ZEROP (LETT |d| (SPADCALL (QCAR |f|) (QREFELT $ 39))))
                       (LETT |dp| (SPADCALL 0 |dp| (QREFELT $ 91))))
                      ('T
                       (SEQ
                        (LETT |dd|
                              (PROG1 (LETT #2# (QCDR |f|))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#)))
                        (EXIT
                         (LETT |dp|
                               (SPADCALL |dd| |dp| (QUOTIENT2 |d| |dd|)
                                         (QREFELT $ 92)))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |dp|)))) 

(SDEFUN |GALFACT;sel_set|
        ((|d| |Set| (|NonNegativeInteger|)) (|n| |NonNegativeInteger|)
         (|m| |NonNegativeInteger|) ($ |Set| (|NonNegativeInteger|)))
        (SPROG ((|nm| (|NonNegativeInteger|)))
               (SEQ
                (COND ((EQL |n| 0) (SPADCALL (LIST 0) (QREFELT $ 49)))
                      ('T
                       (SEQ (LETT |nm| (* |n| |m|))
                            (EXIT
                             (SPADCALL
                              (CONS #'|GALFACT;sel_set!0| (VECTOR |n| $ |nm|))
                              |d| (QREFELT $ 99))))))))) 

(SDEFUN |GALFACT;sel_set!0| ((|x| NIL) ($$ NIL))
        (PROG (|nm| $ |n|)
          (LETT |nm| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |x| |nm| (QREFELT $ 94))
              (SPADCALL (SPADCALL |x| |n| (QREFELT $ 95)) (|spadConstant| $ 96)
                        (QREFELT $ 97)))
             ('T NIL)))))) 

(SDEFUN |GALFACT;henselfact|
        ((|f| UP) (|pdecomp| |Boolean|) (|d| |Set| (|NonNegativeInteger|))
         ($ . #1=(|List| UP)))
        (SPROG
         ((#2=#:G293 NIL) (#3=#:G292 #1#) (#4=#:G294 #1#) (#5=#:G299 NIL)
          (|g| NIL) (|d1| (|Set| (|NonNegativeInteger|)))
          (|dh| (|NonNegativeInteger|))
          (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|b| (|PositiveInteger|)) (#6=#:G289 NIL) (|cprime| #7=(|Integer|))
          (|m| (|Record| (|:| |prime| #7#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (#8=#:G298 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT $ 101))
              (PROGN (LETT #8# (LIST |f|)) (GO #9=#:G297)))
             ((QREFELT $ 11)
              (COND
               ((SPADCALL |f| (QREFELT $ 37))
                (PROGN (LETT #8# (LIST |f|)) (GO #9#))))))
            (COND
             (|pdecomp|
              (COND ((QREFELT $ 10) (LETT |cf| (SPADCALL |f| (QREFELT $ 105))))
                    (#10='T (LETT |cf| (CONS 1 #11="failed")))))
             (#10# (LETT |cf| (CONS 1 #11#))))
            (EXIT
             (COND
              ((QEQCAR |cf| 1)
               (SEQ (LETT |m| (SPADCALL |f| |d| (QREFELT $ 88)))
                    (EXIT
                     (COND ((ZEROP (LETT |cprime| (QCAR |m|))) (QCDR |m|))
                           (#10#
                            (SEQ
                             (LETT |b|
                                   (PROG1
                                       (LETT #6#
                                             (*
                                              (SPADCALL 2
                                                        (SPADCALL |f|
                                                                  (QREFELT $
                                                                           28))
                                                        (QREFELT $ 106))
                                              (SPADCALL |f| (QREFELT $ 108))))
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #6#)))
                             (EXIT
                              (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                        (QREFELT $ 110)))))))))
              (#10#
               (SEQ (LETT |lrf| (QCDR |cf|))
                    (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT $ 39)))
                    (LETT |d1| (|GALFACT;divideSet| |d| |dh| $))
                    (EXIT
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |g| NIL)
                           (LETT #5#
                                 (|GALFACT;henselfact| (QCAR |lrf|) 'T |d1| $))
                           G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|GALFACT;henselfact|
                                     (SPADCALL |g| (QCDR |lrf|)
                                               (QREFELT $ 111))
                                     NIL
                                     (|GALFACT;sel_set| |d|
                                      (SPADCALL |g| (QREFELT $ 39)) |dh| $)
                                     $))
                              (COND
                               (#2#
                                (LETT #3# (SPADCALL #3# #4# (QREFELT $ 112))))
                               ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                           (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                      (COND (#2# #3#) (#10# NIL))))))))))
          #9# (EXIT #8#)))) 

(SDEFUN |GALFACT;henselfact1| ((|f| UP) (|pdecomp| |Boolean|) ($ |List| UP))
        (|GALFACT;henselfact| |f| |pdecomp|
         (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $) $)) 

(SDEFUN |GALFACT;completeFactor|
        ((|f| UP) (|lf| |List| UP) (|cprime| |Integer|)
         (|pk| |PositiveInteger|) (|r| |NonNegativeInteger|)
         (|d| |Set| (|NonNegativeInteger|)) ($ |List| UP))
        (SPROG
         ((|level| (|Integer|)) (|found?| (|Boolean|))
          (|levels| (|NonNegativeInteger|))
          (|ic| (|Union| (|Integer|) "End of level")) (#1=#:G349 NIL)
          (#2=#:G335 NIL)
          (|llg|
           (|Record| (|:| |plist| (|List| UP)) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#3=#:G334 NIL) (|ltrue| #4=(|List| UP))
          (|degf| #5=(|NonNegativeInteger|)) (#6=#:G331 NIL) (|lg| #4#)
          (|gpk| (|PositiveInteger|)) (#7=#:G326 NIL) (#8=#:G323 NIL)
          (#9=#:G322 NIL) (|rg| #5#) (#10=#:G321 NIL)
          (|dg| (|Set| (|NonNegativeInteger|))) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#11=#:G319 NIL) (#12=#:G317 NIL)
          (|nb| (|Integer|)) (#13=#:G352 NIL) (|j| NIL)
          (|f1| (|Union| UP "failed")) (|g| (UP)) (#14=#:G351 NIL)
          (|g0| (|Integer|)) (|degg| #5#) (#15=#:G350 NIL) (|i| (|Integer|))
          (#16=#:G209 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lc| (SPADCALL |f| (QREFELT $ 28)))
                (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 113))) (LETT |ltrue| NIL)
                (LETT |found?| 'T) (LETT |degf| 0) (LETT |degg| 0)
                (LETT |g0| 0) (LETT |g| (|spadConstant| $ 60)) (LETT |rg| 0)
                (LETT |nb| 0) (LETT |lg| NIL) (LETT |b| 1)
                (LETT |dg| (SPADCALL (QREFELT $ 76))) (LETT |llg| (CONS NIL 0))
                (LETT |levels| (LENGTH |lf|)) (LETT |level| 1)
                (LETT |ic| (CONS 0 0)) (LETT |i| 0)
                (SEQ G190 (COND ((NULL (< |level| |levels|)) (GO G191)))
                     (SEQ (LETT |ic| (CONS 0 (|GALFACT;seed| |level| $)))
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND (|found?| NIL) ('T (QEQCAR |ic| 0))))
                                 (GO G191)))
                               (SEQ
                                (LETT |i|
                                      (PROG2 (LETT #16# |ic|)
                                          (QCDR #16#)
                                        (|check_union2| (QEQCAR #16# 0)
                                                        (|Integer|)
                                                        (|Union| (|Integer|)
                                                                 "End of level")
                                                        #16#)))
                                (LETT |degg| 0) (LETT |g0| 1)
                                (SEQ (LETT |j| 1) (LETT #15# |levels|) G190
                                     (COND ((|greater_SI| |j| #15#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL |i| (- |j| 1)
                                                   (QREFELT $ 114))
                                         (SEQ
                                          (LETT |degg|
                                                (+ |degg|
                                                   (SPADCALL
                                                    (SPADCALL |lf| |j|
                                                              (QREFELT $ 115))
                                                    (QREFELT $ 39))))
                                          (EXIT
                                           (LETT |g0|
                                                 (* |g0|
                                                    (SPADCALL
                                                     (SPADCALL |lf| |j|
                                                               (QREFELT $ 115))
                                                     0 (QREFELT $ 113))))))))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |g0|
                                      (SPADCALL (* |lc| |g0|) |pk|
                                                (QREFELT $ 116)))
                                (COND
                                 ((SPADCALL |degg| |d| (QREFELT $ 117))
                                  (COND
                                   ((QEQCAR
                                     (SPADCALL (* |lc| |f0|) |g0|
                                               (QREFELT $ 119))
                                     0)
                                    (SEQ
                                     (LETT |g| (SPADCALL |lc| (QREFELT $ 63)))
                                     (SEQ (LETT |j| 1) (LETT #14# |levels|)
                                          G190
                                          (COND
                                           ((|greater_SI| |j| #14#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |i| (- |j| 1)
                                                        (QREFELT $ 114))
                                              (LETT |g|
                                                    (SPADCALL |g|
                                                              (SPADCALL |lf|
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         115))
                                                              (QREFELT $
                                                                       120)))))))
                                          (LETT |j| (|inc_SI| |j|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |g|
                                           (SPADCALL
                                            (SPADCALL |g| |pk| (QREFELT $ 121))
                                            (QREFELT $ 122)))
                                     (LETT |f1|
                                           (SPADCALL |f| |g| (QREFELT $ 123)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |f1| 0)
                                        (SEQ (LETT |found?| 'T) (LETT |nb| 1)
                                             (SEQ (LETT |j| 1)
                                                  (LETT #13# |levels|) G190
                                                  (COND
                                                   ((|greater_SI| |j| #13#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |i| (- |j| 1)
                                                                (QREFELT $
                                                                         114))
                                                      (SEQ
                                                       (SPADCALL |lf| |j| |nb|
                                                                 (QREFELT $
                                                                          124))
                                                       (EXIT
                                                        (LETT |nb|
                                                              (+ |nb| 1))))))))
                                                  (LETT |j| (|inc_SI| |j|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |lg| |lf|)
                                             (LETT |lf|
                                                   (SPADCALL |lf|
                                                             (PROG1
                                                                 (LETT #12#
                                                                       |level|)
                                                               (|check_subtype2|
                                                                (>= #12# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #12#))
                                                             (QREFELT $ 125)))
                                             (SPADCALL
                                              (SPADCALL |lg|
                                                        (PROG1
                                                            (LETT #11#
                                                                  (- |level|
                                                                     1))
                                                          (|check_subtype2|
                                                           (>= #11# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #11#))
                                                        (QREFELT $ 125))
                                              NIL (QREFELT $ 126))
                                             (LETT |f| (QCDR |f1|))
                                             (LETT |lc|
                                                   (SPADCALL |f|
                                                             (QREFELT $ 28)))
                                             (LETT |f0|
                                                   (SPADCALL |f| 0
                                                             (QREFELT $ 113)))
                                             (LETT |dg|
                                                   (SPADCALL
                                                    (CONS
                                                     #'|GALFACT;completeFactor!0|
                                                     (VECTOR $ |degg|))
                                                    |d| (QREFELT $ 99)))
                                             (COND
                                              ((SPADCALL |dg|
                                                         (SPADCALL
                                                          (LIST 0 |degg|)
                                                          (QREFELT $ 49))
                                                         (QREFELT $ 84))
                                               (LETT |lg| (LIST |g|)))
                                              ('T
                                               (SEQ
                                                (LETT |rg|
                                                      (PROG1
                                                          (LETT #10#
                                                                (MAX 2
                                                                     (-
                                                                      (+ |r|
                                                                         |level|)
                                                                      |levels|)))
                                                        (|check_subtype2|
                                                         (>= #10# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #10#)))
                                                (LETT |b|
                                                      (PROG1
                                                          (LETT #9#
                                                                (*
                                                                 (SPADCALL 2
                                                                           (SPADCALL
                                                                            |g|
                                                                            (QREFELT
                                                                             $
                                                                             28))
                                                                           (QREFELT
                                                                            $
                                                                            106))
                                                                 (SPADCALL |g|
                                                                           |rg|
                                                                           (QREFELT
                                                                            $
                                                                            127))))
                                                        (|check_subtype2|
                                                         (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |b| |pk|
                                                             (QREFELT $ 128))
                                                   (COND
                                                    ((SPADCALL |g|
                                                               (QREFELT $ 101))
                                                     (LETT |lg| (LIST |g|)))
                                                    ((QREFELT $ 11)
                                                     (COND
                                                      ((SPADCALL |g|
                                                                 (QREFELT $
                                                                          37))
                                                       (LETT |lg| (LIST |g|)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |llg|
                                                              (SPADCALL |g|
                                                                        |lg|
                                                                        |cprime|
                                                                        |b|
                                                                        (QREFELT
                                                                         $
                                                                         130)))
                                                        (LETT |gpk|
                                                              (PROG1
                                                                  (LETT #8#
                                                                        (QCDR
                                                                         |llg|))
                                                                (|check_subtype2|
                                                                 (> #8# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|Integer|)
                                                                 #8#)))
                                                        (EXIT
                                                         (COND
                                                          ((< |gpk| |b|)
                                                           (LETT |lg|
                                                                 (QCAR |llg|)))
                                                          ('T
                                                           (LETT |lg|
                                                                 (|GALFACT;completeFactor|
                                                                  |g|
                                                                  (QCAR |llg|)
                                                                  |cprime|
                                                                  |gpk| |rg|
                                                                  |dg|
                                                                  $)))))))))
                                                    ('T
                                                     (SEQ
                                                      (LETT |llg|
                                                            (SPADCALL |g| |lg|
                                                                      |cprime|
                                                                      |b|
                                                                      (QREFELT
                                                                       $ 130)))
                                                      (LETT |gpk|
                                                            (PROG1
                                                                (LETT #7#
                                                                      (QCDR
                                                                       |llg|))
                                                              (|check_subtype2|
                                                               (> #7# 0)
                                                               '(|PositiveInteger|)
                                                               '(|Integer|)
                                                               #7#)))
                                                      (EXIT
                                                       (COND
                                                        ((< |gpk| |b|)
                                                         (LETT |lg|
                                                               (QCAR |llg|)))
                                                        ('T
                                                         (LETT |lg|
                                                               (|GALFACT;completeFactor|
                                                                |g|
                                                                (QCAR |llg|)
                                                                |cprime| |gpk|
                                                                |rg| |dg|
                                                                $)))))))))
                                                  ('T
                                                   (LETT |lg| (LIST |g|))))))))
                                             (LETT |ltrue|
                                                   (SPADCALL |ltrue| |lg|
                                                             (QREFELT $ 112)))
                                             (LETT |r|
                                                   (PROG1
                                                       (LETT #6#
                                                             (MAX 2
                                                                  (- |r|
                                                                     (LENGTH
                                                                      |lg|))))
                                                     (|check_subtype2|
                                                      (>= #6# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #6#)))
                                             (LETT |degf|
                                                   (SPADCALL |f|
                                                             (QREFELT $ 39)))
                                             (LETT |d|
                                                   (SPADCALL
                                                    (CONS
                                                     #'|GALFACT;completeFactor!1|
                                                     (VECTOR $ |degf|))
                                                    |d| (QREFELT $ 99)))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |degf| 1
                                                          (QREFELT $ 94))
                                                (SEQ
                                                 (COND
                                                  ((EQL |degf| 1)
                                                   (LETT |ltrue|
                                                         (CONS |f| |ltrue|))))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #1# |ltrue|)
                                                   (GO #17=#:G348)))))
                                               ('T
                                                (SEQ
                                                 (LETT |b|
                                                       (PROG1
                                                           (LETT #3#
                                                                 (*
                                                                  (SPADCALL 2
                                                                            |lc|
                                                                            (QREFELT
                                                                             $
                                                                             106))
                                                                  (SPADCALL |f|
                                                                            |r|
                                                                            (QREFELT
                                                                             $
                                                                             127))))
                                                         (|check_subtype2|
                                                          (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #3#)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |b| |pk|
                                                              (QREFELT $ 128))
                                                    (SEQ
                                                     (LETT |llg|
                                                           (SPADCALL |f| |lf|
                                                                     |cprime|
                                                                     |b|
                                                                     (QREFELT $
                                                                              130)))
                                                     (LETT |lf| (QCAR |llg|))
                                                     (LETT |pk|
                                                           (PROG1
                                                               (LETT #2#
                                                                     (QCDR
                                                                      |llg|))
                                                             (|check_subtype2|
                                                              (> #2# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #2#)))
                                                     (COND
                                                      ((< |pk| |b|)
                                                       (PROGN
                                                        (LETT #1#
                                                              (SPADCALL |lf|
                                                                        |ltrue|
                                                                        (QREFELT
                                                                         $
                                                                         112)))
                                                        (GO #17#))))
                                                     (EXIT
                                                      (LETT |level|
                                                            1)))))))))))))))))))
                                (EXIT
                                 (LETT |ic|
                                       (|GALFACT;nextRecNum| |levels| |level|
                                        |i| $))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (COND
                           (|found?|
                            (SEQ (LETT |levels| (LENGTH |lf|))
                                 (EXIT (LETT |found?| NIL)))))
                          (EXIT
                           (COND
                            ((NULL (QEQCAR |ic| 0))
                             (LETT |level| (+ |level| 1))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |f| |ltrue|))))
          #17# (EXIT #1#)))) 

(SDEFUN |GALFACT;completeFactor!1| ((|x| NIL) ($$ NIL))
        (PROG (|degf| $)
          (LETT |degf| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |degf| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;completeFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|degg| $)
          (LETT |degg| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |degg| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;divideSet|
        ((|s| |Set| (|NonNegativeInteger|)) (|n| |NonNegativeInteger|)
         ($ |Set| (|NonNegativeInteger|)))
        (SPROG
         ((|l| (|List| (|NonNegativeInteger|)))
          (|ee| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G360 NIL)
          (|e| NIL))
         (SEQ (LETT |l| (LIST 0))
              (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |s| (QREFELT $ 131)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ee| (SPADCALL |e| |n| (QREFELT $ 132)))
                        (EXIT
                         (COND
                          ((QEQCAR |ee| 0)
                           (LETT |l| (CONS (QCDR |ee|) |l|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT $ 49)))))) 

(SDEFUN |GALFACT;btwFactor|
        ((|f| UP) (|d| |Set| (|NonNegativeInteger|)) (|r| |NonNegativeInteger|)
         (|pdecomp| |Boolean|) ($ . #1=(|List| UP)))
        (SPROG
         ((#2=#:G398 NIL) (|i| NIL) (|lf| #3=(|List| UP)) (#4=#:G397 NIL)
          (|fact| NIL) (#5=#:G396 NIL) (#6=#:G384 NIL) (|lfg| #1#)
          (#7=#:G383 NIL) (|df| #8=(|NonNegativeInteger|)) (#9=#:G381 NIL)
          (|dgh| (|NonNegativeInteger|)) (|dg| #8#) (|g| (UP)) (#10=#:G395 NIL)
          (|lg| #1#) (|dh| #8#)
          (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|pk| (|PositiveInteger|)) (#11=#:G376 NIL)
          (|lm| (|Record| (|:| |plist| #3#) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#12=#:G374 NIL) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#13=#:G394 NIL) (|cprime| #14=(|Integer|))
          (|m| (|Record| (|:| |prime| #14#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|negativelc?| #15=(|Boolean|)) (|reverse?| #15#))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT $ 39)))
                (COND
                 ((NULL (EQL (SPADCALL |d| (QREFELT $ 133)) |df|))
                  (EXIT (|error| "btwFact: Bad arguments"))))
                (LETT |reverse?| NIL) (LETT |negativelc?| NIL)
                (EXIT
                 (COND
                  ((SPADCALL |d| (SPADCALL (LIST 0 |df|) (QREFELT $ 49))
                             (QREFELT $ 84))
                   (LIST |f|))
                  (#16='T
                   (SEQ
                    (COND
                     ((< (ABS (SPADCALL |f| 0 (QREFELT $ 113)))
                         (ABS (SPADCALL |f| (QREFELT $ 28))))
                      (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 135)))
                           (EXIT (LETT |reverse?| 'T)))))
                    (COND
                     ((SPADCALL |f| (QREFELT $ 101))
                      (EXIT
                       (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 135))))
                             (#16# (LIST |f|)))))
                     ((QREFELT $ 11)
                      (COND
                       ((SPADCALL |f| (QREFELT $ 37))
                        (EXIT
                         (COND
                          (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 135))))
                          (#16# (LIST |f|))))))))
                    (COND
                     ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                      (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 136)))
                           (EXIT (LETT |negativelc?| 'T)))))
                    (COND
                     (|pdecomp|
                      (COND
                       ((QREFELT $ 10)
                        (LETT |cf| (SPADCALL |f| (QREFELT $ 105))))
                       (#16# (LETT |cf| (CONS 1 #17="failed")))))
                     (#16# (LETT |cf| (CONS 1 #17#))))
                    (COND
                     ((QEQCAR |cf| 1)
                      (SEQ (LETT |m| (SPADCALL |f| |d| (QREFELT $ 88)))
                           (EXIT
                            (COND
                             ((ZEROP (LETT |cprime| (QCAR |m|)))
                              (COND
                               (|reverse?|
                                (COND
                                 (|negativelc?|
                                  (PROGN
                                   (LETT #13#
                                         (LIST
                                          (SPADCALL
                                           (SPADCALL |f| (QREFELT $ 135))
                                           (QREFELT $ 136))))
                                   (GO #18=#:G393)))
                                 (#16#
                                  (PROGN
                                   (LETT #13#
                                         (LIST (SPADCALL |f| (QREFELT $ 135))))
                                   (GO #18#)))))
                               (|negativelc?|
                                (PROGN
                                 (LETT #13#
                                       (LIST (SPADCALL |f| (QREFELT $ 136))))
                                 (GO #18#)))
                               (#16#
                                (PROGN (LETT #13# (LIST |f|)) (GO #18#)))))
                             (#16#
                              (SEQ
                               (COND
                                ((SPADCALL |f| (QREFELT $ 137))
                                 (LETT |d| (SPADCALL 1 |d| (QREFELT $ 138)))))
                               (LETT |lc| (SPADCALL |f| (QREFELT $ 28)))
                               (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 113)))
                               (LETT |b|
                                     (PROG1
                                         (LETT #12#
                                               (*
                                                (SPADCALL 2 |lc|
                                                          (QREFELT $ 106))
                                                (SPADCALL |f| |r|
                                                          (QREFELT $ 127))))
                                       (|check_subtype2| (> #12# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #12#)))
                               (LETT |lm|
                                     (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                               (QREFELT $ 130)))
                               (LETT |lf| (QCAR |lm|))
                               (LETT |pk|
                                     (PROG1 (LETT #11# (QCDR |lm|))
                                       (|check_subtype2| (> #11# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #11#)))
                               (COND
                                ((SPADCALL (|SPADfirst| |lf|) (QREFELT $ 139))
                                 (LETT |lf| (CDR |lf|))))
                               (EXIT
                                (COND
                                 ((NULL (< |pk| |b|))
                                  (LETT |lf|
                                        (|GALFACT;completeFactor| |f| |lf|
                                         |cprime| |pk| |r| |d| $)))))))))))
                     (#16#
                      (SEQ (LETT |lrf| (QCDR |cf|))
                           (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT $ 39)))
                           (LETT |lg|
                                 (|GALFACT;btwFactor| (QCAR |lrf|)
                                  (|GALFACT;divideSet| |d| |dh| $) 2 'T $))
                           (LETT |lf| NIL)
                           (EXIT
                            (SEQ (LETT |i| 1) (LETT #10# (LENGTH |lg|)) G190
                                 (COND ((|greater_SI| |i| #10#) (GO G191)))
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |lg| |i| (QREFELT $ 115)))
                                  (LETT |dg| (SPADCALL |g| (QREFELT $ 39)))
                                  (LETT |dgh| (* |dg| |dh|))
                                  (LETT |df|
                                        (PROG2
                                            (LETT #9#
                                                  (SPADCALL |df| |dgh|
                                                            (QREFELT $ 140)))
                                            (QCDR #9#)
                                          (|check_union2| (QEQCAR #9# 0)
                                                          (|NonNegativeInteger|)
                                                          (|Union|
                                                           (|NonNegativeInteger|)
                                                           "failed")
                                                          #9#)))
                                  (LETT |lfg|
                                        (|GALFACT;btwFactor|
                                         (SPADCALL |g| (QCDR |lrf|)
                                                   (QREFELT $ 111))
                                         (|GALFACT;sel_set| |d| |dg| |dh| $)
                                         (PROG1 (LETT #7# (MAX 2 (- |r| |df|)))
                                           (|check_subtype2| (>= #7# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #7#))
                                         NIL $))
                                  (LETT |lf|
                                        (SPADCALL |lf| |lfg| (QREFELT $ 112)))
                                  (EXIT
                                   (LETT |r|
                                         (PROG1
                                             (LETT #6#
                                                   (MAX 2
                                                        (- |r|
                                                           (LENGTH |lfg|))))
                                           (|check_subtype2| (>= #6# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #6#)))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))))))
                    (COND
                     (|reverse?|
                      (LETT |lf|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT |fact| NIL) (LETT #4# |lf|) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |fact| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS
                                           (SPADCALL |fact| (QREFELT $ 135))
                                           #5#))))
                                  (LETT #4# (CDR #4#)) (GO G190) G191
                                  (EXIT (NREVERSE #5#)))))))
                    (SEQ (LETT |i| 1) (LETT #2# (LENGTH |lf|)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((<
                              (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 115))
                                        (QREFELT $ 28))
                              0)
                             (SPADCALL |lf| |i|
                                       (SPADCALL
                                        (SPADCALL |lf| |i| (QREFELT $ 115))
                                        (QREFELT $ 136))
                                       (QREFELT $ 141))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |lf|)))))))
          #18# (EXIT #13#)))) 

(SDEFUN |GALFACT;makeFR;RF;30|
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
          (#1=#:G415 NIL) (|fc| NIL) (#2=#:G414 NIL) (|ff| NIL)
          (|ctp| (|Factored| (|Integer|))))
         (SEQ (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT $ 31)))
              (LETT |fflist| NIL)
              (SEQ (LETT |ff| NIL) (LETT #2# (QCDR |flist|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ff| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |fflist|
                           (CONS
                            (VECTOR (CONS 3 "prime") (QCAR |ff|) (QCDR |ff|))
                            |fflist|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |fc| NIL) (LETT #1# (SPADCALL |ctp| (QREFELT $ 36)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fc| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |fflist|
                           (CONS
                            (VECTOR (QVELT |fc| 0)
                                    (SPADCALL (QVELT |fc| 1) (QREFELT $ 63))
                                    (QVELT |fc| 2))
                            |fflist|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ctp| (QREFELT $ 142)) (QREFELT $ 63))
                |fflist| (QREFELT $ 146)))))) 

(SDEFUN |GALFACT;quadratic| ((|p| UP) ($ |List| UP))
        (SPROG
         ((#1=#:G421 NIL) (|f| (UP)) (|b| (|Integer|)) (|a| (|Integer|))
          (|d| (|Integer|)) (|r| (|Union| (|Integer|) "failed")))
         (SEQ (LETT |a| (SPADCALL |p| (QREFELT $ 28)))
              (LETT |b| (SPADCALL |p| 1 (QREFELT $ 113)))
              (LETT |d|
                    (- (SPADCALL |b| 2 (QREFELT $ 150))
                       (* (SPADCALL 4 |a| (QREFELT $ 106))
                          (SPADCALL |p| 0 (QREFELT $ 113)))))
              (LETT |r| (SPADCALL |d| (QREFELT $ 153)))
              (EXIT
               (COND ((QEQCAR |r| 1) (LIST |p|))
                     ('T
                      (SEQ (LETT |b| (+ |b| (QCDR |r|)))
                           (LETT |a| (SPADCALL 2 |a| (QREFELT $ 106)))
                           (LETT |d| (GCD |a| |b|))
                           (COND
                            ((NULL (EQL |d| 1))
                             (SEQ (LETT |a| (QUOTIENT2 |a| |d|))
                                  (EXIT (LETT |b| (QUOTIENT2 |b| |d|))))))
                           (LETT |f|
                                 (SPADCALL (SPADCALL |a| 1 (QREFELT $ 154))
                                           (SPADCALL |b| 0 (QREFELT $ 154))
                                           (QREFELT $ 155)))
                           (EXIT
                            (CONS |f|
                                  (LIST
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL |p| |f|
                                                       (QREFELT $ 123)))
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
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
                 (SEQ (LETT |qr| (DIVIDE2 |n| 2))
                      (EXIT
                       (COND ((EQL (QCDR |qr|) 1) NIL)
                             (#1# (|GALFACT;isPowerOf2| (QCAR |qr|) $)))))))))) 

(SDEFUN |GALFACT;subMinusX|
        ((|supPol| |SparseUnivariatePolynomial| (|Integer|)) ($ UP))
        (SPROG ((|minusX| (|SparseUnivariatePolynomial| (|Integer|))))
               (SEQ (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 156)))
                    (EXIT
                     (SPADCALL (SPADCALL |supPol| |minusX| (QREFELT $ 157))
                               (QREFELT $ 62)))))) 

(SDEFUN |GALFACT;henselFact;UPBR;34|
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
          (#1=#:G472 NIL) (|pf| NIL) (#2=#:G471 NIL) (#3=#:G470 NIL)
          (#4=#:G469 NIL) (|d| (|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #5=(|NonNegativeInteger|)) (#6=#:G468 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP) (|:| |exponent| #5#))))
          (#7=#:G467 NIL) (#8=#:G466 NIL) (|fac| (UP)) (#9=#:G465 NIL)
          (|sfac| NIL) (#10=#:G464 NIL) (|lcPol| (UP)) (|c| (|Integer|))
          (#11=#:G434 NIL))
         (SEQ (LETT |factorlist| NIL) (LETT |c| (SPADCALL |f| (QREFELT $ 26)))
              (LETT |f|
                    (PROG2 (LETT #11# (SPADCALL |f| |c| (QREFELT $ 158)))
                        (QCDR #11#)
                      (|check_union2| (QEQCAR #11# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) "failed") #11#)))
              (COND
               ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                (SEQ (LETT |c| (- |c|))
                     (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 136)))))))
              (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 159)))
                   (EXIT
                    (COND
                     ((SPADCALL |d| 0 (QREFELT $ 78))
                      (SEQ
                       (LETT |f|
                             (QCAR
                              (SPADCALL |f| (SPADCALL 1 |d| (QREFELT $ 154))
                                        (QREFELT $ 161))))
                       (EXIT
                        (LETT |factorlist|
                              (LIST
                               (CONS (SPADCALL 1 1 (QREFELT $ 154))
                                     |d|)))))))))
              (LETT |d| (SPADCALL |f| (QREFELT $ 39)))
              (EXIT
               (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                     ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                     (#12='T
                      (SEQ
                       (LETT |lcPol|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                       (QREFELT $ 63)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 136))
                                    (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 162))
                          (SEQ
                           (SEQ (LETT |fac| NIL)
                                (LETT #10#
                                      (SPADCALL (ELT $ 62)
                                                (SPADCALL |d| (QREFELT $ 165))
                                                (QREFELT $ 168)))
                                G190
                                (COND
                                 ((OR (ATOM #10#)
                                      (PROGN (LETT |fac| (CAR #10#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |factorlist|
                                        (CONS (CONS |fac| 1) |factorlist|))))
                                (LETT #10# (CDR #10#)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))
                         (#12#
                          (SEQ
                           (COND
                            ((ODDP |d|)
                             (COND
                              ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 162))
                               (EXIT
                                (SEQ
                                 (SEQ (LETT |sfac| NIL)
                                      (LETT #9# (SPADCALL |d| (QREFELT $ 165)))
                                      G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |sfac| (CAR #9#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |fac|
                                             (|GALFACT;subMinusX| |sfac| $))
                                       (COND
                                        ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                         (LETT |fac|
                                               (SPADCALL |fac|
                                                         (QREFELT $ 136)))))
                                       (EXIT
                                        (LETT |factorlist|
                                              (CONS (CONS |fac| 1)
                                                    |factorlist|))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (COND
                            ((|GALFACT;isPowerOf2| |d| $)
                             (COND
                              ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 162))
                               (EXIT
                                (SEQ
                                 (LETT |factorlist|
                                       (CONS (CONS |f| 1) |factorlist|))
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (EXIT
                            (COND
                             (|sqf|
                              (CONS |c|
                                    (SPADCALL
                                     (PROGN
                                      (LETT #8# NIL)
                                      (SEQ (LETT |pf| NIL)
                                           (LETT #7#
                                                 (|GALFACT;henselfact1| |f| 'T
                                                  $))
                                           G190
                                           (COND
                                            ((OR (ATOM #7#)
                                                 (PROGN
                                                  (LETT |pf| (CAR #7#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #8#
                                                   (CONS (CONS |pf| 1) #8#))))
                                           (LETT #7# (CDR #7#)) (GO G190) G191
                                           (EXIT (NREVERSE #8#))))
                                     |factorlist| (QREFELT $ 170))))
                             (#12#
                              (SEQ
                               (LETT |sqfflist|
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 171))
                                               (QREFELT $ 172)))
                               (SEQ (LETT |sqfr| NIL) (LETT #6# |sqfflist|)
                                    G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN (LETT |sqfr| (CAR #6#)) NIL))
                                      (GO G191)))
                                    (SEQ (LETT |mult| (QVELT |sqfr| 2))
                                         (LETT |sqff| (QVELT |sqfr| 1))
                                         (LETT |d|
                                               (SPADCALL |sqff|
                                                         (QREFELT $ 39)))
                                         (EXIT
                                          (COND
                                           ((EQL |d| 1)
                                            (LETT |factorlist|
                                                  (CONS (CONS |sqff| |mult|)
                                                        |factorlist|)))
                                           ((EQL |d| 2)
                                            (LETT |factorlist|
                                                  (SPADCALL
                                                   (PROGN
                                                    (LETT #4# NIL)
                                                    (SEQ (LETT |pf| NIL)
                                                         (LETT #3#
                                                               (|GALFACT;quadratic|
                                                                |sqff| $))
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #3#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR
                                                                       #3#))
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #4#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |mult|)
                                                                  #4#))))
                                                         (LETT #3# (CDR #3#))
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #4#))))
                                                   |factorlist|
                                                   (QREFELT $ 170))))
                                           ('T
                                            (LETT |factorlist|
                                                  (SPADCALL
                                                   (PROGN
                                                    (LETT #2# NIL)
                                                    (SEQ (LETT |pf| NIL)
                                                         (LETT #1#
                                                               (|GALFACT;henselfact1|
                                                                |sqff| 'T $))
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #1#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR
                                                                       #1#))
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #2#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |mult|)
                                                                  #2#))))
                                                         (LETT #1# (CDR #1#))
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #2#))))
                                                   |factorlist|
                                                   (QREFELT $ 170)))))))
                                    (LETT #6# (CDR #6#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS |c| |factorlist|))))))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;35|
        ((|f| UP) (|sqf| |Boolean|) (|fd| |Set| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|)
         ($ |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List|
                (|Record| (|:| |irr| UP)
                          (|:| |pow| (|NonNegativeInteger|)))))))
        (SPROG
         ((|maxd| (|NonNegativeInteger|)) (#1=#:G513 NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#2=#:G531 NIL) (|pf| NIL) (#3=#:G530 NIL) (#4=#:G508 NIL)
          (#5=#:G529 NIL) (#6=#:G528 NIL) (#7=#:G504 NIL)
          (|d| (|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #8=(|NonNegativeInteger|)) (#9=#:G527 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP) (|:| |exponent| #8#))))
          (#10=#:G526 NIL) (#11=#:G525 NIL) (|fac| (UP)) (#12=#:G524 NIL)
          (|sfac| NIL) (#13=#:G523 NIL) (|lcPol| (UP)) (#14=#:G484 NIL)
          (#15=#:G482 NIL) (|c| (|Integer|)) (#16=#:G477 NIL))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 39)))
              (COND
               ((NULL (EQL (SPADCALL |fd| (QREFELT $ 133)) |d|))
                (EXIT (|error| "btwFact: Bad arguments"))))
              (LETT |factorlist| NIL) (LETT |c| (SPADCALL |f| (QREFELT $ 26)))
              (LETT |f|
                    (PROG2 (LETT #16# (SPADCALL |f| |c| (QREFELT $ 158)))
                        (QCDR #16#)
                      (|check_union2| (QEQCAR #16# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) "failed") #16#)))
              (COND
               ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                (SEQ (LETT |c| (- |c|))
                     (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 136)))))))
              (SEQ (LETT |maxd| (SPADCALL |f| (QREFELT $ 159)))
                   (EXIT
                    (COND
                     ((SPADCALL |maxd| 0 (QREFELT $ 78))
                      (SEQ
                       (LETT |f|
                             (QCAR
                              (SPADCALL |f| (SPADCALL 1 |maxd| (QREFELT $ 154))
                                        (QREFELT $ 161))))
                       (LETT |factorlist|
                             (LIST
                              (CONS (SPADCALL 1 1 (QREFELT $ 154)) |maxd|)))
                       (LETT |r|
                             (PROG1 (LETT #15# (MAX 2 (- |r| |maxd|)))
                               (|check_subtype2| (>= #15# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #15#)))
                       (LETT |d|
                             (PROG2
                                 (LETT #14#
                                       (SPADCALL |d| |maxd| (QREFELT $ 140)))
                                 (QCDR #14#)
                               (|check_union2| (QEQCAR #14# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #14#)))
                       (EXIT
                        (LETT |fd|
                              (SPADCALL
                               (CONS #'|GALFACT;btwFact;UPBSNniR;35!0|
                                     (VECTOR $ |d|))
                               |fd| (QREFELT $ 99)))))))))
              (EXIT
               (COND ((ZEROP |d|) (CONS |c| |factorlist|))
                     ((EQL |d| 1) (CONS |c| (CONS (CONS |f| 1) |factorlist|)))
                     (#17='T
                      (SEQ
                       (LETT |lcPol|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                       (QREFELT $ 63)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 136))
                                    (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 162))
                          (SEQ
                           (SEQ (LETT |fac| NIL)
                                (LETT #13#
                                      (SPADCALL (ELT $ 62)
                                                (SPADCALL |d| (QREFELT $ 165))
                                                (QREFELT $ 168)))
                                G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN (LETT |fac| (CAR #13#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |factorlist|
                                        (CONS (CONS |fac| 1) |factorlist|))))
                                (LETT #13# (CDR #13#)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))
                         (#17#
                          (SEQ
                           (COND
                            ((ODDP |d|)
                             (COND
                              ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 162))
                               (EXIT
                                (SEQ
                                 (SEQ (LETT |sfac| NIL)
                                      (LETT #12#
                                            (SPADCALL |d| (QREFELT $ 165)))
                                      G190
                                      (COND
                                       ((OR (ATOM #12#)
                                            (PROGN
                                             (LETT |sfac| (CAR #12#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |fac|
                                             (|GALFACT;subMinusX| |sfac| $))
                                       (COND
                                        ((< (SPADCALL |fac| (QREFELT $ 28)) 0)
                                         (LETT |fac|
                                               (SPADCALL |fac|
                                                         (QREFELT $ 136)))))
                                       (EXIT
                                        (LETT |factorlist|
                                              (CONS (CONS |fac| 1)
                                                    |factorlist|))))
                                      (LETT #12# (CDR #12#)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (COND
                            ((|GALFACT;isPowerOf2| |d| $)
                             (COND
                              ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                         (QREFELT $ 162))
                               (EXIT
                                (SEQ
                                 (LETT |factorlist|
                                       (CONS (CONS |f| 1) |factorlist|))
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (EXIT
                            (COND
                             (|sqf|
                              (CONS |c|
                                    (SPADCALL
                                     (PROGN
                                      (LETT #11# NIL)
                                      (SEQ (LETT |pf| NIL)
                                           (LETT #10#
                                                 (|GALFACT;btwFactor| |f| |fd|
                                                  |r| 'T $))
                                           G190
                                           (COND
                                            ((OR (ATOM #10#)
                                                 (PROGN
                                                  (LETT |pf| (CAR #10#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #11#
                                                   (CONS (CONS |pf| 1) #11#))))
                                           (LETT #10# (CDR #10#)) (GO G190)
                                           G191 (EXIT (NREVERSE #11#))))
                                     |factorlist| (QREFELT $ 170))))
                             (#17#
                              (SEQ
                               (LETT |sqfflist|
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 171))
                                               (QREFELT $ 172)))
                               (COND
                                ((EQL (LENGTH |sqfflist|) 1)
                                 (LETT |r|
                                       (MAX
                                        (QUOTIENT2 |r|
                                                   (QVELT
                                                    (|SPADfirst| |sqfflist|)
                                                    2))
                                        2)))
                                (#17# (LETT |r| 2)))
                               (SEQ (LETT |sqfr| NIL) (LETT #9# |sqfflist|)
                                    G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN (LETT |sqfr| (CAR #9#)) NIL))
                                      (GO G191)))
                                    (SEQ (LETT |mult| (QVELT |sqfr| 2))
                                         (LETT |sqff| (QVELT |sqfr| 1))
                                         (LETT |d|
                                               (SPADCALL |sqff|
                                                         (QREFELT $ 39)))
                                         (EXIT
                                          (COND
                                           ((EQL |d| 1)
                                            (SEQ
                                             (LETT |factorlist|
                                                   (CONS (CONS |sqff| |mult|)
                                                         |factorlist|))
                                             (LETT |maxd|
                                                   (PROG1
                                                       (LETT #7#
                                                             (-
                                                              (SPADCALL |fd|
                                                                        (QREFELT
                                                                         $
                                                                         133))
                                                              |mult|))
                                                     (|check_subtype2|
                                                      (>= #7# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #7#)))
                                             (EXIT
                                              (LETT |fd|
                                                    (SPADCALL
                                                     (CONS
                                                      #'|GALFACT;btwFact;UPBSNniR;35!1|
                                                      (VECTOR $ |maxd|))
                                                     |fd| (QREFELT $ 99))))))
                                           ((EQL |d| 2)
                                            (SEQ
                                             (LETT |factorlist|
                                                   (SPADCALL
                                                    (PROGN
                                                     (LETT #6# NIL)
                                                     (SEQ (LETT |pf| NIL)
                                                          (LETT #5#
                                                                (|GALFACT;quadratic|
                                                                 |sqff| $))
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #5#)
                                                                (PROGN
                                                                 (LETT |pf|
                                                                       (CAR
                                                                        #5#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #6#
                                                                  (CONS
                                                                   (CONS |pf|
                                                                         |mult|)
                                                                   #6#))))
                                                          (LETT #5# (CDR #5#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #6#))))
                                                    |factorlist|
                                                    (QREFELT $ 170)))
                                             (LETT |maxd|
                                                   (PROG1
                                                       (LETT #4#
                                                             (-
                                                              (SPADCALL |fd|
                                                                        (QREFELT
                                                                         $
                                                                         133))
                                                              (SPADCALL 2
                                                                        |mult|
                                                                        (QREFELT
                                                                         $
                                                                         174))))
                                                     (|check_subtype2|
                                                      (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#)))
                                             (EXIT
                                              (LETT |fd|
                                                    (SPADCALL
                                                     (CONS
                                                      #'|GALFACT;btwFact;UPBSNniR;35!2|
                                                      (VECTOR $ |maxd|))
                                                     |fd| (QREFELT $ 99))))))
                                           ('T
                                            (SEQ
                                             (LETT |factorlist|
                                                   (SPADCALL
                                                    (PROGN
                                                     (LETT #3# NIL)
                                                     (SEQ (LETT |pf| NIL)
                                                          (LETT #2#
                                                                (|GALFACT;btwFactor|
                                                                 |sqff|
                                                                 (SPADCALL
                                                                  (CONS
                                                                   #'|GALFACT;btwFact;UPBSNniR;35!3|
                                                                   (VECTOR $
                                                                           |d|))
                                                                  |fd|
                                                                  (QREFELT $
                                                                           99))
                                                                 |r| 'T $))
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #2#)
                                                                (PROGN
                                                                 (LETT |pf|
                                                                       (CAR
                                                                        #2#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #3#
                                                                  (CONS
                                                                   (CONS |pf|
                                                                         |mult|)
                                                                   #3#))))
                                                          (LETT #2# (CDR #2#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #3#))))
                                                    |factorlist|
                                                    (QREFELT $ 170)))
                                             (LETT |maxd|
                                                   (PROG1
                                                       (LETT #1#
                                                             (-
                                                              (SPADCALL |fd|
                                                                        (QREFELT
                                                                         $
                                                                         133))
                                                              (* |d| |mult|)))
                                                     (|check_subtype2|
                                                      (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#)))
                                             (EXIT
                                              (LETT |fd|
                                                    (SPADCALL
                                                     (CONS
                                                      #'|GALFACT;btwFact;UPBSNniR;35!4|
                                                      (VECTOR $ |maxd|))
                                                     |fd|
                                                     (QREFELT $ 99)))))))))
                                    (LETT #9# (CDR #9#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS |c| |factorlist|))))))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;35!4| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;35!3| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;35!2| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;35!1| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;35!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 94)))))) 

(SDEFUN |GALFACT;factor;UPF;36| ((|f| UP) ($ |Factored| UP))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| NIL
                     (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $) 2
                     (QREFELT $ 175)))
          ('T (SPADCALL |f| NIL (QREFELT $ 173))))
         (QREFELT $ 149))) 

(SDEFUN |GALFACT;errorsum?|
        ((|d| |NonNegativeInteger|) (|ld| |List| #1=(|NonNegativeInteger|))
         ($ |Boolean|))
        (SPROG
         ((#2=#:G535 NIL) (#3=#:G534 #1#) (#4=#:G536 #1#) (#5=#:G539 NIL)
          (#6=#:G104 NIL))
         (SEQ
          (NULL
           (EQL |d|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT #6# NIL) (LETT #5# |ld|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# #6#)
                         (COND (#2# (LETT #3# (+ #3# #4#)))
                               ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T 0)))))))) 

(SDEFUN |GALFACT;makeSet|
        ((|ld| |List| (|NonNegativeInteger|)) ($ |Set| (|NonNegativeInteger|)))
        (SPROG ((|s| (|Set| (|NonNegativeInteger|))) (#1=#:G543 NIL) (|d| NIL))
               (SEQ (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 49)))
                    (SEQ (LETT |d| NIL) (LETT #1# |ld|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |s|
                                 (SPADCALL |s| (|GALFACT;shiftSet| |s| |d| $)
                                           (QREFELT $ 82)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(SDEFUN |GALFACT;factor;UPLNniF;39|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 39)) |ld| $)
          (|error| "factor: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| NIL (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 175))
           (QREFELT $ 149))))) 

(SDEFUN |GALFACT;factor;UPNniF;40|
        ((|f| UP) (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (SPADCALL
         (SPADCALL |f| NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                   |r| (QREFELT $ 175))
         (QREFELT $ 149))) 

(SDEFUN |GALFACT;factor;UPLF;41|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|)) ($ |Factored| UP))
        (SPADCALL |f| |ld| 2 (QREFELT $ 177))) 

(SDEFUN |GALFACT;factor;UP2NniF;42|
        ((|f| UP) (|d| |NonNegativeInteger|) (|r| |NonNegativeInteger|)
         ($ |Factored| UP))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 39)) |d|
                                (QREFELT $ 132)))
                (EXIT
                 (COND ((QEQCAR |n| 1) (|error| "factor: Bad arguments"))
                       ('T
                        (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 180))
                                  |r| (QREFELT $ 177)))))))) 

(SDEFUN |GALFACT;factorSquareFree;UPF;43| ((|f| UP) ($ |Factored| UP))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                     2 (QREFELT $ 175)))
          ('T (SPADCALL |f| 'T (QREFELT $ 173))))
         (QREFELT $ 149))) 

(SDEFUN |GALFACT;factorSquareFree;UPLNniF;44|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 39)) |ld| $)
          (|error| "factorSquareFree: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| 'T (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 175))
           (QREFELT $ 149))))) 

(SDEFUN |GALFACT;factorSquareFree;UPNniF;45|
        ((|f| UP) (|r| |NonNegativeInteger|) ($ |Factored| UP))
        (SPADCALL
         (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                   |r| (QREFELT $ 175))
         (QREFELT $ 149))) 

(SDEFUN |GALFACT;factorSquareFree;UPLF;46|
        ((|f| UP) (|ld| |List| (|NonNegativeInteger|)) ($ |Factored| UP))
        (SPADCALL |f| |ld| 2 (QREFELT $ 183))) 

(SDEFUN |GALFACT;factorSquareFree;UP2NniF;47|
        ((|f| UP) (|d| |NonNegativeInteger|) (|r| |NonNegativeInteger|)
         ($ |Factored| UP))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 39)) |d|
                                (QREFELT $ 132)))
                (EXIT
                 (COND
                  ((QEQCAR |n| 1) (|error| "factorSquareFree: Bad arguments"))
                  ('T
                   (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 180)) |r|
                             (QREFELT $ 183)))))))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniBU;48|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) (|sqf| |Boolean|) ($ |Union| UP "failed"))
        (SPROG
         ((#1=#:G582 NIL) (#2=#:G583 NIL) (#3=#:G584 NIL) (|f| NIL)
          (|lf|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (|dp| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 39)))
                (EXIT
                 (COND
                  ((|GALFACT;errorsum?| |dp| |ld| $)
                   (|error| "factorOfDegree: Bad arguments"))
                  ('T
                   (SEQ
                    (COND
                     ((EQL |d| 1)
                      (COND
                       ((SPADCALL |p| (QREFELT $ 137))
                        (EXIT (CONS 1 "failed"))))))
                    (LETT |lf|
                          (QCDR
                           (SPADCALL |p| |sqf| (|GALFACT;makeSet| |ld| $) |r|
                                     (QREFELT $ 175))))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |f| NIL) (LETT #3# |lf|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (SPADCALL (QCAR |f|) (QREFELT $ 39)) |d|)
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (CONS 0 (QCAR |f|)))
                                       (GO #4=#:G581)))
                                (GO #5=#:G575))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #1#))
                    (EXIT (CONS 1 "failed"))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniU;49|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         (|r| |NonNegativeInteger|) ($ |Union| UP "failed"))
        (SPADCALL |d| |p| |ld| |r| NIL (QREFELT $ 188))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPNniU;50|
        ((|d| |PositiveInteger|) (|p| UP) (|r| |NonNegativeInteger|)
         ($ |Union| UP "failed"))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 39)) 1 (QREFELT $ 180))
                  |r| NIL (QREFELT $ 188))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLU;51|
        ((|d| |PositiveInteger|) (|p| UP) (|ld| |List| (|NonNegativeInteger|))
         ($ |Union| UP "failed"))
        (SPADCALL |d| |p| |ld| 2 NIL (QREFELT $ 188))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPU;52|
        ((|d| |PositiveInteger|) (|p| UP) ($ |Union| UP "failed"))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 39)) 1 (QREFELT $ 180)) 2
                  NIL (QREFELT $ 188))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizer;|)) 

(DEFUN |GaloisGroupFactorizer| (#1=#:G601)
  (SPROG NIL
         (PROG (#2=#:G602)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupFactorizer|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GaloisGroupFactorizer;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GaloisGroupFactorizer|)))))))))) 

(DEFUN |GaloisGroupFactorizer;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|GaloisGroupFactorizer| DV$1))
          (LETT $ (GETREFV 193))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|List| 40) |GALFACT;numberOfFactors;LNni;12| (40 . +)
              (|Mapping| 38 38) (|Set| 38) (46 . |map|) (52 . |One|)
              (|List| 38) (56 . |set|) (|SparseUnivariatePolynomial| 25)
              (61 . |makeSUP|) (|U32Vector|) (|U32VectorPolynomialOperations|)
              (66 . |to_mod_pa|) (72 . |gcd|) (79 . |degree|) (84 . <=)
              (|ModularDistinctDegreeFactorizer| 6) (90 . |gcd|) (97 . |Zero|)
              (101 . |pa_to_sup|) (106 . |unmakeSUP|) (111 . |coerce|)
              (116 . ~=) (122 . |invmod|) (|Void|) (128 . |mul_by_scalar|)
              (|Mapping| (|List| 52))
              (|Record| (|:| |poly| 52) (|:| |degree| 38)
                        (|:| |separate_factors| 68))
              (|List| 69) (|ModularFactorization|) (136 . |ddfact|)
              (142 . |ddFact|) (|List| 6) (148 . |separateFactors|)
              (154 . |empty|) (158 . |differentiate|) (163 . >) (169 . *)
              (|IntegerPrimesPackage| 25) (175 . |nextPrime|) (180 . |union|)
              (186 . |intersect|) (192 . =) (198 . |#|) (203 . >)
              (|Record| (|:| |prime| 25) (|:| |factors| 74))
              |GALFACT;modularFactor;UPSR;22| (|Multiset| 38) (209 . |empty|)
              (213 . |insert!|) (219 . |insert!|)
              |GALFACT;degreePartition;LM;23| (226 . <=) (232 . |rem|)
              (238 . |Zero|) (242 . =) (|Mapping| 12 38) (248 . |select|)
              (|BrillhartTests| 6) (254 . |brillhartIrreducible?|)
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 102 '"failed")
              (|UnivariatePolynomialDecompositionPackage| 25 6)
              (259 . |monicDecomposeIfCan|) (264 . *)
              (|GaloisGroupFactorizationUtilities| 25 6 (|Float|))
              (270 . |beauzamyBound|) (|GeneralHenselPackage| 25 6)
              (275 . |completeHensel|) (283 . |elt|) (289 . |append|)
              (295 . |coefficient|) (301 . |bit?|) (307 . |elt|)
              (313 . |symmetricRemainder|) (319 . |member?|)
              (|Union| $ '"failed") (325 . |exquo|) (331 . *)
              (337 . |reduction|) (343 . |primitivePart|) (348 . |exquo|)
              (354 . |swap!|) (361 . |rest|) (367 . |setrest!|)
              (373 . |singleFactorBound|) (379 . >)
              (|Record| (|:| |plist| 74) (|:| |modulo| 25))
              (385 . |HenselLift|) (393 . |parts|) (398 . |exquo|)
              (404 . |max|) (|GaloisGroupPolynomialUtilities| 25 6)
              (409 . |reverse|) (414 . -) (419 . |noLinearFactor?|)
              (424 . |remove|) (430 . |ground?|) (435 . |subtractIfCan|)
              (441 . |setelt!|) (448 . |unit|)
              (|Record| (|:| |flag| 32) (|:| |factor| 6) (|:| |exponent| 38))
              (|List| 143) (|Factored| 6) (453 . |makeFR|)
              (|Record| (|:| |irr| 6) (|:| |pow| 38))
              (|Record| (|:| |contp| 25) (|:| |factors| 169))
              |GALFACT;makeFR;RF;30| (459 . ^) (|Union| 25 '"failed")
              (|IntegerRoots| 25) (465 . |perfectSqrt|) (470 . |monomial|)
              (476 . +) (482 . |monomial|) (488 . |elt|) (494 . |exquo|)
              (500 . |minimumDegree|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (505 . |monicDivide|) (511 . =) (|List| 50)
              (|CyclotomicPolynomialPackage|) (517 . |cyclotomicDecomposition|)
              (|Mapping| 6 50) (|ListFunctions2| 50 6) (522 . |map|)
              (|List| 147) (528 . |append|) (534 . |squareFree|)
              (539 . |factorList|) |GALFACT;henselFact;UPBR;34| (544 . *)
              |GALFACT;btwFact;UPBSNniR;35| |GALFACT;factor;UPF;36|
              |GALFACT;factor;UPLNniF;39| |GALFACT;factor;UPNniF;40|
              |GALFACT;factor;UPLF;41| (550 . |new|)
              |GALFACT;factor;UP2NniF;42| |GALFACT;factorSquareFree;UPF;43|
              |GALFACT;factorSquareFree;UPLNniF;44|
              |GALFACT;factorSquareFree;UPNniF;45|
              |GALFACT;factorSquareFree;UPLF;46|
              |GALFACT;factorSquareFree;UP2NniF;47| (|Union| 6 '"failed")
              |GALFACT;factorOfDegree;PiUPLNniBU;48|
              |GALFACT;factorOfDegree;PiUPLNniU;49|
              |GALFACT;factorOfDegree;PiUPNniU;50|
              |GALFACT;factorOfDegree;PiUPLU;51|
              |GALFACT;factorOfDegree;PiUPU;52|)
           '#(|useSingleFactorBound?| 556 |useSingleFactorBound| 560
              |useEisensteinCriterion?| 565 |useEisensteinCriterion| 569
              |tryFunctionalDecomposition?| 574 |tryFunctionalDecomposition|
              578 |stopMusserTrials| 583 |numberOfFactors| 592 |musserTrials|
              597 |modularFactor| 606 |makeFR| 612 |henselFact| 617
              |factorSquareFree| 623 |factorOfDegree| 654 |factor| 691
              |eisensteinIrreducible?| 722 |degreePartition| 727 |btwFact| 732)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|makeFR|
                                 ((|Factored| |#1|)
                                  (|Record| (|:| |contp| (|Integer|))
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#1|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))))
                                T)
                              '((|degreePartition|
                                 ((|Multiset| (|NonNegativeInteger|))
                                  (|List|
                                   (|Record| (|:| |factor| |#1|)
                                             (|:| |degree| (|Integer|))))))
                                T)
                              '((|musserTrials| ((|PositiveInteger|))) T)
                              '((|musserTrials|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|stopMusserTrials| ((|PositiveInteger|))) T)
                              '((|stopMusserTrials|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|numberOfFactors|
                                 ((|NonNegativeInteger|)
                                  (|List|
                                   (|Record| (|:| |factor| |#1|)
                                             (|:| |degree| (|Integer|))))))
                                T)
                              '((|modularFactor|
                                 ((|Record| (|:| |prime| (|Integer|))
                                            (|:| |factors| (|List| |#1|)))
                                  |#1| (|Set| (|NonNegativeInteger|))))
                                T)
                              '((|useSingleFactorBound?| ((|Boolean|))) T)
                              '((|useSingleFactorBound|
                                 ((|Boolean|) (|Boolean|)))
                                T)
                              '((|useEisensteinCriterion?| ((|Boolean|))) T)
                              '((|useEisensteinCriterion|
                                 ((|Boolean|) (|Boolean|)))
                                T)
                              '((|eisensteinIrreducible?| ((|Boolean|) |#1|))
                                T)
                              '((|tryFunctionalDecomposition?| ((|Boolean|)))
                                T)
                              '((|tryFunctionalDecomposition|
                                 ((|Boolean|) (|Boolean|)))
                                T)
                              '((|factor| ((|Factored| |#1|) |#1|)) T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorSquareFree| ((|Factored| |#1|) |#1|))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1|))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|NonNegativeInteger|)))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|List| (|NonNegativeInteger|))))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|) (|Boolean|)))
                                T)
                              '((|henselFact|
                                 ((|Record| (|:| |contp| (|Integer|))
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#1|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))
                                  |#1| (|Boolean|)))
                                T)
                              '((|btwFact|
                                 ((|Record| (|:| |contp| (|Integer|))
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#1|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))
                                  |#1| (|Boolean|)
                                  (|Set| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 192
                                            '(1 6 0 0 24 1 6 25 0 26 1 25 12 0
                                              27 1 6 25 0 28 1 6 12 0 29 1 25
                                              30 0 31 1 35 34 0 36 1 6 38 0 39
                                              2 38 0 0 0 43 2 45 0 44 0 46 0 6
                                              0 47 1 45 0 48 49 1 6 50 0 51 2
                                              53 52 50 25 54 3 53 52 52 52 25
                                              55 1 53 25 52 56 2 25 12 0 0 57 3
                                              58 6 6 6 25 59 0 6 0 60 1 53 50
                                              52 61 1 6 0 50 62 1 6 0 25 63 2
                                              25 12 0 0 64 2 25 0 0 0 65 4 53
                                              66 52 25 25 25 67 2 71 70 52 25
                                              72 2 58 41 6 25 73 2 58 74 41 25
                                              75 0 45 0 76 1 6 0 0 77 2 38 12 0
                                              0 78 2 25 0 38 0 79 1 80 25 25 81
                                              2 45 0 0 0 82 2 45 0 0 0 83 2 45
                                              12 0 0 84 1 48 38 0 85 2 25 12 0
                                              0 86 0 89 0 90 2 89 0 38 0 91 3
                                              89 0 38 0 38 92 2 38 12 0 0 94 2
                                              38 0 0 0 95 0 38 0 96 2 38 12 0 0
                                              97 2 45 0 98 0 99 1 100 12 6 101
                                              1 104 103 6 105 2 25 0 19 0 106 1
                                              107 25 6 108 4 109 74 6 74 25 19
                                              110 2 6 0 0 0 111 2 74 0 0 0 112
                                              2 6 25 0 38 113 2 25 12 0 0 114 2
                                              74 6 0 25 115 2 25 0 0 0 116 2 45
                                              12 38 0 117 2 25 118 0 0 119 2 6
                                              0 0 0 120 2 109 6 6 25 121 1 6 0
                                              0 122 2 6 118 0 0 123 3 74 66 0
                                              25 25 124 2 74 0 0 38 125 2 74 0
                                              0 0 126 2 107 25 6 38 127 2 19 12
                                              0 0 128 4 109 129 6 74 25 19 130
                                              1 45 48 0 131 2 38 118 0 0 132 1
                                              45 38 0 133 1 134 6 6 135 1 6 0 0
                                              136 1 100 12 6 137 2 45 0 38 0
                                              138 1 6 12 0 139 2 38 118 0 0 140
                                              3 74 6 0 25 6 141 1 35 25 0 142 2
                                              145 0 6 144 146 2 25 0 0 19 150 1
                                              152 151 25 153 2 6 0 25 38 154 2
                                              6 0 0 0 155 2 50 0 25 38 156 2 50
                                              0 0 0 157 2 6 118 0 25 158 1 6 38
                                              0 159 2 6 160 0 0 161 2 6 12 0 0
                                              162 1 164 163 25 165 2 167 74 166
                                              163 168 2 169 0 0 0 170 1 6 30 0
                                              171 1 145 144 0 172 2 38 0 19 0
                                              174 2 48 0 38 38 180 0 0 12 17 1
                                              0 12 12 18 0 0 12 13 1 0 12 12 14
                                              0 0 12 15 1 0 12 12 16 1 0 19 19
                                              21 0 0 19 20 1 0 38 41 42 1 0 19
                                              19 23 0 0 19 22 2 0 87 6 45 88 1
                                              0 145 148 149 2 0 148 6 12 173 2
                                              0 145 6 38 184 1 0 145 6 182 3 0
                                              145 6 48 38 183 2 0 145 6 48 185
                                              3 0 145 6 38 38 186 2 0 187 19 6
                                              192 3 0 187 19 6 48 191 3 0 187
                                              19 6 38 190 5 0 187 19 6 48 38 12
                                              188 4 0 187 19 6 48 38 189 1 0
                                              145 6 176 2 0 145 6 48 179 2 0
                                              145 6 38 178 3 0 145 6 38 38 181
                                              3 0 145 6 48 38 177 1 0 12 6 37 1
                                              0 89 41 93 4 0 148 6 12 45 38
                                              175)))))
           '|lookupComplete|)) 
