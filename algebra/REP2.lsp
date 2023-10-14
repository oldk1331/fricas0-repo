
(SDEFUN |REP2;blockMultiply|
        ((|a| |Matrix| R) (|b| |Matrix| R) (|li| |List| (|Integer|))
         (|n| |Integer|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G124 NIL) (#2=#:G123 (R)) (#3=#:G125 (R)) (|s| NIL)
          (#4=#:G132 NIL) (|j| NIL) (#5=#:G131 NIL) (#6=#:G130 NIL) (|i| NIL)
          (#7=#:G129 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #7# NIL . #8=(|REP2;blockMultiply|))
            (SEQ (LETT |i| NIL . #8#) (LETT #6# |li| . #8#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #7#
                         (CONS
                          (PROGN
                           (LETT #5# NIL . #8#)
                           (SEQ (LETT |j| NIL . #8#) (LETT #4# |li| . #8#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |j| (CAR #4#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (PROGN
                                          (LETT #1# NIL . #8#)
                                          (SEQ (LETT |s| 1 . #8#) G190
                                               (COND
                                                ((|greater_SI| |s| |n|)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #3#
                                                        (SPADCALL
                                                         (SPADCALL |a| |i| |s|
                                                                   (QREFELT $
                                                                            9))
                                                         (SPADCALL |b| |s| |j|
                                                                   (QREFELT $
                                                                            9))
                                                         (QREFELT $ 10))
                                                        . #8#)
                                                  (COND
                                                   (#1#
                                                    (LETT #2#
                                                          (SPADCALL #2# #3#
                                                                    (QREFELT $
                                                                             11))
                                                          . #8#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #2# #3# . #8#)
                                                     (LETT #1# 'T . #8#)))))))
                                               (LETT |s| (|inc_SI| |s|) . #8#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#1# #2#)
                                                ('T (|spadConstant| $ 12))))
                                         #5#)
                                        . #8#)))
                                (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          #7#)
                         . #8#)))
                 (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #7#))))
           (QREFELT $ 14))))) 

(SDEFUN |REP2;fingerPrint|
        ((|i| |NonNegativeInteger|) (|a| |Matrix| R) (|b| |Matrix| R)
         (|x| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G148 NIL) (#2=#:G146 NIL) (#3=#:G144 NIL) (#4=#:G142 NIL)
          (#5=#:G140 NIL) (#6=#:G138 NIL))
         (SEQ
          (COND
           ((EQL
             (PROG1 (LETT #6# |i| . #7=(|REP2;fingerPrint|))
               (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#))
             1)
            (LETT |x|
                  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 16))
                            (SPADCALL |a| |b| (QREFELT $ 17)) (QREFELT $ 16))
                  . #7#))
           ((EQL
             (PROG1 (LETT #5# |i| . #7#)
               (|check_subtype| (> #5# 0) '(|PositiveInteger|) #5#))
             2)
            (LETT |x|
                  (SPADCALL
                   (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17))
                             (QREFELT $ 16))
                   |b| (QREFELT $ 17))
                  . #7#))
           ((EQL
             (PROG1 (LETT #4# |i| . #7#)
               (|check_subtype| (> #4# 0) '(|PositiveInteger|) #4#))
             3)
            (LETT |x|
                  (SPADCALL |a| (SPADCALL |b| |x| (QREFELT $ 17))
                            (QREFELT $ 16))
                  . #7#))
           ((EQL
             (PROG1 (LETT #3# |i| . #7#)
               (|check_subtype| (> #3# 0) '(|PositiveInteger|) #3#))
             4)
            (LETT |x| (SPADCALL |x| |b| (QREFELT $ 16)) . #7#))
           ((EQL
             (PROG1 (LETT #2# |i| . #7#)
               (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
             5)
            (LETT |x|
                  (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17))
                            (QREFELT $ 16))
                  . #7#))
           ((EQL
             (PROG1 (LETT #1# |i| . #7#)
               (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
             6)
            (LETT |x|
                  (SPADCALL (SPADCALL |x| |a| (QREFELT $ 18))
                            (SPADCALL |b| |a| (QREFELT $ 17)) (QREFELT $ 16))
                  . #7#))
           ('T
            (SEQ (|error| "Sorry, but there are only 6 fingerprints!")
                 (EXIT |x|))))))) 

(SDEFUN |REP2;completeEchelonBasis;VM;3|
        ((|basis| |Vector| (|Vector| R)) ($ |Matrix| R))
        (SPROG
         ((|j| NIL) (|newStart| #1=(|NonNegativeInteger|))
          (|indexOfVectorToBeScanned| #1#) (|row| #2=(|NonNegativeInteger|))
          (|completedBasis| (|Matrix| R)) (|i| NIL)
          (|n| (|NonNegativeInteger|)) (|dimensionOfSubmodule| #2#))
         (SEQ
          (LETT |dimensionOfSubmodule| (QVSIZE |basis|)
                . #3=(|REP2;completeEchelonBasis;VM;3|))
          (LETT |n| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 21))) . #3#)
          (LETT |indexOfVectorToBeScanned| 1 . #3#)
          (LETT |row| |dimensionOfSubmodule| . #3#)
          (LETT |completedBasis| (SPADCALL |n| |n| (QREFELT $ 23)) . #3#)
          (SEQ (LETT |i| 1 . #3#) G190
               (COND ((|greater_SI| |i| |dimensionOfSubmodule|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |completedBasis|
                       (SPADCALL |completedBasis| |i|
                                 (SPADCALL |basis| |i| (QREFELT $ 21))
                                 (QREFELT $ 24))
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL (QVSIZE |basis|) |n| (QREFELT $ 26))
            (SEQ (LETT |newStart| 1 . #3#)
                 (SEQ (LETT |j| 1 . #3#) G190
                      (COND
                       ((OR (|greater_SI| |j| |n|)
                            (NULL
                             (SPADCALL |indexOfVectorToBeScanned|
                                       |dimensionOfSubmodule| (QREFELT $ 26))))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL
                          (SPADCALL
                           (SPADCALL |basis| |indexOfVectorToBeScanned|
                                     (QREFELT $ 21))
                           |j| (QREFELT $ 27))
                          (|spadConstant| $ 12) (QREFELT $ 28))
                         (SEQ
                          (SPADCALL |completedBasis| (+ 1 |row|) |j|
                                    (|spadConstant| $ 15) (QREFELT $ 29))
                          (EXIT (LETT |row| (+ |row| 1) . #3#))))
                        ('T
                         (LETT |indexOfVectorToBeScanned|
                               (+ |indexOfVectorToBeScanned| 1) . #3#)))
                       (EXIT (LETT |newStart| (+ |j| 1) . #3#)))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (SEQ (LETT |j| |newStart| . #3#) G190
                       (COND ((> |j| |n|) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |completedBasis| |j| |j|
                                   (|spadConstant| $ 15) (QREFELT $ 29))))
                       (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                       (EXIT NIL))))))
          (EXIT |completedBasis|)))) 

(SDEFUN |REP2;createRandomElement;L2M;4|
        ((|aG| |List| (|Matrix| R)) (|algElt| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((|randomIndex| (|Integer|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (LETT |numberOfGenerators| (LENGTH |aG|)
                . #1=(|REP2;createRandomElement;L2M;4|))
          (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #1#)
          (LETT |algElt|
                (SPADCALL |algElt| (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                          (QREFELT $ 17))
                . #1#)
          (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #1#)
          (EXIT
           (SPADCALL |algElt| (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                     (QREFELT $ 16)))))) 

(SDEFUN |REP2;cyclicSubmodule;LVV;5|
        ((|lm| |List| (|Matrix| R)) (|v| |Vector| R) ($ |Vector| (|Vector| R)))
        (SPROG
         ((#1=#:G176 NIL) (|i| NIL) (#2=#:G175 NIL)
          (|furtherElts| (|List| (|Vector| R)))
          (|updateFurtherElts| (|List| (|Vector| R))) (#3=#:G174 NIL)
          (#4=#:G173 NIL) (|basis| (|Matrix| R)) (|addedToBasis| (|Matrix| R))
          (|nextVector| (|Matrix| R)) (|w| (|Vector| R)) (#5=#:G172 NIL)
          (#6=#:G171 NIL))
         (SEQ
          (LETT |basis|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36))
                  (QREFELT $ 14))
                 (QREFELT $ 37))
                . #7=(|REP2;cyclicSubmodule;LVV;5|))
          (LETT |furtherElts|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |i| 1 . #7#)
                      (LETT #5# (SPADCALL |lm| (QREFELT $ 38)) . #7#) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 32)) |v|
                                         (QREFELT $ 39))
                               #6#)
                              . #7#)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |furtherElts|) 'NIL)
                        ('T (< (ANROWS |basis|) (QVSIZE |v|)))))
                 (GO G191)))
               (SEQ (LETT |w| (|SPADfirst| |furtherElts|) . #7#)
                    (LETT |nextVector|
                          (SPADCALL
                           (SPADCALL (SPADCALL |w| (QREFELT $ 35))
                                     (QREFELT $ 36))
                           (QREFELT $ 14))
                          . #7#)
                    (LETT |addedToBasis|
                          (SPADCALL |basis| |nextVector| (QREFELT $ 40)) . #7#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 41))
                                 (ANROWS |basis|) (QREFELT $ 42))
                       (SEQ
                        (LETT |basis| (SPADCALL |addedToBasis| (QREFELT $ 37))
                              . #7#)
                        (LETT |updateFurtherElts|
                              (PROGN
                               (LETT #4# NIL . #7#)
                               (SEQ (LETT |i| 1 . #7#)
                                    (LETT #3# (SPADCALL |lm| (QREFELT $ 38))
                                          . #7#)
                                    G190
                                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |lm| |i|
                                                        (QREFELT $ 32))
                                              |w| (QREFELT $ 39))
                                             #4#)
                                            . #7#)))
                                    (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                    G191 (EXIT (NREVERSE #4#))))
                              . #7#)
                        (EXIT
                         (LETT |furtherElts|
                               (APPEND (CDR |furtherElts|) |updateFurtherElts|)
                               . #7#))))
                      ('T (LETT |furtherElts| (CDR |furtherElts|) . #7#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# NIL . #7#)
             (SEQ (LETT |i| 1 . #7#)
                  (LETT #1# (SPADCALL |basis| (QREFELT $ 43)) . #7#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |basis| |i| (QREFELT $ 44)) #2#)
                          . #7#)))
                  (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 46)))))) 

(SDEFUN |REP2;standardBasisOfCyclicSubmodule;LVM;6|
        ((|lm| |List| (|Matrix| R)) (|v| |Vector| R) ($ |Matrix| R))
        (SPROG
         ((|furtherElts| (|List| (|Vector| R)))
          (|updateFurtherElts| (|List| (|Vector| R))) (#1=#:G187 NIL) (|i| NIL)
          (#2=#:G186 NIL) (|basis| (|Matrix| R))
          (|standardBasis| (|List| (|List| R))) (|addedToBasis| (|Matrix| R))
          (|nextVector| (|Matrix| R)) (|w| (|Vector| R)) (#3=#:G185 NIL)
          (#4=#:G184 NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dim| (QVSIZE |v|)
                . #5=(|REP2;standardBasisOfCyclicSubmodule;LVM;6|))
          (LETT |standardBasis|
                (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36)) . #5#)
          (LETT |basis|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36))
                  (QREFELT $ 14))
                 (QREFELT $ 37))
                . #5#)
          (LETT |furtherElts|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#)
                      (LETT #3# (SPADCALL |lm| (QREFELT $ 38)) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 32)) |v|
                                         (QREFELT $ 39))
                               #4#)
                              . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |furtherElts|) 'NIL)
                        ('T (< (ANROWS |basis|) (QVSIZE |v|)))))
                 (GO G191)))
               (SEQ (LETT |w| (|SPADfirst| |furtherElts|) . #5#)
                    (LETT |nextVector|
                          (SPADCALL
                           (SPADCALL (SPADCALL |w| (QREFELT $ 35))
                                     (QREFELT $ 36))
                           (QREFELT $ 14))
                          . #5#)
                    (LETT |addedToBasis|
                          (SPADCALL |basis| |nextVector| (QREFELT $ 40)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 41))
                                 (ANROWS |basis|) (QREFELT $ 42))
                       (SEQ
                        (LETT |standardBasis|
                              (CONS (SPADCALL |w| (QREFELT $ 35))
                                    |standardBasis|)
                              . #5#)
                        (LETT |basis| (SPADCALL |addedToBasis| (QREFELT $ 37))
                              . #5#)
                        (LETT |updateFurtherElts|
                              (PROGN
                               (LETT #2# NIL . #5#)
                               (SEQ (LETT |i| 1 . #5#)
                                    (LETT #1# (SPADCALL |lm| (QREFELT $ 38))
                                          . #5#)
                                    G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |lm| |i|
                                                        (QREFELT $ 32))
                                              |w| (QREFELT $ 39))
                                             #2#)
                                            . #5#)))
                                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))
                              . #5#)
                        (EXIT
                         (LETT |furtherElts|
                               (APPEND (CDR |furtherElts|) |updateFurtherElts|)
                               . #5#))))
                      ('T (LETT |furtherElts| (CDR |furtherElts|) . #5#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |standardBasis| (QREFELT $ 14))
                     (QREFELT $ 48)))))) 

(SDEFUN |REP2;splitInternal|
        ((|algebraGenerators| |List| (|Matrix| R)) (|vector| |Vector| R)
         (|doSplitting?| |Boolean|) ($ |List| (|List| (|Matrix| R))))
        (SPROG
         ((|factormoduleRepresentation| #1=(|List| (|Matrix| R)))
          (|submoduleRepresentation| #1#) (|helpMatrix| (|Matrix| R))
          (#2=#:G202 NIL) (|i| NIL) (|inverseTransitionMatrix| (|Matrix| R))
          (#3=#:G191 NIL) (|transitionMatrix| (|Matrix| R))
          (|factormoduleIndices| (|List| (|Integer|))) (#4=#:G201 NIL)
          (|submoduleIndices| (|List| (|Integer|))) (#5=#:G200 NIL)
          (|rankOfSubmodule| (|Integer|)) (|submodule| (|Vector| (|Vector| R)))
          (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |vector|) . #6=(|REP2;splitInternal|))
              (LETT |submodule|
                    (SPADCALL |algebraGenerators| |vector| (QREFELT $ 47))
                    . #6#)
              (LETT |rankOfSubmodule| (QVSIZE |submodule|) . #6#)
              (LETT |submoduleRepresentation| NIL . #6#)
              (LETT |factormoduleRepresentation| NIL . #6#)
              (EXIT
               (COND
                ((SPADCALL |n| |rankOfSubmodule| (QREFELT $ 50))
                 (SEQ
                  (SPADCALL "  A proper cyclic submodule is found."
                            (QREFELT $ 54))
                  (COND
                   (|doSplitting?|
                    (SEQ
                     (LETT |submoduleIndices|
                           (PROGN
                            (LETT #5# NIL . #6#)
                            (SEQ (LETT |i| 1 . #6#) G190
                                 (COND
                                  ((|greater_SI| |i| |rankOfSubmodule|)
                                   (GO G191)))
                                 (SEQ (EXIT (LETT #5# (CONS |i| #5#) . #6#)))
                                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                                 (EXIT (NREVERSE #5#))))
                           . #6#)
                     (LETT |factormoduleIndices|
                           (PROGN
                            (LETT #4# NIL . #6#)
                            (SEQ (LETT |i| (+ 1 |rankOfSubmodule|) . #6#) G190
                                 (COND ((> |i| |n|) (GO G191)))
                                 (SEQ (EXIT (LETT #4# (CONS |i| #4#) . #6#)))
                                 (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           . #6#)
                     (LETT |transitionMatrix|
                           (SPADCALL (SPADCALL |submodule| (QREFELT $ 30))
                                     (QREFELT $ 48))
                           . #6#)
                     (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
                     (LETT |inverseTransitionMatrix|
                           (PROG2
                               (LETT #3#
                                     (SPADCALL |transitionMatrix|
                                               (QREFELT $ 56))
                                     . #6#)
                               (QCDR #3#)
                             (|check_union| (QEQCAR #3# 0)
                                            (|Matrix| (QREFELT $ 6)) #3#))
                           . #6#)
                     (SPADCALL
                      "  The inverse of the transition matrix computed"
                      (QREFELT $ 54))
                     (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
                     (EXIT
                      (SEQ (LETT |i| 1 . #6#)
                           (LETT #2#
                                 (SPADCALL |algebraGenerators| (QREFELT $ 38))
                                 . #6#)
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (LETT |helpMatrix|
                                  (SPADCALL |inverseTransitionMatrix|
                                            (SPADCALL |algebraGenerators| |i|
                                                      (QREFELT $ 32))
                                            (QREFELT $ 17))
                                  . #6#)
                            (LETT |submoduleRepresentation|
                                  (CONS
                                   (|REP2;blockMultiply| |helpMatrix|
                                    |transitionMatrix| |submoduleIndices| |n|
                                    $)
                                   |submoduleRepresentation|)
                                  . #6#)
                            (EXIT
                             (LETT |factormoduleRepresentation|
                                   (CONS
                                    (|REP2;blockMultiply| |helpMatrix|
                                     |transitionMatrix| |factormoduleIndices|
                                     |n| $)
                                    |factormoduleRepresentation|)
                                   . #6#)))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))))))
                  (EXIT
                   (LIST (REVERSE |submoduleRepresentation|)
                         (REVERSE |factormoduleRepresentation|)))))
                ('T
                 (SEQ
                  (SPADCALL "  The generated cyclic submodule was not proper"
                            (QREFELT $ 54))
                  (EXIT (LIST |algebraGenerators|))))))))) 

(SDEFUN |REP2;irreducibilityTestInternal|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|singularMatrix| |Matrix| R) (|split?| |Boolean|)
         ($ |List| (|List| (|Matrix| R))))
        (SPROG
         ((#1=#:G207 NIL) (|mat| (|Matrix| R)) (#2=#:G219 NIL) (|j| NIL)
          (#3=#:G218 NIL) (|i| NIL) (|result| (|List| (|List| (|Matrix| R))))
          (|kernel| (|List| (|Vector| R))) (|xt| (|Matrix| R))
          (|algebraGeneratorsTranspose| (|List| (|Matrix| R))) (#4=#:G217 NIL)
          (#5=#:G216 NIL))
         (SEQ
          (LETT |algebraGeneratorsTranspose|
                (PROGN
                 (LETT #5# NIL . #6=(|REP2;irreducibilityTestInternal|))
                 (SEQ (LETT |j| 1 . #6#)
                      (LETT #4# (SPADCALL |algebraGenerators| (QREFELT $ 38))
                            . #6#)
                      G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (SPADCALL |algebraGenerators| |j|
                                          (QREFELT $ 32))
                                (QREFELT $ 48))
                               #5#)
                              . #6#)))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |xt| (SPADCALL |singularMatrix| (QREFELT $ 48)) . #6#)
          (SPADCALL "  We know that all the cyclic submodules generated by all"
                    (QREFELT $ 54))
          (SPADCALL
           "    non-trivial element of the singular matrix under view are"
           (QREFELT $ 54))
          (SPADCALL
           "    not proper, hence Norton's irreducibility test can be done:"
           (QREFELT $ 54))
          (LETT |kernel| (SPADCALL |xt| (QREFELT $ 57)) . #6#)
          (LETT |result|
                (|REP2;splitInternal| |algebraGeneratorsTranspose|
                 (|SPADfirst| |kernel|) |split?| $)
                . #6#)
          (COND
           ((NULL (CDR |result|))
            (COND
             ((EQL 1 (LENGTH |kernel|))
              (SPADCALL "  Representation is absolutely irreducible"
                        (QREFELT $ 54)))
             (#7='T
              (SEQ
               (SPADCALL "  Representation is irreducible, but we don't know "
                         (QREFELT $ 54))
               (EXIT
                (SPADCALL "    whether it is absolutely irreducible"
                          (QREFELT $ 54)))))))
           (|split?|
            (SEQ
             (SPADCALL
              "  Representation is not irreducible and it will be split:"
              (QREFELT $ 54))
             (EXIT
              (SEQ (LETT |i| 1 . #6#)
                   (LETT #3# (SPADCALL |result| (QREFELT $ 59)) . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #2#
                                (SPADCALL
                                 (SPADCALL |result| |i| (QREFELT $ 60))
                                 (QREFELT $ 38))
                                . #6#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (LETT |mat|
                                 (SPADCALL
                                  (SPADCALL |result| |i| (QREFELT $ 60)) |j|
                                  (QREFELT $ 32))
                                 . #6#)
                           (EXIT
                            (SPADCALL (SPADCALL |result| |i| (QREFELT $ 60))
                                      |j|
                                      (SPADCALL
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |mat|
                                                           (QREFELT $ 56))
                                                 . #6#)
                                           (QCDR #1#)
                                         (|check_union| (QEQCAR #1# 0)
                                                        (|Matrix|
                                                         (QREFELT $ 6))
                                                        #1#))
                                       (QREFELT $ 48))
                                      (QREFELT $ 61))))
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                   (EXIT NIL)))))
           (#7#
            (SPADCALL
             "  Representation is not irreducible, use meatAxe to split"
             (QREFELT $ 54))))
          (EXIT (REVERSE |result|))))) 

(SDEFUN |REP2;areEquivalent?;2LM;9|
        ((|aG0| |List| (|Matrix| R)) (|aG1| |List| (|Matrix| R))
         ($ |Matrix| R))
        (SPADCALL |aG0| |aG1| 'T 25 (QREFELT $ 62))) 

(SDEFUN |REP2;areEquivalent?;2LIM;10|
        ((|aG0| |List| (|Matrix| R)) (|aG1| |List| (|Matrix| R))
         (|numberOfTries| |Integer|) ($ |Matrix| R))
        (SPADCALL |aG0| |aG1| 'T |numberOfTries| (QREFELT $ 62))) 

(SDEFUN |REP2;areEquivalent?;2LBIM;11|
        ((|aG0| |List| (|Matrix| R)) (|aG1| |List| (|Matrix| R))
         (|randomelements| |Boolean|) (|numberOfTries| |Integer|)
         ($ |Matrix| R))
        (SPROG
         ((|transitionM| (|Matrix| R)) (|result| #1=(|Boolean|)) (|j| NIL)
          (|foundResult| #1#) (#2=#:G232 NIL) (|baseChange1| #3=(|Matrix| R))
          (|baseChange0| #3#) (|kernel1| #4=(|List| (|Vector| R)))
          (|kernel0| #4#) (|rk1| #5=(|NonNegativeInteger|)) (|rk0| #5#)
          (|x1| #6=(|Matrix| R)) (|x0| #6#) (|randomIndex| (|Integer|))
          (|i| NIL) (#7=#:G249 NIL) (|n| (|NonNegativeInteger|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |result| 'NIL . #8=(|REP2;areEquivalent?;2LBIM;11|))
              (LETT |transitionM| (SPADCALL 1 1 (QREFELT $ 23)) . #8#)
              (LETT |numberOfGenerators| (LENGTH |aG0|) . #8#)
              (COND
               (|randomelements|
                (SEQ
                 (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #8#)
                 (LETT |x0| (SPADCALL |aG0| |randomIndex| (QREFELT $ 32))
                       . #8#)
                 (EXIT
                  (LETT |x1| (SPADCALL |aG1| |randomIndex| (QREFELT $ 32))
                        . #8#)))))
              (LETT |n| (QVSIZE (SPADCALL |x0| 1 (QREFELT $ 44))) . #8#)
              (LETT |foundResult| 'NIL . #8#)
              (SEQ (LETT #7# NIL . #8#) (LETT |i| 1 . #8#) G190
                   (COND
                    ((OR (|greater_SI| |i| |numberOfTries|) #7#) (GO G191)))
                   (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T . #8#)))
                        (COND
                         (|randomelements|
                          (SEQ
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)) . #8#)
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 17))
                                 . #8#)
                           (LETT |x1|
                                 (SPADCALL |x1|
                                           (SPADCALL |aG1| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 17))
                                 . #8#)
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)) . #8#)
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 16))
                                 . #8#)
                           (EXIT
                            (LETT |x1|
                                  (SPADCALL |x1|
                                            (SPADCALL |aG1| |randomIndex|
                                                      (QREFELT $ 32))
                                            (QREFELT $ 16))
                                  . #8#))))
                         ('T
                          (SEQ
                           (LETT |x0|
                                 (|REP2;fingerPrint| |i|
                                  (SPADCALL |aG0| 0 (QREFELT $ 32))
                                  (SPADCALL |aG0| 1 (QREFELT $ 32)) |x0| $)
                                 . #8#)
                           (EXIT
                            (LETT |x1|
                                  (|REP2;fingerPrint| |i|
                                   (SPADCALL |aG1| 0 (QREFELT $ 32))
                                   (SPADCALL |aG1| 1 (QREFELT $ 32)) |x1| $)
                                  . #8#)))))
                        (LETT |rk0| (SPADCALL |x0| (QREFELT $ 41)) . #8#)
                        (LETT |rk1| (SPADCALL |x1| (QREFELT $ 41)) . #8#)
                        (EXIT
                         (COND
                          ((SPADCALL |rk0| |rk1| (QREFELT $ 42))
                           (SEQ
                            (SPADCALL "Dimensions of kernels differ"
                                      (QREFELT $ 54))
                            (LETT |foundResult| 'T . #8#)
                            (EXIT (LETT |result| 'NIL . #8#))))
                          ((SPADCALL |rk0| (- |n| 1) (QREFELT $ 50))
                           (COND
                            (|randomelements|
                             (SEQ
                              (SPADCALL
                               "Random element in generated algebra does"
                               (QREFELT $ 54))
                              (EXIT
                               (SPADCALL "  not have a one-dimensional kernel"
                                         (QREFELT $ 54)))))
                            ('T
                             (SEQ
                              (SPADCALL
                               "Fingerprint element in generated algebra does"
                               (QREFELT $ 54))
                              (EXIT
                               (SPADCALL "  not have a one-dimensional kernel"
                                         (QREFELT $ 54)))))))
                          ('T
                           (SEQ
                            (COND
                             (|randomelements|
                              (SEQ
                               (SPADCALL
                                "Random element in generated algebra has"
                                (QREFELT $ 54))
                               (EXIT
                                (SPADCALL "  one-dimensional kernel"
                                          (QREFELT $ 54)))))
                             ('T
                              (SEQ
                               (SPADCALL
                                "Fingerprint element in generated algebra has"
                                (QREFELT $ 54))
                               (EXIT
                                (SPADCALL "  one-dimensional kernel"
                                          (QREFELT $ 54))))))
                            (LETT |kernel0| (SPADCALL |x0| (QREFELT $ 57))
                                  . #8#)
                            (LETT |kernel1| (SPADCALL |x1| (QREFELT $ 57))
                                  . #8#)
                            (LETT |baseChange0|
                                  (SPADCALL |aG0|
                                            (SPADCALL |kernel0| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 49))
                                  . #8#)
                            (LETT |baseChange1|
                                  (SPADCALL |aG1|
                                            (SPADCALL |kernel1| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 49))
                                  . #8#)
                            (EXIT
                             (COND
                              ((SPADCALL (ANCOLS |baseChange0|)
                                         (ANCOLS |baseChange1|) (QREFELT $ 42))
                               (SEQ
                                (SPADCALL
                                 "  Dimensions of generated cyclic submodules differ"
                                 (QREFELT $ 54))
                                (LETT |foundResult| 'T . #8#)
                                (EXIT (LETT |result| 'NIL . #8#))))
                              ((EQL (ANCOLS |baseChange0|) |n|)
                               (SEQ
                                (LETT |transitionM|
                                      (SPADCALL |baseChange0|
                                                (PROG2
                                                    (LETT #2#
                                                          (SPADCALL
                                                           |baseChange1|
                                                           (QREFELT $ 56))
                                                          . #8#)
                                                    (QCDR #2#)
                                                  (|check_union| (QEQCAR #2# 0)
                                                                 (|Matrix|
                                                                  (QREFELT $
                                                                           6))
                                                                 #2#))
                                                (QREFELT $ 17))
                                      . #8#)
                                (LETT |foundResult| 'T . #8#)
                                (LETT |result| 'T . #8#)
                                (EXIT
                                 (SEQ (LETT |j| 1 . #8#) G190
                                      (COND
                                       ((OR
                                         (|greater_SI| |j|
                                                       |numberOfGenerators|)
                                         (NULL |result|))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL
                                            (SPADCALL |aG0| |j| (QREFELT $ 32))
                                            |transitionM| (QREFELT $ 17))
                                           (SPADCALL |transitionM|
                                                     (SPADCALL |aG1| |j|
                                                               (QREFELT $ 32))
                                                     (QREFELT $ 17))
                                           (QREFELT $ 66))
                                          (SEQ (LETT |result| 'NIL . #8#)
                                               (LETT |transitionM|
                                                     (SPADCALL 1 1
                                                               (QREFELT $ 23))
                                                     . #8#)
                                               (SPADCALL
                                                "  There is no isomorphism, as the only possible one"
                                                (QREFELT $ 54))
                                               (EXIT
                                                (SPADCALL
                                                 "    fails to do the necessary base change"
                                                 (QREFELT $ 54))))))))
                                      (LETT |j| (|inc_SI| |j|) . #8#) (GO G190)
                                      G191 (EXIT NIL)))))
                              ('T
                               (SEQ
                                (SPADCALL
                                 "  Generated cyclic submodules have equal, but not full"
                                 (QREFELT $ 54))
                                (EXIT
                                 (SPADCALL
                                  "    dimension, hence we can not draw any conclusion"
                                  (QREFELT $ 54))))))))))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|) (LETT #7# |foundResult| . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL))
              (COND
               (|foundResult|
                (COND
                 (|result|
                  (SEQ (SPADCALL " " (QREFELT $ 54))
                       (EXIT
                        (SPADCALL "Representations are equivalent."
                                  (QREFELT $ 54)))))
                 (#9='T
                  (SEQ (SPADCALL " " (QREFELT $ 54))
                       (EXIT
                        (SPADCALL "Representations are not equivalent."
                                  (QREFELT $ 54)))))))
               (#9#
                (SEQ (SPADCALL " " (QREFELT $ 54))
                     (SPADCALL
                      "Can neither prove equivalence nor inequivalence."
                      (QREFELT $ 54))
                     (EXIT (SPADCALL "  Try again." (QREFELT $ 54))))))
              (EXIT |transitionM|)))) 

(SDEFUN |REP2;isAbsolutelyIrreducible?;LB;12|
        ((|aG| |List| (|Matrix| R)) ($ |Boolean|))
        (SPADCALL |aG| 25 (QREFELT $ 67))) 

(SDEFUN |REP2;isAbsolutelyIrreducible?;LIB;13|
        ((|aG| |List| (|Matrix| R)) (|numberOfTries| |Integer|) ($ |Boolean|))
        (SPROG
         ((|result| #1=(|Boolean|)) (|kernel| (|List| (|Vector| R)))
          (|foundResult| #1#) (|rk| (|NonNegativeInteger|)) (|x| (|Matrix| R))
          (|randomIndex| (|Integer|)) (|i| NIL) (#2=#:G258 NIL)
          (|n| (|NonNegativeInteger|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (LETT |result| 'NIL . #3=(|REP2;isAbsolutelyIrreducible?;LIB;13|))
          (LETT |numberOfGenerators| (LENGTH |aG|) . #3#)
          (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
          (LETT |x| (SPADCALL |aG| |randomIndex| (QREFELT $ 32)) . #3#)
          (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 44))) . #3#)
          (LETT |foundResult| 'NIL . #3#)
          (SEQ (LETT #2# NIL . #3#) (LETT |i| 1 . #3#) G190
               (COND ((OR (|greater_SI| |i| |numberOfTries|) #2#) (GO G191)))
               (SEQ
                (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
                (LETT |x|
                      (SPADCALL |x|
                                (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                                (QREFELT $ 17))
                      . #3#)
                (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
                (LETT |x|
                      (SPADCALL |x|
                                (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                                (QREFELT $ 16))
                      . #3#)
                (LETT |rk| (SPADCALL |x| (QREFELT $ 41)) . #3#)
                (EXIT
                 (COND
                  ((EQL |rk| (- |n| 1))
                   (SEQ (LETT |foundResult| 'T . #3#)
                        (SPADCALL "Random element in generated algebra has"
                                  (QREFELT $ 54))
                        (SPADCALL "  one-dimensional kernel" (QREFELT $ 54))
                        (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)) . #3#)
                        (EXIT
                         (COND
                          ((EQL |n|
                                (QVSIZE
                                 (SPADCALL |aG| (|SPADfirst| |kernel|)
                                           (QREFELT $ 47))))
                           (LETT |result|
                                 (SPADCALL
                                  (SPADCALL
                                   (|REP2;irreducibilityTestInternal| |aG| |x|
                                    'NIL $)
                                   1 (QREFELT $ 60))
                                  NIL (QREFELT $ 69))
                                 . #3#))
                          ('T (LETT |result| 'NIL . #3#))))))
                  ('T
                   (SEQ
                    (SPADCALL "Random element in generated algebra does"
                              (QREFELT $ 54))
                    (EXIT
                     (SPADCALL "  not have a one-dimensional kernel"
                               (QREFELT $ 54))))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# |foundResult| . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL |foundResult|)
            (SEQ
             (SPADCALL "We have not found a one-dimensional kernel so far,"
                       (QREFELT $ 54))
             (EXIT
              (SPADCALL "  as we do a random search you could try again"
                        (QREFELT $ 54))))))
          (EXIT |result|)))) 

(SDEFUN |REP2;split;LVL;14|
        ((|algebraGenerators| |List| (|Matrix| R)) (|vector| |Vector| R)
         ($ |List| (|List| (|Matrix| R))))
        (|REP2;splitInternal| |algebraGenerators| |vector| 'T $)) 

(SDEFUN |REP2;split;LVL;15|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|submodule| |Vector| (|Vector| R)) ($ |List| (|List| (|Matrix| R))))
        (SPROG
         ((|factormoduleRepresentation| #1=(|List| (|Matrix| R)))
          (|submoduleRepresentation| #1#) (|helpMatrix| (|Matrix| R))
          (#2=#:G271 NIL) (|i| NIL) (|inverseTransitionMatrix| (|Matrix| R))
          (#3=#:G263 NIL) (|transitionMatrix| (|Matrix| R))
          (|factormoduleIndices| (|List| (|Integer|))) (#4=#:G270 NIL)
          (|submoduleIndices| (|List| (|Integer|))) (#5=#:G269 NIL)
          (|rankOfSubmodule| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (QVSIZE (SPADCALL |submodule| 1 (QREFELT $ 21)))
                . #6=(|REP2;split;LVL;15|))
          (LETT |rankOfSubmodule| (QVSIZE |submodule|) . #6#)
          (LETT |submoduleRepresentation| NIL . #6#)
          (LETT |factormoduleRepresentation| NIL . #6#)
          (LETT |submoduleIndices|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |i| 1 . #6#) G190
                      (COND ((|greater_SI| |i| |rankOfSubmodule|) (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS |i| #5#) . #6#)))
                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |factormoduleIndices|
                (PROGN
                 (LETT #4# NIL . #6#)
                 (SEQ (LETT |i| (+ 1 |rankOfSubmodule|) . #6#) G190
                      (COND ((> |i| |n|) (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS |i| #4#) . #6#)))
                      (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #6#)
          (LETT |transitionMatrix|
                (SPADCALL (SPADCALL |submodule| (QREFELT $ 30)) (QREFELT $ 48))
                . #6#)
          (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
          (LETT |inverseTransitionMatrix|
                (PROG2
                    (LETT #3# (SPADCALL |transitionMatrix| (QREFELT $ 56))
                          . #6#)
                    (QCDR #3#)
                  (|check_union| (QEQCAR #3# 0) (|Matrix| (QREFELT $ 6)) #3#))
                . #6#)
          (SPADCALL "  The inverse of the transition matrix computed"
                    (QREFELT $ 54))
          (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
          (SEQ (LETT |i| 1 . #6#)
               (LETT #2# (SPADCALL |algebraGenerators| (QREFELT $ 38)) . #6#)
               G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |helpMatrix|
                      (SPADCALL |inverseTransitionMatrix|
                                (SPADCALL |algebraGenerators| |i|
                                          (QREFELT $ 32))
                                (QREFELT $ 17))
                      . #6#)
                (LETT |submoduleRepresentation|
                      (CONS
                       (|REP2;blockMultiply| |helpMatrix| |transitionMatrix|
                        |submoduleIndices| |n| $)
                       |submoduleRepresentation|)
                      . #6#)
                (EXIT
                 (LETT |factormoduleRepresentation|
                       (CONS
                        (|REP2;blockMultiply| |helpMatrix| |transitionMatrix|
                         |factormoduleIndices| |n| $)
                        |factormoduleRepresentation|)
                       . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS (REVERSE |submoduleRepresentation|)
                 (SPADCALL (REVERSE |factormoduleRepresentation|)
                           (QREFELT $ 71))))))) 

(SDEFUN |REP2;my_min| ((|m| |Matrix| R) (|n| |Integer|) ($ |Smp|))
        (SPROG
         ((|xi| (|Smp|)) (|res| (|Smp|)) (#1=#:G288 NIL) (|i| NIL)
          (|x| (|Smp|)) (|j| (|Integer|)) (|depe| (|Matrix| R))
          (|depm| (|Matrix| R)) (#2=#:G287 NIL) (|v| #3=(|Vector| R))
          (#4=#:G286 NIL) (|depl| (|List| (|Vector| R))) (#5=#:G285 NIL)
          (|zz| #3#) (#6=#:G273 NIL))
         (SEQ
          (LETT |zz|
                (SPADCALL
                 (PROG1 (LETT #6# |n| . #7=(|REP2;my_min|))
                   (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
                 (QREFELT $ 74))
                . #7#)
          (LETT |v| |zz| . #7#)
          (SEQ G190
               (COND ((NULL (SPADCALL |v| |zz| (QREFELT $ 75))) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |v|
                       (SPADCALL
                        (PROGN
                         (LETT #5# NIL . #7#)
                         (SEQ (LETT |i| 1 . #7#) G190
                              (COND ((|greater_SI| |i| |n|) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5# (CONS (SPADCALL (QREFELT $ 76)) #5#)
                                      . #7#)))
                              (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        (QREFELT $ 77))
                       . #7#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |depl| (LIST |v|) . #7#)
          (SEQ (LETT |i| 1 . #7#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |v| (SPADCALL |m| |v| (QREFELT $ 39)) . #7#)
                    (EXIT (LETT |depl| (CONS |v| |depl|) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |depl| (REVERSE |depl|) . #7#)
          (LETT |depm|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #7#)
                  (SEQ (LETT |v| NIL . #7#) (LETT #2# |depl| . #7#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 78)) #4#)
                               . #7#)))
                       (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 14))
                . #7#)
          (LETT |depe|
                (SPADCALL (SPADCALL |depm| (QREFELT $ 48)) (QREFELT $ 37))
                . #7#)
          (LETT |j| 1 . #7#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |j| |n| (QREFELT $ 79))
                    (SPADCALL (QAREF2O |depe| |j| |j| 1 1)
                              (|spadConstant| $ 12) (QREFELT $ 80)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |j| (+ |j| 1) . #7#))) NIL (GO G190) G191
               (EXIT NIL))
          (LETT |res| (|spadConstant| $ 82) . #7#)
          (LETT |x| (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 83)) . #7#)
          (LETT |xi| (|spadConstant| $ 81) . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #1# (- |j| 1) . #7#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |depe| |i| |j| (QREFELT $ 9)) |xi|
                                 (QREFELT $ 84))
                                (QREFELT $ 85))
                      . #7#)
                (EXIT (LETT |xi| (SPADCALL |x| |xi| (QREFELT $ 86)) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |xi| |res| (QREFELT $ 87)))))) 

(SDEFUN |REP2;m_eval|
        ((|p| |Smp|) (|m| |Matrix| R) (|n| |Integer|) ($ |Matrix| R))
        (SPROG
         ((|old_deg| #1=(|NonNegativeInteger|)) (|res| (|Matrix| R))
          (#2=#:G298 NIL) (|i| NIL) (|ndeg| #1#) (|c0| (R)) (|id| (|Matrix| R))
          (#3=#:G296 NIL) (#4=#:G297 NIL) (|nn| (|NonNegativeInteger|))
          (#5=#:G289 NIL))
         (SEQ
          (LETT |nn|
                (PROG1 (LETT #5# |n| . #6=(|REP2;m_eval|))
                  (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                . #6#)
          (LETT |res| (SPADCALL |nn| |nn| (QREFELT $ 23)) . #6#)
          (LETT |id|
                (SPADCALL
                 (PROGN
                  (LETT #4# (GETREFV |n|) . #6#)
                  (SEQ (LETT |i| 1 . #6#) (LETT #3# 0 . #6#) G190
                       (COND ((|greater_SI| |i| |n|) (GO G191)))
                       (SEQ (EXIT (SETELT #4# #3# (|spadConstant| $ 15))))
                       (LETT #3#
                             (PROG1 (|inc_SI| #3#)
                               (LETT |i| (|inc_SI| |i|) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  #4#)
                 (QREFELT $ 88))
                . #6#)
          (LETT |old_deg| (SPADCALL |p| (QREFELT $ 89)) . #6#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 82) (QREFELT $ 90)))
                 (GO G191)))
               (SEQ (LETT |c0| (SPADCALL |p| (QREFELT $ 91)) . #6#)
                    (LETT |res|
                          (SPADCALL |res| (SPADCALL |c0| |id| (QREFELT $ 92))
                                    (QREFELT $ 16))
                          . #6#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 93)) . #6#)
                    (LETT |ndeg| (SPADCALL |p| (QREFELT $ 89)) . #6#)
                    (SEQ (LETT |i| 1 . #6#)
                         (LETT #2# (- |old_deg| |ndeg|) . #6#) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |m| |res| (QREFELT $ 17))
                                 . #6#)))
                         (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |old_deg| |ndeg| . #6#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |REP2;meatAxe1|
        ((|algebraGenerators| |List| (|Matrix| R)) (|x| |Matrix| R)
         (|n| |Integer|) (|m| |Integer|)
         ($ |Union| (|List| (|List| (|Matrix| R))) "failed"))
        (SPROG
         ((#1=#:G310 NIL) (|pres| (|List| (|List| (|Matrix| R))))
          (|v| (|Vector| R)) (|good| (|Boolean|))
          (|kernel| (|List| (|Vector| R))) (|xx| (|Matrix| R))
          (|mm| (|NonNegativeInteger|)) (|fpol| (|Smp|)) (#2=#:G311 NIL)
          (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |factor| |Smp|) (|:| |exponent| (|Integer|)))))
          (|mp| (|Smp|)))
         (SEQ
          (EXIT
           (SEQ (LETT |mp| (|REP2;my_min| |x| |n| $) . #3=(|REP2;meatAxe1|))
                (LETT |fl|
                      (SPADCALL (SPADCALL |mp| (QREFELT $ 96)) (QREFELT $ 99))
                      . #3#)
                (SEQ (LETT |fac| NIL . #3#) (LETT #2# |fl| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |fpol| (QCAR |fac|) . #3#)
                          (LETT |mm| (SPADCALL |fpol| (QREFELT $ 89)) . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL |mm| |m| (QREFELT $ 100)) "iterate")
                            ('T
                             (SEQ
                              (LETT |xx| (|REP2;m_eval| |fpol| |x| |n| $)
                                    . #3#)
                              (LETT |kernel| (SPADCALL |xx| (QREFELT $ 57))
                                    . #3#)
                              (LETT |good| (EQL (LENGTH |kernel|) |mm|) . #3#)
                              (LETT |v| (|SPADfirst| |kernel|) . #3#)
                              (LETT |pres|
                                    (SPADCALL |algebraGenerators| |v|
                                              (QREFELT $ 70))
                                    . #3#)
                              (COND
                               ((NULL (NULL (CDR |pres|)))
                                (PROGN
                                 (LETT #1# (CONS 0 |pres|) . #3#)
                                 (GO #4=#:G309))))
                              (EXIT
                               (COND
                                (|good|
                                 (SEQ
                                  (SPADCALL "Found good factor" (QREFELT $ 54))
                                  (EXIT
                                   (PROGN
                                    (LETT #1#
                                          (CONS 0
                                                (|REP2;irreducibilityTestInternal|
                                                 |algebraGenerators| |xx| 'T
                                                 $))
                                          . #3#)
                                    (GO #4#))))))))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (SPADCALL "All factors were bad" (QREFELT $ 54))
                (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |REP2;meatAxe;LB2IL;19|
        ((|algebraGenerators| |List| (|Matrix| R)) (|randomelements| |Boolean|)
         (|numberOfTries| |Integer|) (|maxTests| |Integer|)
         ($ |List| (|List| (|Matrix| R))))
        (SPROG
         ((|result| (|List| (|List| (|Matrix| R)))) (#1=#:G327 NIL) (|j| NIL)
          (|numberOfTests| (|Integer|))
          (|numberOfOneDimSubspacesInKernel| (|Integer|))
          (|kernel| (|List| (|Vector| R)))
          (|pp| (|Union| (|List| (|List| (|Matrix| R))) "failed"))
          (|n| (|NonNegativeInteger|)) (|x| (|Matrix| R))
          (|randomIndex| (|Integer|)) (|i| NIL) (|q| (|PositiveInteger|))
          (#2=#:G312 NIL) (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |numberOfGenerators| (LENGTH |algebraGenerators|)
                  . #3=(|REP2;meatAxe;LB2IL;19|))
            (LETT |result| NIL . #3#)
            (LETT |q|
                  (PROG1 (LETT #2# (SPADCALL (QREFELT $ 101)) . #3#)
                    (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                  . #3#)
            (COND
             (|randomelements|
              (SEQ
               (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
               (EXIT
                (LETT |x|
                      (SPADCALL |algebraGenerators| |randomIndex|
                                (QREFELT $ 32))
                      . #3#)))))
            (SEQ (LETT |i| 1 . #3#) G190
                 (COND ((|greater_SI| |i| |numberOfTries|) (GO G191)))
                 (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T . #3#)))
                      (COND
                       (|randomelements|
                        (SEQ
                         (LETT |randomIndex|
                               (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
                         (LETT |x|
                               (SPADCALL |x|
                                         (SPADCALL |algebraGenerators|
                                                   |randomIndex|
                                                   (QREFELT $ 32))
                                         (QREFELT $ 17))
                               . #3#)
                         (LETT |randomIndex|
                               (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
                         (EXIT
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL |algebraGenerators|
                                                    |randomIndex|
                                                    (QREFELT $ 32))
                                          (QREFELT $ 16))
                                . #3#))))
                       ('T
                        (LETT |x|
                              (|REP2;fingerPrint| |i|
                               (SPADCALL |algebraGenerators| 1 (QREFELT $ 32))
                               (SPADCALL |algebraGenerators| 2 (QREFELT $ 32))
                               |x| $)
                              . #3#)))
                      (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 44))) . #3#)
                      (COND
                       ((OR (SPADCALL |q| 2 (QREFELT $ 105))
                            (OR (SPADCALL |i| (QREFELT $ 106))
                                (SPADCALL |i| 15 (QREFELT $ 107))))
                        (EXIT
                         (SEQ
                          (LETT |pp|
                                (|REP2;meatAxe1| |algebraGenerators| |x| |n|
                                 (EXPT 2 |i|) $)
                                . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |pp| 0)
                             (PROGN
                              (LETT #1# (QCDR |pp|) . #3#)
                              (GO #4=#:G326)))))))))
                      (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)) . #3#)
                      (EXIT
                       (COND
                        ((NULL |kernel|)
                         (COND
                          (|randomelements|
                           (SPADCALL
                            "Random element in generated algebra is non-singular"
                            (QREFELT $ 54)))
                          ('T
                           (SPADCALL
                            "Fingerprint element in generated algebra is non-singular"
                            (QREFELT $ 54)))))
                        ('T
                         (SEQ
                          (COND
                           (|randomelements|
                            (SPADCALL
                             "Random element in generated algebra is singular"
                             (QREFELT $ 54)))
                           ('T
                            (SPADCALL
                             "Fingerprint element in generated algebra is singular"
                             (QREFELT $ 54))))
                          (LETT |numberOfOneDimSubspacesInKernel|
                                (QUOTIENT2 (- (EXPT |q| (LENGTH |kernel|)) 1)
                                           (- |q| 1))
                                . #3#)
                          (LETT |numberOfTests|
                                (MIN |numberOfOneDimSubspacesInKernel|
                                     |maxTests|)
                                . #3#)
                          (EXIT
                           (SEQ (LETT |j| 1 . #3#) G190
                                (COND
                                 ((|greater_SI| |j| |numberOfTests|)
                                  (GO G191)))
                                (SEQ
                                 (LETT |result|
                                       (SPADCALL |algebraGenerators|
                                                 (SPADCALL |kernel| |j|
                                                           (QREFELT $ 108))
                                                 (QREFELT $ 70))
                                       . #3#)
                                 (EXIT
                                  (COND
                                   ((NULL (CDR |result|))
                                    (COND
                                     ((SPADCALL (+ |j| 1)
                                                |numberOfOneDimSubspacesInKernel|
                                                (QREFELT $ 100))
                                      (PROGN
                                       (LETT #1#
                                             (|REP2;irreducibilityTestInternal|
                                              |algebraGenerators| |x| 'T $)
                                             . #3#)
                                       (GO #4#)))))
                                   ('T
                                    (PROGN
                                     (LETT #1# |result| . #3#)
                                     (GO #4#))))))
                                (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                                (EXIT NIL))))))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (LETT |result| (LIST NIL NIL) . #3#) (SPADCALL " " (QREFELT $ 54))
            (SPADCALL "Sorry, no result, try meatAxe(...,true)" (QREFELT $ 54))
            (SPADCALL "  or consider using an extension field." (QREFELT $ 54))
            (EXIT |result|)))
          #4# (EXIT #1#)))) 

(SDEFUN |REP2;meatAxe;LL;20|
        ((|algebraGenerators| |List| (|Matrix| R))
         ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| 'NIL 25 7 (QREFELT $ 109))) 

(SDEFUN |REP2;meatAxe;LBL;21|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|randomElements?| |Boolean|) ($ |List| (|List| (|Matrix| R))))
        (COND
         (|randomElements?|
          (SPADCALL |algebraGenerators| 'T 25 7 (QREFELT $ 109)))
         ('T (SPADCALL |algebraGenerators| 'NIL 6 7 (QREFELT $ 109))))) 

(SDEFUN |REP2;meatAxe;LPiL;22|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|numberOfTries| |PositiveInteger|) ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| 'T |numberOfTries| 7 (QREFELT $ 109))) 

(SDEFUN |REP2;scanOneDimSubspaces;LIV;23|
        ((|basis| |List| (|Vector| R)) (|n| |Integer|) ($ |Vector| R))
        (SPROG
         ((|j| NIL) (|newAdd| (|Vector| R)) (#1=#:G342 NIL) (|i| (|Integer|))
          (|result| #2=(|Vector| R)) (#3=#:G333 NIL) (#4=#:G341 NIL)
          (|iR| (|List| (|Integer|))) (|coefficients| #2#)
          (|nred| #5=(|Integer|)) (|pos| #5#) (#6=#:G340 NIL)
          (|q| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dim| (LENGTH |basis|)
                . #7=(|REP2;scanOneDimSubspaces;LIV;23|))
          (LETT |nn| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 65))) . #7#)
          (LETT |q| (SPADCALL (QREFELT $ 101)) . #7#)
          (LETT |nred| (REM |n| (QUOTIENT2 (- (EXPT |q| |dim|) 1) (- |q| 1)))
                . #7#)
          (LETT |pos| |nred| . #7#) (LETT |i| 0 . #7#)
          (SEQ (LETT |i| 0 . #7#) (LETT #6# (- |dim| 1) . #7#) G190
               (COND
                ((OR (|greater_SI| |i| #6#) (NULL (>= |nred| 0))) (GO G191)))
               (SEQ (LETT |pos| |nred| . #7#)
                    (EXIT (LETT |nred| (- |nred| (EXPT |q| |i|)) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |i| (COND ((EQL |i| 0) 0) ('T (- |i| 1))) . #7#)
          (LETT |coefficients| (MAKEARR1 |dim| (|spadConstant| $ 12)) . #7#)
          (SPADCALL |coefficients| (- |dim| |i|) (|spadConstant| $ 15)
                    (QREFELT $ 113))
          (LETT |iR|
                (SPADCALL
                 (SPADCALL |pos|
                           (|compiledLookupCheck| '|coerce|
                                                  (LIST '$ (LIST '|Integer|))
                                                  (|RadixExpansion| |q|)))
                 (|compiledLookupCheck| '|wholeRagits|
                                        (LIST (LIST '|List| (LIST '|Integer|))
                                              '$)
                                        (|RadixExpansion| |q|)))
                . #7#)
          (SEQ (LETT |j| 1 . #7#)
               (LETT #4# (SPADCALL |iR| (QREFELT $ 115)) . #7#) G190
               (COND ((|greater_SI| |j| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |coefficients| (+ (- |dim| (LENGTH |iR|)) |j|)
                           (SPADCALL
                            (PROG1
                                (LETT #3#
                                      (+ (SPADCALL |iR| |j| (QREFELT $ 116))
                                         |q|)
                                      . #7#)
                              (|check_subtype| (> #3# 0) '(|PositiveInteger|)
                                               #3#))
                            (QREFELT $ 117))
                           (QREFELT $ 113))))
               (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |result| (MAKEARR1 |nn| (|spadConstant| $ 12)) . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #1# (QVSIZE |coefficients|) . #7#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |newAdd|
                      (SPADCALL (SPADCALL |coefficients| |i| (QREFELT $ 27))
                                (SPADCALL |basis| |i| (QREFELT $ 65))
                                (QREFELT $ 118))
                      . #7#)
                (EXIT
                 (SEQ (LETT |j| 1 . #7#) G190
                      (COND ((|greater_SI| |j| |nn|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |result| |j|
                                  (SPADCALL
                                   (SPADCALL |result| |j| (QREFELT $ 27))
                                   (SPADCALL |newAdd| |j| (QREFELT $ 27))
                                   (QREFELT $ 11))
                                  (QREFELT $ 113))))
                      (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(DECLAIM (NOTINLINE |RepresentationPackage2;|)) 

(DEFUN |RepresentationPackage2| (#1=#:G344)
  (SPROG NIL
         (PROG (#2=#:G345)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RepresentationPackage2|)
                                               '|domainEqualList|)
                    . #3=(|RepresentationPackage2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RepresentationPackage2;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RepresentationPackage2|)))))))))) 

(DEFUN |RepresentationPackage2;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G343 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|RepresentationPackage2|))
          (LETT |dv$| (LIST '|RepresentationPackage2| DV$1) . #2#)
          (LETT $ (GETREFV 119) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Field|))
                                                    . #2#)
                                              (AND #1#
                                                   (|HasCategory| |#1|
                                                                  '(|Finite|)))
                                              (|HasCategory| |#1|
                                                             '(|EuclideanDomain|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|RepresentationPackage2| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 47
                       (CONS (|dispatchFunction| |REP2;cyclicSubmodule;LVV;5|)
                             $))
             (QSETREFV $ 49
                       (CONS
                        (|dispatchFunction|
                         |REP2;standardBasisOfCyclicSubmodule;LVM;6|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 63
                       (CONS (|dispatchFunction| |REP2;areEquivalent?;2LM;9|)
                             $))
             (QSETREFV $ 64
                       (CONS (|dispatchFunction| |REP2;areEquivalent?;2LIM;10|)
                             $))
             (QSETREFV $ 62
                       (CONS
                        (|dispatchFunction| |REP2;areEquivalent?;2LBIM;11|) $))
             (QSETREFV $ 68
                       (CONS
                        (|dispatchFunction|
                         |REP2;isAbsolutelyIrreducible?;LB;12|)
                        $))
             (QSETREFV $ 67
                       (CONS
                        (|dispatchFunction|
                         |REP2;isAbsolutelyIrreducible?;LIB;13|)
                        $))
             (QSETREFV $ 70 (CONS (|dispatchFunction| |REP2;split;LVL;14|) $))
             (QSETREFV $ 72 (CONS (|dispatchFunction| |REP2;split;LVL;15|) $))
             (COND
              ((|HasCategory| |#1| '(|FiniteFieldCategory|))
               (PROGN
                (QSETREFV $ 73 (|SparseUnivariatePolynomial| |#1|))
                (QSETREFV $ 109
                          (CONS (|dispatchFunction| |REP2;meatAxe;LB2IL;19|)
                                $))
                (QSETREFV $ 110
                          (CONS (|dispatchFunction| |REP2;meatAxe;LL;20|) $))
                (QSETREFV $ 111
                          (CONS (|dispatchFunction| |REP2;meatAxe;LBL;21|) $))
                (QSETREFV $ 112
                          (CONS (|dispatchFunction| |REP2;meatAxe;LPiL;22|) $))
                (QSETREFV $ 108
                          (CONS
                           (|dispatchFunction|
                            |REP2;scanOneDimSubspaces;LIV;23|)
                           $))))))))
          $))) 

(MAKEPROP '|RepresentationPackage2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|Matrix| 6)
              (0 . |elt|) (7 . *) (13 . +) (19 . |Zero|) (|List| 34)
              (23 . |matrix|) (28 . |One|) (32 . +) (38 . *) (44 . -)
              (|Vector| 6) (|Vector| 19) (50 . |elt|) (|NonNegativeInteger|)
              (56 . |zero|) (62 . |setRow!|) (|Boolean|) (69 . <=) (75 . |elt|)
              (81 . =) (87 . |setelt!|) |REP2;completeEchelonBasis;VM;3|
              (|List| 8) (95 . |elt|) |REP2;createRandomElement;L2M;4|
              (|List| 6) (101 . |entries|) (106 . |list|) (111 . |rowEchelon|)
              (116 . |maxIndex|) (121 . *) (127 . |vertConcat|) (133 . |rank|)
              (138 . ~=) (144 . |maxRowIndex|) (149 . |row|) (|List| 19)
              (155 . |vector|) (160 . |cyclicSubmodule|) (166 . |transpose|)
              (171 . |standardBasisOfCyclicSubmodule|) (177 . ~=) (|Void|)
              (|String|) (|OutputForm|) (183 . |messagePrint|)
              (|Union| $ '"failed") (188 . |inverse|) (193 . |nullSpace|)
              (|List| 31) (198 . |maxIndex|) (203 . |elt|) (209 . |setelt!|)
              (216 . |areEquivalent?|) (224 . |areEquivalent?|)
              (230 . |areEquivalent?|) (237 . |elt|) (243 . ~=)
              (249 . |isAbsolutelyIrreducible?|)
              (255 . |isAbsolutelyIrreducible?|) (260 . ~=) (266 . |split|)
              (272 . |list|) (277 . |split|) '|Smp| (283 . |zero|) (288 . =)
              (294 . |random|) (298 . |vector|) (303 . |parts|) (308 . <=)
              (314 . ~=) (320 . |One|) (324 . |Zero|) (328 . |monomial|)
              (334 . *) (340 . -) (346 . *) (352 . +) (358 . |diagonalMatrix|)
              (363 . |degree|) (368 . ~=) (374 . |leadingCoefficient|)
              (379 . *) (385 . |reductum|) (|Factored| 73)
              (|DistinctDegreeFactorize| 6 73) (390 . |factor|)
              (|Record| (|:| |factor| 73) (|:| |exponent| 7)) (|List| 97)
              (395 . |factors|) (400 . >) (406 . |size|)
              (|SparseUnivariatePolynomial| 6) (410 . |One|)
              (|PositiveInteger|) (414 . >) (420 . |even?|) (425 . >)
              (431 . |scanOneDimSubspaces|) (437 . |meatAxe|) (445 . |meatAxe|)
              (450 . |meatAxe|) (456 . |meatAxe|) (462 . |setelt!|) (|List| 7)
              (469 . |maxIndex|) (474 . |elt|) (480 . |index|) (485 . *))
           '#(|standardBasisOfCyclicSubmodule| 491 |split| 497
              |scanOneDimSubspaces| 509 |meatAxe| 515
              |isAbsolutelyIrreducible?| 540 |cyclicSubmodule| 551
              |createRandomElement| 557 |completeEchelonBasis| 563
              |areEquivalent?| 568)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 118
                                                 '(3 8 6 0 7 7 9 2 6 0 0 0 10 2
                                                   6 0 0 0 11 0 6 0 12 1 8 0 13
                                                   14 0 6 0 15 2 8 0 0 0 16 2 8
                                                   0 0 0 17 2 8 0 0 0 18 2 20
                                                   19 0 7 21 2 8 0 22 22 23 3 8
                                                   0 0 7 19 24 2 22 25 0 0 26 2
                                                   19 6 0 7 27 2 6 25 0 0 28 4
                                                   8 6 0 7 7 6 29 2 31 8 0 7 32
                                                   1 19 34 0 35 1 13 0 34 36 1
                                                   8 0 0 37 1 31 7 0 38 2 8 19
                                                   0 19 39 2 8 0 0 0 40 1 8 22
                                                   0 41 2 22 25 0 0 42 1 8 7 0
                                                   43 2 8 19 0 7 44 1 20 0 45
                                                   46 2 0 20 31 19 47 1 8 0 0
                                                   48 2 0 8 31 19 49 2 7 25 0 0
                                                   50 1 53 51 52 54 1 8 55 0 56
                                                   1 8 45 0 57 1 58 7 0 59 2 58
                                                   31 0 7 60 3 31 8 0 7 8 61 4
                                                   0 8 31 31 25 7 62 2 0 8 31
                                                   31 63 3 0 8 31 31 7 64 2 45
                                                   19 0 7 65 2 8 25 0 0 66 2 0
                                                   25 31 7 67 1 0 25 31 68 2 31
                                                   25 0 0 69 2 0 58 31 19 70 1
                                                   58 0 31 71 2 0 58 31 20 72 1
                                                   19 0 22 74 2 19 25 0 0 75 0
                                                   6 0 76 1 19 0 34 77 1 19 34
                                                   0 78 2 7 25 0 0 79 2 6 25 0
                                                   0 80 0 73 0 81 0 73 0 82 2
                                                   73 0 6 22 83 2 73 0 6 0 84 2
                                                   73 0 0 0 85 2 73 0 0 0 86 2
                                                   73 0 0 0 87 1 8 0 19 88 1 73
                                                   22 0 89 2 73 25 0 0 90 1 73
                                                   6 0 91 2 8 0 6 0 92 1 73 0 0
                                                   93 1 95 94 73 96 1 94 98 0
                                                   99 2 7 25 0 0 100 0 6 22 101
                                                   0 102 0 103 2 104 25 0 0 105
                                                   1 7 25 0 106 2 22 25 0 0 107
                                                   2 0 19 45 7 108 4 0 58 31 25
                                                   7 7 109 1 0 58 31 110 2 0 58
                                                   31 25 111 2 0 58 31 104 112
                                                   3 19 6 0 7 6 113 1 114 7 0
                                                   115 2 114 7 0 7 116 1 6 0
                                                   104 117 2 19 0 6 0 118 2 3 8
                                                   31 19 49 2 1 58 31 19 70 2 1
                                                   58 31 20 72 2 2 19 45 7 108
                                                   4 2 58 31 25 7 7 109 2 2 58
                                                   31 25 111 1 2 58 31 110 2 2
                                                   58 31 104 112 2 1 25 31 7 67
                                                   1 1 25 31 68 2 3 20 31 19 47
                                                   2 0 8 31 8 33 1 0 8 20 30 2
                                                   1 8 31 31 63 4 1 8 31 31 25
                                                   7 62 3 1 8 31 31 7 64)))))
           '|lookupComplete|)) 
