
(SDEFUN |REP2;blockMultiply|
        ((|a| |Matrix| R) (|b| |Matrix| R) (|li| |List| (|Integer|))
         (|n| |Integer|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G124 NIL) (#2=#:G123 (R)) (#3=#:G125 (R)) (#4=#:G133 NIL)
          (|s| NIL) (#5=#:G132 NIL) (|j| NIL) (#6=#:G131 NIL) (#7=#:G130 NIL)
          (|i| NIL) (#8=#:G129 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #8# NIL . #9=(|REP2;blockMultiply|))
            (SEQ (LETT |i| NIL . #9#) (LETT #7# |li| . #9#) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #8#
                         (CONS
                          (PROGN
                           (LETT #6# NIL . #9#)
                           (SEQ (LETT |j| NIL . #9#) (LETT #5# |li| . #9#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |j| (CAR #5#) . #9#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (PROGN
                                          (LETT #1# NIL . #9#)
                                          (SEQ (LETT |s| 1 . #9#)
                                               (LETT #4# |n| . #9#) G190
                                               (COND
                                                ((|greater_SI| |s| #4#)
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
                                                        . #9#)
                                                  (COND
                                                   (#1#
                                                    (LETT #2#
                                                          (SPADCALL #2# #3#
                                                                    (QREFELT $
                                                                             11))
                                                          . #9#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #2# #3# . #9#)
                                                     (LETT #1# 'T . #9#)))))))
                                               (LETT |s| (|inc_SI| |s|) . #9#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#1# #2#)
                                                ('T (|spadConstant| $ 12))))
                                         #6#)
                                        . #9#)))
                                (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          #8#)
                         . #9#)))
                 (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                 (EXIT (NREVERSE #8#))))
           (QREFELT $ 14))))) 

(SDEFUN |REP2;fingerPrint|
        ((|i| |NonNegativeInteger|) (|a| |Matrix| R) (|b| |Matrix| R)
         (|x| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G149 NIL) (#2=#:G147 NIL) (#3=#:G145 NIL) (#4=#:G143 NIL)
          (#5=#:G141 NIL) (#6=#:G139 NIL))
         (SEQ
          (COND
           ((EQL
             (PROG1 (LETT #6# |i| . #7=(|REP2;fingerPrint|))
               (|check_subtype2| (> #6# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #6#))
             1)
            (LETT |x|
                  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 16))
                            (SPADCALL |a| |b| (QREFELT $ 17)) (QREFELT $ 16))
                  . #7#))
           ((EQL
             (PROG1 (LETT #5# |i| . #7#)
               (|check_subtype2| (> #5# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #5#))
             2)
            (LETT |x|
                  (SPADCALL
                   (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17))
                             (QREFELT $ 16))
                   |b| (QREFELT $ 17))
                  . #7#))
           ((EQL
             (PROG1 (LETT #4# |i| . #7#)
               (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #4#))
             3)
            (LETT |x|
                  (SPADCALL |a| (SPADCALL |b| |x| (QREFELT $ 17))
                            (QREFELT $ 16))
                  . #7#))
           ((EQL
             (PROG1 (LETT #3# |i| . #7#)
               (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #3#))
             4)
            (LETT |x| (SPADCALL |x| |b| (QREFELT $ 16)) . #7#))
           ((EQL
             (PROG1 (LETT #2# |i| . #7#)
               (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #2#))
             5)
            (LETT |x|
                  (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17))
                            (QREFELT $ 16))
                  . #7#))
           ((EQL
             (PROG1 (LETT #1# |i| . #7#)
               (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #1#))
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
         ((#1=#:G164 NIL) (|j| NIL) (|newStart| #2=(|NonNegativeInteger|))
          (|indexOfVectorToBeScanned| #2#) (|row| #3=(|NonNegativeInteger|))
          (#4=#:G163 NIL) (|completedBasis| (|Matrix| R)) (#5=#:G162 NIL)
          (|i| NIL) (|n| (|NonNegativeInteger|)) (|dimensionOfSubmodule| #3#))
         (SEQ
          (LETT |dimensionOfSubmodule| (QVSIZE |basis|)
                . #6=(|REP2;completeEchelonBasis;VM;3|))
          (LETT |n| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 21))) . #6#)
          (LETT |indexOfVectorToBeScanned| 1 . #6#)
          (LETT |row| |dimensionOfSubmodule| . #6#)
          (LETT |completedBasis| (SPADCALL |n| |n| (QREFELT $ 23)) . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #5# |dimensionOfSubmodule| . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |completedBasis|
                       (SPADCALL |completedBasis| |i|
                                 (SPADCALL |basis| |i| (QREFELT $ 21))
                                 (QREFELT $ 24))
                       . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL (QVSIZE |basis|) |n| (QREFELT $ 26))
            (SEQ (LETT |newStart| 1 . #6#)
                 (SEQ (LETT |j| 1 . #6#) (LETT #4# |n| . #6#) G190
                      (COND
                       ((OR (|greater_SI| |j| #4#)
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
                          (EXIT (LETT |row| (+ |row| 1) . #6#))))
                        ('T
                         (LETT |indexOfVectorToBeScanned|
                               (+ |indexOfVectorToBeScanned| 1) . #6#)))
                       (EXIT (LETT |newStart| (+ |j| 1) . #6#)))
                      (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (SEQ (LETT |j| |newStart| . #6#) (LETT #1# |n| . #6#) G190
                       (COND ((> |j| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |completedBasis| |j| |j|
                                   (|spadConstant| $ 15) (QREFELT $ 29))))
                       (LETT |j| (+ |j| 1) . #6#) (GO G190) G191
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
         ((#1=#:G180 NIL) (|i| NIL) (#2=#:G179 NIL)
          (|furtherElts| (|List| (|Vector| R)))
          (|updateFurtherElts| (|List| (|Vector| R))) (#3=#:G178 NIL)
          (#4=#:G177 NIL) (|basis| (|Matrix| R)) (|addedToBasis| (|Matrix| R))
          (|nextVector| (|Matrix| R)) (|w| (|Vector| R)) (#5=#:G176 NIL)
          (#6=#:G175 NIL))
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
                  (COND ((NULL |furtherElts|) NIL)
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
          (|updateFurtherElts| (|List| (|Vector| R))) (#1=#:G191 NIL) (|i| NIL)
          (#2=#:G190 NIL) (|basis| (|Matrix| R))
          (|standardBasis| (|List| (|List| R))) (|addedToBasis| (|Matrix| R))
          (|nextVector| (|Matrix| R)) (|w| (|Vector| R)) (#3=#:G189 NIL)
          (#4=#:G188 NIL) (|dim| (|NonNegativeInteger|)))
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
                  (COND ((NULL |furtherElts|) NIL)
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
          (#2=#:G208 NIL) (|i| NIL) (|inverseTransitionMatrix| (|Matrix| R))
          (#3=#:G195 NIL) (|transitionMatrix| (|Matrix| R))
          (|factormoduleIndices| (|List| (|Integer|))) (#4=#:G207 NIL)
          (#5=#:G206 NIL) (|submoduleIndices| (|List| (|Integer|)))
          (#6=#:G205 NIL) (#7=#:G204 NIL) (|rankOfSubmodule| (|Integer|))
          (|submodule| (|Vector| (|Vector| R))) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |vector|) . #8=(|REP2;splitInternal|))
              (LETT |submodule|
                    (SPADCALL |algebraGenerators| |vector| (QREFELT $ 47))
                    . #8#)
              (LETT |rankOfSubmodule| (QVSIZE |submodule|) . #8#)
              (LETT |submoduleRepresentation| NIL . #8#)
              (LETT |factormoduleRepresentation| NIL . #8#)
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
                            (LETT #7# NIL . #8#)
                            (SEQ (LETT |i| 1 . #8#)
                                 (LETT #6# |rankOfSubmodule| . #8#) G190
                                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                                 (SEQ (EXIT (LETT #7# (CONS |i| #7#) . #8#)))
                                 (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                                 (EXIT (NREVERSE #7#))))
                           . #8#)
                     (LETT |factormoduleIndices|
                           (PROGN
                            (LETT #5# NIL . #8#)
                            (SEQ (LETT |i| (+ 1 |rankOfSubmodule|) . #8#)
                                 (LETT #4# |n| . #8#) G190
                                 (COND ((> |i| #4#) (GO G191)))
                                 (SEQ (EXIT (LETT #5# (CONS |i| #5#) . #8#)))
                                 (LETT |i| (+ |i| 1) . #8#) (GO G190) G191
                                 (EXIT (NREVERSE #5#))))
                           . #8#)
                     (LETT |transitionMatrix|
                           (SPADCALL (SPADCALL |submodule| (QREFELT $ 30))
                                     (QREFELT $ 48))
                           . #8#)
                     (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
                     (LETT |inverseTransitionMatrix|
                           (PROG2
                               (LETT #3#
                                     (SPADCALL |transitionMatrix|
                                               (QREFELT $ 56))
                                     . #8#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0)
                                             (|Matrix| (QREFELT $ 6))
                                             (|Union| (|Matrix| (QREFELT $ 6))
                                                      "failed")
                                             #3#))
                           . #8#)
                     (SPADCALL
                      "  The inverse of the transition matrix computed"
                      (QREFELT $ 54))
                     (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
                     (EXIT
                      (SEQ (LETT |i| 1 . #8#)
                           (LETT #2#
                                 (SPADCALL |algebraGenerators| (QREFELT $ 38))
                                 . #8#)
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (LETT |helpMatrix|
                                  (SPADCALL |inverseTransitionMatrix|
                                            (SPADCALL |algebraGenerators| |i|
                                                      (QREFELT $ 32))
                                            (QREFELT $ 17))
                                  . #8#)
                            (LETT |submoduleRepresentation|
                                  (CONS
                                   (|REP2;blockMultiply| |helpMatrix|
                                    |transitionMatrix| |submoduleIndices| |n|
                                    $)
                                   |submoduleRepresentation|)
                                  . #8#)
                            (EXIT
                             (LETT |factormoduleRepresentation|
                                   (CONS
                                    (|REP2;blockMultiply| |helpMatrix|
                                     |transitionMatrix| |factormoduleIndices|
                                     |n| $)
                                    |factormoduleRepresentation|)
                                   . #8#)))
                           (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
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
         ((#1=#:G213 NIL) (|mat| (|Matrix| R)) (#2=#:G225 NIL) (|j| NIL)
          (#3=#:G224 NIL) (|i| NIL) (|result| (|List| (|List| (|Matrix| R))))
          (|kernel| (|List| (|Vector| R))) (|xt| (|Matrix| R))
          (|algebraGeneratorsTranspose| (|List| (|Matrix| R))) (#4=#:G223 NIL)
          (#5=#:G222 NIL))
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
                                         (|check_union2| (QEQCAR #1# 0)
                                                         (|Matrix|
                                                          (QREFELT $ 6))
                                                         (|Union|
                                                          (|Matrix|
                                                           (QREFELT $ 6))
                                                          "failed")
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
         ((|transitionM| (|Matrix| R)) (|result| #1=(|Boolean|))
          (#2=#:G257 NIL) (|j| NIL) (|foundResult| #1#) (#3=#:G238 NIL)
          (|baseChange1| #4=(|Matrix| R)) (|baseChange0| #4#)
          (|kernel1| #5=(|List| (|Vector| R))) (|kernel0| #5#)
          (|rk1| #6=(|NonNegativeInteger|)) (|rk0| #6#) (|x1| #7=(|Matrix| R))
          (|x0| #7#) (|randomIndex| (|Integer|)) (#8=#:G255 NIL) (|i| NIL)
          (#9=#:G256 NIL) (|n| (|NonNegativeInteger|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |result| NIL . #10=(|REP2;areEquivalent?;2LBIM;11|))
              (LETT |transitionM| (SPADCALL 1 1 (QREFELT $ 23)) . #10#)
              (LETT |numberOfGenerators| (LENGTH |aG0|) . #10#)
              (COND
               (|randomelements|
                (SEQ
                 (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                       . #10#)
                 (LETT |x0| (SPADCALL |aG0| |randomIndex| (QREFELT $ 32))
                       . #10#)
                 (EXIT
                  (LETT |x1| (SPADCALL |aG1| |randomIndex| (QREFELT $ 32))
                        . #10#)))))
              (LETT |n| (QVSIZE (SPADCALL |x0| 1 (QREFELT $ 44))) . #10#)
              (LETT |foundResult| NIL . #10#)
              (SEQ (LETT #9# NIL . #10#) (LETT |i| 1 . #10#)
                   (LETT #8# |numberOfTries| . #10#) G190
                   (COND ((OR (|greater_SI| |i| #8#) #9#) (GO G191)))
                   (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T . #10#)))
                        (COND
                         (|randomelements|
                          (SEQ
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)) . #10#)
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 17))
                                 . #10#)
                           (LETT |x1|
                                 (SPADCALL |x1|
                                           (SPADCALL |aG1| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 17))
                                 . #10#)
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)) . #10#)
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 16))
                                 . #10#)
                           (EXIT
                            (LETT |x1|
                                  (SPADCALL |x1|
                                            (SPADCALL |aG1| |randomIndex|
                                                      (QREFELT $ 32))
                                            (QREFELT $ 16))
                                  . #10#))))
                         ('T
                          (SEQ
                           (LETT |x0|
                                 (|REP2;fingerPrint| |i|
                                  (SPADCALL |aG0| 0 (QREFELT $ 32))
                                  (SPADCALL |aG0| 1 (QREFELT $ 32)) |x0| $)
                                 . #10#)
                           (EXIT
                            (LETT |x1|
                                  (|REP2;fingerPrint| |i|
                                   (SPADCALL |aG1| 0 (QREFELT $ 32))
                                   (SPADCALL |aG1| 1 (QREFELT $ 32)) |x1| $)
                                  . #10#)))))
                        (LETT |rk0| (SPADCALL |x0| (QREFELT $ 41)) . #10#)
                        (LETT |rk1| (SPADCALL |x1| (QREFELT $ 41)) . #10#)
                        (EXIT
                         (COND
                          ((SPADCALL |rk0| |rk1| (QREFELT $ 42))
                           (SEQ
                            (SPADCALL "Dimensions of kernels differ"
                                      (QREFELT $ 54))
                            (LETT |foundResult| 'T . #10#)
                            (EXIT (LETT |result| NIL . #10#))))
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
                                  . #10#)
                            (LETT |kernel1| (SPADCALL |x1| (QREFELT $ 57))
                                  . #10#)
                            (LETT |baseChange0|
                                  (SPADCALL |aG0|
                                            (SPADCALL |kernel0| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 49))
                                  . #10#)
                            (LETT |baseChange1|
                                  (SPADCALL |aG1|
                                            (SPADCALL |kernel1| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 49))
                                  . #10#)
                            (EXIT
                             (COND
                              ((SPADCALL (ANCOLS |baseChange0|)
                                         (ANCOLS |baseChange1|) (QREFELT $ 42))
                               (SEQ
                                (SPADCALL
                                 "  Dimensions of generated cyclic submodules differ"
                                 (QREFELT $ 54))
                                (LETT |foundResult| 'T . #10#)
                                (EXIT (LETT |result| NIL . #10#))))
                              ((EQL (ANCOLS |baseChange0|) |n|)
                               (SEQ
                                (LETT |transitionM|
                                      (SPADCALL |baseChange0|
                                                (PROG2
                                                    (LETT #3#
                                                          (SPADCALL
                                                           |baseChange1|
                                                           (QREFELT $ 56))
                                                          . #10#)
                                                    (QCDR #3#)
                                                  (|check_union2|
                                                   (QEQCAR #3# 0)
                                                   (|Matrix| (QREFELT $ 6))
                                                   (|Union|
                                                    (|Matrix| (QREFELT $ 6))
                                                    "failed")
                                                   #3#))
                                                (QREFELT $ 17))
                                      . #10#)
                                (LETT |foundResult| 'T . #10#)
                                (LETT |result| 'T . #10#)
                                (EXIT
                                 (SEQ (LETT |j| 1 . #10#)
                                      (LETT #2# |numberOfGenerators| . #10#)
                                      G190
                                      (COND
                                       ((OR (|greater_SI| |j| #2#)
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
                                          (SEQ (LETT |result| NIL . #10#)
                                               (LETT |transitionM|
                                                     (SPADCALL 1 1
                                                               (QREFELT $ 23))
                                                     . #10#)
                                               (SPADCALL
                                                "  There is no isomorphism, as the only possible one"
                                                (QREFELT $ 54))
                                               (EXIT
                                                (SPADCALL
                                                 "    fails to do the necessary base change"
                                                 (QREFELT $ 54))))))))
                                      (LETT |j| (|inc_SI| |j|) . #10#)
                                      (GO G190) G191 (EXIT NIL)))))
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
                         (PROG1 (|inc_SI| |i|) (LETT #9# |foundResult| . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (COND
               (|foundResult|
                (COND
                 (|result|
                  (SEQ (SPADCALL " " (QREFELT $ 54))
                       (EXIT
                        (SPADCALL "Representations are equivalent."
                                  (QREFELT $ 54)))))
                 (#11='T
                  (SEQ (SPADCALL " " (QREFELT $ 54))
                       (EXIT
                        (SPADCALL "Representations are not equivalent."
                                  (QREFELT $ 54)))))))
               (#11#
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
          (|randomIndex| (|Integer|)) (#2=#:G266 NIL) (|i| NIL) (#3=#:G267 NIL)
          (|n| (|NonNegativeInteger|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |result| NIL . #4=(|REP2;isAbsolutelyIrreducible?;LIB;13|))
              (LETT |numberOfGenerators| (LENGTH |aG|) . #4#)
              (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #4#)
              (LETT |x| (SPADCALL |aG| |randomIndex| (QREFELT $ 32)) . #4#)
              (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 44))) . #4#)
              (LETT |foundResult| NIL . #4#)
              (SEQ (LETT #3# NIL . #4#) (LETT |i| 1 . #4#)
                   (LETT #2# |numberOfTries| . #4#) G190
                   (COND ((OR (|greater_SI| |i| #2#) #3#) (GO G191)))
                   (SEQ
                    (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                          . #4#)
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL |aG| |randomIndex|
                                              (QREFELT $ 32))
                                    (QREFELT $ 17))
                          . #4#)
                    (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                          . #4#)
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL |aG| |randomIndex|
                                              (QREFELT $ 32))
                                    (QREFELT $ 16))
                          . #4#)
                    (LETT |rk| (SPADCALL |x| (QREFELT $ 41)) . #4#)
                    (EXIT
                     (COND
                      ((EQL |rk| (- |n| 1))
                       (SEQ (LETT |foundResult| 'T . #4#)
                            (SPADCALL "Random element in generated algebra has"
                                      (QREFELT $ 54))
                            (SPADCALL "  one-dimensional kernel"
                                      (QREFELT $ 54))
                            (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)) . #4#)
                            (EXIT
                             (COND
                              ((EQL |n|
                                    (QVSIZE
                                     (SPADCALL |aG| (|SPADfirst| |kernel|)
                                               (QREFELT $ 47))))
                               (LETT |result|
                                     (SPADCALL
                                      (SPADCALL
                                       (|REP2;irreducibilityTestInternal| |aG|
                                        |x| NIL $)
                                       1 (QREFELT $ 60))
                                      NIL (QREFELT $ 69))
                                     . #4#))
                              ('T (LETT |result| NIL . #4#))))))
                      ('T
                       (SEQ
                        (SPADCALL "Random element in generated algebra does"
                                  (QREFELT $ 54))
                        (EXIT
                         (SPADCALL "  not have a one-dimensional kernel"
                                   (QREFELT $ 54))))))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|) (LETT #3# |foundResult| . #4#))
                         . #4#)
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
          (#2=#:G282 NIL) (|i| NIL) (|inverseTransitionMatrix| (|Matrix| R))
          (#3=#:G272 NIL) (|transitionMatrix| (|Matrix| R))
          (|factormoduleIndices| (|List| (|Integer|))) (#4=#:G281 NIL)
          (#5=#:G280 NIL) (|submoduleIndices| (|List| (|Integer|)))
          (#6=#:G279 NIL) (#7=#:G278 NIL) (|rankOfSubmodule| (|Integer|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (QVSIZE (SPADCALL |submodule| 1 (QREFELT $ 21)))
                . #8=(|REP2;split;LVL;15|))
          (LETT |rankOfSubmodule| (QVSIZE |submodule|) . #8#)
          (LETT |submoduleRepresentation| NIL . #8#)
          (LETT |factormoduleRepresentation| NIL . #8#)
          (LETT |submoduleIndices|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |i| 1 . #8#) (LETT #6# |rankOfSubmodule| . #8#)
                      G190 (COND ((|greater_SI| |i| #6#) (GO G191)))
                      (SEQ (EXIT (LETT #7# (CONS |i| #7#) . #8#)))
                      (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |factormoduleIndices|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |i| (+ 1 |rankOfSubmodule|) . #8#)
                      (LETT #4# |n| . #8#) G190 (COND ((> |i| #4#) (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS |i| #5#) . #8#)))
                      (LETT |i| (+ |i| 1) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #8#)
          (LETT |transitionMatrix|
                (SPADCALL (SPADCALL |submodule| (QREFELT $ 30)) (QREFELT $ 48))
                . #8#)
          (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
          (LETT |inverseTransitionMatrix|
                (PROG2
                    (LETT #3# (SPADCALL |transitionMatrix| (QREFELT $ 56))
                          . #8#)
                    (QCDR #3#)
                  (|check_union2| (QEQCAR #3# 0) (|Matrix| (QREFELT $ 6))
                                  (|Union| (|Matrix| (QREFELT $ 6)) "failed")
                                  #3#))
                . #8#)
          (SPADCALL "  The inverse of the transition matrix computed"
                    (QREFELT $ 54))
          (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
          (SEQ (LETT |i| 1 . #8#)
               (LETT #2# (SPADCALL |algebraGenerators| (QREFELT $ 38)) . #8#)
               G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |helpMatrix|
                      (SPADCALL |inverseTransitionMatrix|
                                (SPADCALL |algebraGenerators| |i|
                                          (QREFELT $ 32))
                                (QREFELT $ 17))
                      . #8#)
                (LETT |submoduleRepresentation|
                      (CONS
                       (|REP2;blockMultiply| |helpMatrix| |transitionMatrix|
                        |submoduleIndices| |n| $)
                       |submoduleRepresentation|)
                      . #8#)
                (EXIT
                 (LETT |factormoduleRepresentation|
                       (CONS
                        (|REP2;blockMultiply| |helpMatrix| |transitionMatrix|
                         |factormoduleIndices| |n| $)
                        |factormoduleRepresentation|)
                       . #8#)))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS (REVERSE |submoduleRepresentation|)
                 (SPADCALL (REVERSE |factormoduleRepresentation|)
                           (QREFELT $ 71))))))) 

(SDEFUN |REP2;my_min| ((|m| |Matrix| R) (|n| |Integer|) ($ |Smp|))
        (SPROG
         ((|xi| (|Smp|)) (|res| (|Smp|)) (#1=#:G301 NIL) (|i| NIL)
          (|x| (|Smp|)) (|j| (|Integer|)) (|depe| (|Matrix| R))
          (|depm| (|Matrix| R)) (#2=#:G300 NIL) (|v| #3=(|Vector| R))
          (#4=#:G299 NIL) (|depl| (|List| (|Vector| R))) (#5=#:G298 NIL)
          (#6=#:G297 NIL) (#7=#:G296 NIL) (|zz| #3#) (#8=#:G284 NIL))
         (SEQ
          (LETT |zz|
                (SPADCALL
                 (PROG1 (LETT #8# |n| . #9=(|REP2;my_min|))
                   (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #8#))
                 (QREFELT $ 74))
                . #9#)
          (LETT |v| |zz| . #9#)
          (SEQ G190
               (COND ((NULL (SPADCALL |v| |zz| (QREFELT $ 75))) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |v|
                       (SPADCALL
                        (PROGN
                         (LETT #7# NIL . #9#)
                         (SEQ (LETT |i| 1 . #9#) (LETT #6# |n| . #9#) G190
                              (COND ((|greater_SI| |i| #6#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7# (CONS (SPADCALL (QREFELT $ 76)) #7#)
                                      . #9#)))
                              (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #7#))))
                        (QREFELT $ 77))
                       . #9#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |depl| (LIST |v|) . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT #5# |n| . #9#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |v| (SPADCALL |m| |v| (QREFELT $ 39)) . #9#)
                    (EXIT (LETT |depl| (CONS |v| |depl|) . #9#)))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |depl| (REVERSE |depl|) . #9#)
          (LETT |depm|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #9#)
                  (SEQ (LETT |v| NIL . #9#) (LETT #2# |depl| . #9#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 78)) #4#)
                               . #9#)))
                       (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 14))
                . #9#)
          (LETT |depe|
                (SPADCALL (SPADCALL |depm| (QREFELT $ 48)) (QREFELT $ 37))
                . #9#)
          (LETT |j| 1 . #9#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |j| |n| (QREFELT $ 79))
                    (SPADCALL (QAREF2O |depe| |j| |j| 1 1)
                              (|spadConstant| $ 12) (QREFELT $ 80)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |j| (+ |j| 1) . #9#))) NIL (GO G190) G191
               (EXIT NIL))
          (LETT |res| (|spadConstant| $ 82) . #9#)
          (LETT |x| (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 83)) . #9#)
          (LETT |xi| (|spadConstant| $ 81) . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT #1# (- |j| 1) . #9#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |depe| |i| |j| (QREFELT $ 9)) |xi|
                                 (QREFELT $ 84))
                                (QREFELT $ 85))
                      . #9#)
                (EXIT (LETT |xi| (SPADCALL |x| |xi| (QREFELT $ 86)) . #9#)))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |xi| |res| (QREFELT $ 87)))))) 

(SDEFUN |REP2;m_eval|
        ((|p| |Smp|) (|m| |Matrix| R) (|n| |Integer|) ($ |Matrix| R))
        (SPROG
         ((|old_deg| #1=(|NonNegativeInteger|)) (|res| (|Matrix| R))
          (#2=#:G312 NIL) (|i| NIL) (|ndeg| #1#) (|c0| (R)) (|id| (|Matrix| R))
          (#3=#:G309 NIL) (#4=#:G311 NIL) (#5=#:G310 NIL)
          (|nn| (|NonNegativeInteger|)) (#6=#:G302 NIL))
         (SEQ
          (LETT |nn|
                (PROG1 (LETT #6# |n| . #7=(|REP2;m_eval|))
                  (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #6#))
                . #7#)
          (LETT |res| (SPADCALL |nn| |nn| (QREFELT $ 23)) . #7#)
          (LETT |id|
                (SPADCALL
                 (PROGN
                  (LETT #5# (GETREFV |n|) . #7#)
                  (SEQ (LETT |i| 1 . #7#) (LETT #4# |n| . #7#)
                       (LETT #3# 0 . #7#) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ (EXIT (SETELT #5# #3# (|spadConstant| $ 15))))
                       (LETT #3#
                             (PROG1 (|inc_SI| #3#)
                               (LETT |i| (|inc_SI| |i|) . #7#))
                             . #7#)
                       (GO G190) G191 (EXIT NIL))
                  #5#)
                 (QREFELT $ 88))
                . #7#)
          (LETT |old_deg| (SPADCALL |p| (QREFELT $ 89)) . #7#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 82) (QREFELT $ 90)))
                 (GO G191)))
               (SEQ (LETT |c0| (SPADCALL |p| (QREFELT $ 91)) . #7#)
                    (LETT |res|
                          (SPADCALL |res| (SPADCALL |c0| |id| (QREFELT $ 92))
                                    (QREFELT $ 16))
                          . #7#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 93)) . #7#)
                    (LETT |ndeg| (SPADCALL |p| (QREFELT $ 89)) . #7#)
                    (SEQ (LETT |i| 1 . #7#)
                         (LETT #2# (- |old_deg| |ndeg|) . #7#) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |m| |res| (QREFELT $ 17))
                                 . #7#)))
                         (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |old_deg| |ndeg| . #7#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |REP2;meatAxe1|
        ((|algebraGenerators| |List| (|Matrix| R)) (|x| |Matrix| R)
         (|n| |Integer|) (|m| |Integer|)
         ($ |Union| (|List| (|List| (|Matrix| R))) "failed"))
        (SPROG
         ((#1=#:G324 NIL) (|pres| (|List| (|List| (|Matrix| R))))
          (|v| (|Vector| R)) (|good| (|Boolean|))
          (|kernel| (|List| (|Vector| R))) (|xx| (|Matrix| R))
          (|mm| (|NonNegativeInteger|)) (|fpol| (|Smp|)) (#2=#:G325 NIL)
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
                                 (GO #4=#:G323))))
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
         ((|result| (|List| (|List| (|Matrix| R)))) (#1=#:G341 NIL)
          (#2=#:G343 NIL) (|j| NIL) (|numberOfTests| (|Integer|))
          (|numberOfOneDimSubspacesInKernel| (|Integer|))
          (|kernel| (|List| (|Vector| R)))
          (|pp| (|Union| (|List| (|List| (|Matrix| R))) "failed"))
          (|n| (|NonNegativeInteger|)) (|x| (|Matrix| R))
          (|randomIndex| (|Integer|)) (#3=#:G342 NIL) (|i| NIL)
          (|q| (|PositiveInteger|)) (#4=#:G326 NIL)
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |numberOfGenerators| (LENGTH |algebraGenerators|)
                  . #5=(|REP2;meatAxe;LB2IL;19|))
            (LETT |result| NIL . #5#)
            (LETT |q|
                  (PROG1 (LETT #4# (SPADCALL (QREFELT $ 101)) . #5#)
                    (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                      '(|NonNegativeInteger|) #4#))
                  . #5#)
            (COND
             (|randomelements|
              (SEQ
               (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #5#)
               (EXIT
                (LETT |x|
                      (SPADCALL |algebraGenerators| |randomIndex|
                                (QREFELT $ 32))
                      . #5#)))))
            (SEQ (LETT |i| 1 . #5#) (LETT #3# |numberOfTries| . #5#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T . #5#)))
                      (COND
                       (|randomelements|
                        (SEQ
                         (LETT |randomIndex|
                               (+ 1 (RANDOM |numberOfGenerators|)) . #5#)
                         (LETT |x|
                               (SPADCALL |x|
                                         (SPADCALL |algebraGenerators|
                                                   |randomIndex|
                                                   (QREFELT $ 32))
                                         (QREFELT $ 17))
                               . #5#)
                         (LETT |randomIndex|
                               (+ 1 (RANDOM |numberOfGenerators|)) . #5#)
                         (EXIT
                          (LETT |x|
                                (SPADCALL |x|
                                          (SPADCALL |algebraGenerators|
                                                    |randomIndex|
                                                    (QREFELT $ 32))
                                          (QREFELT $ 16))
                                . #5#))))
                       ('T
                        (LETT |x|
                              (|REP2;fingerPrint| |i|
                               (SPADCALL |algebraGenerators| 1 (QREFELT $ 32))
                               (SPADCALL |algebraGenerators| 2 (QREFELT $ 32))
                               |x| $)
                              . #5#)))
                      (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 44))) . #5#)
                      (COND
                       ((OR (SPADCALL |q| 2 (QREFELT $ 103))
                            (OR (SPADCALL |i| (QREFELT $ 104))
                                (SPADCALL |i| 15 (QREFELT $ 105))))
                        (EXIT
                         (SEQ
                          (LETT |pp|
                                (|REP2;meatAxe1| |algebraGenerators| |x| |n|
                                 (EXPT 2 |i|) $)
                                . #5#)
                          (EXIT
                           (COND
                            ((QEQCAR |pp| 0)
                             (PROGN
                              (LETT #1# (QCDR |pp|) . #5#)
                              (GO #6=#:G340)))))))))
                      (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)) . #5#)
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
                                . #5#)
                          (LETT |numberOfTests|
                                (MIN |numberOfOneDimSubspacesInKernel|
                                     |maxTests|)
                                . #5#)
                          (EXIT
                           (SEQ (LETT |j| 1 . #5#)
                                (LETT #2# |numberOfTests| . #5#) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (LETT |result|
                                       (SPADCALL |algebraGenerators|
                                                 (SPADCALL |kernel| |j|
                                                           (QREFELT $ 106))
                                                 (QREFELT $ 70))
                                       . #5#)
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
                                             . #5#)
                                       (GO #6#)))))
                                   ('T
                                    (PROGN
                                     (LETT #1# |result| . #5#)
                                     (GO #6#))))))
                                (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                                (EXIT NIL))))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (LETT |result| (LIST NIL NIL) . #5#) (SPADCALL " " (QREFELT $ 54))
            (SPADCALL "Sorry, no result, try meatAxe(...,true)" (QREFELT $ 54))
            (SPADCALL "  or consider using an extension field." (QREFELT $ 54))
            (EXIT |result|)))
          #6# (EXIT #1#)))) 

(SDEFUN |REP2;meatAxe;LL;20|
        ((|algebraGenerators| |List| (|Matrix| R))
         ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| NIL 25 7 (QREFELT $ 107))) 

(SDEFUN |REP2;meatAxe;LBL;21|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|randomElements?| |Boolean|) ($ |List| (|List| (|Matrix| R))))
        (COND
         (|randomElements?|
          (SPADCALL |algebraGenerators| 'T 25 7 (QREFELT $ 107)))
         ('T (SPADCALL |algebraGenerators| NIL 6 7 (QREFELT $ 107))))) 

(SDEFUN |REP2;meatAxe;LPiL;22|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|numberOfTries| |PositiveInteger|) ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| 'T |numberOfTries| 7 (QREFELT $ 107))) 

(SDEFUN |REP2;scanOneDimSubspaces;LIV;23|
        ((|basis| |List| (|Vector| R)) (|n| |Integer|) ($ |Vector| R))
        (SPROG
         ((#1=#:G359 NIL) (|j| NIL) (|newAdd| (|Vector| R)) (#2=#:G358 NIL)
          (|i| (|Integer|)) (|result| #3=(|Vector| R)) (#4=#:G349 NIL)
          (#5=#:G357 NIL) (|iR| (|List| (|Integer|))) (|coefficients| #3#)
          (|nred| #6=(|Integer|)) (|pos| #6#) (#7=#:G356 NIL)
          (|q| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dim| (LENGTH |basis|)
                . #8=(|REP2;scanOneDimSubspaces;LIV;23|))
          (LETT |nn| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 65))) . #8#)
          (LETT |q| (SPADCALL (QREFELT $ 101)) . #8#)
          (LETT |nred| (REM |n| (QUOTIENT2 (- (EXPT |q| |dim|) 1) (- |q| 1)))
                . #8#)
          (LETT |pos| |nred| . #8#) (LETT |i| 0 . #8#)
          (SEQ (LETT |i| 0 . #8#) (LETT #7# (- |dim| 1) . #8#) G190
               (COND
                ((OR (|greater_SI| |i| #7#) (NULL (>= |nred| 0))) (GO G191)))
               (SEQ (LETT |pos| |nred| . #8#)
                    (EXIT (LETT |nred| (- |nred| (EXPT |q| |i|)) . #8#)))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT |i| (COND ((EQL |i| 0) 0) ('T (- |i| 1))) . #8#)
          (LETT |coefficients| (MAKEARR1 |dim| (|spadConstant| $ 12)) . #8#)
          (SPADCALL |coefficients| (- |dim| |i|) (|spadConstant| $ 15)
                    (QREFELT $ 111))
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
                . #8#)
          (SEQ (LETT |j| 1 . #8#)
               (LETT #5# (SPADCALL |iR| (QREFELT $ 113)) . #8#) G190
               (COND ((|greater_SI| |j| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |coefficients| (+ (- |dim| (LENGTH |iR|)) |j|)
                           (SPADCALL
                            (PROG1
                                (LETT #4#
                                      (+ (SPADCALL |iR| |j| (QREFELT $ 114))
                                         |q|)
                                      . #8#)
                              (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                                '(|Integer|) #4#))
                            (QREFELT $ 115))
                           (QREFELT $ 111))))
               (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191 (EXIT NIL))
          (LETT |result| (MAKEARR1 |nn| (|spadConstant| $ 12)) . #8#)
          (SEQ (LETT |i| 1 . #8#) (LETT #2# (QVSIZE |coefficients|) . #8#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |newAdd|
                      (SPADCALL (SPADCALL |coefficients| |i| (QREFELT $ 27))
                                (SPADCALL |basis| |i| (QREFELT $ 65))
                                (QREFELT $ 116))
                      . #8#)
                (EXIT
                 (SEQ (LETT |j| 1 . #8#) (LETT #1# |nn| . #8#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |result| |j|
                                  (SPADCALL
                                   (SPADCALL |result| |j| (QREFELT $ 27))
                                   (SPADCALL |newAdd| |j| (QREFELT $ 27))
                                   (QREFELT $ 11))
                                  (QREFELT $ 111))))
                      (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(DECLAIM (NOTINLINE |RepresentationPackage2;|)) 

(DEFUN |RepresentationPackage2| (#1=#:G361)
  (SPROG NIL
         (PROG (#2=#:G362)
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
  (SPROG ((|pv$| NIL) (#1=#:G360 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|RepresentationPackage2|))
          (LETT |dv$| (LIST '|RepresentationPackage2| DV$1) . #2#)
          (LETT $ (GETREFV 117) . #2#)
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
                (QSETREFV $ 107
                          (CONS (|dispatchFunction| |REP2;meatAxe;LB2IL;19|)
                                $))
                (QSETREFV $ 108
                          (CONS (|dispatchFunction| |REP2;meatAxe;LL;20|) $))
                (QSETREFV $ 109
                          (CONS (|dispatchFunction| |REP2;meatAxe;LBL;21|) $))
                (QSETREFV $ 110
                          (CONS (|dispatchFunction| |REP2;meatAxe;LPiL;22|) $))
                (QSETREFV $ 106
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
              (395 . |factors|) (400 . >) (406 . |size|) (|PositiveInteger|)
              (410 . >) (416 . |even?|) (421 . >) (427 . |scanOneDimSubspaces|)
              (433 . |meatAxe|) (441 . |meatAxe|) (446 . |meatAxe|)
              (452 . |meatAxe|) (458 . |setelt!|) (|List| 7) (465 . |maxIndex|)
              (470 . |elt|) (476 . |index|) (481 . *))
           '#(|standardBasisOfCyclicSubmodule| 487 |split| 493
              |scanOneDimSubspaces| 505 |meatAxe| 511
              |isAbsolutelyIrreducible?| 536 |cyclicSubmodule| 547
              |createRandomElement| 553 |completeEchelonBasis| 559
              |areEquivalent?| 564)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 116
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
                                                   2 102 25 0 0 103 1 7 25 0
                                                   104 2 22 25 0 0 105 2 0 19
                                                   45 7 106 4 0 58 31 25 7 7
                                                   107 1 0 58 31 108 2 0 58 31
                                                   25 109 2 0 58 31 102 110 3
                                                   19 6 0 7 6 111 1 112 7 0 113
                                                   2 112 7 0 7 114 1 6 0 102
                                                   115 2 19 0 6 0 116 2 3 8 31
                                                   19 49 2 1 58 31 19 70 2 1 58
                                                   31 20 72 2 2 19 45 7 106 4 2
                                                   58 31 25 7 7 107 2 2 58 31
                                                   25 109 1 2 58 31 108 2 2 58
                                                   31 102 110 2 1 25 31 7 67 1
                                                   1 25 31 68 2 3 20 31 19 47 2
                                                   0 8 31 8 33 1 0 8 20 30 2 1
                                                   8 31 31 63 4 1 8 31 31 25 7
                                                   62 3 1 8 31 31 7 64)))))
           '|lookupComplete|)) 
