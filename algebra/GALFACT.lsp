
(SDEFUN |GALFACT;useEisensteinCriterion?;B;1| (($ (|Boolean|))) (QREFELT $ 11)) 

(SDEFUN |GALFACT;useEisensteinCriterion;2B;2|
        ((|b| (|Boolean|)) ($ (|Boolean|)))
        (SPROG ((|#G5| (|Boolean|)) (|#G4| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G4| |b|)
                 (LETT |#G5| (QREFELT $ 11))
                 (SETELT $ 11 |#G4|)
                 (LETT |b| |#G5|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;tryFunctionalDecomposition?;B;3| (($ (|Boolean|)))
        (QREFELT $ 10)) 

(SDEFUN |GALFACT;tryFunctionalDecomposition;2B;4|
        ((|b| (|Boolean|)) ($ (|Boolean|)))
        (SPROG ((|#G8| (|Boolean|)) (|#G7| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G7| |b|)
                 (LETT |#G8| (QREFELT $ 10))
                 (SETELT $ 10 |#G7|)
                 (LETT |b| |#G8|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;useSingleFactorBound?;B;5| (($ (|Boolean|))) (QREFELT $ 9)) 

(SDEFUN |GALFACT;useSingleFactorBound;2B;6| ((|b| (|Boolean|)) ($ (|Boolean|)))
        (SPROG ((|#G11| (|Boolean|)) (|#G10| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G10| |b|)
                 (LETT |#G11| (QREFELT $ 9))
                 (SETELT $ 9 |#G10|)
                 (LETT |b| |#G11|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;stopMusserTrials;Pi;7| (($ (|PositiveInteger|))) (QREFELT $ 8)) 

(SDEFUN |GALFACT;stopMusserTrials;2Pi;8|
        ((|n| (|PositiveInteger|)) ($ (|PositiveInteger|)))
        (SPROG ((|#G14| (|PositiveInteger|)) (|#G13| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G13| |n|)
                 (LETT |#G14| (QREFELT $ 8))
                 (SETELT $ 8 |#G13|)
                 (LETT |n| |#G14|))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;musserTrials;Pi;9| (($ (|PositiveInteger|))) (QREFELT $ 7)) 

(SDEFUN |GALFACT;musserTrials;2Pi;10|
        ((|n| (|PositiveInteger|)) ($ (|PositiveInteger|)))
        (SPROG ((|#G17| (|PositiveInteger|)) (|#G16| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G16| |n|)
                 (LETT |#G17| (QREFELT $ 7))
                 (SETELT $ 7 |#G16|)
                 (LETT |n| |#G17|))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;eisensteinIrreducible?;UPB;11| ((|f| (UP)) ($ (|Boolean|)))
        (SPROG
         ((#1=#:G183 NIL) (#2=#:G184 NIL) (|p| NIL) (|rf| (UP))
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
                                           (GO #4=#:G182))))))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT NIL)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |GALFACT;numberOfFactors;LNni;12|
        ((|ddlist|
          (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
         ($ (|NonNegativeInteger|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G187 NIL) (|d| (|Integer|))
          (#2=#:G194 NIL) (|dd| NIL))
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
        ((|s| (|Set| (|NonNegativeInteger|))) (|shift| (|NonNegativeInteger|))
         ($ (|Set| (|NonNegativeInteger|))))
        (SPROG NIL
               (SPADCALL (CONS #'|GALFACT;shiftSet!0| (VECTOR $ |shift|)) |s|
                         (QREFELT $ 46)))) 

(SDEFUN |GALFACT;shiftSet!0| ((|e| NIL) ($$ NIL))
        (PROG (|shift| $)
          (LETT |shift| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |shift| (QREFELT $ 43)))))) 

(SDEFUN |GALFACT;reductum| ((|n| (|Integer|)) ($ (|Integer|)))
        (- |n| (ASH 1 (- (INTEGER-LENGTH |n|) 1)))) 

(SDEFUN |GALFACT;seed| ((|level| (|Integer|)) ($ (|Integer|)))
        (- (ASH 1 |level|) 1)) 

(SDEFUN |GALFACT;nextRecNum|
        ((|levels| (|NonNegativeInteger|)) (|level| (|Integer|))
         (|n| (|Integer|)) ($ (|Union| (|Integer|) "End of level")))
        (SPROG
         ((|b| (|Integer|)) (|lr| #1=(|Integer|)) (#2=#:G208 NIL) (|l| #1#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |l| (INTEGER-LENGTH |n|))
                 (EXIT
                  (COND
                   ((< |l| |levels|)
                    (PROGN
                     (LETT #2# (CONS 0 (+ |n| (ASH 1 (- |l| 1)))))
                     (GO #3=#:G207))))))
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
        ((|n| (|NonNegativeInteger|)) ($ (|Set| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G213 NIL) (|i| NIL) (#2=#:G212 NIL))
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
        ((|pol1| (UP)) (|pol2| (UP)) (|p| (|Integer|)) (|small| (|Boolean|))
         ($ (|Boolean|)))
        (SPROG
         ((|vg| (|PrimitiveArray| |pF|))
          (|mD| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
          (|v2| #1=(|PrimitiveArray| (|PrimeField| |pp|))) (|v1| #1#)
          (|pV|
           (CATEGORY |package|
            (SIGNATURE |degree|
             ((|Integer|) (|PrimitiveArray| (|PrimeField| |pp|))))
            (SIGNATURE |to_mod_pa|
             ((|PrimitiveArray| (|PrimeField| |pp|))
              (|SparseUnivariatePolynomial| (|Integer|))))
            (SIGNATURE |pa_to_sup|
             ((|SparseUnivariatePolynomial| (|Integer|))
              (|PrimitiveArray| (|PrimeField| |pp|))))))
          (|pF|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|))
                   (CATEGORY |domain| (SIGNATURE |sqrt| ($ $)))))
          (|pp| (|PositiveInteger|)) (#2=#:G215 NIL))
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
             (EXIT (<= (SPADCALL |vg| (QREFELT $ 56)) 0))))
           ('T
            (SEQ
             (LETT |pp|
                   (PROG1 (LETT #2# |p|)
                     (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                       '(|Integer|) #2#)))
             (LETT |pF| (|PrimeField| |pp|))
             (LETT |pV| (|VectorPolynomialOperationsP| |pp|))
             (LETT |v1|
                   (SPADCALL (SPADCALL |pol1| (QREFELT $ 51))
                             (|compiledLookupCheck| '|to_mod_pa|
                                                    (LIST
                                                     (LIST '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|))
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST '|Integer|)))
                                                    |pV|)))
             (LETT |v2|
                   (SPADCALL (SPADCALL |pol2| (QREFELT $ 51))
                             (|compiledLookupCheck| '|to_mod_pa|
                                                    (LIST
                                                     (LIST '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|))
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST '|Integer|)))
                                                    |pV|)))
             (LETT |mD| (CONS |p| 1))
             (LETT |vg|
                   (SPADCALL |v1| |v2| |mD|
                             (|compiledLookupCheck| '|gcd|
                                                    (LIST
                                                     (LIST '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                     (LIST '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                     (LIST '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                     (LIST '|Record|
                                                           (LIST '|:| '|i_mod|
                                                                 (LIST
                                                                  '|Integer|))
                                                           (LIST '|:| '|deg|
                                                                 (LIST
                                                                  '|Integer|))))
                                                    (|ModularFactorizationTools3|
                                                     |pF|))))
             (EXIT
              (<=
               (SPADCALL |vg|
                         (|compiledLookupCheck| '|degree|
                                                (LIST (LIST '|Integer|)
                                                      (LIST '|PrimitiveArray|
                                                            (LIST '|PrimeField|
                                                                  |pp|)))
                                                |pV|))
               0)))))))) 

(SDEFUN |GALFACT;add_degs|
        ((|deg1| (|NonNegativeInteger|)) (|deg2| (|NonNegativeInteger|))
         (|res| (|List| (|NonNegativeInteger|)))
         ($ (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G223 NIL) (|i| NIL))
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
        ((|sfl| (|List| (|Mapping| #1=(|List| (|U32Vector|)))))
         (|c| (|Integer|)) ($ (|List| UP)))
        (SPROG
         ((|res| (|List| UP)) (#2=#:G232 NIL) (|v| NIL) (|vl| #1#)
          (#3=#:G231 NIL) (|sf| NIL))
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
                                       (SPADCALL (SPADCALL |v| (QREFELT $ 58))
                                                 (QREFELT $ 59))
                                       |res|))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL |c| (QREFELT $ 60)) |res|))))) 

(SDEFUN |GALFACT;do_ddfact|
        ((|pol| (UP)) (|p| (|Integer|)) (|small| (|Boolean|))
         ($
          (|Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
                    (|:| |separate_factors| (|Mapping| (|List| UP))))))
        (SPROG
         ((|ssfl| (|List| (|Mapping| (|List| (|PrimitiveArray| |pF|)))))
          (|degs| (|List| (|NonNegativeInteger|))) (#1=#:G249 NIL)
          (#2=#:G257 NIL) (|ffr| NIL)
          (|uul1|
           (|List|
            (|Record| (|:| |poly| (|PrimitiveArray| |pF|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|PrimitiveArray| |pF|)))))))
          (|mD| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
          (|cki| (|pF|)) (|ci| (|Integer|)) (|c| (|Integer|))
          (|dpol| (|Integer|)) (|vv| (|PrimitiveArray| (|PrimeField| |pp|)))
          (|pV|
           (CATEGORY |package|
            (SIGNATURE |degree|
             ((|Integer|) (|PrimitiveArray| (|PrimeField| |pp|))))
            (SIGNATURE |to_mod_pa|
             ((|PrimitiveArray| (|PrimeField| |pp|))
              (|SparseUnivariatePolynomial| (|Integer|))))
            (SIGNATURE |pa_to_sup|
             ((|SparseUnivariatePolynomial| (|Integer|))
              (|PrimitiveArray| (|PrimeField| |pp|))))))
          (|pF|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| $)
                   (|ConvertibleTo| (|Integer|))
                   (CATEGORY |domain| (SIGNATURE |sqrt| ($ $)))))
          (|pp| (|PositiveInteger|)) (#3=#:G243 NIL)
          (|sfl| (|List| (|Mapping| (|List| (|U32Vector|))))) (#4=#:G238 NIL)
          (#5=#:G256 NIL) (|fr| NIL)
          (|ul1|
           (|List|
            (|Record| (|:| |poly| (|U32Vector|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|U32Vector|)))))))
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
                   ((SPADCALL |c| 1 (QREFELT $ 61))
                    (SEQ (LETT |ci| (SPADCALL |c| |p| (QREFELT $ 62)))
                         (EXIT
                          (SPADCALL |v| |dpol| |ci| |p| (QREFELT $ 64))))))
                  (LETT |ul1| (SPADCALL |v| |p| (QREFELT $ 69)))
                  (LETT |sfl| NIL)
                  (SEQ (LETT |fr| NIL) (LETT #5# |ul1|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |fr| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |degs|
                              (|GALFACT;add_degs|
                               (PROG1
                                   (LETT #4#
                                         (SPADCALL (QVELT |fr| 0)
                                                   (QREFELT $ 56)))
                                 (|check_subtype2| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #4#))
                               (QVELT |fr| 1) |degs| $))
                        (EXIT (LETT |sfl| (CONS (QVELT |fr| 2) |sfl|))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |degs|
                         (CONS #'|GALFACT;do_ddfact!0|
                               (VECTOR $ |c| |sfl|))))))
                ('T
                 (SEQ
                  (LETT |pp|
                        (PROG1 (LETT #3# |p|)
                          (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                            '(|Integer|) #3#)))
                  (LETT |pF| (|PrimeField| |pp|))
                  (LETT |pV| (|VectorPolynomialOperationsP| |pp|))
                  (LETT |vv|
                        (SPADCALL (SPADCALL |pol| (QREFELT $ 51))
                                  (|compiledLookupCheck| '|to_mod_pa|
                                                         (LIST
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|))
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (LIST '|Integer|)))
                                                         |pV|)))
                  (LETT |dpol|
                        (SPADCALL |vv|
                                  (|compiledLookupCheck| '|degree|
                                                         (LIST
                                                          (LIST '|Integer|)
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|)))
                                                         |pV|)))
                  (LETT |c|
                        (SPADCALL (QAREF1 |vv| |dpol|)
                                  (|compiledLookupCheck| '|convert|
                                                         (LIST
                                                          (LIST '|Integer|) '$)
                                                         |pF|)))
                  (COND
                   ((SPADCALL |c| 1 (QREFELT $ 61))
                    (SEQ (LETT |ci| (SPADCALL |c| |p| (QREFELT $ 62)))
                         (LETT |cki|
                               (SPADCALL |ci|
                                         (|compiledLookupCheck| '|coerce|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Integer|))
                                                                |pF|)))
                         (EXIT
                          (SPADCALL |vv| |dpol| |cki|
                                    (|compiledLookupCheck| '|mul_by_scalar|
                                                           (LIST (LIST '|Void|)
                                                                 (LIST
                                                                  '|PrimitiveArray|
                                                                  (|devaluate|
                                                                   |pF|))
                                                                 (LIST
                                                                  '|Integer|)
                                                                 (|devaluate|
                                                                  |pF|))
                                                           (|ModularFactorizationTools3|
                                                            |pF|)))))))
                  (LETT |mD| (CONS |p| 1))
                  (LETT |uul1|
                        (SPADCALL |vv| |mD|
                                  (|compiledLookupCheck| '|ddfact|
                                                         (LIST
                                                          (LIST '|List|
                                                                (LIST '|Record|
                                                                      (LIST
                                                                       '|:|
                                                                       '|poly|
                                                                       (LIST
                                                                        '|PrimitiveArray|
                                                                        (|devaluate|
                                                                         |pF|)))
                                                                      (LIST
                                                                       '|:|
                                                                       '|degree|
                                                                       (LIST
                                                                        '|NonNegativeInteger|))
                                                                      (LIST
                                                                       '|:|
                                                                       '|separate_factors|
                                                                       (LIST
                                                                        '|Mapping|
                                                                        (LIST
                                                                         '|List|
                                                                         (LIST
                                                                          '|PrimitiveArray|
                                                                          (|devaluate|
                                                                           |pF|)))))))
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|i_mod|
                                                                      (LIST
                                                                       '|Integer|))
                                                                (LIST '|:|
                                                                      '|deg|
                                                                      (LIST
                                                                       '|Integer|))))
                                                         (|ModularFactorizationK|
                                                          |pF|))))
                  (LETT |ssfl| NIL)
                  (SEQ (LETT |ffr| NIL) (LETT #2# |uul1|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |ffr| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |degs|
                              (|GALFACT;add_degs|
                               (PROG1
                                   (LETT #1#
                                         (SPADCALL (QVELT |ffr| 0)
                                                   (|compiledLookupCheck|
                                                    '|degree|
                                                    (LIST (LIST '|Integer|)
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|)))
                                                    |pV|)))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QVELT |ffr| 1) |degs| $))
                        (EXIT (LETT |ssfl| (CONS (QVELT |ffr| 2) |ssfl|))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |degs|
                         (CONS #'|GALFACT;do_ddfact!1|
                               (VECTOR |pp| $ |c| |ssfl|))))))))))) 

(SDEFUN |GALFACT;do_ddfact!1| (($$ NIL))
        (PROG (|ssfl| |c| $ |pp|)
          (LETT |ssfl| (QREFELT $$ 3))
          (LETT |c| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |pp| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |ssfl| |c|
                      (|compiledLookupCheck| '|separate_factors|
                                             (LIST
                                              (LIST '|List|
                                                    (|devaluate| (ELT $ 6)))
                                              (LIST '|List|
                                                    (LIST '|Mapping|
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|PrimitiveArray|
                                                                 (LIST
                                                                  '|PrimeField|
                                                                  |pp|)))))
                                              (LIST '|Integer|))
                                             (|GaloisGroupFactorizerSeparate|
                                              |pp| (ELT $ 6)))))))) 

(SDEFUN |GALFACT;do_ddfact!0| (($$ NIL))
        (PROG (|sfl| |c| $)
          (LETT |sfl| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GALFACT;do_separate| |sfl| |c| $))))) 

(SDEFUN |GALFACT;modularFactor;UPSR;22|
        ((|p| (UP)) (|d| (|Set| (|NonNegativeInteger|)))
         ($ (|Record| (|:| |prime| (|Integer|)) (|:| |factors| (|List| UP)))))
        (SPROG
         ((|fl| (|List| UP)) (|cprime| (|Integer|)) (|res_prime| (|Integer|))
          (|dd_res|
           #1=(|Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
                        (|:| |separate_factors| (|Mapping| (|List| UP)))))
          (|nf| (|NonNegativeInteger|)) (|nf1| (|NonNegativeInteger|))
          (#2=#:G277 NIL) (|s| (|Set| (|NonNegativeInteger|))) (#3=#:G279 NIL)
          (|ddlist| (|List| (|NonNegativeInteger|))) (|dd_res1| #1#)
          (|small| (|Boolean|)) (#4=#:G278 NIL) (|i| NIL) (|diffp| (UP))
          (|degp| #5=(|NonNegativeInteger|)) (|degfact| (|NonNegativeInteger|))
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
                    (LETT |s| (SPADCALL (QREFELT $ 70))) (LETT |ddlist| NIL)
                    (LETT |degfact| 0)
                    (LETT |degp| (SPADCALL |p| (QREFELT $ 39)))
                    (LETT |nf| (+ (+ |degp| (QREFELT $ 8)) 1))
                    (LETT |diffp| (SPADCALL |p| (QREFELT $ 71)))
                    (LETT |small| 'T)
                    (SEQ (LETT |i| 1) (LETT #4# (QREFELT $ 7)) G190
                         (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((> |nf| (QREFELT $ 8))
                             (SEQ
                              (COND
                               (|small|
                                (COND
                                 ((NULL
                                   (< (* (* |degp| |cprime|) |cprime|)
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
                                                     (QREFELT $ 73)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |dd_res1|
                                    (|GALFACT;do_ddfact| |p| |cprime| |small|
                                     $))
                              (LETT |ddlist| (QCAR |dd_res1|))
                              (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 49)))
                              (SEQ (LETT #3# |ddlist|) G190
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
                                                     (QREFELT $ 74)))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |d| (SPADCALL |d| |s| (QREFELT $ 75)))
                              (EXIT
                               (COND
                                ((SPADCALL |d| |dirred| (QREFELT $ 76))
                                 (PROGN
                                  (LETT #2# (CONS 0 (LIST |p|)))
                                  (GO #6=#:G276)))
                                ('T
                                 (SEQ
                                  (LETT |nf1|
                                        (SPADCALL |ddlist| (QREFELT $ 77)))
                                  (COND
                                   ((< |nf1| |nf|)
                                    (SEQ (LETT |nf| |nf1|)
                                         (LETT |dd_res| |dd_res1|)
                                         (EXIT (LETT |res_prime| |cprime|))))
                                   ((EQL |nf1| |nf|)
                                    (COND
                                     ((> |cprime| |res_prime|)
                                      (SEQ (LETT |nf| |nf1|)
                                           (LETT |dd_res| |dd_res1|)
                                           (EXIT
                                            (LETT |res_prime| |cprime|)))))))
                                  (EXIT
                                   (LETT |cprime|
                                         (SPADCALL |cprime|
                                                   (QREFELT $ 73)))))))))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |fl| (SPADCALL (QCDR |dd_res|)))
                    (EXIT (CONS |res_prime| |fl|))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |GALFACT;degreePartition;LM;23|
        ((|ddlist|
          (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
         ($ (|Multiset| (|NonNegativeInteger|))))
        (SPROG
         ((|dp| (|Multiset| (|NonNegativeInteger|)))
          (|dd| #1=(|NonNegativeInteger|)) (#2=#:G282 NIL) (|d| #1#)
          (#3=#:G288 NIL) (|f| NIL))
         (SEQ (LETT |dp| (SPADCALL (QREFELT $ 81))) (LETT |d| 0) (LETT |dd| 0)
              (SEQ (LETT |f| NIL) (LETT #3# |ddlist|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((ZEROP (LETT |d| (SPADCALL (QCAR |f|) (QREFELT $ 39))))
                       (LETT |dp| (SPADCALL 0 |dp| (QREFELT $ 82))))
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
                                         (QREFELT $ 83)))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |dp|)))) 

(SDEFUN |GALFACT;sel_set|
        ((|d| (|Set| (|NonNegativeInteger|))) (|n| (|NonNegativeInteger|))
         (|m| (|NonNegativeInteger|)) ($ (|Set| (|NonNegativeInteger|))))
        (SPROG ((|nm| (|NonNegativeInteger|)))
               (SEQ
                (COND ((EQL |n| 0) (SPADCALL (LIST 0) (QREFELT $ 49)))
                      ('T
                       (SEQ (LETT |nm| (* |n| |m|))
                            (EXIT
                             (SPADCALL
                              (CONS #'|GALFACT;sel_set!0| (VECTOR |n| $ |nm|))
                              |d| (QREFELT $ 90))))))))) 

(SDEFUN |GALFACT;sel_set!0| ((|x| NIL) ($$ NIL))
        (PROG (|nm| $ |n|)
          (LETT |nm| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |x| |nm| (QREFELT $ 85))
              (SPADCALL (SPADCALL |x| |n| (QREFELT $ 86)) (|spadConstant| $ 87)
                        (QREFELT $ 88)))
             ('T NIL)))))) 

(SDEFUN |GALFACT;henselfact|
        ((|f| (UP)) (|pdecomp| (|Boolean|))
         (|d| (|Set| (|NonNegativeInteger|))) ($ #1=(|List| UP)))
        (SPROG
         ((#2=#:G303 NIL) (#3=#:G302 #1#) (#4=#:G304 #1#) (#5=#:G309 NIL)
          (|g| NIL) (|d1| (|Set| (|NonNegativeInteger|)))
          (|dh| (|NonNegativeInteger|))
          (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|b| (|PositiveInteger|)) (#6=#:G299 NIL) (|cprime| #7=(|Integer|))
          (|m| (|Record| (|:| |prime| #7#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (#8=#:G308 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT $ 92))
              (PROGN (LETT #8# (LIST |f|)) (GO #9=#:G307)))
             ((QREFELT $ 11)
              (COND
               ((SPADCALL |f| (QREFELT $ 37))
                (PROGN (LETT #8# (LIST |f|)) (GO #9#))))))
            (COND
             (|pdecomp|
              (COND ((QREFELT $ 10) (LETT |cf| (SPADCALL |f| (QREFELT $ 96))))
                    (#10='T (LETT |cf| (CONS 1 #11="failed")))))
             (#10# (LETT |cf| (CONS 1 #11#))))
            (EXIT
             (COND
              ((QEQCAR |cf| 1)
               (SEQ (LETT |m| (SPADCALL |f| |d| (QREFELT $ 79)))
                    (EXIT
                     (COND ((ZEROP (LETT |cprime| (QCAR |m|))) (QCDR |m|))
                           (#10#
                            (SEQ
                             (LETT |b|
                                   (PROG1
                                       (LETT #6#
                                             (*
                                              (* 2
                                                 (SPADCALL |f| (QREFELT $ 28)))
                                              (SPADCALL |f| (QREFELT $ 98))))
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #6#)))
                             (EXIT
                              (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                        (QREFELT $ 101)))))))))
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
                                               (QREFELT $ 102))
                                     NIL
                                     (|GALFACT;sel_set| |d|
                                      (SPADCALL |g| (QREFELT $ 39)) |dh| $)
                                     $))
                              (COND
                               (#2#
                                (LETT #3# (SPADCALL #3# #4# (QREFELT $ 103))))
                               ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                           (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                      (COND (#2# #3#) (#10# NIL))))))))))
          #9# (EXIT #8#)))) 

(SDEFUN |GALFACT;henselfact1|
        ((|f| (UP)) (|pdecomp| (|Boolean|)) ($ (|List| UP)))
        (|GALFACT;henselfact| |f| |pdecomp|
         (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $) $)) 

(SDEFUN |GALFACT;completeFactor|
        ((|f| (UP)) (|lf| (|List| UP)) (|cprime| (|Integer|))
         (|pk| (|PositiveInteger|)) (|r| (|NonNegativeInteger|))
         (|d| (|Set| (|NonNegativeInteger|))) ($ (|List| UP)))
        (SPROG
         ((|level| (|Integer|)) (|found?| (|Boolean|))
          (|levels| (|NonNegativeInteger|))
          (|ic| (|Union| (|Integer|) "End of level")) (#1=#:G380 NIL)
          (#2=#:G366 NIL)
          (|llg|
           (|Record| (|:| |plist| (|List| UP)) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#3=#:G365 NIL) (|ltrue| #4=(|List| UP))
          (|degf| #5=(|NonNegativeInteger|)) (#6=#:G362 NIL) (|lg| #4#)
          (|gpk| (|PositiveInteger|)) (#7=#:G349 NIL) (#8=#:G346 NIL)
          (#9=#:G345 NIL) (|rg| #5#) (#10=#:G344 NIL)
          (|dg| (|Set| (|NonNegativeInteger|))) (|f0| (|Integer|))
          (|lc| (|Integer|)) (#11=#:G334 NIL) (#12=#:G332 NIL)
          (|nb| (|Integer|)) (#13=#:G383 NIL) (|j| NIL)
          (|f1| (|Union| UP "failed")) (|g| (UP)) (#14=#:G382 NIL)
          (|g0| (|Integer|)) (|degg| #5#) (#15=#:G381 NIL) (|i| (|Integer|))
          (#16=#:G200 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lc| (SPADCALL |f| (QREFELT $ 28)))
                (LETT |f0| (SPADCALL |f| 0 (QREFELT $ 104))) (LETT |ltrue| NIL)
                (LETT |found?| 'T) (LETT |degf| 0) (LETT |degg| 0)
                (LETT |g0| 0) (LETT |g| (|spadConstant| $ 57)) (LETT |rg| 0)
                (LETT |nb| 0) (LETT |lg| NIL) (LETT |b| 1)
                (LETT |dg| (SPADCALL (QREFELT $ 70))) (LETT |llg| (CONS NIL 0))
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
                                                   (QREFELT $ 105))
                                         (SEQ
                                          (LETT |degg|
                                                (+ |degg|
                                                   (SPADCALL
                                                    (SPADCALL |lf| |j|
                                                              (QREFELT $ 106))
                                                    (QREFELT $ 39))))
                                          (EXIT
                                           (LETT |g0|
                                                 (* |g0|
                                                    (SPADCALL
                                                     (SPADCALL |lf| |j|
                                                               (QREFELT $ 106))
                                                     0 (QREFELT $ 104))))))))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |g0|
                                      (SPADCALL (* |lc| |g0|) |pk|
                                                (QREFELT $ 107)))
                                (COND
                                 ((SPADCALL |degg| |d| (QREFELT $ 108))
                                  (COND
                                   ((QEQCAR
                                     (SPADCALL (* |lc| |f0|) |g0|
                                               (QREFELT $ 110))
                                     0)
                                    (SEQ
                                     (LETT |g| (SPADCALL |lc| (QREFELT $ 60)))
                                     (SEQ (LETT |j| 1) (LETT #14# |levels|)
                                          G190
                                          (COND
                                           ((|greater_SI| |j| #14#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |i| (- |j| 1)
                                                        (QREFELT $ 105))
                                              (LETT |g|
                                                    (SPADCALL |g|
                                                              (SPADCALL |lf|
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         106))
                                                              (QREFELT $
                                                                       111)))))))
                                          (LETT |j| (|inc_SI| |j|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |g|
                                           (SPADCALL
                                            (SPADCALL |g| |pk| (QREFELT $ 112))
                                            (QREFELT $ 113)))
                                     (LETT |f1|
                                           (SPADCALL |f| |g| (QREFELT $ 114)))
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
                                                                         105))
                                                      (SEQ
                                                       (SPADCALL |lf| |j| |nb|
                                                                 (QREFELT $
                                                                          115))
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
                                                             (QREFELT $ 116)))
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
                                                        (QREFELT $ 116))
                                              NIL (QREFELT $ 117))
                                             (LETT |f| (QCDR |f1|))
                                             (LETT |lc|
                                                   (SPADCALL |f|
                                                             (QREFELT $ 28)))
                                             (LETT |f0|
                                                   (SPADCALL |f| 0
                                                             (QREFELT $ 104)))
                                             (LETT |dg|
                                                   (SPADCALL
                                                    (CONS
                                                     #'|GALFACT;completeFactor!0|
                                                     (VECTOR $ |degg|))
                                                    |d| (QREFELT $ 90)))
                                             (COND
                                              ((SPADCALL |dg|
                                                         (SPADCALL
                                                          (LIST 0 |degg|)
                                                          (QREFELT $ 49))
                                                         (QREFELT $ 76))
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
                                                                 (* 2
                                                                    (SPADCALL
                                                                     |g|
                                                                     (QREFELT $
                                                                              28)))
                                                                 (SPADCALL |g|
                                                                           |rg|
                                                                           (QREFELT
                                                                            $
                                                                            118))))
                                                        (|check_subtype2|
                                                         (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#)))
                                                (EXIT
                                                 (COND
                                                  ((> |b| |pk|)
                                                   (COND
                                                    ((SPADCALL |g|
                                                               (QREFELT $ 92))
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
                                                                         120)))
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
                                                                       $ 120)))
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
                                                             (QREFELT $ 103)))
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
                                                    |d| (QREFELT $ 90)))
                                             (EXIT
                                              (COND
                                               ((<= |degf| 1)
                                                (SEQ
                                                 (COND
                                                  ((EQL |degf| 1)
                                                   (LETT |ltrue|
                                                         (CONS |f| |ltrue|))))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #1# |ltrue|)
                                                   (GO #17=#:G379)))))
                                               ('T
                                                (SEQ
                                                 (LETT |b|
                                                       (PROG1
                                                           (LETT #3#
                                                                 (* (* 2 |lc|)
                                                                    (SPADCALL
                                                                     |f| |r|
                                                                     (QREFELT $
                                                                              118))))
                                                         (|check_subtype2|
                                                          (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #3#)))
                                                 (EXIT
                                                  (COND
                                                   ((> |b| |pk|)
                                                    (SEQ
                                                     (LETT |llg|
                                                           (SPADCALL |f| |lf|
                                                                     |cprime|
                                                                     |b|
                                                                     (QREFELT $
                                                                              120)))
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
                                                                         103)))
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
          (RETURN (PROGN (SPADCALL |x| |degf| (QREFELT $ 85)))))) 

(SDEFUN |GALFACT;completeFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|degg| $)
          (LETT |degg| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |degg| (QREFELT $ 85)))))) 

(SDEFUN |GALFACT;divideSet|
        ((|s| (|Set| (|NonNegativeInteger|))) (|n| (|NonNegativeInteger|))
         ($ (|Set| (|NonNegativeInteger|))))
        (SPROG
         ((|l| (|List| (|NonNegativeInteger|)))
          (|ee| (|Union| (|NonNegativeInteger|) "failed")) (#1=#:G392 NIL)
          (|e| NIL))
         (SEQ (LETT |l| (LIST 0))
              (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |s| (QREFELT $ 121)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ee| (SPADCALL |e| |n| (QREFELT $ 122)))
                        (EXIT
                         (COND
                          ((QEQCAR |ee| 0)
                           (LETT |l| (CONS (QCDR |ee|) |l|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT $ 49)))))) 

(SDEFUN |GALFACT;btwFactor|
        ((|f| (UP)) (|d| (|Set| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|)) (|pdecomp| (|Boolean|))
         ($ #1=(|List| UP)))
        (SPROG
         ((#2=#:G449 NIL) (|i| NIL) (|lf| #3=(|List| UP)) (#4=#:G448 NIL)
          (|fact| NIL) (#5=#:G447 NIL) (#6=#:G433 NIL) (|lfg| #1#)
          (#7=#:G424 NIL) (|df| #8=(|NonNegativeInteger|)) (#9=#:G414 NIL)
          (|dgh| (|NonNegativeInteger|)) (|dg| #8#) (|g| (UP)) (#10=#:G446 NIL)
          (|lg| #1#) (|dh| #8#)
          (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|pk| (|PositiveInteger|)) (#11=#:G408 NIL)
          (|lm| (|Record| (|:| |plist| #3#) (|:| |modulo| (|Integer|))))
          (|b| (|PositiveInteger|)) (#12=#:G406 NIL) (|lc| (|Integer|))
          (#13=#:G445 NIL) (|cprime| #14=(|Integer|))
          (|m| (|Record| (|:| |prime| #14#) (|:| |factors| (|List| UP))))
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|negativelc?| #15=(|Boolean|)) (|reverse?| #15#))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT $ 39)))
                (COND
                 ((NULL (EQL (SPADCALL |d| (QREFELT $ 123)) |df|))
                  (EXIT (|error| "btwFact: Bad arguments"))))
                (LETT |reverse?| NIL) (LETT |negativelc?| NIL)
                (EXIT
                 (COND
                  ((SPADCALL |d| (SPADCALL (LIST 0 |df|) (QREFELT $ 49))
                             (QREFELT $ 76))
                   (LIST |f|))
                  (#16='T
                   (SEQ
                    (COND
                     ((< (ABS (SPADCALL |f| 0 (QREFELT $ 104)))
                         (ABS (SPADCALL |f| (QREFELT $ 28))))
                      (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 125)))
                           (EXIT (LETT |reverse?| 'T)))))
                    (COND
                     ((SPADCALL |f| (QREFELT $ 92))
                      (EXIT
                       (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 125))))
                             (#16# (LIST |f|)))))
                     ((QREFELT $ 11)
                      (COND
                       ((SPADCALL |f| (QREFELT $ 37))
                        (EXIT
                         (COND
                          (|reverse?| (LIST (SPADCALL |f| (QREFELT $ 125))))
                          (#16# (LIST |f|))))))))
                    (COND
                     ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                      (SEQ (LETT |f| (SPADCALL |f| (QREFELT $ 126)))
                           (EXIT (LETT |negativelc?| 'T)))))
                    (COND
                     (|pdecomp|
                      (COND
                       ((QREFELT $ 10)
                        (LETT |cf| (SPADCALL |f| (QREFELT $ 96))))
                       (#16# (LETT |cf| (CONS 1 #17="failed")))))
                     (#16# (LETT |cf| (CONS 1 #17#))))
                    (COND
                     ((QEQCAR |cf| 1)
                      (SEQ (LETT |m| (SPADCALL |f| |d| (QREFELT $ 79)))
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
                                           (SPADCALL |f| (QREFELT $ 125))
                                           (QREFELT $ 126))))
                                   (GO #18=#:G444)))
                                 (#16#
                                  (PROGN
                                   (LETT #13#
                                         (LIST (SPADCALL |f| (QREFELT $ 125))))
                                   (GO #18#)))))
                               (|negativelc?|
                                (PROGN
                                 (LETT #13#
                                       (LIST (SPADCALL |f| (QREFELT $ 126))))
                                 (GO #18#)))
                               (#16#
                                (PROGN (LETT #13# (LIST |f|)) (GO #18#)))))
                             (#16#
                              (SEQ
                               (COND
                                ((SPADCALL |f| (QREFELT $ 127))
                                 (LETT |d| (SPADCALL 1 |d| (QREFELT $ 128)))))
                               (LETT |lc| (SPADCALL |f| (QREFELT $ 28)))
                               (LETT |b|
                                     (PROG1
                                         (LETT #12#
                                               (* (* 2 |lc|)
                                                  (SPADCALL |f| |r|
                                                            (QREFELT $ 118))))
                                       (|check_subtype2| (> #12# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #12#)))
                               (LETT |lm|
                                     (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                               (QREFELT $ 120)))
                               (LETT |lf| (QCAR |lm|))
                               (LETT |pk|
                                     (PROG1 (LETT #11# (QCDR |lm|))
                                       (|check_subtype2| (> #11# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #11#)))
                               (COND
                                ((SPADCALL (|SPADfirst| |lf|) (QREFELT $ 129))
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
                                        (SPADCALL |lg| |i| (QREFELT $ 106)))
                                  (LETT |dg| (SPADCALL |g| (QREFELT $ 39)))
                                  (LETT |dgh| (* |dg| |dh|))
                                  (LETT |df|
                                        (PROG2
                                            (LETT #9#
                                                  (SPADCALL |df| |dgh|
                                                            (QREFELT $ 130)))
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
                                                   (QREFELT $ 102))
                                         (|GALFACT;sel_set| |d| |dg| |dh| $)
                                         (PROG1 (LETT #7# (MAX 2 (- |r| |df|)))
                                           (|check_subtype2| (>= #7# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #7#))
                                         NIL $))
                                  (LETT |lf|
                                        (SPADCALL |lf| |lfg| (QREFELT $ 103)))
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
                                           (SPADCALL |fact| (QREFELT $ 125))
                                           #5#))))
                                  (LETT #4# (CDR #4#)) (GO G190) G191
                                  (EXIT (NREVERSE #5#)))))))
                    (SEQ (LETT |i| 1) (LETT #2# (LENGTH |lf|)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((<
                              (SPADCALL (SPADCALL |lf| |i| (QREFELT $ 106))
                                        (QREFELT $ 28))
                              0)
                             (SPADCALL |lf| |i|
                                       (SPADCALL
                                        (SPADCALL |lf| |i| (QREFELT $ 106))
                                        (QREFELT $ 126))
                                       (QREFELT $ 131))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |lf|)))))))
          #18# (EXIT #13#)))) 

(SDEFUN |GALFACT;makeFR;RF;30|
        ((|flist|
          (|Record| (|:| |contp| (|Integer|))
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| UP)
                                    (|:| |pow| (|NonNegativeInteger|)))))))
         ($ (|Factored| UP)))
        (SPROG
         ((|fflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G468 NIL) (|fc| NIL) (#2=#:G467 NIL) (|ff| NIL)
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
                                    (SPADCALL (QVELT |fc| 1) (QREFELT $ 60))
                                    (QVELT |fc| 2))
                            |fflist|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ctp| (QREFELT $ 132)) (QREFELT $ 60))
                |fflist| (QREFELT $ 136)))))) 

(SDEFUN |GALFACT;quadratic| ((|p| (UP)) ($ (|List| UP)))
        (SPROG
         ((#1=#:G474 NIL) (|f| (UP)) (|b| (|Integer|)) (|a| (|Integer|))
          (|d| (|Integer|)) (|r| (|Union| (|Integer|) "failed")))
         (SEQ (LETT |a| (SPADCALL |p| (QREFELT $ 28)))
              (LETT |b| (SPADCALL |p| 1 (QREFELT $ 104)))
              (LETT |d|
                    (- (EXPT |b| 2)
                       (* (* 4 |a|) (SPADCALL |p| 0 (QREFELT $ 104)))))
              (LETT |r| (SPADCALL |d| (QREFELT $ 142)))
              (EXIT
               (COND ((QEQCAR |r| 1) (LIST |p|))
                     ('T
                      (SEQ (LETT |b| (+ |b| (QCDR |r|))) (LETT |a| (* 2 |a|))
                           (LETT |d| (GCD |a| |b|))
                           (COND
                            ((NULL (EQL |d| 1))
                             (SEQ (LETT |a| (QUOTIENT2 |a| |d|))
                                  (EXIT (LETT |b| (QUOTIENT2 |b| |d|))))))
                           (LETT |f|
                                 (SPADCALL (SPADCALL |a| 1 (QREFELT $ 143))
                                           (SPADCALL |b| 0 (QREFELT $ 143))
                                           (QREFELT $ 144)))
                           (EXIT
                            (CONS |f|
                                  (LIST
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL |p| |f|
                                                       (QREFELT $ 114)))
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              "failed")
                                                     #1#)))))))))))) 

(SDEFUN |GALFACT;isPowerOf2| ((|n| (|Integer|)) ($ (|Boolean|)))
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
        ((|supPol| (|SparseUnivariatePolynomial| (|Integer|))) ($ (UP)))
        (SPROG ((|minusX| (|SparseUnivariatePolynomial| (|Integer|))))
               (SEQ (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 145)))
                    (EXIT
                     (SPADCALL (SPADCALL |supPol| |minusX| (QREFELT $ 146))
                               (QREFELT $ 59)))))) 

(SDEFUN |GALFACT;gen_fact1|
        ((|f| (UP))
         ($
          (|Union|
           (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| UP)
                                     (|:| |pow| (|NonNegativeInteger|))))))
           (|Record| (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| UP)
                                     (|:| |pow| (|NonNegativeInteger|)))))))))
        (SPROG
         ((|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#1=#:G509 NIL) (|fac| NIL)
          (|cfl| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (#2=#:G508 NIL) (|lcPol| (UP)) (|d| (|NonNegativeInteger|))
          (|c| (|Integer|)) (#3=#:G491 NIL))
         (SEQ (LETT |factorlist| NIL) (LETT |c| (SPADCALL |f| (QREFELT $ 26)))
              (LETT |f|
                    (PROG2 (LETT #3# (SPADCALL |f| |c| (QREFELT $ 147)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0) (QREFELT $ 6)
                                      (|Union| (QREFELT $ 6) "failed") #3#)))
              (COND
               ((< (SPADCALL |f| (QREFELT $ 28)) 0)
                (SEQ (LETT |c| (- |c|))
                     (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 126)))))))
              (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 148)))
                   (EXIT
                    (COND
                     ((> |d| 0)
                      (SEQ
                       (LETT |f|
                             (QCAR
                              (SPADCALL |f| (SPADCALL 1 |d| (QREFELT $ 143))
                                        (QREFELT $ 150))))
                       (EXIT
                        (LETT |factorlist|
                              (LIST
                               (CONS (SPADCALL 1 1 (QREFELT $ 143))
                                     |d|)))))))))
              (LETT |d| (SPADCALL |f| (QREFELT $ 39)))
              (EXIT
               (COND ((ZEROP |d|) (CONS 1 (CONS |c| |factorlist|)))
                     ((EQL |d| 1)
                      (CONS 1 (CONS |c| (CONS (CONS |f| 1) |factorlist|))))
                     (#4='T
                      (SEQ
                       (LETT |lcPol|
                             (SPADCALL (SPADCALL |f| (QREFELT $ 28))
                                       (QREFELT $ 60)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 126))
                                    (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 151))
                          (SEQ (LETT |cfl| (SPADCALL |d| (QREFELT $ 154)))
                               (SEQ (LETT |fac| NIL)
                                    (LETT #2#
                                          (SPADCALL (ELT $ 59) |cfl|
                                                    (QREFELT $ 157)))
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |fac| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |factorlist|
                                            (CONS (CONS |fac| 1)
                                                  |factorlist|))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS 1 (CONS |c| |factorlist|)))))
                         ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 151))
                          (SEQ (LETT |cfl| (SPADCALL |d| (QREFELT $ 158)))
                               (SEQ (LETT |fac| NIL)
                                    (LETT #1#
                                          (SPADCALL (ELT $ 59) |cfl|
                                                    (QREFELT $ 157)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |fac| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |factorlist|
                                            (CONS (CONS |fac| 1)
                                                  |factorlist|))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS 1 (CONS |c| |factorlist|)))))
                         (#4# (CONS 0 (VECTOR |f| |c| |factorlist|)))))))))))) 

(SDEFUN |GALFACT;henselFact;UPBR;35|
        ((|f| (UP)) (|sqf| (|Boolean|))
         ($
          (|Record| (|:| |contp| (|Integer|))
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| UP)
                                    (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (|fla|
           (|List|
            #1=(|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#2=#:G530 NIL) (|pf| NIL) (#3=#:G529 NIL) (|fl1| (|List| UP))
          (|d| (|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #4=(|NonNegativeInteger|)) (#5=#:G528 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP) (|:| |exponent| #4#))))
          (#6=#:G527 NIL) (#7=#:G526 NIL) (|c| (|Integer|))
          (|#G127|
           (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                     (|:| |factors| (|List| #1#))))
          (|ru|
           (|Union|
            (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|))))))
            (|Record| (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|)))))))))
         (SEQ (LETT |ru| (|GALFACT;gen_fact1| |f| $))
              (EXIT
               (COND ((QEQCAR |ru| 1) (QCDR |ru|))
                     (#8='T
                      (SEQ
                       (PROGN
                        (LETT |#G127| (QCDR |ru|))
                        (LETT |f| (QVELT |#G127| 0))
                        (LETT |c| (QVELT |#G127| 1))
                        (LETT |factorlist| (QVELT |#G127| 2))
                        |#G127|)
                       (EXIT
                        (COND
                         (|sqf|
                          (SEQ
                           (LETT |fla|
                                 (PROGN
                                  (LETT #7# NIL)
                                  (SEQ (LETT |pf| NIL)
                                       (LETT #6#
                                             (|GALFACT;henselfact1| |f| 'T $))
                                       G190
                                       (COND
                                        ((OR (ATOM #6#)
                                             (PROGN (LETT |pf| (CAR #6#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #7# (CONS (CONS |pf| 1) #7#))))
                                       (LETT #6# (CDR #6#)) (GO G190) G191
                                       (EXIT (NREVERSE #7#)))))
                           (EXIT
                            (CONS |c|
                                  (SPADCALL |fla| |factorlist|
                                            (QREFELT $ 160))))))
                         (#8#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 161))
                                           (QREFELT $ 162)))
                           (SEQ (LETT |sqfr| NIL) (LETT #5# |sqfflist|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |sqfr| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QVELT |sqfr| 2))
                                     (LETT |sqff| (QVELT |sqfr| 1))
                                     (LETT |d|
                                           (SPADCALL |sqff| (QREFELT $ 39)))
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (LETT |factorlist|
                                              (CONS (CONS |sqff| |mult|)
                                                    |factorlist|)))
                                       ('T
                                        (SEQ
                                         (LETT |fl1|
                                               (COND
                                                ((EQL |d| 2)
                                                 (|GALFACT;quadratic| |sqff|
                                                  $))
                                                ('T
                                                 (|GALFACT;henselfact1| |sqff|
                                                  'T $))))
                                         (LETT |fla|
                                               (PROGN
                                                (LETT #3# NIL)
                                                (SEQ (LETT |pf| NIL)
                                                     (LETT #2# |fl1|) G190
                                                     (COND
                                                      ((OR (ATOM #2#)
                                                           (PROGN
                                                            (LETT |pf|
                                                                  (CAR #2#))
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
                                                     (EXIT (NREVERSE #3#)))))
                                         (EXIT
                                          (LETT |factorlist|
                                                (SPADCALL |fla| |factorlist|
                                                          (QREFELT $
                                                                   160)))))))))
                                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;36|
        ((|f| (UP)) (|sqf| (|Boolean|)) (|fd| (|Set| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|))
         ($
          (|Record| (|:| |contp| (|Integer|))
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| UP)
                                    (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|maxd| (|NonNegativeInteger|)) (#1=#:G558 NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (|fla|
           (|List|
            #2=(|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#3=#:G571 NIL) (|pf| NIL) (#4=#:G570 NIL) (|fl1| (|List| UP))
          (#5=#:G552 NIL) (|d| #6=(|NonNegativeInteger|)) (|sqff| (UP))
          (|mult| #7=(|NonNegativeInteger|)) (#8=#:G569 NIL) (|sqfr| NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP) (|:| |exponent| #7#))))
          (#9=#:G568 NIL) (#10=#:G567 NIL) (#11=#:G541 NIL)
          (|del_d| (|Integer|)) (|d1| #6#) (|c| (|Integer|))
          (|#G137|
           (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                     (|:| |factors| (|List| #2#))))
          (|ru|
           (|Union|
            (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|))))))
            (|Record| (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|)))))))))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 39)))
              (COND
               ((NULL (EQL (SPADCALL |fd| (QREFELT $ 123)) |d|))
                (EXIT (|error| "btwFact: Bad arguments"))))
              (LETT |ru| (|GALFACT;gen_fact1| |f| $))
              (EXIT
               (COND ((QEQCAR |ru| 1) (QCDR |ru|))
                     (#12='T
                      (SEQ
                       (PROGN
                        (LETT |#G137| (QCDR |ru|))
                        (LETT |f| (QVELT |#G137| 0))
                        (LETT |c| (QVELT |#G137| 1))
                        (LETT |factorlist| (QVELT |#G137| 2))
                        |#G137|)
                       (SEQ (LETT |d1| (SPADCALL |f| (QREFELT $ 39)))
                            (EXIT
                             (COND
                              ((< |d1| |d|)
                               (SEQ (LETT |del_d| (- |d| |d1|))
                                    (LETT |r|
                                          (PROG1
                                              (LETT #11#
                                                    (MAX 2 (- |r| |del_d|)))
                                            (|check_subtype2| (>= #11# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #11#)))
                                    (LETT |d| |d1|)
                                    (EXIT
                                     (LETT |fd|
                                           (SPADCALL
                                            (CONS
                                             #'|GALFACT;btwFact;UPBSNniR;36!0|
                                             (VECTOR $ |d|))
                                            |fd| (QREFELT $ 90)))))))))
                       (EXIT
                        (COND
                         (|sqf|
                          (SEQ
                           (LETT |fla|
                                 (PROGN
                                  (LETT #10# NIL)
                                  (SEQ (LETT |pf| NIL)
                                       (LETT #9#
                                             (|GALFACT;btwFactor| |f| |fd| |r|
                                              'T $))
                                       G190
                                       (COND
                                        ((OR (ATOM #9#)
                                             (PROGN (LETT |pf| (CAR #9#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #10#
                                               (CONS (CONS |pf| 1) #10#))))
                                       (LETT #9# (CDR #9#)) (GO G190) G191
                                       (EXIT (NREVERSE #10#)))))
                           (EXIT
                            (CONS |c|
                                  (SPADCALL |fla| |factorlist|
                                            (QREFELT $ 160))))))
                         (#12#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 161))
                                           (QREFELT $ 162)))
                           (COND
                            ((EQL (LENGTH |sqfflist|) 1)
                             (LETT |r|
                                   (MAX
                                    (QUOTIENT2 |r|
                                               (QVELT (|SPADfirst| |sqfflist|)
                                                      2))
                                    2)))
                            (#12# (LETT |r| 2)))
                           (SEQ (LETT |sqfr| NIL) (LETT #8# |sqfflist|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |sqfr| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QVELT |sqfr| 2))
                                     (LETT |sqff| (QVELT |sqfr| 1))
                                     (LETT |d|
                                           (SPADCALL |sqff| (QREFELT $ 39)))
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (SEQ
                                         (LETT |factorlist|
                                               (CONS (CONS |sqff| |mult|)
                                                     |factorlist|))
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #5#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             123))
                                                          |mult|))
                                                 (|check_subtype2| (>= #5# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #5#)))
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;36!1|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 90))))))
                                       ('T
                                        (SEQ
                                         (LETT |fl1|
                                               (COND
                                                ((EQL |d| 2)
                                                 (|GALFACT;quadratic| |sqff|
                                                  $))
                                                ('T
                                                 (|GALFACT;btwFactor| |sqff|
                                                  (SPADCALL
                                                   (CONS
                                                    #'|GALFACT;btwFact;UPBSNniR;36!2|
                                                    (VECTOR $ |d|))
                                                   |fd| (QREFELT $ 90))
                                                  |r| 'T $))))
                                         (LETT |fla|
                                               (PROGN
                                                (LETT #4# NIL)
                                                (SEQ (LETT |pf| NIL)
                                                     (LETT #3# |fl1|) G190
                                                     (COND
                                                      ((OR (ATOM #3#)
                                                           (PROGN
                                                            (LETT |pf|
                                                                  (CAR #3#))
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
                                                     (EXIT (NREVERSE #4#)))))
                                         (LETT |factorlist|
                                               (SPADCALL |fla| |factorlist|
                                                         (QREFELT $ 160)))
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #1#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT $
                                                                             123))
                                                          (* |d| |mult|)))
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#)))
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;36!3|
                                                  (VECTOR $ |maxd|))
                                                 |fd| (QREFELT $ 90)))))))))
                                (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;36!3| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 85)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;36!2| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 85)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;36!1| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| $)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT $ 85)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;36!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 85)))))) 

(SDEFUN |GALFACT;factor;UPF;37| ((|f| (UP)) ($ (|Factored| UP)))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| NIL
                     (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $) 2
                     (QREFELT $ 164)))
          ('T (SPADCALL |f| NIL (QREFELT $ 163))))
         (QREFELT $ 139))) 

(SDEFUN |GALFACT;errorsum?|
        ((|d| (|NonNegativeInteger|)) (|ld| (|List| #1=(|NonNegativeInteger|)))
         ($ (|Boolean|)))
        (SPROG
         ((#2=#:G574 NIL) (#3=#:G573 #1#) (#4=#:G575 #1#) (#5=#:G578 NIL)
          (#6=#:G103 NIL))
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
        ((|ld| (|List| (|NonNegativeInteger|)))
         ($ (|Set| (|NonNegativeInteger|))))
        (SPROG ((|s| (|Set| (|NonNegativeInteger|))) (#1=#:G583 NIL) (|d| NIL))
               (SEQ (LETT |s| (SPADCALL (LIST 0) (QREFELT $ 49)))
                    (SEQ (LETT |d| NIL) (LETT #1# |ld|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |s|
                                 (SPADCALL |s| (|GALFACT;shiftSet| |s| |d| $)
                                           (QREFELT $ 74)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(SDEFUN |GALFACT;factor;UPLNniF;40|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|)) ($ (|Factored| UP)))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 39)) |ld| $)
          (|error| "factor: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| NIL (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 164))
           (QREFELT $ 139))))) 

(SDEFUN |GALFACT;factor;UPNniF;41|
        ((|f| (UP)) (|r| (|NonNegativeInteger|)) ($ (|Factored| UP)))
        (SPADCALL
         (SPADCALL |f| NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                   |r| (QREFELT $ 164))
         (QREFELT $ 139))) 

(SDEFUN |GALFACT;factor;UPLF;42|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|))) ($ (|Factored| UP)))
        (SPADCALL |f| |ld| 2 (QREFELT $ 166))) 

(SDEFUN |GALFACT;factor;UP2NniF;43|
        ((|f| (UP)) (|d| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
         ($ (|Factored| UP)))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 39)) |d|
                                (QREFELT $ 122)))
                (EXIT
                 (COND ((QEQCAR |n| 1) (|error| "factor: Bad arguments"))
                       ('T
                        (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 169))
                                  |r| (QREFELT $ 166)))))))) 

(SDEFUN |GALFACT;factorSquareFree;UPF;44| ((|f| (UP)) ($ (|Factored| UP)))
        (SPADCALL
         (COND
          ((QREFELT $ 9)
           (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                     2 (QREFELT $ 164)))
          ('T (SPADCALL |f| 'T (QREFELT $ 163))))
         (QREFELT $ 139))) 

(SDEFUN |GALFACT;factorSquareFree;UPLNniF;45|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|)) ($ (|Factored| UP)))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT $ 39)) |ld| $)
          (|error| "factorSquareFree: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| 'T (|GALFACT;makeSet| |ld| $) |r| (QREFELT $ 164))
           (QREFELT $ 139))))) 

(SDEFUN |GALFACT;factorSquareFree;UPNniF;46|
        ((|f| (UP)) (|r| (|NonNegativeInteger|)) ($ (|Factored| UP)))
        (SPADCALL
         (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT $ 39)) $)
                   |r| (QREFELT $ 164))
         (QREFELT $ 139))) 

(SDEFUN |GALFACT;factorSquareFree;UPLF;47|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|))) ($ (|Factored| UP)))
        (SPADCALL |f| |ld| 2 (QREFELT $ 172))) 

(SDEFUN |GALFACT;factorSquareFree;UP2NniF;48|
        ((|f| (UP)) (|d| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
         ($ (|Factored| UP)))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 39)) |d|
                                (QREFELT $ 122)))
                (EXIT
                 (COND
                  ((QEQCAR |n| 1) (|error| "factorSquareFree: Bad arguments"))
                  ('T
                   (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT $ 169)) |r|
                             (QREFELT $ 172)))))))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniBU;49|
        ((|d| (|PositiveInteger|)) (|p| (UP))
         (|ld| (|List| (|NonNegativeInteger|))) (|r| (|NonNegativeInteger|))
         (|sqf| (|Boolean|)) ($ (|Union| UP "failed")))
        (SPROG
         ((#1=#:G617 NIL) (#2=#:G618 NIL) (#3=#:G619 NIL) (|f| NIL)
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
                       ((SPADCALL |p| (QREFELT $ 127))
                        (EXIT (CONS 1 "failed"))))))
                    (LETT |lf|
                          (QCDR
                           (SPADCALL |p| |sqf| (|GALFACT;makeSet| |ld| $) |r|
                                     (QREFELT $ 164))))
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
                                       (GO #4=#:G616)))
                                (GO #5=#:G610))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #1#))
                    (EXIT (CONS 1 "failed"))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniU;50|
        ((|d| (|PositiveInteger|)) (|p| (UP))
         (|ld| (|List| (|NonNegativeInteger|))) (|r| (|NonNegativeInteger|))
         ($ (|Union| UP "failed")))
        (SPADCALL |d| |p| |ld| |r| NIL (QREFELT $ 177))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPNniU;51|
        ((|d| (|PositiveInteger|)) (|p| (UP)) (|r| (|NonNegativeInteger|))
         ($ (|Union| UP "failed")))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 39)) 1 (QREFELT $ 169))
                  |r| NIL (QREFELT $ 177))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLU;52|
        ((|d| (|PositiveInteger|)) (|p| (UP))
         (|ld| (|List| (|NonNegativeInteger|))) ($ (|Union| UP "failed")))
        (SPADCALL |d| |p| |ld| 2 NIL (QREFELT $ 177))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPU;53|
        ((|d| (|PositiveInteger|)) (|p| (UP)) ($ (|Union| UP "failed")))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT $ 39)) 1 (QREFELT $ 169)) 2
                  NIL (QREFELT $ 177))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizer;|)) 

(DEFUN |GaloisGroupFactorizer| (#1=#:G636)
  (SPROG NIL
         (PROG (#2=#:G637)
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
          (LETT $ (GETREFV 182))
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
              (66 . |to_mod_pa|) (72 . |gcd|) (79 . |degree|) (84 . |Zero|)
              (88 . |pa_to_sup|) (93 . |unmakeSUP|) (98 . |coerce|) (103 . ~=)
              (109 . |invmod|) (|Void|) (115 . |mul_by_scalar|)
              (|Mapping| (|List| 52))
              (|Record| (|:| |poly| 52) (|:| |degree| 38)
                        (|:| |separate_factors| 65))
              (|List| 66) (|ModularFactorization|) (123 . |ddfact|)
              (129 . |empty|) (133 . |differentiate|)
              (|IntegerPrimesPackage| 25) (138 . |nextPrime|) (143 . |union|)
              (149 . |intersect|) (155 . =) (161 . |#|)
              (|Record| (|:| |prime| 25) (|:| |factors| 99))
              |GALFACT;modularFactor;UPSR;22| (|Multiset| 38) (166 . |empty|)
              (170 . |insert!|) (176 . |insert!|)
              |GALFACT;degreePartition;LM;23| (183 . <=) (189 . |rem|)
              (195 . |Zero|) (199 . =) (|Mapping| 12 38) (205 . |select|)
              (|BrillhartTests| 6) (211 . |brillhartIrreducible?|)
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 93 '"failed")
              (|UnivariatePolynomialDecompositionPackage| 25 6)
              (216 . |monicDecomposeIfCan|)
              (|GaloisGroupFactorizationUtilities| 25 6 (|Float|))
              (221 . |beauzamyBound|) (|List| 6) (|GeneralHenselPackage| 25 6)
              (226 . |completeHensel|) (234 . |elt|) (240 . |append|)
              (246 . |coefficient|) (252 . |bit?|) (258 . |elt|)
              (264 . |symmetricRemainder|) (270 . |member?|)
              (|Union| $ '"failed") (276 . |exquo|) (282 . *)
              (288 . |reduction|) (294 . |primitivePart|) (299 . |exquo|)
              (305 . |swap!|) (312 . |rest|) (318 . |setrest!|)
              (324 . |singleFactorBound|)
              (|Record| (|:| |plist| 99) (|:| |modulo| 25))
              (330 . |HenselLift|) (338 . |parts|) (343 . |exquo|)
              (349 . |max|) (|GaloisGroupPolynomialUtilities| 25 6)
              (354 . |reverse|) (359 . -) (364 . |noLinearFactor?|)
              (369 . |remove|) (375 . |ground?|) (380 . |subtractIfCan|)
              (386 . |setelt!|) (393 . |unit|)
              (|Record| (|:| |flag| 32) (|:| |factor| 6) (|:| |exponent| 38))
              (|List| 133) (|Factored| 6) (398 . |makeFR|)
              (|Record| (|:| |irr| 6) (|:| |pow| 38))
              (|Record| (|:| |contp| 25) (|:| |factors| 159))
              |GALFACT;makeFR;RF;30| (|Union| 25 '"failed") (|IntegerRoots| 25)
              (404 . |perfectSqrt|) (409 . |monomial|) (415 . +)
              (421 . |monomial|) (427 . |elt|) (433 . |exquo|)
              (439 . |minimumDegree|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (444 . |monicDivide|) (450 . =) (|List| 50)
              (|CyclotomicUtilities|) (456 . |cyclotomic_decomposition|)
              (|Mapping| 6 50) (|ListFunctions2| 50 6) (461 . |map|)
              (467 . |cocyclotomic_decomposition|) (|List| 137)
              (472 . |append|) (478 . |squareFree|) (483 . |factorList|)
              |GALFACT;henselFact;UPBR;35| |GALFACT;btwFact;UPBSNniR;36|
              |GALFACT;factor;UPF;37| |GALFACT;factor;UPLNniF;40|
              |GALFACT;factor;UPNniF;41| |GALFACT;factor;UPLF;42| (488 . |new|)
              |GALFACT;factor;UP2NniF;43| |GALFACT;factorSquareFree;UPF;44|
              |GALFACT;factorSquareFree;UPLNniF;45|
              |GALFACT;factorSquareFree;UPNniF;46|
              |GALFACT;factorSquareFree;UPLF;47|
              |GALFACT;factorSquareFree;UP2NniF;48| (|Union| 6 '"failed")
              |GALFACT;factorOfDegree;PiUPLNniBU;49|
              |GALFACT;factorOfDegree;PiUPLNniU;50|
              |GALFACT;factorOfDegree;PiUPNniU;51|
              |GALFACT;factorOfDegree;PiUPLU;52|
              |GALFACT;factorOfDegree;PiUPU;53|)
           '#(|useSingleFactorBound?| 494 |useSingleFactorBound| 498
              |useEisensteinCriterion?| 503 |useEisensteinCriterion| 507
              |tryFunctionalDecomposition?| 512 |tryFunctionalDecomposition|
              516 |stopMusserTrials| 521 |numberOfFactors| 530 |musserTrials|
              535 |modularFactor| 544 |makeFR| 550 |henselFact| 555
              |factorSquareFree| 561 |factorOfDegree| 592 |factor| 629
              |eisensteinIrreducible?| 660 |degreePartition| 665 |btwFact| 670)
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
                        (|makeByteWordVec2| 181
                                            '(1 6 0 0 24 1 6 25 0 26 1 25 12 0
                                              27 1 6 25 0 28 1 6 12 0 29 1 25
                                              30 0 31 1 35 34 0 36 1 6 38 0 39
                                              2 38 0 0 0 43 2 45 0 44 0 46 0 6
                                              0 47 1 45 0 48 49 1 6 50 0 51 2
                                              53 52 50 25 54 3 53 52 52 52 25
                                              55 1 53 25 52 56 0 6 0 57 1 53 50
                                              52 58 1 6 0 50 59 1 6 0 25 60 2
                                              25 12 0 0 61 2 25 0 0 0 62 4 53
                                              63 52 25 25 25 64 2 68 67 52 25
                                              69 0 45 0 70 1 6 0 0 71 1 72 25
                                              25 73 2 45 0 0 0 74 2 45 0 0 0 75
                                              2 45 12 0 0 76 1 48 38 0 77 0 80
                                              0 81 2 80 0 38 0 82 3 80 0 38 0
                                              38 83 2 38 12 0 0 85 2 38 0 0 0
                                              86 0 38 0 87 2 38 12 0 0 88 2 45
                                              0 89 0 90 1 91 12 6 92 1 95 94 6
                                              96 1 97 25 6 98 4 100 99 6 99 25
                                              19 101 2 6 0 0 0 102 2 99 0 0 0
                                              103 2 6 25 0 38 104 2 25 12 0 0
                                              105 2 99 6 0 25 106 2 25 0 0 0
                                              107 2 45 12 38 0 108 2 25 109 0 0
                                              110 2 6 0 0 0 111 2 100 6 6 25
                                              112 1 6 0 0 113 2 6 109 0 0 114 3
                                              99 63 0 25 25 115 2 99 0 0 38 116
                                              2 99 0 0 0 117 2 97 25 6 38 118 4
                                              100 119 6 99 25 19 120 1 45 48 0
                                              121 2 38 109 0 0 122 1 45 38 0
                                              123 1 124 6 6 125 1 6 0 0 126 1
                                              91 12 6 127 2 45 0 38 0 128 1 6
                                              12 0 129 2 38 109 0 0 130 3 99 6
                                              0 25 6 131 1 35 25 0 132 2 135 0
                                              6 134 136 1 141 140 25 142 2 6 0
                                              25 38 143 2 6 0 0 0 144 2 50 0 25
                                              38 145 2 50 0 0 0 146 2 6 109 0
                                              25 147 1 6 38 0 148 2 6 149 0 0
                                              150 2 6 12 0 0 151 1 153 152 25
                                              154 2 156 99 155 152 157 1 153
                                              152 25 158 2 159 0 0 0 160 1 6 30
                                              0 161 1 135 134 0 162 2 48 0 38
                                              38 169 0 0 12 17 1 0 12 12 18 0 0
                                              12 13 1 0 12 12 14 0 0 12 15 1 0
                                              12 12 16 1 0 19 19 21 0 0 19 20 1
                                              0 38 41 42 1 0 19 19 23 0 0 19 22
                                              2 0 78 6 45 79 1 0 135 138 139 2
                                              0 138 6 12 163 2 0 135 6 38 173 1
                                              0 135 6 171 3 0 135 6 48 38 172 2
                                              0 135 6 48 174 3 0 135 6 38 38
                                              175 2 0 176 19 6 181 3 0 176 19 6
                                              48 180 3 0 176 19 6 38 179 5 0
                                              176 19 6 48 38 12 177 4 0 176 19
                                              6 48 38 178 1 0 135 6 165 2 0 135
                                              6 48 168 2 0 135 6 38 167 3 0 135
                                              6 38 38 170 3 0 135 6 48 38 166 1
                                              0 12 6 37 1 0 80 41 84 4 0 138 6
                                              12 45 38 164)))))
           '|lookupComplete|)) 
