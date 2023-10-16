
(SDEFUN |SCPKG;matrix2Vector| ((|m| |Matrix| R) ($ |Vector| R))
        (SPROG ((|li| (|List| R)) (|lili| (|List| (|List| R))))
               (SEQ (LETT |lili| (SPADCALL |m| (QREFELT $ 9)))
                    (LETT |li| (SPADCALL (ELT $ 11) |lili| (QREFELT $ 13)))
                    (EXIT (SPADCALL |li| (QREFELT $ 15)))))) 

(SDEFUN |SCPKG;coordinates;MLV;2|
        ((|x| |Matrix| R) (|b| |List| (|Matrix| R)) ($ |Vector| R))
        (SPROG
         ((#1=#:G126 NIL)
          (|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) "failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#2=#:G130 NIL) (|i| NIL) (|transitionMatrix| (|Matrix| R))
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#3=#:G121 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #3# (SPADCALL |b| (QREFELT $ 18)))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
          (LETT |n|
                (* (ANROWS (SPADCALL |b| 1 (QREFELT $ 20)))
                   (ANCOLS (SPADCALL |b| 1 (QREFELT $ 20)))))
          (LETT |transitionMatrix|
                (MAKE_MATRIX1 |n| |m| (|spadConstant| $ 21)))
          (SEQ (LETT |i| 1) (LETT #2# |m|) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |transitionMatrix| |i|
                           (|SCPKG;matrix2Vector|
                            (SPADCALL |b| |i| (QREFELT $ 20)) $)
                           (QREFELT $ 22))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |transitionMatrix| (|SCPKG;matrix2Vector| |x| $)
                          (QREFELT $ 26)))
          (COND
           ((NULL (NULL (QCDR |res|)))
            (|error|
             "coordinates: the second argument is linearly dependent")))
          (EXIT
           (COND
            ((QEQCAR (QCAR |res|) 1)
             (|error|
              "coordinates: first argument is not in linear span of second argument"))
            ('T
             (PROG2 (LETT #1# (QCAR |res|))
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (|Vector| (QREFELT $ 6))
                               (|Union| (|Vector| (QREFELT $ 6)) "failed")
                               #1#)))))))) 

(SDEFUN |SCPKG;structuralConstants;LV;3|
        ((|b| |List| (|Matrix| R)) ($ |Vector| (|Matrix| R)))
        (SPROG
         ((#1=#:G144 NIL) (|k| NIL) (|covec| (|Vector| R)) (#2=#:G143 NIL)
          (|j| NIL) (#3=#:G142 NIL) (|i| NIL) (|sC| (|Vector| (|Matrix| R)))
          (#4=#:G139 NIL) (#5=#:G141 NIL) (#6=#:G140 NIL)
          (|m| (|NonNegativeInteger|)) (#7=#:G131 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #7# (SPADCALL |b| (QREFELT $ 18)))
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#)))
          (LETT |sC|
                (PROGN
                 (LETT #6# (GETREFV |m|))
                 (SEQ (LETT |k| 1) (LETT #5# |m|) (LETT #4# 0) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #4#
                                (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 21)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT |k| (|inc_SI| |k|))))
                      (GO G190) G191 (EXIT NIL))
                 #6#))
          (SEQ (LETT |i| 1) (LETT #3# |m|) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# |m|) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (LETT |covec|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |i| (QREFELT $ 20))
                                        (SPADCALL |b| |j| (QREFELT $ 20))
                                        (QREFELT $ 28))
                              |b| (QREFELT $ 27)))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL (SPADCALL |sC| |k| (QREFELT $ 30)) |i|
                                         |j|
                                         (SPADCALL |covec| |k| (QREFELT $ 31))
                                         (QREFELT $ 32))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |sC|)))) 

(SDEFUN |SCPKG;structuralConstants;LMV;4|
        ((|ls| |List| (|Symbol|)) (|mt| |Matrix| (|Polynomial| R))
         ($ |Vector| (|Matrix| (|Polynomial| R))))
        (SPROG
         ((|lscopy| (|List| (|Symbol|)))
          (|gamma| (|List| (|Matrix| (|Polynomial| R)))) (|c| (|Polynomial| R))
          (|p| (|Polynomial| R)) (#1=#:G157 NIL) (|j| NIL) (#2=#:G156 NIL)
          (|i| NIL) (|s| (|Symbol|)) (|mat| (|Matrix| (|Polynomial| R)))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (LENGTH |ls|))
              (COND
               ((OR (SPADCALL (ANROWS |mt|) |nn| (QREFELT $ 36))
                    (SPADCALL (ANCOLS |mt|) |nn| (QREFELT $ 36)))
                (EXIT
                 (|error|
                  "structuralConstants: size of second argument does not agree with number of generators"))))
              (LETT |gamma| NIL) (LETT |lscopy| (SPADCALL |ls| (QREFELT $ 38)))
              (SEQ G190 (COND ((NULL (NULL (NULL |lscopy|))) (GO G191)))
                   (SEQ
                    (LETT |mat| (MAKE_MATRIX1 |nn| |nn| (|spadConstant| $ 40)))
                    (LETT |s| (|SPADfirst| |lscopy|))
                    (SEQ (LETT |i| 1) (LETT #2# |nn|) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #1# |nn|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ (LETT |p| (QAREF2O |mt| |i| |j| 1 1))
                                     (EXIT
                                      (COND
                                       ((> (SPADCALL |p| |ls| (QREFELT $ 41))
                                           1)
                                        (|error|
                                         "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                       ((SPADCALL
                                         (LETT |c|
                                               (SPADCALL |p| |s| 1
                                                         (QREFELT $ 43)))
                                         (|spadConstant| $ 40) (QREFELT $ 44))
                                        (QSETAREF2O |mat| |i| |j| |c| 1 1)))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |gamma| (CONS |mat| |gamma|))
                    (EXIT (LETT |lscopy| (CDR |lscopy|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT $ 47)))))) 

(SDEFUN |SCPKG;structuralConstants;LMV;5|
        ((|ls| |List| (|Symbol|)) (|mt| |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |Vector| (|Matrix| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((|lscopy| (|List| (|Symbol|)))
          (|gamma| (|List| (|Matrix| (|Fraction| (|Polynomial| R)))))
          (|c| (|Polynomial| R)) (|p| (|Polynomial| R)) (|q| (|Polynomial| R))
          (|r| (|Fraction| (|Polynomial| R))) (#1=#:G171 NIL) (|j| NIL)
          (#2=#:G170 NIL) (|i| NIL) (|s| (|Symbol|))
          (|mat| (|Matrix| (|Fraction| (|Polynomial| R))))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (LENGTH |ls|))
              (COND
               ((OR (SPADCALL (ANROWS |mt|) |nn| (QREFELT $ 36))
                    (SPADCALL (ANCOLS |mt|) |nn| (QREFELT $ 36)))
                (EXIT
                 (|error|
                  "structuralConstants: size of second argument does not agree with number of generators"))))
              (LETT |gamma| NIL) (LETT |lscopy| (SPADCALL |ls| (QREFELT $ 38)))
              (SEQ G190 (COND ((NULL (NULL (NULL |lscopy|))) (GO G191)))
                   (SEQ
                    (LETT |mat| (MAKE_MATRIX1 |nn| |nn| (|spadConstant| $ 51)))
                    (LETT |s| (|SPADfirst| |lscopy|))
                    (SEQ (LETT |i| 1) (LETT #2# |nn|) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #1# |nn|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ (LETT |r| (QAREF2O |mt| |i| |j| 1 1))
                                     (LETT |q| (SPADCALL |r| (QREFELT $ 52)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |q| |ls| (QREFELT $ 41)) 0
                                         (QREFELT $ 36))
                                        (|error|
                                         "structuralConstants: entries of second argument must be (linear) polynomials in the generators"))
                                       ('T
                                        (SEQ
                                         (LETT |p|
                                               (SPADCALL |r| (QREFELT $ 53)))
                                         (EXIT
                                          (COND
                                           ((>
                                             (SPADCALL |p| |ls| (QREFELT $ 41))
                                             1)
                                            (|error|
                                             "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                           ((SPADCALL
                                             (LETT |c|
                                                   (SPADCALL |p| |s| 1
                                                             (QREFELT $ 43)))
                                             (|spadConstant| $ 40)
                                             (QREFELT $ 44))
                                            (QSETAREF2O |mat| |i| |j|
                                                        (SPADCALL |c| |q|
                                                                  (QREFELT $
                                                                           54))
                                                        1 1)))))))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |gamma| (CONS |mat| |gamma|))
                    (EXIT (LETT |lscopy| (CDR |lscopy|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT $ 57)))))) 

(DECLAIM (NOTINLINE |StructuralConstantsPackage;|)) 

(DEFUN |StructuralConstantsPackage| (#1=#:G172)
  (SPROG NIL
         (PROG (#2=#:G173)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StructuralConstantsPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|StructuralConstantsPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StructuralConstantsPackage|)))))))))) 

(DEFUN |StructuralConstantsPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|StructuralConstantsPackage| DV$1))
          (LETT $ (GETREFV 60))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|StructuralConstantsPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|StructuralConstantsPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 10) (|Matrix| 6)
              (0 . |listOfLists|) (|List| 6) (5 . |concat|)
              (|Mapping| 10 10 10) (11 . |reduce|) (|Vector| 6)
              (17 . |construct|) (|Integer|) (|List| 8) (22 . |maxIndex|)
              (27 . |One|) (31 . |elt|) (37 . |Zero|) (41 . |setColumn!|)
              (|Union| 14 '"failed")
              (|Record| (|:| |particular| 23) (|:| |basis| (|List| 14)))
              (|LinearSystemMatrixPackage| 6 14 14 8) (48 . |solve|)
              |SCPKG;coordinates;MLV;2| (54 . *) (|Vector| 8) (60 . |elt|)
              (66 . |elt|) (72 . |setelt!|) |SCPKG;structuralConstants;LV;3|
              (|Boolean|) (|NonNegativeInteger|) (80 . ~=) (|List| 42)
              (86 . |copy|) (|Polynomial| 6) (91 . |Zero|) (95 . |totalDegree|)
              (|Symbol|) (101 . |coefficient|) (108 . ~=) (|List| 48)
              (|Vector| 48) (114 . |vector|) (|Matrix| 39)
              |SCPKG;structuralConstants;LMV;4| (|Fraction| 39) (119 . |Zero|)
              (123 . |denom|) (128 . |numer|) (133 . /) (|List| 58)
              (|Vector| 58) (139 . |vector|) (|Matrix| 50)
              |SCPKG;structuralConstants;LMV;5|)
           '#(|structuralConstants| 144 |coordinates| 161) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|structuralConstants|
                                 ((|Vector|
                                   (|Matrix| (|Fraction| (|Polynomial| |#1|))))
                                  (|List| (|Symbol|))
                                  (|Matrix| (|Fraction| (|Polynomial| |#1|)))))
                                T)
                              '((|structuralConstants|
                                 ((|Vector| (|Matrix| (|Polynomial| |#1|)))
                                  (|List| (|Symbol|))
                                  (|Matrix| (|Polynomial| |#1|))))
                                T)
                              '((|structuralConstants|
                                 ((|Vector| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))))
                                T)
                              '((|coordinates|
                                 ((|Vector| |#1|) (|Matrix| |#1|)
                                  (|List| (|Matrix| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 59
                                            '(1 8 7 0 9 2 10 0 0 0 11 2 7 10 12
                                              0 13 1 14 0 10 15 1 17 16 0 18 0
                                              6 0 19 2 17 8 0 16 20 0 6 0 21 3
                                              8 0 0 16 14 22 2 25 24 8 14 26 2
                                              8 0 0 0 28 2 29 8 0 16 30 2 14 6
                                              0 16 31 4 8 6 0 16 16 6 32 2 35
                                              34 0 0 36 1 37 0 0 38 0 39 0 40 2
                                              39 35 0 37 41 3 39 0 0 42 35 43 2
                                              39 34 0 0 44 1 46 0 45 47 0 50 0
                                              51 1 50 39 0 52 1 50 39 0 53 2 50
                                              0 39 39 54 1 56 0 55 57 2 0 46 37
                                              48 49 2 0 56 37 58 59 1 0 29 17
                                              33 2 0 14 8 17 27)))))
           '|lookupComplete|)) 
