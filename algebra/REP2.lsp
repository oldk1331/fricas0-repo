
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
               ((SPADCALL (QVSIZE |basis|) |n| (QREFELT $ 26))
                (SEQ (LETT |newStart| 1)
                     (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                          (COND
                           ((OR (|greater_SI| |j| #4#)
                                (NULL
                                 (SPADCALL |indexOfVectorToBeScanned|
                                           |dimensionOfSubmodule|
                                           (QREFELT $ 26))))
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
                                       (|spadConstant| $ 15) (QREFELT $ 29))))
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
                              (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                              (QREFELT $ 17)))
              (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
              (EXIT
               (SPADCALL |algElt| (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
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
                  (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36))
                  (QREFELT $ 14))
                 (QREFELT $ 37)))
          (LETT |furtherElts|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |i| 1) (LETT #5# (SPADCALL |lm| (QREFELT $ 38)))
                      G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 32)) |v|
                                         (QREFELT $ 39))
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
                           (SPADCALL (SPADCALL |w| (QREFELT $ 35))
                                     (QREFELT $ 36))
                           (QREFELT $ 14)))
                    (LETT |addedToBasis|
                          (SPADCALL |basis| |nextVector| (QREFELT $ 40)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 41))
                                 (ANROWS |basis|) (QREFELT $ 42))
                       (SEQ
                        (LETT |basis| (SPADCALL |addedToBasis| (QREFELT $ 37)))
                        (LETT |updateFurtherElts|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |i| 1)
                                    (LETT #3# (SPADCALL |lm| (QREFELT $ 38)))
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
                                             #4#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #4#)))))
                        (EXIT
                         (LETT |furtherElts|
                               (SPADCALL (CDR |furtherElts|)
                                         |updateFurtherElts|
                                         (QREFELT $ 44))))))
                      ('T (LETT |furtherElts| (CDR |furtherElts|))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |basis| (QREFELT $ 45)))
                  G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS (SPADCALL |basis| |i| (QREFELT $ 46)) #2#))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 47)))))) 

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
                    (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36)))
              (LETT |basis|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36))
                      (QREFELT $ 14))
                     (QREFELT $ 37)))
              (LETT |furtherElts|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |i| 1)
                          (LETT #3# (SPADCALL |lm| (QREFELT $ 38))) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 32))
                                             |v| (QREFELT $ 39))
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
                               (SPADCALL (SPADCALL |w| (QREFELT $ 35))
                                         (QREFELT $ 36))
                               (QREFELT $ 14)))
                        (LETT |addedToBasis|
                              (SPADCALL |basis| |nextVector| (QREFELT $ 40)))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 41))
                                     (ANROWS |basis|) (QREFELT $ 42))
                           (SEQ
                            (LETT |standardBasis|
                                  (CONS (SPADCALL |w| (QREFELT $ 35))
                                        |standardBasis|))
                            (LETT |basis|
                                  (SPADCALL |addedToBasis| (QREFELT $ 37)))
                            (LETT |updateFurtherElts|
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |i| 1)
                                        (LETT #1#
                                              (SPADCALL |lm| (QREFELT $ 38)))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |lm| |i|
                                                            (QREFELT $ 32))
                                                  |w| (QREFELT $ 39))
                                                 #2#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #2#)))))
                            (EXIT
                             (LETT |furtherElts|
                                   (SPADCALL (CDR |furtherElts|)
                                             |updateFurtherElts|
                                             (QREFELT $ 44))))))
                          ('T (LETT |furtherElts| (CDR |furtherElts|))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |standardBasis| (QREFELT $ 14))
                         (QREFELT $ 49)))))) 

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
                    (SPADCALL |algebraGenerators| |vector| (QREFELT $ 48)))
              (LETT |rankOfSubmodule| (QVSIZE |submodule|))
              (LETT |submoduleRepresentation| NIL)
              (LETT |factormoduleRepresentation| NIL)
              (EXIT
               (COND
                ((SPADCALL |n| |rankOfSubmodule| (QREFELT $ 51))
                 (SEQ
                  (SPADCALL "  A proper cyclic submodule is found."
                            (QREFELT $ 55))
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
                           (SPADCALL (SPADCALL |submodule| (QREFELT $ 30))
                                     (QREFELT $ 49)))
                     (SPADCALL "  Transition matrix computed" (QREFELT $ 55))
                     (LETT |inverseTransitionMatrix|
                           (PROG2
                               (LETT #2#
                                     (SPADCALL |transitionMatrix|
                                               (QREFELT $ 57)))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Matrix| (QREFELT $ 6))
                                             (|Union| (|Matrix| (QREFELT $ 6))
                                                      "failed")
                                             #2#)))
                     (SPADCALL
                      "  The inverse of the transition matrix computed"
                      (QREFELT $ 55))
                     (SPADCALL "  Now transform the matrices" (QREFELT $ 55))
                     (EXIT
                      (SEQ (LETT |i| 1)
                           (LETT #1#
                                 (SPADCALL |algebraGenerators| (QREFELT $ 38)))
                           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (LETT |helpMatrix|
                                  (SPADCALL |inverseTransitionMatrix|
                                            (SPADCALL |algebraGenerators| |i|
                                                      (QREFELT $ 32))
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
                            (QREFELT $ 55))
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
                      (LETT #4# (SPADCALL |algebraGenerators| (QREFELT $ 38)))
                      G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (SPADCALL |algebraGenerators| |j|
                                          (QREFELT $ 32))
                                (QREFELT $ 49))
                               #5#))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (LETT |xt| (SPADCALL |singularMatrix| (QREFELT $ 49)))
          (SPADCALL "  We know that all the cyclic submodules generated by all"
                    (QREFELT $ 55))
          (SPADCALL
           "    non-trivial element of the singular matrix under view are"
           (QREFELT $ 55))
          (SPADCALL
           "    not proper, hence Norton's irreducibility test can be done:"
           (QREFELT $ 55))
          (LETT |kernel| (SPADCALL |xt| (QREFELT $ 58)))
          (LETT |result|
                (|REP2;splitInternal| |algebraGeneratorsTranspose|
                 (|SPADfirst| |kernel|) |split?| $))
          (COND
           ((NULL (CDR |result|))
            (COND
             ((EQL 1 (LENGTH |kernel|))
              (SPADCALL "  Representation is absolutely irreducible"
                        (QREFELT $ 55)))
             (#6='T
              (SEQ
               (SPADCALL "  Representation is irreducible, but we don't know "
                         (QREFELT $ 55))
               (EXIT
                (SPADCALL "    whether it is absolutely irreducible"
                          (QREFELT $ 55)))))))
           (|split?|
            (SEQ
             (SPADCALL
              "  Representation is not irreducible and it will be split:"
              (QREFELT $ 55))
             (EXIT
              (SEQ (LETT |i| 1) (LETT #3# (SPADCALL |result| (QREFELT $ 60)))
                   G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1)
                          (LETT #2#
                                (SPADCALL
                                 (SPADCALL |result| |i| (QREFELT $ 61))
                                 (QREFELT $ 38)))
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (LETT |mat|
                                 (SPADCALL
                                  (SPADCALL |result| |i| (QREFELT $ 61)) |j|
                                  (QREFELT $ 32)))
                           (EXIT
                            (SPADCALL (SPADCALL |result| |i| (QREFELT $ 61))
                                      |j|
                                      (SPADCALL
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |mat|
                                                           (QREFELT $ 57)))
                                           (QCDR #1#)
                                         (|check_union2| (QEQCAR #1# 0)
                                                         (|Matrix|
                                                          (QREFELT $ 6))
                                                         (|Union|
                                                          (|Matrix|
                                                           (QREFELT $ 6))
                                                          "failed")
                                                         #1#))
                                       (QREFELT $ 49))
                                      (QREFELT $ 62))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
           (#6#
            (SPADCALL
             "  Representation is not irreducible, use meatAxe to split"
             (QREFELT $ 55))))
          (EXIT (REVERSE |result|))))) 

(SDEFUN |REP2;areEquivalent?;2LM;9|
        ((|aG0| |List| (|Matrix| R)) (|aG1| |List| (|Matrix| R))
         ($ |Matrix| R))
        (SPADCALL |aG0| |aG1| 'T 25 (QREFELT $ 63))) 

(SDEFUN |REP2;areEquivalent?;2LIM;10|
        ((|aG0| |List| (|Matrix| R)) (|aG1| |List| (|Matrix| R))
         (|numberOfTries| |Integer|) ($ |Matrix| R))
        (SPADCALL |aG0| |aG1| 'T |numberOfTries| (QREFELT $ 63))) 

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
                     (LETT |x0| (SPADCALL |aG0| |randomIndex| (QREFELT $ 32)))
                     (EXIT
                      (LETT |x1|
                            (SPADCALL |aG1| |randomIndex| (QREFELT $ 32)))))))
              (LETT |n| (QVSIZE (SPADCALL |x0| 1 (QREFELT $ 46))))
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
                                                     (QREFELT $ 32))
                                           (QREFELT $ 17)))
                           (LETT |x1|
                                 (SPADCALL |x1|
                                           (SPADCALL |aG1| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 17)))
                           (LETT |randomIndex|
                                 (+ 1 (RANDOM |numberOfGenerators|)))
                           (LETT |x0|
                                 (SPADCALL |x0|
                                           (SPADCALL |aG0| |randomIndex|
                                                     (QREFELT $ 32))
                                           (QREFELT $ 16)))
                           (EXIT
                            (LETT |x1|
                                  (SPADCALL |x1|
                                            (SPADCALL |aG1| |randomIndex|
                                                      (QREFELT $ 32))
                                            (QREFELT $ 16))))))
                         ('T
                          (SEQ
                           (LETT |x0|
                                 (|REP2;fingerPrint| |i|
                                  (SPADCALL |aG0| 0 (QREFELT $ 32))
                                  (SPADCALL |aG0| 1 (QREFELT $ 32)) |x0| $))
                           (EXIT
                            (LETT |x1|
                                  (|REP2;fingerPrint| |i|
                                   (SPADCALL |aG1| 0 (QREFELT $ 32))
                                   (SPADCALL |aG1| 1 (QREFELT $ 32)) |x1|
                                   $))))))
                        (LETT |rk0| (SPADCALL |x0| (QREFELT $ 41)))
                        (LETT |rk1| (SPADCALL |x1| (QREFELT $ 41)))
                        (EXIT
                         (COND
                          ((SPADCALL |rk0| |rk1| (QREFELT $ 42))
                           (SEQ
                            (SPADCALL "Dimensions of kernels differ"
                                      (QREFELT $ 55))
                            (LETT |foundResult| 'T)
                            (EXIT (LETT |result| NIL))))
                          ((SPADCALL |rk0| (- |n| 1) (QREFELT $ 51))
                           (COND
                            (|randomelements|
                             (SEQ
                              (SPADCALL
                               "Random element in generated algebra does"
                               (QREFELT $ 55))
                              (EXIT
                               (SPADCALL "  not have a one-dimensional kernel"
                                         (QREFELT $ 55)))))
                            ('T
                             (SEQ
                              (SPADCALL
                               "Fingerprint element in generated algebra does"
                               (QREFELT $ 55))
                              (EXIT
                               (SPADCALL "  not have a one-dimensional kernel"
                                         (QREFELT $ 55)))))))
                          ('T
                           (SEQ
                            (COND
                             (|randomelements|
                              (SEQ
                               (SPADCALL
                                "Random element in generated algebra has"
                                (QREFELT $ 55))
                               (EXIT
                                (SPADCALL "  one-dimensional kernel"
                                          (QREFELT $ 55)))))
                             ('T
                              (SEQ
                               (SPADCALL
                                "Fingerprint element in generated algebra has"
                                (QREFELT $ 55))
                               (EXIT
                                (SPADCALL "  one-dimensional kernel"
                                          (QREFELT $ 55))))))
                            (LETT |kernel0| (SPADCALL |x0| (QREFELT $ 58)))
                            (LETT |kernel1| (SPADCALL |x1| (QREFELT $ 58)))
                            (LETT |baseChange0|
                                  (SPADCALL |aG0|
                                            (SPADCALL |kernel0| 1
                                                      (QREFELT $ 66))
                                            (QREFELT $ 50)))
                            (LETT |baseChange1|
                                  (SPADCALL |aG1|
                                            (SPADCALL |kernel1| 1
                                                      (QREFELT $ 66))
                                            (QREFELT $ 50)))
                            (EXIT
                             (COND
                              ((SPADCALL (ANCOLS |baseChange0|)
                                         (ANCOLS |baseChange1|) (QREFELT $ 42))
                               (SEQ
                                (SPADCALL
                                 "  Dimensions of generated cyclic submodules differ"
                                 (QREFELT $ 55))
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
                                                           (QREFELT $ 57)))
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
                                            (SPADCALL |aG0| |j| (QREFELT $ 32))
                                            |transitionM| (QREFELT $ 17))
                                           (SPADCALL |transitionM|
                                                     (SPADCALL |aG1| |j|
                                                               (QREFELT $ 32))
                                                     (QREFELT $ 17))
                                           (QREFELT $ 67))
                                          (SEQ (LETT |result| NIL)
                                               (LETT |transitionM|
                                                     (SPADCALL 1 1
                                                               (QREFELT $ 23)))
                                               (SPADCALL
                                                "  There is no isomorphism, as the only possible one"
                                                (QREFELT $ 55))
                                               (EXIT
                                                (SPADCALL
                                                 "    fails to do the necessary base change"
                                                 (QREFELT $ 55))))))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL)))))
                              ('T
                               (SEQ
                                (SPADCALL
                                 "  Generated cyclic submodules have equal, but not full"
                                 (QREFELT $ 55))
                                (EXIT
                                 (SPADCALL
                                  "    dimension, hence we can not draw any conclusion"
                                  (QREFELT $ 55))))))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# |foundResult|)))
                   (GO G190) G191 (EXIT NIL))
              (COND
               (|foundResult|
                (COND
                 (|result|
                  (SEQ (SPADCALL " " (QREFELT $ 55))
                       (EXIT
                        (SPADCALL "Representations are equivalent."
                                  (QREFELT $ 55)))))
                 (#10='T
                  (SEQ (SPADCALL " " (QREFELT $ 55))
                       (EXIT
                        (SPADCALL "Representations are not equivalent."
                                  (QREFELT $ 55)))))))
               (#10#
                (SEQ (SPADCALL " " (QREFELT $ 55))
                     (SPADCALL
                      "Can neither prove equivalence nor inequivalence."
                      (QREFELT $ 55))
                     (EXIT (SPADCALL "  Try again." (QREFELT $ 55))))))
              (EXIT |transitionM|)))) 

(SDEFUN |REP2;isAbsolutelyIrreducible?;LB;12|
        ((|aG| |List| (|Matrix| R)) ($ |Boolean|))
        (SPADCALL |aG| 25 (QREFELT $ 68))) 

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
              (LETT |x| (SPADCALL |aG| |randomIndex| (QREFELT $ 32)))
              (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 46))))
              (LETT |foundResult| NIL)
              (SEQ (LETT #3# NIL) (LETT |i| 1) (LETT #2# |numberOfTries|) G190
                   (COND ((OR (|greater_SI| |i| #2#) #3#) (GO G191)))
                   (SEQ
                    (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL |aG| |randomIndex|
                                              (QREFELT $ 32))
                                    (QREFELT $ 17)))
                    (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL |aG| |randomIndex|
                                              (QREFELT $ 32))
                                    (QREFELT $ 16)))
                    (LETT |rk| (SPADCALL |x| (QREFELT $ 41)))
                    (EXIT
                     (COND
                      ((EQL |rk| (- |n| 1))
                       (SEQ (LETT |foundResult| 'T)
                            (SPADCALL "Random element in generated algebra has"
                                      (QREFELT $ 55))
                            (SPADCALL "  one-dimensional kernel"
                                      (QREFELT $ 55))
                            (LETT |kernel| (SPADCALL |x| (QREFELT $ 58)))
                            (EXIT
                             (COND
                              ((EQL |n|
                                    (QVSIZE
                                     (SPADCALL |aG| (|SPADfirst| |kernel|)
                                               (QREFELT $ 48))))
                               (LETT |result|
                                     (NULL
                                      (NULL
                                       (SPADCALL
                                        (|REP2;irreducibilityTestInternal| |aG|
                                         |x| NIL $)
                                        1 (QREFELT $ 61))))))
                              ('T (LETT |result| NIL))))))
                      ('T
                       (SEQ
                        (SPADCALL "Random element in generated algebra does"
                                  (QREFELT $ 55))
                        (EXIT
                         (SPADCALL "  not have a one-dimensional kernel"
                                   (QREFELT $ 55))))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# |foundResult|)))
                   (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |foundResult|)
                (SEQ
                 (SPADCALL "We have not found a one-dimensional kernel so far,"
                           (QREFELT $ 55))
                 (EXIT
                  (SPADCALL "  as we do a random search you could try again"
                            (QREFELT $ 55))))))
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
                    (SPADCALL (SPADCALL |submodule| (QREFELT $ 30))
                              (QREFELT $ 49)))
              (SPADCALL "  Transition matrix computed" (QREFELT $ 55))
              (LETT |inverseTransitionMatrix|
                    (PROG2
                        (LETT #2# (SPADCALL |transitionMatrix| (QREFELT $ 57)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|Matrix| (QREFELT $ 6))
                                      (|Union| (|Matrix| (QREFELT $ 6))
                                               "failed")
                                      #2#)))
              (SPADCALL "  The inverse of the transition matrix computed"
                        (QREFELT $ 55))
              (SPADCALL "  Now transform the matrices" (QREFELT $ 55))
              (SEQ (LETT |i| 1)
                   (LETT #1# (SPADCALL |algebraGenerators| (QREFELT $ 38)))
                   G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |helpMatrix|
                          (SPADCALL |inverseTransitionMatrix|
                                    (SPADCALL |algebraGenerators| |i|
                                              (QREFELT $ 32))
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
                               (QREFELT $ 71))))))) 

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
                 (QREFELT $ 74)))
          (LETT |v| |zz|)
          (SEQ G190
               (COND ((NULL (SPADCALL |v| |zz| (QREFELT $ 75))) (GO G191)))
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
                                      (CONS (SPADCALL (QREFELT $ 76)) #7#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #7#))))
                        (QREFELT $ 77)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |depl| (LIST |v|))
          (SEQ (LETT |i| 1) (LETT #5# |n|) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |v| (SPADCALL |m| |v| (QREFELT $ 39)))
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
                         (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 78)) #4#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 14)))
          (LETT |depe|
                (SPADCALL (SPADCALL |depm| (QREFELT $ 49)) (QREFELT $ 37)))
          (LETT |j| 1)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |j| |n| (QREFELT $ 79))
                    (SPADCALL (QAREF2O |depe| |j| |j| 1 1)
                              (|spadConstant| $ 12) (QREFELT $ 80)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL (GO G190) G191 (EXIT NIL))
          (LETT |res| (|spadConstant| $ 82))
          (LETT |x| (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 83)))
          (LETT |xi| (|spadConstant| $ 81))
          (SEQ (LETT |i| 1) (LETT #1# (- |j| 1)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |depe| |i| |j| (QREFELT $ 9)) |xi|
                                 (QREFELT $ 84))
                                (QREFELT $ 85)))
                (EXIT (LETT |xi| (SPADCALL |x| |xi| (QREFELT $ 86)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |xi| |res| (QREFELT $ 87)))))) 

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
                 (QREFELT $ 88)))
          (LETT |old_deg| (SPADCALL |p| (QREFELT $ 89)))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 82) (QREFELT $ 90)))
                 (GO G191)))
               (SEQ (LETT |c0| (SPADCALL |p| (QREFELT $ 91)))
                    (LETT |res|
                          (SPADCALL |res| (SPADCALL |c0| |id| (QREFELT $ 92))
                                    (QREFELT $ 16)))
                    (LETT |p| (SPADCALL |p| (QREFELT $ 93)))
                    (LETT |ndeg| (SPADCALL |p| (QREFELT $ 89)))
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
                      (SPADCALL (SPADCALL |mp| (QREFELT $ 96))
                                (QREFELT $ 100)))
                (SEQ (LETT |fac| NIL) (LETT #2# |fl|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |fpol| (QVELT |fac| 1))
                          (LETT |mm| (SPADCALL |fpol| (QREFELT $ 89)))
                          (EXIT
                           (COND
                            ((SPADCALL |mm| |m| (QREFELT $ 101)) "iterate")
                            ('T
                             (SEQ (LETT |xx| (|REP2;m_eval| |fpol| |x| |n| $))
                                  (LETT |kernel|
                                        (SPADCALL |xx| (QREFELT $ 58)))
                                  (LETT |good| (EQL (LENGTH |kernel|) |mm|))
                                  (LETT |v| (|SPADfirst| |kernel|))
                                  (LETT |pres|
                                        (SPADCALL |algebraGenerators| |v|
                                                  (QREFELT $ 70)))
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
                                                (QREFELT $ 55))
                                      (EXIT
                                       (PROGN
                                        (LETT #1#
                                              (CONS 0
                                                    (|REP2;irreducibilityTestInternal|
                                                     |algebraGenerators| |xx|
                                                     'T $)))
                                        (GO #3#))))))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "All factors were bad" (QREFELT $ 55))
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
                      (PROG1 (LETT #4# (SPADCALL (QREFELT $ 102)))
                        (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                          '(|NonNegativeInteger|) #4#)))
                (COND
                 (|randomelements|
                  (SEQ (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)))
                       (EXIT
                        (LETT |x|
                              (SPADCALL |algebraGenerators| |randomIndex|
                                        (QREFELT $ 32)))))))
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
                                                       (QREFELT $ 32))
                                             (QREFELT $ 17)))
                             (LETT |randomIndex|
                                   (+ 1 (RANDOM |numberOfGenerators|)))
                             (EXIT
                              (LETT |x|
                                    (SPADCALL |x|
                                              (SPADCALL |algebraGenerators|
                                                        |randomIndex|
                                                        (QREFELT $ 32))
                                              (QREFELT $ 16))))))
                           ('T
                            (LETT |x|
                                  (|REP2;fingerPrint| |i|
                                   (SPADCALL |algebraGenerators| 1
                                             (QREFELT $ 32))
                                   (SPADCALL |algebraGenerators| 2
                                             (QREFELT $ 32))
                                   |x| $))))
                          (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 46))))
                          (COND
                           ((OR (SPADCALL |q| 2 (QREFELT $ 104))
                                (OR (SPADCALL |i| (QREFELT $ 105))
                                    (SPADCALL |i| 15 (QREFELT $ 106))))
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
                          (LETT |kernel| (SPADCALL |x| (QREFELT $ 58)))
                          (EXIT
                           (COND
                            ((NULL |kernel|)
                             (COND
                              (|randomelements|
                               (SPADCALL
                                "Random element in generated algebra is non-singular"
                                (QREFELT $ 55)))
                              ('T
                               (SPADCALL
                                "Fingerprint element in generated algebra is non-singular"
                                (QREFELT $ 55)))))
                            ('T
                             (SEQ
                              (COND
                               (|randomelements|
                                (SPADCALL
                                 "Random element in generated algebra is singular"
                                 (QREFELT $ 55)))
                               ('T
                                (SPADCALL
                                 "Fingerprint element in generated algebra is singular"
                                 (QREFELT $ 55))))
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
                                                               (QREFELT $ 107))
                                                     (QREFELT $ 70)))
                                     (EXIT
                                      (COND
                                       ((NULL (CDR |result|))
                                        (COND
                                         ((SPADCALL (+ |j| 1)
                                                    |numberOfOneDimSubspacesInKernel|
                                                    (QREFELT $ 101))
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
                (LETT |result| (LIST NIL NIL)) (SPADCALL " " (QREFELT $ 55))
                (SPADCALL "Sorry, no result, try meatAxe(...,true)"
                          (QREFELT $ 55))
                (SPADCALL "  or consider using an extension field."
                          (QREFELT $ 55))
                (EXIT |result|)))
          #5# (EXIT #1#)))) 

(SDEFUN |REP2;meatAxe;LL;20|
        ((|algebraGenerators| |List| (|Matrix| R))
         ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| NIL 25 7 (QREFELT $ 108))) 

(SDEFUN |REP2;meatAxe;LBL;21|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|randomElements?| |Boolean|) ($ |List| (|List| (|Matrix| R))))
        (COND
         (|randomElements?|
          (SPADCALL |algebraGenerators| 'T 25 7 (QREFELT $ 108)))
         ('T (SPADCALL |algebraGenerators| NIL 6 7 (QREFELT $ 108))))) 

(SDEFUN |REP2;meatAxe;LPiL;22|
        ((|algebraGenerators| |List| (|Matrix| R))
         (|numberOfTries| |PositiveInteger|) ($ |List| (|List| (|Matrix| R))))
        (SPADCALL |algebraGenerators| 'T |numberOfTries| 7 (QREFELT $ 108))) 

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
              (LETT |nn| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 66))))
              (LETT |q| (SPADCALL (QREFELT $ 102)))
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
                        (QREFELT $ 112))
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
              (SEQ (LETT |j| 1) (LETT #5# (SPADCALL |iR| (QREFELT $ 114))) G190
                   (COND ((|greater_SI| |j| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |coefficients| (+ (- |dim| (LENGTH |iR|)) |j|)
                               (SPADCALL
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (SPADCALL |iR| |j| (QREFELT $ 115))
                                           |q|))
                                  (|check_subtype2| (> #4# 0)
                                                    '(|PositiveInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 116))
                               (QREFELT $ 112))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (LETT |result| (MAKEARR1 |nn| (|spadConstant| $ 12)))
              (SEQ (LETT |i| 1) (LETT #2# (QVSIZE |coefficients|)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |newAdd|
                          (SPADCALL
                           (SPADCALL |coefficients| |i| (QREFELT $ 27))
                           (SPADCALL |basis| |i| (QREFELT $ 66))
                           (QREFELT $ 117)))
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |nn|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |result| |j|
                                      (SPADCALL
                                       (SPADCALL |result| |j| (QREFELT $ 27))
                                       (SPADCALL |newAdd| |j| (QREFELT $ 27))
                                       (QREFELT $ 11))
                                      (QREFELT $ 112))))
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
          (LETT $ (GETREFV 118))
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
             (QSETREFV $ 48
                       (CONS (|dispatchFunction| |REP2;cyclicSubmodule;LVV;5|)
                             $))
             (QSETREFV $ 50
                       (CONS
                        (|dispatchFunction|
                         |REP2;standardBasisOfCyclicSubmodule;LVM;6|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 64
                       (CONS (|dispatchFunction| |REP2;areEquivalent?;2LM;9|)
                             $))
             (QSETREFV $ 65
                       (CONS (|dispatchFunction| |REP2;areEquivalent?;2LIM;10|)
                             $))
             (QSETREFV $ 63
                       (CONS
                        (|dispatchFunction| |REP2;areEquivalent?;2LBIM;11|) $))
             (QSETREFV $ 69
                       (CONS
                        (|dispatchFunction|
                         |REP2;isAbsolutelyIrreducible?;LB;12|)
                        $))
             (QSETREFV $ 68
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
                (QSETREFV $ 108
                          (CONS (|dispatchFunction| |REP2;meatAxe;LB2IL;19|)
                                $))
                (QSETREFV $ 109
                          (CONS (|dispatchFunction| |REP2;meatAxe;LL;20|) $))
                (QSETREFV $ 110
                          (CONS (|dispatchFunction| |REP2;meatAxe;LBL;21|) $))
                (QSETREFV $ 111
                          (CONS (|dispatchFunction| |REP2;meatAxe;LPiL;22|) $))
                (QSETREFV $ 107
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
              (138 . ~=) (|List| 19) (144 . |append|) (150 . |maxRowIndex|)
              (155 . |row|) (161 . |vector|) (166 . |cyclicSubmodule|)
              (172 . |transpose|) (177 . |standardBasisOfCyclicSubmodule|)
              (183 . ~=) (|Void|) (|String|) (|OutputForm|)
              (189 . |messagePrint|) (|Union| $ '"failed") (194 . |inverse|)
              (199 . |nullSpace|) (|List| 31) (204 . |maxIndex|) (209 . |elt|)
              (215 . |setelt!|) (222 . |areEquivalent?|)
              (230 . |areEquivalent?|) (236 . |areEquivalent?|) (243 . |elt|)
              (249 . ~=) (255 . |isAbsolutelyIrreducible?|)
              (261 . |isAbsolutelyIrreducible?|) (266 . |split|) (272 . |list|)
              (277 . |split|) '|Smp| (283 . |zero|) (288 . =) (294 . |random|)
              (298 . |vector|) (303 . |parts|) (308 . <=) (314 . ~=)
              (320 . |One|) (324 . |Zero|) (328 . |monomial|) (334 . *)
              (340 . -) (346 . *) (352 . +) (358 . |diagonalMatrix|)
              (363 . |degree|) (368 . ~=) (374 . |leadingCoefficient|)
              (379 . *) (385 . |reductum|) (|Factored| 73)
              (|DistinctDegreeFactorize| 6 73) (390 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 97) (|:| |factor| 73) (|:| |exponent| 22))
              (|List| 98) (395 . |factorList|) (400 . >) (406 . |size|)
              (|PositiveInteger|) (410 . >) (416 . |even?|) (421 . >)
              (427 . |scanOneDimSubspaces|) (433 . |meatAxe|) (441 . |meatAxe|)
              (446 . |meatAxe|) (452 . |meatAxe|) (458 . |setelt!|) (|List| 7)
              (465 . |maxIndex|) (470 . |elt|) (476 . |index|) (481 . *))
           '#(|standardBasisOfCyclicSubmodule| 487 |split| 493
              |scanOneDimSubspaces| 505 |meatAxe| 511
              |isAbsolutelyIrreducible?| 536 |cyclicSubmodule| 547
              |createRandomElement| 553 |completeEchelonBasis| 559
              |areEquivalent?| 564)
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
                        (|makeByteWordVec2| 117
                                            '(3 8 6 0 7 7 9 2 6 0 0 0 10 2 6 0
                                              0 0 11 0 6 0 12 1 8 0 13 14 0 6 0
                                              15 2 8 0 0 0 16 2 8 0 0 0 17 2 8
                                              0 0 0 18 2 20 19 0 7 21 2 8 0 22
                                              22 23 3 8 0 0 7 19 24 2 22 25 0 0
                                              26 2 19 6 0 7 27 2 6 25 0 0 28 4
                                              8 6 0 7 7 6 29 2 31 8 0 7 32 1 19
                                              34 0 35 1 13 0 34 36 1 8 0 0 37 1
                                              31 7 0 38 2 8 19 0 19 39 2 8 0 0
                                              0 40 1 8 22 0 41 2 22 25 0 0 42 2
                                              43 0 0 0 44 1 8 7 0 45 2 8 19 0 7
                                              46 1 20 0 43 47 2 0 20 31 19 48 1
                                              8 0 0 49 2 0 8 31 19 50 2 7 25 0
                                              0 51 1 54 52 53 55 1 8 56 0 57 1
                                              8 43 0 58 1 59 7 0 60 2 59 31 0 7
                                              61 3 31 8 0 7 8 62 4 0 8 31 31 25
                                              7 63 2 0 8 31 31 64 3 0 8 31 31 7
                                              65 2 43 19 0 7 66 2 8 25 0 0 67 2
                                              0 25 31 7 68 1 0 25 31 69 2 0 59
                                              31 19 70 1 59 0 31 71 2 0 59 31
                                              20 72 1 19 0 22 74 2 19 25 0 0 75
                                              0 6 0 76 1 19 0 34 77 1 19 34 0
                                              78 2 7 25 0 0 79 2 6 25 0 0 80 0
                                              73 0 81 0 73 0 82 2 73 0 6 22 83
                                              2 73 0 6 0 84 2 73 0 0 0 85 2 73
                                              0 0 0 86 2 73 0 0 0 87 1 8 0 19
                                              88 1 73 22 0 89 2 73 25 0 0 90 1
                                              73 6 0 91 2 8 0 6 0 92 1 73 0 0
                                              93 1 95 94 73 96 1 94 99 0 100 2
                                              7 25 0 0 101 0 6 22 102 2 103 25
                                              0 0 104 1 7 25 0 105 2 22 25 0 0
                                              106 2 0 19 43 7 107 4 0 59 31 25
                                              7 7 108 1 0 59 31 109 2 0 59 31
                                              25 110 2 0 59 31 103 111 3 19 6 0
                                              7 6 112 1 113 7 0 114 2 113 7 0 7
                                              115 1 6 0 103 116 2 19 0 6 0 117
                                              2 3 8 31 19 50 2 1 59 31 19 70 2
                                              1 59 31 20 72 2 2 19 43 7 107 4 2
                                              59 31 25 7 7 108 2 2 59 31 25 110
                                              1 2 59 31 109 2 2 59 31 103 111 2
                                              1 25 31 7 68 1 1 25 31 69 2 3 20
                                              31 19 48 2 0 8 31 8 33 1 0 8 20
                                              30 2 1 8 31 31 64 4 1 8 31 31 25
                                              7 63 3 1 8 31 31 7 65)))))
           '|lookupComplete|)) 
