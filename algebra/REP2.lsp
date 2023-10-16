
(SDEFUN |REP2;blockMultiply|
        ((|a| |Matrix| R) (|b| |Matrix| R) (|li| |List| (|Integer|))
         (|n| |Integer|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G127 NIL) (#2=#:G126 (R)) (#3=#:G128 (R)) (#4=#:G136 NIL)
          (|s| NIL) (#5=#:G135 NIL) (|j| NIL) (#6=#:G134 NIL) (#7=#:G133 NIL)
          (|i| NIL) (#8=#:G132 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #8# NIL)
            (SEQ (LETT |i| NIL) (LETT #7# |li|) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #8#
                         (CONS
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |j| NIL) (LETT #5# |li|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |j| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (PROGN
                                          (LETT #1# NIL)
                                          (SEQ (LETT |s| 1) (LETT #4# |n|) G190
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
                                                         (QREFELT $ 10)))
                                                  (COND
                                                   (#1#
                                                    (LETT #2#
                                                          (SPADCALL #2# #3#
                                                                    (QREFELT $
                                                                             11))))
                                                   ('T
                                                    (PROGN
                                                     (LETT #2# #3#)
                                                     (LETT #1# 'T)))))))
                                               (LETT |s| (|inc_SI| |s|))
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#1# #2#)
                                                ('T (|spadConstant| $ 12))))
                                         #6#))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          #8#))))
                 (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT (NREVERSE #8#))))
           (QREFELT $ 14))))) 

(SDEFUN |REP2;fingerPrint|
        ((|i| |NonNegativeInteger|) (|a| |Matrix| R) (|b| |Matrix| R)
         (|x| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((#1=#:G152 NIL) (#2=#:G150 NIL) (#3=#:G148 NIL) (#4=#:G146 NIL)
          (#5=#:G144 NIL) (#6=#:G142 NIL))
         (SEQ
          (COND
           ((EQL
             (PROG1 (LETT #6# |i|)
               (|check_subtype2| (> #6# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #6#))
             1)
            (LETT |x|
                  (SPADCALL (SPADCALL |a| |b| (QREFELT $ 16))
                            (SPADCALL |a| |b| (QREFELT $ 17)) (QREFELT $ 16))))
           ((EQL
             (PROG1 (LETT #5# |i|)
               (|check_subtype2| (> #5# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #5#))
             2)
            (LETT |x|
                  (SPADCALL
                   (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17))
                             (QREFELT $ 16))
                   |b| (QREFELT $ 17))))
           ((EQL
             (PROG1 (LETT #4# |i|)
               (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #4#))
             3)
            (LETT |x|
                  (SPADCALL |a| (SPADCALL |b| |x| (QREFELT $ 17))
                            (QREFELT $ 16))))
           ((EQL
             (PROG1 (LETT #3# |i|)
               (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #3#))
             4)
            (LETT |x| (SPADCALL |x| |b| (QREFELT $ 16))))
           ((EQL
             (PROG1 (LETT #2# |i|)
               (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #2#))
             5)
            (LETT |x|
                  (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17))
                            (QREFELT $ 16))))
           ((EQL
             (PROG1 (LETT #1# |i|)
               (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                 '(|NonNegativeInteger|) #1#))
             6)
            (LETT |x|
                  (SPADCALL (SPADCALL |x| |a| (QREFELT $ 18))
                            (SPADCALL |b| |a| (QREFELT $ 17)) (QREFELT $ 16))))
           ('T
            (SEQ (|error| "Sorry, but there are only 6 fingerprints!")
                 (EXIT |x|))))))) 

(SDEFUN |REP2;completeEchelonBasis;VM;3|
        ((|basis| |Vector| (|Vector| R)) ($ |Matrix| R))
        (SPROG
         ((#1=#:G167 NIL) (|j| NIL) (|newStart| #2=(|NonNegativeInteger|))
          (|indexOfVectorToBeScanned| #2#) (|row| #3=(|NonNegativeInteger|))
          (#4=#:G166 NIL) (|completedBasis| (|Matrix| R)) (#5=#:G165 NIL)
          (|i| NIL) (|n| (|NonNegativeInteger|)) (|dimensionOfSubmodule| #3#))
         (SEQ (LETT |dimensionOfSubmodule| (QVSIZE |basis|))
              (LETT |n| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 21))))
              (LETT |indexOfVectorToBeScanned| 1)
              (LETT |row| |dimensionOfSubmodule|)
              (LETT |completedBasis| (SPADCALL |n| |n| (QREFELT $ 23)))
              (SEQ (LETT |i| 1) (LETT #5# |dimensionOfSubmodule|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |completedBasis|
                           (SPADCALL |completedBasis| |i|
                                     (SPADCALL |basis| |i| (QREFELT $ 21))
                                     (QREFELT $ 24)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (COND
               ((<= (QVSIZE |basis|) |n|)
                (SEQ (LETT |newStart| 1)
                     (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                          (COND
                           ((OR (|greater_SI| |j| #4#)
                                (NULL
                                 (<= |indexOfVectorToBeScanned|
                                     |dimensionOfSubmodule|)))
                            (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL |basis| |indexOfVectorToBeScanned|
                                         (QREFELT $ 21))
                               |j| (QREFELT $ 25))
                              (|spadConstant| $ 12) (QREFELT $ 27))
                             (SEQ
                              (SPADCALL |completedBasis| (+ 1 |row|) |j|
                                        (|spadConstant| $ 15) (QREFELT $ 28))
                              (EXIT (LETT |row| (+ |row| 1)))))
                            ('T
                             (LETT |indexOfVectorToBeScanned|
                                   (+ |indexOfVectorToBeScanned| 1))))
                           (EXIT (LETT |newStart| (+ |j| 1))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (SEQ (LETT |j| |newStart|) (LETT #1# |n|) G190
                           (COND ((> |j| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |completedBasis| |j| |j|
                                       (|spadConstant| $ 15) (QREFELT $ 28))))
                           (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))))
              (EXIT |completedBasis|)))) 

(SDEFUN |REP2;createRandomElement;L2M;4|
        ((|aG| |List| (|Matrix| R)) (|algElt| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((|randomIndex| (|Integer|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |numberOfGenerators| (LENGTH |aG|))
              (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
              (LETT |algElt|
                    (SPADCALL |algElt|
                              (SPADCALL |aG| |randomIndex| (QREFELT $ 31))
                              (QREFELT $ 17)))
              (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
              (EXIT
               (SPADCALL |algElt| (SPADCALL |aG| |randomIndex| (QREFELT $ 31))
                         (QREFELT $ 16)))))) 

(SDEFUN |REP2;cyclicSubmodule;LVV;5|
        ((|lm| |List| (|Matrix| R)) (|v| |Vector| R) ($ |Vector| (|Vector| R)))
        (SPROG
         ((#1=#:G184 NIL) (|i| NIL) (#2=#:G183 NIL)
          (|furtherElts| (|List| (|Vector| R)))
          (|updateFurtherElts| (|List| (|Vector| R))) (#3=#:G182 NIL)
          (#4=#:G181 NIL) (|basis| (|Matrix| R)) (|addedToBasis| (|Matrix| R))
          (|nextVector| (|Matrix| R)) (|w| (|Vector| R)) (#5=#:G180 NIL)
          (#6=#:G179 NIL))
         (SEQ
          (LETT |basis|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |v| (QREFELT $ 34)) (QREFELT $ 35))
                  (QREFELT $ 14))
                 (QREFELT $ 36)))
          (LETT |furtherElts|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (SPADCALL |lm| (QREFELT $ 37)))
                      G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 31)) |v|
                                         (QREFELT $ 38))
                               #6#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |furtherElts|) NIL)
                        ('T (< (ANROWS |basis|) (QVSIZE |v|)))))
                 (GO G191)))
               (SEQ (LETT |w| (|SPADfirst| |furtherElts|))
                    (LETT |nextVector|
                          (SPADCALL
                           (SPADCALL (SPADCALL |w| (QREFELT $ 34))
                                     (QREFELT $ 35))
                           (QREFELT $ 14)))
                    (LETT |addedToBasis|
                          (SPADCALL |basis| |nextVector| (QREFELT $ 39)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 40))
                                 (ANROWS |basis|) (QREFELT $ 41))
                       (SEQ
                        (LETT |basis| (SPADCALL |addedToBasis| (QREFELT $ 36)))
                        (LETT |updateFurtherElts|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |i| 1)
                                    (LETT #3# (SPADCALL |lm| (QREFELT $ 37)))
                                    G190
                                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |lm| |i|
                                                        (QREFELT $ 31))
                                              |w| (QREFELT $ 38))
                                             #4#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #4#)))))
                        (EXIT
                         (LETT |furtherElts|
                               (SPADCALL (CDR |furtherElts|)
                                         |updateFurtherElts|
                                         (QREFELT $ 43))))))
                      ('T (LETT |furtherElts| (CDR |furtherElts|))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |basis| (QREFELT $ 44)))
                  G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS (SPADCALL |basis| |i| (QREFELT $ 45)) #2#))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 46)))))) 

(SDEFUN |REP2;standardBasisOfCyclicSubmodule;LVM;6|
        ((|lm| |List| (|Matrix| R)) (|v| |Vector| R) ($ |Matrix| R))
        (SPROG
         ((|furtherElts| (|List| (|Vector| R)))
          (|updateFurtherElts| (|List| (|Vector| R))) (#1=#:G196 NIL) (|i| NIL)
          (#2=#:G195 NIL) (|basis| (|Matrix| R))
          (|standardBasis| (|List| (|List| R))) (|addedToBasis| (|Matrix| R))
          (|nextVector| (|Matrix| R)) (|w| (|Vector| R)) (#3=#:G194 NIL)
          (#4=#:G193 NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (QVSIZE |v|))
              (LETT |standardBasis|
                    (SPADCALL (SPADCALL |v| (QREFELT $ 34)) (QREFELT $ 35)))
              (LETT |basis|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |v| (QREFELT $ 34)) (QREFELT $ 35))
                      (QREFELT $ 14))
                     (QREFELT $ 36)))
              (LETT |furtherElts|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |i| 1)
                          (LETT #3# (SPADCALL |lm| (QREFELT $ 37))) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 31))
                                             |v| (QREFELT $ 38))
                                   #4#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((NULL |furtherElts|) NIL)
                            ('T (< (ANROWS |basis|) (QVSIZE |v|)))))
                     (GO G191)))
                   (SEQ (LETT |w| (|SPADfirst| |furtherElts|))
                        (LETT |nextVector|
                              (SPADCALL
                               (SPADCALL (SPADCALL |w| (QREFELT $ 34))
                                         (QREFELT $ 35))
                               (QREFELT $ 14)))
                        (LETT |addedToBasis|
                              (SPADCALL |basis| |nextVector| (QREFELT $ 39)))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 40))
                                     (ANROWS |basis|) (QREFELT $ 41))
                           (SEQ
                            (LETT |standardBasis|
                                  (CONS (SPADCALL |w| (QREFELT $ 34))
                                        |standardBasis|))
                            (LETT |basis|
                                  (SPADCALL |addedToBasis| (QREFELT $ 36)))
                            (LETT |updateFurtherElts|
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |i| 1)
                                        (LETT #1#
                                              (SPADCALL |lm| (QREFELT $ 37)))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |lm| |i|
                                                            (QREFELT $ 31))
                                                  |w| (QREFELT $ 38))
                                                 #2#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #2#)))))
                            (EXIT
                             (LETT |furtherElts|
                                   (SPADCALL (CDR |furtherElts|)
                                             |updateFurtherElts|
                                             (QREFELT $ 43))))))
                          ('T (LETT |furtherElts| (CDR |furtherElts|))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |standardBasis| (QREFELT $ 14))
                         (QREFELT $ 48)))))) 

(SDEFUN |REP2;splitInternal|
        ((|algebraGenerators| |List| (|Matrix| R)) (|vector| |Vector| R)
         (|doSplitting?| |Boolean|) ($ |List| (|List| (|Matrix| R))))
        (SPROG
         ((|factormoduleRepresentation| (|List| (|Matrix| R)))
          (|submoduleRepresentation| (|List| (|Matrix| R)))
          (|helpMatrix| (|Matrix| R)) (#1=#:G213 NIL) (|i| NIL)
          (|inverseTransitionMatrix| (|Matrix| R)) (#2=#:G200 NIL)
          (|transitionMatrix| (|Matrix| R))
          (|factormoduleIndices| (|List| (|Integer|))) (#3=#:G212 NIL)
          (#4=#:G211 NIL) (|submoduleIndices| (|List| (|Integer|)))
          (#5=#:G210 NIL) (#6=#:G209 NIL) (|rankOfSubmodule| (|Integer|))
          (|submodule| (|Vector| (|Vector| R))) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |vector|))
              (LETT |submodule|
                    (SPADCALL |algebraGenerators| |vector| (QREFELT $ 47)))
              (LETT |rankOfSubmodule| (QVSIZE |submodule|))
              (LETT |submoduleRepresentation| NIL)
              (LETT |factormoduleRepresentation| NIL)
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
                            (LETT #6# NIL)
                            (SEQ (LETT |i| 1) (LETT #5# |rankOfSubmodule|) G190
                                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                                 (SEQ (EXIT (LETT #6# (CONS |i| #6#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #6#)))))
                     (LETT |factormoduleIndices|
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |i| (+ 1 |rankOfSubmodule|))
                                 (LETT #3# |n|) G190
                                 (COND ((> |i| #3#) (GO G191)))
                                 (SEQ (EXIT (LETT #4# (CONS |i| #4#))))
                                 (LETT |i| (+ |i| 1)) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))
                     (LETT |transitionMatrix|
                           (SPADCALL (SPADCALL |submodule| (QREFELT $ 29))
                                     (QREFELT $ 48)))
                     (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
                     (LETT |inverseTransitionMatrix|
                           (PROG2
                               (LETT #2#
                                     (SPADCALL |transitionMatrix|
                                               (QREFELT $ 56)))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Matrix| (QREFELT $ 6))
                                             (|Union| (|Matrix| (QREFELT $ 6))
                                                      "failed")
                                             #2#)))
                     (SPADCALL
                      "  The inverse of the transition matrix computed"
                      (QREFELT $ 54))
                     (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
                     (EXIT
                      (SEQ (LETT |i| 1)
                           (LETT #1#
                                 (SPADCALL |algebraGenerators| (QREFELT $ 37)))
                           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (LETT |helpMatrix|
                                  (SPADCALL |inverseTransitionMatrix|
                                            (SPADCALL |algebraGenerators| |i|
                                                      (QREFELT $ 31))
                                            (QREFELT $ 17)))
                            (LETT |submoduleRepresentation|
                                  (CONS
                                   (|REP2;blockMultiply| |helpMatrix|
                                    |transitionMatrix| |submoduleIndices| |n|
                                    $)
                                   |submoduleRepresentation|))
                            (EXIT
                             (LETT |factormoduleRepresentation|
                                   (CONS
                                    (|REP2;blockMultiply| |helpMatrix|
                                     |transitionMatrix| |factormoduleIndices|
                                     |n| $)
                                    |factormoduleRepresentation|))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
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
         ((#1=#:G218 NIL) (|mat| (|Matrix| R)) (#2=#:G230 NIL) (|j| NIL)
          (#3=#:G229 NIL) (|i| NIL) (|result| (|List| (|List| (|Matrix| R))))
          (|kernel| (|List| (|Vector| R))) (|xt| (|Matrix| R))
          (|algebraGeneratorsTranspose| (|List| (|Matrix| R))) (#4=#:G228 NIL)
          (#5=#:G227 NIL))
         (SEQ
          (LETT |algebraGeneratorsTranspose|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |j| 1)
                      (LETT #4# (SPADCALL |algebraGenerators| (QREFELT $ 37)))
                      G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (SPADCALL |algebraGenerators| |j|
                                          (QREFELT $ 31))
                                (QREFELT $ 48))
                               #5#))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (LETT |xt| (SPADCALL |singularMatrix| (QREFELT $ 48)))
          (SPADCALL "  We know that all the cyclic submodules generated by all"
                    (QREFELT $ 54))
          (SPADCALL
           "    non-trivial element of the singular matrix under view are"
           (QREFELT $ 54))
          (SPADCALL
           "    not proper, hence Norton's irreducibility test can be done:"
           (QREFELT $ 54))
          (LETT |kernel| (SPADCALL |xt| (QREFELT $ 57)))
          (LETT |result|
                (|REP2;splitInternal| |algebraGeneratorsTranspose|
                 (|SPADfirst| |kernel|) |split?| $))
          (COND
           ((NULL (CDR |result|))
            (COND
             ((EQL 1 (LENGTH |kernel|))
              (SPADCALL "  Representation is absolutely irreducible"
                        (QREFELT $ 54)))
             (#6='T
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
              (SEQ (LETT |i| 1) (LETT #3# (SPADCALL |result| (QREFELT $ 59)))
                   G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1)
                          (LETT #2#
                                (SPADCALL
                                 (SPADCALL |result| |i| (QREFELT $ 60))
                                 (QREFELT $ 37)))
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (LETT |mat|
                                 (SPADCALL
                                  (SPADCALL |result| |i| (QREFELT $ 60)) |j|
                                  (QREFELT $ 31)))
                           (EXIT
                            (SPADCALL (SPADCALL |result| |i| (QREFELT $ 60))
                                      |j|
                                      (SPADCALL
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |mat|
                                                           (QREFELT $ 56)))
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
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
           (#6#
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
          (#2=#:G262 NIL) (|j| NIL) (|foundResult| #1#) (#3=#:G243 NIL)
          (|baseChange1| #4=(|Matrix| R)) (|baseChange0| #4#)
          (|kernel1| #5=(|List| (|Vector| R))) (|kernel0| #5#)
          (|rk1| #6=(|NonNegativeInteger|)) (|rk0| #6#) (|x1| #7=(|Matrix| R))
          (|x0| #7#) (|randomIndex| (|Integer|)) (#8=#:G260 NIL) (|i| NIL)
          (#9=#:G261 NIL) (|n| (|NonNegativeInteger|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |result| NIL)
              (LETT |transitionM| (SPADCALL 1 1 (QREFELT $ 23)))
              (LETT |numberOfGenerators| (LENGTH |aG0|))
              (COND
               (|randomelements|
                (SEQ (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                     (LETT |x0| (SPADCALL |aG0| |randomIndex| (QREFELT $ 31)))
                     (EXIT
                      (LETT |x1|
                            (SPADCALL |aG1| |randomIndex| (QREFELT $ 31)))))))
              (LETT |n| (QVSIZE (SPADCALL |x0| 1 (QREFELT $ 45))))
              (LETT |foundResult| NIL)
              (SEQ (LETT #9# NIL) (LETT |i| 1) (LETT #8# |numberOfTries|) G190
                   (COND ((OR (|greater_SI| |i| #8#) #9#) (GO G191)))
                   (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T)))
                        (COND
                         (|randomelements|
                          (SEQ
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)))
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 31))
                                           (QREFELT $ 17)))
                           (LETT |x1|
                                 (SPADCALL |x1|
                                           (SPADCALL |aG1| |randomIndex|
                                                     (QREFELT $ 31))
                                           (QREFELT $ 17)))
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)))
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 31))
                                           (QREFELT $ 16)))
                           (EXIT
                            (LETT |x1|
                                  (SPADCALL |x1|
                                            (SPADCALL |aG1| |randomIndex|
                                                      (QREFELT $ 31))
                                            (QREFELT $ 16))))))
                         ('T
                          (SEQ
                           (LETT |x0|
                                 (|REP2;fingerPrint| |i|
                                  (SPADCALL |aG0| 0 (QREFELT $ 31))
                                  (SPADCALL |aG0| 1 (QREFELT $ 31)) |x0| $))
                           (EXIT
                            (LETT |x1|
                                  (|REP2;fingerPrint| |i|
                                   (SPADCALL |aG1| 0 (QREFELT $ 31))
                                   (SPADCALL |aG1| 1 (QREFELT $ 31)) |x1|
                                   $))))))
                        (LETT |rk0| (SPADCALL |x0| (QREFELT $ 40)))
                        (LETT |rk1| (SPADCALL |x1| (QREFELT $ 40)))
                        (EXIT
                         (COND
                          ((SPADCALL |rk0| |rk1| (QREFELT $ 41))
                           (SEQ
                            (SPADCALL "Dimensions of kernels differ"
                                      (QREFELT $ 54))
                            (LETT |foundResult| 'T)
                            (EXIT (LETT |result| NIL))))
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
                            (LETT |kernel0| (SPADCALL |x0| (QREFELT $ 57)))
                            (LETT |kernel1| (SPADCALL |x1| (QREFELT $ 57)))
                            (LETT |baseChange0|
                                  (SPADCALL |aG0|
                                            (SPADCALL |kernel0| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 49)))
                            (LETT |baseChange1|
                                  (SPADCALL |aG1|
                                            (SPADCALL |kernel1| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 49)))
                            (EXIT
                             (COND
                              ((SPADCALL (ANCOLS |baseChange0|)
                                         (ANCOLS |baseChange1|) (QREFELT $ 41))
                               (SEQ
                                (SPADCALL
                                 "  Dimensions of generated cyclic submodules differ"
                                 (QREFELT $ 54))
                                (LETT |foundResult| 'T)
                                (EXIT (LETT |result| NIL))))
                              ((EQL (ANCOLS |baseChange0|) |n|)
                               (SEQ
                                (LETT |transitionM|
                                      (SPADCALL |baseChange0|
                                                (PROG2
                                                    (LETT #3#
                                                          (SPADCALL
                                                           |baseChange1|
                                                           (QREFELT $ 56)))
                                                    (QCDR #3#)
                                                  (|check_union2|
                                                   (QEQCAR #3# 0)
                                                   (|Matrix| (QREFELT $ 6))
                                                   (|Union|
                                                    (|Matrix| (QREFELT $ 6))
                                                    "failed")
                                                   #3#))
                                                (QREFELT $ 17)))
                                (LETT |foundResult| 'T) (LETT |result| 'T)
                                (EXIT
                                 (SEQ (LETT |j| 1)
                                      (LETT #2# |numberOfGenerators|) G190
                                      (COND
                                       ((OR (|greater_SI| |j| #2#)
                                            (NULL |result|))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL
                                            (SPADCALL |aG0| |j| (QREFELT $ 31))
                                            |transitionM| (QREFELT $ 17))
                                           (SPADCALL |transitionM|
                                                     (SPADCALL |aG1| |j|
                                                               (QREFELT $ 31))
                                                     (QREFELT $ 17))
                                           (QREFELT $ 66))
                                          (SEQ (LETT |result| NIL)
                                               (LETT |transitionM|
                                                     (SPADCALL 1 1
                                                               (QREFELT $ 23)))
                                               (SPADCALL
                                                "  There is no isomorphism, as the only possible one"
                                                (QREFELT $ 54))
                                               (EXIT
                                                (SPADCALL
                                                 "    fails to do the necessary base change"
                                                 (QREFELT $ 54))))))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL)))))
                              ('T
                               (SEQ
                                (SPADCALL
                                 "  Generated cyclic submodules have equal, but not full"
                                 (QREFELT $ 54))
                                (EXIT
                                 (SPADCALL
                                  "    dimension, hence we can not draw any conclusion"
                                  (QREFELT $ 54))))))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# |foundResult|)))
                   (GO G190) G191 (EXIT NIL))
              (COND
               (|foundResult|
                (COND
                 (|result|
                  (SEQ (SPADCALL " " (QREFELT $ 54))
                       (EXIT
                        (SPADCALL "Representations are equivalent."
                                  (QREFELT $ 54)))))
                 (#10='T
                  (SEQ (SPADCALL " " (QREFELT $ 54))
                       (EXIT
                        (SPADCALL "Representations are not equivalent."
                                  (QREFELT $ 54)))))))
               (#10#
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
          (|randomIndex| (|Integer|)) (#2=#:G272 NIL) (|i| NIL) (#3=#:G273 NIL)
          (|n| (|NonNegativeInteger|))
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ (LETT |result| NIL) (LETT |numberOfGenerators| (LENGTH |aG|))
              (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
              (LETT |x| (SPADCALL |aG| |randomIndex| (QREFELT $ 31)))
              (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 45))))
              (LETT |foundResult| NIL)
              (SEQ (LETT #3# NIL) (LETT |i| 1) (LETT #2# |numberOfTries|) G190
                   (COND ((OR (|greater_SI| |i| #2#) #3#) (GO G191)))
                   (SEQ
                    (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL |aG| |randomIndex|
                                              (QREFELT $ 31))
                                    (QREFELT $ 17)))
                    (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL |aG| |randomIndex|
                                              (QREFELT $ 31))
                                    (QREFELT $ 16)))
                    (LETT |rk| (SPADCALL |x| (QREFELT $ 40)))
                    (EXIT
                     (COND
                      ((EQL |rk| (- |n| 1))
                       (SEQ (LETT |foundResult| 'T)
                            (SPADCALL "Random element in generated algebra has"
                                      (QREFELT $ 54))
                            (SPADCALL "  one-dimensional kernel"
                                      (QREFELT $ 54))
                            (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)))
                            (EXIT
                             (COND
                              ((EQL |n|
                                    (QVSIZE
                                     (SPADCALL |aG| (|SPADfirst| |kernel|)
                                               (QREFELT $ 47))))
                               (LETT |result|
                                     (NULL
                                      (NULL
                                       (SPADCALL
                                        (|REP2;irreducibilityTestInternal| |aG|
                                         |x| NIL $)
                                        1 (QREFELT $ 60))))))
                              ('T (LETT |result| NIL))))))
                      ('T
                       (SEQ
                        (SPADCALL "Random element in generated algebra does"
                                  (QREFELT $ 54))
                        (EXIT
                         (SPADCALL "  not have a one-dimensional kernel"
                                   (QREFELT $ 54))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# |foundResult|)))
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
         ((|factormoduleRepresentation| (|List| (|Matrix| R)))
          (|submoduleRepresentation| (|List| (|Matrix| R)))
          (|helpMatrix| (|Matrix| R)) (#1=#:G288 NIL) (|i| NIL)
          (|inverseTransitionMatrix| (|Matrix| R)) (#2=#:G278 NIL)
          (|transitionMatrix| (|Matrix| R))
          (|factormoduleIndices| (|List| (|Integer|))) (#3=#:G287 NIL)
          (#4=#:G286 NIL) (|submoduleIndices| (|List| (|Integer|)))
          (#5=#:G285 NIL) (#6=#:G284 NIL) (|rankOfSubmodule| (|Integer|))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QVSIZE (SPADCALL |submodule| 1 (QREFELT $ 21))))
              (LETT |rankOfSubmodule| (QVSIZE |submodule|))
              (LETT |submoduleRepresentation| NIL)
              (LETT |factormoduleRepresentation| NIL)
              (LETT |submoduleIndices|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |i| 1) (LETT #5# |rankOfSubmodule|) G190
                          (COND ((|greater_SI| |i| #5#) (GO G191)))
                          (SEQ (EXIT (LETT #6# (CONS |i| #6#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |factormoduleIndices|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |i| (+ 1 |rankOfSubmodule|)) (LETT #3# |n|)
                          G190 (COND ((> |i| #3#) (GO G191)))
                          (SEQ (EXIT (LETT #4# (CONS |i| #4#))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |transitionMatrix|
                    (SPADCALL (SPADCALL |submodule| (QREFELT $ 29))
                              (QREFELT $ 48)))
              (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
              (LETT |inverseTransitionMatrix|
                    (PROG2
                        (LETT #2# (SPADCALL |transitionMatrix| (QREFELT $ 56)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|Matrix| (QREFELT $ 6))
                                      (|Union| (|Matrix| (QREFELT $ 6))
                                               "failed")
                                      #2#)))
              (SPADCALL "  The inverse of the transition matrix computed"
                        (QREFELT $ 54))
              (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
              (SEQ (LETT |i| 1)
                   (LETT #1# (SPADCALL |algebraGenerators| (QREFELT $ 37)))
                   G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |helpMatrix|
                          (SPADCALL |inverseTransitionMatrix|
                                    (SPADCALL |algebraGenerators| |i|
                                              (QREFELT $ 31))
                                    (QREFELT $ 17)))
                    (LETT |submoduleRepresentation|
                          (CONS
                           (|REP2;blockMultiply| |helpMatrix|
                            |transitionMatrix| |submoduleIndices| |n| $)
                           |submoduleRepresentation|))
                    (EXIT
                     (LETT |factormoduleRepresentation|
                           (CONS
                            (|REP2;blockMultiply| |helpMatrix|
                             |transitionMatrix| |factormoduleIndices| |n| $)
                            |factormoduleRepresentation|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (REVERSE |submoduleRepresentation|)
                     (SPADCALL (REVERSE |factormoduleRepresentation|)
                               (QREFELT $ 70))))))) 

(SDEFUN |REP2;my_min| ((|m| |Matrix| R) (|n| |Integer|) ($ |Smp|))
        (SPROG
         ((|xi| (|Smp|)) (|res| (|Smp|)) (#1=#:G307 NIL) (|i| NIL)
          (|x| (|Smp|)) (|j| (|Integer|)) (|depe| (|Matrix| R))
          (|depm| (|Matrix| R)) (#2=#:G306 NIL) (|v| #3=(|Vector| R))
          (#4=#:G305 NIL) (|depl| (|List| (|Vector| R))) (#5=#:G304 NIL)
          (#6=#:G303 NIL) (#7=#:G302 NIL) (|zz| #3#) (#8=#:G290 NIL))
         (SEQ
          (LETT |zz|
                (SPADCALL
                 (PROG1 (LETT #8# |n|)
                   (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #8#))
                 (QREFELT $ 73)))
          (LETT |v| |zz|)
          (SEQ G190
               (COND ((NULL (SPADCALL |v| |zz| (QREFELT $ 74))) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |v|
                       (SPADCALL
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                              (COND ((|greater_SI| |i| #6#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7#
                                      (CONS (SPADCALL (QREFELT $ 75)) #7#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #7#))))
                        (QREFELT $ 76)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |depl| (LIST |v|))
          (SEQ (LETT |i| 1) (LETT #5# |n|) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |v| (SPADCALL |m| |v| (QREFELT $ 38)))
                    (EXIT (LETT |depl| (CONS |v| |depl|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |depl| (REVERSE |depl|))
          (LETT |depm|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL)
                  (SEQ (LETT |v| NIL) (LETT #2# |depl|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 77)) #4#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 14)))
          (LETT |depe|
                (SPADCALL (SPADCALL |depm| (QREFELT $ 48)) (QREFELT $ 36)))
          (LETT |j| 1)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((<= |j| |n|)
                    (SPADCALL (QAREF2O |depe| |j| |j| 1 1)
                              (|spadConstant| $ 12) (QREFELT $ 78)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL (GO G190) G191 (EXIT NIL))
          (LETT |res| (|spadConstant| $ 80))
          (LETT |x| (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 81)))
          (LETT |xi| (|spadConstant| $ 79))
          (SEQ (LETT |i| 1) (LETT #1# (- |j| 1)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |depe| |i| |j| (QREFELT $ 9)) |xi|
                                 (QREFELT $ 82))
                                (QREFELT $ 83)))
                (EXIT (LETT |xi| (SPADCALL |x| |xi| (QREFELT $ 84)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |xi| |res| (QREFELT $ 85)))))) 

(SDEFUN |REP2;m_eval|
        ((|p| |Smp|) (|m| |Matrix| R) (|n| |Integer|) ($ |Matrix| R))
        (SPROG
         ((|old_deg| #1=(|NonNegativeInteger|)) (|res| (|Matrix| R))
          (#2=#:G318 NIL) (|i| NIL) (|ndeg| #1#) (|c0| (R)) (|id| (|Matrix| R))
          (#3=#:G315 NIL) (#4=#:G317 NIL) (#5=#:G316 NIL)
          (|nn| (|NonNegativeInteger|)) (#6=#:G308 NIL))
         (SEQ
          (LETT |nn|
                (PROG1 (LETT #6# |n|)
                  (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #6#)))
          (LETT |res| (SPADCALL |nn| |nn| (QREFELT $ 23)))
          (LETT |id|
                (SPADCALL
                 (PROGN
                  (LETT #5# (GETREFV |n|))
                  (SEQ (LETT |i| 1) (LETT #4# |n|) (LETT #3# 0) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ (EXIT (SETELT #5# #3# (|spadConstant| $ 15))))
                       (LETT #3#
                             (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  #5#)
                 (QREFELT $ 86)))
          (LETT |old_deg| (SPADCALL |p| (QREFELT $ 87)))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 80) (QREFELT $ 88)))
                 (GO G191)))
               (SEQ (LETT |c0| (SPADCALL |p| (QREFELT $ 89)))
                    (LETT |res|
                          (SPADCALL |res| (SPADCALL |c0| |id| (QREFELT $ 90))
                                    (QREFELT $ 16)))
                    (LETT |p| (SPADCALL |p| (QREFELT $ 91)))
                    (LETT |ndeg| (SPADCALL |p| (QREFELT $ 87)))
                    (SEQ (LETT |i| 1) (LETT #2# (- |old_deg| |ndeg|)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |m| |res| (QREFELT $ 17)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |old_deg| |ndeg|)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |REP2;meatAxe1|
        ((|algebraGenerators| |List| (|Matrix| R)) (|x| |Matrix| R)
         (|n| |Integer|) (|m| |Integer|)
         ($ |Union| (|List| (|List| (|Matrix| R))) "failed"))
        (SPROG
         ((#1=#:G330 NIL) (|pres| (|List| (|List| (|Matrix| R))))
          (|v| (|Vector| R)) (|good| (|Boolean|))
          (|kernel| (|List| (|Vector| R))) (|xx| (|Matrix| R))
          (|mm| (|NonNegativeInteger|)) (|fpol| (|Smp|)) (#2=#:G331 NIL)
          (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| |Smp|)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|mp| (|Smp|)))
         (SEQ
          (EXIT
           (SEQ (LETT |mp| (|REP2;my_min| |x| |n| $))
                (LETT |fl|
                      (SPADCALL (SPADCALL |mp| (QREFELT $ 94)) (QREFELT $ 98)))
                (SEQ (LETT |fac| NIL) (LETT #2# |fl|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |fpol| (QVELT |fac| 1))
                          (LETT |mm| (SPADCALL |fpol| (QREFELT $ 87)))
                          (EXIT
                           (COND ((> |mm| |m|) "iterate")
                                 ('T
                                  (SEQ
                                   (LETT |xx| (|REP2;m_eval| |fpol| |x| |n| $))
                                   (LETT |kernel|
                                         (SPADCALL |xx| (QREFELT $ 57)))
                                   (LETT |good| (EQL (LENGTH |kernel|) |mm|))
                                   (LETT |v| (|SPADfirst| |kernel|))
                                   (LETT |pres|
                                         (SPADCALL |algebraGenerators| |v|
                                                   (QREFELT $ 69)))
                                   (COND
                                    ((NULL (NULL (CDR |pres|)))
                                     (PROGN
                                      (LETT #1# (CONS 0 |pres|))
                                      (GO #3=#:G329))))
                                   (EXIT
                                    (COND
                                     (|good|
                                      (SEQ
                                       (SPADCALL "Found good factor"
                                                 (QREFELT $ 54))
                                       (EXIT
                                        (PROGN
                                         (LETT #1#
                                               (CONS 0
                                                     (|REP2;irreducibilityTestInternal|
                                                      |algebraGenerators| |xx|
                                                      'T $)))
                                         (GO #3#))))))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "All factors were bad" (QREFELT $ 54))
                (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |REP2;meatAxe;LB2IL;19|
        ((|algebraGenerators| |List| (|Matrix| R)) (|randomelements| |Boolean|)
         (|numberOfTries| |Integer|) (|maxTests| |Integer|)
         ($ |List| (|List| (|Matrix| R))))
        (SPROG
         ((|result| (|List| (|List| (|Matrix| R)))) (#1=#:G347 NIL)
          (#2=#:G349 NIL) (|j| NIL) (|numberOfTests| (|Integer|))
          (|numberOfOneDimSubspacesInKernel| (|Integer|))
          (|kernel| (|List| (|Vector| R)))
          (|pp| (|Union| (|List| (|List| (|Matrix| R))) "failed"))
          (|n| (|NonNegativeInteger|)) (|x| (|Matrix| R))
          (|randomIndex| (|Integer|)) (#3=#:G348 NIL) (|i| NIL)
          (|q| (|PositiveInteger|)) (#4=#:G332 NIL)
          (|numberOfGenerators| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |numberOfGenerators| (LENGTH |algebraGenerators|))
                (LETT |result| NIL)
                (LETT |q|
                      (PROG1 (LETT #4# (SPADCALL (QREFELT $ 99)))
                        (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                          '(|NonNegativeInteger|) #4#)))
                (COND
                 (|randomelements|
                  (SEQ (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                       (EXIT
                        (LETT |x|
                              (SPADCALL |algebraGenerators| |randomIndex|
                                        (QREFELT $ 31)))))))
                (SEQ (LETT |i| 1) (LETT #3# |numberOfTries|) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T)))
                          (COND
                           (|randomelements|
                            (SEQ
                             (LETT |randomIndex|
                                   (+ 1 (RANDOM |numberOfGenerators|)))
                             (LETT |x|
                                   (SPADCALL |x|
                                             (SPADCALL |algebraGenerators|
                                                       |randomIndex|
                                                       (QREFELT $ 31))
                                             (QREFELT $ 17)))
                             (LETT |randomIndex|
                                   (+ 1 (RANDOM |numberOfGenerators|)))
                             (EXIT
                              (LETT |x|
                                    (SPADCALL |x|
                                              (SPADCALL |algebraGenerators|
                                                        |randomIndex|
                                                        (QREFELT $ 31))
                                              (QREFELT $ 16))))))
                           ('T
                            (LETT |x|
                                  (|REP2;fingerPrint| |i|
                                   (SPADCALL |algebraGenerators| 1
                                             (QREFELT $ 31))
                                   (SPADCALL |algebraGenerators| 2
                                             (QREFELT $ 31))
                                   |x| $))))
                          (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 45))))
                          (COND
                           ((OR (> |q| 2) (OR (EVENP |i|) (> |i| 15)))
                            (EXIT
                             (SEQ
                              (LETT |pp|
                                    (|REP2;meatAxe1| |algebraGenerators| |x|
                                     |n| (EXPT 2 |i|) $))
                              (EXIT
                               (COND
                                ((QEQCAR |pp| 0)
                                 (PROGN
                                  (LETT #1# (QCDR |pp|))
                                  (GO #5=#:G346)))))))))
                          (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)))
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
                                    (QUOTIENT2
                                     (- (EXPT |q| (LENGTH |kernel|)) 1)
                                     (- |q| 1)))
                              (LETT |numberOfTests|
                                    (MIN |numberOfOneDimSubspacesInKernel|
                                         |maxTests|))
                              (EXIT
                               (SEQ (LETT |j| 1) (LETT #2# |numberOfTests|)
                                    G190
                                    (COND ((|greater_SI| |j| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |result|
                                           (SPADCALL |algebraGenerators|
                                                     (SPADCALL |kernel| |j|
                                                               (QREFELT $ 100))
                                                     (QREFELT $ 69)))
                                     (EXIT
                                      (COND
                                       ((NULL (CDR |result|))
                                        (COND
                                         ((> (+ |j| 1)
                                             |numberOfOneDimSubspacesInKernel|)
                                          (PROGN
                                           (LETT #1#
                                                 (|REP2;irreducibilityTestInternal|
                                                  |algebraGenerators| |x| 'T
                                                  $))
                                           (GO #5#)))))
                                       ('T
                                        (PROGN
                                         (LETT #1# |result|)
                                         (GO #5#))))))
                                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                    (EXIT NIL))))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (LETT |result| (LIST NIL NIL)) (SPADCALL " " (QREFELT $ 54))
                (SPADCALL "Sorry, no result, try meatAxe(...,true)"
                          (QREFELT $ 54))
                (SPADCALL "  or consider using an extension field."
                          (QREFELT $ 54))
                (EXIT |result|)))
          #5# (EXIT #1#)))) 

(SDEFUN |REP2;meatAxe;LL;20|
        ((|algebraGenerators| |List| (|Matrix| R))
         ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| NIL 25 7 (QREFELT $ 101))) 

(SDEFUN |REP2;meatAxe;LBL;21|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|randomElements?| |Boolean|) ($ |List| (|List| (|Matrix| R))))
        (COND
         (|randomElements?|
          (SPADCALL |algebraGenerators| 'T 25 7 (QREFELT $ 101)))
         ('T (SPADCALL |algebraGenerators| NIL 6 7 (QREFELT $ 101))))) 

(SDEFUN |REP2;meatAxe;LPiL;22|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|numberOfTries| |PositiveInteger|) ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| 'T |numberOfTries| 7 (QREFELT $ 101))) 

(SDEFUN |REP2;scanOneDimSubspaces;LIV;23|
        ((|basis| |List| (|Vector| R)) (|n| |Integer|) ($ |Vector| R))
        (SPROG
         ((#1=#:G365 NIL) (|j| NIL) (|newAdd| (|Vector| R)) (#2=#:G364 NIL)
          (|i| (|Integer|)) (|result| #3=(|Vector| R)) (#4=#:G355 NIL)
          (#5=#:G363 NIL) (|iR| (|List| (|Integer|))) (|coefficients| #3#)
          (|nred| #6=(|Integer|)) (|pos| #6#) (#7=#:G362 NIL)
          (|q| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (LENGTH |basis|))
              (LETT |nn| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 65))))
              (LETT |q| (SPADCALL (QREFELT $ 99)))
              (LETT |nred|
                    (REM |n| (QUOTIENT2 (- (EXPT |q| |dim|) 1) (- |q| 1))))
              (LETT |pos| |nred|) (LETT |i| 0)
              (SEQ (LETT |i| 0) (LETT #7# (- |dim| 1)) G190
                   (COND
                    ((OR (|greater_SI| |i| #7#) (NULL (>= |nred| 0)))
                     (GO G191)))
                   (SEQ (LETT |pos| |nred|)
                        (EXIT (LETT |nred| (- |nred| (EXPT |q| |i|)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |i| (COND ((EQL |i| 0) 0) ('T (- |i| 1))))
              (LETT |coefficients| (MAKEARR1 |dim| (|spadConstant| $ 12)))
              (SPADCALL |coefficients| (- |dim| |i|) (|spadConstant| $ 15)
                        (QREFELT $ 106))
              (LETT |iR|
                    (SPADCALL
                     (SPADCALL |pos|
                               (|compiledLookupCheck| '|coerce|
                                                      (LIST '$
                                                            (LIST '|Integer|))
                                                      (|RadixExpansion| |q|)))
                     (|compiledLookupCheck| '|wholeRagits|
                                            (LIST
                                             (LIST '|List| (LIST '|Integer|))
                                             '$)
                                            (|RadixExpansion| |q|))))
              (SEQ (LETT |j| 1) (LETT #5# (SPADCALL |iR| (QREFELT $ 108))) G190
                   (COND ((|greater_SI| |j| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |coefficients| (+ (- |dim| (LENGTH |iR|)) |j|)
                               (SPADCALL
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (SPADCALL |iR| |j| (QREFELT $ 109))
                                           |q|))
                                  (|check_subtype2| (> #4# 0)
                                                    '(|PositiveInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 110))
                               (QREFELT $ 106))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (LETT |result| (MAKEARR1 |nn| (|spadConstant| $ 12)))
              (SEQ (LETT |i| 1) (LETT #2# (QVSIZE |coefficients|)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |newAdd|
                          (SPADCALL
                           (SPADCALL |coefficients| |i| (QREFELT $ 25))
                           (SPADCALL |basis| |i| (QREFELT $ 65))
                           (QREFELT $ 111)))
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |nn|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |result| |j|
                                      (SPADCALL
                                       (SPADCALL |result| |j| (QREFELT $ 25))
                                       (SPADCALL |newAdd| |j| (QREFELT $ 25))
                                       (QREFELT $ 11))
                                      (QREFELT $ 106))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |result|)))) 

(DECLAIM (NOTINLINE |RepresentationPackage2;|)) 

(DEFUN |RepresentationPackage2| (#1=#:G367)
  (SPROG NIL
         (PROG (#2=#:G368)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RepresentationPackage2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RepresentationPackage2;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RepresentationPackage2|)))))))))) 

(DEFUN |RepresentationPackage2;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G366 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|RepresentationPackage2| DV$1))
          (LETT $ (GETREFV 112))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Field|)))
                                              (AND #1#
                                                   (|HasCategory| |#1|
                                                                  '(|Finite|)))
                                              (|HasCategory| |#1|
                                                             '(|EuclideanDomain|))))))
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
             (QSETREFV $ 69 (CONS (|dispatchFunction| |REP2;split;LVL;14|) $))
             (QSETREFV $ 71 (CONS (|dispatchFunction| |REP2;split;LVL;15|) $))
             (COND
              ((|HasCategory| |#1| '(|FiniteFieldCategory|))
               (PROGN
                (QSETREFV $ 72 (|SparseUnivariatePolynomial| |#1|))
                (QSETREFV $ 101
                          (CONS (|dispatchFunction| |REP2;meatAxe;LB2IL;19|)
                                $))
                (QSETREFV $ 102
                          (CONS (|dispatchFunction| |REP2;meatAxe;LL;20|) $))
                (QSETREFV $ 103
                          (CONS (|dispatchFunction| |REP2;meatAxe;LBL;21|) $))
                (QSETREFV $ 105
                          (CONS (|dispatchFunction| |REP2;meatAxe;LPiL;22|) $))
                (QSETREFV $ 100
                          (CONS
                           (|dispatchFunction|
                            |REP2;scanOneDimSubspaces;LIV;23|)
                           $))))))))
          $))) 

(MAKEPROP '|RepresentationPackage2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|Matrix| 6)
              (0 . |elt|) (7 . *) (13 . +) (19 . |Zero|) (|List| 33)
              (23 . |matrix|) (28 . |One|) (32 . +) (38 . *) (44 . -)
              (|Vector| 6) (|Vector| 19) (50 . |elt|) (|NonNegativeInteger|)
              (56 . |zero|) (62 . |setRow!|) (69 . |elt|) (|Boolean|) (75 . =)
              (81 . |setelt!|) |REP2;completeEchelonBasis;VM;3| (|List| 8)
              (89 . |elt|) |REP2;createRandomElement;L2M;4| (|List| 6)
              (95 . |entries|) (100 . |list|) (105 . |rowEchelon|)
              (110 . |maxIndex|) (115 . *) (121 . |vertConcat|) (127 . |rank|)
              (132 . ~=) (|List| 19) (138 . |append|) (144 . |maxRowIndex|)
              (149 . |row|) (155 . |vector|) (160 . |cyclicSubmodule|)
              (166 . |transpose|) (171 . |standardBasisOfCyclicSubmodule|)
              (177 . ~=) (|Void|) (|String|) (|OutputForm|)
              (183 . |messagePrint|) (|Union| $ '"failed") (188 . |inverse|)
              (193 . |nullSpace|) (|List| 30) (198 . |maxIndex|) (203 . |elt|)
              (209 . |setelt!|) (216 . |areEquivalent?|)
              (224 . |areEquivalent?|) (230 . |areEquivalent?|) (237 . |elt|)
              (243 . ~=) (249 . |isAbsolutelyIrreducible?|)
              (255 . |isAbsolutelyIrreducible?|) (260 . |split|) (266 . |list|)
              (271 . |split|) '|Smp| (277 . |zero|) (282 . =) (288 . |random|)
              (292 . |vector|) (297 . |parts|) (302 . ~=) (308 . |One|)
              (312 . |Zero|) (316 . |monomial|) (322 . *) (328 . -) (334 . *)
              (340 . +) (346 . |diagonalMatrix|) (351 . |degree|) (356 . ~=)
              (362 . |leadingCoefficient|) (367 . *) (373 . |reductum|)
              (|Factored| 72) (|DistinctDegreeFactorize| 6 72) (378 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 95) (|:| |factor| 72) (|:| |exponent| 22))
              (|List| 96) (383 . |factorList|) (388 . |size|)
              (392 . |scanOneDimSubspaces|) (398 . |meatAxe|) (406 . |meatAxe|)
              (411 . |meatAxe|) (|PositiveInteger|) (417 . |meatAxe|)
              (423 . |setelt!|) (|List| 7) (430 . |maxIndex|) (435 . |elt|)
              (441 . |index|) (446 . *))
           '#(|standardBasisOfCyclicSubmodule| 452 |split| 458
              |scanOneDimSubspaces| 470 |meatAxe| 476
              |isAbsolutelyIrreducible?| 501 |cyclicSubmodule| 512
              |createRandomElement| 518 |completeEchelonBasis| 524
              |areEquivalent?| 529)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|completeEchelonBasis|
                                 ((|Matrix| |#1|) (|Vector| (|Vector| |#1|))))
                                T)
                              '((|createRandomElement|
                                 ((|Matrix| |#1|) (|List| (|Matrix| |#1|))
                                  (|Matrix| |#1|)))
                                T)
                              '((|cyclicSubmodule|
                                 ((|Vector| (|Vector| |#1|))
                                  (|List| (|Matrix| |#1|)) (|Vector| |#1|)))
                                (|has| 6 (|EuclideanDomain|)))
                              '((|standardBasisOfCyclicSubmodule|
                                 ((|Matrix| |#1|) (|List| (|Matrix| |#1|))
                                  (|Vector| |#1|)))
                                (|has| 6 (|EuclideanDomain|)))
                              '((|areEquivalent?|
                                 ((|Matrix| |#1|) (|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|)) (|Boolean|)
                                  (|Integer|)))
                                (|has| 6 (|Field|)))
                              '((|areEquivalent?|
                                 ((|Matrix| |#1|) (|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|))))
                                (|has| 6 (|Field|)))
                              '((|areEquivalent?|
                                 ((|Matrix| |#1|) (|List| (|Matrix| |#1|))
                                  (|List| (|Matrix| |#1|)) (|Integer|)))
                                (|has| 6 (|Field|)))
                              '((|isAbsolutelyIrreducible?|
                                 ((|Boolean|) (|List| (|Matrix| |#1|))
                                  (|Integer|)))
                                (|has| 6 (|Field|)))
                              '((|isAbsolutelyIrreducible?|
                                 ((|Boolean|) (|List| (|Matrix| |#1|))))
                                (|has| 6 (|Field|)))
                              '((|split|
                                 ((|List| (|List| (|Matrix| |#1|)))
                                  (|List| (|Matrix| |#1|)) (|Vector| |#1|)))
                                (|has| 6 (|Field|)))
                              '((|split|
                                 ((|List| (|List| (|Matrix| |#1|)))
                                  (|List| (|Matrix| |#1|))
                                  (|Vector| (|Vector| |#1|))))
                                (|has| 6 (|Field|)))
                              '((|meatAxe|
                                 ((|List| (|List| (|Matrix| |#1|)))
                                  (|List| (|Matrix| |#1|)) (|Boolean|)
                                  (|Integer|) (|Integer|)))
                                (AND (|has| 6 (|Field|)) (|has| 6 (|Finite|))))
                              '((|meatAxe|
                                 ((|List| (|List| (|Matrix| |#1|)))
                                  (|List| (|Matrix| |#1|))))
                                (AND (|has| 6 (|Field|)) (|has| 6 (|Finite|))))
                              '((|meatAxe|
                                 ((|List| (|List| (|Matrix| |#1|)))
                                  (|List| (|Matrix| |#1|)) (|Boolean|)))
                                (AND (|has| 6 (|Field|)) (|has| 6 (|Finite|))))
                              '((|meatAxe|
                                 ((|List| (|List| (|Matrix| |#1|)))
                                  (|List| (|Matrix| |#1|))
                                  (|PositiveInteger|)))
                                (AND (|has| 6 (|Field|)) (|has| 6 (|Finite|))))
                              '((|scanOneDimSubspaces|
                                 ((|Vector| |#1|) (|List| (|Vector| |#1|))
                                  (|Integer|)))
                                (AND (|has| 6 (|Field|))
                                     (|has| 6 (|Finite|)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 111
                                            '(3 8 6 0 7 7 9 2 6 0 0 0 10 2 6 0
                                              0 0 11 0 6 0 12 1 8 0 13 14 0 6 0
                                              15 2 8 0 0 0 16 2 8 0 0 0 17 2 8
                                              0 0 0 18 2 20 19 0 7 21 2 8 0 22
                                              22 23 3 8 0 0 7 19 24 2 19 6 0 7
                                              25 2 6 26 0 0 27 4 8 6 0 7 7 6 28
                                              2 30 8 0 7 31 1 19 33 0 34 1 13 0
                                              33 35 1 8 0 0 36 1 30 7 0 37 2 8
                                              19 0 19 38 2 8 0 0 0 39 1 8 22 0
                                              40 2 22 26 0 0 41 2 42 0 0 0 43 1
                                              8 7 0 44 2 8 19 0 7 45 1 20 0 42
                                              46 2 0 20 30 19 47 1 8 0 0 48 2 0
                                              8 30 19 49 2 7 26 0 0 50 1 53 51
                                              52 54 1 8 55 0 56 1 8 42 0 57 1
                                              58 7 0 59 2 58 30 0 7 60 3 30 8 0
                                              7 8 61 4 0 8 30 30 26 7 62 2 0 8
                                              30 30 63 3 0 8 30 30 7 64 2 42 19
                                              0 7 65 2 8 26 0 0 66 2 0 26 30 7
                                              67 1 0 26 30 68 2 0 58 30 19 69 1
                                              58 0 30 70 2 0 58 30 20 71 1 19 0
                                              22 73 2 19 26 0 0 74 0 6 0 75 1
                                              19 0 33 76 1 19 33 0 77 2 6 26 0
                                              0 78 0 72 0 79 0 72 0 80 2 72 0 6
                                              22 81 2 72 0 6 0 82 2 72 0 0 0 83
                                              2 72 0 0 0 84 2 72 0 0 0 85 1 8 0
                                              19 86 1 72 22 0 87 2 72 26 0 0 88
                                              1 72 6 0 89 2 8 0 6 0 90 1 72 0 0
                                              91 1 93 92 72 94 1 92 97 0 98 0 6
                                              22 99 2 0 19 42 7 100 4 0 58 30
                                              26 7 7 101 1 0 58 30 102 2 0 58
                                              30 26 103 2 0 58 30 104 105 3 19
                                              6 0 7 6 106 1 107 7 0 108 2 107 7
                                              0 7 109 1 6 0 104 110 2 19 0 6 0
                                              111 2 3 8 30 19 49 2 1 58 30 19
                                              69 2 1 58 30 20 71 2 2 19 42 7
                                              100 4 2 58 30 26 7 7 101 2 2 58
                                              30 26 103 1 2 58 30 102 2 2 58 30
                                              104 105 2 1 26 30 7 67 1 1 26 30
                                              68 2 3 20 30 19 47 2 0 8 30 8 32
                                              1 0 8 20 29 2 1 8 30 30 63 4 1 8
                                              30 30 26 7 62 3 1 8 30 30 7
                                              64)))))
           '|lookupComplete|)) 
